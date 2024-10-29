Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B384DD2AB1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtRHRHZJbxkUHwLfJyAruL0+r7u3eJytHHCH6YWzdlk=; b=uuzxnm0dHG576CP7V06Hf9U8i3
	C8XAxl2NxPtbT6FD7CAkDPPbyRj7+xQvex5+sbQyJox6IvYjvLqulmq148lqWAcHUQN8DK3tAql7p
	PBlzbj8zLi5KsrCiFyXX0DxxgDrvqYA7i2YkRvhVdZxdE1QgDwFNBmDx5i2k9p9pDeUYIBqgcc6T7
	++4/jWQLL409DXTAABHmjNnyFS+hQS7FSK4GZOADtRBwF65GuO/LooPJNBHBMcqT0sWKN8hT4v4Jp
	ikk2zt8SRtjQgR7Ml1dDf6icZ/etdNrpkxWsdNOqsKxX3D7OgwH51zrDIHRxVQW1royMiW1dM5viG
	xwcKyUFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jXR-0000000E342-02uD;
	Tue, 29 Oct 2024 10:33:25 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5j3l-0000000DyFK-3qg0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:02:48 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53a0c160b94so5830594e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730196163; x=1730800963; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MtRHRHZJbxkUHwLfJyAruL0+r7u3eJytHHCH6YWzdlk=;
        b=cPmfJja1/gEAWUgTwCsCDSu7H8ygm4AgHnJ5cfQy0pV62RnY304JlpFkLLcRrQP0HS
         3jZN1MkQniacz6OIXZbrhDzoAZdZQPkFQeVIJboKkI/iIJzcEhupBkfJy+NiqYVuMboA
         h5vP9Ks3PQVqsB2FNN/Gz+gGU+iZhIS0XxBN6EdUB7CqQEoGoOrWPT4Xc44NB7Oeg73q
         0p7jpm4I+jtjDlLQ+EvRxwzchvrKHU6PlmREN5lUI6/K5B3PPKEsXWBvP+9Zbl0s/049
         w23VypglzbKR2rt9oKUUlCv8SgYBsEV3/QMx/XjoCgDZAsXAaz/KYrZFnMazrWQxTsP6
         iqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730196163; x=1730800963;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MtRHRHZJbxkUHwLfJyAruL0+r7u3eJytHHCH6YWzdlk=;
        b=kWL/lwcBz/9c9pDwynkB9Jt0S8I680YwvvGBgo3sh9e5OySFV7YIYnHh92UWEli4vB
         H9zjU1yI0++MLImEuw24hih2/fpmhAhCYsYeAcNJvtkB2DYR83cK9CiiZm5YHtXwWKkX
         nxhgfFWnizbYohzLFbwwTbf9R5nlTAXRm1OekJJo0NUVZVjlumO9j6HRdRAMA5YZUGkL
         hNhJBlmEq4Ggm56wgjiunu3mq7fABozJsRYyD3KfZo/N/gYlKwwz2l5sYhgqlTBh6hhM
         iRdCVWb7uZI30EQ81z0aYaL7GcLUeAH6c6uKiUxM8Heup8hPWssyYyTfx0oU4yt50VM9
         /4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBn0rub0qfmLFFvWbLcbQACznYv/SXxs4ndc15HlEPiHVNciypQg6nZHSb7stKIpHs5u8oHAif2yjaITQRgn7R@lists.infradead.org
X-Gm-Message-State: AOJu0YwRhI0bnXWmEAWWmbWgSq7KBQCbnHVUDKnxyKjPq8Ru/GoJBqEB
	sMkwUeaqqux+pZkvdJclfyBuu34yLuslnZv9evmdjSOVhP9adhWnCfT1i1pm4sA=
X-Google-Smtp-Source: AGHT+IGEwILz2Lx4Ssp9GAJRdhmg/Oj6nSmHRAC4gShR5qbr4sklCtvT1n0f4SFTSdo1a1GofvMf/A==
X-Received: by 2002:a05:6512:b22:b0:539:a2f5:2f1d with SMTP id 2adb3069b0e04-53b34c364fdmr4152665e87.61.1730196162581;
        Tue, 29 Oct 2024 03:02:42 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f65b:b446:12e7:273])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b712d6sm12023826f8f.78.2024.10.29.03.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:02:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Zicheng Qu <quzicheng@huawei.com>
