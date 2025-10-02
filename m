Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98B4CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 16:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsxj7YoiqGgfvPyXJFxW2Z8P+n52wRZ9xpiObgG4ULc=; b=T6SweAQWtfBsSKwUPT7Ajn/VXe
	H22ARrGleesdw4ywwW8LMF+5Ohi9FFZqKRQdlv9erWArmxgFiZYOTpF+AUxErCVsqQP4COuXdxdjb
	DPN4KnNWZ7l0Sw60eXR20cbkZ/+JX5tmCXGoELPpPd9E8wWrzE90ntKQ3s2dBgL2EZadAPvPdHfhf
	K819J0LsH/WMGT1kmB8pNGOJl1NYbM77USaVkVg+I1N0HqAaUnQJWEgaGly+iza0Zrl6WqZ1+7dN1
	6L4gYmUASwqVoTJr9Wz/TbNEPQXY+hepjMX2zZ0IyrMiZ4InqGhQY5kXk5zaSiZGphA4JBBOYUBvL
	3F1Cugpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M1X-0000000AntY-12T7;
	Thu, 02 Oct 2025 16:19:19 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M1U-0000000AnsO-2H07
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 16:19:18 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3322e6360bbso1182769a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 09:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759421956; x=1760026756; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsxj7YoiqGgfvPyXJFxW2Z8P+n52wRZ9xpiObgG4ULc=;
        b=dFHc/C4Lr0Sa463NjcAiOn6KgBA1cTujjIbkpgt+3swPKIzysxprLkBie07IoUaWiU
         Bsh6fHTtEpZMSN3n90JOyBg/xfRREEmyILJZNC0OVGGATfqGyyG9GV26aHDkZQSihnf2
         f9lL5KvGDkiQWXI1habbsZ0cS36FgM1jOvzk1sOIVARPJMCcR/hBhBlnlb7vuKLt3TUR
         cLgljoMB+EPfTDHN5R7N6mte1QABnMYAUC5u2VZcGle0atS9g6z6dP1dia1n2nB9WYz/
         xZIrKRGrMH0l99dKmg5nhSjBeLaI73Kja8JflR3JnK7xTj6jmkSiDqE2yX3erw/bJH3p
         yHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759421956; x=1760026756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsxj7YoiqGgfvPyXJFxW2Z8P+n52wRZ9xpiObgG4ULc=;
        b=vKqaxDqhQ6xdre/TpgBXh/CWp8dA0XTu8L2D+b4TpE9FAtJcbG+F7U7hC367LzqPFB
         AId7iFpQfnGP2sKYjSbKC6SWWdjaCjlLwSPzJSYT8r4Xkt1HlSNs38uOHhI8a0bX/kF5
         ZEMWzP8VNENPH+NAAyRFyGfTHCIeXkKifArXnOWH38Ajh38n/L4vGGeHq6trWsL1Hozt
         2qQ860m6Z21qrf0gO+ZoRpbPMLK81h41GVY6Yo0EtPEz2knSmSxCww40FUmwQBk9O7qB
         v82sn7TyYQSe9RmaQphTcHsLnyqE75HWX2sDnPt5sc9O4XG8YWrVHAU5VmN1s3vFwdjh
         /vcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXMf/3hLxDENNyLtCwVlcq8ybFjo45jJUjxj4k4sPl7sdmd+pGwafsosgo0LFg66mWDjyhvHyztZttalPeGvyR@lists.infradead.org
X-Gm-Message-State: AOJu0YzVKkwDrsWboVpNHxpHJXCPKNc9gQ5b5rUjJ5ASLxEim4BikZ6T
	T2IuYKhnJ0f+4W3yQHnBnYVCbEsA0k8s63+VnSadG8DkckHH1rcmA8bdCxOUafmx7e25E8j26rh
	n5FA1hooeXcSxvOmxmWo8tgqTunJfpIs=
