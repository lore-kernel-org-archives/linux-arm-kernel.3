Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF86CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Icgfc3/FElBuJ0BKL8MGnmNZj7OM0/rdBixhQ/A21CE=; b=EOuejZXxeQuheTXS+Lbss8sjrm
	aCXirqJoVP5g5fBH07ykn3YTRt/5NFBjCzxuzyCDG/FPM2W3psyiI5xPHFgYJX5ybIEG0D96/aRv0
	FxX1LH9Xl1lnlEAp4WSVgeX+GhqJnrTcx885kiOW/goIAAho/9An/rRo0Q0Sq1pHRCnjCWcXVU2zW
	KpKyx2wPts/nkEuZS0Krm0BwXAKiuL9yo7RHImnOkaDahVn6MU2/mLNnsmRNi6oDVLkbsg+TTSXzb
	z49/Zn+PCivjogqHGBtjTvx34Zdmh9oT3G6ML7+u7rwDk+hd6zrBPNPfb/8LzdupWbUrmGsBFTTma
	VT6RAyMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4FVB-0000000A8P0-49DD;
	Thu, 02 Oct 2025 09:21:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4FV9-0000000A8Nr-1dkP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 09:21:29 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so6161135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759396885; x=1760001685; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Icgfc3/FElBuJ0BKL8MGnmNZj7OM0/rdBixhQ/A21CE=;
        b=C8T11jubq00UoeSnxyh4O1BfuCFXBdyVFQhxy3uA+IAcBo4E1f/phjzkvMhsQqzOsr
         0h80qswpLmrB0lnE8d1FhlKUO/A1/r5WPFE70EOHRjkyGk+PrDyee4LgsIEve3a9ACL9
         VH/MA9+usVMZoLA7/wKBbA53gfTxK4cCHbpPl/VTFRq5aoDTXe9I6xXml0lVkVnCJENB
         fcYgCsUZbfOzXx/62CPx3gloHOXrLkGgYSTecch04RLoTcJFL+RzFyeTHXQdY2KWoDs4
         doSFbmD4cm6KF7Le48FaznmE8f/U+ML6FPG7CKnDg0Y0nUz0ohUbUBl4TQCvxnk+N7H2
         rxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759396885; x=1760001685;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Icgfc3/FElBuJ0BKL8MGnmNZj7OM0/rdBixhQ/A21CE=;
        b=o9nDTzdMc7xduK2leVurpFn3qw+KwpEH24JaNmHDR+ytJVyTZx1MAzOSihVinw9sg0
         TsvYbORgRswm5IB6B7qOMe6IzQeEkQs9Lwyh4KikGOxBbIiPBnbi+MOOPbttotLqNert
         qxcZV5aVffwPaKW3qwwTuApHgBR94vgrdmP63RWFypVkj12eBd6uVkxV3CruBnXoinEo
         68jueI7GjKehaCKeh+xEMvDbJl3skwi5KOBFb9MJEPRryXAUXPeeYQEmDGvThuc5SI+Q
         rGVNe4EGqkVMAyFizAyYXWXcfKy0LuFuH9HGn/kZLJcoggjzIOTQQ3gjkGkTiJ0HtMM9
         WGzg==
X-Forwarded-Encrypted: i=1; AJvYcCUwfnHvNIItn97MaZfGbFCd8Njwyj0wMCBgoMIoHJqd/mYSEplndjXIZ26KHv5Va7HCrxIWIH9Xb7v4etGQjsLX@lists.infradead.org
X-Gm-Message-State: AOJu0YzfZGZBAaeD7lhLhFoKpqciJgNYKDQbOy5XxDfWBXbqV83vP05U
	pjX3QtODquXtfnQprTs8N4ULZiCc+HXuI7RsRB/wFekOXyrUJqZeFbRIE8nhP5RjB0o=
