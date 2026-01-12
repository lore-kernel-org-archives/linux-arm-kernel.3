Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7529C9EC75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqgHi6LM2GBcY7CEojYrH5XX5uV5q8rOKITQKEaMliU=; b=gT/JCAukvufirQAycdGQDsFieS
	bkRTHKbgSzrx7JzeYnLtweYc3nV4IqcIU1wYXocpEny+q0WImeneEnT4PXqNnSs7XwwALnl+J+vq6
	zjgydySqopxRrj3al4kIHj+9/5raavTqoxLHXhTEVCaQGRn24VrkMmgnsngXRlfsQ0D9ryrk2MoE8
	Tkf2np6yHLeV0KvILGhMlH7AoTkop6k4rpUSj2098b1LJ7/2+7RH/Pv25JwNWmDgS/TALzuI/OlKy
	EQV9vtrZXWgP11lXaB/YcvdR52MR/EWdMmUP2Ob27BSA7iXHRA+wJabCaL3hdeRv/qRjR5k3Klpib
	1kTABSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFzh-00000005FLo-030A;
	Mon, 12 Jan 2026 11:21:57 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFzc-00000005FKU-3NAa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:21:56 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=qqgHi6LM2GBcY7CEojYrH5XX5uV5q8rOKITQKEaMliU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1768216893;
 b=VM+d/CKJd6MGpwrwWJLi6jiZ2O6yZeL1wyvSz3ZUAdKhNR8AkbG0Bxug2SBv5kxq2wzBmfbe
 Dx+qAZFa6pWDzV9G/ARlyGSzywWhSnIv1C8hHh3yaBczBzntPETpWUONyHPI84VCYyLjsojRYv3
 VdgbuouWWtyOUmk0zrdSA/doBNYpSoZzGAFVp6DHQ4ASkv/bMYU9UV98Ng7mNBiKP9P6uu5jrHx
 FmSoOn+cluAmAVxvM6WOagskhqEAJ95ArCEDkOtGq5PzWydO0bH1LvJ7yELOadpRFmLPT/eycYc
 Wz2X2gmF4CbKzyCD4Ho4h+Ey3Fem8vxOvWyluVROGGMGw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1768216893;
 b=AbEdvJNhSSRBuyaQNeFmINpo+Hc+ohQj7yBYOV6GHObGVQlEOA+q78Cch69IYx1oT+lgE081
 +9pO5BPUnplnvYDvBVy72kAMwXV34RKFFRzMJ0qFaLLVnd+debQ4rkvICRnfsECrgd7c1SDmY2Z
 mtademyKgwVg8f0R6+FiN/gawvRV8/YgH5G1GHuBEIuKWEJ9p7WNwzJzSSSv+6BJ8WlYv3Y+tKt
 jpzvOABibufm+VQhzESKzunlFlWXGzAxE+rdtwx1mgd/khxNLUqaaePGfyB5OGhQk5E1qu4qyqz
 A39h2mozjKNb1FNuHPFbOieP4ZL8vS0/h1J0IN7MQe44A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Mon, 12 Jan 2026 12:21:33 +0100
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AE1545A0EB0;
	Mon, 12 Jan 2026 12:21:16 +0100 (CET)
Message-ID: <b5eec4417133c2802a5fd716aba6a0f7f02bb0ba.camel@ew.tq-group.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and
 MBa62xx carrier board Device Trees
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Kees Cook <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Andrew
 Lunn <andrew@lunn.ch>,  linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org,  linux@ew.tq-group.com
Date: Mon, 12 Jan 2026 12:21:16 +0100
In-Reply-To: <20260109195912.c7wiyzj4qtdlxkh2@tumbling>
References: <cover.1767627010.git.matthias.schiffer@ew.tq-group.com>
	 <5df62f37eb84daff28008b8f9d5bd544b2f3a6a4.1767627010.git.matthias.schiffer@ew.tq-group.com>
	 <20260109195912.c7wiyzj4qtdlxkh2@tumbling>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-cloud-security-sender: matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4dqVLj3d9vz1kNh4d
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 909bbf5fc5c76c56937484f23808076f
X-cloud-security: scantime:2.047
DKIM-Signature: a=rsa-sha256;
 bh=qqgHi6LM2GBcY7CEojYrH5XX5uV5q8rOKITQKEaMliU=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1768216893; v=1;
 b=Gjk3rVQNPG0xUWCEKq9ng8KsjeBbOJpFYCejgyGV7awBJkiBvKBgYW20lmUJ4G+xV1S/Za6R
 kF7vF/t3TbIpbXqynMqK5ffCEM+Q6HhuQKq06vIPgMGxutiHBPFEKrhz5cmnoTV+de3joyNN9KN
 +VFjkgugsT+crZMAYCBiaBO/09NCiuPgDGo++CvwEEA1/PmGgI1tYRHyOyp/EP10X5PMlO2vsES
 lE1Rj4f1GY4PiW12zuHK2niVzx+RewcMkqqTJmYuLY1fiEspO2sGEeVk6merSNby/LefYA9rIXa
 +lak/n/siCD1j8Z6qX8oXKHKoz+Rtx9QOR6as0BHJZw5A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_032153_098742_73D60D10 
X-CRM114-Status: GOOD (  26.69  )
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