X-Gm-Gg: ASbGncsJks8J2bDRntwyZhhfWv1mHYOF+y5eTDxbdtiWpDU4fHVIhGXp1ly2CaPQ151
	ZIm6E5Paq6RWCDLN9O4N9X/sZY59NwCht8DCO9EDQBT1pbT47fKV2J9tvQJ2OR806Dc4BtUUuUF
	lDDtRYJ6eWlgDLFvWO3gdZb5zebxyOVSkBLzZ90gpJHI+mEKOBvLKPK7mrrFqAuX+FMSA6KXKCf
	jbMdVgptQHoarwQCpfnKevdTIK0eFWKjPY0HZjFkw==
X-Google-Smtp-Source: AGHT+IGGp117d+C4nGWCnd+e8rq+kUzsoIMiqTOEd1myMMBz03N8LD6xRLaicAUgmaalwvLRv0UG+Wa0FrJkVem0Kfg=
X-Received: by 2002:a17:90b:3b90:b0:330:604a:1009 with SMTP id
 98e67ed59e1d1-339a6f38562mr9750743a91.23.1759421955640; Thu, 02 Oct 2025
 09:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-can-v1-0-c075f702adea@nxp.com> <20250822-can-v1-3-c075f702adea@nxp.com>
In-Reply-To: <20250822-can-v1-3-c075f702adea@nxp.com>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:24:10 -0400
X-Gm-Features: AS18NWAvvuq0JYjwHcuYxgL_GvcWi5Rt-rN98_ZHunTTnePybtwPWJ4gpWP89Yw
Message-ID: <CALC8CXc3OAqY5XTN1XivSbSdki2ZcPKTqJfXruRiq=KWQPbR5w@mail.gmail.com>
Subject: Re: [PATCH 3/6] phy: phy-can-transceiver: Add dual channel support
 for TJA1048
To: Peng Fan <peng.fan@nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aswath Govindraju <a-govindraju@ti.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, Haibo Chen <haibo.chen@nxp.com>, 
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_091916_596238_40858232 
X-CRM114-Status: GOOD (  26.99  )
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

Peng Fan.
Bet you once were of the tribe of the Wolf.
Pen Fang.

