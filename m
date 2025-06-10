Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE66C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 11:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6G4IDIDNKFIlIZgpoCkC+PXCI41saXphXc1w6SdcOU=; b=ave9/SVFEgYpb+A+Vp8pMPk13X
	4QTJD8UrAMFi7JEmnBOoTbQzMoPPXd7NvTWb//ie6ZmWeYU6jubs8qzzBzvRjdzvGlO1ktBpEcYFx
	HhR0Svqe4tbvQY0ZINCMDH3xurDxVnlMxU3RqfZhZxJbP8vwWzlRJJeoi1ws509XsbY+vLw0UrHkS
	aYYHwbZpyRsA4xYLoDPuo4QPp34gsIKgWawtOwFJZ7O6AWdBkjtcd/fMeNlVFlyGyiq44yxg8tERp
	3rFtn0U9ORbSY8EVrHpN9QTd2zrWCW43XgFUbg0GpKbR+wJcu5AAof1PNMMb44ov3w+Pf8dR4M6fX
	xEVy4Lwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxFQ-00000006eeV-1KxO;
	Tue, 10 Jun 2025 11:34:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwlU-00000006bZb-1Y9G
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 11:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=B6G4IDIDNKFIlIZgpoCkC+PXCI41saXphXc1w6SdcOU=; b=mAw/+Sn8mSU/tr3uh8Y9wE/zSF
	8f3lzMLJQB9rlvCd96phJ6h8WVHdo5Fi0I2x4TerhAcV1duabtBvU25nkb1w4kZDKMA4L1aDuRAiA
	LYTVYRvyEyCz9jAcwerK1EG1qOzDxOMS03uGuh1CnS+UC5ZZHCjk/eFzTfwL1OF2ucK+EfySyyieg
	pULDLEpkoKIEX5Ax0btsS+OOkMQCCTUH4CRnTRwW0v2Y7qm0vUbxSHhB4Hqik5y7Bpln8+me61ram
	YCC07c/iMjoO6VvB9MHIXeVbqV0WvUyvDqT9kJPSgjRvuKmP6uH305Wk2jZkwtEmmKpdk9YsoNB5o
	WKppZfhQ==;
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwlR-00000001ln6-496R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 11:03:35 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AF77B211D1;
	Tue, 10 Jun 2025 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6G4IDIDNKFIlIZgpoCkC+PXCI41saXphXc1w6SdcOU=;
	b=b6UxFmg38AbXz4g1qm7BgBI0PAL2NgSHJ5LJkAOX1gZH9xgxn/avIQh/8yAAaIMUYeUjwY
	0x69A7tp1WYJgjd1ORM/lL9K5+90N2ceP3AUOXhMWMD+WBokO/sfyRqMWmVzEbzcYwoYqH
	TI3IiEXJ6fPpX5TXN2ghhyz4GoD+jkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6G4IDIDNKFIlIZgpoCkC+PXCI41saXphXc1w6SdcOU=;
	b=fu8SklUalOzO6Tu2Zdynp4px4puRTCU94T+CuD3dXNIzX/GdTT9YIyCsZkkHC/FRlpQgsk
	zNa8VA46w0gKMcDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=b6UxFmg3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fu8SklUa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6G4IDIDNKFIlIZgpoCkC+PXCI41saXphXc1w6SdcOU=;
	b=b6UxFmg38AbXz4g1qm7BgBI0PAL2NgSHJ5LJkAOX1gZH9xgxn/avIQh/8yAAaIMUYeUjwY
	0x69A7tp1WYJgjd1ORM/lL9K5+90N2ceP3AUOXhMWMD+WBokO/sfyRqMWmVzEbzcYwoYqH
	TI3IiEXJ6fPpX5TXN2ghhyz4GoD+jkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6G4IDIDNKFIlIZgpoCkC+PXCI41saXphXc1w6SdcOU=;
	b=fu8SklUalOzO6Tu2Zdynp4px4puRTCU94T+CuD3dXNIzX/GdTT9YIyCsZkkHC/FRlpQgsk
	zNa8VA46w0gKMcDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5931213964;
	Tue, 10 Jun 2025 11:03:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OKicFPwQSGgOTAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	soci@c64.rulez.org,
	simona@ffwll.ch,
	jayalk@intworks.biz,
	linux@armlinux.org.uk,
	FlorianSchandinat@gmx.de,
	alchark@gmail.com,
	krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/14] fbdev/cyber2000fb: Unexport symbols
Date: Tue, 10 Jun 2025 12:56:37 +0200
Message-ID: <20250610105948.384540-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610105948.384540-1-tzimmermann@suse.de>
References: <20250610105948.384540-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AF77B211D1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,intworks.biz,armlinux.org.uk,gmail.com,kernel.org];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLwqwbgho3bgbo9wb3ecq1qfng)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_120334_179233_9B451B47 
X-CRM114-Status: GOOD (  11.35  )
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

The affected symbols are not used outside of their module.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/cyber2000fb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 986760b90465..fcc565b2d98c 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1089,7 +1089,6 @@ void cyber2000fb_enable_extregs(struct cfb_info *cfb)
 		cyber2000_grphw(EXT_FUNC_CTL, old, cfb);
 	}
 }
-EXPORT_SYMBOL(cyber2000fb_enable_extregs);
 
 /*
  * Disable access to the extended registers
@@ -1109,7 +1108,6 @@ void cyber2000fb_disable_extregs(struct cfb_info *cfb)
 	else
 		cfb->func_use_count -= 1;
 }
-EXPORT_SYMBOL(cyber2000fb_disable_extregs);
 
 /*
  * Attach a capture/tv driver to the core CyberX0X0 driver.
@@ -1135,7 +1133,6 @@ int cyber2000fb_attach(struct cyberpro_info *info, int idx)
 
 	return int_cfb_info != NULL;
 }
-EXPORT_SYMBOL(cyber2000fb_attach);
 
 /*
  * Detach a capture/tv driver from the core CyberX0X0 driver.
@@ -1143,7 +1140,6 @@ EXPORT_SYMBOL(cyber2000fb_attach);
 void cyber2000fb_detach(int idx)
 {
 }
-EXPORT_SYMBOL(cyber2000fb_detach);
 
 #ifdef CONFIG_FB_CYBER2000_DDC
 
-- 
2.49.0


