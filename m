Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36B5CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 18:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCqkedhq8gefJ0vq9o5JT8van1611cBRTjmA+ft6YH8=; b=B78beHa21w33VpKs5LhCVlBlML
	A3gZ6XlPFP6rhLsnuQrBjbdjm++i/PXdlZKCMXrsIzpV0uL98HRy8KU9zlqbY969FzAU23mMu56Nx
	uqHsJxJMgB43AJdLgppc7pjSOSi0AsVXpmI/NutrBJh5BMk1VaXEvBrvlgN5br4JAzv5yKnIieKP+
	0zEG3a3SYHTtwVkn/NGug5PI/hfYBRMEuAGNIs4evvfuF+t0+vmErJcaUJwFAZE0A5J0XXccuyLab
	m1p+zI2W25a6UtJFv6PdHjMhMAOuRvEPreRGIIz4mPxeb+fjtVGIS8POWaCGCwhTAjzb/RdMOjvxK
	FrOXyyGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDoOC-0000000GUdW-1fAW;
	Tue, 28 Oct 2025 18:25:48 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDoOA-0000000GUcT-0vbn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 18:25:47 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b6dbb4a209aso291101866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 11:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761675944; x=1762280744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCqkedhq8gefJ0vq9o5JT8van1611cBRTjmA+ft6YH8=;
        b=MeQp/I1cpewUV09YDcWK3jkBvXkesULmozcuTna+rKkGfN5bhOjlw92S0we5W4U1Fw
         MAc3j9N803Fh7bjgrADXZR9MVK61H+g5z7DRO2XVPiDa2yfJtATx+Ula0WxY5NrWjJcc
         mdkFSn8yjCnoSnzh/naxam0htei/vsiZrpA+TsDEXkzqw5tOdBjokId1vYuskwINmt84
         1rdPSLz7t6CETl2D0cXGYWs8pAU6S/L7aKWwY2G93pQmzcKY36vxGPUZGVoU75PF9Ay6
         KbJI0yMFU8O/fIClPvgOFC7ub4BoY/JS09BDrHE8tBgHfI0fspoEgoPo2lSRZRdWZXUZ
         6qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761675944; x=1762280744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCqkedhq8gefJ0vq9o5JT8van1611cBRTjmA+ft6YH8=;
        b=O9iqeOkLKSzSPuBx98In6T0c16SovpoPPnRuvsC/9sB+FX0nuz7/rzhyhspq1QZB0+
         cf8UyBFZmkxM9mSWFB5pJKpKZK+hSY92ArU1Gtw5MjxhRbzC8dfWAD5mU41Ubgqaf7PP
         423lrAf69/MvOmmFiVo/eB463fRro1v30XzIUji9Zi/FPzNtZj/6aEOesPrwKh5WCZ4s
         ikSxABYBaB1PYx28WeKB09j4HfS21ocnAd79s0uhy8j/dxe5shPDcrHnupJPc26YhboN
         OCD88GQMmIIezlIiSqi/o/dav6W3D/Lq6zwkIyVoPoGq+M+7klhnG81NnrWJ1ZmvSK5V
         IQ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaUBCdPYNQv3pYFmZqkAcWvRoXISbPg0R8NXhsh1yYV9GbNWYnuLCldgmF9RIVE06MJnNxuLZtoOtCA6KHv40b@lists.infradead.org
X-Gm-Message-State: AOJu0YxqjOul/HspPXop6Zd8bR94BDbIoxBqyEtBNA0G4WfvNx5ETFp1
	C+gTmtMl9JsT5ob+aUwgb6gSnpLXuKZk3BwTRVy6Vw4QFox60YX/S9SG78zC9nE9ZccmV6uvUCb
	63omMq/jHnrTxY4Chc6CUfcFgx7uZPRc=
