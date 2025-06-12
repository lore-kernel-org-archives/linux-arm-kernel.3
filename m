Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02686C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 09:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCt7jRFLzoBSBoqgZu7r9m6/P7DqZxIsJScqbfnmPLI=; b=hlsjK/KhsqmNUghaaeCsTO9qnn
	xEJDiOhjto70eiUMy0nGloTWxyUhG37wSui76g7RcXpg8zeo2gMyEQpFwohs/jrqXPgQDO2dZx3vM
	xgoirKs+LvEsBd+ueyWwNepPd90oaSpAZSOTFs4CBIt//wf1B930OoVFx9yrOreZ1Q/kPnkVBtZS1
	UGcR5hBroBsKCUwjLscynYR07K8vJSo5y8CCA+mlyJbzbt0A/oI/tpCGMUumQpapEc4HBqBJ8JGe7
	62w5hC1y1KLX3RlTDyQ1LusPjcelIj0fa+Fe3NgMDt5W9buTEZfP856X6+jPK5Ubl6s0kKaTjNODV
	4TMMyuLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPeKH-0000000CpH8-3N8Y;
	Thu, 12 Jun 2025 09:34:25 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdCN-0000000Cbdu-3Y6d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:22:13 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B505F1F84B;
	Thu, 12 Jun 2025 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oCt7jRFLzoBSBoqgZu7r9m6/P7DqZxIsJScqbfnmPLI=;
	b=U3cuALIOvbQhDy8K7aEhhdnNBbbT5axy9EXkDBo1vhQTmPx6MlwCZ4sq7j1sCS76LpHOdZ
	rxNoj7JvJwanqv5Dm1hvTaNpNEAzHu3jYLrH8CDmPu6ucRLuucRHmJpH9g/HbA17oM4LEb
	LFHv6KUsRrIHXcZc/yvnIjMrjXqDovo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oCt7jRFLzoBSBoqgZu7r9m6/P7DqZxIsJScqbfnmPLI=;
	b=FoMsZRufd9HpCEWDhN7QtvqE6M8h7yM9pildBiAEd5CqaajgkJ5D+lG5FAEInQxMtmm/AW
	ul8dcJR1ynGse4DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=U3cuALIO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FoMsZRuf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oCt7jRFLzoBSBoqgZu7r9m6/P7DqZxIsJScqbfnmPLI=;
	b=U3cuALIOvbQhDy8K7aEhhdnNBbbT5axy9EXkDBo1vhQTmPx6MlwCZ4sq7j1sCS76LpHOdZ
	rxNoj7JvJwanqv5Dm1hvTaNpNEAzHu3jYLrH8CDmPu6ucRLuucRHmJpH9g/HbA17oM4LEb
	LFHv6KUsRrIHXcZc/yvnIjMrjXqDovo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oCt7jRFLzoBSBoqgZu7r9m6/P7DqZxIsJScqbfnmPLI=;
	b=FoMsZRufd9HpCEWDhN7QtvqE6M8h7yM9pildBiAEd5CqaajgkJ5D+lG5FAEInQxMtmm/AW
	ul8dcJR1ynGse4DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62219132D8;
	Thu, 12 Jun 2025 08:21:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2CKUFgmOSmgILAAAD6G6ig
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
Subject: [PATCH v2 12/14] fbdev/sisfb: Unexport symbols
Date: Thu, 12 Jun 2025 10:16:35 +0200
Message-ID: <20250612081738.197826-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612081738.197826-1-tzimmermann@suse.de>
References: <20250612081738.197826-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B505F1F84B
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLwqwbgho3bgbo9wb3ecq1qfng)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_012212_022311_D9434D1A 
X-CRM114-Status: GOOD (  12.05  )
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

  drivers/video/fbdev/sis/sis_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

The affected symbols are not used outside of their module. Some of
the symbols are not used anywhere, so remove the functions entirely.
Also remove the related, but unused, define SISFB_HAVE_MALLOC_NEW.

v2:
- remove unused functions (Helge)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/sis/sis.h      |  2 --
 drivers/video/fbdev/sis/sis_main.c | 25 -------------------------
 include/video/sisfb.h              |  6 ------
 3 files changed, 33 deletions(-)

diff --git a/drivers/video/fbdev/sis/sis.h b/drivers/video/fbdev/sis/sis.h
index d632f096083b..3d658482c69d 100644
--- a/drivers/video/fbdev/sis/sis.h
+++ b/drivers/video/fbdev/sis/sis.h
@@ -673,9 +673,7 @@ unsigned int	sisfb_read_mio_pci_word(struct SiS_Private *SiS_Pr, int reg);
 
 /* SiS-specific exported functions */
 void			sis_malloc(struct sis_memreq *req);
-void			sis_malloc_new(struct pci_dev *pdev, struct sis_memreq *req);
 void			sis_free(u32 base);
-void			sis_free_new(struct pci_dev *pdev, u32 base);
 
 /* Routines from init.c/init301.c */
 extern unsigned short	SiS_GetModeID_LCD(int VGAEngine, unsigned int VBFlags, int HDisplay,
diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 75033e6be15a..84567d67f71d 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -3421,14 +3421,6 @@ sis_malloc(struct sis_memreq *req)
 		req->offset = req->size = 0;
 }
 
-void
-sis_malloc_new(struct pci_dev *pdev, struct sis_memreq *req)
-{
-	struct sis_video_info *ivideo = pci_get_drvdata(pdev);
-
-	sis_int_malloc(ivideo, req);
-}
-
 /* sis_free: u32 because "base" is offset inside video ram, can never be >4GB */
 
 static void
@@ -3455,14 +3447,6 @@ sis_free(u32 base)
 	sis_int_free(ivideo, base);
 }
 
-void
-sis_free_new(struct pci_dev *pdev, u32 base)
-{
-	struct sis_video_info *ivideo = pci_get_drvdata(pdev);
-
-	sis_int_free(ivideo, base);
-}
-
 /* --------------------- SetMode routines ------------------------- */
 
 static void
@@ -6832,12 +6816,3 @@ MODULE_PARM_DESC(videoram,
 #endif
 
 #endif 	   /*  /MODULE  */
-
-/* _GPL only for new symbols. */
-EXPORT_SYMBOL(sis_malloc);
-EXPORT_SYMBOL(sis_free);
-EXPORT_SYMBOL_GPL(sis_malloc_new);
-EXPORT_SYMBOL_GPL(sis_free_new);
-
-
-
diff --git a/include/video/sisfb.h b/include/video/sisfb.h
index 76ff628a1220..54e6632cd4a2 100644
--- a/include/video/sisfb.h
+++ b/include/video/sisfb.h
@@ -15,10 +15,4 @@
 #define	SIS_300_VGA  1
 #define	SIS_315_VGA  2
 
-#define SISFB_HAVE_MALLOC_NEW
-extern void sis_malloc(struct sis_memreq *req);
-extern void sis_malloc_new(struct pci_dev *pdev, struct sis_memreq *req);
-
-extern void sis_free(u32 base);
-extern void sis_free_new(struct pci_dev *pdev, u32 base);
 #endif
-- 
2.49.0


