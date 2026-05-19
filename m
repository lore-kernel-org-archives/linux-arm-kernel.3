Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50D9CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSZwixHkv2muy60wUJhbvc6cwMeXT0Usg6Pp1th8RbU=; b=E08QJE6E+W0GdAYRMs4zeo2WNn
	f3xV29zmaALs8KDEe51+h4Qex6L1wv7ZVMaKKuXIVntXhA2qmtcOEMBGHb2pzF/+na3ObjJA0gyl1
	AOXIywhuLPLl9cHmMBLlygYOzgyE+dkTGS7WlW7oJ6973248/+oG7A5w5hJYIVVby5SxEAbFLPEIw
	0x4N1Uk6TJ664NzCW9haDQS/Sgl3Y2o+X/v4aDI7Nr1opyxUYbn7mnz+Pizdkk75ok/hsG2ceedoN
	GzFYqGoN2vuUvNi9IXM7ZRU+aYxoKV9VjDNcA7QC+LHoqzNulsrFwwBLwcotYiHDW02oE2BE+l8Fn
	EuizRoIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKQ0-00000001dly-2hBf;
	Tue, 19 May 2026 13:23:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKPx-00000001dl6-1UwT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779197008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vSZwixHkv2muy60wUJhbvc6cwMeXT0Usg6Pp1th8RbU=;
	b=PTRwdLdYPq43nqeFzXh2Uz3MI2Xv9/pqoBEcFO59egeipceMgpJrW/PXRDDdLvlS2wI3cN
	eJV1KA7Omzj0Anmkgfm+AjyWSQY61n2RkRKF0PSsjW5z0sv2dgpyqXY/RHZ4oz+jnH90Oo
	9eBs8j2x4bisKZcYIDZmqSpDrKai8Q0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-mxtMDtrCOXqnSix08YF27w-1; Tue, 19 May 2026 09:23:22 -0400
X-MC-Unique: mxtMDtrCOXqnSix08YF27w-1
X-Mimecast-MFC-AGG-ID: mxtMDtrCOXqnSix08YF27w_1779197001
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5a3fe7e7c94so218833e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197000; x=1779801800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vSZwixHkv2muy60wUJhbvc6cwMeXT0Usg6Pp1th8RbU=;
        b=FHYui007ABTyUiVHFqCn9OQIdOg0d8GOPUbmXPYRe/6/qiDUqi5bPstdeb0dndOAOT
         9AnPXFDuIln2BwjmsadRFOJ4yc5eyueTZzWPPng2qDkMf4gCyYMlOnejvhBh1DV+ruKm
         fi8cmc9OaJMoy8Z2NtpcIzM9ELsN7C3pxEwt0W8lEs0g0oZVpRv6yEHPIi0rmVF6Oo2G
         PMSRBswrnTbkqBSRlLBXIxX0o2DVLBbBzzy3ZaFiNH9eFM+kJ1ZQigbyYNyyeMPCMcOS
         FACwFr7HxNZxNLXGSaKCjgZ835WTd/d4pOuLI65BnoWPntt/1zOI57NQcdiv8FmnBNfC
         GDyw==
X-Forwarded-Encrypted: i=1; AFNElJ91/aGgMs1+92oHVwbpmyT8aQ2/ro3WKESF/ZgVx6tEoddNtsx/A4YTkuWQ6mqBYwzPDGDBT4gbd3C4e0++vP53@lists.infradead.org
X-Gm-Message-State: AOJu0YxRuG1aIaJLPC6QDncmd9LqDySHHhlVHRjg8HGXWBSlZCCk/UQB
	l2mVaSmgPtcmsA840V61/HtBJnoWX51Vdxni3BogwDBn9qu7yYJyfAGhIJrqW0npAQip0XvLEdu
	ZImi2nAZQKwYN1Wa2JqpMhGb4GkJII/960nEK2yMnNProbZwgPTNHWkmFPLPitaeUJndjoZjTfw
	nPEw6AX9iw0GuHEWWRNyysFyYq3g2pNArr0NDolspkMwdrHMqhQEc=
X-Gm-Gg: Acq92OH7YRwz8dB3W/ld/F/bY1BhRuK223Owuj2yHT9PdJCMOkA0UQ+KLChivG1wnah
	Sw7gIXDslj4PaBe6zceMaCrdxs6DM5TQrOBJN9SRrmhl71cmJi+8zOdG3WSD5UhAd8qRp7sOABI
	T+genZanPqbNFJH7F//mg9FMq9rFb4qhBysTjL1FTnZBGtkHXBMs0u6/a3UyIeYvuEwi4yqyap+
	IBhFQ==
