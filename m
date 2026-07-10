Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0835AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SoePf6i82i5CK+o92jYqWlVeOhijMPoeBJoNmzsWIYM=; b=S0be13F+PA8a1783AIDwU1CE/3
	Cs7fl+KYt6tZaoCZng8XdKFTxwQiRWyiXR4T7bb9y5WW7yiLQVNBKGXnTP3OBZQ6NmcIjwizEVC/Z
	oaj+A7pQgfreEAfWfnSJNV+1aC5b8c1hZTi+gwXfOmPpRYxYZpShTGS4NQm4skNwONmQWZmP/rO4s
	szAdFs88qlcwEAUTSSAB6UYzUMYO7uIJB3XUnUoClSP6xD9pK/TW+PoWyFR/Wu2+RnePy3hX5bikU
	WqCbrpr/6jXATyN4jOprxtZUp63IKVxSa6yj+RISfLJW/46s5xfZBkD2uQfaOud2aPoM77uqrF5dA
	iQCS/zuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Lm-00000004ggQ-31ec;
	Fri, 10 Jul 2026 10:20:54 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Lj-00000004gf1-3Mom
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:20:53 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6547776439;
	Fri, 10 Jul 2026 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783678848; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoePf6i82i5CK+o92jYqWlVeOhijMPoeBJoNmzsWIYM=;
	b=rl/tCaHg1x6s6jROQccRtQ25WrRz5H1cr1m7d+JjKeWwwz06oqbidwX0Ep9hyXdi7i9fGN
	gjScl40nSDVXXktpczkjKTvSSVJ3CE9sIytgfvbscmciI147Ls+VClZVNU0CsP1vN4Zx1T
	t+VCVlmuYDFkfPnfjc6zTg9yPunErHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783678848;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoePf6i82i5CK+o92jYqWlVeOhijMPoeBJoNmzsWIYM=;
	b=Tf8m7PxaDtk0SjR8L1MuMJt2NMQf+A2iMCV273HWdV1PglCaGbMqdAf/6QWCsDoxsKot/R
	RBvr46WI880jW5DQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="rl/tCaHg";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Tf8m7Pxa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783678848; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoePf6i82i5CK+o92jYqWlVeOhijMPoeBJoNmzsWIYM=;
	b=rl/tCaHg1x6s6jROQccRtQ25WrRz5H1cr1m7d+JjKeWwwz06oqbidwX0Ep9hyXdi7i9fGN
	gjScl40nSDVXXktpczkjKTvSSVJ3CE9sIytgfvbscmciI147Ls+VClZVNU0CsP1vN4Zx1T
	t+VCVlmuYDFkfPnfjc6zTg9yPunErHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783678848;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoePf6i82i5CK+o92jYqWlVeOhijMPoeBJoNmzsWIYM=;
	b=Tf8m7PxaDtk0SjR8L1MuMJt2NMQf+A2iMCV273HWdV1PglCaGbMqdAf/6QWCsDoxsKot/R
	RBvr46WI880jW5DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDB20779BD;
	Fri, 10 Jul 2026 10:20:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AzzNN3/HUGpNUAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 10 Jul 2026 10:20:47 +0000
Message-ID: <b3d228fd-6138-4195-b63c-65b28691e18b@suse.de>
Date: Fri, 10 Jul 2026 13:20:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] mfd: bcm2835-pm: Remove member of struct
 bcm2835_pm that is only used locally
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, mfd@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <d80395cc8008817427e63417b97bc8631236c72a.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <d80395cc8008817427e63417b97bc8631236c72a.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6547776439
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_032051_992773_9558DC25 
X-CRM114-Status: GOOD (  11.78  )
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

Hi Uwe,

On 7/8/26 2:15 PM, Uwe Kleine-KÃ¶nig (The Capable Hub) wrote:
> struct bcm2835_pm::soc is only used in bcm2835_pm_probe() and thus can be
> replaced by a local variable.
> 
> With that change enum bcm2835_soc is only used in the mfd core driver and
> so the definition can move there.

The original idea was to re-use bcm2835_pm::soc field in bcm2835-power.c
pmdomain driver where we implicitly decide which DOMAIN_GRAFX_V3D
register to use (see commit d4aa5960025a "pmdomain: bcm: bcm2835-power:
Prepare to support BCM2712"). So, instead of !power->asb the intention
is to use bcm2835_pm::soc == BCM2835_PM_SOC_BCM2712.

Please drop this patch from the series. I'll post a patch soon.

regards,
~Stan



