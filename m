Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60C1CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 21:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v463Ztb7l8HkbYlND0+jy6OLKJauaplyxKRrplRmY1k=; b=WxmX/DOamYSKVH/ujcdt3K1hwX
	2ljKOKbQe/FeYiQ7g13R5Uc932p/0C89m8PeGtIGauSK42eRlmL63XNZ0M8B43EUl7x9rKnVgk0uq
	JBq/io3Ebj4Tv9c3CfNBPFGPB8res00t2zCQjZiZF20KWYJfx91WnZGNuwHvnZMuth7wddkrfcksf
	4WmvhN/9no8f78MxxP5ZkfGyVOE0XQoRO+EK+b7uamQTn84eQDPYFM3+UjbbcxHfVcc4cul8ftozr
	aRRh9+FYV6yPxcBIHbwbKZeUvUXggRDPsCNuHkqNBWfNnfSR/VfJ4DxAU0uspo+t4vXE27xjbl4uf
	oUJ9NV6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDq1s-0000000HBV3-1xDv;
	Mon, 05 Oct 2026 21:15:24 +0000
Received: from mail-ed2-x0b.google.com ([2a00:1450:4864:33::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDq1o-0000000HBTI-43DX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 21:15:22 +0000
Received: by mail-ed2-x0b.google.com with SMTP id 4fb4d7f45d1cf-6aa912db07bso1567406a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 14:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791234918; cv=none;
        d=google.com; s=arc-20260327;
        b=oOPz8HJFo3O62IIL6h7LGoatg7QvVA2Ipb0JcPkZ2nNBhR05VrFsAtflqvnXu2Hxek
         tIESvKAHgHz/ryqEsalA/LEtnmkL20qIAkT3a7x9o+MVWlfJ/LwDcLhiE9Npe+1l4COW
         zi96+sy9jiR36U0OVQekhPqSXFV0Y2s6WPSiu/8H446/aIcA09dKD682Sr4mhKGZFTJb
         tyfo73moZUYoDjGhyOpNBArueQR8Kq5e6ehpokEHN2s7Mvd8spBY8Db8IIJNWncT2bWZ
         OjRRMe2rjhcvtI7LNyver/ICWl8zmB6MZxqqOtZv4uHBIMkjAOi3gAQyEmFhEw8MM7j1
         rKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v463Ztb7l8HkbYlND0+jy6OLKJauaplyxKRrplRmY1k=;
        fh=WHwZtGkm0WkW9Bd+5N4UjvgVkqAn3DyaZy1O9tDA1+w=;
        b=GJkABrztAbtoKGC8PFcVtHjAl+7m3l7ZgVlv7Rpy3el1vdyhF9NcMJfJkT8bOtQ+Yy
         NXc7EfcXfFyQoai6tImc4Zw7+HwGj/XQoINxUYRx887gWn/BVF3mOta/cznOV6I26XkR
         xTTX1mTVt+g6XcGFPtjAwI8Ib3kRiC5MlGnHCAfn2xnvBV6eGISPAcnvXld4s0ZUt2J4
         RapZli0VytR67sXIqFyNCXD6Z7q4dn3XC9pKXRe9AyPrrP7hYEY9NbRt/6jIacqHn1Rm
         ekove0cgtB88UD1Da5oEvKTMH/Fe2MbC9DuDKUTGZ95Xp9P9ot5f4VSMoqbMZZVVvlk7
         PhLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791234918; x=1791839718; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v463Ztb7l8HkbYlND0+jy6OLKJauaplyxKRrplRmY1k=;
        b=dSRTaO8dWwoAqpFXB3yfnsnJRwJiL3GQ4k2pMks1ShBnzp3nT9VQP9SCqwJGvUMGCH
         zhQ7VSGh+xKB9KHKqbMJIRL0oSf5mOfhsxFYK+sjxqeQmlIGpHfg/VMjzACjeK6rDd53
         EPn0Ap2Pxy8M994hY6/1yFzOsUWEj/GjTONp7B18s3FgbiUO68znsJmdBtUt4/aftCP/
         /cYKBIllW7rKTSbb7h716pbe9jOXhicRSKe5ZRyrtY1BrPp/qUY39B44RovSCprHVkvl
         ljV+Nzf6AXPJhS8SutRljRweNQrTlooN+M2le60gOXNxHDbXXo3BdwgImWLIWe20Osxw
         NV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791234918; x=1791839718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v463Ztb7l8HkbYlND0+jy6OLKJauaplyxKRrplRmY1k=;
        b=nDQiL1+XO+TC4paArPNYNQ9jluHvvgxBioa/BxxksqYZ/rL8daqzR473KGTdD4UMNL
         9nOMHvR5zfm/GZwCAmAO/7Lc8uuWPX+hqU0M2qGOahMz8oxQIuuYDIOB9uwCg/ZhsZp6
         nhgbCxIw3+rHjsR7qm5acbQPcmGaLN6/eBwcd4XVOvWsPyKHOd3/H4JSPL58OICciJ8p
         hJ+AljnfpbWvaXmZiwEZrseqJc0vHEjbVWANSVsHY+mT8HXm3z97ZPSRyhk0dYEW88V4
         sL4OgoTPOM5jjkYt9iw9j9uw7XNV7STvmaLrAQKfmdnBg+heYJGVfwWMtrFpYdqgQQLr
         3w1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxV1ArBclb7sAmwgPuiKduLmM3xN7wjYZFrp7FDPiDaVGfRR6tA8zqXNj/ylboedBJULTlBQ0gn/lFpXksvwZQG@lists.infradead.org
X-Gm-Message-State: AFq9FYIJlHJY60miMcrejeSW0rpA4pxvXfgAd/H5oJY74aZZrPNx8dVd
	u2mzsoibvxzzZtzFvMc8MsU3upXItzGJmfEJOBxiCIB/2fOeKlDhH2+nSY7/7F3Q5xMC8glfr2i
	Sr03e4BCBDOy8Xxh+rcep4AdB5Qmzd24=
X-Gm-Gg: AYBFou10kODWTOPd3DpVX0FnB/wMwS1CSrcC5E89FZ9sF1O2TFXcv6uVN7Z5Kas7dV4
	NLsU8GjTBLK7Sgk6ECPprmSqp4DmxLYiuYwIKZ9cpUNTG5wAK704KzLGsD+6h0VAU77rqh/HLq7
	KMivD/Jf3h7Gd2y+v/pD5vh4IR2I3N29Ts6Ejb+sDMmeW66eZUd0FIGXk8KoFK6e1FLV1yygdYu
	7GFk+tMryLAzyQuvNWST5MO4xgrpTRd8OOeSvLjKSVlwPRESv4uTDrdXXTFJ5SQ7mEmNOw8Ln/O
	MdqZ7XojpFg8Ba7WEFr9Nh0XOmVo1Hsmwcw1I1H64xNZz92jQKPqgOA1OA==
X-Received: by 2002:a17:907:7215:b0:c2d:bd95:874a with SMTP id
 a640c23a62f3a-c2e4ad79199mr1112515766b.17.1791234918176; Mon, 05 Oct 2026
 14:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922200336.2201212-4-coiaprant@gmail.com>
 <20261005135939.01ccde50@kernel.org>
In-Reply-To: <20261005135939.01ccde50@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 05:15:07 +0800
X-Gm-Features: AclHuK-hmC2IHermBe0I62cu-4Uo5MfOk7srVIbtbJ9DQ0aB5gykKJWKnA3WMzU
Message-ID: <CALj3r0h7j-4ZAiX67LmbgpmYCvK-Xmzd_qnYYgoBmniAW+eiWw@mail.gmail.com>
Subject: Re: [PATCH net-next v10 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_141521_085788_09A59A68 
X-CRM114-Status: GOOD (  25.85  )
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

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C 04:59=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 23 Sep 2026 04:03:27 +0800 Coia Prant wrote:
> > On RK3568, the SGMII interface can be routed to either GMAC0 or
> > GMAC1 via the GRF register pipe_sgmii_mac_sel.
> >
> > Add support for this selection by introducing
> > the "rockchip,sgmii-mac-sel" DT property.
> >
> > From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> > bit 1 (pipe_sgmii_mac_sel) is defined as:
> >
> >     0: SGMII routed to GMAC0
> >     1: SGMII routed to GMAC1
> >
> > The hardware reset value is 1 (GMAC1). If the property is set to 0,
> > the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
> > remains at GMAC1.
> >
> > This is necessary for boards such as the Ariaboard Photonicat, which
> > uses the SGMII interface connected to GMAC0.
> >
> > Out-of-range values are rejected by dtschema, so the driver does not
> > duplicate the range check.
>
> While looking thru the patches again I noticed this is changing generic
> PHY. Maybe you can send it separately to Vinod? I don't see a hard
> dependency? The code can "converge" during the merge window for the
> whole thing to work.

Hi Jakub,

Thanks for the suggestion. I looked at this again, and I think the
dependency is a bit more involved than it might seem.

The PHY patch (03/11) adds the driver support for
"rockchip,sgmii-mac-sel", which is documented by the PHY binding (02/11).
The DTS patch (10/11) then uses this property. If I send 03/11 separately
to Vinod and keep 10/11 in net-next, dtbs_check will flag the DTS property
as undocumented until the PHY binding lands in mainline. That would break
DTS validation for the net-next series.

Also, splitting into separate series means each has to queue and get
reviewed independently, which I'm worried might not all make the merge
window in time.

So unless you strongly prefer splitting, I'd rather keep the whole series
together in net-next. If that works, would it be possible to coordinate an
Ack from Vinod for the PHY part? Or if you still think it should go
separately, I can do that too, but I wanted to flag the dependency and
timing first.

Thanks,
Coia

