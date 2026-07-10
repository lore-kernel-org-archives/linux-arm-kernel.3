Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1B2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 22:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+hIVLQLM/sGDz5ot7h7L83Hul9pDF/wx6nn+5acERA=; b=cErC0JQq/YbbBPJ/FFU5onJuH0
	O6/sjQaa4xibKb1ZrzixCheK7zGj2scagRDjMx5N81qm3/3XlwE8gbg1Q1zIX/tRCcaS02CLhCqL6
	l+R5x4Mo8nEmxPvdRD6Nf9ECzW/fVl9UFXEW5/iWcyeSQNk8Yng4YsTodKwhI1oCP1EDH6FZFQ5fC
	Rai9I61Z0/822n6DJ25ukiXoC7J4U9Q3HU3t5SpjmHlPoStxEF239j/oUoIIWvblC7zhLcV6tyJHK
	Zq7GyxQr45YOSePSrVYa/x2NB2fCWtSUGj8kB7/dr6NYwBVuRg+Dm8J0/IG8yshxQ30PZAbILFHXz
	0TbsM/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJp5-00000005xbw-327O;
	Fri, 10 Jul 2026 22:35:55 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJp2-00000005xb6-378U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 22:35:54 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3825c406ffeso1507908a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 15:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783722952; cv=none;
        d=google.com; s=arc-20260327;
        b=fzmsGLccOz7ukpTjlskcZHTqING5khhHPsmv5U+W4LyyeHukV4NDruoiHK7y1e25fR
         LSG3JXLBHJ3mHP28cEl+I5rSm/N+TNS7E2NnTeLpxTDWN10dhX7s/Sg9xbTath2qieO7
         w+O8lYemt3vyYscMiTbmcganhQ1GMSfL40m6LRzkz8hgOP9tVFCPwcvkHIUDoQrtAg7a
         wzCMpyAeKQpNcTyEBcT6EtsU5pGQy9iWjsbPcLwPWh5cNVA3ZxLY0SmMIimqHtDFvt8O
         7gtVAvOLoZjuyrCBfE9e1GvUyYyjCe91+eKlvL1rsxJbNPB4clJ8LnpsTrGNfBtct9zV
         xAPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7+hIVLQLM/sGDz5ot7h7L83Hul9pDF/wx6nn+5acERA=;
        fh=CI0H+SQ4xczqDsSq8rjb2teJ/SJrEiaiu81kZrzb07Q=;
        b=TWSqngiIRtKhU4ggbHanhrJH0336dBiomu9+0eSa1WVIPzQo3vTLJqEYg+hKF5jfSF
         D9QARr6lzqyejlINcylqUSVyKjHMtBl7W6myeF51mWpaCHVv7Rboo1gY8X40vrO3oXVp
         kxW1mzzOgNgSm7vD/hbc3R3adHQaY0dM2OGW5J4wx6Zyv3Y6sicBY/eA7/o5Y3ZRx1ZP
         NqHX8UwhZjC9HRltzVGggDEJrfNr+JOWKtKUGXzBr238DL0dGYw4IchpY8v8hpGLZDUb
         NUD36gQLgfQW6Vnepry/4KRvhih5Qfgk59ssxGFl9K3z+eVzocRK27cIDXkI/uGWksZm
         J8tQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783722952; x=1784327752; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+hIVLQLM/sGDz5ot7h7L83Hul9pDF/wx6nn+5acERA=;
        b=mDheFtsqdbJlran+1kFpnTj+Nig7INUuWnCrCYu+5UnkMwmq/I2LBHxH98S1ht87N1
         BEYttY/9FrA2t647MDx+UxoEJkYMtjNpcFuXPc9vU3T0y9J2hWALoPFOC0CCvdEiXzAK
         TlabdKc3RM7Pzg3hh8e+hlKhVtPWehNtR2EAnA5ohGr1ZIkQk0+VgQ3jYSeZCSWUoJva
         53DIpxK/joXUyTg1gD7KtKHnp9KZIiq4g5ngGVZTE+BWRiOy9CMAJqCkWuhzRw61Z3Mk
         SIY02WHEjWKjvZSobXn68JHFbllChcWzoBjb6RTpMW4NddzXDiOASYYOsmEdCPwn4jrb
         rwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783722952; x=1784327752;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7+hIVLQLM/sGDz5ot7h7L83Hul9pDF/wx6nn+5acERA=;
        b=YvKwqlsJoMac5iT0S3MUbTNLnmKtEwaVW53WLwjfYuW7KW3sgYqyJft58/bg+5qnTm
         3D2X0JtFh4Ij1PAQ0V6LoqLCP0qHtp71NhHgWUJDX1hLbMeovpfZdVemO8foTNAcnQaI
         J6c2tC4g4ESADNZbvkyv31RWFKpC3QT824twsjXYoP5c/E8ptXuPOFsUTY2ubdW22+PS
         FVUpMWwml3h0mxxH/gDCp6nDb7CawFeumzY9dFT5g9cbyOrlQwKJPffQacp4clvQH6cr
         Wd2ErNqLu9fCzuvUrs0zy5OGKICa8ldhfC3GqfRNJGzgOrwx36IAzaFeuBJP+OtP94v6
         sS2A==
