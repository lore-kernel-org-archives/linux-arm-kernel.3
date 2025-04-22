Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7BAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXeQVDTSpnoZxsd+wrw1IRAEHOMUFEweDMHe3THRG84=; b=EHnavw9MyIJuuCjWcDNDJE0gFx
	c1iodmJ7F0jNdda/yd8dqJVpoWlBdVBSc2uRv5drRU3N23+jUV7pe2gRAJBMLrm9woYaYbgLr/UGU
	xtIAwNbVDxVosW6mkcx1SlOoxS3NeoiX944vEQxQ0P/KeOmQH6P6+boW754svUoiiHyed67/GFq4A
	TR9eyj97rQTsIUMuSZo++MXfWbI3yblOaF1VAZzu5oaOre55jhBc87kHL/N/clnpFAcLJfiQrJKMt
	lSofBq7e3iM8B/Igwx6w0GmxB/eCrULWkNkX9Z2GrlZc28q4Ow7/fgy9Cmtqj7rpTfzCAWOoE02Ht
	2ZAmeFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Azd-00000006nXM-0tad;
	Tue, 22 Apr 2025 10:36:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AT0-00000006fde-39EW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:03:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3EF28A42CDE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 09:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EECC4CEEC
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 10:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745316181;
	bh=ToRg4CeRUOUVtP4ZSt1QrM8CjfKlNnOozBNBrYE2698=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LMzGWhvnQOus9OmqwM22LXNODp1pWEOmno+GVGLi4GVTojz0xsEUEQn8Ir0C8hy2N
	 EWQ07HQk8p5OXTNN0ATsErSLCE0PDS2S3d1QFl6hDASCASrudDwQNwzUT/NYmipQdK
	 MHnA9H6mz5YB4rxn6OXcjN3hlryh5oY4WZExT8cweH1dveJ66dHpUQoEN/aS9qE8Cx
	 pGeB/Eo+IQkKZPQYE/6EmFIyofPfWnUtrJ97kHDx8bir5xY9itCRsde0siz1ABiqpn
	 LKtFaNdCBKIUt4sauhV1f9M3EZOx6afknolOlBJnhKeW1P4sNGbgT2is9dkpMnx0eo
	 cZG30LbEZ3udg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54acc0cd458so5740801e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 03:03:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCJFtFbCMGAUpEouzshK27CpJtwKrIsdJXRFib4PhmkdtiTdmhJEQcN6r8k7jFhvyw1eK9SKluSNP/HM64AGDA@lists.infradead.org
X-Gm-Message-State: AOJu0Yycot4BM4EqMLUHx6PPrh4HHlCEWJKDXEp/E+r8GmYWyvkduL4i
	3Hp2j+xjEd0N7wDdEXkbR2TeaOV2WuiFsV6ai6xCqFTAtCCYpWWhmg5kEwT86VHiPND/Dj9tup+
	nQFBFrMOXFdSJJ07JIEkoAHmMlgE=
X-Google-Smtp-Source: AGHT+IEyHKXRp4nAwbh4JgmSsEY+YxuekgICFOguGtsRj7qggKe6wA1CgUf+picRpfTOM44oWguOLA20ETib8MAK5Zo=
X-Received: by 2002:a05:6512:1045:b0:54a:f6e9:2c04 with SMTP id
 2adb3069b0e04-54d6e635483mr2952442e87.26.1745316179390; Tue, 22 Apr 2025
 03:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250422095718.17360-1-kabel@kernel.org>
In-Reply-To: <20250422095718.17360-1-kabel@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 22 Apr 2025 12:02:47 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFO3fxEcv5VPxtGnq-x0+iZnUHau2WKtiFHg1f6XQc_qg@mail.gmail.com>
X-Gm-Features: ATxdqUEfv1VpLPveqLUDgYOhJXSwckyrQ-acm7s0JA2Maoz21Kx5GCvlcSz_xRA
Message-ID: <CAMj1kXFO3fxEcv5VPxtGnq-x0+iZnUHau2WKtiFHg1f6XQc_qg@mail.gmail.com>
Subject: Re: [PATCH] crypto: atmel-sha204a - Set hwrng quality to lowest possible
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_030302_919948_CA32197E 
X-CRM114-Status: GOOD (  18.00  )
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

On Tue, 22 Apr 2025 at 11:57, Marek Beh=C3=BAn <kabel@kernel.org> wrote:
>
> According to the review by Bill Cox [1], the Atmel SHA204A random number
> generator produces random numbers with very low entropy.
>
> Set the lowest possible entropy for this chip just to be safe.
>
> [1] https://www.metzdowd.com/pipermail/cryptography/2014-December/023858.=
html
>
> Fixes: da001fb651b00e1d ("crypto: atmel-i2c - add support for SHA204A ran=
dom number generator")
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---
>  drivers/crypto/atmel-sha204a.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>

Wow, that is terrible

Acked-by: Ard Biesheuvel <ardb@kernel.org>


> diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204=
a.c
> index 75bebec2c757..0fcf4a39de27 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -163,6 +163,12 @@ static int atmel_sha204a_probe(struct i2c_client *cl=
ient)
>         i2c_priv->hwrng.name =3D dev_name(&client->dev);
>         i2c_priv->hwrng.read =3D atmel_sha204a_rng_read;
>
> +       /*
> +        * According to review by Bill Cox [1], this HWRNG has very low e=
ntropy.
> +        * [1] https://www.metzdowd.com/pipermail/cryptography/2014-Decem=
ber/023858.html
> +        */
> +       i2c_priv->hwrng.quality =3D 1;
> +
>         ret =3D devm_hwrng_register(&client->dev, &i2c_priv->hwrng);
>         if (ret)
>                 dev_warn(&client->dev, "failed to register RNG (%d)\n", r=
et);
> --
> 2.49.0
>

