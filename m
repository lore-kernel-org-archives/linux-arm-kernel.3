Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFCDCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Al/qX1qt84RxLjmC8/RQc6iv8G0Q8rgfIYnhnorUlSI=; b=c6XYn+BzZXVY3QyLre0vP9SdTQ
	f7Mse28jSZMfhfvNiSmzYDYt7FJf4TtF+tGHD4YfnqFW5CJ/ncXFgDDkOgBlLmaEX/9FLNWUZawA2
	NJbi1sAzgeU8E3amayemlI+Bg454dNWd5fGcWRI9MjRmZB1ljSvJ9FMa1iaFxM+rAPQ0p0RwV0c7S
	Vt2ENEG6psdpFSIm/gdmucQZ9WUny1bZZgWWkDvjT7YnzlUa3YroRDyxhbONYMYw2B3rs03xi95Eo
	xdprIF1Br4kHNC+aZmEBgy35iMx+5POjlX/3R9zBQol+UZHiBaIokfk32YAl3i76gOc3BeSoYIGgo
	aisiXwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE0y-0000000EJqW-1H5L;
	Wed, 13 Aug 2025 16:07:48 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDKb-0000000EAyD-40jw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:24:03 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so4486386f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 08:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098640; x=1755703440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al/qX1qt84RxLjmC8/RQc6iv8G0Q8rgfIYnhnorUlSI=;
        b=YFb++r5tnMq1Mg8SzRWUCo/9DxLIAqGTImLQq/Z7ET5g83Pi14JKQq3mQuNUeWV4GW
         NFg4/kYj9v3/+hq2IGlU0IFgdJ7Smh8XbDHGNAlEZgg2FgzhJavgoJ6SpmKsbFpilTlJ
         A/gROpEYHT2Uk7e+wAik76WSXaCRMu41LidnYSbRfqcrlN5+fyC0dbbox/gNsyt9f222
         mDCn2ll1Te2TZTWO4cPjLAcagezVsVZvQSYWQPfLcWL3Sx7u8GqmE7iBQ57LAegOgZ8A
         cXEFYDFvJb/sSJXB+4Z6EyoRgeb2R2YPUUzjveLNkLZZSbBSczdOZ5AbG2B3cefDCmQ9
         Q+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098640; x=1755703440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Al/qX1qt84RxLjmC8/RQc6iv8G0Q8rgfIYnhnorUlSI=;
        b=VP/2Q51uH9S7kVhglnv8/9pIu+YJOGtT2gsXzIK9tjMWNiShfEILANfKTpBH/NbPmI
         ST3K9YGk2hODaZDqU3vaI1/WqW4gVD7qPWoJjXwKdBUQL3u6V/xVgiMji7CA2q9FhK0R
         dXdGF7uwTCbN+aVNfe8zC5RAxz5c9vnpwkxM5g3LCFOD9JEpMg0ZpmtEcc8drwlzgRY9
         hAMEQLCw3r3n7bIHfQw02ShftVUeMaL2+aSWzyp8cJD3Risp/jJ0QkYpq5d+7EK6/QOo
         NJrC0J4yO563z9ngZApZ7kTmfCfAAAUgeAvlJ9Sqb9/yq393khXDq5aPlW3ysrpX8ojl
         WbpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCo5JLEuRuvi1h7nBcGcPr74KYpPcGxz0gKoaP1/nXZmiV5DJ0Q+F3+L0nFd4PqRdUi7Aiu8JeQn9cRExBY9AU@lists.infradead.org
X-Gm-Message-State: AOJu0YzNWA/wlVmhnxnjWSLrziPHWCljnSekM1VG2EVB0I1izvWxS4b2
	VamAkuHeEYWbT83TvDgMTqUzOg7wsdW1il8tm5dRYYjzZv46ChFUDC66mgp0Ug==
X-Gm-Gg: ASbGncsTZipKIaI3MSnmty4VfRINZk8/e4mXQKJAvPqDxrvblWjfwdnCeIvTg+e3Fz4
	dwelsbp7N7XmgFJ1fQVyRDFLdvpIjhpsPZccVreRtOPuoza3HTV5zlmq0TBOWt89qvMh3PHdId3
	VhyzFRQPjWeTp3brhLsqsnE/YK+j8SRNcyuWfQHT8QPEWKa7T1t8sldq8NzPaqfX8fFzwi2YeVt
	EPSfEVbX1wiSBLhKLibzbmlSaYCRno7aHhe7yFptlKkJZuXiP3XU4EdUF+n2qsWezQ7ZFnQ9Kg5
	MJM+BfgRiMDsO5NzKm8sZDljsmHeCEtU1A4oaUHcZmgZMsrWtPkbJKLTjbBFRJcfuDZc/MBc9cl
	MFeD8svEE3kDZQMknHj8e3HVFAmfizmq7M6LXQy+X3CaUnPBK5kbTqhnV19BaN9i1MxHvRIe/lM
	bfuSaL/yb+
X-Google-Smtp-Source: AGHT+IGYHFONNUotKor9AwdwBpAKxhh3g61crvlGCa5AwvCNjlgzokphZFqfiS3bpgh4iCtgc9HZ1Q==
X-Received: by 2002:a05:6000:1a8b:b0:3a5:39ee:2619 with SMTP id ffacd0b85a97d-3b917ebb5bamr2437420f8f.47.1755098640145;
        Wed, 13 Aug 2025 08:24:00 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8ff860acbsm21721544f8f.51.2025.08.13.08.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:23:59 -0700 (PDT)
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
Subject: Re: [PATCH net-next v2 03/10] soc: sunxi: sram: add entry for a523
Date: Wed, 13 Aug 2025 17:23:57 +0200
Message-ID: <2791868.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250813145540.2577789-4-wens@kernel.org>
References: <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-4-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_082402_001309_E67EEC87 
X-CRM114-Status: GOOD (  17.40  )
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

Dne sreda, 13. avgust 2025 ob 16:55:33 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The A523 has two Ethernet controllers. So in the system controller
> address space, there are two registers for Ethernet clock delays,
> one for each controller.
>=20
> Add a new entry for the A523 system controller that allows access to
> the second register.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/soc/sunxi/sunxi_sram.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sra=
m.c
> index 08e264ea0697..4f8d510b7e1e 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -320,6 +320,10 @@ static const struct sunxi_sramc_variant sun50i_h616_=
sramc_variant =3D {
>  	.has_ths_offset =3D true,
>  };
> =20
> +static const struct sunxi_sramc_variant sun55i_a523_sramc_variant =3D {
> +	.num_emac_clocks =3D 2,
> +};
> +
>  #define SUNXI_SRAM_THS_OFFSET_REG	0x0
>  #define SUNXI_SRAM_EMAC_CLOCK_REG	0x30
>  #define SUNXI_SYS_LDO_CTRL_REG		0x150
> @@ -440,6 +444,10 @@ static const struct of_device_id sunxi_sram_dt_match=
[] =3D {
>  		.compatible =3D "allwinner,sun50i-h616-system-control",
>  		.data =3D &sun50i_h616_sramc_variant,
>  	},
> +	{
> +		.compatible =3D "allwinner,sun55i-a523-system-control",
> +		.data =3D &sun55i_a523_sramc_variant,
> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_sram_dt_match);
>=20





