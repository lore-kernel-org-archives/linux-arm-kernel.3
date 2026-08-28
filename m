Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E18C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSJFj2Mb1tcu0hhCa3Pj1XQFswEEME5NPfKvSiT9UvA=; b=xyfONVsCRi5MqDunVUTTBhKy3J
	mhZKy1CWa4ciHGWp3L+PEeZvKO75WodmB/F2O8qaO0YW56TEyM6wclVtlZBScclaWHnEXD9GE8MVs
	b2qsc3N/3rXpZ5y/TI/rTiZtsTOhAC/gHDEohziAaUNCz4Ppfbglg4kmLpPDjtsnC5H11RNTEZC65
	vikmBHWVuUpy5+wwuZP8o6+QpKCcBwfjt5rlqWL6KfMuFD19QsYZyC/tkCMSZrxLkzONKXUIUzh1S
	bljAelBVl2eUmp3SGBlp+QU8tq0fq8+0wjWlFKi3kp9m+iOpFAWnElf3PLCM6hNu2lK0alFu3oJ/h
	wUjxZC2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzszp-00000005UIP-36KU;
	Fri, 28 Aug 2026 09:35:37 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzszm-00000005UHC-3IZe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 09:35:36 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6a09571dd5cso115435a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 02:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787909732; cv=none;
        d=google.com; s=arc-20260327;
        b=Y4JjK/iif/yrmg9Rbmw8Tx5mr5sEf68KtDmO7igFpoXYonNMNqGzg5yujkU5BJvsrw
         V6cn8tHibzkzz0X0uBfNKr6/hxPtV07VlnhJrVqTYTJRA2kN20Qpnfc6xGkdCHwuHmp6
         yfiiK3kY04pgqkzk+JBz8xR7OaZwxpDFJ64IwztW0LH6r7SpzNt/ogUbNtC4elTq4Kkf
         hjiQEl02W/bnG7b1fxxr/HRcDeFieYSOkzGajiNDdwnrEv/07axeFMHirlrG3q9DmvrS
         sDv0b1zDxzH4pdbi5MXWyJ/84NA/32pJ/A3p9B13Ofs1pwDmO9AarYYAyAyB9Pjg3gp4
         cp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bSJFj2Mb1tcu0hhCa3Pj1XQFswEEME5NPfKvSiT9UvA=;
        fh=TKxoQ5C9hUHNypG2huzgxVXErtDQUizDhOxK/q9TfxM=;
        b=c+0iYEs8Gwmjy+LCPRMEthTg3y1lCH9p3uWrF9V0LBWqKKmaM0PZFIfLzYdE6S/+U/
         vZ9t59EtR7j3K5ze8SZgbR1gGstb0PSvZlcoNkAhSMGeF+XnQ7guEZTV3PTvJ+M2oxzX
         dn4X4sRjxBZJtyc2NzhTFj9HBi26u6VRwZSLRnBGEj34G2s/JGRXXZNTchhCfM1rzwnY
         b/erR6Neei2BDEUqyyoPsqFQiU4/SqsBKfM/LDrZ4G1VCL8Dpma65t+ow974R0zGE19r
         gCt70QFtmv+wrQC/4R5hg5m+Rwms1bYgcXiFSOvSIfK0vYV8KD1F3eXWbednzgHWLCLy
         sdyQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787909732; x=1788514532; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bSJFj2Mb1tcu0hhCa3Pj1XQFswEEME5NPfKvSiT9UvA=;
        b=harRu+gXjF0Hp73xQFGmqlIuBiQwAUQ7ga+LTVIbAstbT5yOR9ltuLst2ykdmmePjQ
         UuYCpndiI0Rp5pwfzs2AZKI2zndZnSflW7nUoKIDS060mJ4N0xNtCBp3C6vX3iZHN18d
         RlKPJIZ/XqzTjeigftTsXo20FixU35+JF4pXrMPsOypPoopLxetBsF+sozlEEsA3SZtM
         j/Rai+iHElBvdP2vPmReHqtBTu7azI6Knbn9SlxjE31sGSCCHLItDJoBUTY9VuDEolrB
         wxYIfYfAW7rXjYMncf2aBB/JKQpZNsQSocKCxaL4YKPP6eNgBrLpGjzAj3UCnSV7tRkY
         lrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787909732; x=1788514532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSJFj2Mb1tcu0hhCa3Pj1XQFswEEME5NPfKvSiT9UvA=;
        b=R8AP8teWltZGB/0OacUJJaPVYJF0/yB4GynUI/U/gP1jpLBAEfMU7uUXYdhTMLc1le
         f9pG/DZEP81WHufPxAomkcF1XpmV2zNjTKpSekNNUwIaxf46Ky9Yrr+h2Y/k8QbdgRFV
         2Xa4iD9FzNMvhd6C80jbbCZdEquBl/MGgWXW2747+E1hyay/NfSdz508kspxMrhdPQtM
         QO1Y4wet/GiIZwtxWCNc+zGoroEPFHGZ85uyWX+3a02Q9ugjD5thjDlfJrJUKqsdo2gI
         E6A9JyzqIFLoMt8qJSDoW8kD2g302toGcz0jDcCRX5x9v3fs55UNCg0sKcHVBYcKMU46
         45Tw==
