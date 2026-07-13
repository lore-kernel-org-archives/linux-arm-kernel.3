Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0244AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 06:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F91gr6eE0JgbUG5KPP/YO2a6SdDu1YAaYwAdsLWaXGk=; b=NVF7VlYHQ05NwwhZusK56gEae6
	DcUKfTqk0HWXGx5WeDd5ENoMROebHG8MwADaTn1cVvUL741JvvXNCxHW3bgHmBJhF7r32kXkgWAnU
	PJhI0ZYk22Y2biMrMZHu/2FHtVNrENoP0vqTLHGD/QJVyWuF7h/5ngSwCgIU/1RbT5ZSZ9s3PHoIA
	0uqvB1qxnfp1f1tHs7dmpj46RafAN6Y32oRMsXUrxcvpuIULvM9zlaYRYOcXmNOuLq9nFWguPunWi
	EUt33zQi0S09jBeyQox4SO1eJC5ETSqwH7PkJ/P5gU72YVIblDfxOXEjXVK3ZroGYNhJNroQ3x2uY
	ioXCPEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAOu-00000008IRJ-2l7k;
	Mon, 13 Jul 2026 06:44:24 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAOs-00000008IQS-3JJE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 06:44:23 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cae1a3a744so18533405ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 23:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783925062; cv=none;
        d=google.com; s=arc-20260327;
        b=LArch8AgEdVbVJ4Ne6SpOmDpH/OUlgESxpam/tcH7GVOfsCfN+xvMULxeVfpx+9N2S
         o5HC68VJZ8BjxqDHTmF79Mu9Xsu8CYJ+Llc1+XCcb4XUwunv4jwnfbg8RHkIEsQnDrFq
         ybBT61LSLjvPOzej93uxzAStWKIni+10aT65qYPNJR/CJ/aCPqtQsq0nCjRwWZHb6u6R
         gjvawvNgNVLBaJ+a43RPUX6Ju3zwNadrJSFll95WIgCLQ4xpposp/MgymamaVgMMJJSA
         Xl7gwxmPyD4rPXO0B1HpMHfEmVSehvOynULdbzJd54MeIaqyu9zb5Hknn5rVupwVMq72
         1UHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F91gr6eE0JgbUG5KPP/YO2a6SdDu1YAaYwAdsLWaXGk=;
        fh=3ACqHLZn6gSBDOgOwMmcedlf2iYdzFN6HzANIkk5HL8=;
        b=KGXaRbZDJPMgqn6Gp5Sbu38TOjRRJHlGPQFYkg7DkR/dLTrjSleiHsOsBy7BPvQhL+
         F0f4xlleuIrbNPfgLTe2cGHi32r/40oG3f6iZCVzIu1Y8lIh18nstN/7dFYwDi6WW3zR
         vqyA0/Xpv+Vqc27jC+VqBEiUeiMvCBNtu8FUh0/CAobR2/LgOxd9r3zl7D8h/PKhOsUE
         IKAChMDo2h52yW/3d90QskBsmjBn7DNv8O52OQ3KHHtDLen4XFBL+qXpNVRvfbAk/NlM
         we98hUC5ZHF4wVThRhFwdgrd48JXzIIDWPdapGzQk/NBvfk4jyo1aSr0Vk9GZytuuSzX
         tSdw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783925062; x=1784529862; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F91gr6eE0JgbUG5KPP/YO2a6SdDu1YAaYwAdsLWaXGk=;
        b=Fyh9U0iWGX9/EoHqMZDFgeyTAjKVd7MFrgVWlSl/WWOd41U/YUbG0JgZPU6ENUiUul
         Y69UoAquIOrgMqJ0QLbnK937h8NQpBAeP8odqo9NwQhO9OI55hZFcLuA6qaLfaQToNPY
         J9uZcXg68NgEzyUx9k4Alm8mGAo6VUq1+kY970gOWghSV3WVqTwV28/TojBBzoLfYI8I
         qb+9pdugH6/AFeMsvarQNJAohK5MCPOwjsC8fdHKUjXcsVX7OSftCk5Mo1uJbp/D029y
         CoadoGAfnikcY0HJ4IT1tkiQ2fp6UJjDKbRpNvFiUyP0nF9tjm/B9YM2e6ks7RTlICuA
         PNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783925062; x=1784529862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F91gr6eE0JgbUG5KPP/YO2a6SdDu1YAaYwAdsLWaXGk=;
        b=tI6rxwGc/pXXtYD+RPs34MDSLPDnJ2EV8Y4ivsgMekDrvEntja4VsU5VgqTGqLSggK
         RPrt8SeM2QCyNj/b1Iglt8VCJLx8p+ADTjxX6oyKqAaaYU0isx86rF/aKTgvDCzkZI87
         iLhW8bU6olpRckilRyhJmijeRtUlWW3NvN8LuiBv27092rp+cHKq/7BzlHPMZnZuFHB8
         oISJ1wgJ7lIuB6Iq0f5E9mRpab3CY87vE01cIoqnbMRt3Hj0zGv6mCuCc0HeMunagf4B
         EWq0xkElGfCbfQjSn2Kt7ep1wo889WxY3oyztz5oJ8hQofmszHIsrlQPvHO8Lwfn+pXu
         fhbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0MaM1aDWgu6vRLMF2kcnHMVgF4r+ZN2YT5gEu7U/UPa1pMfgJoC9EzW2Ej1BAJ/7OpIjxosrjR2fYQ5C7+pQl@lists.infradead.org
