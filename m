Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D6FC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 00:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3lBKZGOyoKxfPqCyoT1cGjFSA+s77EMfO8EHu92tNE=; b=ofeOmPPRV/r4TXtNYWswHXc2Em
	alRxIGcuZINK4j5SzxK6RqBY5Pf3jtdzW6K4okP8bG5VMpW7tDY7vK9MxrHF08CSd/MSupK8fAZiD
	sVH55mGXrhknoK3p+E7F/K7quMQpcHJ310EG0VM8crFdCU+wMufnonS5SSIbJj5P3FD+zFhofmf+Z
	7DukxG6qfE/lgnZJTnTScpI/KXGLrEq6oBcmw4G9v2YTHIWIT3Iz8UWbQIw4QrcS+ZWQrUe+u21jf
	tXZLjx0FF6FPyUJc91elMfbdyAcPC6J4TAeRFyQ/0cTle4LqtPQm/O0fZZWUSoAS2c9WHAA27Y2ni
	0fpANO/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tijHR-0000000D19U-0Dor;
	Fri, 14 Feb 2025 00:10:05 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tijFz-0000000D11K-3455
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 00:08:36 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e549be93d5eso1700312276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 16:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739491713; x=1740096513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3lBKZGOyoKxfPqCyoT1cGjFSA+s77EMfO8EHu92tNE=;
        b=VGsH74+2r4bLT7uTHcdQYMrLqhpA/Aa9n8drNPkxMQpEpY7UaL/7ZMBweIkSl5Xq0P
         1gDn9zrIg2fbbuyMirYhjX89Rr/vI7cwFUWThYHChC+kjmUW2AufTcM3ojVDOvnUMClY
         kBDnTOItMyOYuxmFD8oTHvXThERAKD/KCNnUo43WQ5X3venlggfDmZvDPwh+5RCmZzZE
         2Ma8/5B1iOYf4yulAMkxZLddLHDEnPJAMAUt1wrZm81gg90Yefy9+Kyxc62yN4HxayEK
         RPpTbXHt8wOLcgg8luYzcGeed3BCJ5/NJYB2biDE2CRWU6ZJqQRYKz4Ast+2gtxibHN7
         C03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739491713; x=1740096513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3lBKZGOyoKxfPqCyoT1cGjFSA+s77EMfO8EHu92tNE=;
        b=FfAtOxiLCUloFd2PhDzW34AKhl0b9eLSdDJlflgM7UTMEG3zRsVQRb/ip1fu6AWToa
         G8hNoIgIqtktqcwY6ytUXwey1Ke9GpTKljsz6vk/qZAv4EcTru/ws3TtLAvsYAGgw8hv
         KIemxTd/SuqwCzE+ZYLU8AjtZ8/EDpTopOkM1JULv50Wmpn1YYuhA+dUxq5fhwGPE1a3
         qw9zMyJgAI4SAakmM/4IUFspYORkTv7SV+lUARwqtshkbtQbROu9Z6MnwtjSbVL9Yr55
         1B3CCFnlHkLjOeiZeJBhgRw5OtDrCPdz8dRqCXhJYILwOwiCh+2aTYxEVoMPytYmRGxx
         zN+g==
X-Forwarded-Encrypted: i=1; AJvYcCVkJmxriByFb+cp/wRbm51xDPtyF05/D7F8w+q8tk+ntD0X5PPimJop+KAmvryoQPzVjyl5sKI497HMcds+jJB5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2vFwYNdq/tGPsG18s/gq/CbQN9qogK3FQ4tKUhYFjO8hXv357
	vLOukgYZAX3nrbqJejJIS5UUdwVDBHMm8NFJ0RU3Nx5ajn1sOj4K95IROq9hknDK8bqYfMDy08W
	n8ioNNa/IDfNPbAzLciLM4KR+Q8ffU5Ek0SvsNg==
X-Gm-Gg: ASbGncsWv1LzRE+BRjVD0DGrE2Kqdok8T3qAe2gUX6D6XrNh8Umx2unpNTcFRZxTTc2
	3VA443AXYP7Vj0BgROEiTKkZohSryKuH3OZSHpGLqayYSuF15yqguUKUqC/ioOTUdyWk+DCYkQZ
	n6ItByMjDlF1PrLERguGPyChQzP9cuzTc=
X-Google-Smtp-Source: AGHT+IHHB9aqmzlCmvvbOZ0op+LIbE1hTTkoDV6gv5oj2H7T56oz2T4r9lSa8//BdTV0olXsdNEbfdpHv6M7nkxz/Fw=
X-Received: by 2002:a05:6902:844:b0:e5d:b88a:5537 with SMTP id
 3f1490d57ef6-e5db88a57afmr2934415276.47.1739491713003; Thu, 13 Feb 2025
 16:08:33 -0800 (PST)
