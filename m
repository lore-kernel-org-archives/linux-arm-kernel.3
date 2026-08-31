Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61212C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 12:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLqTvy52sKSUUsDTZl72qNN+V6zjfC7RltS1uqqFZgU=; b=G383XCphwM8VCdBqRpteFUzHyu
	5dnxluicpc+jE4f/rDr9RW37bvPmGJyiBaolNdhKmSnwio+BGryFps5+3GWVxJGOiVY2+ZFIw85EK
	0vkSZSHPBQE9gd6m7+FhTv0OL2lEKyKrsWEgtqt55514sh8Hirvcc/s1/wyrtLCb299BvM8JLHxQq
	h+706udAT2OeLRuYZ8NGM4TBNBUwlJaeGWoGiQ+J8rauE+6Yw0qUXn+XecO0qqi2Jw+4VZ0s8QjzO
	M95i119SoQhPjOX7Sc3rFaQowblX688GbrXHhUjbWVhhE//k8LJFn2wt9Mlca05QsMKTSagn5yHuD
	4xyNMsAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11Pz-00000009KUo-3bHX;
	Mon, 31 Aug 2026 12:47:19 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11Px-00000009KUE-28d8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 12:47:18 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c247f6687dcso562212266b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 05:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788180435; cv=none;
        d=google.com; s=arc-20260327;
        b=kqhip3lf+lXY9eH/OizlXk7ygQMyj8TLKOrLIMS3/RpzFn30uocU9KWKzX68vIdeWD
         B2CVJ4UQxZMXv31BW1RM+gKF22hDH/qe9TXKby5yselD0MFdWcXpDs1H0RiYGds24nWZ
         yar0wQCKosx4CGZE6ofWYbyUPvKE6Qd28ntepK1yVbm5l2byxYN/kb3BV9WvQz91pUjr
         M6NHkZQNGjVS4uNPIlTPCjJfAGgA6Z7E6lG18Y4AEqmsVVVBZpBmqYTRr73PymfaFe+L
         ozJ5T9ydfvyoHcq0Ypxpd6uwITVWTYbpfBv3XZ+D0/T5dji1WUPE+mwAW6j9UMl0tHqf
         8bUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zLqTvy52sKSUUsDTZl72qNN+V6zjfC7RltS1uqqFZgU=;
        fh=KgLTeDMv8++SNXYIb6rRsNKVVkCnJye+L9GUIprrM9s=;
        b=cOjiHV0vAnuHJg/18P0AFYnV+51kcL3i1dD2CJWpLQa+gqjJcF/kIr0i/KJl9VvCfA
         Nuf/keEseqIsSvbeIdOfurdDeUSNcjtxFi7clQMMFpg4GuiBTv+/qO6N4dGmR612wtd9
         QCZnvx+9hFhFAa/Z+ZVJeUbVqVBk+/hwZsFtDecE5FBmFP1TgnrJZdt7kLgj7QljDsK1
         hgdYrAeRaOUkhIgDXCmMNSvDnQEZMaG1BHDh1kV1vQ41zNVD0Ac9THMCC3g8ZIBoB1YY
         YDoXP8YiiB157coRm2cJyHT2Y0zH7jKMObLlrs7cr+1eb0PWufYoBBZ5UOYjCeNW9a0v
         mq6Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180435; x=1788785235; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zLqTvy52sKSUUsDTZl72qNN+V6zjfC7RltS1uqqFZgU=;
        b=IN0rgaH917D00GPhrg5e5mWayvjTGj3C+EQMJcVnmtUjixNLZT12+RCqp18RgtzM3k
         9qB6fWMJm2KYM2KITYW8s0wLXyb0qP7SaXCozcXyU6yHmtlOjiFcWJUpNEkf6j1nnt9f
         mzXRl21G0XmuITeJp5HYeDE2tG565brQ8fIrH2qcJ9OZpgXzbkfgrWRrnmojHyY6nDc6
         1po4Dmzu3PNBtCR3a6Y9q9aIL4/cY0QYa6q2YLLMic2FTAxxMJtHa/Ef76R6tWz8/pu9
         y9BJbdGsDqZt4CiAz94LzKNu28o3zCzjjhuUZZgQu1Zyamegh7hEZDxGFneDaucQ86wV
         oVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180435; x=1788785235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLqTvy52sKSUUsDTZl72qNN+V6zjfC7RltS1uqqFZgU=;
        b=lSykV1bjz7xGA+/tvSzhe2zaCUCOTZPgOdgD4/0AlegZCOcu85+xVbEcfzPDzXXPsu
         El7m+2MKp7MpEDAQ2VCZkBbaNjmFBmEVVHKrNUy1Zl0AdL5KRLabVZ7/Txw8xJZr0JCF
         lZ+5dVp1IWqguD/3aq4SRqncLlih+0b/jKT08D+Kx2SSDyDrt6Mo3Zlx+cnfcjET08dY
         BASirohkyMB+CCXtBkkIABFsQuHZbsqdMxStiZh16/05c8en4bDT4HhEkK1fFFBB0SIq
         YbmsGLDvtOrvRepObvx/Cpi1ZF+7AIwCnLqyTJ9Dq1jKINAPJZKAABPMsHSoYZDi6Oxk
         S4RA==
