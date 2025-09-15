Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8F4CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qE09l46QO82A+KeiRmszR2xkL7O2jEodX1WT9ZM36ao=; b=zcUyCGLTQwnh44UpwlEY0kCq/Q
	quqarppt5w5efxmT6RBYKXkGPNh+cIvGxso+ikrQQ1ytxxDa6pjBHkgfap0P0a7bKiZmcDVn5G4Na
	BLHkf5b55UtCZglKl5PMTf8uZKhGoyW7V5JimoK7biTPXRhFiS07AF6qTSRHCG04v9B0KUHheAnVR
	afstYYgtC/4ACkTquqiByEhtm6arGH+Av7FSdnK6wUWfp0O3jW+mCmdCCAaP2AuPOTJxUIvwJEu7G
	re+e2Um2EDvMEOW4MuosHcfBdEZZ0fAlGzWEGJFssEBka0yCX+GOIx2EU3geeimoE2fyvYirmAZ+m
	frOlvk6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xm-00000003gTP-1q0b;
	Mon, 15 Sep 2025 10:34:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XI-00000003foG-3iU8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D7841424;
	Mon, 15 Sep 2025 03:34:08 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C45773F66E;
	Mon, 15 Sep 2025 03:34:14 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:41 +0100
Subject: [PATCH v3 18/31] coresight: cti: Fix race condition by using
 device mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-18-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=3033;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=uRYlDP6dnhuGc72f+O0qQkOV4DdiUexNSfcr6jhbU9E=;
 b=+wS5sJrHGWroYUcXb7R/nFqMz6SQtheEQhU9a8YIBXAAU+mprM6oucLQctL5IrLC8sGHtKpnG
 4STwem6K7spAhnMEmek1VHNUcp1tn06TpKQEoS78st2jSsqk5j1x4j5
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_033417_070977_AA237557 
X-CRM114-Status: GOOD (  17.28  )
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

A CTI device can be enabled as a helper in a CoreSight path or directly
via the SysFS knob. Currently, the driver lacks protection when multiple
flows contend for access to the same CTI device.

Use the device mode to mark the CTI as in use, and reset it to the
DISABLED state when the device is no longer needed. Any conflict will
cause the attempt to acquire the mode to fail, ensuring the device can
only be enabled exclusively.

Fixes: 1b5b1646e63d ("coresight: Fix CTI module refcount leak by making it a helper device")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 2c8bf5dbe8b8206c92ae5ea64a26c947ef5b9582..ba4635dfc2e30b4e9ae4972f91bdc6647975b719 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -87,20 +87,31 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 }
 
 /* write regs to hardware and enable */
-static int cti_enable_hw(struct cti_drvdata *drvdata)
+static int cti_enable_hw(struct cti_drvdata *drvdata, enum cs_mode mode)
 {
 	struct cti_config *config = &drvdata->config;
+	struct coresight_device	*csdev = drvdata->csdev;
 	unsigned long flags;
 	int rc = 0;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
+	if (!drvdata->config.enable_req_count) {
+		coresight_set_mode(csdev, mode);
+	} else {
+		/* The device has been configured with an incompatible mode */
+		if (coresight_get_mode(csdev) != mode) {
+			rc = -EBUSY;
+			goto cti_err_not_enabled;
+		}
+	}
+
 	/* no need to do anything if enabled or unpowered*/
 	if (config->hw_enabled || !config->hw_powered)
 		goto cti_state_unchanged;
 
 	/* claim the device */
-	rc = coresight_claim_device(drvdata->csdev);
+	rc = coresight_claim_device(csdev);
 	if (rc)
 		goto cti_err_not_enabled;
 
@@ -116,6 +127,8 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
 
 	/* cannot enable due to error */
 cti_err_not_enabled:
+	if (!drvdata->config.enable_req_count)
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	return rc;
 }
@@ -165,6 +178,8 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 	if (--drvdata->config.enable_req_count > 0)
 		goto cti_not_disabled;
 
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
+
 	/* no need to do anything if disabled or cpu unpowered */
 	if (!config->hw_enabled || !config->hw_powered)
 		goto cti_not_disabled;
@@ -803,7 +818,7 @@ int cti_enable(struct coresight_device *csdev, enum cs_mode mode, void *data)
 {
 	struct cti_drvdata *drvdata = csdev_to_cti_drvdata(csdev);
 
-	return cti_enable_hw(drvdata);
+	return cti_enable_hw(drvdata, mode);
 }
 
 int cti_disable(struct coresight_device *csdev, void *data)

-- 
2.34.1