On Fri, 2026-01-09 at 13:59 -0600, Nishanth Menon wrote:
> On 09:14-20260107, Matthias Schiffer wrote:
> > The TQMa62xx is a SoM family with a pluggable board connector based on =
the
> > TI AM62x SoCs. Add DTS(I) for the AM625 (2x Cortex-A53) variant and its
> > combination with our MBa62xx carrier board.
> >=20
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
>=20
> Few clarifications below..
>=20
> [...]
> > diff --git a/arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts b/arc=
h/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts
> > new file mode 100644
> > index 0000000000000..cca8d0018504d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts
> > @@ -0,0 +1,930 @@
>=20
> [...]
>=20
> > +	backlight: backlight {
> > +		compatible =3D "pwm-backlight";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&backlight_pins>;
> > +		enable-gpios =3D <&main_gpio0 38 GPIO_ACTIVE_HIGH>;
> > +		status =3D "disabled";
>=20
> Document why disabled?

Will be enabled by DTSO for different panels. This will be added in a follo=
w-up
series, so I'll add a comment.

>=20
> [...]
> > +
> > +	panel: panel {
> > +		pinctrl-names =3D "default";
>=20
> Missing compatible? thinking again.. Should'nt these be part of some
> panel dtsi?

We tried to leave as much common configuration for different panels as poss=
ible
in the base DTS, so the DTBOs aren't bigger than necessary. I think it make=
s
sense to have this in the board DTS, as the signals used by the panels are =
part
of the board design.


>=20
> > +		pinctrl-0 =3D <&lvds_panel_pins>;
> > +		enable-gpios =3D <&main_gpio0 36 GPIO_ACTIVE_HIGH>;
> > +		power-supply =3D <&reg_lvds_pwr>;
> > +	};
> > +
> > +	fan0: pwm-fan {
> > +		compatible =3D "pwm-fan";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pwm_fan_pins>;
> > +		fan-supply =3D <&reg_pwm_fan>;
> > +		#cooling-cells =3D <2>;
> > +		/* typical 25 kHz -> 40.000 nsec */
> > +		pwms =3D <&epwm0 1 40000 PWM_POLARITY_INVERTED>;
> > +		cooling-levels =3D <0 32 64 128 196 240>;
> > +		pulses-per-revolution =3D <2>;
> > +		interrupt-parent =3D <&main_gpio1>;
> > +		interrupts =3D <30 IRQ_TYPE_EDGE_FALLING>;
> > +		status =3D "disabled";
>=20
> please document why disabled?

Will add a comment (disabled as our starterkits don't include a fan, and
different fans may need different PWM frequencies).


>=20
> [...]
> > +
> > +	reg_pwm_fan: regulator-pwm-fan {
> > +		compatible =3D "regulator-fixed";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&reg_pwm_fan_pins>;
> > +		regulator-name =3D "FAN_PWR";
> > +		regulator-min-microvolt =3D <12000000>;
> > +		regulator-max-microvolt =3D <12000000>;
>=20
> Just checking.. Did you intent a 12v supply for fan?

This is a standard 4-pin fan connector as is common on x86 mainboards, whic=
h
includes a 12V supply.


>=20
> > +		gpio =3D <&main_gpio0 62 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +
>=20
> [...]
>=20
> > +
> > +	lvds_panel_pins: lvds-panel-pins {
> > +		pinctrl-single,pins =3D <
> > +			/* (N20) GPMC0_BE1n.GPIO0_36 - LVDS0_RESET# */
> > +			AM62X_IOPAD(0x0094, PIN_OUTPUT, 7)
>=20
> Could you follow the comment convention you have elsewhere? please follow=
 the
> same in gpio below etc..
> AM62X_IOPAD(....) /* (N20) ... */

I tried to avoid making the lines overly long an adhered to the regular 100
column limit where reasonable. I agree that the current inconsistent style =
is
not so nice... I see two options here:

- Consistently move the comment to a separate line
- Break long comments including pin name, pin function and board signal fun=
ction
  into two lines


>=20
> btw, panel node uses it as:
> enable-gpios =3D <&main_gpio0 36 GPIO_ACTIVE_HIGH>;
>=20
> isn't RESET# meant to be active low?

As an "enable" pin enables when active and a "reset" pin disables when acti=
ve,
an active-low reset is the same as an active-high enable.


>=20
> > +		>;
> > +	};
> > +
>=20
> [...]
>=20
>=20
> > diff --git a/arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi b/arch/arm64=
/boot/dts/ti/k3-am625-tqma62xx.dtsi
> > new file mode 100644
> > index 0000000000000..1b7d58cb7b936
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi
> > @@ -0,0 +1,331 @@
> > +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> > +/*
> > + * Copyright (C) 2021-2022 Texas Instruments Incorporated - https://ww=
w.ti.com/
> > + * Copyright (c) 2023-2025 TQ-Systems GmbH <linux@ew.tq-group.com>, D-=
82229 Seefeld, Germany.
> > + * Author: Matthias Schiffer
> > + */
>=20
> [...]
>=20
> > +		regulators {
> > +			reg_buck1: buck1 {
> > +				regulator-name =3D "V_VDD_CORE";
> > +				regulator-min-microvolt =3D <750000>;
> > +				regulator-max-microvolt =3D <750000>;
> > +				regulator-boot-on;
> > +				regulator-always-on;
> > +			};
> > +
> [...]
>=20
> > +
> > +&a53_opp_table {
> > +	opp-1400000000 {
> > +		opp-hz =3D /bits/ 64 <1400000000>;
> > +		opp-supported-hw =3D <0x01 0x0004>;
> > +		opp-suspend;
> > +		clock-latency-ns =3D <6000000>;
> > +		/* Enabled by bootloader if supported */
> > +		status =3D "disabled";
>=20
> This (bootloader enabling just this node) wont work unless vdd_core
> voltage is configured to 0.8v as well, no?

Correct, the bootloader patches both PMIC config and OPP table.

Best,
Matthias


>=20
> > +	};
> > +};
> > +
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

