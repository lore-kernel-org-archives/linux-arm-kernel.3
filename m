Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB629C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMpJXM9fHbDA78kVCJHA7qkcWOkk5FJ4dRDV3gbDV4k=; b=HvXtm/zB/C5ixcNvAgxOmQhOWo
	bZ+aWg8BtnjAoY47UwWpCSAt9k32eLz4LrQBeF8r3mnC59bLp5Z6jdGVtg2TIDAe5n1O+p1Yo81uU
	JACXAE9K9nUPzpH/IgAL5cJxjsEz1DTp2NkeiN3UIB3fPpgkZqpCNn4sTNx9wsBGvmNttVgaxFxPb
	zWCo4ZFEtJyYyA11kJs2t+2QqPk3cJEG1ob8dLnb8QixWzg5gYoBGKK9XPBHDCXkcrvnAKOH2namW
	NL3Lbdf3pWqRyfHDAHWLLgJeKN+jgsQCFzyEmPasRfQMNEnuMqg36Sax2+HBNjfvJYZqQ8KRcoY3J
	I7GvG/dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3fi-0000000EpGA-1RDj;
	Tue, 07 Jul 2026 11:09:02 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3fc-0000000EpDo-3KAC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:08:58 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6611669cd16so5595175d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 04:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783422535; cv=none;
        d=google.com; s=arc-20260327;
        b=PQkksyVq+oa5Edr0IqWR/VhmjmmcsLICDjV1MLhYLL/zplcjLSf0hjT+wUUKrPbCHZ
         hOFjuHGL3xziLzKZYm4c+jnuhfbpzxBcoZu5Hk8pJkY9FODXLfGw0NIB2SkdbZFiRl2x
         r9LpOCtCwC1jAm5WkYMxSLtIWmDGHDP0lAnwai03P5gq/WJdWVk1/C0phU7EjxM6Vvxy
         YyOJQMtvxUYBBrit4uFwyfebBXjf/ZQufPDSwUNajf6ww6IHzAk2+8JdSfYo2pHFxGmQ
         47Ba2565JW5jvWm/6O9wINkPzxsOPIjCziSCCAaOyr2Pzip9sDWA1UAkC8TMMXDEkWIo
         BKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tMpJXM9fHbDA78kVCJHA7qkcWOkk5FJ4dRDV3gbDV4k=;
        fh=j4zH5aj53kfuPvHAmUihuWs6xoT0Yf79JDU9SleigFU=;
        b=GftkMN4fbBfhpBo3v4i/D/fXuVs9nQnratMTlyRQSLrem868TFuuvpl3+YiMkoac7d
         R1MqQF+IsV+36tzj47/mSXrROLLXFOgeChcGkQBn5dR2cJdW/Y03WZ37z2haUZkjJsJ7
         Z0FxO9doykCZa0dGKgODJOiPTViJRNaNK3+x2EMY/e3Ztujq8E0Uw6DG+2Dk0yK/DlaU
         F4HBMj/ymodXDUlhWJzc1tp7Mq8O9TKvDLLsODs0MG6WP+TI3uyRzFWjDxqZgaGCAewj
         eK3vnabiP+7MLfff2txo4uqCVrERuzM9WesF9dJJgY6TIJoH0ph1qnsCD+thC4vBwbbg
         lbWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783422535; x=1784027335; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tMpJXM9fHbDA78kVCJHA7qkcWOkk5FJ4dRDV3gbDV4k=;
        b=IxwqA9cdhTRSfnGd3o1Z8m84fqj9VI4mvoU2Omhn/PzpRIe8g/K8ehVrMIg3KB42kb
         jYFBEx0lmUQodQ2DnwT+viSRRg7B5fH5q8UZP/dDe6lRK4o+1q955kFSOch4Jjil40ro
         dPlWbuVjgM9aUw0pLMxBeZ/3Ys6Qbjuy718cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783422535; x=1784027335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMpJXM9fHbDA78kVCJHA7qkcWOkk5FJ4dRDV3gbDV4k=;
        b=T3aDRMm7yBLUT3Ns/iKfyIFe7H9VL9kGyOHQrYLfUbexlYj067yqJiuVDbnZ+VmQLs
         6uWF8VAUPfRnD/IoDZUGAsxT5KpbzhOTc8DLS6AvYu0kJeWcJcLNlZh1OWASIqVUAp3O
         i0SnUOIyM3L/wNfyQ4eF0CDnXnCLEfBNHEUA5v+TuLPzwano7h14z0GcE6vvUMsT7scY
         2ygOtvMobE0lhSUOpUl2vBGRfUAQecRA8PhAOwJuqQMZPcPtkEKqTlnSa0Jce3Ltb3cQ
         76iM1d3jTx2prez3uA+b/w3v0uK5SrfiPSvAJbCa2twrBsQJBFSIJrO2u7nZMYFPIBpe
         TSKA==
