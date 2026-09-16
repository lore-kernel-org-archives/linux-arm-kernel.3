Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D462C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 06:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLQJlPVwEEi5+s2qt4TvZ0WfYKHDL+3w8HRDzcqcQ8c=; b=OGtcTNztFWI4HxBpOajZQXMOsB
	khAzVJcVidyCuVNaM/aCCJkEjaRpDIPTUgYlayHw04TP74QJa/RC8WMNFxAD375Agy7UoIt92nSo1
	xMILcB0T5G6l/wEMOzehL+1JbK8nkzgLMqu6AyLTuofmhexNDqXlLBrMKNKiekfuTq/ZOLPixEQOt
	0TUWFLKfgARZQwT8pIx0q8L5ExvM9KNCHfI/8LHcS815WWZJxWUvUF3OM8OzJoI6DuDLXo5YEZUkw
	n2ze4ypZZgzVdjYfvS1wNCTO7DX4Q0whnEGB3kqUxqefB6LewAQq/Jz8E2/sXddnoxf56aOCyl52Q
	fPd1B/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6j9P-00000008Trq-09PI;
	Wed, 16 Sep 2026 06:29:47 +0000
Received: from mail-ua2-x0c.google.com ([2a00:1450:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6j9L-00000008TrU-2ZR3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 06:29:45 +0000
Received: by mail-ua2-x0c.google.com with SMTP id a1e0cc1a2514c-97e7c7bab8eso262656241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 23:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789540182; cv=none;
        d=google.com; s=arc-20260327;
        b=sGAh/msQ1C6TWiWnA1rxlNBhweorUruP6alyiVebDzCRcsNCE6UE+GJmCaO9YVvdWX
         IRovoaJMjsz/m3kvbd8eccqSg7QUZcbzKe9+fCquziqg0XJTW512Fwlpjh6HYGwQP8ak
         fyEO7y/vDU/zlwzdqRyrwM1wU0Rt1xEVBNa7WRoNGs5hIm7/xPyFYHhE6saA0Z3U9GCR
         gcG11phwD/9Br6vrdvAn1bzcwqOOP+344rVUGsHxbxzY0NC4jErvknXyjw9EQWWtBNOu
         BKfvpEXsQMsLNpklimF2OtTvc6LABV0+BY8VlFY+FMCzeZC8ViGx97erZLV2vMdVOK7N
         TNrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fLQJlPVwEEi5+s2qt4TvZ0WfYKHDL+3w8HRDzcqcQ8c=;
        fh=QdmSTb4rOyTuuksHmW/w1ofM/JDQZvQm3NezXD2C17M=;
        b=SfAcHR8gLpy+CVSisuJ667la5cvrFGRYR75K7kbnQ8yXg7pE/jdZ1YWoBVZGOlVX2l
         vMCtzt2OuV9WyD7dstJOHw1fQjYEguK+10kJA0QxTn4NWrmzNGnwe3WEK0Kq8AqXNMqy
         sewoT3vFpoiTICMQ+Sc8GIzMVnsyBUP706DZOCFv2zCNJnGnLKxzHL+r7i1XB809sm1T
         m/v3DlmAQCnWayI6eshDnA0hmw/2lvqm5oQhWcD0hhkSCk0zOq38KDxJmhQ+7OFusJaD
         qMeoBbPxAxH9uCpOsKRE1o8+UtpyOPwBXuKfDqI0+f2rFUA+uKdrJh772FDM/LDe65jQ
         t8Mw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789540182; x=1790144982; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fLQJlPVwEEi5+s2qt4TvZ0WfYKHDL+3w8HRDzcqcQ8c=;
        b=Df4yLyxCV5NPQT5ZIs3aRb1D6P8EA263FPrARGzKqXb3S39Ge1CHceTfFcNuHhJMz6
         CXF882tFXt1FlVySTCs/TLbXZmgXgmPPmF7FMRCN75gr7HrDDYMO5LidCvd3gqibKJHR
         eWDVBJ8d1zyHvN5zfhIxv2tY2eJAOYU5LqzdYlgOA47XwSSxFMA6AP/ggiHHni4mjUwo
         lOYCOH8HrCc/A+qi9tgpqFoF4lzrUtzBaGVmWOGrSXPRvvrJeW5wpMmkqcoZPUVsBFo2
         GujuzwMq4uXyoWDz85Yd0Sw884MG5wcqTZgs+Er9YibE0LtJoJ665lxmx4DNcoJIEMFR
         1mdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789540182; x=1790144982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLQJlPVwEEi5+s2qt4TvZ0WfYKHDL+3w8HRDzcqcQ8c=;
        b=ENwr1MZsuHZ52/I4S5JBqzFF8mZ6VCb+XqV+MX/aeKDvix9KJYVuRrjwnNzPi+Yxod
         vmKMqELp3iQru2yj6Dnmwj/CfSdlxQWOghqZ+KVExmp/M4E9nke+O4tWNXmk7RO4IC7K
         iUp3DXEKUveZF5If/gFRleC3ug4D0y6yVLt46HwtqcwYJzDs+3IyhlM8ks0CReRXtG+Q
         pdMxIKexav867OZ09+ulz1fguB8Z94zCldMJl1DuYkOSO2TUmLNiIcKVvmOLv5BTMbgh
         0CyCM6yVQLhiniaPSuY/t3V408wYXqIpKrhq2BJ4OSYM8YD8PJhxCoC3JqXZ/KdLg3JW
         uldg==
X-Forwarded-Encrypted: i=1; AKwUvByt6cJEAd8gVrWWhYTsiVyWi0MPl140fiuedIjKjoRF2evZnT/8GZjb24fRoH82nJEf02pMDGCZKpFSUiiI2vc2@lists.infradead.org
X-Gm-Message-State: AFuF++lI+QPhiAFG6nqDes7OQQx3Kb+VftSxYQuHn0gmsL1IK75eeQy5
	0Tvv6H9m8TpNJMTJcDLfms+aBM3+FOkzJh7iQ8Pip2xbMDwowoYLjbzwjgo7OW2i1AEp9kMtB0M
	aT6bgE4Swt8SJVEa+z1RcYMB3XBXYiv8=
X-Gm-Gg: AYBFou0JtPJBK0H/Mr0M1wfG5f+Nyd3g7yGGqOM5QQbBiLUFyX7d3glPObV638XoJ4k
	1bZiUEhqZmsR+WI7dDEjti7PVw9+PJMraGdT2dYxV/rPRuFqLghUETL1VO53TU7X26sT6SEYKsB
	Fg5sm3V5aMGS180rD5gRCb/xRsjbgmWP2yX7z4vScVHfsCbCx7k3oyUECm2b6qzbAzYNEyaWsh3
	Yv8GXL8GDbV1RXp/n/sUMuoahZmMSwdBO45OHAHh+slSHwWKzU+rJhNe0yJGYPnGSusznUZ/BM5
	WMhknYQWTAmyhpFgTFW4tK44kHpjmZRXROiYjOae1eeIQXNrUfMy/iTPrfZmtDyckqZ/s52eU4I
	4uUMyVY6Zj932VfkEnYdGxEWAFVz2fg7mPZY3j4MwMTp+zmyrtxeB3H3XOPdRIljARPwbvplQS1
	vKeNB7Iw20IvLcd/5tIIU43xl6CgnCGm6yW5ZFTyn2cU3M
X-Received: by 2002:a05:6102:3ec7:b0:79b:b116:2c5 with SMTP id
 ada2fe7eead31-7a023d19677mr1268443137.2.1789540182266; Tue, 15 Sep 2026
 23:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260916044119.475666-1-alastair@d-silva.org> <20260916044119.475666-5-alastair@d-silva.org>
 <579d7650-583e-49bd-aa51-02fc52940ea1@bootlin.com>
In-Reply-To: <579d7650-583e-49bd-aa51-02fc52940ea1@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 16 Sep 2026 00:29:29 -0600
X-Gm-Features: AcwNN1UffeYUy4Pp1zpzsKWqvpGpKHs9ZXj5jRY360cdZ_TOsQDRhTD1ZCtKs60
Message-ID: <CADvTj4pC2xGn4m5Medhpn16wwLj34uatw7v266CCmYWOyWPAZw@mail.gmail.com>
Subject: Re: [PATCH net-next 4/4] net: stmmac: dwmac-sun8i: Add Allwinner H616
 EMAC clock index and internal PHY support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Alastair D'Silva" <alastair@d-silva.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	richard.genoud@bootlin.com, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_232944_130908_33157031 
X-CRM114-Status: GOOD (  26.81  )
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

On Wed, Sep 16, 2026 at 12:25=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 9/16/26 06:41, Alastair D'Silva wrote:
> > Support EMAC1 and the internal Fast Ethernet PHY (AC300) on Allwinner
> > H616 and H618 SoCs:
> > - Allow reading a register index from the syscon property to offset the
> >   regmap field for EMAC1's dedicated clock control register.
> > - Add emac_variant_h616_internal with support for internal PHY, MII,
> >   RMII, and RGMII modes.
> > - Delay the MAC software reset until sun8i_dwmac_init() when using the
> >   internal PHY, ensuring the PHY has powered on and begun generating
> >   the receive clock before the MAC attempts to reset.
> > - Skip setting H3_EPHY_SELECT for H616 internal EMAC, which does not
> >   use the H3-style EPHY select bit.
> > - Handle -EPROBE_DEFER cleanly during clock and reset control acquisiti=
on
> >   in get_ephy_nodes().
> >
> > Assisted-by: LLM
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
>
> Even if this is a duplicate some of the work done by James Hilliard, this
> raises interesting points.
>
> > Notes:
> >     Tested on Mellow Fly-C5 (Allwinner H618) under Armbian, verifying s=
table
> >     EMAC1 probe, deferred soft reset with the internal AC300 EPHY, and =
100M full
> >     duplex operation under load.
> >
> >  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 65 ++++++++++++++++---
> >  1 file changed, 55 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > index 48c52eb96233..1728893589a6 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > @@ -130,6 +130,16 @@ static const struct emac_variant emac_variant_a64 =
=3D {
> >       .tx_delay_max =3D 7,
> >  };
> >
> > +static const struct emac_variant emac_variant_h616_internal =3D {
> > +     .syscon_field =3D &sun8i_syscon_reg_field,
> > +     .soc_has_internal_phy =3D true,
> > +     .support_mii =3D true,
> > +     .support_rmii =3D true,
> > +     .support_rgmii =3D true,
> > +     .rx_delay_max =3D 31,
> > +     .tx_delay_max =3D 7,
> > +};
> James's series [1] says this SoC only supports RMII (yet includes RGMII t=
iming
> control), and here for seemingly the same device, there's MII and RGMII
> support listed.
>
> [1] : https://lore.kernel.org/r/20260915-submit-h616-emac1-v1-v1-0-195de0=
bb1f8a@gmail.com
>
> Maybe you can coordinate with one another, can we connect that SoC to a n=
on-internal PHY ?

The SoC, yes, on emac0 for H616, but not for emac1.

> If so, can we use MII, RMII and RGMII ? or is it just RMII ?

Looks like it's just RMII.

>
> Maxime

