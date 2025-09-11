Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE9ECAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 18:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYHb2ePbP/cSM3RYmLN5AkN0s21xSd8WU5SVhx9urGw=; b=kcrfBT48QwcEQWd/FEU2KFbZwg
	d0eooUBum+mF5rvjeDoR25F3KBKWSz51TYr0fSz40KYUDw8JbT63oiymzRVqKnrg0+IXdpA2Os01s
	gzljPv9mV0wpT/R45EAWjR6W8HcJEQOWTj5Arl5DlLRqLUXqWsl3U7JcKT2tf0eWpt6G3OSlu1djD
	paTLQFUlPnR+YTBaB3RMlzaCahnb8DSo3O/ql7bIiAFmQ/ISSOVq81vJx3g1ThCsSy6ZCOqm2NdW9
	g8vIx/DyReFtaIe9c/seMrSnq0izsSzrp/Q041DsuibBgW/8nS4k2m/+Q1cfDo4fiKmDUfGD1ANJf
	IEa23iPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlhP-00000004dKu-3urc;
	Thu, 11 Sep 2025 18:07:11 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlhM-00000004dJP-3sf1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 18:07:10 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3e249a4d605so1062586f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 11:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757614027; x=1758218827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYHb2ePbP/cSM3RYmLN5AkN0s21xSd8WU5SVhx9urGw=;
        b=QYggusO6CL8c3PuERLpF92UabQSA+Hr3S99m4jjtJ95c7/YGW5iD3YLnqATmFcFzMJ
         s/iqk73Uw27HHZlw0nmv7eJIScBftzIkFsobVnrONSBBOWREQKIGUJgeogdRmhwDvP7A
         3zYKSbHaYMBDZd9A6tSfz8qFChj/noTiqffunzZCzG8CZHy6yF2E+NGVtMWZwQcGGMem
         uTEd94dghehYD1ZyNt6rWxhgoRXmTMA+AOMTQfmvijXBNAE1QmNIv4PGGC+FFzIdhB65
         DNXu1DgQ58PzwojKM2AZIS/Jyhp7loYlazbGmONLF8z3LOWeywbywqs6UiMIojZ9aWSr
         P6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757614027; x=1758218827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYHb2ePbP/cSM3RYmLN5AkN0s21xSd8WU5SVhx9urGw=;
        b=KSFtZUxxE/eoxEU1oJoWbW/cTzAR1M0pCqtFHCdzA1tSeJVhJXN8gEKSwysqDEun4A
         LSx7XVRme68tevBrw6qPr3SuS8eV3oUzlnKYYlBJ57ecLoR6gECU4BHffyAZe06SJs1Z
         WjCOP/leFPLRV3QpRA7VYq/uSLRtB6rZBCT+D6K9uJqHD9J/5dhuQhgPL0DzzVxKXUsT
         fq5cRWJknc1yuGXhDcwiM5d52sR+BgcD8rhg+9BvBrpSrROPI+Oyj1QP28ARzabSzYnr
         7ZZK1gU5MWvGuIPbZqaqNGMqYZypW38e43zCjNIVhzvO0OtZ/yapLn5RS/ruASTGRWr8
         B3Qw==
X-Forwarded-Encrypted: i=1; AJvYcCV7sPnkeersSyT7WX+FNw/ycH6CAIT4A+o/tw8sjqhMKORw4q8EhIeolcHj1TaTIXC1GK8Iii8RIyLHoVXVPCEf@lists.infradead.org
X-Gm-Message-State: AOJu0YwBCGxjhpgakvcOQ0XUXu9mC/htEhLOjddM6+BA1OAEFKQliR4S
	Mp9D5AdVe3UcAjCIICjwhrwfk3CwkFKyK/cbNZ1uAkw30jEH8SJoezqJ
X-Gm-Gg: ASbGncu4giPqBYprxPmWlo0odolDgRVP+AMajadtXPEtjEndtx3EAIomy8++Y2LN/Kp
	4xqMYdoWk2GMjOnIpAp/kWhqxSXFZ4PJNwn8EQ16qZCocFZBOCgC9mwL2WnGKph6uHoBwgMwmGz
	JP5whccFdyZMAf66tFqI5Vfinww4Kl43rvSnbmPK0XfsZZKLHOvsXIqJbgAHLDnCSGDFO02YoDW
	leGMJk+xLOjwr8gNlmVgJGchV4UtEE/v/dw3ibu6xTG8C1mRpR2FNKyQ/TQWV0ulA/vzX/FiaQ7
	/dHapN0f5OCFqW79wOlfMoP3ZfX9w4dUliOPgm4WsC0ojXBz2rmsXa9z5ORZJ6Eg/Xxu/BH42gq
	s5ocHUXSvUJBJzILHOoEbMgybhpqaOhAf6in5PO0PidvX0zW+BRGQ6PTOrtvpQBLeCFbKYpkLze
	snI1RFyuqxwA==
X-Google-Smtp-Source: AGHT+IHR6gKFBxF/Amrl+hTiQqEAGO5RUJG7DroNK0beFvilU6FlAdKcfqOOFlfA2Rioywi+kGhMlA==
X-Received: by 2002:a05:6000:2f87:b0:3e6:e931:b42c with SMTP id ffacd0b85a97d-3e7659e9785mr284823f8f.39.1757614026548;
        Thu, 11 Sep 2025 11:07:06 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e015775f1sm35637425e9.8.2025.09.11.11.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:07:06 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] clk: sunxi-ng: sun55i-a523-ccu: Add missing NPU module
 clock
