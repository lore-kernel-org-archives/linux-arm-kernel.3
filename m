Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DD9C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 11:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boF3GrbYhR1turEXc0J1Q6wFwiRT3ZKVLQz2H+/v6+s=; b=js23rVBM1UoKivv5wdi3HRPxSp
	gFY54INsb4IcwNRXmR+3JrSnwoa8RpPVRwYgvYFVV8DAREx2t4Fc3EaAV9ghWCKR/Izg1HVe0hGpb
	/Bp3pCpgIGxrPIX9xzbbOuk2hWTtC1KiSvHC/HpCZ0irKiL9Y+t+41Z7Pxo5QfO0rO7s80MEiVztj
	BGXe07gEzmox8tx8U75Io2lzRBsPrSBqljLUnN9lfm6xQeumwwJ5XWpB0N0Oz/T9FGE4DTFuUJpAH
	jPd6WniPZ+k3fBDK5DLaBAfLd1sHmo83v3/mXiPguC3RA89Ns4NsoxqliHynunIgMgL1zhH+EjlQW
	QiGekEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxFQ-00000006eev-3kSM;
	Tue, 10 Jun 2025 11:34:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwlX-00000006baJ-2xE2
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 11:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=boF3GrbYhR1turEXc0J1Q6wFwiRT3ZKVLQz2H+/v6+s=; b=TDTJUL2Ky53jFSd9POHeScPfnR
	qsoWXVpLJtSKjYYgo5EGuAV/oEaMqxYWC7qs3JP7ViQ8hn2R46vARem33ilHeJoOGfpXkhqXRgjah
	sfkZRKE2+neej9T6imBfSayonqbkq+bScQyUlhloEG9LhvDxFY9dJ154XHJ47HgmkIRcvngqRoyzZ
	+MKW/XNuHic5NPO22wmjvUstwZICYT23AZvbIxh0hmoR6yiGrwppFawMr9Dzt2r+iJbfkQi/iKYr+
	imGg0e7VaP1QBp2ubZfGrG2jlNO5teJLiFYalO1Y6C96ZqSgU4JA8FvpBcvlHT9UprfLqqp+Tdjs2
	/PfU4m/A==;
Received: from smtp-out2.suse.de ([195.135.223.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwlV-00000001lnc-2lJc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 11:03:39 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 536F21F84C;
	Tue, 10 Jun 2025 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=boF3GrbYhR1turEXc0J1Q6wFwiRT3ZKVLQz2H+/v6+s=;
	b=clIjCV9zeNOWSpIEC0pSAj9O7ATRW8zbrtUEAqOXzS0HO0CHWgbFqMQcndeJdi6XPdAf80
	O5TbCNmwUPQR1zbhnQ7M1BqcKBeVzb0VTJXZK5puI5i2IZn0REhj9LbNhR03M9Pvb+hEU0
	gWXidNmtGE1hCTBYcf0aj7rirmdzRTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=boF3GrbYhR1turEXc0J1Q6wFwiRT3ZKVLQz2H+/v6+s=;
	b=6h9CJ5bxLwf5H4KlokjoY3ZJrgWKyxURvfBNTuaCdgIA5M6a/M/D3c7oaASQTN/jWBc5nS
	2z0f9H2l1LdBzmCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=clIjCV9z;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6h9CJ5bx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=boF3GrbYhR1turEXc0J1Q6wFwiRT3ZKVLQz2H+/v6+s=;
	b=clIjCV9zeNOWSpIEC0pSAj9O7ATRW8zbrtUEAqOXzS0HO0CHWgbFqMQcndeJdi6XPdAf80
	O5TbCNmwUPQR1zbhnQ7M1BqcKBeVzb0VTJXZK5puI5i2IZn0REhj9LbNhR03M9Pvb+hEU0
	gWXidNmtGE1hCTBYcf0aj7rirmdzRTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=boF3GrbYhR1turEXc0J1Q6wFwiRT3ZKVLQz2H+/v6+s=;
	b=6h9CJ5bxLwf5H4KlokjoY3ZJrgWKyxURvfBNTuaCdgIA5M6a/M/D3c7oaASQTN/jWBc5nS
	2z0f9H2l1LdBzmCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F084D13A17;
	Tue, 10 Jun 2025 11:03:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CENiOfsQSGgOTAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:23 +0000
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
Subject: [PATCH 03/14] fbdev/c2p: Include <linux/export.h>
Date: Tue, 10 Jun 2025 12:56:36 +0200
Message-ID: <20250610105948.384540-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610105948.384540-1-tzimmermann@suse.de>
References: <20250610105948.384540-1-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Queue-Id: 536F21F84C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_120337_867837_5AC27FBC 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

Fix the compile-time warnings

  drivers/video/fbdev/c2p_iplan2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/c2p_planar.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/c2p_iplan2.c | 1 +
 drivers/video/fbdev/c2p_planar.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/c2p_iplan2.c b/drivers/video/fbdev/c2p_iplan2.c
index cfd2361f24b1..ee4b315d3f40 100644
--- a/drivers/video/fbdev/c2p_iplan2.c
+++ b/drivers/video/fbdev/c2p_iplan2.c
@@ -8,6 +8,7 @@
  *  for more details.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/string.h>
 
diff --git a/drivers/video/fbdev/c2p_planar.c b/drivers/video/fbdev/c2p_planar.c
index 819c82a98ac0..236aad5137ef 100644
--- a/drivers/video/fbdev/c2p_planar.c
+++ b/drivers/video/fbdev/c2p_planar.c
@@ -8,6 +8,7 @@
  *  for more details.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/string.h>
 
-- 
2.49.0


