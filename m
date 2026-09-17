Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CBBC982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 01:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/oI6OE+gqvIMbXOYDHCCFZTXA+5DVoFDE03BakR8Jk=; b=G/PeCuFJor4+MgIMZ3mwZr7fg9
	LHd+YUEzU+90KVN+7+iD2fMoRQKnaFwty+0kmVgjn4YZktD2u44KO4AYOJO0irTlIvQ/4odTOGb6O
	ebQlhMiERvXEI5MxwLUTHj65/ib+dFLA7ElZZqigt4lIgso+7OJOmDx0+d974UxMKvEzD3PuG4L9S
	NYJeKycNjfD0gqB2f4boYKC9qpR0nuDYzqkQrE5fjjWnuG41vCnK+Ii6XbKYtoGSJ2DABGCzr9fy5
	mrccwExRJ313VmUrjE6wLSKyust6948GImHjLVwCNYxNMBixBYtDYmuDmt64VnQgl6W09D5nAXP5h
	vPepTznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x71CW-0000000AQql-46Ku;
	Thu, 17 Sep 2026 01:46:12 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x71CT-0000000AQq5-1sRX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 01:46:10 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-6713d20d375so322842d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 18:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789609567; cv=none;
        d=google.com; s=arc-20260327;
        b=MfI6j2zwFmhIg8+88nvRHK9CC33/A938xGY+xzZu+R6fISp3dD93oTp2TfqUWOt4to
         awhx7CUkVn+GArtqFJPH/u6YKZr+5HEQUNRzKuIHXSxlPtlydwTEciKH0J2gfInGBSTt
         dXGgXDDCm+3GBfE+ynbGMvG21rs0P3b5S5yZ+ciNDO6N62nQYyzRt3uo65MQjRp/ceYv
         sk+auA/2JnvlnlTfImz75GFBmlbgWDMGp0vLjtAt3WAxE+7PwhjYpA50YpYBoLGaDxt6
         ldkihSQXZj+3R6HezUuImWVDOL6R7f72R3N+xznUvWHi4amO6ihrekEZECRHywp3VLK8
         17Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+/oI6OE+gqvIMbXOYDHCCFZTXA+5DVoFDE03BakR8Jk=;
        fh=iqFozT01D6InVE/ROPKhmk/xwwNxhi1UcyDeGG1HiRA=;
        b=Puy/BeuubbL/u+p5ypHPuAd1JfQbF8jDK5gQHL0l+XHo5esR3Vw2uGKL51fn7HgvAV
         J28Q5ayifHHD4xaiW71G58aQDM/yue6ZxJf4iHQ0grIlc1cBqcUzk2tGYqiVAP2NXLyZ
         Se8+LNeoU7Mih6IqYSCf4XfCRnu9LMHh/xgEvO/Qs6XUzvEgfErqZL2qwSsUgDSc9B50
         Y2X6nPkQ5zwMrQAwoMGXC4ecipFOkWuoica0hR8mSINRagZBnXK1hEc1P2nKtGYNimRH
         /6xmEAP1cpxiPs5OjMcF5mZPblHcl43mKnwDcDHPfOrE7Qpc+G4r05L5Eal/NIRpg9WY
         LBCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789609567; x=1790214367; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+/oI6OE+gqvIMbXOYDHCCFZTXA+5DVoFDE03BakR8Jk=;
        b=DOLUd52/Ft3nuTHSS2KYcqpNCj2qSO7PJzDDgopC2tRwX8qrjaJopIgXyv0iIrSc0V
         FVhJZFfHPJle9DUPyrsdHvuC7ofqJfduWPEDrM+N8Mnc387kiGAvjZXHX3OOvfJWVLUq
         FXVAF7tnmDItZ4Twg2UYjjC3Lox01rzAEyxacb3mBaTW3JU6iznr8rLVYWEKPDinWXJM
         1NphXAEEz53Na0RNgY2eJunLrARFWw30KoYkjWJlobI8NFahhmZYCPb3z5DgaqrsDRZ4
         Pnc0eYsYzBkQ3r4zArECC7OPcFDpvIn2ZcZYepEbW6iPgIKd30IMnh/YVjCQRCNcISuY
         iZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789609567; x=1790214367;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/oI6OE+gqvIMbXOYDHCCFZTXA+5DVoFDE03BakR8Jk=;
        b=EgivpHyY5hzdGrsWrHe/TC3lIpnnV5pXcKx61HZcYJJ1YB1YY/gO4wxqFWMveYVKPz
         NbEcjHoJPJhQX9oa/ubNJ90pbBb3YuZuNxnPh0wNCvYHQMkTunOSobR6tl4lm8GmzIVl
         k8sUm5ZdzchmnAnpBXZFaRpqY0E0Z2Gfx7901bRtvDxBCXWB4K/vL7w7YeDFWndaQ9Zd
         VMXrgzkbjHYyReco8qabfwmBHyZQULEc0/2zEVafZr4PoiKGT3PFFx30Go1w/sy3w06C
         yNriTMBxHGmOhQLxrxL2JXx8qz0LUbUxREQekVqe3rqpEhXOlC/GlYrWyrIX41cqUO/8
         BV2w==
