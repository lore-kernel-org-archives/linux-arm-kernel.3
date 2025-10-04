Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E53CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Oct 2025 02:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtAjdiNI9QJq6177oR8Gwnx6QyorD8Daikje+IvnbRU=; b=pC0XK9rFDojONEzb21DQXqIxBU
	l3uy6/oFKPt8heda2hgRnPJF+QBqbQc2kQW/0m7JqfU1x4PbTjKxHAGMJchJYDKOrTPOAol4ZaPEN
	P2pbyWsyYe7C4PdIvuM8nPQzxW9WbaFKg+mVkw0E9Jw3gSCzQ0n7LCd68YH43ZWOzvPgYVYGIrrNO
	esFAs2Rx//Y62SLdOp3OS6+IvHpdDbw3Ch3YXaoWAnyz3kLF8v2CH3iiECOH42FAUrfbJ4IvZm8ko
	aOqTLsut3L0LEb48Fqhg8gXqqM1Dfw1ZGn8BdlFDPeq9BvjdgVA2yEUqZqS7vA2+nDM8y3nG7Du7M
	0v49RfMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4sJR-0000000DOru-0X44;
	Sat, 04 Oct 2025 02:47:57 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4sJO-0000000DOr8-0iEZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Oct 2025 02:47:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3f1aff41e7eso2270254f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 19:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759546072; x=1760150872; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtAjdiNI9QJq6177oR8Gwnx6QyorD8Daikje+IvnbRU=;
        b=WwGczu9lda5+Z/PRc01nKzITvU9FzjUIz+4/UzqZY9C6DnZcXecySp6ViT2v+NN6MA
         1hPHMEP5aMiYegSoi8vUT88qIhmvJ5jFAvqgmGy5w6eIRbrHa0iloLzbfFkcnFnk0l4g
         7rKF4l6bUtVpLDb86q0iunAHrJET7UCMw8PaEeCUBKeSRXC40+EbkEXcciV8jtgxOrCu
         nn7cO0/7P6OF0bBtV0SmshfO7UlxmOU7nSQSnitSrY4jxkQlVUeJKNB83gikQNeb4sJW
         UWMPQl+4zUjewMwmLISKDXx57YTf2cNxbWsTC5iEr7Fwt6PbpHAfCNBoIpO5Onv6g47r
         FIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759546072; x=1760150872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MtAjdiNI9QJq6177oR8Gwnx6QyorD8Daikje+IvnbRU=;
        b=FubFQDeQ6jAQai7Nvjmu3cvcFu/KvWxvq0ZuXmy/JOknmmIq4oQYMDY+i/tV/2lsi3
         IAnu/pjK1Edt6yEmlSEsbhW2N5anP/u+x7zrXEMUxBTbBco3R/BQGupvA/81b2VG8Ye3
         C+w4pliTmgUy5BZ8yRpzaMZ4QHXEwbMke72O+34wigtWZXy605McVs2RMG8ZAVnWlScA
         XC52JgPu0PsteImXsvw88YFNtBkHe8v9CBk5OFlQrpDYRY8cvSF6j/WIVMmAPiwDS2Km
         K7xSj0RiXGu7Gl5j3FaKu2jUTKdvQ5ZcAzdwiMYfkiEY3MhGOMGDv+d35m0r39bnsftz
         M5oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk4E+n658Lu0yld+Y5cnezyOMJvNibBaPX8kebDT6q9EOK+HNCoTn8Yh5JnOFnfdrELrDeB+yDTyIXocR6h5k6@lists.infradead.org
X-Gm-Message-State: AOJu0YyQfvDr5AoEW1D8Lwi4ydfxVoTPpKIrzr/YOi8Lh9l9TX3k4KWV
	pxdSdU8tqFKgj1qz0+s7byYvTNUR7a7JwaOfK+uFeTYbpbyXMMNgPftISSnXFPXpW9ml5yhrfys
	jHx4nMnJcSfIrJBQDzOR8kGkh3nbsh34=
X-Gm-Gg: ASbGncs7KxlaNzKqnuRN5UTx58Ro2G1Ul78cSvb61+ewQI3ZGtdExq13QethZlc6dBP
	5jSQxDgt2NL7kpTdXDh/ibv9aAbqUgslCrbOI7O32eovBaMdAij4StwPvVn/TflS+7WQTpC+D5x
	UUJ4NT6lTazMs+eIc2x6dnTpY2wmlsTKS/2+0UjhuoD85PGsZOBHNVIKGrIw5vdN4NS4/ef0R+t
	Ssc8SaIRLzUEB68reUXtTvmqEI32APYdn91N3/07jfa5kb6Qs4zVThB/fc/qpc=
X-Google-Smtp-Source: AGHT+IFP0EzTt+6wIVfHmxt/KikNMHr5T66NnDvbjm6SJmZ/lIChMWvnF31X9JuWRj+NipMrPRhiPCMm5xgtZpXESC4=
X-Received: by 2002:a05:6000:2311:b0:424:2275:63cd with SMTP id
 ffacd0b85a97d-425671c0e00mr3412456f8f.48.1759546071609; Fri, 03 Oct 2025
 19:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251002034708.19248-1-laurent.pinchart@ideasonboard.com>
 <20251002034708.19248-4-laurent.pinchart@ideasonboard.com>
 <CALWfF7Lhz2brif4xepWZ71mRqMmXKzxqd=0_hO_b6aF6_GkffQ@mail.gmail.com> <20251003023955.GA1492@pendragon.ideasonboard.com>
