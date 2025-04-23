Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7273C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSzE3rftnozhvBrUV0vIpg9NkBc+hyjjqSB2+GzIiAM=; b=XIdBkJMaHxqpGvb0Whbn6wvh3g
	kOj72iVCbbjRB7C8pY2QEE/sPosCPAErW3Uoypm0r9+/wPUzTc0e6Fyy0xDD/6ehLYx7X8SQHAzhG
	J7G2L8bxDlGjsKHuNlqsdc5rcHnMqg6m3pfc+k7Irtevt6naBw3ElreagAwI+X3HYLQmdi96MQfYM
	m1x93G1wJYTeIyBT6qktjES29C6U5khc5v/BAyvNGSwVz5VgoZ0ANNGPu3+TCsZ6EpUdjKHknxemh
	L0NG6Xgp44F25ltslkM9Ekc/12frSPRLwAKwt7vqhpogr7guJpFBt2viC1ASb+1NqUlyHcY+UKdYR
	qsOIfujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XSM-0000000ABUH-3imv;
	Wed, 23 Apr 2025 10:35:55 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7W5T-00000009snN-2VDm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 09:08:13 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso8624971a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 02:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745399289; x=1746004089; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GSzE3rftnozhvBrUV0vIpg9NkBc+hyjjqSB2+GzIiAM=;
        b=yFv+KbSpHNXANs6pi+HtZ9+f/FTXevq/m1MaYCvSwXVBfgwzG0YdnQ7saYPyJEChfc
         zsd+DBExyk7tZtGM+Uic1rxRGm8CwLr5Y89iNSthrEUx/LyiZMTwecuOJSs6AmLDEMrP
         7hUG0iyk43CqTTr4NHvxzrSxDDfn1DAVD4qrKyyqziTdjZqsjyLsO+DLzlpr8qaa2+bI
         9I+XAXo/F+az/6vsJoet0FxNF10gxMCKlga7EQNTn3RpZm77pVQGmxKtj7HBYSd3Pd2x
         GoIVLWaJ9ewLSxPeAb4kWrOpfC9WNJsPjvTgcGsvx6a4Y+54mZYYVNSeGwQLzghNe5PQ
         dDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745399289; x=1746004089;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSzE3rftnozhvBrUV0vIpg9NkBc+hyjjqSB2+GzIiAM=;
        b=uuLFcP4as6ZIxrSBi5C3uygj7y/Ec3MVgivklZmO4d0L9QAULPaj9BTLtoFpJClWyH
         6cWR7KXMejBZ5Y/h9lAWe/CtsP6E4jH2Bh8wnABVCu3aZb4s7fZH8B/BA98jZe6xAwJ4
         qVFKHyLdbWTjhrYpLg1Zerg7m9MilhQBNLgm2gbPBP5wxHU/QTmTeG1NysOr39wW49Ry
         ifS+ozmKrSDWANV8+KRcrum4c+iZYx8BvegkVpaJtdYx7gsCryh0gkL1C5Ls4sCya3fc
         72hDDlZDC5FnRyT6kdxEOvzmWiByO0GUo4rf9C7VDc5atYzLYtYGP/5ey4tis8bJJBfb
         xeTg==
X-Forwarded-Encrypted: i=1; AJvYcCWRBaHAZ5AnosvQQExVK9lystG5Uc7rs6RgExcnFUrhirLl9nAd7kP4B8Mc3rEzM3q4ve4uodzICtqJ8pdx3rji@lists.infradead.org
X-Gm-Message-State: AOJu0YwCG7hhXzq+abllEisESU1J30X1IXfv94z8BCO3zQK5cWfLKUU5
	OBKXqZTprQUQ+V3kuHRte1qBkCPC3pOCWAf2ibaHtwCI2Xg4z1ZwewI+YkOH04k=
X-Gm-Gg: ASbGncvN9bFiohfbTVYeJ6l+pyadwrfZyT+u5vFA+CC7dDKtBglV9xQrZ+DedyIWg99
	BpJe+mfYxdVZSRQbpB+ksS5uAA9AL68uf8EJnsD9nJUIfEd3rvLrQ+4gcaO+wo+mb2my06NgTbM
	oIjiD9MEHRgw5Lv6cKVi5fGzcs7f5T4U3eM++3VeV236IvP/s87uU7gWO6FMXQgHAyKALcUaduk
	AW9Lo35F52yF1TrE0qHSUv3/HW4cLRn+jCdUB+gV7M6HBe03cqIGyUBlCxtRGtTM4Oxc9y4+ux1
	N9uJEiI4x3OMruV9keKJJD0x6AovFQC9NOc=
