Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E510CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 09:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/t1/wksIDf3jPXIxuPylTLhtA9vOxDXIa8eokU2PmXw=; b=KPgiFdjFn9JI9r7wUz/tGN5RZN
	vWv5N/CcECepEXlbFnJMvnAxCbY2T1NIbjr2BkjGuLkjbFMBXdpgA3xCIaUvM2jc2mEpo94J8H7Rk
	ONJpz/snQ4DgJt5HRIBAoxZOP9/yyFy/+0c7fOW/lyzxCZfu9uuumjoaegmS1ZDf/J2dhBpyuwI8t
	9kNspQuhz1e/ZxqeEh8bzREdeygKfrqLEoWzb5RfSWm/ORvoNQnN5Ei7Sw1g/3SIQG4EHglVqy4NH
	6ZdNEltZimBuQc1qcwFEBoue6ANosf2mSlHVVOca9DttKqHVUCBzPoYGqLAamZN1B0qPqk1bEVz0w
	+5jGMR8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4FYS-0000000A8lY-3WQS;
	Thu, 02 Oct 2025 09:24:52 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4FYP-0000000A8lB-3Hdh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 09:24:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e491a5b96so4622855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 02:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759397088; x=1760001888; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/t1/wksIDf3jPXIxuPylTLhtA9vOxDXIa8eokU2PmXw=;
        b=ALbZesVrb9QdrvznNNCoy13C6opn4e/w8W73gYWxJQ213yFyJkWql2UQMhZFHOvH+q
         A+uMafUOiV2iI86jLRTIfQsyhRlxTo8uDAc+3olQeo4UMmFWIDK9OTv3xXAS8WOFxRvC
         2WDJKJgFon6j1BrsEpVNkT6AcdA2Zhmae8nvbse/QhZRz9q+mTvtxZx7Jy2QOYlhMy0h
         V1JUedWxBUD8pxA7YglHTJWatQn8r6ritWBBOOz48/LAujJRHATwaRbeWdTi5033DlQ+
         GOuB75ECqOHz/v6hh6o3pMVzstt4WU5TFLUCTZoCuhqPCWCik846jEzHvC4cDFLuJfD/
         Egtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759397088; x=1760001888;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/t1/wksIDf3jPXIxuPylTLhtA9vOxDXIa8eokU2PmXw=;
        b=Y1xPaTN7MO7FpsFkPrBv+dYRjFe9Dr+spbnkr339UrY3PjaFtPxlqZ60fJ5F100QX4
         UPIvObWuYxVmYK9MpnsRrbhk4lsk9dVrqiHKTMdHDA8yWP8gdRZZtlGd7bRh9F1LCdaf
         hI/5bDnYCaXeeRpddlAPPsxWv+9mamkX4DJnXJSvcwzwJB5l6CWTKjb4CZ8waEZAIbBN
         FfRgH1+7i0It6lyHYF+bBzVJ4MUIhwLThTaF3B4LMT6+aqfHEDsDFbU3W169UqShJHmH
         iuCPB380Z+EEtorElUhfFzaMHcZgfZr6CS02aUmFUPZ2Okre08PfvBLa3/MYzS9DelcT
         iuSw==
X-Gm-Message-State: AOJu0YxmrBV3Yc8Y7xphhOqoBLTh9adBra3i/OQA+r43YZnUseMG52JT
	+LS/OTGb8Bq87PVLCJ1u/Rd20F/jU6JycohBUkx+pCsBE1d1xjjm2q6iZfswCW2f0C8=
X-Gm-Gg: ASbGncv6IabQJ4T3zrqwZFD78oOchPkC5f4FocToWxXchhZxDlRcs9jdYgWfxn4qxmM
	wSH7BW+bH3gRVm1nyXB2dEtq4H+o/1Ct+zVEP0Ye7IkQm97hbliUAeI+VL9/xBjkdMbpiNVk0hg
	Os17qyk2AunE20oc6ox3K8kW/kiLXIEKz6O4NpuME0wEGmGq0Cdkqd+joLE2UzDUYla7VotLRIF
	miiyL7GfNrWoouCy13cjDRL1IzQTUCBKDcIgOK+Q1b7a4uRNv19E1byecfqUPsOGmsRzhZf/7Wd
	hHLCrouQ1Ijnya30VxxXXY31GkqjFxkP/1keoG9iuY/+X1ZOkgdzFDBtTK/nOaF5MICo8qY+NyI
	4v6h0pyJ0uD6vgEQSWrNGXWVXZEx8FL5e0QMsBNcVD1RNetNHcgkYx0S1BkyqqcBNIT5gtw==
