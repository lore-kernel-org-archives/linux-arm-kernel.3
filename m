Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BA0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 17:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CKM2cs1qGXFMlOy1JK4RKIIOdS1MYoTVq0pqbGBT8I=; b=lkMidq22h7l0xcd8DqKqEDFBUA
	/8bERXrCjDCTKbyC7DLTFW/5730xv2p96dn3fjeSo4YtSiIEewLkdpFb/vBLqbcAkpGbg58u5rcrl
	Yw5vVi60hNqve2I/dsYVXvinjRuIRuxLr9F27uEDuHQw3qdTUz7GHXCJLKUnveJuLg8W+vCJ+UXnX
	/u7JiYU8+yBldflSZVEBNm1wUhLy08aHxy0A02JxYxdiEKoIIu9Wj/gpm0CVOfholD4OFevY+ZFF2
	D+ZKCVUYLWCwUF2F5hFxVbMEBq84kWCAnnkR2JbI2PmASk7MPh0ggxPXfzeq2bNxl9O+KM8df7DZh
	8ayl1Z8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u807d-0000000Er6s-0Ge7;
	Thu, 24 Apr 2025 17:12:25 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ztQ-0000000EpST-26tJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 16:57:45 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e6deb3eb7dbso1094814276.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745513863; x=1746118663; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9CKM2cs1qGXFMlOy1JK4RKIIOdS1MYoTVq0pqbGBT8I=;
        b=PPcVg+3tS19QvUjCd7UiL5lqwBulRbllnfd0WOPJPE7b1uF4OwU4TThy9KgX6pqQPv
         3ORyXbdLZTZuMjzM4K0+zOMftdAgpOr6mPXoNk85dHJui2UEq4O5blqxzFVngR+2L6ky
         eIyk6CRLUwQrTmZn7NMuuqI+BMcoP5MBBV2KeJ2lFmfkPOrjY2RWB6h9oBGO/udYSyp+
         IqDIXFpLJQ3Fd87Y09lvPhZbagI9qF/TiAGDIwidIiMmPFa3DGu2N6mJQoEjqKzLazSs
         gOCe6ftfnGZC8X8RPKUty7Lbmmqs4kUbaYCw3E6n5/WAM4N8H7kqqR5Ui1paQgLel9PW
         mMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513863; x=1746118663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9CKM2cs1qGXFMlOy1JK4RKIIOdS1MYoTVq0pqbGBT8I=;
        b=a3ZM33x1pGeWjcr4I5YZnIfl8TPEwIBhwIpPOu/K4X20qxijZDZDKb1UCWbzh0SPHL
         CZI1Hzp2EFR6O9rUVeplWOLIMnwWVjmZhAZTkcQXhqtr7lXJtIH6sX+Qbx8uK5NDqvNM
         dMZvYloGpibdKU08xbkJ96n2M5da4juxAs+rcpUi0FtUZE3MtGQhQSGrflOYNm/vvseB
         KV3vOBBFzy8+KhUiRdjuAfUsxatXy62rXiNHGd24BMYBiJ+Sxhvwx5HRPMqmiSbn1oM2
         9Tp9AA/M/mVTmfgNixMCGvWDEihtvK+56z1gRbRJrxWxQ+HxYSlICpG+R8Lw5BCgOirf
         SyEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVIWh56V5UhOugyPjgVbLDj98z9BjiN/g9VxMhKCLXvK0wB9h93KOzdMpuNAfX9zM6ToaZm0+zxMPGJTRUs5GU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9Xze4VWkTiFU1QV8P0l48PfqkGcj2kXHw4ukkqZINjmRNTl46
	KXnZiBMudx7F1j7UJIFHb1P9Lw3Hx4JYEJjjBMgvyu6lvGar8hhAguhiWSXPEccbWTsfPMSNrzL
	CGYXvn03XuTciGkIq8jte8CbjqoK/jEzPAW5DCA==
X-Gm-Gg: ASbGnct2rKxkOncJgDTmmVR+fzs4ZytQ1zZn6YSRRNER7H9irI2SUQdVnXSUHq5o4PR
	h1Pjnqfu2HyJAKnagDs/G3q036hk1bXATmUHp+U9N/2a8+7kK8BPI4DzqcN5mrp/yA/tO9zj+RG
	xLNarpFMUfcbm6WKd7mIbV+0Y=