MIME-Version: 1.0
References: <20250213204044.660-1-wachiturroxd150@gmail.com> <20250213204044.660-3-wachiturroxd150@gmail.com>
In-Reply-To: <20250213204044.660-3-wachiturroxd150@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 13 Feb 2025 18:08:21 -0600
X-Gm-Features: AWEUYZkHiLNGtqh6JY6R15-hw34etZLDV9fUZUEOBeHdZwrkxJs0njIeYoVmXyc
Message-ID: <CAPLW+4nJVf0raJ-O3u6uUteBi--N5xGwvzXp7cHqbkdMJ8gCSQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: s3c64xx: add support exynos990-spi to new
 port config data
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: andi.shyti@kernel.org, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_160835_783180_B3C54024 
X-CRM114-Status: GOOD (  30.54  )
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

On Thu, Feb 13, 2025 at 2:41=E2=80=AFPM Denzeel Oliva <wachiturroxd150@gmai=
l.com> wrote:
>
> Exynos990 uses the same version of USI SPI (v2.1) as the GS101.
> Removed fifo_lvl_mask and rx_lvl_offset, and changed to the new data
> configuration port.
>
> The difference from other new port configuration data is that fifo_depth
> is only specified in fifo-depth in DT.
>

In the code below I can see this bit:

    /* If not specified in DT, defaults to 64 */
    .fifo_depth     =3D 64,

Is that intentional or is it some leftover that was meant to be
removed before the submission? From s3c64xx_spi_probe() it looks like
the "fifo-depth" DT property is ignored if .fifo_depth is set in the
port_config:

    if (sdd->port_conf->fifo_depth)
        sdd->fifo_depth =3D sdd->port_conf->fifo_depth;
    else if (of_property_read_u32(pdev->dev.of_node, "fifo-depth",
&sdd->fifo_depth))
        sdd->fifo_depth =3D FIFO_DEPTH(sdd);

Btw, wouldn't it be reasonable to flip this probe() code the other way
around? So that the fact that the DT property is available is
prioritized, not its port_config counterpart. That would make it
possible to provide a sensible default in the port_config structure
and at the same time be able to override it by specifying the DT
property for nodes where it's needed. Just a thought, not strictly
related to this patch.

> Exynos 990 data for SPI:
> - The depth of the FIFO is not the same size on all nodes.
>   A depth of 64 bytes is used on most nodes,
>   while a depth of 256 bytes is used on 3 specific nodes (SPI 8/9/10).
> - The Exynos 990 only allows access to 32-bit registers.
>   If access is attempted with a different size, an error interrupt
>   is generated. Therefore, it is necessary to perform write accesses to
>   registers in 32-bit blocks.
> - To prevent potential issues when fifo-depth is not explicitly set in
>   DT, a default value of 64 is assigned to ensure stable operation.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  drivers/spi/spi-s3c64xx.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 389275dbc..5f55763f9 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -1586,6 +1586,20 @@ static const struct s3c64xx_spi_port_config exynos=
850_spi_port_config =3D {
>         .quirks         =3D S3C64XX_SPI_QUIRK_CS_AUTO,
>  };
>
> +static const struct s3c64xx_spi_port_config exynos990_spi_port_config =
=3D {
> +       /* If not specified in DT, defaults to 64 */
> +       .fifo_depth     =3D 64,

Talking about this line here.

> +       .rx_fifomask    =3D S3C64XX_SPI_ST_RX_FIFO_RDY_V2,
> +       .tx_fifomask    =3D S3C64XX_SPI_ST_TX_FIFO_RDY_V2,
> +       .tx_st_done     =3D 25,
> +       .clk_div        =3D 4,
> +       .high_speed     =3D true,
> +       .clk_from_cmu   =3D true,
> +       .has_loopback   =3D true,
> +       .use_32bit_io   =3D true,
> +       .quirks         =3D S3C64XX_SPI_QUIRK_CS_AUTO,
> +};
> +
>  static const struct s3c64xx_spi_port_config exynosautov9_spi_port_config=
 =3D {
>         /* fifo_lvl_mask is deprecated. Use {rx, tx}_fifomask instead. */
>         .fifo_lvl_mask  =3D { 0x1ff, 0x1ff, 0x7f, 0x7f, 0x7f, 0x7f, 0x1ff=
, 0x7f,
> @@ -1664,6 +1678,9 @@ static const struct of_device_id s3c64xx_spi_dt_mat=
ch[] =3D {
>         { .compatible =3D "samsung,exynos850-spi",
>                         .data =3D &exynos850_spi_port_config,
>         },
> +       { .compatible =3D "samsung,exynos990-spi",
> +                       .data =3D &exynos990_spi_port_config,
> +       },
>         { .compatible =3D "samsung,exynosautov9-spi",
>                         .data =3D &exynosautov9_spi_port_config,
>         },
> --
> 2.48.1
>
>