X-Google-Smtp-Source: AGHT+IESV0coqhnpEDbT2Ff0mcbG5fodwxZU2sbL8zxaucsaY4KXStaV0RqhFdHkaqlu6kxIwfCbrA==
X-Received: by 2002:a05:600c:a08e:b0:46d:cfc9:1d20 with SMTP id 5b1f17b1804b1-46e612bab6cmr44711815e9.22.1759397087719;
        Thu, 02 Oct 2025 02:24:47 -0700 (PDT)
Received: from localhost (88-127-129-70.subs.proxad.net. [88.127.129.70])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e619b8343sm74081805e9.2.2025.10.02.02.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:24:46 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=18a92e2b6b60e172e39476fc52257f0148eab3545fa353d7b0b0e342ab6f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 02 Oct 2025 11:24:38 +0200
Message-Id: <DD7Q7NSX0HGG.GTQPPTS7H1FB@baylibre.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Vishal Mahaveer" <vishalm@ti.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>, "Sebin
 Francis" <sebin.francis@ti.com>, "Kendall Willis" <k-willis@ti.com>,
 "Akashdeep Kaur" <a-kaur@ti.com>
Subject: Re: [PATCH v3 0/6] arm64: dts: ti: k3-am62: Add wakeup-sources for
 low power modes
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>, "Nishanth
 Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251001-topic-am62-dt-partialio-v6-15-v3-0-7095fe263ece@baylibre.com>
In-Reply-To: <20251001-topic-am62-dt-partialio-v6-15-v3-0-7095fe263ece@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_022449_863038_DA970C81 
X-CRM114-Status: GOOD (  28.72  )
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

--18a92e2b6b60e172e39476fc52257f0148eab3545fa353d7b0b0e342ab6f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Oct 1, 2025 at 4:34 PM CEST, Markus Schneider-Pargmann (TI.com) wrot=
e:
> Hi,
>
> This series adds devicetree changes needed for Partial-IO support on TI
> am62, am62a, and am62p SoCs. It defines system states for various low
> power modes and configures the wakeup-sources for devices in the CANUART
> group. Depending on the SoC and board details, some low power modes may
> not be available, so the wakeup-sources are described in the board
> files. The series also adds the necessary pinctrl settings required for
> proper wakeup functionality.
>
> Partial-IO Overview
> ------------------
> Partial-IO is a low power system state in which nearly everything is
> turned off except the pins of the CANUART group (mcu_mcan0, mcu_mcan1,
> wkup_uart0 and mcu_uart0). These devices can trigger a wakeup of the
> system on pin activity. Note that this does not resume the system as the
> DDR is off as well. So this state can be considered a power-off state
> with wakeup capabilities.
>
> A documentation can also be found in section 6.2.4 in the TRM:
>   https://www.ti.com/lit/pdf/spruiv7
>
> Implementation Details
> ----------------------
> The complete Partial-IO feature requires three coordinated series, each
> handling a different aspect of the implementation:

I missed updating the lore links, here they are:

> 1. m_can driver series: Implements device-specific wakeup functionality
>    for m_can devices, allowing them to be set as wakeup sources.
>     https://gitlab.baylibre.com/msp8/linux/-/tree/topic/mcan-wakeup-sourc=
e/v6.17?ref_type=3Dheads
>     https://lore.kernel.org/r/20250812-topic-mcan-wakeup-source-v6-12-v8-=
0-6972a810d63b@baylibre.com

v10:
https://lore.kernel.org/r/20251001-topic-mcan-wakeup-source-v6-12-v10-0-4ab=
508ac5d1e@baylibre.com

> 2. This series (devicetree): Defines system states and wakeup sources in
>    the devicetree for am62, am62a and am62p.
>
> 3. TI-SCI firmware series: Implements the firmware interface to enter
>    Partial-IO mode when appropriate wakeup sources are enabled.
>     https://gitlab.baylibre.com/msp8/linux/-/tree/topic/tisci-partialio/v=
6.17?ref_type=3Dheads

v8:
https://lore.kernel.org/r/20251001-topic-am62-partialio-v6-12-b4-v8-0-76a74=
2605110@baylibre.com

Best
Markus