X-Gm-Gg: ASbGncv3kaygP3aU0MalSYzCVLQZEziTK8yFSr2RBw+6dmPyR1IBR4VBpssGjTCKsW+
	9bXhmkdFUf19Ezpp4by5nzazYHe/+SWRyMHcwtjMDbkTuMvpY6kBcdyJ7zAKkF82RINZED+qvwL
	lsyUOTKFs5/tQwLQmP2jI/EJSYEPBIdX73UlLPT8ebend4AXCvfF02hYjW44sHwomAP5Wvi+VBd
	+zPxDr70EI9y3qlpmuo4lIRL0cr+tnfef1AnJxIS26goMtvSXzt/AqN2XAi
X-Google-Smtp-Source: AGHT+IHUN9iAMdCMTe6iKPq3e6j4mC/AjCVKjhKIhI0duJ1VlADSpP0NivnP3lrSv3tcevZNdZbSiCNvU3n7YE5rU4Q=
X-Received: by 2002:a17:907:6d0d:b0:b04:1249:2b24 with SMTP id
 a640c23a62f3a-b703290dd00mr58549566b.37.1761675944176; Tue, 28 Oct 2025
 11:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com> <20251002-c55-v12-4-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-4-3eda2dba9554@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 Oct 2025 18:25:17 +0000
X-Gm-Features: AWmQ_bm2B_mhjyhjxwffXBBORyZZbcAxcXJ9p2Wws_R9xPcbz_GEzTbnOC3k5mM
Message-ID: <CA+V-a8t8H9rYmXtrMrEvnx6otoktK=EFptZndYLTFCc9qM_mKg@mail.gmail.com>
Subject: Re: [PATCH v12 04/15] media: uapi: Add controls for Mali-C55 ISP
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, 
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, robh+dt@kernel.org, 
	mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_112546_306930_22D0B1A9 
X-CRM114-Status: GOOD (  29.33  )
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

On Thu, Oct 2, 2025 at 11:19=E2=80=AFAM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> Add definitions and documentation for the custom control that will
> be needed by the Mali-C55 ISP driver. This will be a read only
> bitmask of the driver's capabilities, informing userspace of which
> blocks are fitted and which are absent.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v12:
>
>         - Removed _FITTED suffix from control value names
>         - Specified bitmask for control name
>         - Used (1 << n) instead of BIT(n) in uapi header
>         - Updated comment to reserve 16 controls for driver
>
> Changes in v11:
>
>         - None
> Changes in v10:
>
>         - None
>
> Changes in v9:
>
>         - New patch
> ---
>  .../userspace-api/media/drivers/index.rst          |  1 +
>  .../userspace-api/media/drivers/mali-c55.rst       | 55 ++++++++++++++++=
++++++
>  include/uapi/linux/media/arm/mali-c55-config.h     | 26 ++++++++++
>  include/uapi/linux/v4l2-controls.h                 |  6 +++
>  4 files changed, 88 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Docume=
ntation/userspace-api/media/drivers/index.rst
> index d706cb47b1122b6e145a02ab826eb3ecc7997c2b..02967c9b18d6e90f414ccc132=
9c09bffee895e68 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -32,6 +32,7 @@ For more details see the file COPYING in the source dis=
tribution of Linux.
>         cx2341x-uapi
>         dw100
>         imx-uapi
> +       mali-c55
>         max2175
>         npcm-video
>         omap3isp-uapi
> diff --git a/Documentation/userspace-api/media/drivers/mali-c55.rst b/Doc=
umentation/userspace-api/media/drivers/mali-c55.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..74f2cdb717e0dddeb11fb1eab=
a69eeebb2534f95
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/mali-c55.rst
> @@ -0,0 +1,55 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Arm Mali-C55 ISP driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The Arm Mali-C55 ISP driver implements a single driver-specific control:
> +
> +``V4L2_CID_MALI_C55_CAPABILITIES (bitmask)``
> +    Detail the capabilities of the ISP by giving detail about the fitted=
 blocks.
