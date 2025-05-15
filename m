Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C55C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 10:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gk0+gInQFLq5TPyTiE4dxKzocRffo/w6/nhsIkH+AfE=; b=ibX7uwaaea0aIub93zq7symGIr
	AGssf+xku+UI41TtMIIsSRsZxG7KkBf2zloWcRVu7pxbVVSFvib4L8HUo6WNBwUcxhDUXUnwZ0HxH
	dNmQ5k9NhHwRPIvDgPj14YLIH3hxM+vIMjyBTl3SgzRw4yyKNNeHN19jJymHBGIzBwW2O99Ia2eZc
	4V+1astWOTnMNOSgEkefDHsJDfMm56gsXF0zlzcnYWWMXJXKeOSq8v5asAo86jKXFgHBX7Vp+EfdG
	iaRYnODit8093D7iOsnkaxvj6/+Ay5ZmHRHRioV3RZ0yGEN/rPWTxrjDZzliV6bKzSXk62LLbf5rp
	md1D46Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFW1C-00000000JwJ-0xxt;
	Thu, 15 May 2025 10:40:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVnm-00000000Hyt-0YI6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 10:26:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cf257158fso5252455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 03:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747304816; x=1747909616; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gk0+gInQFLq5TPyTiE4dxKzocRffo/w6/nhsIkH+AfE=;
        b=lfy63/HIhdEojvID1JFYVj/YstAn2Fer7WfI7MPBNBmaP56Cz7502cbYDxr/ohA2k9
         GhYeoowXwu2d76oyX4zNYfvN2m1pIPskHkGs61nz7/8X1nPaGnjSM9VXQ7c2A5G1vJDB
         ONiy2TS2DkCNnDLLFBrm9ZHcNpB+RX9KaoqAqBHQLQV13dib3P8R9xzmfKLV7oqx2DUF
         iKORtL/n+/Lh0ZgD0pkwhgu5FCD3dpPkSsa1gvl10KsR2S8XOSjJ6lgIwRm00NskGL8s
         xt/ofRDkrdSDsBtUXPdD+pmKke566Dxc0hfTKAv/X9mxowliTFjh59FQrSnQgFQMWK2r
         yN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747304816; x=1747909616;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gk0+gInQFLq5TPyTiE4dxKzocRffo/w6/nhsIkH+AfE=;
        b=xCuhem+9TvRCSotasr4ddr4XDZRp/KxMSz7rsRW3SEBVIAzq0ojqZ+j2fUvnlSyXiW
         ucz8WJJV4KGzE35hF6pGyyQlxymJnDd8CDIuwRyEV/5fcRsOYI8wcm62B7WSz8v9zgkD
         VIYXHZTRy0wT2tF2XIKNzJBKCHMQv4i1djeQ0q3IUYFSQ1O215RgE3OTG3EoJAlPPgKC
         Ok+1U4LyGz02bticfpyT6UNdEDkRVLwabeJfwR55xo3K4Hb6FXV6xVmUQSvyQJNNA+Bq
         lapsJ+lJIYzQ4XdamP11WPKLYosIPH5svkmPV8vIZx38ib6JMCjhUH63rP9RkNQS36Wy
         Be7w==
X-Forwarded-Encrypted: i=1; AJvYcCUZYuVb+O3DU93u7ZiWHBpMc6Lv8PsaerL2SD/h9IMfh4O50vQX1qIR7RdQIOES3tmV1UCgafobUi7u+fT2ryX9@lists.infradead.org
X-Gm-Message-State: AOJu0YyOcaPc81+nNzDjMMiRKH9YUKzQyT4KH2m7ADAGoGbOzwW0fpKb
	r3E/SltjcmRLGLQ8SDRDeQL/CuNNV6JmbzLwr611ZcNfVAZ163Ma
X-Gm-Gg: ASbGncvWs0hSpnyA/+dF6blTRFWu58woHm0cTejNqvMK8iVmi5zD+ClJQEQh4IOQl8h
	zJoedPdiHJtRH8OdcgWerTfXy4V3aazj3ij/MqrflgI3oMFocFbqs3+vNXWEKNssLjV2H3KHK5r
	GG2yLjLeSSBpVAqJUTzHLUNHUXKb12vcLBMwgK3qTR64/1vpBMWYXL60ikASPay7cXQyo3Yf9ey
	2rTFmTqnID68lc3Zg71RCq0X+JmXDSfmmD1REwFxdzYZXlOLXzlBU5k53uwOHoyG5UMkzfIAKTz
	MjN6bVcK1bBUtEcB6t5jIih1zHHFP1B9vHW/2YXzdG7DNJz1b9U/XQQItEkj
X-Google-Smtp-Source: AGHT+IFVgomBW1IBuXpOUR8LYcnGSxhFAoIygDxxwvgbwklcoUaA6rWn38wHMH/dhn9JUS9lxDBang==
X-Received: by 2002:a05:600c:154a:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-442f96e671dmr15113075e9.8.1747304815938;
        Thu, 15 May 2025 03:26:55 -0700 (PDT)
Received: from [10.5.0.2] ([45.94.208.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef400sm60703995e9.33.2025.05.15.03.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 03:26:55 -0700 (PDT)
Message-ID: <229cf78caaa7e9f2bb4cfa62c019acd51a1cd684.camel@gmail.com>
Subject: Re: [PATCH v2] iio: adc: stm32-adc: Fix race in installing chained
 IRQ handler
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Chen Ni <nichen@iscas.ac.cn>, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, u.kleine-koenig@baylibre.com,
 tglx@linutronix.de, 	robh@kernel.org, jirislaby@kernel.org,
 fabrice.gasnier@foss.st.com
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 15 May 2025 11:26:56 +0100
In-Reply-To: <20250515083101.3811350-1-nichen@iscas.ac.cn>
References: <20250515083101.3811350-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_032658_170292_A2A1BFEE 
X-CRM114-Status: GOOD (  15.97  )
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

On Thu, 2025-05-15 at 16:31 +0800, Chen Ni wrote:
> Fix a race where a pending interrupt could be received and the handler
> called before the handler's data has been setup, by converting to
> irq_set_chained_handler_and_data().
>=20
> Fixes: d58c67d1d851 ("iio: adc: stm32-adc: add support for STM32MP1")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> Changelog:
>=20
> v1 -> v2:
>=20
> 1. Add Fixes tag.
> ---
> =C2=A0drivers/iio/adc/stm32-adc-core.c | 7 +++----
> =C2=A01 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc=
-
> core.c
> index bd3458965bff..21c04a98b3b6 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -430,10 +430,9 @@ static int stm32_adc_irq_probe(struct platform_devic=
e
> *pdev,
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0
> -	for (i =3D 0; i < priv->cfg->num_irqs; i++) {
> -		irq_set_chained_handler(priv->irq[i], stm32_adc_irq_handler);
> -		irq_set_handler_data(priv->irq[i], priv);
> -	}
> +	for (i =3D 0; i < priv->cfg->num_irqs; i++)
> +		irq_set_chained_handler_and_data(priv->irq[i],
> +						 stm32_adc_irq_handler,
> priv);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}