X-Forwarded-Encrypted: i=1; AHgh+RoDQBUfwke4Ny4ig92+bSRPOGd8Sgt7QukyAztFBwWBEaZIZWPeMM0HCWQclEDuTQBOFIV5rMAzhxlBqyw6OoLz@lists.infradead.org
X-Gm-Message-State: AOJu0YzQKIhluoM6N41E+3xP98hMRsRv0GbDJ+9vMJN6hLRy4PRO3OXb
	8M119TRDeaY8hZtrXYDlJCn1HEtsOFvBoMD9JL5usngiYQ6ns7p9SinBE3Vs3RRZDtWbpXWIk6J
	G9UQE+VbyMC8jXC7lWEl1S+SV+NTcNdf4V/8OBSKu
X-Gm-Gg: AfdE7cml5lRnQGMgVfgVWq9RHxtaSB6rv0A5DAC8bIONjPrnZBX1xJKsBPyeyVO54dL
	Aqp3fQkx3cJQoFavHkCB9qO6Vh6LtPF38mAoq8IbQRlupK6JH3YSlgErWZQsgAYkfNEYP4s98Xt
	IDtzsUpZIANx7u1asbpf5hY7DTpg1DuMC0PE9mkt6+rC6AEq7T/XVQIi3T70jtKtB8CvSu9zmTY
	na2hcMXpjJYiRdNLSQQxORrOLj3FdJcpmcSO7gIFhgd4DJbYtmWGT0pObe5ByFbAIaScnwnPWTh
	ll7E+19HydCy6WyIV1+AEbirC6g=
X-Received: by 2002:a05:690e:c4d:b0:664:d7aa:3eb3 with SMTP id
 956f58d0204a3-6677faec2c3mr3752539d50.12.1783422535581; Tue, 07 Jul 2026
 04:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260707104427.3409290-1-wenst@chromium.org> <176dd24c-c3cf-4ab9-8497-594ed65d10ec@collabora.com>
In-Reply-To: <176dd24c-c3cf-4ab9-8497-594ed65d10ec@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Jul 2026 19:08:44 +0800
X-Gm-Features: AVVi8CfL_5JVdKBWQj1eUZZBa-EhN5C_J2kjO8U6LC_EYJUTpwV01pG1PV1A2Kg
Message-ID: <CAGXv+5F86JU9+LPSy8PtuCPrdhBnvcA=PX1d++Yh3u7mK_Jxmw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_040856_873636_E34546CF 
X-CRM114-Status: GOOD (  29.55  )
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

On Tue, Jul 7, 2026 at 7:05=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/7/26 12:44, Chen-Yu Tsai wrote:
> > The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
> > DRAM.
> >
> > Add a device node for it and hook up all the supplies.
> >
> > This change requires a firmware fix for the SPMI bus to read back
> > correctly. The required firmware version is 15842.175.0. This is
> > included in ChromeOS releases R150-16700.22.0 (available in Beta
> > channel as of writing or stable channel in mid-July) or
> > R151-16721.0.0 and later.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> This is a big problem then.
>
> I take it as if the firmware fix is not in place, probing the CPU power s=
upplies
> will fail, with all the consequences.

That's right.

> This means that with this, we're breaking all Geralt machines with older =
firmware,
> which is not acceptable...
>
> ...so this needs a different solution, or strong reasons to make me under=
stand that
> I'm wrong, if I'm wrong.

