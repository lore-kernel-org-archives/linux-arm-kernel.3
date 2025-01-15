Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65554C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 07:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJOZ8iSprIsgYBR6gktJkwTdtpdLQhJkgJrSkbc8Vag=; b=Q7821T73DYhjFXDsWDnGnHL9FQ
	WkFKIDCBeJdQ1qNdE7D6BNf7ZwQ1qzM2XDN6AV3ZyRoo7i2kMoO7LfTmKMR32cQMnpckKK9PbkLyp
	bTT2uesefq7YddqFmHm7CYfzWHvd8KQBC5EiPKXXxbqZkZPnxnm3RnjAf6cPC864+vudCJgxhhOr3
	Lv35a6/mC1bW4lQYzLuzsSMmT5lBRKsi69PXOPZRCGtwFAvl4ZRUiHsf2Gg8hRRk230xBqbgepUax
	fMmzwVsIlaO8/5JOXJMEHHIQDnppAWkeyk0Yth/sRCa3+cheNGqtQ4ZYrJ4Um2Oxsz2aZUgX3DHJZ
	BnlTUNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxkD-0000000AvYp-3QmQ;
	Wed, 15 Jan 2025 07:23:17 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxix-0000000AvRN-2M2d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 07:22:00 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so1355230266b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 23:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736925717; x=1737530517; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jJOZ8iSprIsgYBR6gktJkwTdtpdLQhJkgJrSkbc8Vag=;
        b=FrHmR3QB99I16ccyBUKanrfS1xbqMFX6K2FJ/aBkLzpKv6IFN43sMJWqbcgnYZEh4q
         KQ/SBDMc2Oah2pxjSTZHvANiXa9C7PgSGwjChbILbDxHGL9kitflzkOy5rSGTfvCqyH+
         42byRdnLolkZs5p6JNVJWP4L5rKL0q3MChvNCXNLOBI2Tz6OF1NAXUT4VTgrjujUnNis
         haahJCNpepo/oNhuMwXOezabKHRpeJwouYAFoAKk/jQjy+Mv2bBe2W6j73zO9HW+DiGr
         gLfTrNzgVnZrJDVwyU4TV+XAyblmm7Gg600TvOsGr8z9cov3TunMQY694ASx0y6oKcSI
         wWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736925717; x=1737530517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJOZ8iSprIsgYBR6gktJkwTdtpdLQhJkgJrSkbc8Vag=;
        b=FJ2ykBYpLR1wJD1cmqq5Zj4wVVgRn/Pkc9/ytVexCZgSkrMpxBJGcllUbMupzeKxSz
         AM1cKU4BD+k+0dpeJIVPyV3tA0FSGaN2yXOmDxeP7uSopVIUxHsJHsosQf886Gq2dvHM
         8rpxqSepL8nxjv6zE39a+Yp14gkvOWe2VpmCgNSLTQMppAXoDIUNBAi+fUJGLGGeH0yP
         02WScE07Zz5U066UOyGXax4xmx1GQFwHS/qcodgflXEgusRiuuPl6RAvrpoqp29pF8pK
         tVuhZ42/YCvSFJXNxC31dRoAQDaQt42M1PR1GOrmSpnr3woIdpVsR6X8Xdd+mPAlvb4I
         FevQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMA/M0fbNBjz1obfJ4JCECgN/dbc2yrZ9pgX1XeDo21XdHrB6UrxKlROTe7h+hXbRw0CYliOrMTtadiApdN96O@lists.infradead.org
X-Gm-Message-State: AOJu0YzyYCOufrII69wOPJ49CosynK6EmDz73y28Uy+//Hk/W4mw3FXU
	Tn5zH07OFBqkRv2q1UnZpsB6EF1KHpAhyMq4qCFfXVCqBh1u3KRP
X-Gm-Gg: ASbGncshM/t7BQY3DMT+gd+JJEGpifZlPBz+A2Lh8QhAwNGpi8rsYjpFQ64RtjLtR98
	Mb8mb4gXZp/K5JZhhcn8hKWF/zNYULfRnr0vaQuC4fs5fuchnB4yemRiCjFjLt37vyaQqn9itNw
	LOzgal8HQbQPiDk+dyRvnGwVuU7vuLvXTl3wOZ64biotWrlNoxFGuytyyT+tgPRVV2ctCs+Dxif
	ZgXPK59rU11AmPBS1XBoBLYXqTGqZoVveNyMRUJ3R1MRsKx84sJNuvQFA9HsJWSL9CTQkB30ApI
	7GvIGzp7VsHh5zdKM13H
X-Google-Smtp-Source: AGHT+IEo1jzvdjSj4rUavMi44j/cz7y7Xxsd1KUIMl5S9cj4ZW7fgVD52s71mpMGjJigjjX+CyoeUQ==
X-Received: by 2002:a17:907:d89:b0:ab3:3aa6:7d69 with SMTP id a640c23a62f3a-ab33aa681a2mr637798866b.41.1736925716928;
        Tue, 14 Jan 2025 23:21:56 -0800 (PST)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9563b11sm724880766b.128.2025.01.14.23.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:21:56 -0800 (PST)
Date: Wed, 15 Jan 2025 08:21:54 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] clk: Use str_enable_disable-like helpers
Message-ID: <Z4diEj__bbQl4ULS@standask-GA-A55M-S2HP>
References: <20250114190612.846696-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114190612.846696-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_232159_599103_E42230C7 
X-CRM114-Status: GOOD (  14.28  )
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

Hi Krzysztof, 1 note below.

On Tue, Jan 14, 2025 at 08:06:12PM +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:

[snip]

> diff --git a/drivers/clk/clk-nomadik.c b/drivers/clk/clk-nomadik.c
> index 06245681dac7..f3a73ac5a1b9 100644
> --- a/drivers/clk/clk-nomadik.c
> +++ b/drivers/clk/clk-nomadik.c
> @@ -17,6 +17,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/seq_file.h>
>  #include <linux/spinlock.h>
> +#include <linux/string_choices.h>
>  #include <linux/reboot.h>
>  
>  /*
> @@ -116,9 +117,9 @@ static void __init nomadik_src_init(void)
>  
>  	val = readl(src_base + SRC_XTALCR);
>  	pr_info("SXTALO is %s\n",
> -		(val & SRC_XTALCR_SXTALDIS) ? "disabled" : "enabled");
> +		str_enabled_disabled(val & SRC_XTALCR_SXTALDIS));

It seems like you flipped the logic here. Was this intentional?

Regards,
Stanislav