X-Received: by 2002:a05:651c:881:b0:395:9f86:b433 with SMTP id 38308e7fff4ca-3959f86b5bamr7821341fa.6.1779197000476;
        Tue, 19 May 2026 06:23:20 -0700 (PDT)
X-Received: by 2002:a05:651c:881:b0:395:9f86:b433 with SMTP id
 38308e7fff4ca-3959f86b5bamr7821311fa.6.1779196999921; Tue, 19 May 2026
 06:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260518063547.2890353-1-khristineandreea.barbulescu@oss.nxp.com> <20260518063547.2890353-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260518063547.2890353-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 19 May 2026 15:23:08 +0200
X-Gm-Features: AVHnY4Ku0WK3_tTMCuY00U13A1ewKmhxwVXJEJLHH0cS_8oPrxB1SflVfjvcxDY
Message-ID: <CALE0LRss3eXM-+sA9VzpvKnv-UsHh0X_SWBRBYKDP3-1i=svsw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: s32g: add PIT support for s32g2 and s32g3
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 28yrpgW6DC1SzMynOdCBCnYbAq0knsmXYUetkArePQA_1779197001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_062329_463591_38CA72CD 
X-CRM114-Status: GOOD (  16.47  )
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

Somewhat related I'd appreciate a review to:

https://lore.kernel.org/all/20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat=
.com/

The changes looks good to me, so

On Mon, May 18, 2026 at 8:36=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Add PIT0 and PIT1 for S32G2 and S32G3 SoCs
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>

Thanks,
   Enric

> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 20 +++++++++++++++++++-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 20 +++++++++++++++++++-
>  2 files changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 51d00dac12de..57ff97e44507 100644
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
> @@ -417,6 +417,15 @@ edma0: dma-controller@40144000 {
>                         clock-names =3D "dmamux0", "dmamux1";
>                 };
>
> +               pit0: pit@40188000 {
> +                       compatible =3D "nxp,s32g2-pit";
> +                       reg =3D <0x40188000 0x3000>;
> +                       interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 61>;
> +                       clock-names =3D "pit";
> +                       status =3D "disabled";
> +               };
> +
>                 can0: can@401b4000 {
>                         compatible =3D "nxp,s32g2-flexcan";
>                         reg =3D <0x401b4000 0xa000>;
> @@ -622,6 +631,15 @@ edma1: dma-controller@40244000 {
>                         clock-names =3D "dmamux0", "dmamux1";
>                 };
>
> +               pit1: pit@40288000 {
> +                       compatible =3D "nxp,s32g2-pit";
> +                       reg =3D <0x40288000 0x3000>;
> +                       interrupts =3D <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 61>;
> +                       clock-names =3D "pit";
> +                       status =3D "disabled";
> +               };
> +
>                 can2: can@402a8000 {
>                         compatible =3D "nxp,s32g2-flexcan";
>                         reg =3D <0x402a8000 0xa000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index e314f3c7d61d..efe5398e1240 100644
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
> @@ -475,6 +475,15 @@ edma0: dma-controller@40144000 {
>                         clock-names =3D "dmamux0", "dmamux1";
>                 };
>
> +               pit0: pit@40188000 {
> +                       compatible =3D "nxp,s32g3-pit", "nxp,s32g2-pit";
> +                       reg =3D <0x40188000 0x3000>;
> +                       interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 61>;
> +                       clock-names =3D "pit";
> +                       status =3D "disabled";
> +               };
> +
>                 can0: can@401b4000 {
>                         compatible =3D "nxp,s32g3-flexcan",
>                                            "nxp,s32g2-flexcan";
> @@ -693,6 +702,15 @@ edma1: dma-controller@40244000 {
>                         clock-names =3D "dmamux0", "dmamux1";
>                 };
>
> +               pit1: pit@40288000 {
> +                       compatible =3D "nxp,s32g3-pit", "nxp,s32g2-pit";
> +                       reg =3D <0x40288000 0x3000>;
> +                       interrupts =3D <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 61>;
> +                       clock-names =3D "pit";
> +                       status =3D "disabled";
> +               };
> +
>                 can2: can@402a8000 {
>                         compatible =3D "nxp,s32g3-flexcan",
>                                            "nxp,s32g2-flexcan";
> --
> 2.34.1
>


