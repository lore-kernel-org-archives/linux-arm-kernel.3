Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA43DC71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 06:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LP0+v+yPMTvWP3QRlvcaJX6go4/gtqoSeY1FPuuU0EQ=; b=NcQw6BcuW7lGDgqmc5h+HMuYxJ
	0hyS9mGU5amzYAzTKW/Aqz7lRDnxLwLCHHlVWZD41ya/PXAShgCaqNie/D+PmUxz6P0DhUau6hTH7
	5SUwkkgTHjVVBHpKMwUc1Gp5XbRo5KRzK6ZS8VhJlFV+vVeRihjk3VJCaGnvT9JJ1iaToEjZh8nyc
	VM0GaoIPU3bFE445d1kUd//9ia1oyb9zlh1aSuAWtMAuXOw6OoKE/ORFQT9xwr24l0ICbrxzWdiwC
	6dt+pBvfy4jNZrZBKd7TG2l0XvM23wxSkwst/VoOUUuxBHRKDqjS9xAbQA0HBU6yr/7ZWd3szi7lC
	qaKavqxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8VS-0000000C8H0-3Mzd;
	Thu, 19 Jun 2025 06:12:14 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS89J-0000000C5wr-1vdR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 05:49:22 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-553b16a0e38so401277e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 22:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750312160; x=1750916960; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LP0+v+yPMTvWP3QRlvcaJX6go4/gtqoSeY1FPuuU0EQ=;
        b=MApBkwDiR8fjpATZKILn2T7PDk+IlgGMX7leLJ8t77ZIOMsc1SYiEdOdbcTtVGoYlR
         Ch4PMRA2EaRtF9qjeMwAFtFssU76KJC6AFZ+mosbLkkljMcw17oBEaPkXU+hGJ9Koz0Q
         0ZvbQmJGYo8ULVtOd9eEG3HCk0bk/7IiB4iDrcl5qKUdS5QI18RZ4VbrHhaSAx2igDBI
         8uPeNY2BLqPRh4UBtJWxZi3Ca4dmg4VWY/h1xTKb3eW95mxPx0o+LWwc8tVCsTr97m1W
         CcCvvhnKDLrGQL9iW/owAWTfMaaBIBMNv+akOxzziAdrQoJ/pMo0/Wb/n021zd1nUU4f
         La1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750312160; x=1750916960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LP0+v+yPMTvWP3QRlvcaJX6go4/gtqoSeY1FPuuU0EQ=;
        b=YPTWos7ix2m1s2ol5VACIlGx3NDANdXdILIgQus8X9mQow8zZgL1GdGCdLuWsaqQsq
         On0kjfa1wBIWTPuN1kR/1mA+LDXClzTHbvuwGiAAPlaeBvb5JioT52qgJfbOx8jaGKPY
         qwzASkBV3kY1ExQMrb74FT84iUWla6KQGrGrtTrV9Lylgex/s3TS5xI7h3oMzEBETGIj
         tkBS2IAZcqkeeD0aM0HCjUAFTzpMY8PO7w1fd9+fcdtXOoddijpTWyxRjVeDxcAA0Wad
         Qa2Y9PMHdn+W+t333Qt+XQ4f7CpVPoUsjCKhjM9f2rEXMzCGZSDrB/mh0u5hFQZVCME6
         Sh8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtXXCiYGXFy0wSjtgFXfyEPDWazlIxnAAFPA/8zt+7+FGzaQeeNoIdLuRYS8EnwX6coBHeq3BzxsBKtNP/kqLr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9l2mWfYGfAmd3UWxlpE/xhxWZC2vDP8qbzCPlMKLhF7eAOvl6
	OJ9C1NlABLCsfzDDcOuoru82rOdRa1htef4erx86TPfqvqOcrGYDXM+U5B52AFsUtkOxWrjI6Ge
	cNcoGmJoJmUBmmxcJS6lV3LHNxTXFvqI=
X-Gm-Gg: ASbGnctDl9yEHTHpj9MozGoV9JZqBwPAUFAYB71QXIuTNwj3nsPNQwahOXLMOSkhwJT
	oONT2u7FL+724pRctj7vANFjFKBz/JLacE1E+fgrMsIvHA3In6h/DKG9Md6UuOu/G8r8r54fSTR
	jOXh0dhR4fAM8i/hRd+L54clYSD4/rF4CtXDREPR4Oa71p
