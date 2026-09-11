Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F1FC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gROToXlK8SjdMBn2SBlcMsgteVlZQArVpFSxxwGrkhg=; b=WDUsHRjXTMfbbXloNFVwZ9lZZl
	GN0BsGTYi/EDvL6qnDr3BEjznYhbZkINjbk+aBfdNhcv72y5i0bY+K63c0hz12QDEFHvDuMba7HmR
	KbW/yRpcv1ImIKb7zpAf7Frb9Lw5BY2v6J/6PQjTCb10Tg017MFjbzCvSCrOd3dBHGIeTpbaZWI1o
	eOg6g7ulqlywtrp+GmpcXQFsgFR37+iN4CjwIP1WiHysviJGs6pmNd3CDI7yIUjAW8nvXQG5eY3Xm
	sIQaHTM4Za/4R5/82xcXuIx5BEAiOT5SVCrzwAJgq9m/FDaT4GeHs8m0VKQPDLNZXYEQlPIGbQ+y5
	unUN5fwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50eg-0000000GfNo-1jNE;
	Fri, 11 Sep 2026 12:46:58 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50eY-0000000GfFy-2r3S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:46:54 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4845721D47;
	Fri, 11 Sep 2026 12:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789130755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gROToXlK8SjdMBn2SBlcMsgteVlZQArVpFSxxwGrkhg=;
	b=rLLT+MHDTOOLzGNZKKkC04iB2JjCF+hb85N1F+6vQLTLiS7wytyenutZ1yb/yoq6hx/oFy
	1wqkjR5RX9CGxw+gc/nawySRoggV3cUtHhqierNvn0KfT6r9ZOVHMGh9j2ZQQJyRWjm/Ff
	mZ2xggmMbvEbseJmtnh4yXfeJlzOHJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789130755;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gROToXlK8SjdMBn2SBlcMsgteVlZQArVpFSxxwGrkhg=;
	b=HCXUvaoitZXsStgV2D0dDtdr96rIzeeeWWH/9oTOiEUIoZXkoaCj8SZGLSbJAweuqYpsx3
	y7nDML4RlZbWrJDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789130751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gROToXlK8SjdMBn2SBlcMsgteVlZQArVpFSxxwGrkhg=;
	b=r0Se8txcomoz1NFdbI/gUovNBxMyRh9gc258G+lFQRHT1VV40xbmmu9L6wO/ToRoyIXNgR
	FNJfYOeEOsKyVpv3F7o0+9u7nGkaHrZUxyWuTzyIJe0SLoCgj+HPjs8s0UEDn0zjzYKafD
	LbmiQskibbabQFDLthMWOXzoWHLsg6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789130751;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gROToXlK8SjdMBn2SBlcMsgteVlZQArVpFSxxwGrkhg=;
	b=Tpo9UnOabfghU9gXBmXTIuR1NOzDd++YS7BWyAmko+9vgbSMcVDZZv7XZaXoH5+4VvHUrj
	Q+aDCg5gwy6+bCAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BBFE13865;
	Fri, 11 Sep 2026 12:45:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4CIZEf33o2r8EQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 11 Sep 2026 12:45:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	geert@linux-m68k.org,
	rdunlap@infradead.org
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	virtualization@lists.linux.dev,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 07/14] drm/panic: Return from screen_user if display is too small
Date: Fri, 11 Sep 2026 14:44:00 +0200
Message-ID: <20260911124540.279841-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911124540.279841-1-tzimmermann@suse.de>
References: <20260911124540.279841-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,linux.intel.com,kernel.org,linux-m68k.org,infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLhthb38qh1ntkuzcrgoc19dwi)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_054653_254635_17CF4791 
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

Return an error if the display is too small to display at least a
single character. If the panic handler cannot display any message
it does at least not destroy the current output, which might help
with identifying the problem.

v4:
- also check font height against scanout buffer (Jocelyn)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index f597ef04c5bc..b1cd5e5865a0 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -486,7 +486,7 @@ static int draw_panic_screen_user(struct drm_scanout_buffer *sb, u32 fg_color, u
 	struct drm_rect r_screen, r_logo, r_msg;
 	unsigned int msg_width, msg_height;
 
-	if (!font)
+	if (!font || font->width > sb->width || font->height > sb->height)
 		return -EINVAL;
 
 	fg_color = drm_draw_color_from_xrgb8888(fg_color, sb->format->format);
@@ -560,7 +560,7 @@ static int draw_panic_screen_kmsg(struct drm_scanout_buffer *sb, u32 fg_color, u
 	struct drm_panic_line line;
 	int yoffset;
 
-	if (!font || font->width > sb->width)
+	if (!font || font->width > sb->width || font->height > sb->height)
 		return -EINVAL;
 
 	fg_color = drm_draw_color_from_xrgb8888(fg_color, sb->format->format);
-- 
2.55.0


