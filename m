Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44579FCC9AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrDjYPO1RhBwEvkdroIe+BkIpkdBWkr+n3AmyZ0feGg=; b=y3RJozSQYWtHf664yx9gFVNqFu
	nrgp/dF6NQ2DFzAno/FQ2ios3wqv1ejeKb4v2zg2edx43dDFX7QJ93rcjIV/RsSBuleCAJvcaxHQK
	aG/X+D3utko0o7idPbGXloewGNuOO44KzOOCNGMOGWgBFkV8itU36O6eSePvwDOVETXKvRT9AFZkM
	nYRVIKYoQm2NXoBgtnPCYPdlI2DKKPP/ySwWUZuEMZXeSJwOSCBvbN3B3Sh8Wm6dpfpyXNiJAQwFc
	TMUSXt6HUfuvXpy5m6HsWNLYMHiasUJ6QPDZSxe4hmvQYabvEq+L9QiZESTx3SnDS/PNk3V67v4+j
	ABIBu26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzo7I-00000008gFo-0mWG;
	Tue, 10 Mar 2026 03:50:44 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzo7E-00000008gFF-2ISP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 03:50:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKXAvmCQ04vf+EZ/op7LHgOc5EzCgmBGsnMYhCs7EcaeDsgU0mPvMYVj+L8DzWyqB9tgGAmTdTqZ1J18Ge/QDsJ1FTcE55058/AbEI5AUtPtf29NOWM4AjyqRaGflyyaMt6sSDzM+qkiNJXQA9biJHoB/nZm0+Eum7SMx047wBq1Y/ZAhDPU+iO3eCEe5fi0KznHnsb/hx2ltb+wHlJiuCQqnF3rNotKYeNvRnsywWqI6uSYZVWvAGAPz6GgZQ+gMkeHHKoWVG9HLPqCJktofxNZ8rcDkR6442ssFiXXN+kKQNWPHD7uIuCygGIkWog30gNru8WngHCmjwK6px9LJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrDjYPO1RhBwEvkdroIe+BkIpkdBWkr+n3AmyZ0feGg=;
 b=RlSraN8Rou/4feEL39b4yhN5QfPhnTDqGbs6jB7R2aWsGtW2oLA/5Xk1rVwBJ+0RjwKuBPR6o734YyTwqrPv6fSJRNBTPp6Y40XdFPHoW/J1GNVZd8sViutttdRWbwTxtq5W1P09tYTjTL2+YTRxsX2A5+35bBmQ9UVP1oH14BGtli2A2GvAvgLIxos9nU5I9nIdn1amI+qolO182l8a4sx4NMqYrSrd2KHR8kaPjlK4L3jtZdWGKgADo3y2braSP1/Zv3ZpuqcZpbgOVL8JJv0nC8DgauNAQ4dhJ505+Ef8f0uFRblMdB9exuYs0D4GMxBjBOCjC/l2AXPQPuFt0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.phytec.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrDjYPO1RhBwEvkdroIe+BkIpkdBWkr+n3AmyZ0feGg=;
 b=kj/wSGjYMzq2po3Z3Z+EKi4ZQh/D5J01miScIy0JwPWP+AQgaCXP26BsZFioAiTS+MJqMuWU2dN3pmcFoMzMASHEP7es41pvJMnCGOp7hpo58Tdc7zAL352jARv7ZLU6dip6dqY1D3kOkO5WR52FNugQ4GMG0n7tflEmsRnEBBc=