Cc: <neil.armstrong@linaro.org>,  <mturquette@baylibre.com>,
  <sboyd@kernel.org>,  <khilman@baylibre.com>,
  <martin.blumenstingl@googlemail.com>,
  <linux-amlogic@lists.infradead.org>,  <linux-clk@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <tanghui20@huawei.com>,  <zhangqiao22@huawei.com>,
  <judy.chenhui@huawei.com>
Subject: Re: [PATCH] clk: meson clk-phase: fix division by zero in
 meson_clk_degrees_to_val()
In-Reply-To: <20241026072624.976199-1-quzicheng@huawei.com> (Zicheng Qu's
	message of "Sat, 26 Oct 2024 07:26:24 +0000")
References: <20241026072624.976199-1-quzicheng@huawei.com>
Date: Tue, 29 Oct 2024 11:02:41 +0100
Message-ID: <1j34kfuszi.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_030246_373384_E85BCAFB 
X-CRM114-Status: GOOD (  18.64  )
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

On Sat 26 Oct 2024 at 07:26, Zicheng Qu <quzicheng@huawei.com> wrote:

> In the meson_clk_phase_set_phase() function, the variable phase->ph.width
> is of type u8, with a range of 0 to 255. When calling

Thanks for noticing this. Some remarks though ...

> meson_clk_degrees_to_val with width as an argument, if width > 8,
> phase_step(width) will return 0. Lead to a division by zero error in
> DIV_ROUND_CLOSEST(). The same issue exists in the
> meson_clk_triphase_set_phase() and meson_sclk_ws_inv_set_phase().

It would have been worth noting that the issue is hypothetical given
that all existing instance of the mentioned drivers have a phase width of 1.

>
> Fixes: 7b70689b07c1 ("clk: meson: add sclk-ws driver")

The "problem" did not appear with this commit.

> Cc: <stable@vger.kernel.org>
> Signed-off-by: Zicheng Qu <quzicheng@huawei.com>
> ---
>  drivers/clk/meson/clk-phase.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/clk/meson/clk-phase.c b/drivers/clk/meson/clk-phase.c
> index c1526fbfb6c4..b88d59b7a90d 100644
> --- a/drivers/clk/meson/clk-phase.c
> +++ b/drivers/clk/meson/clk-phase.c
> @@ -51,6 +51,9 @@ static int meson_clk_phase_set_phase(struct clk_hw *hw, int degrees)
>  	struct meson_clk_phase_data *phase = meson_clk_phase_data(clk);
>  	unsigned int val;
>  
> +	if (phase->ph.width > 8)
> +		return -EINVAL;
> +

I don't think erroring out on this condition is correct.
A phase encoded on more than 8 bit is valid.

I think casting width to 'unsigned int' in phase_step() would be better.

>  	val = meson_clk_degrees_to_val(degrees, phase->ph.width);
>  	meson_parm_write(clk->map, &phase->ph, val);
>  
> @@ -110,6 +113,9 @@ static int meson_clk_triphase_set_phase(struct clk_hw *hw, int degrees)
>  	struct meson_clk_triphase_data *tph = meson_clk_triphase_data(clk);
>  	unsigned int val;
>  
> +	if (tph->ph0.width > 8)
> +		return -EINVAL;
> +
>  	val = meson_clk_degrees_to_val(degrees, tph->ph0.width);
>  	meson_parm_write(clk->map, &tph->ph0, val);
>  	meson_parm_write(clk->map, &tph->ph1, val);
> @@ -167,6 +173,9 @@ static int meson_sclk_ws_inv_set_phase(struct clk_hw *hw, int degrees)
>  	struct meson_sclk_ws_inv_data *tph = meson_sclk_ws_inv_data(clk);
>  	unsigned int val;
>  
> +	if (tph->ph.width > 8)
> +		return -EINVAL;
> +
>  	val = meson_clk_degrees_to_val(degrees, tph->ph.width);
>  	meson_parm_write(clk->map, &tph->ph, val);
>  	meson_parm_write(clk->map, &tph->ws, val ? 0 : 1);

-- 
Jerome

