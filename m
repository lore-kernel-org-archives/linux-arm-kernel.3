Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88E9CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 16:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkBMuEFYniV7o/NZEZ9uUf/PpOYiog+if+0C8Zohm+8=; b=auqKbTPOKxGS8+xRMdHXsNQ2Gz
	jza2QOHv3lpILtoQlUrH9QCgvTpu2lZ/vf5h6tYFcKkAB8Gnb8m2dSZY1+aKW8f92EOPznNEhFm0K
	WXsIOaPjO5wXy/ZELKsCYDiSF7XYccPan1xaTN5q9p7hwp06kHK45cZpyjp0Xi6YTE7wieIZHj6z+
	L9nibSOE248oz0cI3hHJscDNrgsAQlVWLDaOOdpAv6V5Sdi/dW7yGN259n2Q8HtyU7WqaFn4iNLVK
	Dexn37+d9+Ey/BXVQQuhPewZJhxFcS5KAvCXixo+x/GTggUPgHeQPKu4h3sCgt0ztT/PT/QwMdR29
	KyCZYOHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOtF-000000002aZ-2Ypf;
	Fri, 07 Nov 2025 16:00:41 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOtC-000000002ZL-3Hbj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 16:00:40 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b725ead5800so123167866b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 08:00:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762531236; x=1763136036;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkBMuEFYniV7o/NZEZ9uUf/PpOYiog+if+0C8Zohm+8=;
        b=Z2rDFey58TIAToBNd5yqoP6+6awuGJqO8s9HDAwDrj8Ydsu38qA6fZx9l9yekt/vq+
         P3sVZZJHIvbhfYo1utwwL5dkRKguhWNm6u2XgHp+9cVAvYtJwpRQT1NN656pNukZG9IW
         lV4vfgfd6CrpROfDlBjaf+14QDrD2j3MlKrWemzMGbhnXqat4EpMjAbCJjNyrbaXicYE
         2zuoIJ81XIOaXLw0FD7Ci/r5z4fp0MYKsS/rA46DtUkGBxcQ7R8GpMDOmyF/PF2Tj7N0
         2y8klEI6+cOMc3qOEA3Zp0/joFZPF45XGdI26InxHzsJEf2cKRsbZsdhZmLhVHhsAEyV
         pY4w==
X-Forwarded-Encrypted: i=1; AJvYcCUPtQqAkqSptQWpdBRXkVF8VTdQj7uG/rmb1s/02ZaczPcgSU0lREnbRrkXdkyURvnZhMH704vB3O8kNlPNCFGa@lists.infradead.org
X-Gm-Message-State: AOJu0YzlrmLZgByhWuBY9mJKvA8QEmnWw0i/84fLYVSyG+mN5PJnFe+Q
	06WspkINXbALAySKHRL8K/VhwgCdFoPSji4Lc04r5pk6q/j1JdPYiG2xC81hcIcxX7DzX7Vk3xB
	gy6WNxxYMUviCwlfublvNJzRbYXra1ig=
X-Gm-Gg: ASbGncuzXE6LCE2rTVqvDNiAprjjdY2TY3rNAkRPTt8+TqUS7K5srl/SD9Vf2IJ57uv
	ThEouSpmqalDVvy6veU3uxJixhqXhQHM3MiHid9HRuXyOCsw8F/9R+qMjf2X1jQ2d1UlI9yhKGV
	8kYAirqlXJcUswAqjKDjbxwF3d+l2inIED7LZzPnYFt8oB3W0Jb3LG21ZdzFp0tcmrJlpkWZN0S
	f4jzKfsCvp5rTLmfAfYSQjnxzFfRUxGs9GYGBkqsBcESYZyS7GPwa0Hla5d5CGM6YBzUbJ2iLHF
	4iuSYeqUAEmuXlmpAA==
X-Google-Smtp-Source: AGHT+IFOoHBXH/PzewtzvKKUtM610X3TQ1SmT9FLvQyuUDuxyBy4OLhIMpEqweiHRkcJBKlSnsBceRB/zJjkJgVr+9A=
X-Received: by 2002:a17:906:f582:b0:b70:a9fd:1170 with SMTP id
 a640c23a62f3a-b72c0eef5bfmr340953066b.65.1762531236039; Fri, 07 Nov 2025
 08:00:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Nov 2025 11:00:35 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Nov 2025 11:00:35 -0500
MIME-Version: 1.0
In-Reply-To: <E1vHNSR-0000000DkSt-0wDu@rmk-PC.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNSR-0000000DkSt-0wDu@rmk-PC.armlinux.org.uk>
From: Emil Renner Berthing <kernel@esmil.dk>
User-Agent: alot/0.0.0
Date: Fri, 7 Nov 2025 11:00:35 -0500
X-Gm-Features: AWmQ_bnSZQW08h0NXQTG6zSRGIlnDRSY70b9JlHXkxjmDNLgOFrMa4uAbMmEPzM
Message-ID: <CANBLGczzW+kjvSqYm5YVt+2sdLtgyZfa=fhsU1Q-nUjSVvB4cw@mail.gmail.com>
Subject: Re: [PATCH net-next 11/16] net: stmmac: starfive: use stmmac_get_phy_intf_sel()
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	netdev@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_080038_828224_6D889ED6 
X-CRM114-Status: GOOD (  12.61  )
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

Quoting Russell King (Oracle) (2025-11-07 15:28:55)
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result and use that to set the
> control register to select the operating mode for the DWMAC core.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 22 +++++--------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index 1ef72576c6f1..00078b7a6486 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -35,25 +35,15 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
>         struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
>         struct regmap *regmap;
>         unsigned int args[2];
> -       unsigned int mode;
> +       int phy_intf_sel;
>         int err;
>
> -       switch (plat_dat->phy_interface) {
> -       case PHY_INTERFACE_MODE_RMII:
> -               mode = STARFIVE_DWMAC_PHY_INFT_RMII;
> -               break;
> -
> -       case PHY_INTERFACE_MODE_RGMII:
> -       case PHY_INTERFACE_MODE_RGMII_ID:
> -       case PHY_INTERFACE_MODE_RGMII_RXID:
> -       case PHY_INTERFACE_MODE_RGMII_TXID:
> -               mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
> -               break;

After these two patches the STARFIVE_DWMAC_PHY_INFT_RMII and ..RGMII macros are
left unused. Maybe just squash the patches and remove the definitions?

/Emil

