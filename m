Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C28C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWaP8T8LNQZ3oLSL9ltW/te9G7B8TmnAjDxKMwhtkVs=; b=XPzedURXEAvEpSpk5NnO0uW9FX
	1UDOhHsJPQ1YGT6zOPucLE67HAjPdQf9Q61VUBt8XZEXnCrtleTfGxQUhpEEFGjlbXAWHJnnZxbUS
	+AXTg3KUVl/KnptIh2QG48mStcwKrZh3bTs15utGG48Tspgjvp+heQgRYieXERRSJYu0vAAe6rXCV
	czmXcnZy8X8OO49pOIU/5VtKV3tHtYl1aYJHJ10R4MGGdHpcWzovwnd0u/FLTiIJCUIbarLVatcV8
	Gwj76AYhOLSoOjq88M1D/TheWDYB0+pYN1msaMhzVbkZABjf0XAXqNlKUy++en7gggOVzZLEFFNHT
	/Dc6U2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nKu-0000000Bm8v-2LQQ;
	Thu, 24 Sep 2026 17:34:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nKr-0000000Bm7t-1e2V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:34:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB2741E5E;
	Thu, 24 Sep 2026 10:34:12 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11BDE3F86F;
	Thu, 24 Sep 2026 10:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790271256; bh=53Q5rj/7x+pKv27XfPvPIecPjq6QeuKQwbgS+7MBKw0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J6v1g7ZksczunscKjuZNMJU2izJgyhiTRoDKt1PNFXdwdd1F5zPsDhsnXzAOCxgAZ
	 L8Y+74TmzGGMToqz9MioidUn6mf39WMzSdTeZDFXXU4J/tZR6k7WIReyJ1p+TWHh4o
	 lFO7lKLJ5iLZ0kXLNvxNhIwQwJb1Sy37oeAdNr0I=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Thu, 24 Sep 2026 18:33:39 +0100
Subject: [PATCH v12 01/14] coresight: etm4x: read-back TRCSEQSTR at
 disabling and prohibit modifying seq_state while enabling.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-separate_etm_cfg_v2-v12-1-a2b41d2f7c2b@arm.com>
References: <20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com>
In-Reply-To: <20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com>
To: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=53Q5rj/7x+pKv27XfPvPIecPjq6QeuKQwbgS+7MBKw0=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqtV8L2TzE38V3muYAysfVSoimlW95GWmvvUhPA
 jy2pl3LNLqJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarVfCwAKCRBt1cPRWsUx
 M9CwC/91iDVFdb41gcvWs14pPQ2nxw1scsI/e/7l3QCUOA8VSEtsrnfuboDUqT7t3/yTnehA/py
 0MBfFIeRMnYMzPfEkq3YKKF6V53CGuIIqG1D7OYvwwu48RbsItOI6fl+1pS/YlmNjWVLZTpJFsP
 KNgZltaLulip3XWdkBV7uMFW+57ljVlOjuFlIcYbHbmAcPfFyu9QHHISxiiPPpdxYy5B3db+L6w
 pTPU2BXFVbu78HQdup6KnsS9Cqf8qllB3+Wn4Q1I8z5H5wqP6Miqm1iJe5gWVJKC/BXW7lo+mMx
 vjKvYfi6VBAxwQkozgcmemjvEUhfi8GbECTiu1Bh1wcedLAoAo4fcQDHk7LDlvQxuja8c/9TDN5
 ul11CxCho0HMOKc1JWuIgo0IgLkHsloqM1du/zCcfEkc/Y59aFh4Cwa9XMT5DVy5NePuw+BS0Ba
 KVA7u+Mn7rBmHAymuw05tWSqQBeD+4xmveW/E+fpODle25CCicgvc8peRr1L2SzMsug/I=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_103417_678398_EF17A4F0 
X-CRM114-Status: GOOD (  13.63  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

TRCSEQSTR can be changed by the ETM while a session is active. Its value
therefore needs to be preserved when a sysfs session is disabled so that
users can read the current sequence state after the session ends.

This means that any changes made to TRCSEQSTR while the sysfs-session is active
would be lost when the session is disabled.

Copy the TRCSEQSTR value when disabling a sysfs session, and prohibit
modifying seq_state while the session is active.

Suggested-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c  | 4 ++++
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2247ad55d444..9ca03a5913a3 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1073,6 +1073,10 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
 			etm4x_relaxed_read32(csa, TRCCNTVRn(i));
 	}
 
+	/* read back the sequence state */
+	if (drvdata->nrseqstate)
+		config->seq_state = etm4x_relaxed_read32(csa, TRCSEQSTR);
+
 	coresight_disclaim_device_unlocked(csdev);
 	etm4_cs_lock(drvdata, csa);
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index cc6cdd3ae29d..db3cf4ad6806 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -1437,6 +1437,8 @@ static ssize_t seq_state_store(struct device *dev,
 		return -EINVAL;
 	if (val >= drvdata->nrseqstate)
 		return -EINVAL;
+	if (IS_ERR_OR_NULL(drvdata) || coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
 
 	config->seq_state = val;
 	return size;

-- 
2.43.0


