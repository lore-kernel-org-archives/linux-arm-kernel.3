Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F02FD11184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63HXk2asPcR6HKGFSmIOTJlWneEzg1F4AZ9qPy2VUyc=; b=H/Ae5Gn1H+JhjQmOS/PP4PRSQh
	ehYq9aW91Tn9Vf9p7HheVAQhef6QWVv28BLEzkKf3VouywS1nomIhYJdcNPG1BPh3bx/2TwNpvOlX
	zSkP4zLq+JnQbAnVSWveAybSV1zA2pfr8nRK1KF4TBafozjS0LM+jgKKb0wkk8v8Un/CDO+IaK3gI
	gNBzGoEry7igYlBsQ+j7WQsK2xXolJVA7w8JovdDaDUgmApyNMPCyaug9If825UtRwW7hlOOJmuiw
	0VeAWUfx9bJQW8ZOHWw1NFqEburDtC7B6Y1G1Tp3YKFfDpAiQmO/JvLW99eEzcGv1zRTmqvrv1QBP
	jyBB5frg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOI4r-0000000FFG5-1hfG;
	Wed, 26 Nov 2025 16:09:09 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOI4o-0000000FFDa-3SqK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:09:08 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EB0005BE8D;
	Wed, 26 Nov 2025 16:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764173340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=63HXk2asPcR6HKGFSmIOTJlWneEzg1F4AZ9qPy2VUyc=;
	b=HNlHLdT4+ftHDfSGcOLmy/wgSh5PB0cIxN3PxYieoVKiFvyEg8LqW4ET/7i469pmj8Lj8r
	FFYRB2BMSM5Cjq6CIf+WPNeq6UfL04Jz+h3N19417jz3JnfrAY52w+MeBLNLemJLqAjoTl
	pID0na9X6myqM8n7YH+zioeY7M/kMQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764173340;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=63HXk2asPcR6HKGFSmIOTJlWneEzg1F4AZ9qPy2VUyc=;
	b=BtXYUld8tzzkYVjOlVGH33TFv6Kfv0PQxIUS+XyuDDZpunpaFqz3IKfrOFfn5OCn5VAeEF
	OOtQyrTU0ueFv8Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EyCENnQs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="x1rd6/pA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764173339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=63HXk2asPcR6HKGFSmIOTJlWneEzg1F4AZ9qPy2VUyc=;
	b=EyCENnQsl8ql14ma1fvIBorWD44yIEHI8lT/qCunnUIaRK1Ao+djFjva9osjmJ1wh7q49T
	46MPz3orf+H4x0zBFul1vfD9JsUmomlTSyzC/+g+duBwOe0GRJaZFyKigWcDkFEhhFI+MS
	MEdpWIq3AQR5UNvOlmCX8bmiicagCc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764173339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=63HXk2asPcR6HKGFSmIOTJlWneEzg1F4AZ9qPy2VUyc=;
	b=x1rd6/pAixjpIpLzme3cxM2k/UuYVXhrQrtn+ltzf+fRuYOB2bhlwpUamTWylLS2vhJrV5
	o3i4EkgeCsw7HDBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7CDC83EA65;
	Wed, 26 Nov 2025 16:08:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SHoMHRsmJ2lnIgAAD6G6ig
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
Subject: [PATCH v3 1/9] efi: earlycon: Reduce number of references to global screen_info
Date: Wed, 26 Nov 2025 17:03:18 +0100
Message-ID: <20251126160854.553077-2-tzimmermann@suse.de>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLtfyjk8sg4x43ngtem9djprcp)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: EB0005BE8D
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_080907_005869_0C535C90 
X-CRM114-Status: GOOD (  17.03  )
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

v2:
- fix coding style

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Richard Lyu <richard.lyu@suse.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/earlycon.c | 40 ++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/efi/earlycon.c b/drivers/firmware/efi/earlycon.c
index d18a1a5de144..42e3a173dac1 100644
--- a/drivers/firmware/efi/earlycon.c
+++ b/drivers/firmware/efi/earlycon.c
@@ -32,12 +32,13 @@ static void *efi_fb;
  */
 static int __init efi_earlycon_remap_fb(void)
 {
+	const struct screen_info *si = &screen_info;
+
 	/* bail if there is no bootconsole or it was unregistered already */
 	if (!earlycon_console || !console_is_registered(earlycon_console))
 		return 0;
 
-	efi_fb = memremap(fb_base, screen_info.lfb_size,
-			  fb_wb ? MEMREMAP_WB : MEMREMAP_WC);
+	efi_fb = memremap(fb_base, si->lfb_size, fb_wb ? MEMREMAP_WB : MEMREMAP_WC);
 
 	return efi_fb ? 0 : -ENOMEM;
 }
