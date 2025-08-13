Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53C1CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyvusIEXjAre/xttjCZZR35LjwYPJuaLUvaZ9xyV3Z8=; b=LORmpMPQRexcTyI1rO+WCfYuUA
	Qd2AcYJ24sPhnYI92DTrIWFCbUj7x91xBK9odL8AHOy38jxZIWzO/IurxM+ubGXbpAwz+2WhMizbz
	Fh1BHqR66+YdaqLynrTEC4PkNyT/cCj6SntO3VojIgBqkn+pvwBUfUr2YwyyhHAdwJ9BclitzSYS+
	jLKibaHA+GBe+dFvru4i2X5EV/yPzIGO/uPnk9VwVXQe7aa+cJD5eotHJbtgJF0ZAOTVQvEaXLwlz
	xxYrwpB+pfIzQ4QBmSXTdR63EHwlaFtvS2GdKWs2/FbwOqE2Nni3YaGgdmGZDinY/fJmeNKVQ5Muv
	IihBxbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBcG-0000000DmKy-0qtV;
	Wed, 13 Aug 2025 13:34:08 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBAX-0000000DiKV-3JVD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:05:31 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DD5ODJ2152796;
	Wed, 13 Aug 2025 08:05:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755090324;
	bh=OyvusIEXjAre/xttjCZZR35LjwYPJuaLUvaZ9xyV3Z8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cAW4mthz+eHWDjhCFx18wqQmgxjqWJVY/281sbD/5YMHzdqsigvxPfiyRDDHGZxA3
	 OkzoEL4zLGmM3MUB5JoNChRxVAnCCG2QioJhHelWzMAD8EHXE04J6oUtLKWsKhlgQ+
	 LXs9zc2DmDq9V1iizq6CdlIMzj1HVmejfd1S9jjo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DD5OZi1086160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 08:05:24 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 08:05:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 08:05:23 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DD5MkH2333843;
	Wed, 13 Aug 2025 08:05:22 -0500
Date: Wed, 13 Aug 2025 18:35:21 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Akashdeep Kaur <a-kaur@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vishalm@ti.com>, <sebin.francis@ti.com>
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-pinctrl: Add the remaining macros
Message-ID: <20250813130521.zpe7lguful6gyhjz@lcpd911>
References: <20250731115631.3263798-1-a-kaur@ti.com>
 <20250731115631.3263798-4-a-kaur@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250731115631.3263798-4-a-kaur@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_060530_115217_D46DD5EA 
X-CRM114-Status: GOOD (  18.78  )
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

Akashdeep,

On Jul 31, 2025 at 17:26:31 +0530, Akashdeep Kaur wrote:
> Add the drive strength, schmitt trigger enable macros to pinctrl file.
> Add the missing macros for deep sleep configuration control.

Please can you add sources/ links to the TRM/collateral and sections where you get
all this information from?

> Reword the existing deep sleep macros to provide combinations that can
> directly be used in device tree files.

I am not very clear on what this line is trying to say. Can you explain
a bit more with an example of a reword and how it is helping?

> 
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-pinctrl.h | 66 +++++++++++++++++++++++------
>  1 file changed, 54 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> index c0f09be8d3f9..f26f1fcf6f74 100644
> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> @@ -3,7 +3,7 @@
>   * This header provides constants for pinctrl bindings for TI's K3 SoC
>   * family.
>   *
> - * Copyright (C) 2018-2024 Texas Instruments Incorporated - https://www.ti.com/
> + * Copyright (C) 2018-2025 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  #ifndef DTS_ARM64_TI_K3_PINCTRL_H
>  #define DTS_ARM64_TI_K3_PINCTRL_H
> @@ -19,6 +19,13 @@
>  #define DS_OUT_VAL_SHIFT	(26)
>  #define DS_PULLUD_EN_SHIFT	(27)
>  #define DS_PULLTYPE_SEL_SHIFT	(28)
> +#define WKUP_EN_SHIFT		    (29)
> +#define WKUP_LVL_EN_SHIFT	    (7)
> +#define WKUP_LVL_POL_SHIFT	    (8)
> +#define ST_EN_SHIFT		        (14)
> +#define DRV_STR_SHIFT		    (19)
> +#define DS_ISO_OVERRIDE_EN_SHIFT (22)
> +#define DS_ISO_BYPASS_EN_SHIFT  (23)

Seeing it on lore and in my git log -p as well, the alignment looks off.
Please fix it.

>  
>  /* Schmitt trigger configuration */
>  #define ST_DISABLE		(0 << ST_EN_SHIFT)
> @@ -33,6 +40,26 @@
>  #define INPUT_EN		(1 << RXACTIVE_SHIFT)
>  #define INPUT_DISABLE		(0 << RXACTIVE_SHIFT)
>  
> +#define DS_PULL_DISABLE		(1 << DS_PULLUD_EN_SHIFT)
> +#define DS_PULL_ENABLE		(0 << DS_PULLUD_EN_SHIFT)
> +
> +#define DS_PULL_UP			(1 << DS_PULLTYPE_SEL_SHIFT | DS_PULL_ENABLE)
> +#define DS_PULL_DOWN		(0 << DS_PULLTYPE_SEL_SHIFT | DS_PULL_ENABLE)
> +
> +#define DS_INPUT_EN		    (1 << DS_OUT_DIS_SHIFT)
> +#define DS_INPUT_DISABLE    (0 << DS_OUT_DIS_SHIFT)
> +
> +#define DS_OUT_VALUE_ZERO   (0 << DS_OUT_VAL_SHIFT)
> +#define DS_OUT_VALUE_ONE    (1 << DS_OUT_VAL_SHIFT)
> +
> +#define WKUP_ENABLE		    (1 << WKUP_EN_SHIFT)
> +#define WKUP_ON_LEVEL		(1 << WKUP_LVL_EN_SHIFT)
> +#define WKUP_ON_EDGE        (0 << WKUP_LVL_EN_SHIFT)
> +#define WKUP_LEVEL_LOW      (0 << WKUP_LVL_POL_SHIFT)
> +#define WKUP_LEVEL_HIGH		(1 << WKUP_LVL_POL_SHIFT)
> +
> +#define WKUP_DISABLE        (0 << WKUP_EN_SHIFT)
> +

