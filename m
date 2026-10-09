Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902B0CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEM6CoKwh+Zxjv7gACb2b7iDu7hodKVS46Gs0AyF4Yk=; b=ofYFciURc0QD0e4BrYo0Cq/IV9
	fEY+IJOg8+4ipYAJkIDvTosxLkF4Mxr7fU/h9zx8GQrmg31AfYZkk7VB0A7PuvJoRKu4C9xRloWNW
	0sPK6PeImt/hQ7YvLfDN/eU9lEZmD2Ak6EHEn+dP4J/u2B0TU3K+o6WrbSFsPSkEZDycT5un8lQYp
	xu1lLfZYzAGKXLaEj6fg2eAQ3hhZMfQovNBwFgOrqlGoAzYGxE1dZlJSgIHv0s9KtTq7CiCNRtPVj
	/wzaDNlmDX2HdXdCpM+epNL/r1c+YfareFqBKTXjL6DhYRoKN052XGyK/Y4gRnmKLFT5YnHvQgNiy
	zZ/E8LRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDIy-00000006dsD-2YPs;
	Fri, 09 Oct 2026 16:18:44 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDIp-00000006do9-3BjX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:18:43 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8824721C28;
	Fri,  9 Oct 2026 16:18:17 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 342A11368B;
	Fri,  9 Oct 2026 16:18:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +fTjLccTyWrkFwAAD6G6ig:T5
	(envelope-from <tzimmermann@suse.de>); Fri, 09 Oct 2026 16:18:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	adaplas@gmail.com,
	michal.simek@amd.com
Cc: linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/5] fbdev/platinumfb: Use FB blanking constants
Date: Fri,  9 Oct 2026 18:05:38 +0200
Message-ID: <20261009161814.120480-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161814.120480-1-tzimmermann@suse.de>
References: <20261009161814.120480-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 8824721C28
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.00 / 50.00]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_091835_957438_604ABD90 
X-CRM114-Status: GOOD (  13.98  )
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

Replace the VESA constants with FB_BLANK in platinumfb. The VESA
constants can be interpreted bitwise, while the FB_BLANK constants
can not. Therefore turn the bit tests in an if-else sequence that
handles the individual cases. By default, the display is unblanked.

The modified code is within a comment block, so it will not run. I
still changed it to keep the driver up to standard. This might also
resolve the nearby TODO comment on incorrect hardware blanking.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/platinumfb.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/platinumfb.c b/drivers/video/fbdev/platinumfb.c
index 81fdaa3541db..b55a7b70d31d 100644
--- a/drivers/video/fbdev/platinumfb.c
+++ b/drivers/video/fbdev/platinumfb.c
@@ -167,10 +167,12 @@ static int platinumfb_blank(int blank,  struct fb_info *fb)
 	ctrl = le32_to_cpup(&info->platinum_regs->ctrl.r) | 0x33;
 	if (blank)
 		--blank_mode;
-	if (blank & VESA_VSYNC_SUSPEND)
-		ctrl &= ~3;
-	if (blank & VESA_HSYNC_SUSPEND)
+	if (blank == FB_BLANK_VSYNC_SUSPEND)
+		ctrl &= ~0x03;
+	else if (blank == FB_BLANK_HSYNC_SUSPEND)
 		ctrl &= ~0x30;
+	else if (blank == FB_BLANK_POWERDOWN)
+		ctrl &= ~0x33;
 	out_le32(&info->platinum_regs->ctrl.r, ctrl);
 */
 /* TODO: Figure out how the heck to powerdown this thing! */
-- 
2.55.0


