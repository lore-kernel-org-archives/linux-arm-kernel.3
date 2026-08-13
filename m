Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A07C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFU827lDWVGro8n3gmbWB6iOksvX3kBnB8CWUXkl5bw=; b=Qv/pLrjPBzCmpjNcpxnRkuY7Vj
	xjCG4AYPxdyV5HHOdRm7qBbYAo1nbJwiSJsHmn09gMxWS0qtanse31ZFDxGt5ZH71yUw7jwp14I2U
	aCDUgi+dD6g1alj5LA8fIk11FX7lXXGtsvW4XCiFqX9gORKf+gJRwRutGN+hgQkfLyoJAIxJmuyKa
	PqjWiMmqlJnnbU8ugo0F0qPCDOL6dpU0deUpql264Z0kOrjHfscBVtas8RC7/inx0NWlBBk4h8aj4
	MVukqtt7Th82LxFqnffRYlcBaKFW0dVysaJEgapj2Sw+VBIwsMWKlXCoQnvrWwZj4kFj8nVNpGXud
	or2nesgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTgw-00000000YY4-3vTT;
	Thu, 13 Aug 2026 11:33:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTgl-00000000YSK-3lBJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 11:33:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8528F42DA0;
	Thu, 13 Aug 2026 11:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3301F00A3D;
	Thu, 13 Aug 2026 11:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786620815;
	bh=MFU827lDWVGro8n3gmbWB6iOksvX3kBnB8CWUXkl5bw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=c4hKVxUuBK2CsqbnZuhjcrO82vYBB9cD3x7QvD0PzVfYAYm8zVbg4sW/NnAOjlZax
	 Pj5k3omEoIDEQD0JIqPW6BBd5xGI2tbg0SA+EOhNveWgUxnz/dlcRdqVYG3tz90uOt
	 wXf0SoXSKWkjwW+Mtb4tslD+oAvesJqQhXHocEHDgH+O1FeDRQqJGmj21tKZmOAonF
	 dl3fhArdI2pXoWkE0vAShcnz35H2dKmbuljbwZ9k1/fWB9yLFCNJ42W82aG88Q9Fmc
	 LnVbW9SEaEP20wqLIkEh42nilcHoh2eQ9ChKSjXABAp8CGaASMKMaqyj1/KJoKytwZ
	 9RiorPpQl8aSA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 13 Aug 2026 12:32:59 +0100
Subject: [PATCH v3 4/9] firmware: arm_scmi: Fall back to ACPI HID when
 "compatible" is absent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-acpi_scmi_pcc-v3-4-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15.2
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
index 9014723e0f7f..9ad827c6a9ab 100644
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


