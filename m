Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD1BCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5O9NOOIRg9ihDISWJA81HihHNzd4NXynj50CaFEDOY=; b=iu9hqASRlIZleq1YBDgq3SZQaU
	qwZMZt57VZ0PidLWUteIhgHAP7GMibg+vQVxKpAISArUF8MbicI7OeDgKMa5/REiKGnubhlck8JG8
	ilaOEM7X4dLqlky57yRXv+NAPzgEwQ6+WvaMk5J3In+G6A+sPK+zsRUkA6eLY2cD+N/e/Nm0IyANB
	PP89WeivgwPZGfxC8UUdIDhQK6umU5ILXvzckqq0QdeIq//rReUjGQUw8fXPeg1b2BkUvrw/8FVaI
	tOJnBcPh7aRnGABk7bWnvKRXse37R+H5uyDPfnsFmFbIHGU3a9pivm2Sxu4U9pm5qqMN2dmb62lno
	A/xnMHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiXq-0000000CLko-3ScJ;
	Fri, 02 Oct 2026 19:03:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiXn-0000000CLiF-14kd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:03:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CEC51476;
	Fri,  2 Oct 2026 12:03:38 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAEA53F85F;
	Fri,  2 Oct 2026 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790967821; bh=lUkkjNY5LuFYIcy7QLXpL/HHIJYKEfoWLTcWyHVQCf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VZrxtFkxP38G5PPCU9+kOzeGZSNQ+bbSpVhkV4F6ByU6jowL/qDXv8PMLU2KxfE90
	 /SQddm2+dAGz2duWdr42ci+0AkyeT9x/je/ubvSd9mitO4jYaYLyCJqh8UCBDbfF3N
	 9cZ+Lnin6kdtuewmyqfi+z07F0+bXQ+7Jb0hHwN8=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 02 Oct 2026 20:03:23 +0100
Subject: [PATCH v13 02/14] coresight: etm4x: prohibit modifying cntr_val
 while session is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-separate_etm_cfg_v2-v13-2-fe429d8d96fb@arm.com>
References: <20261002-separate_etm_cfg_v2-v13-0-fe429d8d96fb@arm.com>
In-Reply-To: <20261002-separate_etm_cfg_v2-v13-0-fe429d8d96fb@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=lUkkjNY5LuFYIcy7QLXpL/HHIJYKEfoWLTcWyHVQCf8=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqwAAA7VK0qxZnNFVcoVfJZJEwUi6cwgefYNYFp
 wZG6SPdCueJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCasAAAAAKCRBt1cPRWsUx
 MzyJC/9WE3sldT7Mxsc/DNGRhx+Sox610ZKxurzxm2MPk+mX8SiVbVZNiSQoBnyV2KE0WAr/CNx
 YkAY3peYkN6WgIXZVGpj7K/c4ctpwWUGW2vxYvMHqC7fQifuA+4/gbpQV4t/EDSB6lVbaDfRQQd
 /k2re3q0A4+4xxQSFGMx95APuEnv1DiL4bcMtO4Mo9yqq9LNc7WsqHwiXXEJUKRtX+rKeSHvtbz
 LwOiGEBVDP3SIkutwyrpGDoR1Xs1JYCE4wJFGkelSEy9q63Xys9Mn972ZKyG/yPQ2ZHeVHZ8mYg
 v+9XjatDFzYNnq9hvHgDbEeItlF5jaevD3o4HW4RotbOMsW60w+I8U7AibvWwOiNkA9s6vtp30X
 69NorcFl3Ef8ANpQxC3Me0UOUsHLdd00XsLF7HtSFcCB0wNfdecX64+AYR0CnVD14F1TwR21cmT
 QMGSfELabk6XP2wP/4zXEHIpbZsyflv82bddYObe5A2ylfz3KoYzZQuAOYueZfdVc7uhw=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_120343_659401_C2AE93A1 
X-CRM114-Status: GOOD (  11.86  )
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

cntr_val is overwritten with the values read from the corresponding
registers by etm4_disable_hw() when the session is disabled.

This means that any changes to these values made while the session is
enabled would be lost when the session is disabled.

Therefore, prohibit modifying cntr_val while the session is enabled.

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index 2c72ea831fe6..bf4e81bc1e8b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -1615,6 +1615,9 @@ static ssize_t cntr_val_store(struct device *dev,
 		return -EINVAL;
 	if (val > ETM_CNTR_MAX_VAL)
 		return -EINVAL;
+	if (IS_ERR_OR_NULL(drvdata->csdev) ||
+	    coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
 
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->cntr_idx;

-- 
2.43.0


