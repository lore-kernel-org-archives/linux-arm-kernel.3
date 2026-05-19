Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7FFCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5YvULhhts6qX2IWUm0kkAdZMFsRNKK4rnVt+gyCyWw=; b=Ee4RZaN7JUukJCDYhgTv4yCzvl
	SHCXkg6wyos/ViTDob3KZphdBzQXNDN7dXmta3507no3X2euX6VuMJLKcxxaJNROdPS1wZ3OVgPTu
	mztIC2ZMxEvVxtXk/XJ8iXXZv7MWcjeyllPVmnWsFlFavmMb60B7c0DufUpikInWkKYe7aPxDvZhZ
	lIxyTKRCGLFglaWEhiHrC0lst/xTajDWxFWSk6IPqduLSFMhnXlAG+q9mmaebbfDmVvwIaOTPneir
	YM7DFqwbR1Nl/LQoUZfTYkciFROyjxugDYNAN/Aiov4CrCFZEKOFthiWUwxUDvpgUnVuh22waqnDZ
	iYFwItqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKUh-00000001eoY-0HzN;
	Tue, 19 May 2026 13:28:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKUW-00000001eiI-23CD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779197291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5YvULhhts6qX2IWUm0kkAdZMFsRNKK4rnVt+gyCyWw=;
	b=KD+w3mAyrGtSs+o64fB8RNu1TX5ucMi1dX+9eK/9IeertgQeCswZ9w4I9Bh/ZqCB9KkOah
	pD2IBxI3NlttYeW1V1KFdnaI2PG56iDO/b5iKfth1mPEaCyIQO43uUKNbpRs/rijYOyjvd
	YoInA6gTNk8gh/p7hxeqi86REhRs95c=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-XEVhBtc9Ot-MhzZTTovKGQ-1; Tue, 19 May 2026 09:28:09 -0400
X-MC-Unique: XEVhBtc9Ot-MhzZTTovKGQ-1
X-Mimecast-MFC-AGG-ID: XEVhBtc9Ot-MhzZTTovKGQ_1779197288
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5a871871c5bso293288e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197288; x=1779802088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u5YvULhhts6qX2IWUm0kkAdZMFsRNKK4rnVt+gyCyWw=;
        b=DmVYwG+dq5TtXvSJlX0Tipj7U3Q4o9Rj5NdsHqGsJRVlVyZhhx/eiAWl5WF8iKRi4T
         T+NHTT4jCwZ5HcHOH/wRLib9SrmhdsUoZYYko++7MdP6RXAZ0miBkEuoSq11JAyqmxZJ
         Z3RwAkWEugIpjTblC40/loaX2qGaKI0ztbPydlDOhsTsuknev8t8aSmlv0KJDdwjKFyo
         KdAS/oVs1sSQxllA1GlYxJ7qKmfAxH/AcFQbGsM4lsc6wFzopcumJTjERQxiWpt0HTbc
         gdL7ptdQbseaSynzmgv0kgaWKwWau/C7tXMSFg6PqywG9Z9BqQtV2xAX4oyihi01lMGG
         gSyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+n/yn2VnPb2MIlZ6uhrkTMwLe+u3JUyW/cLtupmWK1UqbAypjyAVv0quVN+GCQARVj531b6EsHkWXgiV0Gg/fz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2gtIX+3zXwWZHuAToG7MxN1Hwd0oAOVJYaYAcQLL2IdQ3WmD6
	g3YGksz1WbomhmnHJbg3c1dGwSPP8SDW+zF3O2MeF5WwvIIbzaaBIQNvuoGGWSqukZkabEKy2FN
	VziBkZeSDhbr8usJrzEBUUG4gZj6c1k25FeNaP5cTiQQ+qibSvj+QVdCuuqaJzibHgf+Pd9N+8H
	aWSvtm3uitL3dHpjqaxAyxEDeVynaUkMyYx2Oi2/G0MC5Vn84ud28=
X-Gm-Gg: Acq92OELOOWe7W2TiTPIFcGPOLwa+UVzukz0JJALYsQX51F3HnPW9sqmgA5ZPQWcb+O
	XA5ObMro+2OIU5Gf9y6YupFdRKpSXwZdB2/zfAlX9zHIzuOKZl2/U6dnWDK2MIjSrozmgC2nABZ
	x9+35TdugjMrgqj17DRWUVX88hwuDOYM3wZNvQ36GJsygvqW8e56L9PbrkS46lhQ7fTf72tS6MX
	jLSAg==
X-Received: by 2002:a05:6512:3409:b0:5a8:7396:63e3 with SMTP id 2adb3069b0e04-5aa0e74a2cdmr2307644e87.5.1779197287920;
        Tue, 19 May 2026 06:28:07 -0700 (PDT)
