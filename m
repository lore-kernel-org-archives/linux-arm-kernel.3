Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7379FC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 06:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+B9pQd9t0eZEYhD64ciNA4BU0alMXlOocEuezOHCIMY=; b=4W5PRvBi9NNglASDHiK16BqiRR
	XGHuPOiDx44aRBPikcvABHXJcacx6BJjSSD/nKHAMB4I1wElyzCuMbhGqvFPz2fzZz3OnMIyN80lA
	J5R/54NQ+T/60pnpDsibAnOI0jyMP/vkhBZnnRJkGJrMeUZ2jiyq1OnUOIO0h+7MPwzW6i3IUaxpX
	J3xmprjTTHlowXBy4IhWMdiJKakKsvCcEBOJLDdEOHXOZICR/+Kw8jQpTvDGH+yZHsrEROYu8xN0g
	0ZZDWXjqN+357o4ycMSiPXNF6GGez1aARL8s7obPgoSsxX09MCHCzvkCG1WrBkbGhqixlK/LnYsJC
	pK5R/RfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxIk7-0000000CcEw-2VtP;
	Fri, 21 Aug 2026 06:28:43 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxIk4-0000000CcDj-49C6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 06:28:42 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so1026156e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 23:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787293718; cv=none;
        d=google.com; s=arc-20260327;
        b=Rv0HA3FuhYsCci1mhFXjSoH/Uyho/UsRNkjJPh88BfSt8afvyVezYlJSubGh6tPPTW
         d9xkpL4E2iwvc/l64QE8/XNzRGmaQwB8VeDtYL14vBvDf52q9TuG/AUnCjH6yo5l3QNz
         vS9YnZjYHKV3IpbJEUnDjUQeEQU9mHnCh5kg8VNS7v9Phg2Dp7AeiQB4kd6cDGgYoIeu
         js1urlgSTZOeK4OA+ZysfUaQnkktrMiU5/+HOc0pnSKeKtKA7+G+ckQW76K/ZLM8vNRv
         gfa0MOQQtuU7eiaV0brFEDxovt/q8ATbYZScgjxUEDIs+cpx0/sBL3CELH6rqyC96RsE
         3d7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+B9pQd9t0eZEYhD64ciNA4BU0alMXlOocEuezOHCIMY=;
        fh=bxEDgkgVQeObYKuXSFfeZX07rE8YxgiQ9anXmfZKkOg=;
        b=oy6AZT6Kf07MpJFVsHFp4nRL5IuTgtTPW244wShGSqTMOf5Z4EkwgM+J51tiQCwaxV
         HO13TvGKXWB1KkjqJdh/mIMx/bnK4FdBoIw8MNquiWJvV5dLJAgY3ecN+gdr2l8HFf3q
         8Q2PAy5dYshtkyP7Z5TBjppkrzVAlEJAFdyLrxVtLwKE4H+8rDqMSY6LF+StYT4uQkIp
         sPn7qO2H1gH28peoRjQ0q66i2buWmSM+x39dGHPJNY4XURXA/De4yrPLxsqCwnq++TrH
         Gwi5oNTuvlzypq+jqcn2IC0EsQiLoM0E/DeyARukiTQyepmWWJm0DT/EU3H3RA80Ouwb
         QCdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787293718; x=1787898518; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+B9pQd9t0eZEYhD64ciNA4BU0alMXlOocEuezOHCIMY=;
        b=sCcNg+WglbPEtjzjYd9hU4TembZzII5oM+y8qz3jX7jQoAR/EdCT2wM34qflqO8MS3
         GhcMmw49w1KvzGv1smqe5x/rrl9cAq1yEl+RSAUvZ6SCRUVai1Nr/jOzvdwSAaL0xigI
         1d4JFCAQdRs3mtZ1ztoaxGZ5TB4iDu8gX9ejm6SrTiyzRq+NXgLwRKeaQApZuXhbIpYW
         ljgcYNhYkZEdmnRZYaACoNUO/tm/umEg9CrypWzjwe53GvafKsiPmrHcR1Di8nCiL/eD
         nrbHLzPDJOyiyrMNWzfSBJndUY2Y+LQ/jvdMEJx+yykDN0Ujv97QMKQtsA0Cu+Ok989r
         Oveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787293718; x=1787898518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+B9pQd9t0eZEYhD64ciNA4BU0alMXlOocEuezOHCIMY=;
        b=n5tSwW9on2M17LedBEIe5CWCwNQ6LFucaPMk9u3MUrd7sVVFS0HJUQBWRtwZrWxlMd
         ZQwyyDqGcIXiMIk37sJ6nSUg/gVvaidTYDknEga8v01XK8wAWZ0rXFsn1YPNasU544Re
         0Qq/+JgoNT2+1qiId7PcUNJ71I5+OVWBqRAoKDKT7eSQ/yF9/q0moXvIziXvFNvnTbBE
         c1fbfE9hRyUN88et7vdRfDKhss/7K1V+G8cyAMrc09mOIKTAeOIkhwoUZmWebRXlIu63
         7EEPneI8cQORt3JoQvNrEC7uVLSt86QJuD+yv3ci/1eeWgxTwoYfFSPqUCrRsuj4xgRh
         CmQA==
