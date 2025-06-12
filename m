Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14191C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 09:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmVFMpP/GXhbKkpqKG2hAByJ9KsDa77YqgOJGdOJMdM=; b=YQ95HZbcdnynz4hEvKjSro4uzz
	fZz4dZ1SWWQueWRDaNbOv4oAif19LBX9dtVzoKlbSoB+J63Xp3mrnSb805N7wDtoWIacKi7rLxlKg
	8Jydf/Xq3KWK83niKr5mWU1esUE36eQSXADpusQq8EXC7CrCKLwisqqBlkqmVWHvtM8PrZvGc6aqT
	qBSoeT29jSrRw94ODXMXt3Ssba8uyZmY+8f+KK5nrMPXb4pdAtAl//7ntgLaItp5Yz5xdcELyuLVF
	Y3Z1IROe8LbG2qGQInlMoo7kxbbmq2fbrtuFp4jWZewLGdWHXv8z17IQzIIUYw33W1aSgg4YVqC3p
	bSDd4pCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPeIB-0000000CoxH-0484;
	Thu, 12 Jun 2025 09:32:15 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdCI-0000000Cbad-1tbW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:22:07 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5A4591F851;
	Thu, 12 Jun 2025 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmVFMpP/GXhbKkpqKG2hAByJ9KsDa77YqgOJGdOJMdM=;
	b=aadpD+mfu4t3O18+k/qB35yjQFiEdM9g178HbSwZRR/K3ixa/ICo+hwgcdxoBnORKOLnhc
	MtcZxPqUPhZ1tUGYX/Qm/6xqHvJSHBOM17iY0ivwRcXsqSV4OIKLGXwyo9k04iA2j41Z/b
	1L9L2omsVpRcPGw1ij1aZ2gvrPjYOV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmVFMpP/GXhbKkpqKG2hAByJ9KsDa77YqgOJGdOJMdM=;
	b=xAG0w6Izo5gUZ7AC4VSNprmMHLxsSv5dGwLWeBQjS8ExhdZPpX1Nvel+e67//z0CEYCzlC
	PD066QSQCesRNTBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmVFMpP/GXhbKkpqKG2hAByJ9KsDa77YqgOJGdOJMdM=;
	b=aadpD+mfu4t3O18+k/qB35yjQFiEdM9g178HbSwZRR/K3ixa/ICo+hwgcdxoBnORKOLnhc
	MtcZxPqUPhZ1tUGYX/Qm/6xqHvJSHBOM17iY0ivwRcXsqSV4OIKLGXwyo9k04iA2j41Z/b
	1L9L2omsVpRcPGw1ij1aZ2gvrPjYOV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmVFMpP/GXhbKkpqKG2hAByJ9KsDa77YqgOJGdOJMdM=;
	b=xAG0w6Izo5gUZ7AC4VSNprmMHLxsSv5dGwLWeBQjS8ExhdZPpX1Nvel+e67//z0CEYCzlC
	PD066QSQCesRNTBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 06E0613A6D;
	Thu, 12 Jun 2025 08:21:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8OxPAAmOSmgILAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 08:21:29 +0000
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
Subject: [PATCH v2 11/14] fbdev/pxafb: Unexport symbol
Date: Thu, 12 Jun 2025 10:16:34 +0200
Message-ID: <20250612081738.197826-12-tzimmermann@suse.de>
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
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,armlinux.org.uk,gmail.com,kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLeer19tzumyaughgdh7h6uhe9)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_012206_627795_219D7676 
X-CRM114-Status: GOOD (  14.89  )
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

  drivers/video/fbdev/pxafb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

The affected symbol is not used anywhere, so remove the function
entirely.

v2:
- remove unused functions (Helge)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/pxafb.c               | 17 ++---------------
 include/linux/platform_data/video-pxafb.h |  1 -
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index ee6da5084242..baf87f34cc24 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -1030,9 +1030,8 @@ static inline unsigned int get_pcd(struct pxafb_info *fbi,
 
 /*
  * Some touchscreens need hsync information from the video driver to
- * function correctly. We export it here.  Note that 'hsync_time' and
- * the value returned from pxafb_get_hsync_time() is the *reciprocal*
- * of the hsync period in seconds.
+ * function correctly. We export it here.  Note that 'hsync_time' is
+ * the *reciprocal* of the hsync period in seconds.
  */
 static inline void set_hsync_time(struct pxafb_info *fbi, unsigned int pcd)
 {
@@ -1048,18 +1047,6 @@ static inline void set_hsync_time(struct pxafb_info *fbi, unsigned int pcd)
 	fbi->hsync_time = htime;
 }
 
-unsigned long pxafb_get_hsync_time(struct device *dev)
-{
-	struct pxafb_info *fbi = dev_get_drvdata(dev);
-
-	/* If display is blanked/suspended, hsync isn't active */
-	if (!fbi || (fbi->state != C_ENABLE))
-		return 0;
-
-	return fbi->hsync_time;
-}
-EXPORT_SYMBOL(pxafb_get_hsync_time);
-
 static int setup_frame_dma(struct pxafb_info *fbi, int dma, int pal,
 			   unsigned long start, size_t size)
 {
diff --git a/include/linux/platform_data/video-pxafb.h b/include/linux/platform_data/video-pxafb.h
index 6333bac166a5..38c24c77ba43 100644
--- a/include/linux/platform_data/video-pxafb.h
+++ b/include/linux/platform_data/video-pxafb.h
@@ -150,7 +150,6 @@ struct pxafb_mach_info {
 };
 
 void pxa_set_fb_info(struct device *, struct pxafb_mach_info *);
-unsigned long pxafb_get_hsync_time(struct device *dev);
 
 /* smartpanel related */
 #define SMART_CMD_A0			 (0x1 << 8)
-- 
2.49.0


