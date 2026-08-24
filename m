Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B4BC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 12:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnvK6SDSqRaczPeuHNPtlErQ77C4BU5i8ISwXQWL8II=; b=l7LvRzFuh9I7jnLlIl5rBDdcyh
	J8Lr4K1rlV+HxnpT1E1raA2CRo2OBr5bUc8eucykdNaiIjc8o35+aKgxcoIxYWnu8TnGliziCNtGX
	Q77+6n9img0X4QqyIrjv5WBjN0VRnkJkSuV9uFCrdnH/Fg4W2UZQPwalwEc9FsHooSfQBLAwXw54n
	xWs7SpENVd2hXH7xMp8kfRAQWfztuI0sTYYmo33UzmWhtBvkqVtRjBnKX6+k/8/GC1wjucLhlpgnD
	aQmkau1o9maDSUoJN2XbuLIuFizxOuJPgxsvDSJuZZxPRcOAYBB+OhbCPQf4DF1q8IomqPLSRMRv1
	Qz9Z/pmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUAW-0000000GdP1-2FLq;
	Mon, 24 Aug 2026 12:52:52 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUAS-0000000GdLc-27oS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 12:52:51 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 73A418687F;
	Mon, 24 Aug 2026 12:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787575935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnvK6SDSqRaczPeuHNPtlErQ77C4BU5i8ISwXQWL8II=;
	b=P9t+DtadulI1oue0GnNO0Ql2H7mlotkFsuUVB6B/qgoCtFsa5Cr5faO1a5ioFl1F3N2dxq
	cRXOixzBM6PiwkZ6mpj/ZZd7UDoRN/oE23GYYuzVhgQYxB7FjqGJ51Oa0PJOURASp70UOv
	FLRVDU7cah4n4iNab2WK9cUGsToIANA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787575935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnvK6SDSqRaczPeuHNPtlErQ77C4BU5i8ISwXQWL8II=;
	b=vjbUTsJ6Gl4XVS7/2WK6IwWYNZHKQV1+bVUX3k9I2RgaVB6T7LXnZbC1CiGSruwI5FHb2p
	SSlo/u+IyKNMrgAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787575931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnvK6SDSqRaczPeuHNPtlErQ77C4BU5i8ISwXQWL8II=;
	b=GTegslBRuabet5LRB5k4RBcM5Oj8dViIWKBDgdW1/auSgWtdFnele0OWr5SOVeX2Fzk1iA
	CfQxgmCLtowXd18Xfuz45hdeuaFTcOsdti3xORaA1NFL2kbC+us92SVUmSHpcDk9WaxhU5
	ky94QOgLLpGQqcdGBzhElF2c2SBMn9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787575931;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnvK6SDSqRaczPeuHNPtlErQ77C4BU5i8ISwXQWL8II=;
	b=8G2yBA/jvQsxZH51NwZCCYszke9hE/Ec0iPpC8wivAdkte51tRwl7WfUsBZlwAKKs699Hk
	LEitt7vQplX6XABw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 547D5133D1;
	Mon, 24 Aug 2026 12:52:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +DNIE3c+jGpyNwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 24 Aug 2026 12:52:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
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
Subject: [PATCH v2 03/13] drm/panic: Return -EINVAL if font is not available
Date: Mon, 24 Aug 2026 14:43:34 +0200
Message-ID: <20260824125201.218863-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824125201.218863-1-tzimmermann@suse.de>
References: <20260824125201.218863-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
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
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,linux-m68k.org,infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_055248_722278_1F2C17B8 
X-CRM114-Status: GOOD (  11.55  )
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

Font lookup does not allocate memory. Hence reporting ENOMEM on
failed lookups is misleading. Report EINVAL instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index d28ce8878e05..62490d32019c 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -751,8 +751,10 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
 	int qr_width, qr_canvas_width, qr_pitch, v_margin;
 	u8 *qr_image;
 
-	if (!font || !qrbuf1 || !qrbuf2 || !stream.workspace)
+	if (!qrbuf1 || !qrbuf2 || !stream.workspace)
 		return -ENOMEM;
+	if (!font)
+		return -EINVAL;
 
 	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
 
-- 
2.55.0


