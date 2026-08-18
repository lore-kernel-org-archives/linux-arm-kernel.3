Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB226C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lurynGJFfEOjpSoiEvFLb2rSec2t0K5pgw8WURsM3ZM=; b=N+U1x84Pn8WcSKKp8F2WLOpZ7c
	xDYvX4cAEvtsJyEfppSKJ8+sGg9xMSCBRIC1x7bfzT/gKEPHwMSAvQDjw4Ii3YuX8Hjbrwp9iECTw
	ihuUzLUkYWQFIliP9z9s/AEI1AR2fCOydupPwxUDssEyH7OCZm0sPDzP3mvKPntQBm90BbQlcf7SC
	f/CEykBm2wfUEU8kMhR5Whee4MknLcKHb/nD2p8HJGpXnKkuL8N3lnkb+2NZBhqY42HrM8a6yMqXA
	QBh/sF2Ul+Qn0G+Af1W5DxORS+1P78B66qLaxsh2UF2d8SQx6tQIJKLrtrGcmr6s+UKO4I+sHKxL0
	2tubXpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJHo-00000007yPJ-3bN1;
	Tue, 18 Aug 2026 12:51:24 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJHm-00000007yNJ-1jbs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 12:51:23 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BDB8E3E75;
	Tue, 18 Aug 2026 12:50:18 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787057418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lurynGJFfEOjpSoiEvFLb2rSec2t0K5pgw8WURsM3ZM=;
	b=XYup1uGbrJML4Mzy59EIa1+NKb8rhGkIloNjVQIk8cLr8NCC+flnp+SXRdO8x+0AEsBZdM
	A3wq8ctRSLTUprnpI1f9Ay56yZdS0DArlBCoYiG2ciKAIO82tvPyMeCV+//1UMbywlYmsX
	Udzky4X/z9GbC3QOXOoStuJ0Mq5D7fw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787057418;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lurynGJFfEOjpSoiEvFLb2rSec2t0K5pgw8WURsM3ZM=;
	b=w7fEnJZyzqyNLqZ3HvZ8TEICA8+rVdi3XmaL7yk8FQOqe2nvGJ3D+rf/DlXIfppQAiuADg
	21+vbzKmmXos/4Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45649362E;
	Tue, 18 Aug 2026 12:50:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yB+4DwpVhGojIAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Aug 2026 12:50:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org
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
Subject: [PATCH 02/12] drm/panic: Make allocation of zlib workspace more robust
Date: Tue, 18 Aug 2026 14:28:00 +0200
Message-ID: <20260818125012.468092-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818125012.468092-1-tzimmermann@suse.de>
References: <20260818125012.468092-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)]
X-Rspamd-Queue-Id: BDB8E3E75
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_055122_602643_77814932 
X-CRM114-Status: GOOD (  12.99  )
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

Test the zlib workspace size to not have a negative value. This
would be a driver bug. Also touch allocated memory so that the
pages are available upon a panic.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_panic.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 0685f7d8dba2..705b72bf0d83 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -634,13 +634,19 @@ static struct z_stream_s stream;
 
 static void __init drm_panic_qr_init(void)
 {
+	int wssize;
+
+	wssize = zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL);
+	if (WARN_ON_ONCE(wssize < 0))
+		return;
 	/* best-effort allocation; can be NULL */
-	stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
-				   GFP_KERNEL);
+	stream.workspace = kmalloc(wssize, GFP_KERNEL);
 
 	/* touch memory so that pages are there in the case of a panic */
 	memset(qrbuf1, 0, sizeof(qrbuf1));
 	memset(qrbuf2, 0, sizeof(qrbuf2));
+	if (stream.workspace)
+		memset(stream.workspace, 0, wssize);
 }
 
 static void drm_panic_qr_exit(void)
-- 
2.55.0