X-Forwarded-Encrypted: i=1; AHgh+Rpry1KMbxXgoizCIEYQXBx3tpbRJFQhpHs6OAXgUKMjsCRDSCmVUo/luvZG0lB+SN29Qf/mueN2i7dxOBwxcpaI@lists.infradead.org
X-Gm-Message-State: AFuF++l+NUP1bYUx9y8GQVYrPRoA4O82enSLsK9aDic5KZ99PKdjeFTX
	YUCIXED5pvUz+5NWX2R0BYpGp4wIY8kPuberGSkaPvigG96aiINp8GT7UlCR/xVl7Px5e5i80g3
	P/VsKLdbQXmBk2mzxYFi13o4hD+YB2eM=
X-Gm-Gg: AR+sD107oRQKdt3iCSr5lqUV9f+padL3wghIYGNNOz8TWAZwLkHZDRMzSSsdN2ZZGi+
	wY/n5+VlTDNp90Sg/+xTfZNxDBEhHXwi3syfG+erTYPa/sjD5DsOaj5Iry3dkGNty4XDHSafmp6
	oh6lng81somfjjKmhZcKiEbV0OjsTQYV+f8PfzN+ePZxDOEkBj0dq7BoHJwYvneBBUoipkrHwl9
	fGzxOmX6EYtO9s5GfHlEUSrQ4JdojbMymMbLHUO33p404/L0iTtmynln2DCrlPjw5XFN+Ebassy
	lQwwJ4v6b9/4hC1A5s98a7L1Yk6icG4iK7EYWcNn3gxOmLAf/tskjg==
X-Received: by 2002:a05:6402:541a:b0:6a1:de1:f739 with SMTP id
 4fb4d7f45d1cf-6a60d36a266mr1562286a12.2.1787909731660; Fri, 28 Aug 2026
 02:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
 <20260821-dcphy-rx-v1-v4-1-f1797634233d@gmail.com> <20260827-thundering-cream-saluki-dd05df@quoll>
In-Reply-To: <20260827-thundering-cream-saluki-dd05df@quoll>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Fri, 28 Aug 2026 17:35:19 +0800
X-Gm-Features: AcwNN1VURP6ewJ0HD0VNfWu9xGoJtKmMhy7y_I8d0yGNeVN7oyHoitKsjPfK980
Message-ID: <CAPwA33K+XSRPDzv9xAcoPneUsp6A9OTwakJ1VJY=zXnHiH+5Wg@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_023535_015816_6F99BDC0 
X-CRM114-Status: GOOD (  33.65  )
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

Hi Krzysztof,

Thanks for the review.

(from the review of 2/7)

> Please link/show the upstream DTS using simultaneously transmitter and
> receiver, where the consumer does not know with whom is it talking to.

