Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E69CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ziPpqwduV388Yf5YMTUeSFaZfiDPYjq1qBffCcxTkUI=; b=zmx5srLHcdf2u929y1xIiEzmdF
	qNwQCk9G4GzRddBGwcOWyeZDnGz524bem6YvaJcvu5wkpHSuJGNECufQ0gKIxY9XSBOIe3gCxQd51
	LDHHlJZP7ThEsh590HQ43aknEOg8kmeAKp89JCSTGHV5NblwcESu7nItW1jdoNODKybwNYKR+/u9e
	ERZkwK+d/xfupzzpxHUm4MU1OWt/KWlPQ6hmENQ5Y65fVeTEEXWOWaXQIRBpSQ6LNDXThhkb7EoFk
	7ndeo1xJSz7llA1q/LBaexFtCI22zWyqItZuPTIgD/U7oTxCCCG55FCH/OL4RYnXhX/7ddNlUzlcy
	0rMNf+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDIf-00000006dlL-0dn3;
	Fri, 09 Oct 2026 16:18:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDIb-00000006djw-2jfE
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 16:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ziPpqwduV388Yf5YMTUeSFaZfiDPYjq1qBffCcxTkUI=; b=cnmKHusQx1FppoztngcKXCwERp
	Y6RfKBwQnryWX1ecycvvfsq3xKveRvKuaG+3UtUpGctU3hTcphau4jAyrxirUrFP+XWR9w3OkZuE7
	hNMbExu4kf//LMFygrzqXpXEE/2pPjBT5rx7Q2WAzwvVb3ZtB20yUVppzFKRfZIhs05YuHuHaCrW4
	cFJPsbjqQPNN2MpLo582+izfAfeN4s+bC2rXpR3orv4MnoPRKBWG0bGl8DJqagE7a5eSIzffj4N6E
	GUKCaYc5rxUvRHfFnIKaHdhXC5eGATR56nX7c/XA2mkM+0louixb3JJuV2tdijgg1kKKnREjoAP58
	q5iZzrrg==;
Received: from smtp-out2.suse.de ([195.135.223.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFDIY-0000000BPAK-3nZw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:18:20 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BAFD91F7E3;
	Fri,  9 Oct 2026 16:18:16 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 639B313978;
	Fri,  9 Oct 2026 16:18:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +fTjLccTyWrkFwAAD6G6ig:T2
	(envelope-from <tzimmermann@suse.de>); Fri, 09 Oct 2026 16:18:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	adaplas@gmail.com,
	michal.simek@amd.com
Cc: linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/5] fbdev/au1100fb: Use FB blanking constants
Date: Fri,  9 Oct 2026 18:05:35 +0200
Message-ID: <20261009161814.120480-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161814.120480-1-tzimmermann@suse.de>
References: <20261009161814.120480-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spamd-Bar: /
X-Rspamd-Queue-Id: BAFD91F7E3
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.00 / 50.00]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_171819_051231_26ED5CD8 
X-CRM114-Status: GOOD (  13.28  )
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

Fbdev and its drivers use FB_BLANK constants for controlling the
display's blanking state. Semantics differ to similar VESA blanking
constants.

Replace the VESA constants in au1100fb with FB_BLANK.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/au1100fb.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 39f86ffb1ae3..6c375f389fbd 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -424,15 +424,15 @@ static int au1100fb_fb_blank(int blank_mode, struct fb_info *fbi)
 
 	switch (blank_mode) {
 
-	case VESA_NO_BLANKING:
+	case FB_BLANK_UNBLANK:
 		/* Turn on panel */
 		fbdev->regs->lcd_control |= LCD_CONTROL_GO;
 		wmb(); /* drain writebuffer */
 		break;
-
-	case VESA_VSYNC_SUSPEND:
-	case VESA_HSYNC_SUSPEND:
-	case VESA_POWERDOWN:
+	case FB_BLANK_NORMAL:
+	case FB_BLANK_VSYNC_SUSPEND:
+	case FB_BLANK_HSYNC_SUSPEND:
+	case FB_BLANK_POWERDOWN:
 		/* Turn off panel */
 		fbdev->regs->lcd_control &= ~LCD_CONTROL_GO;
 		wmb(); /* drain writebuffer */
@@ -539,7 +539,7 @@ static int au1100fb_setmode(struct au1100fb_device *fbdev)
 	/* Resume controller */
 	fbdev->regs->lcd_control |= LCD_CONTROL_GO;
 	mdelay(10);
-	au1100fb_fb_blank(VESA_NO_BLANKING, info);
+	au1100fb_fb_blank(FB_BLANK_UNBLANK, info);
 
 	return 0;
 }
@@ -856,7 +856,7 @@ static void au1100fb_drv_remove(struct platform_device *dev)
 	fbdev = platform_get_drvdata(dev);
 
 #if !defined(CONFIG_FRAMEBUFFER_CONSOLE) && defined(CONFIG_LOGO)
-	au1100fb_fb_blank(VESA_POWERDOWN, &fbdev->info);
+	au1100fb_fb_blank(FB_BLANK_POWERDOWN, &fbdev->info);
 #endif
 	fbdev->regs->lcd_control &= ~LCD_CONTROL_GO;
 
@@ -880,7 +880,7 @@ static int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
 		return 0;
 
 	/* Blank the LCD */
-	au1100fb_fb_blank(VESA_POWERDOWN, &fbdev->info);
+	au1100fb_fb_blank(FB_BLANK_POWERDOWN, &fbdev->info);
 
 	clk_disable(fbdev->lcdclk);
 
@@ -904,7 +904,7 @@ static int au1100fb_drv_resume(struct platform_device *dev)
 		return ret;
 
 	/* Unblank the LCD */
-	au1100fb_fb_blank(VESA_NO_BLANKING, &fbdev->info);
+	au1100fb_fb_blank(FB_BLANK_UNBLANK, &fbdev->info);
 
 	return 0;
 }
-- 
2.55.0


