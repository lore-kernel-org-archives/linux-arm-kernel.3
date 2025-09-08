Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B837CCAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bi8yTXJoOBwCylt9q6MtHjP7YgyhzTMi3lxmixfzTvA=; b=oeXmgLDfz/4F/qw6Q8qJN76ats
	YuaGvZjplHp0Ss8seJ8yj7zIZPCG/2gvf0kCWYNxoD2pjfRzK6CuxpM1QCGxMz6iwd038Vf/rBUYi
	mvwnD8BVI9acNpPiQrzD3G6dcljfouds/rtfMy0zqIq3iriDD45j8S+/O0E817a6MbUnQ6CwngcIQ
	iu0LlkhuFD1rQFHiWI17hVGFe66iitnRr4yETNR5gSyRJjpOYjqQRc3cu5ooCGGRND68NnfGNC4Nf
	3u+iFJ8v75SR4XIYwxDdCPIvhnwY0ysLOqMi3FnQq0JME8xLqpEu6iThCFAGv8g0p8Af7jUrBfjVL
	ZKbn8Lyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfqd-00000001Gph-1xWz;
	Mon, 08 Sep 2025 17:40:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcJ0-0000000HWNb-1Il0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:53:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45cb5492350so28559615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 06:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757339593; x=1757944393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bi8yTXJoOBwCylt9q6MtHjP7YgyhzTMi3lxmixfzTvA=;
        b=fiM6E/jLXs5OCa25uiHTCQhwGkvtDC15pWF11oKyFnhcEzYvFLhGUYwFR20Mfg7hJ6
         v1aydQisNbrPNjfRqkkZabWjoM4GMtP3pbJJUBP8vhRHGFpLR6Yz2ZnhYG4gf6W7clnM
         XMNgWRH0sWrH5DaDe+yfSW9w5uuvc3JwcahwOn11kY1LQ3eh5pdl7Ug37aiX4otmA7Rt
         VopLCVP7hY7ODTqkgZ1IwPEI7Xqxsm+aObmxDr0blcc5xSloGf7Jq+VnqR7QDFOr0m1U
         3wLvqRxvDCAvzWkqpnGl6G6OIrOcu0IyoUix+Y9OZ/dNpSyda1pMTF9RTntzBW16utUg
         EDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757339593; x=1757944393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bi8yTXJoOBwCylt9q6MtHjP7YgyhzTMi3lxmixfzTvA=;
        b=TyyaQjp+c8SycTrXZaEamooQw0RCRKPjseTguaJj4L6iLzVRIRYa2dsjI5s5q97ixH
         RxFic+kvWDeceggCKSdZ2fY/8lExEzYZLzqD+fDV73S2G6lh48SWOUiyw1X/tGbDAKNf
         BGkZqKZ09HDKGPM9iSvxDhB7cS9rwJoZf56EFblUgFctvJ5SyOAtS9XUzIukjJMMa8In
         1bG+AQ4wFUYU9Ydy2iVwZVdyJ7sF4iCFrDslSWhD4ijRXhfPMIznilvf8/ViugNkW3i3
         Bbi4CSFki9CRq1Mls5Ge4HdHXSYpnhT138exuhtjtYJwBuxb1dqmgMuwrWuVW9QqJEuX
         95XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfUIWsn4HhfFwflT8lDxEFpiRLOwr6vs10XOIeR4zKpc++iqapAyRftWVGFr6X4WA/2i+d1RcvPWcaSQ5DAm8o@lists.infradead.org
X-Gm-Message-State: AOJu0YxUUqLMpq+vbUCPvErMIL23n77DhXi/QlzY+VcbSGNXfcZ3asah
	4DA2fTt7a/j1FO+oHGg+0+hyNm156QJhNJidU25ji6kThHUwH6hNXed/
X-Gm-Gg: ASbGncu8DFRbL7YtlA+aEfNJwzopYWsieJME+Zw3X7c7YMDBI6WQry80xIt7YR48xXe
	inGLRNJZ+PGsUohZ+Z7c94KGx6TNpp6CGHy+gai8b7rJ18sRe59VBx5P/nuv7GUzwrMv2e4KdyY
	HBeFHr4bTmztLn8QdR/Sqex6LSQMqjw9wu4qP83vGX3ly6y8oSOwYJSjesJSbyJ9mucCh5Eqbud
	KIymS1OhEje31rViI387DVqRWIaoSsmpRcQ/bZWj03LoxuTtPIumKx+lqEhzY11JlF0B5vG2Wnu
	4E8NLLFBQciX+N2+I7VFUFQJ7VyL6lATiTTd2rsO1WA1fi5hc5rTpGb8VQWa82dw6sfN+B1JNwF
	BD3E/6p6JdlJjK0nFfjK912o3nAlVXOe8mFfKeg5zfvwyssPG1LYGZbqOF3n8aLEFdhfvsLYPIY
	M=
