Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E4CCA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 02:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tETi1ewkP1nsl0TU+BcNwxch2wa0RjFhd5mAVRl8Ac=; b=dm1blr9yUoQ9pYI/l6O/xiaZH2
	QkPrXt8hBJY8jK0cILc/IVyg4fuGmkiR+s9BbWzh4SZLPvWF0oFZT+6DW5Dm71jKnIdDcj5tnu7ET
	LISjMpBYdWdmH8KrAm3qgdcEv7i/IHU8Q0NchGYpvfu20LZ/4oYnvkrX0mJXK8/JpEyGvvoZuflei
	M1KDSvjc+U/Kip9PUdJjJk3fFTKx2Jqrxs94AwqSPb5c5QwliZFOyRhOYeG3Q3mBWQIytc7JOTx1Z
	KG7dITDLQimXLbwkrEhHMUd8NqXxKDkeomzMsYMrsRuG13vnmLlV8neOEyX5URcsBTPjPzi7ptcqm
	+Fdc8HqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCprd-0000000Cx9h-3WfW;
	Sat, 03 Oct 2026 02:52:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCpra-0000000Cx7y-1abL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 02:52:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B1FF143D;
	Fri,  2 Oct 2026 19:52:32 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF4DD3F763;
	Fri,  2 Oct 2026 19:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790995955; bh=WO4vKOfpybslW+mujSt9j/FEVI3+0mIWmOAlXRBt0Ac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RG+y1pdVqc7PQDne7qCJpeYYtUNWxASYA8HAjKMBUoHuk5fPOPm/ofEvuW8NKvryg
	 ulUMY5SY6BWKaSy1OyD60lOnAHoiRrvITaYGd1u9A1TGouNynnRTFMirICH40UfPTp
	 BnBhLsXlYgNF1KIHhltxlrmurxeVNoFF5j9kMVxI=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Sat, 03 Oct 2026 03:52:13 +0100
Subject: [PATCH RESEND v13 01/14] coresight: etm4x: read-back TRCSEQSTR at
 disabling and prohibit modifying seq_state while enabling.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-separate_etm_cfg_v2-v13-1-5d8a29aead95@arm.com>
References: <20261003-separate_etm_cfg_v2-v13-0-5d8a29aead95@arm.com>
In-Reply-To: <20261003-separate_etm_cfg_v2-v13-0-5d8a29aead95@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=WO4vKOfpybslW+mujSt9j/FEVI3+0mIWmOAlXRBt0Ac=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqwG3iZDNL58P3wIlFq/CqJWrPwWoNO6dWpVp9c
 L8YNxAHKM+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCasBt4gAKCRBt1cPRWsUx
 M2B2DAC/sv/EIkVznFyRrP09kdjmNyCfC7GiXiRe3Wzj2HkDqO0FU/B5cIhfOLCVcs86YjEaQyP
 UgBPz4b39i1QcZZskvgSbryCVHF7hrv4mNS7bV7gsd6knyjo/90ohXfAwb79d96PgKlcL5DKvcL
 q5Z5c58Qp4RP8AduDXFH9/tk3xGBYdSFy7Qhdtlp3cwMK/zWjc44kTePA54RnC3IDsI8kHaXhZH
 CY5fDkDTbzEBieOcwU96Mg5dltHXRutxEFQO02ORb5qOc9ArAICEbUJ4p6gPyRpciLQfWyblyWe
 cA5D3Nwri4jlgCKFfdvbq0472BlJV+Gfy7ZefB6gUVGRyeA7MvgpT90nvPmzE4rlS3j2fNLU5pA
 u7JIulgfZ2ZhGy0rjhLPtng6SCHikEE+nWL591yoVnlKzv9mdWiFg/Cf2l86a7i36kaCRpnp43w
 m0mAp9LuBhnzkzAkbCT8dKP0BUTXfKT+J9+J/zqMP3R+Buw5iRtCiHF+RzSKvntukbqvY=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_195238_513901_B3225E21 
X-CRM114-Status: GOOD (  13.27  )
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
Reviewed-by: Mike Leach <mike.leach@arm.com>
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
index cc6cdd3ae29d..4945d577ceab 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -1435,6 +1435,8 @@ static ssize_t seq_state_store(struct device *dev,
 
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
+	if (IS_ERR_OR_NULL(drvdata->csdev) || coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
 	if (val >= drvdata->nrseqstate)
 		return -EINVAL;
 

-- 
2.43.0