In-Reply-To: <20251003023955.GA1492@pendragon.ideasonboard.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Fri, 3 Oct 2025 21:47:40 -0500
X-Gm-Features: AS18NWBrForcP1ZJaY1o0FouRlxOZ1iOrUYR8RE7nxfTY4DfB1KYllAo5n58YSg
Message-ID: <CALWfF7K19Pa5889Kp_rDLD8nDxMEhqMb6er1tKYkTV906fRWXw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add rk3588s-orangepi-cm5-base
 device tree
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Algea Cao <algea.cao@rock-chips.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Cenk Uluisik <cenk.uluisik@googlemail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>, Rob Herring <robh@kernel.org>, 
	Sandy Huang <hjc@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_194754_243654_0AD0FDF9 
X-CRM114-Status: GOOD (  28.61  )
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

On Thu, Oct 2, 2025 at 9:40=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jimmy,
>
> On Thu, Oct 02, 2025 at 07:01:53PM -0500, Jimmy Hon wrote:
> > A few nitpicks below
> >
> > [ snip ]
> > > +
> > > +#include "rk3588s-orangepi-cm5.dtsi"
> > > +
> > > +/ {
> > > +       model =3D "Xunlong Orange Pi CM5 Base";
> > > +       compatible =3D "xunlong,orangepi-cm5-base", "xunlong,orangepi=
-cm5", "rockchip,rk3588s";
> > > +
> > > +       aliases {
> > > +               ethernet0 =3D &gmac1;
> > > +               mmc0 =3D &sdhci;
> >
> > Since sdhci is enabled in the SoM.dtsi, this alias should probably go
> > there instead.
>
> Good point, I'll do that.
>
> > > +               mmc1 =3D &sdmmc;
> > > +       };
> > > +
> >
> > [ snip ]
> >
> > > +
> > > +       vbus_5v0: vbus-5v0 {
> > > +               compatible =3D "regulator-fixed";
> > > +               regulator-name =3D "vbus_5v0";
> > > +               regulator-min-microvolt =3D <5000000>;
> > > +               regulator-max-microvolt =3D <5000000>;
> > > +               enable-active-high;
> > > +               gpio =3D <&gpio0 RK_PD3 GPIO_ACTIVE_HIGH>;
> > > +               vin-supply =3D <&vcc5v0_sys>;
> > > +               pinctrl-names =3D "default";
> > > +               pinctrl-0 =3D <&vbus_5v0_en_pin>;
> >
> > The property names in these regulators are not as organized as the
> > regulators for the CPU/NPU.
>
> Which properties in particular ? There are more properties in these
> regulators, but otherwise the order seem to match.
>
> > > +       };
> > > +
> > > +       vcc_3v3: regulator-vcc-3v3 {
> > > +               compatible =3D "regulator-fixed";
> > > +               regulator-name =3D "vcc_3v3";
> > > +               regulator-min-microvolt =3D <3300000>;
> > > +               regulator-max-microvolt =3D <3300000>;
> > > +               startup-delay-us =3D <50000>;
> > > +               enable-active-high;
> > > +               gpio =3D <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
> > > +               vin-supply =3D <&vcc5v0_sys>;
> > > +               pinctrl-names =3D "default";
> > > +               pinctrl-0 =3D <&vcc_3v3_en_pin>;
> > > +       };
The majority of the properties should be in alphabetical order. So the
startup-delay-us and vin-supply are out of place.

> > > +
> > > +       vcc5v0_sys: regulator-vcc-5v0 {
> > > +               compatible =3D "regulator-fixed";
> > > +               regulator-name =3D "vcc5v0_sys";
> > > +               regulator-always-on;
> > > +               regulator-boot-on;
> > > +               regulator-min-microvolt =3D <5000000>;
> > > +               regulator-max-microvolt =3D <5000000>;
> > > +       };
> > > +};
> >
> > [ snip ]
> >
> > > +
> > > +&gmac1 {
> > > +       clock_in_out =3D "output";
> > > +       phy-handle =3D <&rgmii_phy>;
> > > +       phy-mode =3D "rgmii-id";
> > > +       phy-supply =3D <&vcc_3v3>;
> > > +       pinctrl-names =3D "default";
> > > +       pinctrl-0 =3D <&gmac1_miim
> > > +                    &gmac1_rx_bus2
> > > +                    &gmac1_tx_bus2
> > > +                    &gmac1_rgmii_clk
> > > +                    &gmac1_rgmii_bus>;
> > > +       tx_delay =3D <0x42>;
> >
> > When using "rgmii-id", tx_delay will be ignored. Does the ethernet
> > work without this property?
>
> I have to confess this was blindly copied from the BSP :-/ I'll drop the
> property and test.
>
> > See the comment by Jonas in another review.
> > https://lore.kernel.org/linux-rockchip/da752790-da17-4d26-b9b2-8240b38b=
3276@kwiboo.se/
> >
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&gpu {
> > > +       mali-supply =3D <&vdd_gpu_s0>;
> > > +       status =3D "okay";
> > > +};
> >
> > This is a feature in the SoC itself, so it's not board specific and
> > can be put into the SoM.dtsi.
>
> I'm a bit in two minds here. If a carrier board doesn't have a display
> output, the GPU isn't very useful (although in theory the GPU can be
> used without a display). That's why I decided to enable it in the
> carrier board. I suppose it doesn't hurt to enable it in the SoM, worst
> case it won't be used and so won't be powered up. I'll move it to the
> SoM.
The nice thing about the G610 GPU is that OpenCL support via Mesa's
RustICL was added earlier this year. So even in a headless cluster,
the GPU can still be useful.

>
> > [ snip ]
> >
> > > +
> > > +&pd_gpu {
> > > +       domain-supply =3D <&vdd_gpu_s0>;
> > > +};
> >
> > Same comment regarding moving to the SoM.dtsi
>
> OK.
>
> --
> Regards,
>
> Laurent Pinchart

Jimmy