@@ -71,12 +72,12 @@ static __ref void efi_earlycon_unmap(void *addr, unsigned long len)
 	early_memunmap(addr, len);
 }
 
-static void efi_earlycon_clear_scanline(unsigned int y)
+static void efi_earlycon_clear_scanline(unsigned int y, const struct screen_info *si)
 {
 	unsigned long *dst;
 	u16 len;
 
-	len = screen_info.lfb_linelength;
+	len = si->lfb_linelength;
 	dst = efi_earlycon_map(y*len, len);
 	if (!dst)
 		return;
@@ -85,7 +86,7 @@ static void efi_earlycon_clear_scanline(unsigned int y)
 	efi_earlycon_unmap(dst, len);
 }
 
-static void efi_earlycon_scroll_up(void)
+static void efi_earlycon_scroll_up(const struct screen_info *si)
 {
 	unsigned long *dst, *src;
 	u16 maxlen = 0;
@@ -99,8 +100,8 @@ static void efi_earlycon_scroll_up(void)
 	}
 	maxlen *= 4;
 
-	len = screen_info.lfb_linelength;
-	height = screen_info.lfb_height;
+	len = si->lfb_linelength;
+	height = si->lfb_height;
 
 	for (i = 0; i < height - font->height; i++) {
 		dst = efi_earlycon_map(i*len, len);
@@ -120,7 +121,8 @@ static void efi_earlycon_scroll_up(void)
 	}
 }
 
-static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h)
+static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h,
+				    const struct screen_info *si)
 {
 	const u32 color_black = 0x00000000;
 	const u32 color_white = 0x00ffffff;
@@ -145,13 +147,12 @@ static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h)
 static void
 efi_earlycon_write(struct console *con, const char *str, unsigned int num)
 {
-	struct screen_info *si;
+	const struct screen_info *si = &screen_info;
 	u32 cur_efi_x = efi_x;
 	unsigned int len;
 	const char *s;
 	void *dst;
 
-	si = &screen_info;
 	len = si->lfb_linelength;
 
 	while (num) {
@@ -174,7 +175,7 @@ efi_earlycon_write(struct console *con, const char *str, unsigned int num)
 			x = efi_x;
 
 			while (n-- > 0) {
-				efi_earlycon_write_char(dst + x*4, *s, h);
+				efi_earlycon_write_char(dst + x * 4, *s, h, si);
 				x += font->width;
 				s++;
 			}
@@ -207,10 +208,10 @@ efi_earlycon_write(struct console *con, const char *str, unsigned int num)
 			cur_line_y = (cur_line_y + 1) % max_line_y;
 
 			efi_y -= font->height;
-			efi_earlycon_scroll_up();
+			efi_earlycon_scroll_up(si);
 
 			for (i = 0; i < font->height; i++)
-				efi_earlycon_clear_scanline(efi_y + i);
+				efi_earlycon_clear_scanline(efi_y + i, si);
 		}
 	}
 }
@@ -226,22 +227,21 @@ void __init efi_earlycon_reprobe(void)
 static int __init efi_earlycon_setup(struct earlycon_device *device,
 				     const char *opt)
 {
-	struct screen_info *si;
+	const struct screen_info *si = &screen_info;
 	u16 xres, yres;
 	u32 i;
 
 	fb_wb = opt && !strcmp(opt, "ram");
 
-	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI) {
+	if (si->orig_video_isVGA != VIDEO_TYPE_EFI) {
 		fb_probed = true;
 		return -ENODEV;
 	}
 
-	fb_base = screen_info.lfb_base;
-	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-		fb_base |= (u64)screen_info.ext_lfb_base << 32;
+	fb_base = si->lfb_base;
+	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
+		fb_base |= (u64)si->ext_lfb_base << 32;
 
-	si = &screen_info;
 	xres = si->lfb_width;
 	yres = si->lfb_height;
 
@@ -266,7 +266,7 @@ static int __init efi_earlycon_setup(struct earlycon_device *device,
 
 	efi_y -= font->height;
 	for (i = 0; i < (yres - efi_y) / font->height; i++)
-		efi_earlycon_scroll_up();
+		efi_earlycon_scroll_up(si);
 
 	device->con->write = efi_earlycon_write;
 	earlycon_console = device->con;
-- 
2.51.1


