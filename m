Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF74C79F88
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/HOE/EOJ4rOihR4fqi0QR/fwPq01YyK6O5FLkn4htw=; b=ydSp5yt29GuPJaeo1/3E3/YYeF
	C2xt1FGPKLy55BuyMEMTEaMv5dyQZl1egpZBasLbvrbG8eIyPwUxq1XrG+36N1HzfA97bntoJdqIE
	hQue67fOyr1qZsQMwKxz+NPbVg49EtniwZPRXNiHq15l+EWsCAxSLNBUTI36O/aRbakL/sTxsB7iH
	NzsPXveH1gXr/bee9r+UuqMv0XJiRFwGMUj6c9f6DX1NKEtaQg1nPqGw7HDrHQAcMpBEMPRT8B6ac
	0sJtaWd52jVBdI3mrwv8BcvSqEqhVpFsWcCxUVk+Q0TFOB88EXzlPQbexHQhHV/JM/MM3z3/Rvsxn
	3/tpppFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKW-00000002dBy-30fn;
	Fri, 04 Sep 2026 15:59:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKO-00000002cmN-01Th
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:59:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6824360218;
	Fri,  4 Sep 2026 15:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D471F00A3F;
	Fri,  4 Sep 2026 15:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537583;
	bh=i/HOE/EOJ4rOihR4fqi0QR/fwPq01YyK6O5FLkn4htw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LvU3p0RZvuvrmU2wuKVGN/kWiTTxZ1CQKreFmDkaQEppdB8ZpWQOzv/TEKSQ5Ep7e
	 /V54R03yp486hjCAYNbnqOm/Nga0QZOdfhqNMvvMfoacH6HNpsopHBzIm8bFOO79F1
	 yGfXlTY/BGXAFVGJK+LLn3g26pEaHAjxC8g3OEQHRk3OBP3Th8L3hzjiYuBV/dAzFk
	 jlW1w/sl8Q1umqNPRQ7bH9Rso98jxggAKI9SjtUOedGlfqhdCY5G5THxHowvMs35Vy
	 01ee0RjKx3J1PYU6vYvgqdB4Us/pOP0gDCaH9O4/Ombk1UMztPi8VufEQUOM0Kb1Ge
	 m+lzX/3CRBjjQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 04 Sep 2026 16:57:59 +0100
Subject: [PATCH v4 4/9] firmware: arm_scmi: Fall back to ACPI HID when
 "compatible" is absent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi_scmi_pcc-v4-4-6ebe9755606e@kernel.org>
References: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
In-Reply-To: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
X-Mailer: b4 0.16.0
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

scmi_debugfs_common_setup() uses the "compatible" property to
populate the debugfs transport type string. ACPI-described SCMI
devices do not provide that DT property, so the string remains
NULL and debugfs setup falls through the allocation failure path.

Check the property lookup result and use the ACPI HID as the
fallback transport type when an ACPI companion is present.

All supported DT SCMI platforms are expected to provide "compatible",
so the non-ACPI fallback is not needed for normal DT operation. Keep
the explicit "unknown" fallback anyway to avoid passing NULL to
kstrdup() if that assumption is ever violated.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 7e239f52c888..51829550636f 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -16,6 +16,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/cleanup.h>
 #include <linux/debugfs.h>
@@ -3063,6 +3064,15 @@ static void scmi_debugfs_common_cleanup(void *d)
 	kfree(dbg->type);
 }
 
+static const char *scmi_acpi_device_hid(struct acpi_device *adev)
+{
+#ifdef CONFIG_ACPI
+	return adev ? acpi_device_hid(adev) : "unknown";
+#else
+	return "unknown";
+#endif
+}
+
 static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
 {
 	char top_dir[16];
@@ -3080,8 +3090,10 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
 		return NULL;
 	}
 
-	fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
-				    &c_ptr);
+	if (fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
+					&c_ptr))
+		c_ptr = scmi_acpi_device_hid(ACPI_COMPANION(info->dev));
+
 	dbg->type = kstrdup(c_ptr, GFP_KERNEL);
 	if (!dbg->type) {
 		kfree(dbg->name);

-- 
2.43.0