X-Google-Smtp-Source: AGHT+IEAtdtfArajT5szIQvBU7UGnWhv91Qs5Lq4eHuTo5U3W8BhvGer+g6N8WmU7PLHZ8aDkn6H5sM9ZBf+qYCptUo=
X-Received: by 2002:a05:6512:ea5:b0:553:2d93:d31 with SMTP id
 2adb3069b0e04-553b6ecba35mr5597131e87.22.1750312159320; Wed, 18 Jun 2025
 22:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk> <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 19 Jun 2025 13:48:42 +0800
X-Gm-Features: Ac12FXwywCRDElBPzLsFtuXFdNKKqhum4JUE_fePl755xSXSFzh60WUfPkWp7Z4
Message-ID: <CAJhJPsUDmQgunCk_Fbe5vFtBzE6Yy6m6Q0oRcXmpWRTu4nqQ0A@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: stmmac: loongson1: provide match data struct
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_224921_496896_FD474FEC 
X-CRM114-Status: GOOD (  20.59  )
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

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C

On Wed, Jun 18, 2025 at 6:41=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Provide a structure for match data rather than using the function
> pointer as match data. This allows stronger type-checking for the
> function itself, and allows extensions to the match data.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-loongson1.c | 24 ++++++++++++++-----
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> index 3e86810717d3..78d9540be10c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> @@ -46,6 +46,10 @@ struct ls1x_dwmac {
>         struct regmap *regmap;
>  };
>
> +struct ls1x_data {
> +       int (*init)(struct platform_device *pdev, void *bsp_priv);
> +};
> +
>  static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *pr=
iv)
>  {
>         struct ls1x_dwmac *dwmac =3D priv;
> @@ -143,9 +147,9 @@ static int ls1x_dwmac_probe(struct platform_device *p=
dev)
>  {
>         struct plat_stmmacenet_data *plat_dat;
>         struct stmmac_resources stmmac_res;
> +       const struct ls1x_data *data;
>         struct regmap *regmap;
>         struct ls1x_dwmac *dwmac;
> -       int (*init)(struct platform_device *pdev, void *priv);
>         int ret;
>
>         ret =3D stmmac_get_platform_resources(pdev, &stmmac_res);
> @@ -159,8 +163,8 @@ static int ls1x_dwmac_probe(struct platform_device *p=
dev)
>                 return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
>                                      "Unable to find syscon\n");
>
> -       init =3D of_device_get_match_data(&pdev->dev);
> -       if (!init) {
> +       data =3D of_device_get_match_data(&pdev->dev);
> +       if (!data) {
>                 dev_err(&pdev->dev, "No of match data provided\n");
>                 return -EINVAL;
>         }
> @@ -175,21 +179,29 @@ static int ls1x_dwmac_probe(struct platform_device =
*pdev)
>                                      "dt configuration failed\n");
>
>         plat_dat->bsp_priv =3D dwmac;
> -       plat_dat->init =3D init;
> +       plat_dat->init =3D data->init;
>         dwmac->plat_dat =3D plat_dat;
>         dwmac->regmap =3D regmap;
>
>         return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>  }
>
> +static const struct ls1x_data ls1b_dwmac_data =3D {
> +       .init =3D ls1b_dwmac_syscon_init,
> +};
> +
> +static const struct ls1x_data ls1c_dwmac_data =3D {
> +       .init =3D ls1c_dwmac_syscon_init,
> +};
> +
>  static const struct of_device_id ls1x_dwmac_match[] =3D {
>         {
>                 .compatible =3D "loongson,ls1b-gmac",
> -               .data =3D &ls1b_dwmac_syscon_init,
> +               .data =3D &ls1b_dwmac_data,
>         },
>         {
>                 .compatible =3D "loongson,ls1c-emac",
> -               .data =3D &ls1c_dwmac_syscon_init,
> +               .data =3D &ls1c_dwmac_data,
>         },
>         { }
>  };
> --
> 2.30.2
>


--=20
Best regards,

Keguang Zhang