X-Forwarded-Encrypted: i=1; AHgh+RraG1+zfE1ZNA0R2FTcPR+VjgjlfaEGgCpw4TK7Re1ffSpf/ZmAa/ERn57QwciU47uYNISy3uvdSxBqlQndxFUz@lists.infradead.org
X-Gm-Message-State: AFuF++mxSRcf2Y/eZuw+hkV8QQ1Qu+CRzi+SKSdWqpeyUWsNVyk3LcOS
	1aiY3MeS7KEWJGFJ4zInrUw5QmlbLMjVRnU9klc5jwhnZYG+mH/nFSd7kPNf6ZeXAsXUfafWaWM
	IqlS+cuvpeRXpeuJ6qqDA7hlBhuFtBWyoMVfHvMc=
X-Gm-Gg: AR+sD10QqFFzmNOW/C2+EZow5Y/wEA3blzqO3fcqU5oJA56bz6lfc+A2wjoKJCD29C8
	5qbd8O0oodxfAiIhzdD2/xoypmuAR6rntECCpSWqnvrvEPvmIzuTr+Gndr3F9C+b2GtnFKsvC1c
	soUAw+z7w1OWTH14HRBCrOTiiYLZa7HtOLDeU5tEnGHEpjKVC7KXeUwWXh3Igcyt3sfYc0CLNR/
	H3ey4scUTItFzYIVb+GY0Si5rFhXEh4aTPi5xHhyjBzykyEsgkNJ2EmBGKtkXgRpots/Ysg/SJk
	K1sdSOLHRy2eHk9wVaT7HEFEEfNa3LjRChesHnJuq8Oi7A==
X-Received: by 2002:a17:906:6444:b0:c16:101d:7afa with SMTP id
 a640c23a62f3a-c25b3cde78emr15785266b.16.1788180435211; Mon, 31 Aug 2026
 05:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260830182036.284736-3-prasanth.padarthi10@gmail.com> <178817979463.20922.10263529532171804189.b4-review@b4>
In-Reply-To: <178817979463.20922.10263529532171804189.b4-review@b4>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 31 Aug 2026 18:17:02 +0530
X-Gm-Features: AcwNN1XIrIC7I6xOS5BaNQ3PLnAnWSJKPgHogQbkIGatLAVm1UY68sNUIGJAplc
Message-ID: <CAMFFDGi5eb_+ec5hGz6nE7OXpqYTMg7oZSPAzttXDPZJZw8v2Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Tan Siewert <tan.siewert@9elements.com>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_054717_595925_3AF7BD06 
X-CRM114-Status: GOOD (  34.60  )
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

Thanks, this is very helpful, especially since you have tested the same boa=
rd.

I will rework the next revision to use the existing ASRock Rack DTS
patterns, including the I2C7 EEPROM/NVMEM MAC address handling and the
standard 64 MiB OpenBMC flash layout. I will also investigate the
GPIOs and video memory reservation you mentioned.