X-Gm-Message-State: AOJu0YzGYA7HPZhp2hKF/4VtW9gq1Hrx5sCJ97hnABKfq9nGbigi3i/N
	NFjI3YG5AyLN9tBq3Qqhms2LouvGgQ4m21fY5/YyJySsAVybFmXLn1VIByPcPWQjyQ+dmVwdGZb
	MGLV8rcMPDE4IbZXeyAMC9z7Gb1/A89M=
X-Gm-Gg: AfdE7ck+lAxVZdHkFpT5MIV9nb9tAUiFL3nzNOgn+cdcVGuVfq0JbvXqK/7iQBqTe4z
	WXI2eR6eGiXwDg/2LNXPqJZsPP2EEP5wwETYCB8GkUk1BdIXnhO8bPVhrPtHZqAnISsC3U6EOJp
	sQHNT7IciT+Ht7ZO+Bgb4hKRR1inLJRvE3M7Yo7balT1ty8epfkXMUoLsKiRcZkBtcGmcEzfTgy
	3FkH1fDrEwslRee0gofIQr8yB7N3uEf6Mc/Kof8ysMklO7D/ajtOmJSzRejMgfjn7sFd6WXKPTn
	FjgZH+Nt43/mLl5VLNqfjAVjYQ0=
X-Received: by 2002:a17:903:2983:b0:2ca:d666:df72 with SMTP id
 d9443c01a7336-2ce9ead1556mr77128045ad.21.1783925061877; Sun, 12 Jul 2026
 23:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk> <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
 <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com>
 <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com> <CAABR9nFwGjed9SOUZwuPNu58KPQD-aWnCKj7YTTM8LdF9dig-Q@mail.gmail.com>
In-Reply-To: <CAABR9nFwGjed9SOUZwuPNu58KPQD-aWnCKj7YTTM8LdF9dig-Q@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 13 Jul 2026 13:44:09 +0700
X-Gm-Features: AVVi8CeGlggaa6vmgFhAFOdY55QEWtxhqiyXAaixKicXSNM4i0jdxY8z3i5uafQ
Message-ID: <CAABR9nHvhufH-+2qg9DDa+2PsU5T_qn9EV25pNwirKdPeSdX0A@mail.gmail.com>
Subject: Re: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_234422_855375_38D7F8E6 
X-CRM114-Status: GOOD (  10.10  )
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

I'd like to confirm one more point.

As I understand it, cache_only must be disabled before
re-writing the paging selector registers. Otherwise, _regmap_write()
would update only the cache and return without calling
map->reg_write(), so the hardware state would not actually
be restored.
If my understanding is correct, I'm planning to submit a follow-up
patch like the one below.

---------------------------------

bool cache_only ;
cache_only = map->cache_only;

map->cache_only = false;

for_each_selector_register() {
        if (regcache_read(map, selector_reg, &selector_val))
                continue;
        paging_ret = _regmap_write(map, selector_reg, selector_val);
}


map->cache_only = cache_only;
-----------------------------------

I'd appreciate any feedback.

Best regards,
Phuc