X-Forwarded-Encrypted: i=1; AHgh+RqE3AWIQSjFj5FJ3m6lkPlfDJgBAy9VdmyfpbvWTSMR4IA0vuugAEjooaOBNonkshec1BXybj8qx4ZD1xKuKKL7@lists.infradead.org
X-Gm-Message-State: AOJu0YwAdhJ8SHpSQ5drCxbC5ev9//EqI36/YzX/rLIR9xKsNcttu5um
	MplroOkPXkmgVs3p4HzsRtG7roQrxi21/TjFJyH66bHyAJ7JGYKjXTkGGo5zPyTxIhLxIdv7DyI
	k77DJ8b6tPrKHJRgPKPgj2f0rESTEUoI=
X-Gm-Gg: AfdE7cmpSCoDGhneNS+0ZuNWWH6nuT//QrcCGpC7PrW9Rjzbb/XLJvHg4+u3Sr+2Jok
	n1oml0NmdN9TChyTBiF+PAl4a1taTvS/hpVgz1EDrLX/EdrvUvAewwed6BMWqzD0MmiKEKF09+C
	t/+jhVnmZNTR36CGE/66kG/qt2zOR7uQtIbNLLX4Oua+pdpGdkRD/GdJafuoQNc0FcuHKAY3o2/
	Dt1eEU2/p7RES3LwpOeoEn13jV1dCI+4CMi79UD9kTrh2uOHuXHB1yHPtDlIh584Ccxx8UgMToT
	hk7fm8IhWM9y8w/MqfPYeYCOBfU4FW5MuOAfitFBoreTqTRRQAp4wu9xS13Nw+rPdfwaWYdr
X-Received: by 2002:a17:90b:4b83:b0:387:e0db:3d8b with SMTP id
 98e67ed59e1d1-38dc77c6073mr661104a91.38.1783722951858; Fri, 10 Jul 2026
 15:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk>
In-Reply-To: <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 11 Jul 2026 05:35:40 +0700
X-Gm-Features: AVVi8CcV1gryT8dmwOHw2o14YhUF82x6D_iNoN6GwcJljlfAz-HFYF2Z94CVwBU
Message-ID: <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260710_153552_782668_13D4B8F4 
X-CRM114-Status: GOOD (  11.74  )
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

Hi Mark,

Thanks for the review.

> This function does also have some goto based unwinding, there's a
> similar thing in the rt721 changes.

It seems this goto block was added recently, and I missed it after rebasing.
Sorry for the inconvenience.
However, looking at the goto path, it seems we might need to unwind the
states more completely. What do you think about rewriting it like this?

------------------
regcache_cache_only(rt712->regmap, false);
    ret = regcache_sync(rt712->regmap);
    if (ret) {
        regcache_cache_only(rt712->regmap, true);
        regcache_mark_dirty(rt712->regmap);
        return ret;
    }

    regcache_cache_only(rt712->mbq_regmap, false);
    ret = regcache_sync(rt712->mbq_regmap);
    if (ret) {
        regcache_cache_only(rt712->regmap, true);
        regcache_cache_only(rt712->mbq_regmap, true);
        regcache_mark_dirty(rt712->mbq_regmap);
        return ret;
    }

    return 0;
--------------------


Best regards,
Phuc