On Fri, Aug 22, 2025 at 12:07=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> - Introduce new flag CAN_TRANSCEIVER_DUAL_CH to indicate the phy
>   has two channels.
> - Introduce can_transceiver_priv as a higher level encapsulation for
>   phy, mux_state, num_ch.
> - Alloc a phy for each channel
> - Support TJA1048 which is a dual high-speed CAN transceiver with
>   Sleep mode supported.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/phy/phy-can-transceiver.c | 117 +++++++++++++++++++++++++++-----=
------
>  1 file changed, 83 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/phy/phy-can-transceiver.c b/drivers/phy/phy-can-tran=
sceiver.c
> index b49371a1272cd8a25b5e2271586b756103c64f0a..0e7b23073bfa8eae7200d30dc=
657a979f6cc9d86 100644
> --- a/drivers/phy/phy-can-transceiver.c
> +++ b/drivers/phy/phy-can-transceiver.c
> @@ -17,13 +17,20 @@ struct can_transceiver_data {
>         u32 flags;
>  #define CAN_TRANSCEIVER_STB_PRESENT    BIT(0)
>  #define CAN_TRANSCEIVER_EN_PRESENT     BIT(1)
> +#define CAN_TRANSCEIVER_DUAL_CH                BIT(2)
>  };
>
>  struct can_transceiver_phy {
>         struct phy *generic_phy;
>         struct gpio_desc *standby_gpio;
>         struct gpio_desc *enable_gpio;
> +       struct can_transceiver_priv *priv;
> +};
> +
> +struct can_transceiver_priv {
> +       struct can_transceiver_phy *can_transceiver_phy;
>         struct mux_state *mux_state;
> +       int num_ch;
>  };
>
>  /* Power on function */
> @@ -32,8 +39,8 @@ static int can_transceiver_phy_power_on(struct phy *phy=
)
>         struct can_transceiver_phy *can_transceiver_phy =3D phy_get_drvda=
ta(phy);
>         int ret;
>
> -       if (can_transceiver_phy->mux_state) {
> -               ret =3D mux_state_select(can_transceiver_phy->mux_state);
> +       if (can_transceiver_phy->priv->mux_state) {
> +               ret =3D mux_state_select(can_transceiver_phy->priv->mux_s=
tate);
>                 if (ret) {
>                         dev_err(&phy->dev, "Failed to select CAN mux: %d\=
n", ret);
>                         return ret;
> @@ -56,8 +63,8 @@ static int can_transceiver_phy_power_off(struct phy *ph=
y)
>                 gpiod_set_value_cansleep(can_transceiver_phy->standby_gpi=
o, 1);
>         if (can_transceiver_phy->enable_gpio)
>                 gpiod_set_value_cansleep(can_transceiver_phy->enable_gpio=
, 0);
> -       if (can_transceiver_phy->mux_state)
> -               mux_state_deselect(can_transceiver_phy->mux_state);
> +       if (can_transceiver_phy->priv->mux_state)
> +               mux_state_deselect(can_transceiver_phy->priv->mux_state);
>
>         return 0;
>  }
> @@ -76,6 +83,10 @@ static const struct can_transceiver_data tcan1043_drvd=
ata =3D {
>         .flags =3D CAN_TRANSCEIVER_STB_PRESENT | CAN_TRANSCEIVER_EN_PRESE=
NT,
>  };
>
> +static const struct can_transceiver_data tja1048_drvdata =3D {
> +       .flags =3D CAN_TRANSCEIVER_STB_PRESENT | CAN_TRANSCEIVER_DUAL_CH,
> +};
> +
>  static const struct of_device_id can_transceiver_phy_ids[] =3D {
>         {
>                 .compatible =3D "ti,tcan1042",
> @@ -85,6 +96,10 @@ static const struct of_device_id can_transceiver_phy_i=
ds[] =3D {
>                 .compatible =3D "ti,tcan1043",
>                 .data =3D &tcan1043_drvdata
>         },
> +       {
> +               .compatible =3D "nxp,tja1048",
> +               .data =3D &tja1048_drvdata
> +       },
>         {
>                 .compatible =3D "nxp,tja1051",
>                 .data =3D &tcan1043_drvdata
> @@ -107,11 +122,27 @@ devm_mux_state_get_optional(struct device *dev, con=
st char *mux_name)
>         return devm_mux_state_get(dev, mux_name);
>  }
>
> +static struct phy *can_transceiver_phy_xlate(struct device *dev, const s=
truct of_phandle_args *args)
> +{
> +       struct can_transceiver_priv *priv =3D dev_get_drvdata(dev);
> +       u32 idx;
> +
> +       if (priv->num_ch =3D=3D 1)
> +               return priv->can_transceiver_phy[0].generic_phy;
> +
> +       if (args->args_count !=3D 1)
> +               return ERR_PTR(-EINVAL);
> +
> +       idx =3D args->args[0];
> +
> +       return priv->can_transceiver_phy[idx].generic_phy;
> +}
> +
>  static int can_transceiver_phy_probe(struct platform_device *pdev)
>  {
>         struct phy_provider *phy_provider;
>         struct device *dev =3D &pdev->dev;
> -       struct can_transceiver_phy *can_transceiver_phy;
> +       struct can_transceiver_priv *priv;
>         const struct can_transceiver_data *drvdata;
>         const struct of_device_id *match;
>         struct phy *phy;
> @@ -119,52 +150,70 @@ static int can_transceiver_phy_probe(struct platfor=
m_device *pdev)
>         struct gpio_desc *enable_gpio;
>         struct mux_state *mux_state;
>         u32 max_bitrate =3D 0;
> -       int err;
> -
> -       can_transceiver_phy =3D devm_kzalloc(dev, sizeof(struct can_trans=
ceiver_phy), GFP_KERNEL);
> -       if (!can_transceiver_phy)
> -               return -ENOMEM;
> +       int num_ch =3D 1;
> +       int err, i;
>
>         match =3D of_match_node(can_transceiver_phy_ids, pdev->dev.of_nod=
e);
>         drvdata =3D match->data;
>
> +       priv =3D devm_kzalloc(dev, sizeof(struct can_transceiver_priv), G=
FP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       if (drvdata->flags & CAN_TRANSCEIVER_DUAL_CH)
> +               num_ch =3D 2;
> +
> +       priv->num_ch =3D num_ch;
> +       priv->can_transceiver_phy =3D devm_kcalloc(dev, num_ch, sizeof(st=
ruct can_transceiver_phy),
> +                                                GFP_KERNEL);
> +       if (!priv->can_transceiver_phy)
> +               return -ENOMEM;
> +
>         mux_state =3D devm_mux_state_get_optional(dev, NULL);
>         if (IS_ERR(mux_state))
>                 return PTR_ERR(mux_state);
>
> -       can_transceiver_phy->mux_state =3D mux_state;
> -
> -       phy =3D devm_phy_create(dev, dev->of_node,
> -                             &can_transceiver_phy_ops);
> -       if (IS_ERR(phy)) {
> -               dev_err(dev, "failed to create can transceiver phy\n");
> -               return PTR_ERR(phy);
> -       }
> +       priv->mux_state =3D mux_state;
>
>         err =3D device_property_read_u32(dev, "max-bitrate", &max_bitrate=
);
>         if ((err !=3D -EINVAL) && !max_bitrate)
>                 dev_warn(dev, "Invalid value for transceiver max bitrate.=
 Ignoring bitrate limit\n");
> -       phy->attrs.max_link_rate =3D max_bitrate;
>
> -       can_transceiver_phy->generic_phy =3D phy;
> +       for (i =3D 0; i < num_ch; i++) {
> +               phy =3D devm_phy_create(dev, dev->of_node, &can_transceiv=
er_phy_ops);
> +               if (IS_ERR(phy)) {
> +                       dev_err(dev, "failed to create can transceiver ph=
y\n");
> +                       return PTR_ERR(phy);
> +               }
>
> -       if (drvdata->flags & CAN_TRANSCEIVER_STB_PRESENT) {
> -               standby_gpio =3D devm_gpiod_get_optional(dev, "standby", =
GPIOD_OUT_HIGH);
> -               if (IS_ERR(standby_gpio))
> -                       return PTR_ERR(standby_gpio);
> -               can_transceiver_phy->standby_gpio =3D standby_gpio;
> -       }
> +               phy->attrs.max_link_rate =3D max_bitrate;
>
> -       if (drvdata->flags & CAN_TRANSCEIVER_EN_PRESENT) {
> -               enable_gpio =3D devm_gpiod_get_optional(dev, "enable", GP=
IOD_OUT_LOW);
> -               if (IS_ERR(enable_gpio))
> -                       return PTR_ERR(enable_gpio);
> -               can_transceiver_phy->enable_gpio =3D enable_gpio;
> -       }
> +               priv->can_transceiver_phy[i].generic_phy =3D phy;
> +               priv->can_transceiver_phy[i].priv =3D priv;
> +
> +               if (drvdata->flags & CAN_TRANSCEIVER_STB_PRESENT) {
> +                       standby_gpio =3D devm_gpiod_get_index_optional(de=
v, "standby", i,
> +                                                                    GPIO=
D_OUT_HIGH);
> +                       if (IS_ERR(standby_gpio))
> +                               return PTR_ERR(standby_gpio);
> +                       priv->can_transceiver_phy[i].standby_gpio =3D sta=
ndby_gpio;
> +               }
> +
> +               if (drvdata->flags & CAN_TRANSCEIVER_EN_PRESENT) {
> +                       enable_gpio =3D devm_gpiod_get_index_optional(dev=
, "enable", i,
> +                                                                   GPIOD=
_OUT_LOW);
> +                       if (IS_ERR(enable_gpio))
> +                               return PTR_ERR(enable_gpio);
> +                       priv->can_transceiver_phy[i].enable_gpio =3D enab=
le_gpio;
> +               }
>
> -       phy_set_drvdata(can_transceiver_phy->generic_phy, can_transceiver=
_phy);
> +               phy_set_drvdata(priv->can_transceiver_phy[i].generic_phy,
> +                               &priv->can_transceiver_phy[i]);
> +       }
>
> -       phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple=
_xlate);
> +       phy_provider =3D devm_of_phy_provider_register(dev, can_transceiv=
er_phy_xlate);
>
>         return PTR_ERR_OR_ZERO(phy_provider);
>  }
>
> --
> 2.37.1
>
>

