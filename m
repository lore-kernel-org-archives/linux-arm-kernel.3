Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1071D11183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrrbJ3alRtzOMTMhYJrDntjaxvd3iXypW6GUIunVDTk=; b=z5KFGdYmY1u+dIQfmhaBoDxyRY
	pQzifgmsZBAVwPh72qG1LNlGD7C6lIrU70LVz+dyrszDL5Wv8Tw8svhlKwKM36ewGp63/93BiVdIT
	FzoWaqPrHy4sZVVhlKjRtkcmlTx16k1BgCsSz8tdaADTK4GIK/i8EzY6km7zcSgUKDhRhPC4Q1Wfm
	poht+yJppV9tq+4gs1cGPgwqd1iuwUhWeyndzXTQhBWunsV4wY9iMhCkw5GdhvrgmNDdzDKGKVDsj
	Vbiw5dFSEITRResbhUwC3FPInT2hgoMlkOjCv62Cu3fzfFSDLrBL+IdwI/C5B5KeemOR4iVhiRmgu
	KCa5fJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOI5F-0000000FFfk-3Qcv;
	Wed, 26 Nov 2025 16:09:33 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOI5A-0000000FFWT-05Cg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:09:30 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BEC2A33709;
	Wed, 26 Nov 2025 16:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764173343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BrrbJ3alRtzOMTMhYJrDntjaxvd3iXypW6GUIunVDTk=;
	b=gDVVsqKgbfh75SmTezs4cw5BsGWBy1HWvPN0lWCIuapXTEVyitUG1XzH/vT6POLV25petk
	xGMCONZMHgiWh9wnKy0mv1vTu9BTgYmSvyPi+B68bAGfgTJxXd823j/GznUK0g2MVS1e1g
	V2cTt2DrASho4AhQNabjuOlHbElHZ8I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764173343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BrrbJ3alRtzOMTMhYJrDntjaxvd3iXypW6GUIunVDTk=;
	b=nlR4bgUcRp9vlyOFO1DCiQOXM5k/oJsckEX/Bytc1gRzOs7DOAyZNjoG25oisWzvkPO71s
	GHyJmNhl2zcRG3BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gDVVsqKg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nlR4bgUc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764173343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BrrbJ3alRtzOMTMhYJrDntjaxvd3iXypW6GUIunVDTk=;
	b=gDVVsqKgbfh75SmTezs4cw5BsGWBy1HWvPN0lWCIuapXTEVyitUG1XzH/vT6POLV25petk
	xGMCONZMHgiWh9wnKy0mv1vTu9BTgYmSvyPi+B68bAGfgTJxXd823j/GznUK0g2MVS1e1g
	V2cTt2DrASho4AhQNabjuOlHbElHZ8I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764173343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BrrbJ3alRtzOMTMhYJrDntjaxvd3iXypW6GUIunVDTk=;
	b=nlR4bgUcRp9vlyOFO1DCiQOXM5k/oJsckEX/Bytc1gRzOs7DOAyZNjoG25oisWzvkPO71s
	GHyJmNhl2zcRG3BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 463AA3EA65;
	Wed, 26 Nov 2025 16:09:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IC+6Dx8mJ2lnIgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 26 Nov 2025 16:09:03 +0000
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
Subject: [PATCH v3 9/9] efi: libstub: Simplify interfaces for primary_display
Date: Wed, 26 Nov 2025 17:03:26 +0100
Message-ID: <20251126160854.553077-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126160854.553077-1-tzimmermann@suse.de>
References: <20251126160854.553077-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLtfyjk8sg4x43ngtem9djprcp)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BEC2A33709
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_080928_481316_94617A7E 
X-CRM114-Status: GOOD (  21.70  )
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

Rename alloc_primary_display() and __alloc_primary_display(), clarify
free semantics to make interfaces easier to understand.

Rename alloc_primary_display() to lookup_primary_display() as it
does not necessarily allocate. Then rename __alloc_primary_display()
to the new alloc_primary_display(). The helper belongs to
free_primary_display), so it should be named without underscores.

The lookup helper does not necessarily allocate, so the output
parameter needs_free to indicate when free should be called. Pass
an argument through the calls to track this state. Put the free
handling into release_primary_display() for simplificy.

Also move the comment fro primary_display.c to efi-stub-entry.c,
where it now describes lookup_primary_display().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/efi/libstub/efi-stub-entry.c | 23 +++++++++++++++++--
 drivers/firmware/efi/libstub/efi-stub.c       | 22 ++++++++++++------
 drivers/firmware/efi/libstub/efistub.h        |  2 +-
 .../firmware/efi/libstub/primary_display.c    | 17 +-------------
 drivers/firmware/efi/libstub/zboot.c          |  6 +++--
 5 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
index aa85e910fe59..3077b51fe0b2 100644
--- a/drivers/firmware/efi/libstub/efi-stub-entry.c
+++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
@@ -14,10 +14,29 @@ static void *kernel_image_addr(void *addr)
 	return addr + kernel_image_offset;
 }
 
