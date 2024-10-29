Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4247D5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 09:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Subject:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ku1JDYDBZT1obUivRyskSGSTDf0mktYxN5N3bIXkWQ=; b=n8km3dAnCM+BBv
	hU+czXvtBh53bPMrYY6N5PnNxxkIEQnO4oQT0W56rB3NCW6t3gMQIkUwbB229WbI+qHeavjpHL4OA
	J4Ao1d19QYSeU3+P9vYSonY6e7XTC5YMfagXCYcuvhWVnuVqctfBouJ5cAfhZdCGR6uxAMjdc9Nun
	ToM4moX0MO1aQirj07h8/1oLHQKgdmqYXS2O5Vk8uRjOIWnxyEB7BBx6rIoaftY/tuR/GhNhmTiAb
	JRLEKkocmZZVRQRgh2UQI5XHOBZXVfe4HzJX38HfRmyKlVIkZfLri801tC94Sr0rO8Om/xFHxDHFz
	mbPNnPrzBkTnbAj4WYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iGT-0000000Dprl-2NOG;
	Tue, 29 Oct 2024 09:11:49 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5i9F-0000000DoXw-3UnU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 09:04:26 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5DB1B21F9D;
	Tue, 29 Oct 2024 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730192658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ku1JDYDBZT1obUivRyskSGSTDf0mktYxN5N3bIXkWQ=;
	b=o7QAkV3OXmTT4WcSZ+R25zlyM1IeRZveLYKgyLF1hV5HQ0vtI6NOGIWp9C75NbmNewNnWD
	WoMolsPR3gXdD0PXa0IeOJ+R7EHEWAXS/x7pJ4ogoqxZbm/FbvtcXOkhnkcJmEAy3PLiqC
	oU3RM11Dp2TSyEk6tHT6yaLppx+oaX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730192658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ku1JDYDBZT1obUivRyskSGSTDf0mktYxN5N3bIXkWQ=;
	b=Ip+QCFtcCOSAqB3TcPjiOdaFnve+Diu6aAPyR06YsHf0Rl2vbV7/0QSSrmrbuY+EYEnvKB
	ENZQeSyGpWp41rAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730192658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ku1JDYDBZT1obUivRyskSGSTDf0mktYxN5N3bIXkWQ=;
	b=o7QAkV3OXmTT4WcSZ+R25zlyM1IeRZveLYKgyLF1hV5HQ0vtI6NOGIWp9C75NbmNewNnWD
	WoMolsPR3gXdD0PXa0IeOJ+R7EHEWAXS/x7pJ4ogoqxZbm/FbvtcXOkhnkcJmEAy3PLiqC
	oU3RM11Dp2TSyEk6tHT6yaLppx+oaX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730192658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ku1JDYDBZT1obUivRyskSGSTDf0mktYxN5N3bIXkWQ=;
	b=Ip+QCFtcCOSAqB3TcPjiOdaFnve+Diu6aAPyR06YsHf0Rl2vbV7/0QSSrmrbuY+EYEnvKB
	ENZQeSyGpWp41rAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE9BA136A5;
	Tue, 29 Oct 2024 09:04:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id htNSMRGlIGf3FAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Oct 2024 09:04:17 +0000
Date: Tue, 29 Oct 2024 10:05:21 +0100
Message-ID: <8734kf2sa6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] sound: Switch back to struct platform_driver::remove()
In-Reply-To: <20241029073748.508077-2-u.kleine-koenig@baylibre.com>
References: <20241029073748.508077-2-u.kleine-koenig@baylibre.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[free.fr,gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,zonque.org,gmail.com,free.fr,microchip.com,bootlin.com,tuxon.dev,nvidia.com,ellerman.id.au,csgroup.eu,kernel.org,linux.ibm.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_020422_286354_7796CA88 
X-CRM114-Status: GOOD (  20.87  )
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
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Ivan Orlov <ivan.orlov0322@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 29 Oct 2024 08:37:47 +0100,
Uwe Kleine-König wrote:
> 
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below sound to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> On the way do a few whitespace changes to make indention consistent.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> I did a single patch for all of sound. sound/soc was already converted
> separately, so isn't mixed in here. While I usually prefer to do one
> logical change per patch, this seems to be overengineering here as the
> individual changes are really trivial and shouldn't be much in the way
> for stable backports. But I'll happily split the patch if you prefer it
> split.

It's fine to do this in a single shot.

I suppose this can be applied for 6.13, not necessarily to be merged
for 6.12-rc?


thanks,

Takashi

