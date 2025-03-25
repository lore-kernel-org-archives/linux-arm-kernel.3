Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B673CC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 08:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yug/5aBsatlN0TKX/juq/d600tRujIOyiR7/duVhtrI=; b=LLmynnAJ0p3sTn
	WBEmZNEmtDjs5lP1ZV/twXVWCC1UCVOxhqHIpYTFp2YeaTTNM/r4DDLomnRGwnBBMYahqxK0EsDcm
	y2x05+WTnDKJnmxPKfFZeAT0j+k4BLfoROkqM1LZz28U9WUZhATTSVPDTJg8+njROO8IcKQoNJda7
	ryUduTqmhwuvLo3+goKX0sHBaJ1ZZaXtqeiyhNaWbBpJXKwF9NZqahAmGrzh3F75qbGnjYRfkY298
	deKcvElknmTQQKB449YgmOU4rDIa8ps1mrKWNw3axbOehGCwwrq3GunpUoHLphsmKncBBkWXV/iVn
	DtD183WtJefhGakLmxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx071-00000005Fni-2rAq;
	Tue, 25 Mar 2025 08:58:19 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx05H-00000005FgK-3q9f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 08:56:33 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549644ae382so6667771e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 01:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742892988; x=1743497788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yug/5aBsatlN0TKX/juq/d600tRujIOyiR7/duVhtrI=;
        b=dRSSncQx2MmLYXK+CoMIJ0t90jp+le/o0QodtcHH+ct7GBuLf2g2enxNjaeuda2JBG
         cBU0jGsasiWljrxeoN6ZNET7cLRC3ILM8kAILvSRkpXK2RuVTnXDygJrcp3iv9/oq5sn
         2n00NEa2+P7/O2r6hWPRa+ynEVU2L00dksearmoloLyNvy1iLbdYEs1zrLJ5Q2uUIUyA
         5c3pMVFAnS91ybO4iOpyzjBouChksqUG+T5bnx5SYkzofHa8ypaECaBa6UuxELbmqnuQ
         ej9cOIqVe160lu2Y+DTd1pGYXMUks1/EJRlerkW3qugQVkcqqGyjQ6Pm5lVEyWtuBKmP
         VAvA==
X-Forwarded-Encrypted: i=1; AJvYcCWTmOcQ2ARtr6u64vQZjE6BKzaQmOr7HSnQW0mGvr5JrX5FfNK3bVJskEYYeGB+p5r4pCBhIr91QsxDf2sHhUkV@lists.infradead.org
X-Gm-Message-State: AOJu0YwQlzZqhOH/eueufBAPQxrGuR/pzY0+EBC5T3AFls9CZJZ+zRaq
	Qv1CJmXXmRZvNS0pBnjVBXX+OdGqFtgkjjNRAmZLCccRh2QeAs7/vg/uRaZM
X-Gm-Gg: ASbGncvNAii2NnC+Vbacc68KrqpbTOUUlXY9XNfnDy9R0YzkEfP4hLtNuR9N2VkQhor
	6T58b96Zlbp/wZ5WBU/0HYoWK+vDHUFy9jMjj/NFtVmBEN/U3z+JSFu/ZTja/P0MZugY6+hKPVY
	qAMZsi1XrTKzoTZmvGRxPGInBB8Z/TeJCMhZdZ+vNTN5qhflhvf4MkXCQ84mBmC3TjnrZfFLuY7
	IAkL6fH4kfwQAnazEdQ55ujV/CGql8ql8AdRG6ai1/1ss22pRCtFzXww2cr7vWW9pJV8dpo2gc4
	5kqjghOiRhCFzkAmjvJbXShKaXzFX6Fui5gJPKAotgCfGqnOp86yCE0cWjhtR3JoBDCa6iePGNa
	rug==
X-Google-Smtp-Source: AGHT+IHHf6Gp5LrBjqcYY8+VCtjKpxdWredwcFcZLlRN6UbPMqYJDk9sjqTKIVeGbu/uC0rvX09LBg==
X-Received: by 2002:a05:6512:234f:b0:549:893a:1eff with SMTP id 2adb3069b0e04-54ad6492e60mr5269571e87.24.1742892988150;
        Tue, 25 Mar 2025 01:56:28 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6509b32sm1422866e87.206.2025.03.25.01.56.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 01:56:27 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a59so55523931fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 01:56:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFQwWFTGYAHbPrEQHJBtTCjHB2YuTclxT8TInZ1K43DEkAb/7SSs9o7Om43jKUvLGey3WM+MdqYfSPm1UN8BiP@lists.infradead.org
X-Received: by 2002:a05:651c:221a:b0:30b:971c:96e6 with SMTP id
 38308e7fff4ca-30d7e2a2635mr57206101fa.26.1742892987667; Tue, 25 Mar 2025
 01:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250325032833.604073-1-nichen@iscas.ac.cn>
In-Reply-To: <20250325032833.604073-1-nichen@iscas.ac.cn>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 25 Mar 2025 16:56:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v65e8Hk7aZ543pEXYKJ9VDs1znuCtaDDdCOfaRKWrT2MdA@mail.gmail.com>
X-Gm-Features: AQ5f1JornbCi49rWdD7DV_uaQAEm5VTpxGrz64paaXxDiD5xJP4tev5eWwCG9IU
Message-ID: <CAGb2v65e8Hk7aZ543pEXYKJ9VDs1znuCtaDDdCOfaRKWrT2MdA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sun8i-codec: Remove unnecessary NULL check before clk_disable_unprepare()
To: Chen Ni <nichen@iscas.ac.cn>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	jernej.skrabec@gmail.com, samuel@sholland.org, ckeepax@opensource.cirrus.com, 
	u.kleine-koenig@baylibre.com, megi@xff.cz, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_015631_953743_EB97C703 
X-CRM114-Status: GOOD (  15.86  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Mar 25, 2025 at 11:29=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote=
:
>
> clk_disable_unprepare() already checks NULL by using IS_ERR_OR_NULL.
> Remove unneeded NULL check for clk here.

Please also clean up the clk_prepare_enable() call.

ChenYu

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  sound/soc/sunxi/sun8i-codec.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.=
c
> index 8b9eb1a202f7..a27976c375fe 100644
> --- a/sound/soc/sunxi/sun8i-codec.c
> +++ b/sound/soc/sunxi/sun8i-codec.c
> @@ -274,8 +274,7 @@ static int sun8i_codec_runtime_suspend(struct device =
*dev)
>         regcache_cache_only(scodec->regmap, true);
>         regcache_mark_dirty(scodec->regmap);
>
> -       if (scodec->clk_bus)
> -               clk_disable_unprepare(scodec->clk_bus);
> +       clk_disable_unprepare(scodec->clk_bus);
>
>         return 0;
>  }
> --
> 2.25.1
>
>