X-Google-Smtp-Source: AGHT+IFGTdWSdsZcdsNen5sZq4wJnWapLXpFuPlaVUGf+rGu5EnJXdabOZuRe3KyJ3ZRIkLzq1oum5ZWE02emFXzcCY=
X-Received: by 2002:a05:6902:1ac8:b0:e6d:ecbb:e530 with SMTP id
 3f1490d57ef6-e7312d44613mr185101276.27.1745513863337; Thu, 24 Apr 2025
 09:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250415032314.44997-1-kever.yang@rock-chips.com>
In-Reply-To: <20250415032314.44997-1-kever.yang@rock-chips.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Apr 2025 18:57:06 +0200
X-Gm-Features: ATxdqUGgd2BtezeD6Buv4aip6IDl4W4AEEpLnidEVI-YRjiR40IiiYl0lpXZjps
Message-ID: <CAPDyKFqdx+ZmEWJeyw3hAWXYhH4ibMK96FpJ5B2wfLC6QiOOAA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: power: rockchip: Add support for
 RK3562 SoC
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Finley Xiao <finley.xiao@rock-chips.com>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_095744_542296_235EE418 
X-CRM114-Status: GOOD (  20.23  )
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

On Tue, 15 Apr 2025 at 05:23, Kever Yang <kever.yang@rock-chips.com> wrote:
>
> From: Finley Xiao <finley.xiao@rock-chips.com>
>
> According to a description from TRM, add all the power domains.
>
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Changes in v4:
> - Collect review tag from Heiko
>
> Changes in v3:
> - squash the header file and the binding document
> - Update license
>
> Changes in v2:
> - rename to rockchip,rk3562-power.h
> - update the subject
> - use dual license
>
>  .../power/rockchip,power-controller.yaml      |  1 +
>  .../dt-bindings/power/rockchip,rk3562-power.h | 35 +++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 include/dt-bindings/power/rockchip,rk3562-power.h
>
> diff --git a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
> index ebab98987e49..f494b7710c09 100644
> --- a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
> @@ -40,6 +40,7 @@ properties:
>        - rockchip,rk3366-power-controller
>        - rockchip,rk3368-power-controller
>        - rockchip,rk3399-power-controller
> +      - rockchip,rk3562-power-controller
>        - rockchip,rk3568-power-controller
>        - rockchip,rk3576-power-controller
>        - rockchip,rk3588-power-controller
> diff --git a/include/dt-bindings/power/rockchip,rk3562-power.h b/include/dt-bindings/power/rockchip,rk3562-power.h
> new file mode 100644
> index 000000000000..5182c2427a55
> --- /dev/null
> +++ b/include/dt-bindings/power/rockchip,rk3562-power.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2022-2024 Rockchip Electronics Co., Ltd.
> + */
> +#ifndef __DT_BINDINGS_POWER_RK3562_POWER_H__
> +#define __DT_BINDINGS_POWER_RK3562_POWER_H__
> +
> +/* VD_CORE */
> +#define RK3562_PD_CPU_0                0
> +#define RK3562_PD_CPU_1                1
> +#define RK3562_PD_CPU_2                2
> +#define RK3562_PD_CPU_3                3
> +#define RK3562_PD_CORE_ALIVE   4
> +
> +/* VD_PMU */
> +#define RK3562_PD_PMU          5
> +#define RK3562_PD_PMU_ALIVE    6
> +
> +/* VD_NPU */
> +#define RK3562_PD_NPU          7
> +
> +/* VD_GPU */
> +#define RK3562_PD_GPU          8
> +
> +/* VD_LOGIC */
> +#define RK3562_PD_DDR          9
> +#define RK3562_PD_VEPU         10
> +#define RK3562_PD_VDPU         11
> +#define RK3562_PD_VI           12
> +#define RK3562_PD_VO           13
> +#define RK3562_PD_RGA          14
> +#define RK3562_PD_PHP          15
> +#define RK3562_PD_LOGIC_ALIVE  16
> +
> +#endif
> --
> 2.25.1
>