> +
> +    .. flat-table:: Bitmask meaning definitions
> +       :header-rows: 1
> +       :widths: 2 4 8
> +
> +       * - Bit
> +         - Macro
> +         - Meaning
> +        * - 0
> +          - MALI_C55_GPS_PONG
> +          - Pong configuration space is fitted in the ISP
> +        * - 1
> +          - MALI_C55_GPS_WDR
> +          - WDR Framestitch, offset and gain is fitted in the ISP
> +        * - 2
> +          - MALI_C55_GPS_COMPRESSION
> +          - Temper compression is fitted in the ISP
> +        * - 3
> +          - MALI_C55_GPS_TEMPER
> +          - Temper is fitted in the ISP
> +        * - 4
> +          - MALI_C55_GPS_SINTER_LITE
> +          - Sinter Lite is fitted in the ISP instead of the full Sinter =
version
> +        * - 5
> +          - MALI_C55_GPS_SINTER
> +          - Sinter is fitted in the ISP
> +        * - 6
> +          - MALI_C55_GPS_IRIDIX_LTM
> +          - Iridix local tone mappine is fitted in the ISP
> +        * - 7
> +          - MALI_C55_GPS_IRIDIX_GTM
> +          - Iridix global tone mapping is fitted in the ISP
> +        * - 8
> +          - MALI_C55_GPS_CNR
> +          - Colour noise reduction is fitted in the ISP
> +        * - 9
> +          - MALI_C55_GPS_FRSCALER
> +          - The full resolution pipe scaler is fitted in the ISP
> +        * - 10
> +          - MALI_C55_GPS_DS_PIPE
> +          - The downscale pipe is fitted in the ISP
> +
> +    The Mali-C55 ISP can be configured in a number of ways to include or=
 exclude
> +    blocks which may not be necessary. This control provides a way for t=
he
> +    driver to communicate to userspace which of the blocks are fitted in=
 the
> +    design.
> \ No newline at end of file
> diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uap=
i/linux/media/arm/mali-c55-config.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..7fddece54ada9dadc3c76372d=
496d9395237a41c
> --- /dev/null
> +++ b/include/uapi/linux/media/arm/mali-c55-config.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * ARM Mali-C55 ISP Driver - Userspace API
> + *
> + * Copyright (C) 2023 Ideas on Board Oy
> + */
> +
> +#ifndef __UAPI_MALI_C55_CONFIG_H
> +#define __UAPI_MALI_C55_CONFIG_H
> +
> +#include <linux/v4l2-controls.h>
> +
> +#define V4L2_CID_MALI_C55_CAPABILITIES (V4L2_CID_USER_MALI_C55_BASE + 0x=
0)
> +#define MALI_C55_GPS_PONG              (1U << 0)
> +#define MALI_C55_GPS_WDR               (1U << 1)
> +#define MALI_C55_GPS_COMPRESSION       (1U << 2)
> +#define MALI_C55_GPS_TEMPER            (1U << 3)
> +#define MALI_C55_GPS_SINTER_LITE       (1U << 4)
> +#define MALI_C55_GPS_SINTER            (1U << 5)
> +#define MALI_C55_GPS_IRIDIX_LTM                (1U << 6)
> +#define MALI_C55_GPS_IRIDIX_GTM                (1U << 7)
> +#define MALI_C55_GPS_CNR               (1U << 8)
> +#define MALI_C55_GPS_FRSCALER          (1U << 9)
> +#define MALI_C55_GPS_DS_PIPE           (1U << 10)
> +
> +#endif /* __UAPI_MALI_C55_CONFIG_H */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index 2d30107e047ee3cf6b149e5b075cc9d4137b7d3f..f84ed133a6c9b2ddc1aedbd58=
2ddf78cb71f34e5 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -228,6 +228,12 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_RKISP1_BASE              (V4L2_CID_USER_BASE + 0x1=
220)
>
> +/*
> + * The base for the Arm Mali-C55 ISP driver controls.
> + * We reserve 16 controls for this driver
> + */
> +#define V4L2_CID_USER_MALI_C55_BASE            (V4L2_CID_USER_BASE + 0x1=
230)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */
>
> --
> 2.43.0
>
>