X-Forwarded-Encrypted: i=1; AHgh+RqQ9FQW4XEPDmR1SdfPYw13uyA6bpIEHCjI7jck1Pklhw/40GrLxHWtzlbyb1AfGVpQcI+WqEbyj1q9e/AGw76J@lists.infradead.org
X-Gm-Message-State: AFuF++kqtYIKhCzLYaBIBa3y6hzvp258UQXV4XT9UnLFXq6r9w6swdVU
	vFBxVT9RfRVzQM5U8fwFdCdEG9pl/AgdHdzD0pp75Bt3ns9UVAm3yrWbDCvX4rXbJ6rJ1dppWlJ
	qxbhR+sSRVH2zQTOU5v/jnGo/y6V5Vi4=
X-Gm-Gg: AR+sD12KwLcolWPY4RIVpHLe9bHbkG1Wi2Uv5QMmrMsSvkV9I1FPFoNK6kK8ZefhwRN
	oDSRf1ooT+U4nlLM42PVd1INjin5k5684Iifxge3nwSWAhz1+h3XwA4zPSssUZWMTrunXIH3Y0f
	f8lRwFPSt9AfrSgN7obALtMNoQPnzcsCmM99V3Zl/obqODMKJiZqzEpR0M+73MKgonSTQ7SLi6T
	w7UzcpyXmZa6N0znRP3bfxUXBAfa7th03ROUPPHPpKzb3MNn/swqmKX4Eu368/WE4Fvy7I2+gPJ
	RQETH5q0f0D4E+IZY0RA3m3uYgUHN0jnRE0GxEWioSEa0Q==
X-Received: by 2002:a05:6512:3da0:b0:5ae:bcc4:c071 with SMTP id
 2adb3069b0e04-5b484090f50mr1322562e87.0.1787293717922; Thu, 20 Aug 2026
 23:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-ventura2_initial_dts-v9-0-504c0ec68039@gmail.com>
 <20260727-ventura2_initial_dts-v9-2-504c0ec68039@gmail.com> <178724902712.20555.7009712214570349708.b4-review@b4>
In-Reply-To: <178724902712.20555.7009712214570349708.b4-review@b4>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 21 Aug 2026 14:31:41 +0800
X-Gm-Features: AcwNN1VHyDF2m_8gVrWdQPyCUbVvLps1cRKmYDiyS5eZ7IMCo5hpISGq-5CfFl0
Message-ID: <CAF7HswN1ZzwjfXjG2hV5tEkVZkZYp0CiVNSo_9A4m3tsqQp_Bg@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Tan Siewert <tan.siewert@9elements.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_232841_114063_874B932C 
X-CRM114-Status: GOOD (  38.42  )
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

Thanks for the review.

