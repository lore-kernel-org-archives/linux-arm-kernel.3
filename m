Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FBBC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6n0faIBhMoLEpSRsv9bn04UWwhQ2MrwjbyLIxI2jfHA=; b=kWi6+Og04IhlsKf1nt7GtGt2Fl
	ZXPKK4N0+4ZUbRtxqVVver984DYNk5XOUcVi21WZXKB63m1mqt4gFjAbPwBuwXYmJW/0qEmTe0R39
	9tPoORLz8/Ola6g6vP/zTnj5IpE5W1PbVCYnT1ylr5rOVCctHEbPLPmDVPrqIE1t5uxAxdOsV02Ck
	qrzkghSbj1562vX0dD2Vsrnj5qxsNQlzBmeEPC5la/3lSXuMWxWhi/Cimdbjm6jodERqJvESFMg85
	VICxlhJedGcxoiD1cVEv0gnWvyYfrppf63up9P1r5kQJf+Bg+gsobJvEj9x1iQMgRdnh3K/dqtNQB
	f2nnf9Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Wae-00000007Wd1-3X1v;
	Tue, 15 Sep 2026 17:05:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Wad-00000007Wbm-3aFT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:05:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A5A343DE6;
	Tue, 15 Sep 2026 17:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1E31F0089B;
	Tue, 15 Sep 2026 17:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491903;
	bh=6n0faIBhMoLEpSRsv9bn04UWwhQ2MrwjbyLIxI2jfHA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mjZ8lDOccuCvWA4XdHD7squMqFwZ3pxR+2sStcfNHCFq+UW8Tv2WU2X4gfeHYcRmp
	 1zOuU1Dx+COpMZoU2WwAD9wc8I9riNSwRrxeAWRUlDrLZOt5QGiERnVrAAlSXSxiVq
	 OQ1ciXmuqIqwWI6pXx9oOYrZZL2ZynEeMhZp8JV9q14kfUfRDqxm+UUn91PT13eiCD
	 58htoqUminJEEfmn/IeksZeY7+t0oVn9cZZTY9jiTKb14qngH43M2fBO8wZydKkjCM
	 6NruoykN9011umvW/5ITm5SinMAD1k4x/z2zJO5u/eThzGkcimi+h3l0oE0ScUf1N2
	 quCDB9h2gPFhA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 15 Sep 2026 18:03:38 +0100
Subject: [PATCH v5 4/9] firmware: arm_scmi: Fall back to ACPI HID when
 "compatible" is absent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-acpi_scmi_pcc-v5-4-298579e9f359@kernel.org>
References: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
In-Reply-To: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
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
index 4ca52cfb0a45..878d27bc315a 100644
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