X-Received: by 2002:a05:6512:3409:b0:5a8:7396:63e3 with SMTP id
 2adb3069b0e04-5aa0e74a2cdmr2307625e87.5.1779197287356; Tue, 19 May 2026
 06:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260514082639.1181240-1-khristineandreea.barbulescu@oss.nxp.com> <20260514082639.1181240-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260514082639.1181240-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 19 May 2026 15:27:55 +0200
X-Gm-Features: AVHnY4JqE7oGhtd31y_8FQnK1agHYemkPRFMHImGIc2hHQQvFQ7fi52Nv9jZBbM
Message-ID: <CALE0LRuk2J-BHNytia52xuKm-SU4ukCiP-Ow2rU9bRMfdhh4kg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: s32g: add SAR ADC support for s32g2
 and s32g3
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rliQhXJhGGdF_8oVbgbYzIfsGd6bd0jSCSjx0wBgjng_1779197288
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_062812_614871_3E174968 
X-CRM114-Status: GOOD (  15.99  )
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

Hi,

On Thu, May 14, 2026 at 10:26=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Add ADC0 and ADC1 for S32G2 and S32G3 SoCs.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>

Thanks,
   Enric

> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 22 +++++++++++++++++++++-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 22 +++++++++++++++++++++-
>  2 files changed, 42 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 51d00dac12de..6f1952fbbcfe 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -3,7 +3,7 @@
>   * NXP S32G2 SoC family
>   *
>   * Copyright (c) 2021 SUSE LLC
> - * Copyright 2017-2021, 2024-2025 NXP
> + * Copyright 2017-2021, 2024-2026 NXP
>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -554,6 +554,16 @@ i2c2: i2c@401ec000 {
>                         status =3D "disabled";
>                 };
>
> +               adc0: adc@401f8000 {
> +                       compatible =3D "nxp,s32g2-sar-adc";
> +                       reg =3D <0x401f8000 0x1000>;
> +                       interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 0x41>;
> +                       dmas =3D <&edma0 0 32>;
> +                       dma-names =3D "rx";
> +                       status =3D "disabled";
> +               };
> +
>                 swt4: watchdog@40200000 {
>                         compatible =3D "nxp,s32g2-swt";
>                         reg =3D <0x40200000 0x1000>;
> @@ -717,6 +727,16 @@ i2c4: i2c@402dc000 {
>                         status =3D "disabled";
>                 };
>
> +               adc1: adc@402e8000 {
> +                       compatible =3D "nxp,s32g2-sar-adc";
> +                       reg =3D <0x402e8000 0x1000>;
> +                       interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 0x41>;
> +                       dmas =3D <&edma1 1 32>;
> +                       dma-names =3D "rx";
> +                       status =3D "disabled";
> +               };
> +
>                 usdhc0: mmc@402f0000 {
>                         compatible =3D "nxp,s32g2-usdhc";
>                         reg =3D <0x402f0000 0x1000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index e314f3c7d61d..5cfb37c1216a 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2021-2025 NXP
> + * Copyright 2021-2026 NXP
>   *
>   * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>   *          Ciprian Costea <ciprianmarian.costea@nxp.com>
> @@ -617,6 +617,16 @@ i2c2: i2c@401ec000 {
>                         status =3D "disabled";
>                 };
>
> +               adc0: adc@401f8000 {
> +                       compatible =3D "nxp,s32g3-sar-adc", "nxp,s32g2-sa=
r-adc";
> +                       reg =3D <0x401f8000 0x1000>;
> +                       interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 0x41>;
> +                       dmas =3D <&edma0 0 32>;
> +                       dma-names =3D "rx";
> +                       status =3D "disabled";
> +               };
> +
>                 swt4: watchdog@40200000 {
>                         compatible =3D "nxp,s32g3-swt", "nxp,s32g2-swt";
>                         reg =3D <0x40200000 0x1000>;
> @@ -792,6 +802,16 @@ i2c4: i2c@402dc000 {
>                         status =3D "disabled";
>                 };
>
> +               adc1: adc@402e8000 {
> +                       compatible =3D "nxp,s32g3-sar-adc", "nxp,s32g2-sa=
r-adc";
> +                       reg =3D <0x402e8000 0x1000>;
> +                       interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 0x41>;
> +                       dmas =3D <&edma1 1 32>;
> +                       dma-names =3D "rx";
> +                       status =3D "disabled";
> +               };
> +
>                 usdhc0: mmc@402f0000 {
>                         compatible =3D "nxp,s32g3-usdhc",
>                                      "nxp,s32g2-usdhc";
> --
> 2.34.1
>