X-Gm-Gg: ASbGnct+J6RRi05jhKaJA0a2MGXEJy6ohBihah10mNWcq4A0O6RoqQk6fGMA1qK5liv
	x8URnh+jL9ktrYsqQPdIT3LQ6fxUzo0NgNeZgmbjZ0Si5pbaRffcglBCfxfCHLlkr1XxtatH94f
	y3Tv35YKiO5lWUuooRMx9HwHs9syZmuCnz488HJxxMa6hfLCWV3eN/iuaV5kmkX7ZyHcT+Mv7Jo
	sK5/NwHx3jc0PCKQQZbd9IoIY7CQcYqTW6AdeQRJvrvvCH6W0FnhYmkPisN2UmM7o66zw2ftRuX
	YA47lEbtPcLJrvYDAsk1IWzjyskmsTbAp8UNIkZaCNxHCTvGInrW1yghHzj9uV8AXjrDZRD0iGh
	ZKdf4jJOjIDn6ySuTc8EOmF/9K+dn6HKyDJHZXgY16xhCnplRIDhNg6VdFzCbkD6VVLBtpkCPP0
	W3dV+t
X-Google-Smtp-Source: AGHT+IFJLCQG0wA2+ju9X0SPF2fhZbMkJgtAM7PNHNEQ1jRFNtcgO1QZwCjDBWP7p0tfaSjIaIKbTw==
X-Received: by 2002:a05:600c:528b:b0:46e:1c97:e214 with SMTP id 5b1f17b1804b1-46e612691e2mr46118105e9.19.1759396885462;
        Thu, 02 Oct 2025 02:21:25 -0700 (PDT)
Received: from localhost (88-127-129-70.subs.proxad.net. [88.127.129.70])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e691820c3sm26320735e9.7.2025.10.02.02.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:21:24 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=ca7df36c40fef4aef7d8884e97ac162d203f1e34b5b18ef9a0cb2f1f5dc0;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 02 Oct 2025 11:21:16 +0200
Message-Id: <DD7Q531PLMFE.1G07XTKDUF9HR@baylibre.com>
Cc: "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>, "Sebin Francis"
 <sebin.francis@ti.com>, "Kendall Willis" <k-willis@ti.com>, "Akashdeep
 Kaur" <a-kaur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 0/3] firmware: ti_sci: Partial-IO support
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>, "Nishanth
 Menon" <nm@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Santosh Shilimkar"
 <ssantosh@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251001-topic-am62-partialio-v6-12-b4-v8-0-76a742605110@baylibre.com>
In-Reply-To: <20251001-topic-am62-partialio-v6-12-b4-v8-0-76a742605110@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_022127_482716_BA8036EF 
X-CRM114-Status: GOOD (  40.99  )
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

--ca7df36c40fef4aef7d8884e97ac162d203f1e34b5b18ef9a0cb2f1f5dc0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Oct 1, 2025 at 4:37 PM CEST, Markus Schneider-Pargmann (TI.com) wrot=
e:
> Hi,
>
> This series adds support for Partial-IO to the ti-sci driver,
> implementing the firmware interface necessary to enter this low power
> state. It processes the wakeup-source properties from the devicetree and
> communicates with the system firmware to enter Partial-IO mode when
> appropriate wakeup sources are enabled.
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

I missed updating the lore links, sorry, here are the new ones:

>
> 1. m_can driver series: Implements device-specific wakeup functionality
>    for m_can devices, allowing them to be set as wakeup sources.
>    https://gitlab.baylibre.com/msp8/linux/-/tree/topic/mcan-wakeup-source=
/v6.17?ref_type=3Dheads
>    https://lore.kernel.org/r/20250812-topic-mcan-wakeup-source-v6-12-v8-0=
-6972a810d63b@baylibre.com

v10:
https://lore.kernel.org/r/20251001-topic-mcan-wakeup-source-v6-12-v10-0-4ab=
508ac5d1e@baylibre.com

> 2. Devicetree series: Defines system states and wakeup sources in the
>    devicetree for am62, am62a and am62p.
>    https://gitlab.baylibre.com/msp8/linux/-/tree/topic/am62-dt-partialio/=
v6.17?ref_type=3Dheads
>    https://lore.kernel.org/r/20250812-topic-am62-dt-partialio-v6-15-v2-0-=
25352364a0ac@baylibre.com

