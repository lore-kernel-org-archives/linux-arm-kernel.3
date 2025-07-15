Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC9AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 07:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEUMF4eWRlQ8TLOqCX4QecdfnIvcNGC40IXakOIlkYc=; b=1RJDzxR5IivbosjMax0aV+POI9
	hG8fYDg07S2khIymtfc9oUmgnRnSU7X2PO9kjMeH6/QTJvFviadYJkerN88zrn61xM0dDDc7b6WTz
	PizgzdrtsUGoVFjNEVJE6xiqO45UGlPQqEV0oJZEYINMRYy3qaWUDwhJrWAiDP+ci6ZwTlhmwnrM+
	glyENtuZPTYHKVxo/axnkMvaY+SVVeKwoxfKP+Z0wP8JXiy28n9NvkM7wyu9AvHlSDAUiJaMVT8xD
	ux3rjhXBbycX1ebb8oApQ6cs8qCZ6pL3q3S1nn9+sk4e3h7fSAQ8A2qhaI3tHJzm2KK7BvkoueGbj
	KtWtlFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaZj-00000004QeA-2PNZ;
	Tue, 15 Jul 2025 07:59:43 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaSz-00000004PQH-3ZLR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 07:52:48 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8E1331F397;
	Tue, 15 Jul 2025 07:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752565962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEUMF4eWRlQ8TLOqCX4QecdfnIvcNGC40IXakOIlkYc=;
	b=taIOEnfv5XpFwUHIq9YmCSWwsuSdzoq+S50lepaNcMy4sS9uoW0/Je1bG9VOQ3oO1rnKUC
	zoPlwNZHzAPjjisx0JR3eCB4t849ojbRooHaDim+S8EpSZjcwQd/FmzCNefXKxanB3m1xp
	9zK0sjpFgiERvP40hq21SyhluMkdBfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752565962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEUMF4eWRlQ8TLOqCX4QecdfnIvcNGC40IXakOIlkYc=;
	b=rtvKuufMAJJodP1eCX4Bnxt+30S918TVo+ahfOuIFInfUC53SjqTwwXuidnkx4HNT5wMRD
	FJvqCbgEYUB5mPDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=taIOEnfv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rtvKuufM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752565962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEUMF4eWRlQ8TLOqCX4QecdfnIvcNGC40IXakOIlkYc=;
	b=taIOEnfv5XpFwUHIq9YmCSWwsuSdzoq+S50lepaNcMy4sS9uoW0/Je1bG9VOQ3oO1rnKUC
	zoPlwNZHzAPjjisx0JR3eCB4t849ojbRooHaDim+S8EpSZjcwQd/FmzCNefXKxanB3m1xp
	9zK0sjpFgiERvP40hq21SyhluMkdBfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752565962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEUMF4eWRlQ8TLOqCX4QecdfnIvcNGC40IXakOIlkYc=;
	b=rtvKuufMAJJodP1eCX4Bnxt+30S918TVo+ahfOuIFInfUC53SjqTwwXuidnkx4HNT5wMRD
	FJvqCbgEYUB5mPDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5CF7113A6C;
	Tue, 15 Jul 2025 07:52:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OOqLFcoIdmjnSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Jul 2025 07:52:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm: multi_v7_defconfig: Update HD-audio configs
Date: Tue, 15 Jul 2025 09:51:21 +0200
Message-ID: <20250715075237.28476-2-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715075237.28476-1-tiwai@suse.de>
References: <20250715075237.28476-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 8E1331F397
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_005246_035071_6E23DA1A 
X-CRM114-Status: GOOD (  12.00  )
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

Since the reorganization of HD-audio drivers, Realtek and HDMI codec
drivers have been split.  Update to the new Kconfigs to catch up.

Fixes: aeeb85f26c3b ("ALSA: hda: Split Realtek HD-audio codec driver")
Fixes: 73cd0490819d ("ALSA: hda/hdmi: Split vendor codec drivers")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/20250715170422.5162c666@canb.auug.org.au
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

I'm going to put to sound git tree if no one objects

 arch/arm/configs/multi_v7_defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 50c170b4619f..02ddd7ce9e3e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -791,8 +791,11 @@ CONFIG_SND=m
 CONFIG_SND_HDA_TEGRA=m
 CONFIG_SND_HDA_INPUT_BEEP=y
 CONFIG_SND_HDA_PATCH_LOADER=y
-CONFIG_SND_HDA_CODEC_REALTEK=m
+CONFIG_SND_HDA_CODEC_REALTEK=y
+CONFIG_SND_HDA_CODEC_REALTEK_LIB=m
+CONFIG_SND_HDA_CODEC_ALC269=m
 CONFIG_SND_HDA_CODEC_HDMI=m
+CONFIG_SND_HDA_CODEC_HDMI_TEGRA=m
 CONFIG_SND_USB_AUDIO=m
 CONFIG_SND_SOC=m
 CONFIG_SND_ATMEL_SOC=m
-- 
2.50.1


