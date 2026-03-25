Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D23AFEA83D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 09:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VP0SehC+D3+hhDWyfoKCodtXephnp1PrBhw2LiSs1TA=; b=HZeUYbPaoVuhHe+P2ej1cdALc8
	at7ANr4apN+pKKUEDeFE97GHkTH0S/hV4AWsuamJO+ceeEauvj6rX8nQuB9b7NDSoguhV39gIcMRy
	WxL1yhImpdfmUryIZ6KM6n0XRvFGnxTVRqF8kg6BFY64NDhSkNF5jd+Q1SPXiBgqG6oyeNPQvTVmV
	7FF+0hvVxO2dLJQ+7DRKs5IR6lD/Hmbsn7DUJFyg1BQZIXf3jGZ93HOCNZJbdVkmDG36rbOczfecy
	jNcEoAYUlKO4G3kchacRS3bKiV8IqD+gqWa/IYzNEzy55yfmZtuIE7Xapf0+OD53Wt4qkO+2XZceq
	3BuoytdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Kso-000000034uD-2bzu;
	Wed, 25 Mar 2026 09:50:38 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ksm-000000034tJ-2CNN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 09:50:37 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-669d7666d77so4877033a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 02:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774432234; cv=none;
        d=google.com; s=arc-20240605;
        b=Y1tHw26R3MFT3mfm9uMOXto0Dr1X1a1sSE/Mk4Awa9Ki+TEPXpnduj+E38776B0eYn
         +w2UENiTdVsk4GgPFpG4Qbe/AvlAY2btDzI5DssgmzjxqV/4e4IpzoYwK7FD4ZNJWnmp
         SaCeEoZXHzYZXRSO5rueRAWnnC8j7vc13qHYRyB76sA7y1r5wSuINOFSV/fbPiixQPlY
         K5b2xwQ25MY9F1HjUNWpYkBgJCtZry+XHgvVtWZOo8i72FVjOemr31aWXxq/AHJhVc6Z
         iTDZ6waxcW8nqpGVX7NXDCs+nDL1n0JeESdbSlvQzvzcSo7qdECZQKEE9poUs+GUVbb8
         3TNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VP0SehC+D3+hhDWyfoKCodtXephnp1PrBhw2LiSs1TA=;
        fh=B/yQTkd/C6GJC9RNmw7sg1zpY8CgGYPUesYQaWcINsA=;
        b=Qb6xNI2Y6J3ha8ixU1UqWSHmQoaMvjb9g4yM2KOjxCB83kVmFMgeW42y8aOggcsd8z
         HGGtLeTzDRf/tk+FvCtsblI5RU82BxWjbfQoMxnr4uu2nPQq/ThtbJBYU7gMuqdBEjPi
         98moD9rrr0rDMn2ZMjENXt23prrQaLGv196O4Y/+WLnx3PN8XDwedGHBtnKrQ7ywjTCc
         FIIAg5zENlRW/i1RfeCOZLSNzdngO87qVXJT62hbwpmE3qZovp60m7HA7x3vWwxGcEIK
         G8Kpqq5T3wy0LrEvBDLXXrl3nV3ViALmFu3ta3xtVufgod1QS/xJHLisRnlYZ+E8pAOP
         70XA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774432234; x=1775037034; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VP0SehC+D3+hhDWyfoKCodtXephnp1PrBhw2LiSs1TA=;
        b=aF43O3SR3XnB8asEilskmTQoA2zRXIiGoAnZmf320bkf58YfLGZ+KqtMLWgcp0AnRw
         IgnrOIPnL8AHPKxhroVgJRzfmxusipEXogGMwALCNkA1paAJJ7nQCwgspuwpXAYZ/maN
         ZI+fmhyezO21XlIB+TJZ4fJKjzFokZm6RoxZzDW3m3pci13IXK6BBurD3XZqOOB9MVem
         C5zB62JByNdHc+O7GAZOM+bH7AfyaU01Q/Tb0bkfMlQ6whdH/pzltdrMQeLKW35fi/su
         7AZ/KxqCWlLizL4aI+NuweuLyuqt/MPllstFwh/yyWKUitp/Go1rLLbqaLFie3AdRLzN
         NbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432234; x=1775037034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VP0SehC+D3+hhDWyfoKCodtXephnp1PrBhw2LiSs1TA=;
        b=hdmwE3IUA9A8GkaOLsh45pTRVk3hDwrjSwyfGUHsaZeeo1VzJcFJ+vucN/lvOlwe2E
         +lMsrhHxUAY12vT6ta20YwHWBQguFLT9oeMrf97O5XmivR0zI1eeYRQ74SA+2k2zt1BI
         9ibqxkuROgSq0VP7o2IEsO+YEDYZxzS4sTi1zTpREMDW3P0LtPlhbRCE6FG64EYDzZ9W
         w4vj/mH2GdCAC6lsy9cG/dETvGl+eTm5FgvCZBqMiyR8CCIDot34At4ETgrPfkU6DdZF
         Y/XWijTRMgJXrnUxU0ExWDIDu2PHIZG6XDew9WeMlJvMCKxV3No90uo9NoXyY/Dmj5gG
         e5LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg1vud5n/zWXVPjl1N/HzRTq09Fc6NBQuQV6yJLhImJ1+wQUm+h/T9zSJ90j7TapJcMgwC6KRmc1bm0VvSbcHE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/WKGqoXkk1LQVAebdq98/rfaysuoVgE1WTO/Z7ldRGLz22ARi
	fKKBi4UM6tav9nZ2s+0Hc2ItEK3l8tEc4TRQJUHmJ7gi3PHEHM+kvrmyVrAl55B4Aa9O8xskvSk
	fdOiE6WRk7f3yrvS+lFba2+SCck/jazc=
