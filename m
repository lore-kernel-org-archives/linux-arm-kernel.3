Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDA1C44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ME4lepCTDaiBdE3UAEs86uArPM75PRdP2/SxaEDo12E=; b=ob/ct9nSY2lF8uWhR3sMll06SW
	JlIkYkZwqlvWpTc+vO43uCH3Uhp/iU00/SWkP7THlEx8eBFkLl6aK59iO0eHHcX9Ugf1JdDCf8sV4
	xqXDFNNbS6uIDiKNR3IiSN1TWYILYh0Dec+xHtOV/AIHqwV1P3FyqgVpM/t8/gG9QvMJuH200Xsag
	MBYXS5OUXthkMIyt0AlmV2obIhQtLh0ZSGaBcqubQXPKI0odqfvpJsPTgUurTk5r5hodRyun6BjLa
	WpCB4cihVeQ5i4ZozAJWUjybFRu3YFluwi1tI7Eawn4CwoY6a3QDW9LjdLbrsAkg5hPxadSSS93cZ
	rYMEJ65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRZg-0000000B6IZ-0u8N;
	Wed, 22 Jul 2026 07:41:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRZc-0000000B6H1-2QF5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:41:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-495590dde14so32303395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 00:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784706058; x=1785310858; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ME4lepCTDaiBdE3UAEs86uArPM75PRdP2/SxaEDo12E=;
        b=FmznA7fxJzSUvyHvBwvAlF+x2WHQ4rMeRahoDZ2QaJfVt0KxS7QOauc4j6pJRzj1RO
         7z/a+ASXoAfB7JztzAqZ6Vt+LNEMtbJ92hdw5w5El7WUeFfkwPo6NReAeMnL1Vi5GcR7
         Isn0E9zJvEeD1e2zdgaOXrpMrCF/vPE3YmF7hV21OACRXQPtRnh3uzjXBnY+KZWpJUGf
         gjOPL+z39cK8NuP0Fux23ljJGd0YJt9MiyfABKhKoOM77jGd921WMbss3EUb2FP097M6
         R7ybOdnBlTn3DVJ+xQh/UKO9I93L39CHcWS6hR7InQSwTcL/Ik3Y5trQ6u67qx7aUn2t
         yghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706058; x=1785310858;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ME4lepCTDaiBdE3UAEs86uArPM75PRdP2/SxaEDo12E=;
        b=fxxD3qfyIXXNpAvlm6iKzTWTrnw4/rELuafSo/ZGvn6MatmYJzoYIMdZ0FMKkIm2Ou
         M4eNk/PJnEIn7oEgKG4oFi0q4SJZFwdP7xmolUDzcsaKl0sP00Wdy7JiF6SYLTInPP2r
         Cf0j6jVY8eAgF7LRuwMEFSqSoxEh0nPPzVpb1iP41hfo4JiX6t33H20GaBVdlzxUBHvY
         LovOOI9qFN/lY0uNswLiRJDQ+cjeKYEPVVBYBJ6+itnbeAqtqt+Fl9xdpw/cg9vxkYEn
         RxT4skmpj4xvlRchLzMixeTRR1YnfSSMl0AukS7NiiMKSJaXiE7xLP/10VLo5b9Kg7+1
         vkyw==
X-Forwarded-Encrypted: i=1; AHgh+RoH9pRAMeedBAo6LcoOJvlDfLNYrrQAy3pWoNYRer7wyw2cjsJiLFog0I+oYxB6YzO54cIPHE3ndjnYHHOqoJUx@lists.infradead.org
X-Gm-Message-State: AOJu0YxsDRGdUDgpIg1WP38t0LcEBNK9V4C+qwQkyLvdnNVPvb9tO+xn
	VUUA2mKn9Y1eIiwFeBbbKYsO1HEjEf7fcW176sKtRuLTkMFZPvtvL8T7TsfDEU7n288=