Received: from DS7PR05CA0061.namprd05.prod.outlook.com (2603:10b6:8:57::15) by
 PH7PR10MB6283.namprd10.prod.outlook.com (2603:10b6:510:1a9::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.25; Tue, 10 Mar 2026 03:50:36 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:8:57:cafe::b4) by DS7PR05CA0061.outlook.office365.com
 (2603:10b6:8:57::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 03:50:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Tue, 10 Mar 2026 03:50:35 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 22:50:34 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 22:50:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 22:50:34 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62A3oVDh1804107;
	Mon, 9 Mar 2026 22:50:31 -0500
Message-ID: <18552ca7-b4e4-49f2-b2f8-27bb4fd6178c@ti.com>
Date: Tue, 10 Mar 2026 09:20:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: ti: k3-am68-phyboard-izar: Add
 PEB-AV-15 overlay
To: Dominik Haller <d.haller@phytec.de>, Nishanth Menon <nm@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>
References: <20260306033151.276202-1-d.haller@phytec.de>
 <20260306033151.276202-6-d.haller@phytec.de>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260306033151.276202-6-d.haller@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|PH7PR10MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 6850c314-67f1-43ad-ca7c-08de7e582fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: DyzyNUW/L2TuQDh/TKu7cegutD5HE1VGKfIPitsO5EQ22Q3Nif+qMSn5ucHrSx+ABuZFQ1dyBQ6yPMxMFodo4+pOPJP0Que31m/YHfueTEGh+PbU7sVmw+8dGKlN2YjuHZ1q6DRwyt3UJ+PqhP/rM04hYUohi3OCB0rWWIp5qIOTa1GeuaI2L1RRvyOlXS+S41u04WzDW7+7676F1q61nxiv1juEihixlQJRluH2V1wH2Wiq52peRILvTpCoWiEjU7ZMob/Yz8ebNVi2qcsVs+ioHG8GtRBWauuxVQoMDB1dNXwz/bXuP0c58IEkGOEEhH8CDMzPgX4SYCyHqxNUWnBZX2l3E6EjyDYmzSXGL4bQgK6kFgLUwO1QD1GF/6dbu6iDyUbigju8NaSSJuVlPDa7oMagkX6UuDc2H58gfCb45gSWlInZzJDdwi1MBB+v5fGrgRt/Rwr/wiucwdhJGKNLIIjhjMz1lRzPggjKoKTaM9IAGvSP+rPSHJfoDs0kzyNE4CwS6iqH85VZ7bx3AGdIchuxLPf+9hTrXlCCgCaKh9qmRgdbbf3e0ZJYvk4vuZBXXyW3FyQzixjd2vBq7+vyGqhn6kgOrcRNHK3TzjByTfmgjNEX2bpeBQwQRf/B75dNnnfQ4h9jhFOqwrcFWkVIW6MwxhcGGolSwyg1+kGuIEoa9rTnbCdmwD1Vp9ATNQIHLsijm5O9X2Cexuv+biOaF/Hs7WHBl3gRJXfPxcjyfC2rRy6SV3+tjPTKCbkblGaNp7tY7aDq+VBYZ8sLIg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QKih0Y8m6E9UrMU4yjDgWFhVxr24Z+y5TPHERoZEu2u5f8TfkQtthr7oO9yIAhQwYZEPkXigbP0Ub0IonxpsiqBzwUp3WIMRPcvcE6Vs47KRJUV84TZ279mujDo1RjXmjuLI8SAttbHNmxI3gWZd48rHEETcofUiC8xUoPVReXLkGhloE+6oKRW1M8Q/VeuEQ8JCCws93mCdrPCCOyKSCj6SIRA7Yc6h15yHV30xvuDcPDEZLOk2jqwpudx//VpdhOOu8Dt87fi3IN9RLHNY+LAXNoqo71V++hJcgg4qBdoQrShdSk0L4bLqtqtU2SjXNyBgM1LWtWXPGCAHu+LCNgd9FbK5tztgSmAPuoaedkcan9qPm7XA73+NcF+au7wtfvpVf6OGH3/pwCjZRkHyHY8kEq431qGiZENAWd++pPniUFRfKKzD8d4q13eltajA
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 03:50:35.5049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6850c314-67f1-43ad-ca7c-08de7e582fb6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6283
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_205040_687263_226C6899 
X-CRM114-Status: GOOD (  16.87  )
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



On 06/03/26 09:01, Dominik Haller wrote:
> Add an overlay to use the PEB-AV-15 AV-Adapter. It's a small expansion board
> using a Lontium LT8912B DSI->HDMI bridge and a TLV320AIC3007 audio codec.
> 
> Signed-off-by: Dominik Haller <d.haller@phytec.de>
> ---
>  arch/arm64/boot/dts/ti/Makefile               |   4 +
>  .../ti/k3-am68-phyboard-izar-peb-av-15.dtso   | 192 ++++++++++++++++++
>  2 files changed, 196 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index a188e62e32b4..ae5994818ad2 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -135,6 +135,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar-lvds-ph128800t006.dtb
>  k3-am68-phyboard-izar-lvds-ph128800t006-dtbs := k3-am68-phyboard-izar.dtb \
>  	k3-am68-phyboard-izar-lvds-ph128800t006.dtbo
> +dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar-peb-av-15.dtb
> +k3-am68-phyboard-izar-peb-av-15-dtbs := k3-am68-phyboard-izar.dtb \
> +        k3-am68-phyboard-izar-peb-av-15.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
> @@ -323,6 +326,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>  	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
>  	k3-am67a-kontron-sa67-base-gpios.dtb \
>  	k3-am68-phyboard-izar-lvds-ph128800t006.dtb \
> +	k3-am68-phyboard-izar-peb-av-15.dtb \
>  	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
>  	k3-am68-sk-base-board-pcie1-ep.dtb \
>  	k3-am69-sk-csi2-dual-imx219.dtb \
> diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso
> new file mode 100644
> index 000000000000..cb75199c59fe
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0-only or MIT

Nit: OR is to be in upper case to be in sync with rest of the kernel

> +/*
> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
> + * Author: Dominik Haller <d.haller@phytec.de>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "k3-pinctrl.h"
> +
> +&{/} {
> +	audio_refclk1: audio-clock {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";

compatible goes first

> +		clock-frequency = <19200000>;
> +	};
> +
> +	hdmi: hdmi-connector {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "a";
> +		ddc-i2c-bus = <&main_i2c2>;
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&lt8912b_out>;
> +			};
> +		};
> +	};
> +
> +	reg_audio_3v3: regulator-audio-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC3V3_AUDIO";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_audio_1v8: regulator-audio-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC1V8_AUDIO";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "PEB-AV-15";
> +		simple-audio-card,widgets =
> +			"Headphone", "Headphone Jack",
> +			"Microphone", "Mic Jack";
> +		simple-audio-card,routing =
> +			"Headphone Jack", "HPLOUT",
> +			"Headphone Jack", "HPROUT",
> +			"MIC3R", "Mic Jack",
> +			"Mic Jack", "Mic Bias";
> +		simple-audio-card,format = "dsp_b";
> +		simple-audio-card,bitclock-inversion;
> +		simple-audio-card,bitclock-master = <&link0_codec>;
> +		simple-audio-card,frame-master = <&link0_codec>;
> +
> +		link0_cpu: simple-audio-card,cpu {
> +			sound-dai = <&mcasp0>;
> +		};
> +
> +		link0_codec: simple-audio-card,codec {
> +			sound-dai = <&audio_codec>;
> +			clocks = <&audio_refclk1>;
> +		};
> +	};
> +
> +};
> +
> +&dphy_tx1 {
> +        status = "okay";
> +};
> +
> +&dsi1 {
> +	status= "okay";

Spaces before "="

> +};
> +
> +&dsi1_ports {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	port@0 {
> +		reg = <0>;
> +		dsi1_out: endpoint {
> +			remote-endpoint = <&lt8912b_in>;
> +		};
> +	};
> +
> +	port@1 {
> +		reg = <1>;
> +		dsi1_in: endpoint {
> +			remote-endpoint = <&dpi3_out>;
> +		};
> +	};
> +};
> +
> +&dss {
> +	status = "okay";
> +};
> +
> +&dss_ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@3 {
> +                reg = <3>;
> +                dpi3_out: endpoint {
> +                        remote-endpoint = <&dsi1_in>;
> +                };
> +        };
> +};
> +
> +&mcasp0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mcasp0_pins>;
> +
> +	#sound-dai-cells= <0>;

same here

> +
> +	op-mode = <0>;	/* MCASP_IIS_MODE */
> +	tdm-slots = <2>;
> +
> +	/* 4 serializers */
> +	serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
> +		2 0 0 1
> +		0 0 0 0
> +		0 0 0 0
> +		0 0 0 0
> +	>;
> +
> +	tx-num-evt = <32>;
> +	rx-num-evt = <32>;
> +	status = "okay";
> +};
> +
> +&main_i2c2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	audio_codec: audio-codec@18 {
> +		compatible = "ti,tlv320aic3007";
> +		reg = <0x18>;
> +		#sound-dai-cells= <0>;
> +		ai3x-micbias-vg = <2>;
> +		AVDD-supply = <&reg_audio_3v3>;
> +		IOVDD-supply = <&reg_audio_3v3>;
> +		DRVDD-supply = <&reg_audio_3v3>;
> +		DVDD-supply = <&reg_audio_1v8>;
> +
> +	};
> +
> +	bridge@48 {
> +		compatible = "lontium,lt8912b";
> +		reg = <0x48>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				lt8912b_in: endpoint {
> +					data-lanes = <0 1 2 3>;
> +					remote-endpoint = <&dsi1_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				lt8912b_out: endpoint {
> +					remote-endpoint = <&hdmi_connector_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&main_pmx0 {
> +	mcasp0_pins: mcasp0-default-pins {
> +		pinctrl-single,pins = <
> +			J721S2_IOPAD(0x03C, PIN_INPUT, 1) /* (U27) WCLK, MCASP0_AFSX.MCASP0_AFSX */
> +			J721S2_IOPAD(0x038, PIN_INPUT, 1) /* (AB28) BCLK, MCASP0_ACLKX.MCASP0_ACLKX */
> +			J721S2_IOPAD(0x040, PIN_OUTPUT, 1) /* (AC28) DOUT, MCASP0_AXR0.MCASP0_AXR0 */
> +			J721S2_IOPAD(0x07C, PIN_INPUT, 1) /* (T27) DIN, MCASP0_AXR3.MCASP0_AXR3 */

Lower case for hex digits

> +		>;
> +	};
> +};

-- 
Regards
Vignesh
https://ti.com/opensource


