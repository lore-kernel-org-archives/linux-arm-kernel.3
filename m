Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF57ACA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jaeZUXyiGrsldqYS5tKIEFVGp6RxJthA7NJkOSmLZc=; b=YQANouGweKCHPWQvCWRSlfTOkq
	TLA6f84gIqF3dq9axvRYf4/wp6FZpV3JpmE562UuPmfxRZ9Q6rGejPhQ/WuzCO5p5YPol2Xsp8UVG
	J15UVEgQyhPMoPW9vBkLV0wrMNsclApzVRN1NzMsFTejmTLqaSuL6lBLU5xpbmBJ+qycUjxip04Lx
	IzbMLntRvhiGx06+X1sLipGX9jD4SbXsY2FAhD/FfUy52TgFHM1MMJP9S9gOlcTbcNm7fVQ3qTFpx
	f1tcb2mTTrEKKmxXC2FJWtzK2S6x/NqiNf1eBC0/cW8CX/zuM+mLjDGmhV0wTbw9xcm28s4Bv5PTl
	yUNzowOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6a-0000000G5j3-3iWK;
	Fri, 05 Sep 2025 02:23:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuJWl-0000000FBCk-2Zq1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 23:38:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A594A6028B
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 23:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D043C4CEF6
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 23:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757029082;
	bh=i+01YYY1wAETl8uPU7E8Ydrb8Pq90kKfcxjQN9XqHmY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s0tclXteDCYT7ZyezWUyvRUi0f5+96I4ovEgEgImvic6Dv+KBtSrWdbVnK2tqLq+c
	 zYTydfFUT5LZM1VFk21uICVuI/giz7wjdwFJDSQ+7tF8SQyT/UFWr8OkNG32WL00jx
	 /QjjqDhpXIf4Ou8VyU5G2Si6Xc/JFkS8Xr/RhxiV/fMjiaVTDLyeqa7LVm40D5+MMJ
	 Ree6mP727tgdQSBFo2kWqF5I0F28o8OGWGgfAVPskBIcOeCY4gtS7aoa894ol+jfND
	 5IU34nskxf63KG6x5GrV2FgGM356CeFuiYSwbStPpfHj1MAfafOS+mhmCbLLpkSD8g
	 6rpdd21u5PA0Q==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61e8fe26614so2909984a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 16:38:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7jxEX7jqC/zaE9kYTeE2NIVbENMMUZaYZtAsC864Y4hNjOFt7zjf/paDatmRLjulotIaoSGXZ/bV+wtoxhG5J@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/Wjz3L6WZ1yKhcxV4Uy/uhPfAG0vRfanHFI37sYRL8K1FRZzO
	sDY8JmeSoeAoQ23Mqu/QmGEcnjLU8xlSBmA3Kff7/D1pnKu/dqJYC9FQ9EabL0bEPUCu7OFFw1G
	Ry2VBQRCb5IGBnxxttE6+6jFPmwBCVw==
X-Google-Smtp-Source: AGHT+IFFN6fk5YVg+B1Gm6YAlYwOQG6ufa/AOFFGb2DahNQbjmVf7LcAWNTuQcant4szK9wxkX0bXwvOq8gcg3FZDZM=
X-Received: by 2002:a05:6402:90a:b0:61e:1636:aeee with SMTP id
 4fb4d7f45d1cf-61e1636b01bmr14623674a12.38.1757029080874; Thu, 04 Sep 2025
 16:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250714-sti-rework-v2-0-f4274920858b@gmail.com> <20250714-sti-rework-v2-1-f4274920858b@gmail.com>
In-Reply-To: <20250714-sti-rework-v2-1-f4274920858b@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Sep 2025 18:37:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ0ckZ529gm781uF52yR3-gj2ctHR11hUK=4q8_Eq65EQ@mail.gmail.com>
X-Gm-Features: Ac12FXyVHTjBeXc1k7EZQPMmRZXJqAQXLxtZHtgAqDf9uO9vDCivi8C1SxLEoVo
Message-ID: <CAL_JsqJ0ckZ529gm781uF52yR3-gj2ctHR11hUK=4q8_Eq65EQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: sti: drop B2120 board support
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Russell King <linux@armlinux.org.uk>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jul 14, 2025 at 8:54=E2=80=AFAM Raphael Gallais-Pou
<rgallaispou@gmail.com> wrote:
>
> B2120 boards are internal boards which never were commercialised.
>
> Drop them.
>
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  arch/arm/boot/dts/st/Makefile           |   2 -
>  arch/arm/boot/dts/st/stih407-b2120.dts  |  27 -----
>  arch/arm/boot/dts/st/stih407.dtsi       | 145 ----------------------
>  arch/arm/boot/dts/st/stih410-b2120.dts  |  66 ----------
>  arch/arm/boot/dts/st/stihxxx-b2120.dtsi | 206 --------------------------=
------
>  5 files changed, 446 deletions(-)
>
> diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefil=
e
> index cc9948b9870f7f73629573149bfd342af75b07da..f57fc6dc48a00c9a9323b4508=
e5e4e161b197c47 100644
> --- a/arch/arm/boot/dts/st/Makefile
> +++ b/arch/arm/boot/dts/st/Makefile
> @@ -13,8 +13,6 @@ dtb-$(CONFIG_ARCH_SPEAR3XX) +=3D \
>  dtb-$(CONFIG_ARCH_SPEAR6XX) +=3D \
>         spear600-evb.dtb
>  dtb-$(CONFIG_ARCH_STI) +=3D \
> -       stih407-b2120.dtb \
> -       stih410-b2120.dtb \
>         stih410-b2260.dtb \
>         stih418-b2199.dtb \
>         stih418-b2264.dtb
> diff --git a/arch/arm/boot/dts/st/stih407-b2120.dts b/arch/arm/boot/dts/s=
t/stih407-b2120.dts
> deleted file mode 100644
> index 9c79982ee7ba8fadb1a2a92e732bf7f652b74c38..0000000000000000000000000=
000000000000000
> --- a/arch/arm/boot/dts/st/stih407-b2120.dts
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (C) 2014 STMicroelectronics (R&D) Limited.
> - * Author: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> - */
> -/dts-v1/;
> -#include "stih407.dtsi"
> -#include "stihxxx-b2120.dtsi"
> -/ {
> -       model =3D "STiH407 B2120";
> -       compatible =3D "st,stih407-b2120", "st,stih407";
> -
> -       chosen {
> -               stdout-path =3D &sbc_serial0;
> -       };
> -
> -       memory@40000000 {
> -               device_type =3D "memory";
> -               reg =3D <0x40000000 0x80000000>;
> -       };
> -
> -       aliases {
> -               serial0 =3D &sbc_serial0;
> -               ethernet0 =3D &ethernet0;
> -       };
> -
> -};
> diff --git a/arch/arm/boot/dts/st/stih407.dtsi b/arch/arm/boot/dts/st/sti=
h407.dtsi
> deleted file mode 100644
> index aca43d2bdaad44ef2a0e8a120c679c217709af44..0000000000000000000000000=
000000000000000
> --- a/arch/arm/boot/dts/st/stih407.dtsi
> +++ /dev/null
> @@ -1,145 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (C) 2015 STMicroelectronics Limited.
> - * Author: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> - */
> -#include "stih407-clock.dtsi"

Looks like this file is unused now too and can be removed.

Rob