X-Google-Smtp-Source: AGHT+IGIVEtcneQ6QBHI27+IaUMZuGJ4Lg8B5LwWyJ7fqeDehKNvd+aExONZx2dG0jkMVlHozlkkTw==
X-Received: by 2002:a05:6402:35cc:b0:5e7:5b30:3c4f with SMTP id 4fb4d7f45d1cf-5f628554785mr17378191a12.14.1745399288737;
        Wed, 23 Apr 2025 02:08:08 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:3c1:b5a5:4b3e:82ca])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f62557943esm7103055a12.25.2025.04.23.02.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 02:08:07 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1ce015bcc28bc69295cb23bd2888779d0acaa7cc063525b3c34be3e71a95;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 23 Apr 2025 11:07:59 +0200
Message-Id: <D9DWENILJAPY.3LSS0LRD0H5Y1@baylibre.com>
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Tero Kristo" <kristo@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Sebin Francis" <sebin.francis@ti.com>,
 "Nishanth Menon" <nm@ti.com>, "Kendall Willis" <k-willis@ti.com>, "Dhruva
 Gole" <d-gole@ti.com>, "Kevin Hilman" <khilman@baylibre.com>, "Vishal
 Mahaveer" <vishalm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
 "Akashdeep Kaur" <a-kaur@ti.com>
Subject: Re: [PATCH 0/7] arm64: dts: ti: k3-am62: Add wakeup-sources for low
 power modes
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com> <174524753085.2426038.13409894396395372581.robh@kernel.org>
In-Reply-To: <174524753085.2426038.13409894396395372581.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_020811_667110_4D93D89D 
X-CRM114-Status: GOOD (  26.63  )
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

--1ce015bcc28bc69295cb23bd2888779d0acaa7cc063525b3c34be3e71a95
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Apr 21, 2025 at 5:07 PM CEST, Rob Herring (Arm) wrote:
>
> On Mon, 21 Apr 2025 10:14:18 +0200, Markus Schneider-Pargmann wrote:
>> Hi,
>>=20
>> This series adds devicetree changes needed for Partial-IO support
>> on TI am62, am62a, and am62p SoCs. It defines system states for various
>> low power modes and configures the wakeup-sources for devices in the CAN=
UART
>> group. Depending on the SoC and board details, some low power modes may =
not
>> be available, so the wakeup-sources are described in the board files.
>> The series also adds the necessary pinctrl settings required for proper
>> wakeup functionality.
>>=20
>> Partial-IO Overview
>> ------------------
>> Partial-IO is a low power system state in which nearly everything is
>> turned off except the pins of the CANUART group (mcu_mcan0, mcu_mcan1,
>> wkup_uart0 and mcu_uart0). These devices can trigger a wakeup of the sys=
tem
>> on pin activity. Note that this does not resume the system as the DDR is
>> off as well. So this state can be considered a power-off state with wake=
up
>> capabilities.
>>=20
>> A documentation can also be found in section 6.2.4 in the TRM:
>>   https://www.ti.com/lit/pdf/spruiv7
>>=20
>> Implementation Details
>> ----------------------
>> The complete Partial-IO feature requires three coordinated series, each =
handling
>> a different aspect of the implementation:
>>=20
>> 1. m_can driver series: Implements device-specific wakeup functionality
>>     for m_can devices, allowing them to be set as wakeup sources.
>>     https://gitlab.baylibre.com/msp8/linux/-/tree/topic/mcan-wakeup-sour=
ce/v6.15?ref_type=3Dheads
>>     https://lore.kernel.org/r/20250421-topic-mcan-wakeup-source-v6-12-v7=
-0-1b7b916c9832@baylibre.com
>>=20
>> 2. This series (devicetree): Defines system states and wakeup sources in=
 the
