Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85203D10F58
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLqTeUqxHMGJ5DwnWS0LONaS0qMJkFM3aTtgypG/rBQ=; b=zSFje2VUQvALl6o7g1TibQj547
	rqmJX6s5x+pnaPpqyfrpYdQ+QJmViv/pgCtbNalpvIZHJl3twMn7DYdSDAmI8sq0zcFLcxdkNO180
	JuBgvA6vP+8XcF1YJVW3mToqbSdIgvhEVEMaNZorCfqG43P7vW6pH/0VY39qUJeYF7AhklVEqGtpS
	ROUcDlmy+bR0I0hL8wM2Cpx3vXOdMElU2qnSyyxUZuzglrR/OkXf9lO7LiZZpbhll+CThsVKF9UWz
	Q+T+yh7py29n6LA6uJcT/0NUMbVle1aPgZXiTecErOCtrYWBa91Hy9AsT7skpZR4ZxLdfjAGN+o4I
	Ka26mGgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOI53-0000000FFP4-1FtM;
	Wed, 26 Nov 2025 16:09:21 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOI4u-0000000FFIC-2V4z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:09:13 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6CFE65BE98;
	Wed, 26 Nov 2025 16:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764173340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLqTeUqxHMGJ5DwnWS0LONaS0qMJkFM3aTtgypG/rBQ=;
	b=DoC7dgJIBUamaOQUtk/UHCiAdZVnC+XcXAbZM8zcCtANlasXUyFUDagtCuQI3caOLpSteq
	/7cfL+nllbmaoskoi7bzoMJt5Rb4hAEmeZnlsQLxxc1ou+T1Vr26d7HAwi5eVz4UBFAcNu
	0fQcGH7PjyESobUeum0d3dz+J0heYpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764173340;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLqTeUqxHMGJ5DwnWS0LONaS0qMJkFM3aTtgypG/rBQ=;
	b=lgZWJFcB5v0eL4kg4JssZ9fNFWTFc3GGU7WXfuT205nINclXe1hAUcGFX53steVpx+IaHG
	HIhEIZk/LqKWzFCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764173340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLqTeUqxHMGJ5DwnWS0LONaS0qMJkFM3aTtgypG/rBQ=;
	b=DoC7dgJIBUamaOQUtk/UHCiAdZVnC+XcXAbZM8zcCtANlasXUyFUDagtCuQI3caOLpSteq
	/7cfL+nllbmaoskoi7bzoMJt5Rb4hAEmeZnlsQLxxc1ou+T1Vr26d7HAwi5eVz4UBFAcNu
	0fQcGH7PjyESobUeum0d3dz+J0heYpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764173340;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLqTeUqxHMGJ5DwnWS0LONaS0qMJkFM3aTtgypG/rBQ=;
	b=lgZWJFcB5v0eL4kg4JssZ9fNFWTFc3GGU7WXfuT205nINclXe1hAUcGFX53steVpx+IaHG
	HIhEIZk/LqKWzFCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F30ED3EA63;
	Wed, 26 Nov 2025 16:08:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kJ3oORsmJ2lnIgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 26 Nov 2025 16:08:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org,
	javierm@redhat.com,
	arnd@arndb.de,
	richard.lyu@suse.com,
	helgaas@kernel.org
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 2/9] efi: sysfb_efi: Reduce number of references to global screen_info
Date: Wed, 26 Nov 2025 17:03:19 +0100
Message-ID: <20251126160854.553077-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126160854.553077-1-tzimmermann@suse.de>
References: <20251126160854.553077-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_080912_777687_95E96C2E 
X-CRM114-Status: GOOD (  22.73  )
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

Replace usage of global screen_info with local pointers. This will
later reduce churn when screen_info is being moved.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Richard Lyu <richard.lyu@suse.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/sysfb_efi.c  | 81 ++++++++++++++++---------------
 drivers/firmware/sysfb.c          |  4 +-
 drivers/firmware/sysfb_simplefb.c |  2 +-
 include/linux/sysfb.h             |  9 ++--
 4 files changed, 51 insertions(+), 45 deletions(-)

diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
index 1e509595ac03..8e0f9d08397f 100644
--- a/drivers/firmware/efi/sysfb_efi.c
+++ b/drivers/firmware/efi/sysfb_efi.c
@@ -92,7 +92,7 @@ void efifb_setup_from_dmi(struct screen_info *si, const char *opt)
 	})
 
 #ifdef CONFIG_EFI