Date: Thu, 11 Sep 2025 20:07:04 +0200
Message-ID: <2795929.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250911174710.3149589-4-wens@kernel.org>
References: <20250911174710.3149589-1-wens@kernel.org>
 <20250911174710.3149589-4-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_110708_990636_7DFD9699 
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

Dne =C4=8Detrtek, 11. september 2025 ob 19:47:06 Srednjeevropski poletni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The main clock controller on the A523/T527 has the NPU's module clock.
> It was missing from the original submission, likely because that was
> based on the A523 user manual; the A523 is marketed without the NPU.
>=20
> Also, merge the private header back into the driver code itself. The
> header only contains a macro containing the total number of clocks.
> This has to be updated every time a missing clock gets added. Having
> it in a separate file doesn't help the process. Instead just drop the
> macro, and thus the header no longer has any reason to exist.
>=20
> Also move the .num value to after the list of clks to make it obvious
> that it should be updated when new clks are added.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Changes since v1:
> - Move .num to after list of clks
> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 21 ++++++++++++++++++---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.h | 14 --------------
>  2 files changed, 18 insertions(+), 17 deletions(-)
>  delete mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523.h
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index 1a9a1cb869e2..acb532f8361b 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -11,6 +11,9 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> =20
> +#include <dt-bindings/clock/sun55i-a523-ccu.h>
> +#include <dt-bindings/reset/sun55i-a523-ccu.h>
> +
>  #include "../clk.h"
> =20
>  #include "ccu_common.h"
> @@ -25,8 +28,6 @@
>  #include "ccu_nkmp.h"
>  #include "ccu_nm.h"
> =20
> -#include "ccu-sun55i-a523.h"
> -
>  /*
>   * The 24 MHz oscillator, the root of most of the clock tree.
>   * .fw_name is the string used in the DT "clock-names" property, used to
> @@ -486,6 +487,18 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(ve_clk, "ve", ve=
_parents, 0x690,
> =20
>  static SUNXI_CCU_GATE_HWS(bus_ve_clk, "bus-ve", ahb_hws, 0x69c, BIT(0), =
0);
> =20
> +static const struct clk_hw *npu_parents[] =3D {
> +	&pll_periph0_480M_clk.common.hw,
> +	&pll_periph0_600M_clk.hw,
> +	&pll_periph0_800M_clk.common.hw,
> +	&pll_npu_2x_clk.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(npu_clk, "npu", npu_parents, 0x6e0,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);
> +
>  static SUNXI_CCU_GATE_HWS(bus_dma_clk, "bus-dma", ahb_hws, 0x70c, BIT(0)=
, 0);
> =20
>  static SUNXI_CCU_GATE_HWS(bus_msgbox_clk, "bus-msgbox", ahb_hws, 0x71c,
> @@ -1217,6 +1230,7 @@ static struct ccu_common *sun55i_a523_ccu_clks[] =
=3D {
>  	&bus_ce_sys_clk.common,
>  	&ve_clk.common,
>  	&bus_ve_clk.common,
> +	&npu_clk.common,
>  	&bus_dma_clk.common,
>  	&bus_msgbox_clk.common,
>  	&bus_spinlock_clk.common,
> @@ -1343,7 +1357,6 @@ static struct ccu_common *sun55i_a523_ccu_clks[] =
=3D {
>  };
> =20
>  static struct clk_hw_onecell_data sun55i_a523_hw_clks =3D {
> -	.num	=3D CLK_NUMBER,
>  	.hws	=3D {
>  		[CLK_PLL_DDR0]		=3D &pll_ddr_clk.common.hw,
>  		[CLK_PLL_PERIPH0_4X]	=3D &pll_periph0_4x_clk.common.hw,
> @@ -1524,7 +1537,9 @@ static struct clk_hw_onecell_data sun55i_a523_hw_cl=
ks =3D {
>  		[CLK_FANOUT0]		=3D &fanout0_clk.common.hw,
>  		[CLK_FANOUT1]		=3D &fanout1_clk.common.hw,
>  		[CLK_FANOUT2]		=3D &fanout2_clk.common.hw,
> +		[CLK_NPU]		=3D &npu_clk.common.hw,
>  	},
> +	.num	=3D CLK_NPU + 1,
>  };
> =20
>  static struct ccu_reset_map sun55i_a523_ccu_resets[] =3D {
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.h b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.h
> deleted file mode 100644
> index fc8dd42f1b47..000000000000
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Copyright 2024 Arm Ltd.
> - */
> -
> -#ifndef _CCU_SUN55I_A523_H
> -#define _CCU_SUN55I_A523_H
> -
> -#include <dt-bindings/clock/sun55i-a523-ccu.h>
> -#include <dt-bindings/reset/sun55i-a523-ccu.h>
> -
> -#define CLK_NUMBER	(CLK_FANOUT2 + 1)
> -
> -#endif /* _CCU_SUN55I_A523_H */
>=20