We can drop the CPU supplies (they don't matter since cpufreq is hardware
driven) and just add the regulators. How does that sound? If the firmware
isn't updated, the PMIC will fail to probe, but since nothing is using it,
the system will continue to work (with some annoying error messages).


ChenYu

> Cheers,
> Angelo
>
> > ---
> >   .../boot/dts/mediatek/mt8188-geralt.dtsi      | 66 ++++++++++++++++++=
+
> >   1 file changed, 66 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8188-geralt.dtsi
> > index f382f90c48f5..fea52c377d88 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > @@ -4,6 +4,8 @@
> >    */
> >   /dts-v1/;
> >   #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/spmi/spmi.h>
> > +
> >   #include "mt8188.dtsi"
> >   #include "mt6359.dtsi"
> >
> > @@ -241,6 +243,14 @@ &cpu5 {
> >       cpu-supply =3D <&mt6359_vcore_buck_reg>;
> >   };
> >
> > +&cpu6 {
> > +     cpu-supply =3D <&mt6319_buck1>;
> > +};
> > +
> > +&cpu7 {
> > +     cpu-supply =3D <&mt6319_buck1>;
> > +};
> > +
> >   /*
> >    * Geralt is the reference design and doesn't have target TDP.
> >    * Ciri is (currently) the only device following Geralt, and its
> > @@ -1156,6 +1166,14 @@ pins-bus {
> >               };
> >       };
> >
> > +     spmi_pins: spmi-pins {
> > +             pins-bus {
> > +                     pinmux =3D <PINMUX_GPIO175__FUNC_B0_SPMI_M_SCL>,
> > +                              <PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA>;
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> >       uart0_pins: uart0-pins {
> >               pins-bus {
> >                       pinmux =3D <PINMUX_GPIO31__FUNC_O_UTXD0>,
> > @@ -1267,6 +1285,54 @@ &spi2 {
> >       status =3D "okay";
> >   };
> >
> > +&spmi {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&spmi_pins>;
> > +     #address-cells =3D <2>;
> > +     #size-cells =3D <0>;
> > +     status =3D "okay";
> > +
> > +     pmic@6 {
> > +             compatible =3D "mediatek,mt6319-regulator", "mediatek,mt6=
315-regulator";
> > +             reg =3D <0x6 SPMI_USID>;
> > +             pvdd1-supply =3D <&pp4200_s5>;
> > +             pvdd2-supply =3D <&pp4200_s5>;
> > +             pvdd3-supply =3D <&pp4200_s5>;
> > +             pvdd4-supply =3D <&pp4200_s5>;
> > +
> > +             regulators {
> > +                     mt6319_buck1: vbuck1 {
> > +                                     regulator-name =3D "ppvar_dvdd_pr=
oc_bc";
> > +                                     regulator-min-microvolt =3D <5200=
00>;
> > +                                     regulator-max-microvolt =3D <1155=
000>;
> > +                                     regulator-enable-ramp-delay =3D <=
256>;
> > +                                     regulator-allowed-modes =3D <0 1 =
2>;
> > +                                     regulator-always-on;
> > +                     };
> > +
> > +                     /* vbuck2 is ganged with vbuck1 */
> > +
> > +                     mt6319_buck3: vbuck3 {
> > +                                     regulator-name =3D "pp1125_emi_vd=
d2";
> > +                                     regulator-min-microvolt =3D <1060=
000>;
> > +                                     regulator-max-microvolt =3D <1170=
000>;
> > +                                     regulator-enable-ramp-delay =3D <=
256>;
> > +                                     regulator-allowed-modes =3D <0 1 =
2>;
> > +                                     regulator-always-on;
> > +                     };
> > +
> > +                     mt6319_buck4: vbuck4 {
> > +                                     regulator-name =3D "pp0600_emi_vd=
dq";
> > +                                     regulator-min-microvolt =3D <5700=
00>;
> > +                                     regulator-max-microvolt =3D <6500=
00>;
> > +                                     regulator-enable-ramp-delay =3D <=
256>;
> > +                                     regulator-allowed-modes =3D <0 1 =
2>;
> > +                                     regulator-always-on;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> >   &uart0 {
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&uart0_pins>;
>