-static int __init efifb_set_system(const struct dmi_system_id *id)
+static int __init efifb_set_system(struct screen_info *si, const struct dmi_system_id *id)
 {
 	struct efifb_dmi_info *info = id->driver_data;
 
@@ -101,14 +101,14 @@ static int __init efifb_set_system(const struct dmi_system_id *id)
 		return 0;
 
 	/* Trust the bootloader over the DMI tables */
-	if (screen_info.lfb_base == 0) {
+	if (si->lfb_base == 0) {
 #if defined(CONFIG_PCI)
 		struct pci_dev *dev = NULL;
 		int found_bar = 0;
 #endif
 		if (info->base) {
-			screen_info.lfb_base = choose_value(info->base,
-				screen_info.lfb_base, OVERRIDE_BASE,
+			si->lfb_base = choose_value(info->base,
+				si->lfb_base, OVERRIDE_BASE,
 				info->flags);
 
 #if defined(CONFIG_PCI)
@@ -135,49 +135,53 @@ static int __init efifb_set_system(const struct dmi_system_id *id)
 
 					start = pci_resource_start(dev, i);
 					end = pci_resource_end(dev, i);
-					if (screen_info.lfb_base >= start &&
-					    screen_info.lfb_base < end) {
+					if (si->lfb_base >= start && si->lfb_base < end) {
 						found_bar = 1;
 						break;
 					}
 				}
 			}
 			if (!found_bar)
-				screen_info.lfb_base = 0;
+				si->lfb_base = 0;
 #endif
 		}
 	}
-	if (screen_info.lfb_base) {
-		screen_info.lfb_linelength = choose_value(info->stride,
-			screen_info.lfb_linelength, OVERRIDE_STRIDE,
+	if (si->lfb_base) {
+		si->lfb_linelength = choose_value(info->stride,
+			si->lfb_linelength, OVERRIDE_STRIDE,
 			info->flags);
-		screen_info.lfb_width = choose_value(info->width,
-			screen_info.lfb_width, OVERRIDE_WIDTH,
+		si->lfb_width = choose_value(info->width,
+			si->lfb_width, OVERRIDE_WIDTH,
 			info->flags);
-		screen_info.lfb_height = choose_value(info->height,
-			screen_info.lfb_height, OVERRIDE_HEIGHT,
+		si->lfb_height = choose_value(info->height,
+			si->lfb_height, OVERRIDE_HEIGHT,
 			info->flags);
-		if (screen_info.orig_video_isVGA == 0)
-			screen_info.orig_video_isVGA = VIDEO_TYPE_EFI;
+		if (si->orig_video_isVGA == 0)
+			si->orig_video_isVGA = VIDEO_TYPE_EFI;
 	} else {
-		screen_info.lfb_linelength = 0;
-		screen_info.lfb_width = 0;
-		screen_info.lfb_height = 0;
-		screen_info.orig_video_isVGA = 0;
+		si->lfb_linelength = 0;
+		si->lfb_width = 0;
+		si->lfb_height = 0;
+		si->orig_video_isVGA = 0;
 		return 0;
 	}
 
 	printk(KERN_INFO "efifb: dmi detected %s - framebuffer at 0x%08x "
 			 "(%dx%d, stride %d)\n", id->ident,
-			 screen_info.lfb_base, screen_info.lfb_width,
-			 screen_info.lfb_height, screen_info.lfb_linelength);
+			 si->lfb_base, si->lfb_width,
+			 si->lfb_height, si->lfb_linelength);
 
 	return 1;
 }
 
+static int __init efifb_set_system_callback(const struct dmi_system_id *id)
+{
+	return efifb_set_system(&screen_info, id);
+}
+
 #define EFIFB_DMI_SYSTEM_ID(vendor, name, enumid)		\
 	{							\
-		efifb_set_system,				\
+		efifb_set_system_callback,			\
 		name,						\
 		{						\
 			DMI_MATCH(DMI_BIOS_VENDOR, vendor),	\
@@ -284,12 +288,13 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
 	{},
 };
 
-static bool efifb_overlaps_pci_range(const struct of_pci_range *range)
+static bool efifb_overlaps_pci_range(const struct screen_info *si,
+				     const struct of_pci_range *range)
 {
-	u64 fb_base = screen_info.lfb_base;
+	u64 fb_base = si->lfb_base;
 
-	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-		fb_base |= (u64)(unsigned long)screen_info.ext_lfb_base << 32;
+	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
+		fb_base |= (u64)(unsigned long)si->ext_lfb_base << 32;
 
 	return fb_base >= range->cpu_addr &&
 	       fb_base < (range->cpu_addr + range->size);
@@ -311,7 +316,7 @@ static struct device_node *find_pci_overlap_node(void)
 		}
 
 		for_each_of_pci_range(&parser, &range)
-			if (efifb_overlaps_pci_range(&range))
+			if (efifb_overlaps_pci_range(&screen_info, &range))
 				return np;
 	}
 	return NULL;
@@ -349,25 +354,25 @@ static const struct fwnode_operations efifb_fwnode_ops = {
 
 static struct fwnode_handle efifb_fwnode;
 
-__init void sysfb_apply_efi_quirks(void)
+__init void sysfb_apply_efi_quirks(struct screen_info *si)
 {
-	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI ||
-	    !(screen_info.capabilities & VIDEO_CAPABILITY_SKIP_QUIRKS))
+	if (si->orig_video_isVGA != VIDEO_TYPE_EFI ||
+	    !(si->capabilities & VIDEO_CAPABILITY_SKIP_QUIRKS))
 		dmi_check_system(efifb_dmi_system_table);
 
-	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI &&
+	if (si->orig_video_isVGA == VIDEO_TYPE_EFI &&
 	    dmi_check_system(efifb_dmi_swap_width_height)) {
-		u16 temp = screen_info.lfb_width;
+		u16 temp = si->lfb_width;
 
-		screen_info.lfb_width = screen_info.lfb_height;
-		screen_info.lfb_height = temp;
-		screen_info.lfb_linelength = 4 * screen_info.lfb_width;
+		si->lfb_width = si->lfb_height;
+		si->lfb_height = temp;
+		si->lfb_linelength = 4 * si->lfb_width;
 	}
 }
 
-__init void sysfb_set_efifb_fwnode(struct platform_device *pd)
+__init void sysfb_set_efifb_fwnode(const struct screen_info *si, struct platform_device *pd)
 {
-	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI && IS_ENABLED(CONFIG_PCI)) {
+	if (si->orig_video_isVGA == VIDEO_TYPE_EFI && IS_ENABLED(CONFIG_PCI)) {
 		fwnode_init(&efifb_fwnode, &efifb_fwnode_ops);
 		pd->dev.fwnode = &efifb_fwnode;
 	}
diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 889e5b05c739..916b28538a29 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -155,7 +155,7 @@ static __init int sysfb_init(void)
 	if (disabled)
 		goto unlock_mutex;
 
-	sysfb_apply_efi_quirks();
+	sysfb_apply_efi_quirks(si);
 
 	parent = sysfb_parent_dev(si);
 	if (IS_ERR(parent)) {
@@ -200,7 +200,7 @@ static __init int sysfb_init(void)
 
 	pd->dev.parent = parent;
 
-	sysfb_set_efifb_fwnode(pd);
+	sysfb_set_efifb_fwnode(si, pd);
 
 	ret = platform_device_add_data(pd, si, sizeof(*si));
 	if (ret)
diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
index 592d8a644619..71f542e37732 100644
--- a/drivers/firmware/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -117,7 +117,7 @@ __init struct platform_device *sysfb_create_simplefb(const struct screen_info *s
 
 	pd->dev.parent = parent;
 
-	sysfb_set_efifb_fwnode(pd);
+	sysfb_set_efifb_fwnode(si, pd);
 
 	ret = platform_device_add_resources(pd, &res, 1);
 	if (ret)
diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index b449665c686a..8527a50a5290 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -82,16 +82,17 @@ static inline bool sysfb_handles_screen_info(void)
 #ifdef CONFIG_EFI
 
 extern struct efifb_dmi_info efifb_dmi_list[];
-void sysfb_apply_efi_quirks(void);
-void sysfb_set_efifb_fwnode(struct platform_device *pd);
+void sysfb_apply_efi_quirks(struct screen_info *si);
+void sysfb_set_efifb_fwnode(const struct screen_info *si, struct platform_device *pd);
 
 #else /* CONFIG_EFI */
 
-static inline void sysfb_apply_efi_quirks(void)
+static inline void sysfb_apply_efi_quirks(struct screen_info *si)
 {
 }
 
-static inline void sysfb_set_efifb_fwnode(struct platform_device *pd)
+static inline void sysfb_set_efifb_fwnode(const struct screen_info *si,
+					  struct platform_device *pd)
 {
 }
 
-- 
2.51.1


