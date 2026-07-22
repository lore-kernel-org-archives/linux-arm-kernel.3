Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F29C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Hk5heLSfWVGLMTsYmNur//qH4lMk/i0VVzTcJAiotY=; b=fg9LcSax2It/2vk1ENAM+gGsVE
	7RejQiBei2kWG0K6hSSJsVXd8AH86Hi8EPSmHYTanGWVhXoaUL8UPOYEUExVtcFVug+JzGZPTvU4n
	sSFbaoKu5dxswGucczl220d25E9+ePLoz+ht2E3Ho115BxRE1mMTnlOKerhjoJ2En0KJHSFhznjNm
	DWhqiq78JN7MRQJiVbCj/Ju3gTEpn0Z38af74SAa8mXbe6gr+qB36rveg68QGuygKrBLPYgVbskak
	cwe7McyiPZkaTPbTQMaFbZL6hdhn+sQcW2igYDaLtwNIOefR6p7/UJkFBNnJHMGWnarDNlY+/IiVA
	CSG+IUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmV6k-0000000Be54-23w6;
	Wed, 22 Jul 2026 11:27:26 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmV6i-0000000Be4O-1p8w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:27:25 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 85B247AA70;
	Wed, 22 Jul 2026 11:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784719640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Hk5heLSfWVGLMTsYmNur//qH4lMk/i0VVzTcJAiotY=;
	b=eBsbfDoM6PpveRchhYZmhJ0rXBm2DSKDF0yFnxjgSKsSUD8lI/g+OzlyQ3IPebZiP3WePO
	txi+v/+xCpeIMqqFG6dLWkLVewMid2w55Wsdqr5yTLGp6eIM0SfYGzdluFOl0kG/BiuwtK
	rBTvZd+Y0SfEiPtTn+qakWLdSwyBHAk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784719640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Hk5heLSfWVGLMTsYmNur//qH4lMk/i0VVzTcJAiotY=;
	b=fN51ijhzfQuBh81XoWOuoT2Swyybspd7fUEr7gh6fIYG/LoLJ66fkdFS4Sh7ofBbh3RhIc
	ifqoIwW2eOXG00CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eBsbfDoM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fN51ijhz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784719640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Hk5heLSfWVGLMTsYmNur//qH4lMk/i0VVzTcJAiotY=;
	b=eBsbfDoM6PpveRchhYZmhJ0rXBm2DSKDF0yFnxjgSKsSUD8lI/g+OzlyQ3IPebZiP3WePO
	txi+v/+xCpeIMqqFG6dLWkLVewMid2w55Wsdqr5yTLGp6eIM0SfYGzdluFOl0kG/BiuwtK
	rBTvZd+Y0SfEiPtTn+qakWLdSwyBHAk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784719640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Hk5heLSfWVGLMTsYmNur//qH4lMk/i0VVzTcJAiotY=;
	b=fN51ijhzfQuBh81XoWOuoT2Swyybspd7fUEr7gh6fIYG/LoLJ66fkdFS4Sh7ofBbh3RhIc
	ifqoIwW2eOXG00CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 283F6779B0;
	Wed, 22 Jul 2026 11:27:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BS79BRipYGphMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 22 Jul 2026 11:27:20 +0000
Date: Wed, 22 Jul 2026 13:27:19 +0200
Message-ID: <878q73gt7s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b)
Subject: Re: [PATCH] ALSA: atmel: ac97c: use platform helpers and devm cleanup
In-Reply-To: <20260721225411.815553-1-rosenp@gmail.com>
References: <20260721225411.815553-1-rosenp@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 85B247AA70
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_042724_646599_8060F198 
X-CRM114-Status: GOOD (  14.13  )
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

On Wed, 22 Jul 2026 00:54:11 +0200,
Rosen Penev wrote:
> 
> Convert atmel_ac97c_probe() to the managed APIs. Replace the open-coded
> platform_get_resource() + ioremap() with devm_platform_ioremap_resource(),
> which requests and maps the AC97C register window in one call. Switch the
> clock to devm_clk_get_enabled(), the card to snd_devm_card_new(), and the
> interrupt to devm_request_irq(). The now-unnecessary error-path cleanup
> and the manual teardown in atmel_ac97c_remove() are dropped, since devm
> handles them.
> 
> platform_get_irq() was already used; tighten its error check to irq < 0.
> 
> Both resource and IRQ lookups are equivalent for a platform-backed
> device. The AC97C register window is owned solely by this driver, so the
> new region request cannot conflict with another claimant, and it is
> mapped exactly once (no double mapping).
> 
> No functional change; built for ARM (allmodconfig + SND_ATMEL_AC97C)
> with LLVM=1 and sound/atmel/ac97c.o compiles cleanly.
> 
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied to for-next branch.  Thanks.


Takashi