-struct sysfb_display_info *alloc_primary_display(void)
+/*
+ * There are two ways of populating the core kernel's sysfb_primary_display
+ * via the stub:
+ *
+ *   - using a configuration table, which relies on the EFI init code to
+ *     locate the table and copy the contents; or
+ *
+ *   - by linking directly to the core kernel's copy of the global symbol.
+ *
+ * The latter is preferred because it makes the EFIFB earlycon available very
+ * early, but it only works if the EFI stub is part of the core kernel image
+ * itself. The zboot decompressor can only use the configuration table
+ * approach.
+ */
+
+struct sysfb_display_info *lookup_primary_display(bool *needs_free)
 {
+	*needs_free = true;
+
 	if (IS_ENABLED(CONFIG_ARM))
-		return __alloc_primary_display();
+		return alloc_primary_display();
+
+	*needs_free = false;
 
 	if (IS_ENABLED(CONFIG_X86) ||
 	    IS_ENABLED(CONFIG_EFI_EARLYCON) ||
diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
index 42d6073bcd06..dc545f62c62b 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -51,14 +51,14 @@ static bool flat_va_mapping = (EFI_RT_VIRTUAL_OFFSET != 0);
 void __weak free_primary_display(struct sysfb_display_info *dpy)
 { }
 
-static struct sysfb_display_info *setup_primary_display(void)
+static struct sysfb_display_info *setup_primary_display(bool *dpy_needs_free)
 {
 	struct sysfb_display_info *dpy;
 	struct screen_info *screen = NULL;
 	struct edid_info *edid = NULL;
 	efi_status_t status;
 
-	dpy = alloc_primary_display();
+	dpy = lookup_primary_display(dpy_needs_free);
 	if (!dpy)
 		return NULL;
 	screen = &dpy->screen;
@@ -68,15 +68,22 @@ static struct sysfb_display_info *setup_primary_display(void)
 
 	status = efi_setup_graphics(screen, edid);
 	if (status != EFI_SUCCESS)
-		goto err_free_primary_display;
+		goto err___free_primary_display;
 
 	return dpy;
 
-err_free_primary_display:
-	free_primary_display(dpy);
+err___free_primary_display:
+	if (*dpy_needs_free)
+		free_primary_display(dpy);
 	return NULL;
 }
 
+static void release_primary_display(struct sysfb_display_info *dpy, bool dpy_needs_free)
+{
+	if (dpy && dpy_needs_free)
+		free_primary_display(dpy);
+}
+
 static void install_memreserve_table(void)
 {
 	struct linux_efi_memreserve *rsv;
@@ -156,13 +163,14 @@ efi_status_t efi_stub_common(efi_handle_t handle,
 			     char *cmdline_ptr)
 {
 	struct sysfb_display_info *dpy;
+	bool dpy_needs_free;
 	efi_status_t status;
 
 	status = check_platform_features();
 	if (status != EFI_SUCCESS)
 		return status;
 
-	dpy = setup_primary_display();
+	dpy = setup_primary_display(&dpy_needs_free);
 
 	efi_retrieve_eventlog();
 
@@ -182,7 +190,7 @@ efi_status_t efi_stub_common(efi_handle_t handle,
 
 	status = efi_boot_kernel(handle, image, image_addr, cmdline_ptr);
 
-	free_primary_display(dpy);
+	release_primary_display(dpy, dpy_needs_free);
 
 	return status;
 }
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index 979a21818cc1..1503ffb82903 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1176,8 +1176,8 @@ efi_enable_reset_attack_mitigation(void) { }
 
 void efi_retrieve_eventlog(void);
 
+struct sysfb_display_info *lookup_primary_display(bool *needs_free);
 struct sysfb_display_info *alloc_primary_display(void);
-struct sysfb_display_info *__alloc_primary_display(void);
 void free_primary_display(struct sysfb_display_info *dpy);
 
 void efi_cache_sync_image(unsigned long image_base,
diff --git a/drivers/firmware/efi/libstub/primary_display.c b/drivers/firmware/efi/libstub/primary_display.c
index cdaebab26514..34c54ac1e02a 100644
--- a/drivers/firmware/efi/libstub/primary_display.c
+++ b/drivers/firmware/efi/libstub/primary_display.c
@@ -7,24 +7,9 @@
 
 #include "efistub.h"
 
-/*
- * There are two ways of populating the core kernel's sysfb_primary_display
- * via the stub:
- *
- *   - using a configuration table, which relies on the EFI init code to
- *     locate the table and copy the contents; or
- *
- *   - by linking directly to the core kernel's copy of the global symbol.
- *
- * The latter is preferred because it makes the EFIFB earlycon available very
- * early, but it only works if the EFI stub is part of the core kernel image
- * itself. The zboot decompressor can only use the configuration table
- * approach.
- */
-
 static efi_guid_t primary_display_guid = LINUX_EFI_PRIMARY_DISPLAY_TABLE_GUID;
 
-struct sysfb_display_info *__alloc_primary_display(void)
+struct sysfb_display_info *alloc_primary_display(void)
 {
 	struct sysfb_display_info *dpy;
 	efi_status_t status;
diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
index 4b76f74c56da..c1fd1fdbcb08 100644
--- a/drivers/firmware/efi/libstub/zboot.c
+++ b/drivers/firmware/efi/libstub/zboot.c
@@ -26,9 +26,11 @@ void __weak efi_cache_sync_image(unsigned long image_base,
 	// executable code loaded into memory to be safe for execution.
 }
 
-struct sysfb_display_info *alloc_primary_display(void)
+struct sysfb_display_info *lookup_primary_display(bool *needs_free)
 {
-	return __alloc_primary_display();
+	*needs_free = true;
+
+	return alloc_primary_display();
 }
 
 asmlinkage efi_status_t __efiapi
-- 
2.51.1


