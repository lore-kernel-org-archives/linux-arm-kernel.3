Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E46E73153
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ejy/WUaMrLNHNvcPMOtOasZs5RqyzurlCKAqnIGwnfA=; b=rHZejWitP9FOuTd5O/7wGtow6c
	gcI9R4fd9HLtH5yiBuHknDGBwv6rEiEw6cxFZ+RamMTpFrU7ntgTyPuUwmclNX+acps61qqNosHf9
	J5Op4xUMAXDXLUe6mk+NmMBMX4TWZd7bOIBE53p+ac3+2MKne6d4xpnAuQj6f2VBQJG4MMGVmWx0h
	EOGUzPcKW77zfLMorgBoOUo0/Vs0n0lY6uUyv+MouWSEGO+zIyuMqL/WM/leKJDQoJ5KQgirh1tCW
	b2b432D4nV8f/iQMRKX8nruUdqB+8y2HXtwau8Oyi8+inSF8Ykkj9JEPTywg8MYKeJBoeWH7MYm8e
	CgpBHWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqKN-00000004iJG-3ZpD;
	Mon, 02 Feb 2026 09:34:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqKL-00000004iGk-1rDl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 09:34:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ADB4339;
	Mon,  2 Feb 2026 01:34:30 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BCD63F740;
	Mon,  2 Feb 2026 01:34:34 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 02 Feb 2026 09:34:02 +0000
Subject: [PATCH v3 6/8] coresight: Move sink validation into
 etm_perf_add_symlink_sink()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-arm_coresight_refactor_dev_register-v3-6-03292470c48c@arm.com>
References: <20260202-arm_coresight_refactor_dev_register-v3-0-03292470c48c@arm.com>
In-Reply-To: <20260202-arm_coresight_refactor_dev_register-v3-0-03292470c48c@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770024862; l=2473;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=9LMr8X12K0WBFyxtO4lVSMJ2Rd95g5V8OOdwtdMKuh8=;
 b=DX9Hy0VjFor3cCiIBwG9oHxBwWn+mU0vLGeNw/H5svpl65fGRpCPHwq/yp1td0hA9F53gJA1F
 rcmoxFrKGcUDwjDv5TrcjNdH+OUgR6zqzliU6MWKR5SP7v5MjkySldn
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_013437_603503_68F266E8 
X-CRM114-Status: GOOD (  12.50  )
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

Move the sink device type checks into etm_perf_add_symlink_sink(), and
return -EOPNOTSUPP for unsupported devices.  This simplifies the
registration flow to invoke etm_perf_add_symlink_sink() unconditionally.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     | 23 +++++++++--------------
 drivers/hwtracing/coresight/coresight-etm-perf.c |  5 ++++-
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index b3119832725c08a8375a3a55a11b3bda14b8a3e0..c694b4bea3d724464e97a4932ead584d59d8a69a 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1383,21 +1383,16 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 		goto out_unlock;
 	}
 
-	if ((csdev->type == CORESIGHT_DEV_TYPE_SINK ||
-	     csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) &&
-	    sink_ops(csdev)->alloc_buffer) {
-		ret = etm_perf_add_symlink_sink(csdev);
+	ret = etm_perf_add_symlink_sink(csdev);
 
-		if (ret) {
-			device_unregister(&csdev->dev);
-			/*
-			 * As with the above, all resources are free'd
-			 * explicitly via coresight_device_release() triggered
-			 * from put_device(), which is in turn called from
-			 * function device_unregister().
-			 */
-			goto out_unlock;
-		}
+	/*
+	 * As with the above, all resources are free'd explicitly via
+	 * coresight_device_release() triggered from put_device(), which is in
+	 * turn called from function device_unregister().
+	 */
+	if (ret && ret != -EOPNOTSUPP) {
+		device_unregister(&csdev->dev);
+		goto out_unlock;
 	}
 	/* Device is now registered */
 	registered = true;
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 3c8a6f795094bc1da9d8b1d0fda8d58640c87489..3b2a62521396dda819011d336982e960a5bd3d0e 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -902,7 +902,10 @@ int etm_perf_add_symlink_sink(struct coresight_device *csdev)
 
 	if (csdev->type != CORESIGHT_DEV_TYPE_SINK &&
 	    csdev->type != CORESIGHT_DEV_TYPE_LINKSINK)
-		return -EINVAL;
+		return -EOPNOTSUPP;
+
+	if (!sink_ops(csdev)->alloc_buffer)
+		return -EOPNOTSUPP;
 
 	if (csdev->ea != NULL)
 		return -EINVAL;

-- 
2.34.1