For MAC0, I will change the PHY mode to rgmii-id and remove the claim
that the board requires RX-only PHY delay. I will also investigate the
ASPEED SoC-specific MAC delay configuration and the difference between
upstream U-Boot and openbmc/u-boot before sending the next revision.

Thanks,
Prasanth

On Mon, Aug 31, 2026 at 6:07=E2=80=AFPM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> Hi Prasanth,
>
> On 8/30/26 8:20 PM, Prasanth Kumar Padarthi wrote:
> > Add the device tree for the ASRock Rack B650D4U BMC, which is
> > based on the ASPEED AST2600 SoC.
> >
> > Describe the BMC memory, SPI NOR flash layout, UART console, and
> > MAC0 connected to an RTL8211F Ethernet PHY.
>
> Why no GPIOs? Why no I2C buses? You'd need at least i2c7 with an at24c128=
 to
> populate the MAC address on MAC0.
>
> >
> > The MAC0 RGMII RX delay configuration was validated on hardware.
> > The RTL8211F requires its internal RX delay for reliable operation,
> > while an additional TX delay is not required.
>
> No, it does not. The traces have the same length and don't require specia=
l
> delays. If you use u-boot/next, then it might be true because it still mi=
sses
> the correct SoC-specific delays. This is, however, fixed in openbmc/u-boo=
t.
>
> I know that this is not optimal. I'm already working on getting this fixe=
d in
> upstream U-Boot too.
>
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
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
> > index 000000000000..aa623f0ca36c
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > @@ -0,0 +1,95 @@
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
>
> Where's the reservation for video?
>
> > +};
> > +
> > +&fmc {
> > +     status =3D "okay";
> > +
> > +     flash@0 {
> > +             compatible =3D "jedec,spi-nor";
> > +             reg =3D <0>;
>
> That's already defined in aspeed-g6.dtsi
>
> > +             label =3D "bmc";
> > +             m25p,fast-read;
> > +             spi-max-frequency =3D <50000000>;
> > +             spi-rx-bus-width =3D <4>;
> > +             status =3D "okay";
> > +
> > +             partitions {
> > +                     compatible =3D "fixed-partitions";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +
> > +                     u-boot@0 {
> > +                             reg =3D <0x00000000 0x000e0000>;
> > +                             label =3D "u-boot";
> > +                             read-only;
> > +                     };
> > +
> > +                     u-boot-env@e0000 {
> > +                             reg =3D <0x000e0000 0x00020000>;
> > +                             label =3D "u-boot-env";
> > +                     };
> > +
> > +                     kernel@200000 {
> > +                             reg =3D <0x00200000 0x00800000>;
> > +                             label =3D "kernel";
> > +                     };
> > +
> > +                     rofs@a00000 {
> > +                             reg =3D <0x00a00000 0x02000000>;
> > +                             label =3D "rofs";
> > +                             read-only;
> > +                     };
> > +
> > +                     rwfs@2a00000 {
> > +                             reg =3D <0x02a00000 0x01600000>;
> > +                             label =3D "rwfs";
> > +                     };
>
> No. Include the partitions via `#include openbmc-flash-layout-64.dtsi`.
>
> > +             };
> > +     };
> > +};
> > +
> > +&mac0 {
> > +     status =3D "okay";
> > +
> > +     /*
> > +      * The RTL8211F provides the required RGMII RX delay. No addition=
al
> > +      * TX delay is required for this board.
> > +      */
>
> No? I do have this board myself with a custom BMC ROM and I can tell you =
that
> you don't have to set delays other than the described SoC-specific delays=
, but
> this is, as mentioned, already done in the BSP. (And no, I haven't upstre=
amed
> my DTS yet bc I haven't had the time to do it.)
>
> > +     phy-mode =3D "rgmii-rxid";
>
> `rgmii-id`
>
> > +     phy-handle =3D <&ethphy0>;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_rgmii1_default>;
>
> No nvmem cell to set the MAC address? i2c7@57 offset 0x3f80? Please see t=
he
> other device-trees for ASRock Rack mainboards.
>
> For me, it is a:
>
> NACKed-by: Tan Siewert <tan.siewert@9elements.com>
>
> Tan
>
> --
> Tan Siewert <tan.siewert@9elements.com>