X-Forwarded-Encrypted: i=1; AKwUvBznUySZ9+8squdnVt+Xt8JT5UtsFYipMGGDvcv/tY/cDLHx3dahvyd2AVh8Zk8J/vhTj5/uc8UJo2H4t132Jx5V@lists.infradead.org
X-Gm-Message-State: AFuF++luWfQd6NtIpojqYrJgfKNW9f0ipq4UmRPWCBkFjWgNC1VNjbpq
	6OcLlziEmWdExx3KsX0Mi2HJEkXvXAm47UE/zRiNB1/LPn1+y+5MbtTj6wGykyfA6+jSDFO8D24
	UvpXfIRdkpfWowPzWBpedHqu5zeBw04Y=
X-Gm-Gg: AYBFou1/Mdr87Wg9D0NDb7ww6eIVnQ3cMRvbuyU71JbhUwPlkwyTla5OE2z7FXNNMx0
	kpJHCG5TnDbok2ed3/TPF6OwulNLhnJ67PqfmKShHipfhEpAPfBI9N+7946YYurp3v0RtaDGlR2
	SMBN5sozVEau+iOg8uLf5/33wFJ9lrAL7uZ85irtxfLc0RJC1AB0/mG9Bpq8CDcBniPVGmNRzv4
	Q2seuhWEDTiFbUjva1UJoxZte3M1QFO7+0cvUr7LacD7PsPLLW9pXzFzVCG9KLqQWEt3E9juoHR
	zXicVLKJ9jz5kJAXvDBu5VElSOIy7Xhnxw6VhSJn71CEplKehxTzemJPZ8J3B8GTFct68efu75D
	omTyRUdYfXRSSNA==
X-Received: by 2002:a05:690e:1448:b0:671:3b67:8a7a with SMTP id
 956f58d0204a3-6716f1503b4mr822727d50.42.1789609567316; Wed, 16 Sep 2026
 18:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260915013110.4780-1-prasanth.padarthi10@gmail.com> <20260915013110.4780-3-prasanth.padarthi10@gmail.com>
 <178954999459.14468.3220034594197550391.b4-review@b4>
In-Reply-To: <178954999459.14468.3220034594197550391.b4-review@b4>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Thu, 17 Sep 2026 07:15:56 +0530
X-Gm-Features: AcwNN1UdrXBNsGeffpdFdIkqCffMMWj64Hnt-znjfLcodjJc9sYsCQEWLc2Z4pg
Message-ID: <CAMFFDGircqrsDSOCPo+nzcpXoNi2Yu93BBQ+dkXw5rC4dWRjtQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Tan Siewert <tan.siewert@9elements.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_184609_508225_E1FD2E70 
X-CRM114-Status: GOOD (  24.95  )
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

Hi Tan,

Thanks for pointing this out. I had identified P3 from runtime GPIO
observations while exercising host power control, but after checking
the AST2600 pinctrl definitions I see that P0-P5 provide the
THRUIN/THRUOUT functions, so that observation alone was not sufficient
to establish the board-level signal mapping. I'll update this in the
next revision based on your schematic information.

Thanks,
Prasanth

