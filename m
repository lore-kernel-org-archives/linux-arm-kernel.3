Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C26CCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 07:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Zq8NlPwkeL9howQ0mnjaivcphRCiBVQ8OhdmA2H/pU=; b=2Ulol48XyG7EotfSXaMYhiNSEO
	Ys6DiC9ZUg8SkstOasbGBwMa4v8/nxmzz81l9pPA4qPZptWpXTex3qEPKZ0sradKvPPmukFx4wdxy
	hiwUfSxrhCOpwdXjsalqlTt2jdTEnowzRIwO9ITg6nzPw8EqEpidhhodQTitEtNzpnd16ofwXwV1n
	oiEp9CGfll2BscHLH8SdNMRoEbmcoRiiHVchJS+2QyrFPC8ghJlcaKoQgE+YR8rUgzXJLZo+QziLT
	FSv2DM3mniqkFaI0W2XBM3KMWtkPfU86e9wR+8A+uZSpWAXvcgei5h+e5KY82CDWEUAPkKalPA5Ck
	nZ/uXuxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEM4V-00000001q77-2HxO;
	Wed, 07 Oct 2026 07:28:15 +0000
Received: from mail-ed2-x08.google.com ([2a00:1450:4864:33::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEM4O-00000001q5W-2W1x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 07:28:13 +0000
Received: by mail-ed2-x08.google.com with SMTP id 4fb4d7f45d1cf-6ad83f018e0so2101199a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 00:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791358085; cv=none;
        d=google.com; s=arc-20260327;
        b=DPDqQKygPEUBm72VecF10rfzXPAKklCyp7SoM4e+uP7jFDR3S6XzYPZxBtFcZnXug6
         Nf7cW9I4YQLo+/nQKso3sF7kzWvCeERJZPCHM8+qRRPrCdELw1nMUwlsSr9tBaQVfKVp
         of63UjhYtUHaiJ2tg4ynE5orSRuWQzhUriFkIJXmNOhG2bDpnokPseg25QJ4vcdmMElD
         +omfYCJLC+/4+7UXieH9CGDvLezIwQS6KahyUr2QZLe6EbOm3Y6ghk3gXMeqpoNfU8fs
         3xaNgXF5DiHhWMiHmYUYGwUry7OC0axpgG48ASDVe3rcQDcTttyB4S5b0BWLT/5PPnfF
         yOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Zq8NlPwkeL9howQ0mnjaivcphRCiBVQ8OhdmA2H/pU=;
        fh=ojbHc2xRfbkpeyRRDEtvABJmjxk6D31niXMEccmuRG4=;
        b=i+PVVK9kDNeYlGNMsWi90EOuZLrFewv0BkbNpZosVrvqaE83RPmowZH3q8G1Nob7Bg
         4t91tffkPZhRB1e00OTlAyEuHEuqgZtgYVZ/xTFwAAk+2X0/wp2FmxkUny8O5ZQDRVX6
         ASCp/b7HCttUG1PCPmyNPdX+2byuY11WCdL/JDso8AXPaFuaj0zOi9Av6X0E7JdQLqHw
         eb6qhNey8Bwi/HC9W827DjVdCx7cXTtTqnbxTwu7F2VfaxURnDMT+GQS2JUGUnp8HxKk
         5nKXGgz2aR3oMvz+so7Wc8s83n/Gpj0CjyabkPdJGW0lOIMDp4lmL6+kUMFFm8lO03oj
         2bSA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358085; x=1791962885; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Zq8NlPwkeL9howQ0mnjaivcphRCiBVQ8OhdmA2H/pU=;
        b=iGYUnG8aJh3vxv5OtugzmR89CGfMXVF2izEFB+quEagKHXK507lbsjd4/MtqqQ2O01
         Qf1e2AjcZItBQqTP0thE9+W+btkzukG6CLolZ5J6BuzFryxtfkOQyFiEVlsUrMU0uqBK
         vPdFnWarC5uYdIeBuRi7RuX2D+jnJ7bOhbhSko/mokJNQu8Vk3tdtx6CwTnBLCX81SQ9
         I4gfmu+TgvT1yW/kfa/Rds0Q5236CDnsf/QEfRDhiOMBOY567ezD4mAr73EvC8yM5ANZ
         d4/eH7HAA3JAaYqcHfxBHYc8W5D3c9f7XfbV4nWTrieOd7alRoIB/NPkid9QBBHnaf6s
         fwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358085; x=1791962885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Zq8NlPwkeL9howQ0mnjaivcphRCiBVQ8OhdmA2H/pU=;
        b=WNv3PnhU3ruV/xmrDfoMf+dahbVB883IFgkdfpUOlOEzwkT9uBs31PWdCUKEZ8rIJw
         QkvHXJgevrYCnBl6oubp0R+7u9WZey4KZb1T6hWa/nqOIbDCozS3lnEIPlY9VZlY1z4Y
         6sSN/EHudQdF7+kBRU3crFn7DK2fW0KqZ4EndX57G+jfi9DQCMcUYSqoFjZiIFakiY9e
         Z9a6SJmrsd+WEdjGJT2zF8WezdOMLxkcoyace0BTh6eHoB17QHoS7T18JtVoAyXDUvrL
         oHUomU/lyh5VeyrqLTZaMYHTk5jckgel9BT9SVcs7UkcTWjLVF0gJMC+piAlLwt6bc+Z
         Z2LQ==
X-Forwarded-Encrypted: i=1; AKwUvByU0BjYZlsggs6V7NNjlXzvBn0kL2QUv45Wnjrsg9EPeb2z7Mtdugkn529WqeIZWjFwmA0n4dLbnyT25kybMmFl@lists.infradead.org
X-Gm-Message-State: AFuF++l9g9YpVOlcnDIOz/XIveIa+TQJmdV/wg765vYU3Ygy4Sdms2Nf
	lFHyvr04SH2FASEsetJyIBV8fy+rr90eX+xBgvi56x7ZLwc/fZmsL2uH9HseZ5YAp+tByaGj7cx
	EmJTZLBjsMdlnvCuy+VUGh2W4i7xtA1k=
X-Gm-Gg: AYBFou33i5nnMqIcztNqLfMKQAcyCAVSD/Sld/LhFbNJxd0mDESmLHVh0x6jLaFwUQT
	0d41tzTM7/CvWTGSrFETePc6SWHM2PTMw0dDem+XTfbFXbeIoSl0Hn3wSz7BosSuf53LLWvJGMT
	Fb3XZsMUVNRAUgju5GWLhfzRXl94tHcqOS32yujoRP3tR5Z6Dt8YdY8J6tDvSZHq6pG+eqg3WU0
	ZwHmW2dQOacQJwe3GFEzfwJlTNcFcmmNe/FqHA/etY6V1TGW+S2Qw8K3Pqro922Qn8ypze8J8oU
	ijQNVkKDN/GEBTNtMZmW6pssGk54Z8lNALjqUFRpOLMK0cX9V/r/8vxBGL1vRVVn3esJ
X-Received: by 2002:a17:907:6ea8:b0:c29:659e:2fd2 with SMTP id
 a640c23a62f3a-c317bdfe7aamr131010766b.27.1791358085108; Wed, 07 Oct 2026
 00:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20261006162807.2843858-1-coiaprant@gmail.com> <20261006162807.2843858-3-coiaprant@gmail.com>
 <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com>
In-Reply-To: <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 7 Oct 2026 15:27:54 +0800
X-Gm-Features: AclHuK9-vNcZxKo1OhLsfKqvuLHm0D_pklXBR5Ny7XJ7B7WuohnKFrZGwSHbsF8
Message-ID: <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_002808_678404_7FAD2D87 
X-CRM114-Status: GOOD (  31.42  )
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

Shawn Lin <shawn.lin@rock-chips.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=887=E6=
=97=A5=E5=91=A8=E4=B8=89 08:53=E5=86=99=E9=81=93=EF=BC=9A
>
> =E5=9C=A8 2026/10/07 =E6=98=9F=E6=9C=9F=E4=B8=89 0:28, Coia Prant =E5=86=
=99=E9=81=93:
> > On RK3568, the SGMII interface can be routed to either GMAC0 or
> > GMAC1 via the GRF register pipe_sgmii_mac_sel.
> >
> > Add support for this selection by introducing the
> > "rockchip,sgmii-mac-sel" DT property.
> >
> >  From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> > bit 1 (pipe_sgmii_mac_sel) is defined as:
> >
> >      0: SGMII routed to GMAC0
> >      1: SGMII routed to GMAC1
> >
> > The hardware reset value is 1 (GMAC1). If the property is set to 0,
> > the driver routes SGMII to GMAC0; if set to 1, it routes to GMAC1.
> > If the property is absent, the driver leaves the routing unchanged,
> > so the effective value is whatever the bootloader or hardware reset
> > left.
> >
> > The driver validates the value and rejects anything other than 0 or 1.
> >
> > This is necessary for boards such as the Ariaboard Photonicat, which
> > uses the SGMII interface connected to GMAC0.
> >
> > Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20=
TRM%20Part1%20V1.1-20210301.pdf (Page 229)
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > ---
> >   .../rockchip/phy-rockchip-naneng-combphy.c    | 42 ++++++++++++++++++=
+
> >   1 file changed, 42 insertions(+)
> >
> > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drive=
rs/phy/rockchip/phy-rockchip-naneng-combphy.c
> > index 7843356a4dd47..f76b48009673d 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > @@ -186,6 +186,7 @@ struct rockchip_combphy_grfcfg {
> >       struct combphy_reg pipe_xpcs_phy_ready;
> >       struct combphy_reg pipe_pcie1l0_sel;
> >       struct combphy_reg pipe_pcie1l1_sel;
> > +     struct combphy_reg pipe_sgmii_mac_sel;
> >       struct combphy_reg u3otg0_port_en;
> >       struct combphy_reg u3otg1_port_en;
> >   };
> > @@ -212,6 +213,8 @@ struct rockchip_combphy_priv {
> >       bool enable_ssc;
> >       bool ext_refclk;
> >       struct clk *refclk;
> > +     bool sgmii_mac_sel_present;
> > +     u32 sgmii_mac_sel;
> >   };
> >
> >   static void rockchip_combphy_updatel(struct rockchip_combphy_priv *pr=
iv,
> > @@ -341,6 +344,7 @@ static struct phy *rockchip_combphy_xlate(struct de=
vice *dev, const struct of_ph
> >   static int rockchip_combphy_parse_dt(struct device *dev, struct rockc=
hip_combphy_priv *priv)
> >   {
> >       int i;
> > +     int ret;
> >
> >       priv->num_clks =3D devm_clk_bulk_get_all(dev, &priv->clks);
> >       if (priv->num_clks < 1)
> > @@ -375,6 +379,16 @@ static int rockchip_combphy_parse_dt(struct device=
 *dev, struct rockchip_combphy
> >
> >       priv->ext_refclk =3D device_property_present(dev, "rockchip,ext-r=
efclk");
> >
> > +     if (device_property_present(dev, "rockchip,sgmii-mac-sel")) {
> > +             ret =3D device_property_read_u32(dev, "rockchip,sgmii-mac=
-sel", &priv->sgmii_mac_sel);
> > +             if (ret) {
> > +                     dev_err(dev, "failed to read sgmii-mac-sel proper=
ty\n");
> > +                     return ret;
> > +             }
> > +
>
> device_property_read_u32() should return non-zero value if it's absent.
> How about this:
>
>         struct rockchip_combphy_priv {
>                 int sgmii_mac_sel;
>         }
>
> static int rockchip_combphy_parse_dt:
>         u32 val;
>
>          priv->sgmii_mac_sel =3D -1;
>          if (!device_property_read_u32(dev, "rockchip,sgmii-mac-sel",
> &val)) {
>                  if (val > 1)
>                          return dev_err_probe(dev, -EINVAL,
>                                               "invalid sgmii-mac-sel
> %u\n", val);
>                  priv->sgmii_mac_sel =3D val;
>          }
>
>
> static int rk3568_combphy_cfg:
>          case PHY_TYPE_SGMII:
>                  if (priv->sgmii_mac_sel >=3D 0)
>                          rockchip_combphy_param_write(priv->pipe_grf,
>
> &cfg->pipe_sgmii_mac_sel,
>
> priv->sgmii_mac_sel > 0);

Hi,

Thanks for the suggestion. I'd prefer to keep the current form, because
it keeps "missing" and "malformed" as two distinct cases.

Current logic:

if (device_property_present(dev, "rockchip,sgmii-mac-sel")) {
    ret =3D device_property_read_u32(dev, "rockchip,sgmii-mac-sel",
                &priv->sgmii_mac_sel);
    if (ret)
        return ret;
    priv->sgmii_mac_sel_present =3D true;
}

- device_property_present() checks whether the property exists.
- If it exists, device_property_read_u32() reads it. A non-integer value
  (e.g. a string) returns an error, which is propagated -- it is not
  silently treated as "absent".
- The range check is done later, in rk3568_combphy_cfg's SGMII case, so
  a bad value only fails when SGMII is actually used. That keeps non-SGMII
  users (PCIe, SATA) working, and leaves room for future SoCs that may
  support a different set of MACs.

With int + -1 as the "absent" sentinel, a DT value like 0xFFFFFFFF would
wrap to -1 and be mistaken for "absent", bypassing the range check. The
u32 + present flag avoids that ambiguity.

So I'd like to keep v13 as-is. Let me know if you still feel strongly
about it.

Thanks,
Coia