>>     devicetree for am62, am62a and am62p.
>>=20
>> 3. TI-SCI firmware series: Implements the firmware interface to enter Pa=
rtial-IO
>>     mode when appropriate wakeup sources are enabled.
>>     https://gitlab.baylibre.com/msp8/linux/-/tree/topic/tisci-partialio/=
v6.15?ref_type=3Dheads
>>=20
>> Devicetree Bindings
>> -------------------
>> This series depends on the dt-schema pull request that adds bindings for
>> system-idle-states and updates the binding for wakeup-source:
>>   https://github.com/devicetree-org/dt-schema/pull/150
>>=20
>> These new bindings allow us to define the system states and reference th=
em
>> from device wakeup-source properties.
>>=20
>> Testing
>> -------
>> A test branch is available here that includes all patches required to
>> test Partial-IO:
>>=20
>> https://gitlab.baylibre.com/msp8/linux/-/tree/integration/am62-partialio=
/v6.15?ref_type=3Dheads
>>=20
>> After enabling Wake-on-LAN the system can be powered off and will enter
>> the Partial-IO state in which it can be woken up by activity on the
>> specific pins:
>>     ethtool -s can0 wol p
>>     ethtool -s can1 wol p
>>     poweroff
>>=20
>> I tested these patches on am62-lp-sk.
>>=20
>> Best,
>> Markus
>>=20
>> Previous versions
>> -----------------
>>  - As part of the series "firmware: ti_sci: Partial-IO support"
>>    https://lore.kernel.org/r/20250306-topic-am62-partialio-v6-12-b4-v5-0=
-f9323d3744a2@baylibre.com
>>=20
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> ---
>> Markus Schneider-Pargmann (7):
>>       arm64: dts: ti: k3-pinctrl: Add WKUP_EN flag
>>       arm64: dts: ti: k3-am62: Define possible system states
>>       arm64: dts: ti: k3-am62a: Define possible system states
>>       arm64: dts: ti: k3-am62p: Define possible system states
>>       arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source system-states
>>       arm64: dts: ti: k3-am62a7-sk: Set wakeup-source system-states
>>       arm64: dts: ti: k3-am62p5-sk: Set wakeup-source system-states
>>=20
>>  arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 60 +++++++++++++++++++++++++
>>  arch/arm64/boot/dts/ti/k3-am62.dtsi      | 22 +++++++++
>>  arch/arm64/boot/dts/ti/k3-am62a.dtsi     | 27 ++++++++++++
>>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts  | 76 +++++++++++++++++++++++++=
+++++++
>>  arch/arm64/boot/dts/ti/k3-am62p.dtsi     | 27 ++++++++++++
>>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts  | 76 +++++++++++++++++++++++++=
+++++++
>>  arch/arm64/boot/dts/ti/k3-pinctrl.h      |  2 +
>>  7 files changed, 290 insertions(+)
>> ---
>> base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
>> change-id: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da
>> prerequisite-change-id: 20241009-topic-mcan-wakeup-source-v6-12-8c1d6993=
1bd8:v7
>> prerequisite-patch-id: 02b7142f56c849c9a3faab2d2871805febd647aa
>> prerequisite-patch-id: 830b339ea452edd750b04f719da91e721be630cb
>> prerequisite-patch-id: 56fd0aae20e82eb2dfb48f1b7088d62311a11f05
>> prerequisite-patch-id: 41f55b96c0428240d74d488e3c788c09842a1753
>>=20
>> Best regards,
>> --
>> Markus Schneider-Pargmann <msp@baylibre.com>
>>=20
>>=20
>>=20
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>

Yes, these issues are expected as long as the github PR on the dt-schema is=
 not merged.
https://github.com/devicetree-org/dt-schema/pull/150

Best
Markus

>
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 64e9fdfc89a76fed38d8ddeed72d42ec71957e=
d9
>  Deps: looking for dependencies matching 11 patch-ids
>  Deps: Applying prerequisite patch: [PATCH v7 1/4] dt-bindings: can: m_ca=
n: Add wakeup properties
>  Deps: Applying prerequisite patch: [PATCH v7 2/4] can: m_can: Map WoL to=
 device_set_wakeup_enable
>  Deps: Applying prerequisite patch: [PATCH v7 3/4] can: m_can: Return ERR=
_PTR on error in allocation
>  Deps: Applying prerequisite patch: [PATCH v7 4/4] can: m_can: Support pi=
nctrl wakeup state
>  Deps: Applying prerequisite patch: [PATCH 1/7] arm64: dts: ti: k3-pinctr=
l: Add WKUP_EN flag
>  Deps: Applying prerequisite patch: [PATCH 2/7] arm64: dts: ti: k3-am62: =
Define possible system states
>  Deps: Applying prerequisite patch: [PATCH 3/7] arm64: dts: ti: k3-am62a:=
 Define possible system states
>  Deps: Applying prerequisite patch: [PATCH 4/7] arm64: dts: ti: k3-am62p:=
 Define possible system states
