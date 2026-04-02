Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B02AD39401
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/Qd5UBJITS3Z/etkmvFdfigaZP49jccB+9QH++648s=; b=YeTkq+wxzwdMIs6HrZ/EnWkVZZ
	N3dp3v6j3j0opzH6nSNnIKXnzXI/Ju8x0MTy60KfbACvwR9Up+IIeLA6Pyi1+92YR0MUNvZnn4349
	+OEb/YfVC1A4RZsBXgeTQf3K0zJLWFtmqIoEFmNZFd6oX1AJckHHb5p1oAC8CPrKxc+Ey7haXxdIw
	RYLvsQlMUHAzcU+v4O3dExE355H4X/TCyEB25s3AhpihMHF5uhDtiMYtbI70b9GEHYb+oM7FreOCO
	LCbfB92r+K6Pq4vOiY4LGfMWOMM/IOCGGV5r8RgyZh7CmxdEtOyBudHoWKVNvydizxaZrxhDxEc2T
	GEkXLt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EH5-0000000HFNU-38oe;
	Thu, 02 Apr 2026 09:23:39 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EH0-0000000HFDY-31eS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:23:36 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 831024D322;
	Thu,  2 Apr 2026 09:23:15 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE2D64A0B0;
	Thu,  2 Apr 2026 09:23:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wEq8OII1zmlVYAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 02 Apr 2026 09:23:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	arnd@arndb.de,
	ardb@kernel.org,
	ilias.apalodimas@linaro.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	deller@gmx.de
Cc: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 8/8] firmware: sysfb: Move CONFIG_FIRMWARE_EDID to firmware options
Date: Thu,  2 Apr 2026 11:09:22 +0200
Message-ID: <20260402092305.208728-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402092305.208728-1-tzimmermann@suse.de>
References: <20260402092305.208728-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 831024D322
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_022335_061917_4164B653 
X-CRM114-Status: GOOD (  18.14  )
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

Move the Kconfig option for CONFIG_FIRMWARE_EDID to the firmware
subsystem. The option controls architecture and firmware code, so
it fits here better than in video.

Also make it depend on CONFIG_SYSFB. The EDID data is stored in
sysfb_primary_display and only useful with a sysfb framebuffer. This
further allows for removing an explicit test for CONFIG_FIRMWARE_EDID
from the EFI init code. For loongson, select CONFIG_SYSFB in the
defconfig files.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/loongarch/configs/loongson32_defconfig |  1 +
 arch/loongarch/configs/loongson64_defconfig |  1 +
 drivers/firmware/Kconfig                    | 20 ++++++++++++++++++++
 drivers/firmware/efi/efi-init.c             |  2 +-
 drivers/video/Kconfig                       | 19 -------------------
 5 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/arch/loongarch/configs/loongson32_defconfig b/arch/loongarch/configs/loongson32_defconfig
index 276b1577e0be..1c0897723247 100644
--- a/arch/loongarch/configs/loongson32_defconfig
+++ b/arch/loongarch/configs/loongson32_defconfig
@@ -786,6 +786,7 @@ CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_DRM_LOONGSON=y
 CONFIG_FB=y
 CONFIG_FB_RADEON=y
+CONFIG_SYSFB=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=m
diff --git a/arch/loongarch/configs/loongson64_defconfig b/arch/loongarch/configs/loongson64_defconfig
index a14db1a95e7e..38340537dfd4 100644
--- a/arch/loongarch/configs/loongson64_defconfig
+++ b/arch/loongarch/configs/loongson64_defconfig
@@ -816,6 +816,7 @@ CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_DRM_LOONGSON=y
 CONFIG_FB=y
 CONFIG_FB_RADEON=y
+CONFIG_SYSFB=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=m
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 52f8253a46b1..edfb171d9eab 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -225,6 +225,26 @@ config SYSFB_SIMPLEFB
 
 	  If unsure, say Y.
 
+config FIRMWARE_EDID
+	bool "Enable firmware EDID"
+	depends on SYSFB
+	depends on EFI_GENERIC_STUB || X86
+	help
+	  This enables access to the EDID transferred from the firmware.
+	  On EFI systems, the EDID comes from the same device as the
+	  primary GOP. On x86 with BIOS, it comes from the VESA BIOS.
+	  DRM display drivers will be able to export the information
+	  to userspace.
+
+	  Also enable this if DDC/I2C transfers do not work for your driver
+	  and if you are using nvidiafb, i810fb or savagefb.
+
+	  In general, choosing Y for this option is safe.  If you
+	  experience extremely long delays while booting before you get
+	  something on your display, try setting this to N.  Matrox cards in
+	  combination with certain motherboards and monitors are known to
+	  suffer from this problem.
+
 config TH1520_AON_PROTOCOL
 	tristate "Always-On firmware protocol"
 	depends on ARCH_THEAD || COMPILE_TEST
diff --git a/drivers/firmware/efi/efi-init.c b/drivers/firmware/efi/efi-init.c
index 002518b642ed..c4088fb8482b 100644
--- a/drivers/firmware/efi/efi-init.c
+++ b/drivers/firmware/efi/efi-init.c
@@ -60,7 +60,7 @@ extern __weak const efi_config_table_type_t efi_arch_tables[];
  * x86 defines its own instance of sysfb_primary_display and uses
  * it even without EFI, everything else can get them from here.
  */
-#if !defined(CONFIG_X86) && (defined(CONFIG_SYSFB) || defined(CONFIG_FIRMWARE_EDID))
+#if !defined(CONFIG_X86) && defined(CONFIG_SYSFB)
 struct sysfb_display_info sysfb_primary_display __section(".data");
 EXPORT_SYMBOL_GPL(sysfb_primary_display);
 #endif
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index a7144d275f54..1c9ac3b029a7 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -62,25 +62,6 @@ config HDMI
 
 endif # HAS_IOMEM
 
-config FIRMWARE_EDID
-	bool "Enable firmware EDID"
-	depends on EFI_GENERIC_STUB || X86
-	help
-	  This enables access to the EDID transferred from the firmware.
-	  On EFI systems, the EDID comes from the same device as the
-	  primary GOP. On x86 with BIOS, it comes from the VESA BIOS.
-	  DRM display drivers will be able to export the information
-	  to userspace.
-
-	  Also enable this if DDC/I2C transfers do not work for your driver
-	  and if you are using nvidiafb, i810fb or savagefb.
-
-	  In general, choosing Y for this option is safe.  If you
-	  experience extremely long delays while booting before you get
-	  something on your display, try setting this to N.  Matrox cards in
-	  combination with certain motherboards and monitors are known to
-	  suffer from this problem.
-
 if VT
 	source "drivers/video/console/Kconfig"
 endif
-- 
2.53.0