These too, fix all alignment issues please.

>  /* Only these macros are expected be used directly in device tree files */
>  #define PIN_OUTPUT		(INPUT_DISABLE | PULL_DISABLE)
>  #define PIN_OUTPUT_PULLUP	(INPUT_DISABLE | PULL_UP)
> @@ -53,18 +80,33 @@
>  #define PIN_DEBOUNCE_CONF5	(5 << DEBOUNCE_SHIFT)
>  #define PIN_DEBOUNCE_CONF6	(6 << DEBOUNCE_SHIFT)
>  
> +#define PIN_DRIVE_STRENGTH_NOMINAL	(0 << DRV_STR_SHIFT)
> +#define PIN_DRIVE_STRENGTH_SLOW	    (1 << DRV_STR_SHIFT)
> +#define PIN_DRIVE_STRENGTH_FAST	    (2 << DRV_STR_SHIFT)
> +
> +#define PIN_SCHMITT_TRIGGER_DISABLE	(0 << ST_EN_SHIFT)
> +#define PIN_SCHMITT_TRIGGER_ENABLE	(1 << ST_EN_SHIFT)
> +
>  #define PIN_DS_FORCE_DISABLE		(0 << FORCE_DS_EN_SHIFT)
> -#define PIN_DS_FORCE_ENABLE		(1 << FORCE_DS_EN_SHIFT)
> -#define PIN_DS_IO_OVERRIDE_DISABLE	(0 << DS_IO_OVERRIDE_EN_SHIFT)
> -#define PIN_DS_IO_OVERRIDE_ENABLE	(1 << DS_IO_OVERRIDE_EN_SHIFT)
> -#define PIN_DS_OUT_ENABLE		(0 << DS_OUT_DIS_SHIFT)
> -#define PIN_DS_OUT_DISABLE		(1 << DS_OUT_DIS_SHIFT)
> -#define PIN_DS_OUT_VALUE_ZERO		(0 << DS_OUT_VAL_SHIFT)
> -#define PIN_DS_OUT_VALUE_ONE		(1 << DS_OUT_VAL_SHIFT)
> -#define PIN_DS_PULLUD_ENABLE		(0 << DS_PULLUD_EN_SHIFT)
> -#define PIN_DS_PULLUD_DISABLE		(1 << DS_PULLUD_EN_SHIFT)
> -#define PIN_DS_PULL_DOWN		(0 << DS_PULLTYPE_SEL_SHIFT)
> -#define PIN_DS_PULL_UP			(1 << DS_PULLTYPE_SEL_SHIFT)
> +#define PIN_DS_FORCE_ENABLE		    (1 << FORCE_DS_EN_SHIFT)
> +#define PIN_DS_ISO_OVERRIDE_DISABLE	(0 << DS_ISO_OVERRIDE_EN_SHIFT)
> +#define PIN_DS_ISO_OVERRIDE	        (1 << DS_ISO_OVERRIDE_EN_SHIFT)
> +#define PIN_DS_ISO_BYPASS           (1 << DS_ISO_BYPASS_EN_SHIFT)
> +#define PIN_DS_ISO_BYPASS_DISABLE   (0 << DS_ISO_BYPASS_EN_SHIFT)
> +
> +#define DS_STATE_VAL        (1 << DS_EN_SHIFT)
> +#define ACTIVE_STATE_VAL    (0 << DS_EN_SHIFT)
> +
> +#define PIN_DS_OUTPUT_LOW       (DS_STATE_VAL | DS_INPUT_DISABLE | DS_OUT_VALUE_ZERO)
> +#define PIN_DS_OUTPUT_HIGH      (DS_STATE_VAL | DS_INPUT_DISABLE | DS_OUT_VALUE_ONE)
> +#define PIN_DS_INPUT            (DS_STATE_VAL | DS_INPUT_EN | DS_PULL_DISABLE)
> +#define PIN_DS_INPUT_PULLUP	    (DS_STATE_VAL | DS_INPUT_EN | DS_PULL_UP)
> +#define PIN_DS_INPUT_PULLDOWN   (DS_STATE_VAL | DS_INPUT_EN | DS_PULL_DOWN)
> +
> +#define WKUP_EN_EDGE		(WKUP_ENABLE | WKUP_ON_EDGE)
> +#define WKUP_EN_LEVEL_LOW	(WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_LOW)
> +#define WKUP_EN_LEVEL_HIGH	(WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
> +#define WKUP_EN		        WKUP_EN_EDGE


-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