On Fri, Aug 21, 2026 at 2:04=E2=80=AFAM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> Hi Kyle,
>
> > Ventura2 is a Rack Management Controller. It is a modular
> > device designed to manage liquid cooling systems and monitor hardware
> > states within an IT rack. The system uses an AST2600 BMC for management=
.
> >
> > RMCv2 serves several critical roles:
> > - Detects liquid leakage at both tray and rack levels.
> > - Communicates with and controls liquid cooling equipment.
> > - Manages leakage events and executes system recovery protocols.
> >
> > Key hardware features include:
> > - An extensive I2C and IO expander topology to support comprehensive
> >   sensor monitoring and backward compatibility with legacy trays.
> > - MCTP over I2C support for asynchronous device communications.
> > - A dual-flash design for BMC firmware redundancy.
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
>
> *snip*
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts =
b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > new file mode 100644
> > index 000000000000..f1273ca31bf8
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > @@ -0,0 +1,3005 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2023 Facebook Inc.
> > +/dts-v1/;
> > +
> > +#include "aspeed-g6.dtsi"
> > +#include <dt-bindings/i2c/i2c.h>
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +
> > +/ {
> > +     compatible =3D "facebook,ventura2-rmc", "aspeed,ast2600";
> > +     model =3D "Facebook Ventura2 RMC";
> > +
> > +     aliases {
> > +             /*
> > +             * Pre-allocate I2C bus aliases for userspace predictabili=
ty.
> > +             * Several I2C channels are intentionally left empty in th=
is
> > +             * DTS as they are strictly reserved for future hardware
> > +             * feature expansions and add-on boards that will interfac=
e
> > +             * with these busses.
> > +             */
> > +             /*
> > +             * i2c switch 0-0077, pca9548, 8 child channels assigned
> > +             * with bus number 16-23.
> > +             */
>
> This alignment is one of the things that seem to be a false-positive for
> dt-check-style in strict mode (value-whitespace). See [0] where Krzysztof=
 said
> that it may report false-positives, and "Review and investigate warnings =
from
> 'strict' mode, but do not fix them automatically without thinking".
>
> @Krzysztof wdyt about this one?

You're right, and this is a regression I introduced in v9. In v8 these comm=
ent
blocks used the standard kernel style. While running dt-check-style, I appl=
ied
the strict-mode output too mechanically and dropped the space before '*' in=
 all
38 comment blocks in the file. I will restore to the standard style in v10.

>
> > +             i2c16 =3D &i2c0mux0ch0;
> > +             i2c17 =3D &i2c0mux0ch1;
> > +             i2c18 =3D &i2c0mux0ch2;
> > +             i2c19 =3D &i2c0mux0ch3;
> > +             i2c20 =3D &i2c0mux0ch4;
> > +             i2c21 =3D &i2c0mux0ch5;
> > +             i2c22 =3D &i2c0mux0ch6;
> > +             i2c23 =3D &i2c0mux0ch7;
>
> *snip*
>
> > +     spi {
> > +             compatible =3D "spi-gpio";
> > +             #address-cells =3D <1>;
> > +             cs-gpios =3D <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> > +             miso-gpios =3D <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH=
>;
> > +             mosi-gpios =3D <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH=
>;
> > +             num-chipselects =3D <1>;
> > +             sck-gpios =3D <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>=
;
> > +             #size-cells =3D <0>;
>
> Shouldn't #address-cells and #size-cells be ordered together? If reported=
 by
> dt-check-style as issue, then it might be a false-positive.

I will put the two properties back together in v10. Like the comment
alignment above, I'll list this as a strict-mode warning I'm not acting on.

>
> > +
> > +             tpm@0 {
> > +                     compatible =3D "infineon,slb9670", "tcg,tpm_tis-s=
pi";
> > +                     reg =3D <0>;
> > +                     spi-max-frequency =3D <33000000>;
> > +             };
> > +     };
> > +};
> > +
> > +&adc0 {
> > +     pinctrl-0 =3D
> > +             <&pinctrl_adc0_default &pinctrl_adc1_default
> > +             &pinctrl_adc2_default &pinctrl_adc3_default
> > +             &pinctrl_adc4_default &pinctrl_adc5_default
> > +             &pinctrl_adc6_default &pinctrl_adc7_default>;
> > +     pinctrl-names =3D "default";
> > +     vref-supply =3D <&p1v8_bmc_aux>;
> > +
> > +     status =3D "okay";
> > +};
> > +
> > +&adc1 {
> > +     pinctrl-0 =3D <&pinctrl_adc8_default &pinctrl_adc10_default>;
> > +     pinctrl-names =3D "default";
> > +     vref-supply =3D <&p2v5_bmc_aux>;
> > +
> > +     status =3D "okay";
> > +};
> > +
> > +&ehci0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&ehci1 {
> > +     status =3D "okay";
> > +};
> > +
> > +&fmc {
> > +     status =3D "okay";
> > +
> > +     flash@0 {
> > +             label =3D "bmc";
> > +             spi-max-frequency =3D <50000000>;
> > +             m25p,fast-read;
> > +
> > +             status =3D "okay";
> > +             #include "openbmc-flash-layout-128.dtsi"
> > +     };
> > +
> > +     flash@1 {
> > +             label =3D "alt-bmc";
> > +             spi-max-frequency =3D <50000000>;
> > +             m25p,fast-read;
> > +
> > +             status =3D "okay";
>
> Missing '#include "openbmc-flash-layout-128-alt.dtsi"'?

I will add it in v10.

>
> > +     };
> > +};
>
> *snip*
>
> > +&mac2 {
> > +     phy-mode =3D "rmii";
> > +     pinctrl-0 =3D <&pinctrl_rmii3_default>;
> > +     pinctrl-names =3D "default";
> > +
> > +     status =3D "okay";
> > +
> > +     /*
> > +     * The Marvell 88E6393X is initialized at boot via EEPROM
> > +     * configuration and hardware straps.
> > +     * The BMC connects via an RMII fixed-link; link parameters are fi=
xed
> > +     * by board design.
> > +     */
>
> This kind of writing gives me the suspicion that it was written with assi=
stance
> by an LLM, but I might be wrong.
>
> Either way, if you have used AI assistance for your series (or only for t=
his
> patch), even if you have only used it for the commit message, then you mu=
st
> declare it via the "Assisted-by" trailer [1][2].

You're right; I used an AI assistant to write this comment. I'll add the
Assisted-by trailer in v10.

>
> > +     fixed-link {
> > +             full-duplex;
> > +             speed =3D <100>;
> > +     };
> > +};
> > +
> > +&mac3 {
> > +     pinctrl-0 =3D <&pinctrl_rmii4_default>;
> > +     pinctrl-names =3D "default";
> > +     use-ncsi;
> > +
> > +     status =3D "okay";
> > +};
> > +
> > +&peci0 {
> > +     status =3D "okay";
> > +};
>
> You mentioned that this is a rack management controller. Does it really r=
equire
> PECI?

It does. Ventura2 can be populated with a COM Express module, and &peci0,
&kcs3 and &lpc_ctrl describe that path, so I'd like to keep them. I will ad=
d
a comment in v10 explaining this, so it's clear from the DTS itself.

For the record, the v5 changelog claimed &peci0 had been removed. That was
incorrect; the node was never actually dropped. Apologies for the confusion
that may have caused when reading through the series.
>
> > +
> > +&sgpiom0 {
> > +     bus-frequency =3D <100000>;
> > +     gpio-line-names =3D
> > +     /*"input pin","output pin"*/
> > +     /*A0 - A7*/
> > +             "power-chassis-good","FM_PLD_HEARTBEAT_LVC3_R",
> > +             "host0-ready","R_BMC_PTH_RST_BTN_L",
> > +             "CONTROL_VT2_SUPPLY1_CLOSE","FM_MDIO_SW_SEL_PLD",
> > +             "CONTROL_VT2_SUPPLY2_CLOSE","FM_88E6393X_BIN_UPDATE_EN_N"=
,
> > +             "CONTROL_VT2_SUPPLY3_CLOSE","Sequence_TransFR_Alert",
>
> Why's "Sequence_TransFR_Alert" written in camelcase?

An oversight; it should be consistent with the surrounding names. I
will renamed to
"SEQUENCE_TRANSFR_ALERT" in v10.

Thanks again for the thorough review.

Kyle Hsieh

