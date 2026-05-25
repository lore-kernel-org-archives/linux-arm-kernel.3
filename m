Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CE5CD5BDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 20:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkDwSFofb2Cx7TIeCwWJaeJKoN+L+6nmkZ1FtUD5ehw=; b=S1D4yL7Xcnl8antgv9PTzfC4dY
	atLSa/GifKBIOiEipzCHoxXW64CY/GohB8XwXTivRDdCB/jZrliFtA4XLDb28/3C4aXIdCfvW8d4J
	bw4cNBhNz0GcZaJxunqYi+rmjyCXvuEhR2vXhe0ghcrKhmDS09+yFFrfT4pemgtJrqM7O9Sn+feSS
	ARsJTDNk3OBZ/c10Ru3y3lnOn0dUifK7mFygrwJf3CvXnqVFtw4rypMCB/GmEkGmluYZVNHsmoxU+
	okegYkYwcb0Q3ZEDGKkTe2pBN60FyDT9trqMRbh9UNEv/2qGar5HsocZO9S5Wc6sfQ0ZdAqxgyz+O
	vedgsksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRcAS-00000000Rbr-2Lxa;
	Mon, 25 May 2026 20:44:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRc9t-00000000RIz-3uh4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 20:44:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BBEC43CFA;
	Mon, 25 May 2026 20:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB94A1F00A3A;
	Mon, 25 May 2026 20:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741861;
	bh=tkDwSFofb2Cx7TIeCwWJaeJKoN+L+6nmkZ1FtUD5ehw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KD7tiTAp6jT5/Mw5HIDbX/3ZPXVE9rsxousi0EakrsJO++ySuCTmKCx2I9jm2xA3r
	 uie2Ddb39PEXViyMiXY4tuahtlJSoQWTBRZ62xjvD2RdMfeQdsrIqx7akp8wa/SR+p
	 Jh8DYcnz9Bszgq0rqtEAlZ7o9+W2nNfLUCVzOx0REPnAT1hrMQh4CkYYpSq22wnrm+
	 +QISr41acoaZsUT8KdIso6vCerujjowk3P7gaHt1qs7HJVXLrpchv459BYtPKX687r
	 KeDGxcP0LFqs1c8BPdYhDK7g5LlTu6BeXPCX+21zNCKtIXNQYF/YyNq7NyZ57LtOmb
	 ySBjSS9bSllCA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 25 May 2026 21:42:43 +0100
Subject: [PATCH v2 5/9] firmware: arm_scmi: Fall back to ACPI HID when
 "compatible" is absent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpi_scmi_pcc-v2-5-4f38938d08d8@arm.com>
References: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
In-Reply-To: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_134422_159962_C79A3F2A 
X-CRM114-Status: GOOD (  10.74  )
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
fallback transport type for ACPI-described systems.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 75dda6d5e8b1..04a0d8202504 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3028,8 +3028,9 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
 		return NULL;
 	}
 
-	fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
-				    &c_ptr);
+	if (fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
+					&c_ptr))
+		c_ptr = acpi_device_hid(ACPI_COMPANION(info->dev)) ?: "unknown";
 	dbg->type = kstrdup(c_ptr, GFP_KERNEL);
 	if (!dbg->type) {
 		kfree(dbg->name);

-- 
2.43.0


