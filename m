Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAB7C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 09:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OR3V0M3UkZrWg4zgWBIPGNB/5nFZ8enXp7456gTPkOI=; b=De9mgq9tLe6CADkPpds2SrYc4D
	wKEgv4xDLruiD/ZHaJqg7SaP/jT8AiAgik4jLdZCovplw0KDf47oxyaHwcUMS/yXx7XFAtUbNagDr
	4YLkVrzXEWFOwW7P+4BTMIaGm/F7Aw6HF8Afc2btrbV8TGE/DT/iw3MNjKaRndjl3GCMA0aWJACri
	wNclfN1FM8F7Msv78TWr1OLl45Xeu4FTMqXsfcf/ob+uqIoeT6JFfz++afHoxwc4FxpisdpvstKF4
	3Jj+le9VrDKkibP9hONzLUNg638DYVc34Dzp/QWt8LmDwW2DWcICgR1b427Q+bO0UjaANKMWzXVgb
	kxNJWokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPe9p-0000000Co36-0mkD;
	Thu, 12 Jun 2025 09:23:37 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdBx-0000000CbRq-3qod
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:21:47 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B10E21F7ED;
	Thu, 12 Jun 2025 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OR3V0M3UkZrWg4zgWBIPGNB/5nFZ8enXp7456gTPkOI=;
	b=Jgh/WIQ3Br998E58v7FiT37BePDgKgfiPs8sB3WuAWqDCe9XxOE5ieP+DqGp5SShSZPJic
	SOxo9OlfCkgGOSu9N9sVgB1i4b/DRN50NDz5VRgMFihzOCauuHBjPWlLfZW5rT7ZTiuR8Z
	O6A/FZMiKfMHZkVOtG6wNML1WfIHXL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OR3V0M3UkZrWg4zgWBIPGNB/5nFZ8enXp7456gTPkOI=;
	b=lYpe0EtBizhg6snUfdSWOSBO6KwmN9h6s308NmCyV9AH+bW14JcBzYYk1AD0t5sgoPZO1m
	G4jYCWWJAO0drrBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OR3V0M3UkZrWg4zgWBIPGNB/5nFZ8enXp7456gTPkOI=;
	b=Jgh/WIQ3Br998E58v7FiT37BePDgKgfiPs8sB3WuAWqDCe9XxOE5ieP+DqGp5SShSZPJic
	SOxo9OlfCkgGOSu9N9sVgB1i4b/DRN50NDz5VRgMFihzOCauuHBjPWlLfZW5rT7ZTiuR8Z
	O6A/FZMiKfMHZkVOtG6wNML1WfIHXL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OR3V0M3UkZrWg4zgWBIPGNB/5nFZ8enXp7456gTPkOI=;
	b=lYpe0EtBizhg6snUfdSWOSBO6KwmN9h6s308NmCyV9AH+bW14JcBzYYk1AD0t5sgoPZO1m
	G4jYCWWJAO0drrBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C191132D8;
	Thu, 12 Jun 2025 08:21:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EH8aFQaOSmgILAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 08:21:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	soci@c64.rulez.org,
	simona@ffwll.ch,
	linux@armlinux.org.uk,
	FlorianSchandinat@gmx.de,
	alchark@gmail.com,
	krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 04/14] fbdev/cyber2000fb: Unexport symbols
Date: Thu, 12 Jun 2025 10:16:27 +0200
Message-ID: <20250612081738.197826-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612081738.197826-1-tzimmermann@suse.de>
References: <20250612081738.197826-1-tzimmermann@suse.de>
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,armlinux.org.uk,gmail.com,kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_012146_096294_211744BB 
X-CRM114-Status: GOOD (  11.98  )
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

Fix the compile-time warning

  drivers/video/fbdev/cyber2000fb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

The affected symbols are not used anywhere, so remove the functions
entirely.

v2:
- remove unused functions (Helge)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/cyber2000fb.c | 36 -------------------------------
 drivers/video/fbdev/cyber2000fb.h |  2 --
 2 files changed, 38 deletions(-)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 986760b90465..5cb5ee517f81 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1089,7 +1089,6 @@ void cyber2000fb_enable_extregs(struct cfb_info *cfb)
 		cyber2000_grphw(EXT_FUNC_CTL, old, cfb);
 	}
 }
-EXPORT_SYMBOL(cyber2000fb_enable_extregs);
 
 /*
  * Disable access to the extended registers
@@ -1109,41 +1108,6 @@ void cyber2000fb_disable_extregs(struct cfb_info *cfb)
 	else
 		cfb->func_use_count -= 1;
 }
-EXPORT_SYMBOL(cyber2000fb_disable_extregs);
-
-/*
- * Attach a capture/tv driver to the core CyberX0X0 driver.
- */
-int cyber2000fb_attach(struct cyberpro_info *info, int idx)
-{
-	if (int_cfb_info != NULL) {
-		info->dev	      = int_cfb_info->fb.device;
-#ifdef CONFIG_FB_CYBER2000_I2C
-		info->i2c	      = &int_cfb_info->i2c_adapter;
-#else
-		info->i2c	      = NULL;
-#endif
-		info->regs	      = int_cfb_info->regs;
-		info->irq             = int_cfb_info->irq;
-		info->fb	      = int_cfb_info->fb.screen_base;
-		info->fb_size	      = int_cfb_info->fb.fix.smem_len;
-		info->info	      = int_cfb_info;
-
-		strscpy(info->dev_name, int_cfb_info->fb.fix.id,
-			sizeof(info->dev_name));
-	}
-
-	return int_cfb_info != NULL;
-}
-EXPORT_SYMBOL(cyber2000fb_attach);
-
-/*
- * Detach a capture/tv driver from the core CyberX0X0 driver.
- */
-void cyber2000fb_detach(int idx)
-{
-}
-EXPORT_SYMBOL(cyber2000fb_detach);
 
 #ifdef CONFIG_FB_CYBER2000_DDC
 
diff --git a/drivers/video/fbdev/cyber2000fb.h b/drivers/video/fbdev/cyber2000fb.h
index 04641aa13acc..21095df8fdb0 100644
--- a/drivers/video/fbdev/cyber2000fb.h
+++ b/drivers/video/fbdev/cyber2000fb.h
@@ -488,7 +488,5 @@ struct cyberpro_info {
  * Note! Writing to the Cyber20x0 registers from an interrupt
  * routine is definitely a bad idea atm.
  */
-int cyber2000fb_attach(struct cyberpro_info *info, int idx);
-void cyber2000fb_detach(int idx);
 void cyber2000fb_enable_extregs(struct cfb_info *cfb);
 void cyber2000fb_disable_extregs(struct cfb_info *cfb);
-- 
2.49.0