I grepped the tree and found a device tree that has simultaneously
transmitter and receiver. In the arch/arm/boot/dts/samsung/*,
exynos4412-midas.dtsi enables csis_0, and exynos4412-galaxy-s3.dtsi, which
includes it, enables dsi_0. Both consumers are declared in exynos4.dtsi,
on the same phy node:

    dsi_0:  phys =3D <&mipi_phy 1>;
    csis_0: phys =3D <&mipi_phy 0>;

Tracing that back, the provider is
Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml and
drivers/phy/samsung/phy-exynos-mipi-video.c.
It registers several struct phy in one node, and the binding says:

      For samsung,s5pv210-mipi-video-phy compatible PHYs the second cell in=
 the
      PHY specifier identifies the PHY and its meaning is as follows::
        0 - MIPI CSIS 0,
        1 - MIPI DSIM 0,
        2 - MIPI CSIS 1,
        3 - MIPI DSIM 1.

Resuming from the cover letter in v4, I treat this phy as one tx phy and on=
e
rx phy. Maybe I can follow this pattern and introduce phy 0 and phy 1 in
rockchip,rk3588-mipi-dcphy.yaml, and add an enum for
SAMSUNG_MIPI_DCPHY_TX/RX in the driver. The binding would then say:

      Two cells select the mode and then one of the two PHYs that the
      block contains:
        0 - the transmitter, for a MIPI DSI host
        1 - the receiver, for a MIPI CSI-2 host

      A single cell is equivalent to a second cell of 0.

In this way, I don't need to add PHY_TYPE_CSI/DSI to
include/dt-bindings/phy/phy.h.
And I think this will not go against the discussion in v2, where Michael po=
inted
out that DSI and CSI are standard protocols and should not be named in
a Rockchip
specific header, and suggested introducing PHY_TYPE_CSI/DSI:

> How is that Rockchip specific? As you state above this is either MIPI
> CSI or MIPI DSI, two perfectly standard protocols.
>
> @all Would it be reasonable to introduce PHY_TYPE_CSI and PHY_TYPE_DSI?

https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.co=
m

> Where is any DTS using it? I did a search and no results of upstream
> posting.

The user will be rk3588-base.dtsi. It adds csi0/1, which connect back
to the existing vicap_mipi0/1 ports. It also sets #phy-cells
and the dsi consumers to the shape that comes out of this review; with v4
that would have been #phy-cells =3D <2> and PHY_TYPE_CSI/DSI.

I thought the dts should wait until the binding and driver were settled,
so I did not post it. I will add it in v5.

Thanks,
Jason

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=8827=
=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:46=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Fri, Aug 21, 2026 at 08:02:29PM +0800, Jason Yang wrote:
> > A MIPI D-PHY or C-PHY can be a transmitter (DSI) or a receiver (CSI),
> > and in some PHY blocks both work at the same time. The existing
> > PHY_TYPE_DPHY and PHY_TYPE_CPHY cannot tell whether a consumer wants
> > the transmitter or the receiver.
>
> The consumer knows this already, no? Imagine consumer of the phy is some
> ISP receiving data over CSI for given port, thus consumer cannot
> transmit over that link.
>
> All this seems redundant.
>
> >
> > Add PHY_TYPE_DSI and PHY_TYPE_CSI, so that a binding can select both
> > D-PHY or C-PHY and transmitter or receiver. They do not replace
> > PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice where a cell
> > selects the mode. The first user is the Rockchip RK3588 MIPI DC-PHY
> > binding.
> >
> > Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> > Link: https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@co=
llabora.com
> > Signed-off-by: Jason Yang <jason98166@gmail.com>
>
> Where is any DTS using it? I did a search and no results of upstream
> posting.
>
> > ---
> >  include/dt-bindings/phy/phy.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/ph=
y.h
> > index 979b5dfd8353..8ee3f88e6d80 100644
> > --- a/include/dt-bindings/phy/phy.h
> > +++ b/include/dt-bindings/phy/phy.h
> > @@ -24,6 +24,8 @@
> >  #define PHY_TYPE_CPHY                11
> >  #define PHY_TYPE_USXGMII     12
> >  #define PHY_TYPE_XAUI                13
> > +#define PHY_TYPE_DSI         14
> > +#define PHY_TYPE_CSI         15
>
> DSI and CSI does not look like types of PHY...
>
> Best regards,
> Krzysztof
>