>
> Devicetree Bindings
> -------------------
> This series depends on the dt-schema pull request that adds bindings for
> system-idle-states and updates the binding for wakeup-source:
>   https://github.com/devicetree-org/dt-schema/pull/150
>
> This is merged now in upstream dt-schema. These new bindings allow us to
> define the system states and reference them from device wakeup-source
> properties.
>
> Testing
> -------
> A test branch is available here that includes all patches required to
> test Partial-IO:
>
> https://gitlab.baylibre.com/msp8/linux/-/tree/integration/am62-partialio/=
v6.17?ref_type=3Dheads
>
> After enabling Wake-on-LAN the system can be powered off and will enter
> the Partial-IO state in which it can be woken up by activity on the
> specific pins:
>     ethtool -s can0 wol p
>     ethtool -s can1 wol p
>     poweroff
>
> I tested these patches on am62-lp-sk.
>
> Best,
> Markus
>
> Previous versions
> -----------------
>  - Link to v2: https://lore.kernel.org/r/20250812-topic-am62-dt-partialio=
-v6-15-v2-0-25352364a0ac@baylibre.com
>  - Link to v1: https://lore.kernel.org/r/20250421-topic-am62-dt-partialio=
-v6-15-v1-0-6ced30aafddb@baylibre.com
>  - As part of the series "firmware: ti_sci: Partial-IO support"
>    https://lore.kernel.org/r/20250306-topic-am62-partialio-v6-12-b4-v5-0-=
f9323d3744a2@baylibre.com
>
> Changes in v3:
>  - Drop patch to add WKUP_EN and rebase to linux-next to base on the
>    patch that accepted which adds PIN_WKUP_EN instead
>    https://lore.kernel.org/all/20250909044108.2541534-1-a-kaur@ti.com/
>  - Fix small typos in the commit messages
>  - Use AM62AX_MCU_IOPAD for am62a and AM62PX_MCU_IOPAD for am62p
>
> Changes in v2:
>  - Combine k3-am62a7-sk.dts devicetree nodes with existing ones
>  - Combine k3-am62p5-sk.dts devicetree nodes with existing ones
>  - Update the idle-state-name properties to the new names from the
>    dt-schema
>  - Rebase to 6.17-rc1
>
> Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
> ---
> Markus Schneider-Pargmann (TI.com) (6):
>       arm64: dts: ti: k3-am62: Define possible system states
>       arm64: dts: ti: k3-am62a: Define possible system states
>       arm64: dts: ti: k3-am62p: Define possible system states
>       arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source system-states
>       arm64: dts: ti: k3-am62a7-sk: Set wakeup-source system-states
>       arm64: dts: ti: k3-am62p5-sk: Set wakeup-source system-states
>
>  arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 60 ++++++++++++++++++++++++++=
+
>  arch/arm64/boot/dts/ti/k3-am62.dtsi      | 22 ++++++++++
>  arch/arm64/boot/dts/ti/k3-am62a.dtsi     | 27 ++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts  | 71 ++++++++++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/ti/k3-am62p.dtsi     | 27 ++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts  | 71 ++++++++++++++++++++++++++=
++++++
>  6 files changed, 278 insertions(+)
> ---
> base-commit: 24c4d4041c2ec11c47baf6ea54f9379cf88809fc
> change-id: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da
> prerequisite-change-id: 20241009-topic-mcan-wakeup-source-v6-12-8c1d69931=
bd8:v10
> prerequisite-patch-id: 40ff771d13dccae91c04ab120aa1b5e406b66e47
> prerequisite-patch-id: 830b339ea452edd750b04f719da91e721be630cb
> prerequisite-patch-id: 2c9142d2bc47e64c49b7b8a7ca20a62a0be14870
> prerequisite-patch-id: aa64f7e9fcc3fcbb3cb871a05a07f398f3aa8231
>
> Best regards,


--18a92e2b6b60e172e39476fc52257f0148eab3545fa353d7b0b0e342ab6f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaN5E1hsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMF
7wEA7A4kvhpKpIXHOpsMVN+m1MRqhXoWJbGNbNUBBD4uYrsBAI4lCf/2jOr1yVOR
fH3WH1xRgsOtHu5d0YNiT9ea7LwO
=XyLo
-----END PGP SIGNATURE-----

--18a92e2b6b60e172e39476fc52257f0148eab3545fa353d7b0b0e342ab6f--

