Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6068C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uA/WkjUE/FemZ1IA2BzsjbrVinKkgL4t9m+WhhbzRVg=; b=bNUN63599j2bcyqnfLhxtI2xm6
	8e4h7ABBNGXR2YAwCqCSSepQjnZIDO3uHZGjXOMdA2tcfsbIC0VX1C0gJrKpbkoRixKbvVu0aoJAV
	rpA3CvbKypbcoAhGG05HawymPl4Elw1qS2MlidawnaCAFnh03171xDFK15azJz/Xpi2/B9D4/UKRK
	YK9SEhcLAj+Gg+Ftsd+2PBnmu5mQ/c7wpeeJE0m0ILRlso8qIGR0HxrgCc+KA2LNY3hRjIxbMzmRy
	2xZ6NKJ36yOocou/V5pFfqqqwF1cqftr+VZVDyD80c9CApNYnFZL9F/otR80C/NgE+dkDcEP8ts1X
	7Kko5CKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1web2J-0000000HRfX-0fxx;
	Tue, 30 Jun 2026 16:10:11 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1web2G-0000000HRf5-1X02
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:10:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bp2ctQSj9U3eoHcw/gn1vy+k1d20uinsOAUfC1K0WdfWoqHuTLJCMpYPpLzUAzfJKQ3DZR7pU1Ew/MAc0vbkwS01bM5sAqbc+8NxEkW4BqFWAmI+eXk6G8DHBxVyw1cQkY9DOB3cntQcTg+2l2QMtFBaRGHsEzMHr+pvOdhSddYWuppkwIY3ilJmKNTkpcu3uniaCPGZolHW/gWlfvdcKlPhuKksR2JdtXZfythBzdiRzk+D3Uah4NCpvPBffHD91YIB8h0BkejGhhnKWzLXGGEzAoonieYwQoIt6Qre9+Ba2H0vyK+WdA9DoLTy39UVTdLbGRq02JGLbNDKPp6lBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uA/WkjUE/FemZ1IA2BzsjbrVinKkgL4t9m+WhhbzRVg=;
 b=QMPmc8ONvSl3Syj30lWp7K8GnMZCJqp+0wD6u2cLucHDr0ABTmpbPVgeQ7Tvxf0YFR7HzR6gDRcWiqi4HvS2NWgTOpmKlnUR5j/Ek3jzuGscdKpu07iPOLQNpGXJ/3W2Njkq9UVwCeajFRQMoVpcbQWccgBJGyNy0hNyg9nnVN4OTDXN3XHl8GqXdrXvDSfEiINxVCtUhqUjmwM1e/kMavN4ImQmn0DOrzFvMXLZPvKklanoSOUioR3j/WY7U0EtyiMCbBB6zJ49v2dwi7O1QSW5NT8af1HnHd1wfNXtMjn1p1gRuXpToO7KZAU0OvbiGxry1RCmD7yRDdxtaVVmnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uA/WkjUE/FemZ1IA2BzsjbrVinKkgL4t9m+WhhbzRVg=;
 b=B8q6TtSAZf0VDJqIRnpkzW//pGudgR8fe2nO+8hT3Vumyn7bppvc53z9K5ry5FHBAFmPLLbMKx1JOTtYN60RnzHwXC7lq7AMhS73JTxuHlPqd6VRvvy/2jKIMFp5Vj5YhZIITA8rOnM8WZ3AEzT4AXCY8MjGlnQkCq2l5Zf0dxpFOL/xUoJAV4YLqzPD+/0nQjXXYEYNqu6zYUVtqxnrXYF2tP7ldFBC4UEYeVTLQgEY7Zj2Ky76Ip+gidZnps8LBNd9NpziAeziJhOvdbbtwpflZ/BpnTlndCWMKjsagfVqsUl9eRQR+x8s3FE1MzuRFyOtogJ9DDHblL2g2TbdOQ==