X-Gm-Gg: AR+sD114g5C3kwjODzM1oS3rwmOQ6EYUZz6aZkeYWy1sqDihk/hXcTWPbuXrc/zJsph
	9JWZB9QGlfDRtKM0+kQOoPrkhofjLT1Zq8GFvn8qgrNDUN9Si/NFtZO5L/twv/UWHaD53j5SaSM
	FlpxH743XMamugrI7NG22YHYfuSJJZX55CtHAi3BLomtqN4rSBhkomIws95KEXFtOs7kgRjwzUx
	HMTyDRBhPhfAZe4pNsfG779d2TkI/Ly2z1sMjxMoqo2PTAVfxh6ax4X8mHRpooeSJvGaew0bu6i
	a7hTkuxYOTcThsO59BmkJ8XK3K0ugZP2RMAK5iaXvJoE1jy+9LYxGTHb6hbzQJmcHEhuf3TELkf
	Cam2sFn+rg6HIdJ2wFV89DGnqM4sOdbeHBx1krXz/xlZgAn0dlpWtvjMMtTe9FFEJ6Vgs3+O7CG
	lY
X-Received: by 2002:a05:600c:21da:b0:495:3e08:ad24 with SMTP id 5b1f17b1804b1-4954a51b524mr172945825e9.33.1784706057686;
        Wed, 22 Jul 2026 00:40:57 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a589:14b5:ba97:3626])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c52fc0sm3587920f8f.23.2026.07.22.00.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:40:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>,  Kevin Hilman <khilman@baylibre.com>,
  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Takashi Iwai <tiwai@suse.com>,
  linux-arm-kernel@lists.infradead.org,  linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: meson: meson-card: use priv instead of card
 on each functions
In-Reply-To: <87y0f3zwrt.wl-kuninori.morimoto.gx@renesas.com> (Kuninori
	Morimoto's message of "Wed, 22 Jul 2026 00:35:34 +0000")
References: <87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com>
	<87se5di0n8.wl-kuninori.morimoto.gx@renesas.com>
	<1jfr1ceqx5.fsf@starbuckisacylon.baylibre.com>
	<874ihs0vz3.wl-kuninori.morimoto.gx@renesas.com>
	<87y0f3zwrt.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 22 Jul 2026 09:40:55 +0200
Message-ID: <1ja4rjeak8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_004100_722161_1E5115DF 
X-CRM114-Status: GOOD (  29.63  )
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

On mer. 22 juil. 2026 at 00:35, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome, again
>
> I now double checked.
>
>> > The change is simple but it will make more complex to backport fix an
>> > older kernel once this fix is applied. So again, getting more context to
>> > understand what you are trying to accomplish and why it needs a standard
>> > card variable name would help.
>> 
>> Basically, after "Card capsuling" has done, we can't directly use card->xxx
>> anymore. So we need to update all of such code.
>> I would like to update such code as much as possible in advance.
>> Otherwise, "Card capsuling" patch itself will be more complex and difficult
>> to review.
>
> Current functions get "card" as parameter to get "dev".
>
> 	func(card, ...)
> 	{
> 		struct device *dev = card->dev;
> 		...
> 	}
>
> After "Card capsuling", we will use "card_driver" instead.
> But switching "card" to "card_driver" only is not enough, on Meson case,
> because "card_driver" don't have "dev".
>
> On Meson case, it don't need to keep "card" in priv anymore after
> "Card capsuling". So I would like to add "dev" in priv instead, and remove
> "card", like this.
>
> 	struct meson_card {
> 	 	...
> -		struct snd_soc_card card;
> +		struct snd_soc_card_driver card_driver;
> +		struct device *dev;
> 		...
> 	};
>
> Then, we can get both "card_driver" and "dev" from "priv".
>
> If we can switch to use "priv" instead of "card" *now*, the diff will be
> more small when "Card capsuling", because the patch will have
> "Card capsuling diff" (A) + "switch card to priv" (B).
>
> This diff of (B) part is doing very simple things, but is big volume,
> because it is sharing the code on Meson.
>
> -	func(card, ...)
> +	func(priv, ...)
> 	{
> -		struct device *dev = card->dev;
> +		struct device *dev = priv->dev;
> +		struct snd_soc_card_driver *card_driver = priv->card_driver;
>  		...
> - 		snd_soc_card_xxx(card, ...);
> + 		snd_soc_card_xxx(card_driver, ...);
> 		...
> 	}
>
> -	func(card, ...);
> +	func(priv, ...);
>
> If we can merge (B) part first, remaining part (A) can be simple.
> But yes, the backport will be complex.
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

I think getting the device from the card (or other ASoC element) is a
regular pattern. I get what you are trying to do with what you call
capsuling but maybe you should add an API to query those things from
the framework ? like Something snd_soc_card_get_dev(card) ?

The driver then does not have poke the internals of the card but can
still get stuff like that from it

-- 
Jerome

