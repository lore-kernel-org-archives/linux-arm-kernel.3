Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302E310706D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpHWsgKxBZi7sATWIfS4DxLDh7cD+zEJIHxKjFX1GdM=; b=H9yZ8dUF3OEPmJYimlUJuEwr+M
	/5pHa1c+6pPdY+s1Eh6C9cTR7w3aYn4g8xeAfOxZRtgZ8m8xDN27ytJrYI/CzRgvD4OL9lCGi2xaI
	36bgvReZVcnn4EtSacV7bf/q6U0CliGVL/qHpzTbMCRW4ofnnNYiPbDUC9EPtPV/z9fGNzzx4+ExH
	1ZlFH7noS13ZYbFgbtINP4hN1Wn5W/qf4RJ7W5ohts33BCyesDaHODBxJhKIT2J+TiIgjpJOsbRfS
	FXH0GOZN8J0BgQIDeEV3yh592Pv96QxgLdyrAIIKMTR+9TR7QRZM00ZJpm2rKVAO27buiFy9o9gMI
	c2Zhj1sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1OJh-00000001qaR-0tc8;
	Sat, 14 Mar 2026 12:42:05 +0000
Received: from mail-westusazon11012038.outbound.protection.outlook.com ([52.101.43.38] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1OJe-00000001qa5-0Pu8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 12:42:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPiqTlRBA9RudUDEoeqS33Dl+Cdu+VhRSPVHoWWAtsYhJikMzgDIXzCM4e+/eYPP7xWvuQ4pJHZyO7tqoFILaO32t146/Pgwxm2gikX9xRXwnvL3P6mv1fZ8NkMXekPQ3w8/GClh3O3hMh6TigMveFvlzb9Ue4/GoBxuiGUneHiJb1Ihe18Po8drhN+rwFfUvsP9o1ju3UQ223ZkgjOSLMzDEZRRpOxSujABmMuoh+bgkK+mMmAt4FQAt4mEvIl2bpzDC1ibNuZg84XBSRujMKdbPxI6tbF4lgCpEIovcpeg8TlVUkjV2pJked1c7JwEDldpt5FIxTCH0e7k1adESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpHWsgKxBZi7sATWIfS4DxLDh7cD+zEJIHxKjFX1GdM=;
 b=R3LS4hLmDsneuh2A8o4HLAS25IAZm2dV1fVI4KEBUFVH6xSJkXf4lc709E6bqhwrunZ1Z01Mxg7dT+dXfFC4N9ZHtB1pWvpY5NJQloPDFIzp/SNSm6vWnriiKSH473uIM4wXgDLwGfpSmYyng0sStxeWgolLjIsV1V++HKxan4Nsiz5Emnq0vWUuJJjFX2o0BEbOpvgbHWNcntDTTvKTy5qnj750WEDNu55+wzt6mmQcuIhxrT4uUqVrbdFaUJfp7R9Fpu1JDEMfpOJJ97RmsrlezjKQCFKhYGyzhoYpUUCuxnjpjUiwGZ/hsAw6js0HGdPg/6L5TFB+G38nOJf2ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.phytec.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpHWsgKxBZi7sATWIfS4DxLDh7cD+zEJIHxKjFX1GdM=;
 b=c+6cj/pKU9kNpYEhtPtxjaA84Jr9w+vBu/mSU866gD2/Ijfw+ft4al3T0TWKuELUWkM1aZ61lSVRmVYUMmzy2fFZFtO28fR3KFWNyos523wOGQLtRPOFSe7eRxsGin29R9rTXKdeuONcf9w/2fQ4eBOI+/D95IK/087ESd18YwA=
Received: from SJ0PR03CA0056.namprd03.prod.outlook.com (2603:10b6:a03:33e::31)
 by CY8PR10MB7196.namprd10.prod.outlook.com (2603:10b6:930:72::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:41:57 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::b0) by SJ0PR03CA0056.outlook.office365.com
 (2603:10b6:a03:33e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17 via Frontend Transport; Sat,
 14 Mar 2026 12:41:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Sat, 14 Mar 2026 12:41:57 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Mar
 2026 07:41:54 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Mar
 2026 07:41:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 14 Mar 2026 07:41:54 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62ECfp441750165;
	Sat, 14 Mar 2026 07:41:51 -0500
Message-ID: <37e866f4-c464-4d66-bcc8-c8f3a696f512@ti.com>
Date: Sat, 14 Mar 2026 18:11:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: ti: k3-am68-phyboard-izar: Add
 PEB-AV-15 overlay
To: Dominik Haller <d.haller@phytec.de>, Nishanth Menon <nm@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>
References: <20260311234844.56443-1-d.haller@phytec.de>
 <20260311234844.56443-6-d.haller@phytec.de>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260311234844.56443-6-d.haller@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|CY8PR10MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ecdf0d1-a68f-4d69-52ea-08de81c7143f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: bxjl413kADpB10wvzyIhYpRsKanugQV4K+BTVw90NoxCIDhe0+TQT53948NO+YGfGom5l74BPG5H+weX+Re/uuktMi8Vmc0F2wp2xuqBSPRVs/m74aybC4CTopg9PDlTxjRuLynwl3PQHZX/pG9Lwr33uUulAI9FR/2mdMFv91eq4TsVsGRuMtHOqI/02/fDDnZyodf1sNXouGzOEW78PJDIy7GPwaOosTGSOVoS+czOJ91vcD/75I6TGSupmALUSaf4QLRNeTKXGHVbk87owqpVpFN7TMWuCI6q6VwiSdMwBvNe/9ARFYGuL1tKi5qRuFRr3oOiZ3ZdiPnOrjThejTXwPiExvkVWQYUbe9TVVmwnd9VxBYIgp88HnRm0Z9EeEF6gA1QYO/01yBenArSDEqKxpMxXeUE/zSacq9bQ9S35LhJhpM4bj2jcobhAtfuGJeI50SW8MVIEnFAT3Dp3Uv1XDWiry5lFooJdcsGB/k2hseFcfpHW/z/wJ6Wgfi8ENTYhLqFgGuPnPdcsZ3tqEBWGxnWK5cp51V8sKBceb1hxa6KWuBrfx5PQvL8JcMz+TcpTBRt//ixTQ68RZlD0S4nv7sZX9xIweCX+XTugEwtODEPgqBewJ3DmK1sLOIS9FgJ0aDhBqdjxJjVUtcKgUJ1WcqNAs8QZLFMxhMFyzmgKLYweKEP0UlsQnxvL4iO3E7F894vpOjykSkngaFCymf8dnx3JGCeFJcYBKicNaw5Gyk1+KbkVrrTcQ41k1ivlcSujoQJDhiVXKdtd96Ttw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: r/DLb8EEGyemHVIN8kPYfa+vZf/84DM1uyx5GWOHN/JjR70Wb4D8dSpY4VjsNS7DLrP/hLhKHu9nEYkgPacFSeqjyEC+LAdYcgMakef4p9Piqav/sLfN21UkF7Bjq5k7UkqTsYEHw1bu73CpzCxZBO4OWsdk4ogAypm1rcyyqBa3z0TonWlrEuluj4tCj+jdbONRPQTF3RzsIuv5tik40JneP9VFGhRuSPp42Ro+fKF9u7gIN3qiAa93K4r3ONYIyjEAHyAg5yZ5hfySrCYr26jXONDDN1bU6y1wxC/Sui3vs7YM8soq4d1w/f7ojoNsOvTzP44zYcBOXTA5AYPgS2W88WaFb9Pj1orFSnj7X5xrYw4Ig841RqE9BHwtbQd0IslTR45pRJanC+cxWyOs4JS2S+h/JZ0MqMD0mcCTLdkqsT/3exsU+6XiQEkX9Qg/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:41:57.0063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecdf0d1-a68f-4d69-52ea-08de81c7143f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_054202_168920_92C0F2AD 
X-CRM114-Status: GOOD (  16.40  )
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



On 12/03/26 05:18, Dominik Haller wrote:
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
> index 000000000000..a86971fcdee1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
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
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
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

You have spacs instead of tabs

> +};
> +
> +&dsi1 {
> +	status = "okay";
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

Here too... Please check the entire series.

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
> +	#sound-dai-cells = <0>;
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

Missing space before "="

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
> +			J721S2_IOPAD(0x03c, PIN_INPUT, 1) /* (U27) WCLK, MCASP0_AFSX.MCASP0_AFSX */
> +			J721S2_IOPAD(0x038, PIN_INPUT, 1) /* (AB28) BCLK, MCASP0_ACLKX.MCASP0_ACLKX */
> +			J721S2_IOPAD(0x040, PIN_OUTPUT, 1) /* (AC28) DOUT, MCASP0_AXR0.MCASP0_AXR0 */
> +			J721S2_IOPAD(0x07c, PIN_INPUT, 1) /* (T27) DIN, MCASP0_AXR3.MCASP0_AXR3 */
> +		>;
> +	};
> +};

-- 
Regards
Vignesh
https://ti.com/opensource


