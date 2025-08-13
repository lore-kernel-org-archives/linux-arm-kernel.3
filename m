Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA48CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIKzP+v10goqJv8MZ6hUQxh9iZh9GLNgEJG//KT6geg=; b=rv1dEKkjTn3MvJNmNSfRLAu8+1
	+HHfXF7PINReOEtiq/G5NHAsFnM4DsSKre21RxmX7+XxwNmQHIwCR282TkS0wA/7NPjkEII4uOdaT
	gydQuZxuhF4HmSa0da63JdpqTB9Fv25SL019pAjRDfrB85f1AEtaBHvamRgReKMyDSTOsrxsS5B3U
	6RPeGB+/6LDe9fgyIe1/8Dg4QzMUAEk1iUpkNkUGrFOqV4Nc3+5UDwRaiEqbPliRjx1XcjpdJNGVV
	TKJ+IcYnOwdoB6xfUGg6DaZ00AlNawxwPJgeDaqS1be/a8yf9Ab+rAk9yYkkP4YOyAgyeF6oDi7lM
	LTnpakHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE3Y-0000000EKQP-0rT2;
	Wed, 13 Aug 2025 16:10:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDLi-0000000EB8i-0NWU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:25:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b79bdc9a7dso4104912f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 08:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098708; x=1755703508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIKzP+v10goqJv8MZ6hUQxh9iZh9GLNgEJG//KT6geg=;
        b=av6mcQ+SfQBC9zlHFsy8Dh0+ZYzh2EiyQJunOQdYhcm6YkrMCWoxDg19LXeNd+XYZD
         3fRdxc56W7BY8mzksOWe4U/C/TXNy0EFEg1kOO2kEh3wvsVGZ8aT7R1Rz9wopb414DKp
         XXJfyLa96osti+XJ9ckD+0Vqf+688WjQIEoL11VFULzkUPErtu8pRIiWragp0ie2kjs0
         IHRi8WrBSIgk8p6KOIqTQUW1MwBd11L7vyvJeiPXz5094ecYzKn5axjkWNh5IF0MEbnc
         fnjlYZyjJ6jMHJkoGik0EINA0xyv+dnjpgc7pOtZR2JuLPXMv+Py35DOfMHiMs29pIt8
         dfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098708; x=1755703508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIKzP+v10goqJv8MZ6hUQxh9iZh9GLNgEJG//KT6geg=;
        b=KgTDQsUnhFoa1IYsf93JhhmLAh3UFTDTUtcjokU/Xreak6dnct4DDercbea8Mbjpfv
         CNFu/t2X+5h8uVflSjOFZccgmU2bMgirZVDbMx+jfB46wrvzxoZOPRtQCm+3DmhoNwU6
         ppLawpsY3XXlhIKLmyWmYJQPxfhLrTK4+Ra5aBEOWsWtnXAmURXapJbGbE/C8MZsCzI7
         8g/9DNKn+mLJJC15DrWmIsjOvtv+zbksevssiRijC68aUjh80AXvTVa2w+BCKb5xhIz4
         4UpIo1TY22tgSVzAKM0QJGuw64UrfLJl2HFgXxYaQXbpPR4/jdpnV8P9SwZzYbT3xQbc
         WlTg==
X-Forwarded-Encrypted: i=1; AJvYcCV9IvhJVB8D2h4gn0y1Im5tnkHYaCKZfuJlK3YyyB9oQ948TVj+lgn3uO/vFi07lonn9PSFVg5XaqORwZ5budsw@lists.infradead.org
X-Gm-Message-State: AOJu0YySr/cyGiUgvzdoUUxdZ1CFW+zvK8B4n2BjSU9vTqR82wcvOppC
	0szTy6Xq/SUGTcDm99O+u5ln4FecEgXN/UMNrEHdTt0h+bJYHovQAS/v
X-Gm-Gg: ASbGncsvxRWBEGKLDgTBsHqXNPKNLQvXyrtouMBMhhEx1mEfeAdQasYppXod3wQM4gT
	45jJQgUv+CkMnY5m/eZd9Z7JeghOmNGNqA/DNmR48AXp5uwjfUyujEVMOTMTnmR1/V734qBIKA4
	zJweCcSGIl/npapSE0lpcZn4GPw+Smzi0fPmp3YTWd/akt7hVsItG6vajODUN9+Q2H0WFdzI8fY
	fBWgjt6IxthBdTV00Qz7Kg6uM9Aa1YwRCYIVYHoG2b/GU+S4DLFkHY8uUzv5rvxpEY27VX0HKEw
	qlRWFXNfzwWCJM6P8/scV4koa/F7jRfTg1wmMCC0QyXJnlCYhtUNgVZ1gCdes+mAhJpkDruSISe
	GM8ROGYVIztY9tAus8ByqYfPU707a4c679PGsDzU5iuhCw3bcL1eBX758QEPi1mPtCwkIL0mhlQ
	==
X-Google-Smtp-Source: AGHT+IFDK6njZdaYiIYPO/ZMO6ujPoE/G41Mb7N255M2MT+1frSU31mMtoR+dOSJ53Ri0BsuUYgPGg==
X-Received: by 2002:a05:6000:2c01:b0:3b8:d4ad:6af0 with SMTP id ffacd0b85a97d-3b917f14e1amr2572720f8f.40.1755098708425;
        Wed, 13 Aug 2025 08:25:08 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1abcd59bsm465535e9.3.2025.08.13.08.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:25:08 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v2 04/10] soc: sunxi: sram: register regmap as syscon
Date: Wed, 13 Aug 2025 17:25:05 +0200
Message-ID: <5910992.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20250813145540.2577789-5-wens@kernel.org>
References: <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-5-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_082510_130520_A24CCF98 
X-CRM114-Status: GOOD (  22.18  )
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

Dne sreda, 13. avgust 2025 ob 16:55:34 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> If the system controller had a ethernet controller glue layer control
> register, a limited access regmap would be registered and tied to the
> system controller struct device for the ethernet driver to use.
>=20
> Until now, for the ethernet driver to acquire this regmap, it had to
> do a of_parse_phandle() + find device + dev_get_regmap() sequence.
> Since the syscon framework allows a provider to register a custom
> regmap for its device node, and the ethernet driver already uses
> syscon for one platform, this provides a much more easier way to
> pass the regmap.
>=20
> Use of_syscon_register_regmap() to register our regmap with the
> syscon framework so that consumers can retrieve it that way.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> ---
> Changes since v1:
> - Fix check on return value
> - Expand commit message
> ---
>  drivers/soc/sunxi/sunxi_sram.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sra=
m.c
> index 4f8d510b7e1e..1837e1b5dce8 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -12,6 +12,7 @@
> =20
>  #include <linux/debugfs.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -377,6 +378,7 @@ static int __init sunxi_sram_probe(struct platform_de=
vice *pdev)
>  	const struct sunxi_sramc_variant *variant;
>  	struct device *dev =3D &pdev->dev;
>  	struct regmap *regmap;
> +	int ret;
> =20
>  	sram_dev =3D &pdev->dev;
> =20
> @@ -394,6 +396,10 @@ static int __init sunxi_sram_probe(struct platform_d=
evice *pdev)
>  		regmap =3D devm_regmap_init_mmio(dev, base, &sunxi_sram_regmap_config);
>  		if (IS_ERR(regmap))
>  			return PTR_ERR(regmap);
> +
> +		ret =3D of_syscon_register_regmap(dev->of_node, regmap);
> +		if (ret)
> +			return ret;
>  	}
> =20
>  	of_platform_populate(dev->of_node, NULL, NULL, dev);
>=20