Received: from DUZPR01CA0268.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::16) by PA2PR10MB8409.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:425::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 16:10:01 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::1) by DUZPR01CA0268.outlook.office365.com
 (2603:10a6:10:4b9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 16:10:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 16:10:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 30 Jun
 2026 18:14:16 +0200
Received: from [10.252.21.21] (10.252.21.21) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 30 Jun
 2026 18:09:59 +0200
Message-ID: <47285b1f-b99c-46b3-b386-5e900f4dce47@foss.st.com>
Date: Tue, 30 Jun 2026 18:09:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v6 10/16] arm64: dts: st: add sai1 pins for
 stm32mp25
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <francesco.utel@engicam.com>,
	<domenico.acri@engicam.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, <michael@amarulasolutions.com>,
	<linux-amarula@amarulasolutions.com>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
 <20260630092628.1695560-11-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20260630092628.1695560-11-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.21.21]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D08:EE_|PA2PR10MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f495fe6-40c7-4ad1-0c2e-08ded6c20a1f
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RwxQGxgwrdU7nA6xEZxDqwtWHPc6G0y2hU0hcl77g+kCv7BvoCVhl9o7kriBlD87b1OWa0dN13C7/7rk2EgQjggZJIbxYSomvgGKz+47CcRBqf7bS/DL98aXFGuvBOvmgs+i325IWMEIxy28N71P5Xy7ANUEdGhUkgdc2Ofy7Ix9FYqJxZCGMcMs/syEiZqcwC1l58CCf0T9hYIm6Z9mZK7KQ0mdsejAcZFzAWhCj08UcVP/5pMJcq9PjAo9LDZghq6ZnYD52fZc0VgC7tdaV0yU+1jw/u+wcmk5sXaA/kNoPESDGzUB4t7JMebN0T5NTXg5139lF4cfC8A1pJFoqHcNqK7XM0AQY4LUij8BKCgpttIgZVcpzfOgmr37/LdfNvKfVwDwpyVSx3ek22h/1VPqpZrwcuKrEXkejFAuXajOPPC+QgZSfEBLkqCp0mshK+PaJYvpBro1LumSSQOK8wYDBaD4VHMKasCo1y3+r4Rj4gP+mFh5VaQZG2Hd8wlvGuq4/aI1daNfCTjdO3Xt1rp2mRZaB1UOe2BQ4714ugt2KTkcL2EALYN/SOYd89gdmZU+T4eGgSYnEU33CBSxY9olzaN4fj17iWo0290sbOlMGJwdwvAuEZ5cVPqXpwFR8BFtsKjLOxbTC2Tnc8MXN687q9NXvw+B4jBhycwHbfduQCKa85zdipV3vcHpwQZ5o/vbwLs2QHG+FEPSr15ETg==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gAf4/ZZFU/r3p8xbqY6BQ2MjNCFGX1fzSPCqLlBSXm91vR/gOG/4qT/yY+tEFcyYRKO9g7lrHRjl5IKa+5xj0b8GBEVJ3ZfqJkaCjEC2yGOGs9pbqE4Zg9QeUhvM8C/6HYSr2oU2xk2jwewsO9bNsyLDPnLAZUwK4lRPYYxwjBh1oq51WSj9kobu3oKpSQPdUiVaMqXzSawsvBWFR0FiXcrpT5IxwKubnKp6GiwO+7OHR2GZIeNwGaJzWIeyCMe+ZbHD78AwEfqUITOLWu1+uHzkm/Li+ofo7905Ad8vuPwT/OTnUMMXtvtONfYDn6Rj8FZHWGTZZ0SCVVCug6s27zRZ/rZpAcnffl7VvSfEBzfNqVzr/R/Ft7EusE8D0iDkEKS3vW3FgFxb3GdT83m5RvAUgf03gkcgYroQmHCvH0VQwlzi1NUYvxWokvT1kx92
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 16:10:01.3795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f495fe6-40c7-4ad1-0c2e-08ded6c20a1f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8409
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_091008_921752_618F6449 
X-CRM114-Status: GOOD (  10.73  )
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

Hi Dario,

On 6/30/26 11:24, Dario Binacchi wrote:
> Add the sai1 pins used on MicroGEA-STM32MP257-RMM board.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
> (no changes since v1)
> 
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 +++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> index 695c9d771853..002fbc724b9d 100644
> --- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> @@ -520,6 +520,51 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
> +	sai1a_pins_a: sai1a-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('D', 9, AF3)>, /* SAI1_SD_A */
> +				 <STM32_PINMUX('D', 8, AF3)>, /* SAI1_FS_A */
> +				 <STM32_PINMUX('D', 10, AF3)>; /* SAI1_SCK_A */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <1>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('D', 11, AF3)>; /* SAI1_MCLK_A */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <2>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	sai1a_sleep_pins_a: sai1a-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('D', 9, ANALOG)>, /* SAI1_SD_A */
> +				 <STM32_PINMUX('D', 8, ANALOG)>, /* SAI1_FS_A */
> +				 <STM32_PINMUX('D', 10, ANALOG)>, /* SAI1_SCK_A */
> +				 <STM32_PINMUX('D', 11, ANALOG)>; /* SAI1_MCLK_A */
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	sai1b_pins_a: sai1b-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('D', 4, AF4)>; /* SAI1_SD_B */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	sai1b_sleep_pins_a: sai1b-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('D', 4, ANALOG)>; /* SAI1_SD_B */
> +		};
> +	};
> +
>   	/omit-if-no-ref/
>   	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
>   		pins1 {

You can add Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

Thanks & Regards
Olivier

