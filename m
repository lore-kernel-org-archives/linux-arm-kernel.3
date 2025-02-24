Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB1DC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 12:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKGBWYRfknZ7iK1RC8/+7OFUWMWukeU3pmJqdL1AngY=; b=GYyu0MzbQYew8RYZ+UG86seRcU
	SGfAIJstdKad7xDyYatxkerlFrXCAyarAPyy7NA+1j8cUaGl8rUj+47J0O2UiCkhwgYVNYyGB4AP3
	BlYRlQLNdUTYnrzlw/7Azy4sD11tB6P3DR8lbq9K0z91H295e9vsb1aFczbUgd3x1lk2bQlr1NyKC
	1gpTvMri7UmPJ3cELQ/SSUJWSidLcI1eXMwRMrQGLOb3cU313+fcSY9JKeLgm0RNLdR1wUesW8Ljs
	Ukfl0hXeJ1090BNqTbY3rrRGJtBH/Zeo50izWTAJUqHfj2dyuKwL5kNybYPuXwCp39w7CGpMhZbPL
	ViU4yHVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXHS-0000000DcyH-2T0s;
	Mon, 24 Feb 2025 12:09:50 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXDf-0000000Dbt0-32Fe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:05:57 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51OC5pXW1484803
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2025 06:05:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740398751;
	bh=dKGBWYRfknZ7iK1RC8/+7OFUWMWukeU3pmJqdL1AngY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=H3N+dfypXQjQfq0xw7E48JTWB+hcyrs/gUd1D+jA6AACEWXNnA+ec9GO8nE7hWI4S
	 JBjQMfKEtgDPqKWgmGpvP1a8Py0FGmjeoy2YkF+k6P+ZZOMf7w6m2j+TjRiseRT8Yu
	 Avdu8dGhdl4Nf1izFiwKFbochlWOCAUiWo357940=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51OC5pJA008018
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Feb 2025 06:05:51 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Feb 2025 06:05:51 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Feb 2025 06:05:51 -0600
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51OC5lcd073883;
	Mon, 24 Feb 2025 06:05:48 -0600
Message-ID: <d6440feb-ea23-49f8-9886-82d0e2145f12@ti.com>
Date: Mon, 24 Feb 2025 17:35:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay for
 PCIe NTB
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
References: <20250202093636.2699064-1-s-vadapalli@ti.com>
 <20250202093636.2699064-3-s-vadapalli@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250202093636.2699064-3-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_040555_854681_80392D7D 
X-CRM114-Status: GOOD (  11.20  )
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



On 02/02/25 15:06, Siddharth Vadapalli wrote:
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso
> new file mode 100644
> index 000000000000..e44173f670fa
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/**
> + * DT Overlay for enabling NTB functionality using PCIE0 and PCIE1 instances of
> + * PCIe on the J784S4 EVM and the J742S2 EVM.
> + *
> + * J784S4 EVM Product Link: https://www.ti.com/tool/J784S4XEVM
> + * J742S2 EVM Product Link: https://www.ti.com/tool/J742S2XH01EVM
> + *
> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/ti,sci_pm_domain.h>
> +
> +#include "k3-pinctrl.h"
> +
> +&{/} {
> +	epf_bus {


no underscore in node name please

> +		compatible = "pci-epf-bus";
> +
> +		ntb {
> +			compatible = "pci-epf-ntb";
> +			epcs = <&pcie0_ep>, <&pcie1_ep>;
> +			epc-names = "primary", "secondary";
> +			vendor-id = /bits/ 16 <0x104c>;
> +			device-id = /bits/ 16 <0xb012>;
> +			num-mws = <4>;
> +			mws-size = <0x100000>, <0x100000>, <0x100000>, <0x100000>;
> +		};
> +	};
> +};
> +

-- 
Regards
Vignesh
https://ti.com/opensource