v3:
https://lore.kernel.org/r/20251001-topic-am62-dt-partialio-v6-15-v3-0-7095f=
e263ece@baylibre.com

Best
Markus

> 3. This series (TI-SCI firmware): Implements the firmware interface to
>    enter Partial-IO mode when appropriate wakeup sources are enabled.
>
> Devicetree Bindings
> -------------------
> This series depends on the dt-schema pull request that adds bindings for
> system-idle-states and updates the binding for wakeup-source:
>   https://github.com/devicetree-org/dt-schema/pull/150
>
> This is now merged. These new bindings allow the ti-sci driver to
> identify devices that can act as wakeup sources for specific system
> states like Partial-IO.
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
> These patches are tested on am62-lp-sk.
>
> Best,
> Markus
>
> Previous versions "firmware: ti_sci: Partial-IO support":
>  v1: https://lore.kernel.org/lkml/20240523080225.1288617-1-msp@baylibre.c=
om/
>  v2: https://lore.kernel.org/lkml/20240729080101.3859701-1-msp@baylibre.c=
om/
>  v3: https://lore.kernel.org/r/20241012-topic-am62-partialio-v6-13-b4-v3-=
0-f7c6c2739681@baylibre.com
>  v4: https://lore.kernel.org/r/20241219-topic-am62-partialio-v6-12-b4-v4-=
0-1cb8eabd407e@baylibre.com
>  v5: https://lore.kernel.org/r/20250306-topic-am62-partialio-v6-12-b4-v5-=
0-f9323d3744a2@baylibre.com
>  v6: https://lore.kernel.org/r/20250421-topic-am62-partialio-v6-12-b4-v6-=
0-3b5cefab1339@baylibre.com
>  v7: https://lore.kernel.org/r/20250812-topic-am62-partialio-v6-12-b4-v7-=
0-ac10865c2d87@baylibre.com
>
> Previous versions "can: m_can: Add am62 wakeup support":
>  v1: https://lore.kernel.org/lkml/20240523075347.1282395-1-msp@baylibre.c=
om/
>  v2: https://lore.kernel.org/lkml/20240729074135.3850634-1-msp@baylibre.c=
om/
>  v3: https://lore.kernel.org/lkml/20241011-topic-mcan-wakeup-source-v6-12=
-v3-0-9752c714ad12@baylibre.com
>  v4: https://lore.kernel.org/r/20241015-topic-mcan-wakeup-source-v6-12-v4=
-0-fdac1d1e7aa6@baylibre.com
>  v5: https://lore.kernel.org/r/20241028-topic-mcan-wakeup-source-v6-12-v5=
-0-33edc0aba629@baylibre.com
>  v6: https://lore.kernel.org/r/20241219-topic-mcan-wakeup-source-v6-12-v6=
-0-1356c7f7cfda@baylibre.com
>
> Changes in v8:
>  - Add a patch to remove constant 0 argument passing to
>    ti_sci_cmd_prepare_sleep
>  - Move partial-io functions further up in the file before the first
>    static const initializations
>
> Changes in v7:
>  - Rebase to v6.17-rc1
>  - Update the idle-state-name used to off-wake as introduced in
>    dt-schema
>
> Changes in v6:
>  - Narrowed down the wakeup-source binding to phandle lists
>  - Split off the mcan and DT changes into separate series
>
> Changes in v5:
>  - Rebased to v6.14-rc1
>  - Merged m_can and ti_sci series to avoid conflicts and show
>    dependencies more easily
>  - Added definitions of system-states for am62/am62a/am62p
>  - Moved wakeup-source definitions into board dts files as they require
>    a bit of support on the board.
>  - Updated ti_sci support to walk through the wakeup-source phandle
>    lists
>  - Added pinctrl settings for mcu_mcan0/1 on all boards
>  - Minor style updates for ti_sci support for transfers without response
>  - Update and move the dt-binding for wakeup-source from the m_can
>    binding to the dt-schema repository
>
> Changes in v4:
>  - Rebased to v6.13-rc1
>  - Removed all regulator related structures from patches and implemented
>    the wakeup-source property use instead.
>
> Changes in v3:
>  - Remove other modes declared for PREPARE_SLEEP as they probably won't
>    ever be used in upstream.
>  - Replace the wait loop after sending PREPARE_SLEEP with msleep and do
>    an emergency_restart if it exits
>  - Remove uarts from DT wakeup sources
>  - Split no response handling in ti_sci_do_xfer() into a separate patch
>    and use goto instead of if ()
>  - Remove DT binding parital-io-wakeup-sources. Instead I am modeling
>    the devices that are in the relevant group that are powered during
>    Partial-IO with the power supplies that are externally provided to
>    the SoC. In this case they are provided through 'vddshv_canuart'. All
>    devices using this regulator can be considered a potential wakeup
>    source if they are wakeup capable and wakeup enabled.
>  - Added devicetree patches adding vcc_3v3_sys regulator and
>    vddshv_canuart for am62-lp-sk
>  - Add pinctrl entries for am62-lp-sk to add WKUP_EN for mcu_mcan0 and
>    mcu_mcan1
>
> Changes in v2:
>  - Rebase to v6.11-rc1
>  - dt-binding:
>     - Update commit message
>     - Add more verbose description of the new binding for a better
>       explanation.
>  - ti_sci driver:
>     - Combine ti_sci_do_send() into ti_sci_do_xfer and only wait on a
>       response if a flag is set.
>     - On failure to enter Partial-IO, do emergency_restart()
>     - Add comments
>     - Fix small things
>
> Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
> ---
> Markus Schneider-Pargmann (TI.com) (3):
>       firmware: ti_sci: Remove constant 0 function arguments
>       firmware: ti_sci: Support transfers without response
>       firmware: ti_sci: Partial-IO support
>
>  drivers/firmware/ti_sci.c | 154 ++++++++++++++++++++++++++++++++++++++++=
++----
>  drivers/firmware/ti_sci.h |   5 ++
>  2 files changed, 146 insertions(+), 13 deletions(-)
> ---
> base-commit: 24c4d4041c2ec11c47baf6ea54f9379cf88809fc
> change-id: 20241008-topic-am62-partialio-v6-12-b4-c273fbac4447
> prerequisite-change-id: 20241009-topic-mcan-wakeup-source-v6-12-8c1d69931=
bd8:v10
> prerequisite-patch-id: 40ff771d13dccae91c04ab120aa1b5e406b66e47
> prerequisite-patch-id: 830b339ea452edd750b04f719da91e721be630cb
> prerequisite-patch-id: 2c9142d2bc47e64c49b7b8a7ca20a62a0be14870
> prerequisite-patch-id: aa64f7e9fcc3fcbb3cb871a05a07f398f3aa8231
> prerequisite-change-id: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17=
da:v3
> prerequisite-patch-id: 707e4619d7b844e1b67ccde28b4484b7b0d27daa
> prerequisite-patch-id: 412feb5d3fc125e489d11b726c0b2d8fd5ff36f3
> prerequisite-patch-id: 4e3ed635267f9548b9ac7a9e440971bb1e54a5ee
> prerequisite-patch-id: 65704d9da41da1fa9fc647c185f412022a16acb5
> prerequisite-patch-id: 95a62b97efdac9bdf1921c1222acefac6e608c84
> prerequisite-patch-id: 87d82194bc278580ae54e8788b4508f743c61061
>
> Best regards,


--ca7df36c40fef4aef7d8884e97ac162d203f1e34b5b18ef9a0cb2f1f5dc0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaN5EDRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlOl
iwEA5jTiWFP9wpRuXvHetvfzF/s0L087Ei1AlhBbaQXrdwQA/Axf/qVXreqRzBvQ
2j7lSQf3/LEe9NgJclcklnbm+z0J
=0eG3
-----END PGP SIGNATURE-----

--ca7df36c40fef4aef7d8884e97ac162d203f1e34b5b18ef9a0cb2f1f5dc0--

