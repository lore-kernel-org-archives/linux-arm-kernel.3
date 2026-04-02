Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F64AD39400
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAUcCbq0747VRGXrl4OKTIDn+MJrONajR1O33hye3n4=; b=U9tdT8KLkdyf/Ef3zi8VktI5mr
	zlRamQVbGmLY43yZsuZ5wYnt7F0UXeVsFelrX2yfghaZWLafAkjCUasqThwLa0D6o752kY5jNIofs
	c0kezzt5uTBUlD0cfJMm6nKV622gjW+HBgZWCsLYC168LF+aui9aN+dXsBTEAJ4iWTnhK65hr/iIf
	oNr+xjoewa939uPBoSLoME7jAzGvoYxkxf/sipW4JvfWJ3tCYAEJ4kj69ILEpv3Q0MxmJckjjQv3X
	DkrrFgIaLaRYExHe5XryoKeEmL0ZlbRMd2UHJl5A46qGAFs1awfgosPJss6vy1Jdq7ftds7dOTwIc
	6/P3c2mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EH3-0000000HFIx-0XBT;
	Thu, 02 Apr 2026 09:23:37 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EH0-0000000HFDK-225z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:23:35 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 84A0D5BD9A;
	Thu,  2 Apr 2026 09:23:12 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC1F84A0B1;
	Thu,  2 Apr 2026 09:23:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UGM3OH81zmlVYAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 02 Apr 2026 09:23:11 +0000
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
Subject: [PATCH 3/8] firmware: sysfb: Make CONFIG_SYSFB a user-selectable option
Date: Thu,  2 Apr 2026 11:09:17 +0200
Message-ID: <20260402092305.208728-4-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 84A0D5BD9A
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_022334_701401_DA9B3229 
X-CRM114-Status: GOOD (  17.92  )
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

Add a descriptive string and help text to CONFIG_SYSFB, so that users
can modify it. Flip all implicit selects in the Kconfig options into
dependencies. This avoids cyclic dependencies in the config.

Enabling CONFIG_SYSFB makes the kernel provide a device for the firmware
framebuffer. As this can (slightly) affect system behavior, having a
user-facing option seems preferable. Some users might also want to set
every detail of their kernel config.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/Kconfig      | 18 ++++++++++++++++--
 drivers/gpu/drm/sysfb/Kconfig |  4 ++--
 drivers/hv/Kconfig            |  2 +-
 drivers/video/fbdev/Kconfig   |  5 +++--
 4 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index bbd2155d8483..52f8253a46b1 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -179,14 +179,28 @@ config MTK_ADSP_IPC
 	  Client might use shared memory to exchange information with ADSP.
 
 config SYSFB
-	bool
+	bool "Enable system framebuffer provided by boot loader"
 	select BOOT_VESA_SUPPORT
 	select SCREEN_INFO
+	help
+	  Use the system framebuffer provided by the boot loader. This will
+	  create a device representing the framebuffer. The output depends on
+	  EFI, VESA, VGA, or some other firmware-based interface.
+
+	  The firmware or boot loader sets the display resolution and color
+	  mode. See your boot loader's documentation on how to do this. On
+	  some systems the display can also be configured during boot with
+	  the kernel's video= or vga= parameters.
+
+	  Besides this option, you also have to enable a compatible graphics
+	  driver, such as efidrm or vesadrm.
+
+	  If unsure, say Y.
 
 config SYSFB_SIMPLEFB
 	bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
+	depends on SYSFB
 	depends on X86 || EFI
-	select SYSFB
 	help
 	  Firmwares often provide initial graphics framebuffers so the BIOS,
 	  bootloader or kernel can show basic video-output during boot for
diff --git a/drivers/gpu/drm/sysfb/Kconfig b/drivers/gpu/drm/sysfb/Kconfig
index 2559ead6cf1f..74be3c8e6657 100644
--- a/drivers/gpu/drm/sysfb/Kconfig
+++ b/drivers/gpu/drm/sysfb/Kconfig
@@ -26,12 +26,12 @@ config DRM_COREBOOTDRM
 config DRM_EFIDRM
 	tristate "EFI framebuffer driver"
 	depends on DRM && MMU && EFI && (!SYSFB_SIMPLEFB || COMPILE_TEST)
+	depends on SYSFB
 	select APERTURE_HELPERS
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	select DRM_SYSFB_HELPER
-	select SYSFB
 	help
 	  DRM driver for EFI framebuffers.
 
@@ -76,12 +76,12 @@ config DRM_SIMPLEDRM
 config DRM_VESADRM
 	tristate "VESA framebuffer driver"
 	depends on DRM && MMU && X86 && (!SYSFB_SIMPLEFB || COMPILE_TEST)
+	depends on SYSFB
 	select APERTURE_HELPERS
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	select DRM_SYSFB_HELPER
-	select SYSFB
 	help
 	  DRM driver for VESA framebuffers.
 
diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 2d0b3fcb0ff8..af0ac6516159 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -60,8 +60,8 @@ config HYPERV_BALLOON
 config HYPERV_VMBUS
 	tristate "Microsoft Hyper-V VMBus driver"
 	depends on HYPERV
+	depends on SYSFB if EFI && !HYPERV_VTL_MODE
 	default HYPERV
-	select SYSFB if EFI && !HYPERV_VTL_MODE
 	help
 	  Select this option to enable Hyper-V Vmbus driver.
 
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index ac9ac4287c6a..6f55bec8c207 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -333,6 +333,7 @@ config FB_IMSTT
 config FB_VGA16
 	tristate "VGA 16-color graphics support"
 	depends on FB && X86
+	depends on SYSFB
 	select APERTURE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
@@ -424,9 +425,9 @@ config FB_UVESA
 config FB_VESA
 	bool "VESA VGA graphics support"
 	depends on (FB = y) && X86
+	depends on SYSFB
 	select APERTURE_HELPERS
 	select FB_IOMEM_HELPERS
-	select SYSFB
 	help
 	  This is the frame buffer device driver for generic VESA 2.0
 	  compliant graphic cards. The older VESA 1.2 cards are not supported.
@@ -436,10 +437,10 @@ config FB_VESA
 config FB_EFI
 	bool "EFI-based Framebuffer Support"
 	depends on (FB = y) && EFI
+	depends on SYSFB
 	select APERTURE_HELPERS
 	select DRM_PANEL_ORIENTATION_QUIRKS
 	select FB_IOMEM_HELPERS
-	select SYSFB
 	help
 	  This is the EFI frame buffer device driver. If the firmware on
 	  your platform is EFI 1.10 or UEFI 2.0, select Y to add support for
-- 
2.53.0