X-Gm-Gg: ATEYQzwkKvCq6VNu3l6XvDfddfs6YIrNwc1Ahw2P5/5HS+Rw1V1NohQ+HeQ+36qepWW
	OsWGZwVbqB6CYJ/s0G1fi5wrHQi9yxgw/eXqs235hu9HoYfInWGKNseSQMwwbvdnNaL+kJEPLe2
	zn3cAFieWrRKYpaJgXMh4TFyXyyibXddBUuhPypzkt6qrR8H8tICTWYHD6/r9ruKdAYNFy8w/1r
	hQgb5TbgZzHWISfOpwM0uHPfLoPkmqS/bNXZLbATolit9pRtPNNHYxAuulME1rgkwvsRHHgYUt9
	bwywCJzt
X-Received: by 2002:a17:907:72c7:b0:b96:f6f1:e7af with SMTP id
 a640c23a62f3a-b9b0ea7e884mr143299166b.9.1774432233910; Wed, 25 Mar 2026
 02:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260310091054.2029912-1-egbostina@gmail.com> <acKyJTkqq-bV_3jZ@lizhi-Precision-Tower-5810>
In-Reply-To: <acKyJTkqq-bV_3jZ@lizhi-Precision-Tower-5810>
From: Eddie <egbostina@gmail.com>
Date: Wed, 25 Mar 2026 11:50:22 +0200
X-Gm-Features: AQROBzD-kPMMH1jFoji7rnPnjGOGNLf_VyIguCX0e1QYp30ObYBIhsUdhFbiTf0
Message-ID: <CAEFOc61tNbF+cE0waQpfvuSe7enJkDk_yzcGXZ_-D1Kvj_5G-w@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64: dts: imx8mp-edm-g-wb: Use 0 for reserved bit
To: Frank Li <Frank.li@nxp.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_025036_578721_644E5147 
X-CRM114-Status: GOOD (  23.39  )
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

Hi Frank,

>> Change 0x41 to 0x40 to leave the reserved bit cleared, as
>> recommended by the reference manual.
>
> Any impact if set bit 0 to 1?
>


I have not tested this on hardware with the bit cleared, so
I cannot confirm functional impact for sure, but according to
section 8.2.4.238 of the iMX8MP reference manual, bit 0 of
SW_PAD_CTL_PAD_SAI1_RXD6 is reserved with a reset value of 0.
The only defined fields are PE (bit 8), HYS (bit 7),
PUE (bit 6), ODE (bit 5), FSEL (bit 4), and DSE (bits 2:1).

Both 0x41 and 0x40 should result in identical pad behavior.
Leaving it set probably risks undefined behavior in future
revisions of the silicon.


>> This also allows for
>> easier conversion to symbolic macros.
>
> Can you send this patch also?

Yes, I will send a followup patch soon.

Thanks for the review.

Eduard

=C3=8En mar., 24 mar. 2026 la 17:48, Frank Li <Frank.li@nxp.com> a scris:
>
> On Tue, Mar 10, 2026 at 09:10:53AM +0000, Eduard Bostina wrote:
>
> Remove RFC.
>
> > The i.MX8MP Reference Manual documents bit 0 of the
> > IOMUXC_SW_PAD_CTL_PAD registers as reserved. The hd3ss3220
> > IRQ pin (SAI1_RXD6/GPIO4_IO08) currently uses pad config
> > value 0x41 which sets this reserved bit.
> >
> > Change 0x41 to 0x40 to leave the reserved bit cleared, as
> > recommended by the reference manual.
>
> Any impact if set bit 0 to 1?
>
> > This also allows for
> > easier conversion to symbolic macros.
>
> Can you send this patch also?
>
> Frank
> >
> > Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts b/arch/a=
rm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
> > index 242fa930b..a78401d11 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
> > @@ -345,7 +345,7 @@ MX8MP_IOMUXC_SAI1_TXD5__GPIO4_IO17                0=
x16 /* DSI_VDDEN */
> >
> >       pinctrl_hd3ss3220_irq: hd3ss3220-irqgrp {
> >               fsl,pins =3D <
> > -                     MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08              0=
x41 /* GPIO_P253 */
> > +                     MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08              0=
x40 /* GPIO_P253 */
> >               >;
> >       };
> >
> > --
> > 2.43.0
> >