>  Deps: Applying prerequisite patch: [PATCH 5/7] arm64: dts: ti: k3-am62-l=
p-sk: Set wakeup-source system-states
>  Deps: Applying prerequisite patch: [PATCH 6/7] arm64: dts: ti: k3-am62a7=
-sk: Set wakeup-source system-states
>  Deps: Applying prerequisite patch: [PATCH 7/7] arm64: dts: ti: k3-am62p5=
-sk: Set wakeup-source system-states
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/ti/' fo=
r 20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com:
>
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: /system-idle-s=
tates/system-partial-io: failed to match any schema with compatible: ['syst=
em-idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: /system-idle-stat=
es/system-partial-io: failed to match any schema with compatible: ['system-=
idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: /system-idle-s=
tates/system-deep-sleep: failed to match any schema with compatible: ['syst=
em-idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: /system-idle-stat=
es/system-deep-sleep: failed to match any schema with compatible: ['system-=
idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /system-idle-states/=
system-partial-io: failed to match any schema with compatible: ['system-idl=
e-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: /system-idle-s=
tates/system-mcu-only: failed to match any schema with compatible: ['system=
-idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: /system-idle-stat=
es/system-mcu-only: failed to match any schema with compatible: ['system-id=
le-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /system-idle-states/=
system-deep-sleep: failed to match any schema with compatible: ['system-idl=
e-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: /system-idle-states/=
system-partial-io: failed to match any schema with compatible: ['system-idl=
e-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: /system-idle-s=
tates/system-standby: failed to match any schema with compatible: ['system-=
idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: /system-idle-stat=
es/system-standby: failed to match any schema with compatible: ['system-idl=
e-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /system-idle-states/=
system-mcu-only: failed to match any schema with compatible: ['system-idle-=
state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: /system-idle-states/=
system-deep-sleep: failed to match any schema with compatible: ['system-idl=
e-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /system-idle-states/=
system-standby: failed to match any schema with compatible: ['system-idle-s=
tate']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: /system-idle-states/=
system-mcu-only: failed to match any schema with compatible: ['system-idle-=
state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: /system-idle-states/=
system-standby: failed to match any schema with compatible: ['system-idle-s=
tate']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: /system-idle-stat=
es/system-partial-io: failed to match any schema with compatible: ['system-=
idle-state']
> arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: /system-idle-states/syste=
m-partial-io: failed to match any schema with compatible: ['system-idle-sta=
te']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: /system-idle-stat=
es/system-deep-sleep: failed to match any schema with compatible: ['system-=
idle-state']
> arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: /system-idle-states/syste=
m-deep-sleep: failed to match any schema with compatible: ['system-idle-sta=
te']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: /system-idle-stat=
es/system-mcu-only: failed to match any schema with compatible: ['system-id=
le-state']
> arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: /system-idle-states/syste=
m-mcu-only: failed to match any schema with compatible: ['system-idle-state=
']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: /system-idle-stat=
es/system-standby: failed to match any schema with compatible: ['system-idl=
e-state']
> arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: /system-idle-states/syste=
m-standby: failed to match any schema with compatible: ['system-idle-state'=
]
> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /system-idle-states/system-parti=
al-io: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /system-idle-states/system-io-dd=
r: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: /system-idle-st=
ates/system-partial-io: failed to match any schema with compatible: ['syste=
m-idle-state']
> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /system-idle-states/system-deep-=
sleep: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: /system-idle-st=
ates/system-deep-sleep: failed to match any schema with compatible: ['syste=
m-idle-state']
> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /system-idle-states/system-mcu-o=
nly: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: /system-idle-st=
ates/system-mcu-only: failed to match any schema with compatible: ['system-=
idle-state']
> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /system-idle-states/system-stand=
by: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: /system-idle-st=
ates/system-standby: failed to match any schema with compatible: ['system-i=
dle-state']
> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: serial@4a00000 (ti,am64-uart): w=
akeup-source: [[4, 5, 6, 7]] is not of type 'boolean'
> 	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: can@4e08000 (bosch,m_can): wakeu=
p-source: [[14, 4, 5, 6, 7]] is not of type 'boolean'
> 	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: can@4e18000 (bosch,m_can): wakeu=
p-source: [[14, 4, 5, 6, 7]] is not of type 'boolean'
> 	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: serial@0 (ti,am64-uart): wakeup-=
source: [[4, 5, 6, 7]] is not of type 'boolean'
> 	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /system-idle-states/system-parti=
al-io: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /system-idle-states/system-io-dd=
r: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /system-idle-states/system-deep-=
sleep: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /system-idle-states/system-mcu-o=
nly: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /system-idle-states/system-stand=
by: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@4a00000 (ti,am64-uart): w=
akeup-source: [[4, 5, 6, 7]] is not of type 'boolean'
> 	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: can@4e08000 (bosch,m_can): wakeu=
p-source: [[13, 4, 5, 6, 7]] is not of type 'boolean'
> 	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: can@4e18000 (bosch,m_can): wakeu=
p-source: [[13, 4, 5, 6, 7]] is not of type 'boolean'
> 	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@0 (ti,am64-uart): wakeup-=
source: [[4, 5, 6, 7]] is not of type 'boolean'
> 	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: /system-idle-stat=
es/system-partial-io: failed to match any schema with compatible: ['system-=
idle-state']
> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: /system-idle-stat=
es/system-io-ddr: failed to match any schema with compatible: ['system-idle=
-state']
> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: /system-idle-stat=
es/system-deep-sleep: failed to match any schema with compatible: ['system-=
idle-state']
> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: /system-idle-stat=
es/system-mcu-only: failed to match any schema with compatible: ['system-id=
le-state']
> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: /system-idle-stat=
es/system-standby: failed to match any schema with compatible: ['system-idl=
e-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /system-idle-stat=
es/system-partial-io: failed to match any schema with compatible: ['system-=
idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /system-idle-stat=
es/system-deep-sleep: failed to match any schema with compatible: ['system-=
idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /system-idle-stat=
es/system-mcu-only: failed to match any schema with compatible: ['system-id=
le-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /system-idle-stat=
es/system-standby: failed to match any schema with compatible: ['system-idl=
e-state']
> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /system-idle-states/system-part=
ial-io: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /system-idle-states/system-deep=
-sleep: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /system-idle-states/system-mcu-=
only: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /system-idle-states/system-stan=
dby: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: can@4e08000 (bosch,m_can): wake=
up-source: [[9, 10, 11, 12]] is not of type 'boolean'
> 	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: can@4e18000 (bosch,m_can): wake=
up-source: [[9, 10, 11, 12]] is not of type 'boolean'
> 	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: /system-idle-state=
s/system-partial-io: failed to match any schema with compatible: ['system-i=
dle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: /system-idle-state=
s/system-deep-sleep: failed to match any schema with compatible: ['system-i=
dle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: /system-idle-state=
s/system-mcu-only: failed to match any schema with compatible: ['system-idl=
e-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: /system-idle-state=
s/system-standby: failed to match any schema with compatible: ['system-idle=
-state']
> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: /system-idle-state=
s/system-partial-io: failed to match any schema with compatible: ['system-i=
dle-state']
> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: /system-idle-state=
s/system-deep-sleep: failed to match any schema with compatible: ['system-i=
dle-state']
> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: /system-idle-state=
s/system-mcu-only: failed to match any schema with compatible: ['system-idl=
e-state']
> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: /system-idle-state=
s/system-standby: failed to match any schema with compatible: ['system-idle=
-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: /system-idle-s=
tates/system-partial-io: failed to match any schema with compatible: ['syst=
em-idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: /system-idle-s=
tates/system-deep-sleep: failed to match any schema with compatible: ['syst=
em-idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: /system-idle-s=
tates/system-mcu-only: failed to match any schema with compatible: ['system=
-idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: /system-idle-s=
tates/system-standby: failed to match any schema with compatible: ['system-=
idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: /system-idle-stat=
es/system-partial-io: failed to match any schema with compatible: ['system-=
idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: /system-idle-stat=
es/system-deep-sleep: failed to match any schema with compatible: ['system-=
idle-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: /system-idle-stat=
es/system-mcu-only: failed to match any schema with compatible: ['system-id=
le-state']
> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: /system-idle-stat=
es/system-standby: failed to match any schema with compatible: ['system-idl=
e-state']
> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /system-idle-states/system-partia=
l-io: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /system-idle-states/system-deep-s=
leep: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /system-idle-states/system-mcu-on=
ly: failed to match any schema with compatible: ['system-idle-state']
> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /system-idle-states/system-standb=
y: failed to match any schema with compatible: ['system-idle-state']


--1ce015bcc28bc69295cb23bd2888779d0acaa7cc063525b3c34be3e71a95
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaAit7xEcbXNwQGJheWxp
YnJlLmNvbQAKCRCFwVZpkBVKU6rZAQCv4WGsjlyZsCbQdrqAhbR+FSn6m9DV0jUy
sOYZRnY7WQD/YdfardzogMugKEpuWJsPRwBbqDAPgm1544SbpgdKSg0=
=97q1
-----END PGP SIGNATURE-----

--1ce015bcc28bc69295cb23bd2888779d0acaa7cc063525b3c34be3e71a95--