X-Google-Smtp-Source: AGHT+IFymJM5Q/838u4sNcO2o9XEJ5qNZ4BhV9dGgjKVBrrKdv1vk6q5UfzwHAK51v7oPTW2ilOY8A==
X-Received: by 2002:a05:600c:3b8b:b0:45d:d356:c358 with SMTP id 5b1f17b1804b1-45dddec3b92mr84964785e9.16.1757339592629;
        Mon, 08 Sep 2025 06:53:12 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45d468dbf48sm206620575e9.11.2025.09.08.06.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:53:12 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH 1/9] pinctrl: sunxi: rename SUNXI_PINCTRL_NEW_REG_LAYOUT
Date: Mon, 08 Sep 2025 15:53:11 +0200
Message-ID: <5037008.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20250821004232.8134-2-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
 <20250821004232.8134-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_065314_352771_47B87A4D 
X-CRM114-Status: GOOD (  22.58  )
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

Dne =C4=8Detrtek, 21. avgust 2025 ob 02:42:24 Srednjeevropski poletni =C4=
=8Das je Andre Przywara napisal(a):
> After keeping the pinctrl IP mostly register compatible for almost a
> decade, in 2021 Allwinner introduced some changes to the register
> layout, which made us use a flag called SUNXI_PINCTRL_NEW_REG_LAYOUT.
> Now with their latest SoC (A733), Allwinner changed the pinctrl IP
> again, so "NEW" isn't really a fitting name anymore.

That was bound to happen.

>=20
> Rename the symbol to SUNXI_PINCTRL_NCAT2_REG_LAYOUT, with "NCAT2" being
> a name often used in vendor source code to signify this "new" generation
> of SoCs.
>=20
> Just a rename of the symbol, no actual code changes.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviwed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c     | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c b/drivers/pinctrl/=
sunxi/pinctrl-sun20i-d1.c
> index 8efe35b77af4d..37a60e5d1163b 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
> @@ -821,7 +821,7 @@ static const struct sunxi_pinctrl_desc d1_pinctrl_dat=
a =3D {
>  static int d1_pinctrl_probe(struct platform_device *pdev)
>  {
>  	return sunxi_pinctrl_init_with_flags(pdev, &d1_pinctrl_data,
> -					     SUNXI_PINCTRL_NEW_REG_LAYOUT);
> +					     SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
>  }
> =20
>  static const struct of_device_id d1_pinctrl_match[] =3D {
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinc=
trl/sunxi/pinctrl-sun55i-a523-r.c
> index 69cd2b4ebd7d7..86a12bce0e335 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> @@ -36,7 +36,7 @@ static int a523_r_pinctrl_probe(struct platform_device =
*pdev)
>  	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
>  					   a523_r_irq_bank_muxes,
>  					   &a523_r_pinctrl_data,
> -					   SUNXI_PINCTRL_NEW_REG_LAYOUT);
> +					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
>  }
> =20
>  static const struct of_device_id a523_r_pinctrl_match[] =3D {
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctr=
l/sunxi/pinctrl-sun55i-a523.c
> index 7d2308c37d29e..0f703cacfe5e3 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> @@ -35,7 +35,7 @@ static int a523_pinctrl_probe(struct platform_device *p=
dev)
>  	return sunxi_pinctrl_dt_table_init(pdev, a523_nr_bank_pins,
>  					   a523_irq_bank_muxes,
>  					   &a523_pinctrl_data,
> -					   SUNXI_PINCTRL_NEW_REG_LAYOUT |
> +					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT |
>  					   SUNXI_PINCTRL_ELEVEN_BANKS);
>  }
> =20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 0fb057a07dccb..0a5acbd978da9 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -1521,7 +1521,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_d=
evice *pdev,
>  	pctl->dev =3D &pdev->dev;
>  	pctl->desc =3D desc;
>  	pctl->variant =3D flags & SUNXI_PINCTRL_VARIANT_MASK;
> -	if (flags & SUNXI_PINCTRL_NEW_REG_LAYOUT) {
> +	if (flags & SUNXI_PINCTRL_NCAT2_REG_LAYOUT) {
>  		pctl->bank_mem_size =3D D1_BANK_MEM_SIZE;
>  		pctl->pull_regs_offset =3D D1_PULL_REGS_OFFSET;
>  		pctl->dlevel_field_width =3D D1_DLEVEL_FIELD_WIDTH;
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index ad26e4de16a85..fb17fae2dab69 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -88,7 +88,7 @@
>  #define SUN4I_FUNC_IRQ		6
> =20
>  #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
> -#define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
> +#define SUNXI_PINCTRL_NCAT2_REG_LAYOUT	BIT(8)
>  #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
>  #define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
> =20
>=20





