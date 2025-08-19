Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D300CCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eD1gZysHH3Kbz+8Qw6JjzfoRuZbWl8/jLJiaW7ypQ5s=; b=m9Gceryn8ZD1es7/Rjn8QoS0m3
	WWl6quptOp5z8SyHVUER1819/b8jaQVyWEEOMVf5NxMW/KuFTVZiAlZ7bNSIjzgI4wZe4U+SwK9tR
	G0MELWODg4ln+k3Y1/XpOUSfGhQ4bhuz7Ov5s9WW/pDm1HN1tzLwFMRiMxFyXioHpXkrpBbY/ZkY3
	4qyAa+X7vwBX8zrKFf4GtF6+fBTRdhzsJtQ/pU08KdJTvemjTrDeDuEm8MOuCkhbO9TjS1rnrgitD
	mFyISoqhX60WgEETonA8K/b2dd3Wu7jnDryvywGjRsA1plhh1OHfsuyXqSzFMeepTt1mb/BxEjYlv
	1vNPSgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOym-0000000Aza2-3iH8;
	Tue, 19 Aug 2025 16:14:32 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoM2n-0000000AWuy-2qnL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:06:30 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55cdfcc0ceaso5551530e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755608788; x=1756213588; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eD1gZysHH3Kbz+8Qw6JjzfoRuZbWl8/jLJiaW7ypQ5s=;
        b=GdCJac5j1b5L9RTNmlmekaOUQh/eIh9ByN6qwZoraGH2jE1Ce27YnVVO4PVMadut3Y
         5swvl9ZI7Si7HKX06yp2c9lc2P27sC72t068jsytysnHEjeUg9EuoXAGH2vMkzS8k9/o
         P6TwuJ0JGD3T2AaynEy5on+xIYcI25DdzpRPPNLc0PDYhPwdnmPIL7Za/Mf1gMFvaub3
         /7ija6BnIcIKKGWd5LmgslgkzRy9YQFgwIxX4Vwy/WDnE3lJKW58QRyGVHRByeF96Gcg
         d4kUVeT4XsZE1Kx3Hk1cnrvz3ZZyKCbtFQ36hOEoMNejOq0UH7muyTeg7GRNoQv8XM85
         ZhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755608788; x=1756213588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eD1gZysHH3Kbz+8Qw6JjzfoRuZbWl8/jLJiaW7ypQ5s=;
        b=WjAEwXbP5qjMbh7I5Z6ZEzTNvqrRNQ91vn/ePOpGueymlROB3Zswl20fgTG5B1cvq2
         IVyw6YyaHxdChVQhzFZITNUR2A5ScRyVlLQkFlA46qPFmqwnSN4FJSwZUfjJXOjJw+dJ
         PXrKuGFkriB8vtVxBHhSMJBW4JAHlZfFMLA60j3n4enWES3grnIwTid9tUhWUIM3vYUb
         Yt7FyHoNGHrWjoGQRFs6U/64WX+sHkxZEo5rKIm6QvSE4XcYpJxtKxksWlt+/+FgI4nY
         0nLFOcc6KpOKg5yrGf7o0W21mD9p/4qxChwqLPneqaqnwV0ijh3ugQT3vHE2k47TYiAC
         dxBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYu8MuwAXUJtDxWjWp4h08Ed3IrWFi0hhYdKeFqp7d5TFdRlF4dOKeqRCR4Y01dxFY/0i0jKCBfO26RPo67cvJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzI8KE4BrSRmCNin/lGctdfpldwoJlqoOq8XKOXpLNkBZi+LZiH
	GP2K6mu/25pN7aYxwOAgZkt2btyF4TB83pMEo4L9pQBQoMicrx4/iTK87nK3ufqV5zHQpQ0j+TB
	iQPeRTb5aQmAJ4JlR9O0ox2sn4Tb0/Rw61cWa3JNCWg==
X-Gm-Gg: ASbGncsYkgI0zFeY9yDW8u0b9sqhNjiLi3q8wFKr6zPVV23TpBU3lJyajTXVx7OUpCW
	g6hf48uDMLqgFPvi9Hqd2YMK9cV4yKOhAEXVCWt4bAFqRCbWNS8I6Q6umhjDc6W7N3OBiOZkeIs
	83khgdthrQOaoDsdQdXLcE9hc4lafaxnl1ZQYoh6VzhRNi4J48Br95ZhBKDg+dheQUQOEgBL3j+
	V4cxwj51VqW
X-Google-Smtp-Source: AGHT+IHuZ1v8yqv5nFpHB3upOq5k48bLEGZvcHQzbQtjR6KTrGahQ6hImQ+OMjokOiyokuX8aJCwdENgo4zYpJr/r7I=
X-Received: by 2002:a05:651c:2208:b0:32b:9792:1029 with SMTP id
 38308e7fff4ca-335317cd294mr8926241fa.14.1755608787940; Tue, 19 Aug 2025
 06:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250818142402.132008-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250818142402.132008-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 15:06:16 +0200
X-Gm-Features: Ac12FXywhv2FGXVaL5z9CRtgqv32XD-L-_xhhK3a7EL-XoMsHmHhIPyxRqHeipY
Message-ID: <CACRpkdbdTHg8Bn5L2Jc33=qTohD7aVAHuv1P0H2x7jxciojzLQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: Constify static 'pinctrl_desc'
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_060629_716828_778BA414 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

On Mon, Aug 18, 2025 at 4:24=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij

