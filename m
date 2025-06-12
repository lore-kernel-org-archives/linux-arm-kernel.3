Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF46C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 09:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMbLJupS5OSTa8U/8vbg4Z1Ks0Ank3I8G7D8geSAtv8=; b=BNqs5dg7tEVW5nht9+Un0ic6MY
	f7O4Ss/SBbWl8SnPxFLZTJRU0o2QI8vUDk+WfKQRc7KILNH1T9hi4rVwPZyIlMx7WR+sjo/TaLLed
	j1fawHykv9Bi+40O+rda7KHP9uAUTW9uKgKnEYxuxnWDTV4D1dNBSYc440b6+NUvfqeRvnwSKGfFx
	YMDg2XxS0LefVRswGQxiuH5K5qUIgaZUWQd+ZeWmfDQjClMYFaHJ+utv+PtoClqJrw34mc/gC4DPw
	1Ma1SkopCG2tJx78yx+XLKyYtsvjS76z9/sHIrRCTLpKJ9aOx1ZvvOz87gq0IvYMZLtKLta6Br7/E
	Rn1yAVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPe5e-0000000Cnh0-3G6X;
	Thu, 12 Jun 2025 09:19:18 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdBs-0000000CbOp-1D3q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:21:41 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 54DF01F7EC;
	Thu, 12 Jun 2025 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMbLJupS5OSTa8U/8vbg4Z1Ks0Ank3I8G7D8geSAtv8=;
	b=am8tzd0qbejFWyneBMVIjMmmk6jb6Zn7Luf7K/oe+jflha+VeB2yX1WsfrgzmGfJ5OQS2b
	a9ATkzs74vuXpxY+X/lsuX8dSNL2JWVmL1FbYRQ7r2oli30Yc14HxRCgomhCLm1eoQuEXV
	qjpdG7+hu2nXLDR7cyhGWJAcG6AMl1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMbLJupS5OSTa8U/8vbg4Z1Ks0Ank3I8G7D8geSAtv8=;
	b=5sJBuITOmizzL61ZX9azTl1jzzTG5hZvyF1oUPShF6EdIDxWOaiIaqQVw5qGD2iKcCFCbw
	/+adl1gTe2+6DpCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=am8tzd0q;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5sJBuITO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMbLJupS5OSTa8U/8vbg4Z1Ks0Ank3I8G7D8geSAtv8=;
	b=am8tzd0qbejFWyneBMVIjMmmk6jb6Zn7Luf7K/oe+jflha+VeB2yX1WsfrgzmGfJ5OQS2b
	a9ATkzs74vuXpxY+X/lsuX8dSNL2JWVmL1FbYRQ7r2oli30Yc14HxRCgomhCLm1eoQuEXV
	qjpdG7+hu2nXLDR7cyhGWJAcG6AMl1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMbLJupS5OSTa8U/8vbg4Z1Ks0Ank3I8G7D8geSAtv8=;
	b=5sJBuITOmizzL61ZX9azTl1jzzTG5hZvyF1oUPShF6EdIDxWOaiIaqQVw5qGD2iKcCFCbw
	/+adl1gTe2+6DpCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 017C913A6D;
	Thu, 12 Jun 2025 08:21:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UPKlOgWOSmgILAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 08:21:25 +0000
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
Subject: [PATCH v2 03/14] fbdev/c2p: Include <linux/export.h>
Date: Thu, 12 Jun 2025 10:16:26 +0200
Message-ID: <20250612081738.197826-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612081738.197826-1-tzimmermann@suse.de>
References: <20250612081738.197826-1-tzimmermann@suse.de>
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
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,armlinux.org.uk,gmail.com,kernel.org];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLwqwbgho3bgbo9wb3ecq1qfng)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Queue-Id: 54DF01F7EC
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_012140_463266_3311A1A2 
X-CRM114-Status: UNSURE (   9.75  )
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
Reviewed-by: Helge Deller <deller@gmx.de>
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