On Wed, Sep 16, 2026 at 2:43=E2=80=AFPM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> > Add the device tree for the ASRock Rack B650D4U BMC, which is
> > based on the ASPEED AST2600 SoC.
> >
> > Describe the BMC memory, SPI NOR flash layout, UART console,
> > GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
> > connected to an RTL8211F Ethernet PHY.
> >
> > Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.
> >
> > Configure MAC0 to use the RTL8211F in RGMII-ID mode.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> dt-check-style --mode strict reports issues:
>
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:8: [property-o=
rder] property 'compatible' out of canonical order (should sort before 'mod=
el')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:26: [property-=
order] property 'ranges' out of canonical order (should sort before '#size-=
cells')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:30: [property-=
order] property 'alignment' out of canonical order (should sort before 'siz=
e')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:31: [property-=
order] property 'compatible' out of canonical order (should sort before 'al=
ignment')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:39: [property-=
order] property 'memory-region' out of canonical order (should sort before =
'status')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:70: [property-=
order] property 'spi-max-frequency' out of canonical order (should sort bef=
ore 'm25p,fast-read')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:72: [required-=
blank-lines] "status" must be preceded by a blank line
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:80: [property-=
order] property 'phy-mode' out of canonical order (should sort before 'stat=
us')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:81: [property-=
order] property 'phy-handle' out of canonical order (should sort before 'ph=
y-mode')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:83: [property-=
order] property 'pinctrl-0' out of canonical order (should sort before 'pin=
ctrl-names')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:85: [property-=
order] property 'nvmem-cells' out of canonical order (should sort before 'p=
inctrl-0')
>
> >
> > diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspe=
ed/Makefile
> > index 6b68671f9379..b109491d5c8f 100644
> > --- a/arch/arm/boot/dts/aspeed/Makefile
> > +++ b/arch/arm/boot/dts/aspeed/Makefile
> > @@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >       aspeed-bmc-ampere-mtmitchell.dtb \
> >       aspeed-bmc-arm-stardragon4800-rep2.dtb \
> >       aspeed-bmc-asrock-altrad8.dtb \
> > +     aspeed-bmc-asrock-b650d4u.dtb \
> >       aspeed-bmc-asrock-e3c246d4i.dtb \
> >       aspeed-bmc-asrock-e3c256d4i.dtb \
> >       aspeed-bmc-asrock-paul-ipmi-card.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > new file mode 100644
> > index 000000000000..6585bda56a4c
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > @@ -0,0 +1,120 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/dts-v1/;
> > +
> > +#include "aspeed-g6.dtsi"
> > +
> > +/ {
> > +     model =3D "ASRock Rack B650D4U BMC";
> > +     compatible =3D "asrock,b650d4u-bmc", "aspeed,ast2600";
> > +
> > +     aliases {
> > +             serial0 =3D &uart5;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     memory@80000000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x80000000 0x20000000>;
> > +     };
> > +
> > +     reserved-memory {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <1>;
> > +             ranges;
> > +
> > +             gfx_memory: framebuffer {
> > +                     size =3D <0x01000000>;
> > +                     alignment =3D <0x01000000>;
> > +                     compatible =3D "shared-dma-pool";
> > +                     reusable;
> > +             };
> > +     };
> > +};
> > +
> > +&gfx {
> > +     status =3D "okay";
> > +     memory-region =3D <&gfx_memory>;
> > +};
> > +
> > +&gpio0 {
> > +     gpio-line-names =3D
> > +             /* A0-A7 */     "","","","","","","","",
> > +             /* B0-B7 */     "","","","","","","","",
> > +             /* C0-C7 */     "","","","","","","","",
> > +             /* D0-D7 */     "","","","","","","","",
> > +             /* E0-E7 */     "","","","","","","","",
> > +             /* F0-F7 */     "","","","","","button-reset-n","","",
>
> How did you confirm this? According to the schematic it should be P0 (P0-=
P5
> have GPIO passthrough functionality).
>
> > +             /* G0-G7 */     "","","","","","","","",
> > +             /* H0-H7 */     "","","","","","","","",
> > +             /* I0-I7 */     "","","","","","","","",
> > +             /* J0-J7 */     "","","","","","","","",
> > +             /* K0-K7 */     "","","","","","","","",
> > +             /* L0-L7 */     "","","","","","","","",
> > +             /* M0-M7 */     "","","","","","","","",
> > +             /* N0-N7 */     "","","","","","","","",
> > +             /* O0-O7 */     "","","","","","","","",
> > +             /* P0-P3 */     "","","","control-power-n";
>
> Personally, I'm not a fan when `gpio-line-names` doesn't match with the a=
mount
> of defined `ngpios`, but that doesn't mean it's wrong. Maybe Andrew Jeffr=
ey has
> a different opinion on that.
>
> > +};
> > +
> > +&fmc {
> > +     status =3D "okay";
> > +
> > +     flash@0 {
> > +             compatible =3D "jedec,spi-nor";
> > +             reg =3D <0>;
> > +             label =3D "bmc";
> > +             m25p,fast-read;
> > +             spi-max-frequency =3D <50000000>;
> > +             spi-rx-bus-width =3D <4>;
> > +             status =3D "okay";
> > +
> > +#include "openbmc-flash-layout-64.dtsi"
> > +     };
> > +};
> > +
> > +&mac0 {
> > +     status =3D "okay";
> > +     phy-mode =3D "rgmii-id";
> > +     phy-handle =3D <&ethphy0>;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_rgmii1_default>;
> > +
> > +     nvmem-cells =3D <&eth0_macaddress>;
> > +     nvmem-cell-names =3D "mac-address";
> > +};
> > +
> > +&mdio0 {
> > +     status =3D "okay";
> > +
> > +     ethphy0: ethernet-phy@0 {
> > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > +             reg =3D <0>;
> > +     };
> > +};
> > +
> > +&uart5 {
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c7 {
>
> Please sort your nodes, as per the device-tree style guideline [0].
>
> [0] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>
> Tan
>
> --
> Tan Siewert <tan.siewert@9elements.com>

