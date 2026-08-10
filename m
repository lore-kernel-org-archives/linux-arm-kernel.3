Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B917DC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 08:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5x1S+R49QzSM/GlwjdF+5kxxI3HBqHCTqF+/XifmD/o=; b=kn9tRd5iHPYGHWuwsVFBG6ciuz
	JJjpduDAvVSj3qYzu61ob6mPW0imXiT8X65zkvsKjgP8PM40fqNufID5w6oHTQmptVuMWnmVaaBbg
	IZHqQGqmKG5iAoNaxq68SuVkd2nIecW3Pm9VejBI3B4v/Xa3DqSMUu799/PI04Tlr86M53IOvtUA7
	GI9J5MNz3VR5o4j8q8QCSfyGZUe3pgj4BSZ/w7FK9iOLC2/7ZKjUozzm3ovkAej5JT9TocbQIEHAn
	1LbOrRUzcxi9kS9/IycIOoSEvqetaB6SJbEwIoZAkuRTS9u68nt3GTqhBHkjbeDa8HEh9H2KI4DiW
	J/dR0jfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLpj-0000000BLm2-0Hsy;
	Mon, 10 Aug 2026 08:58:11 +0000
Received: from mail-westeuropeazon11011046.outbound.protection.outlook.com ([52.101.70.46] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLpg-0000000BLkv-3LkU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 08:58:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FI6sYEOx15EtYvfqVaZ20KxZNd0gNQ01lBMJ8TTvaUVi3jK/8YilGUXkEvrPFcFAVemhobCuD11JVEs0uDEaMlk2ymxzyHAhjaKLMvgZUdVH3nin8yjvOgZzZKan4qnu3cdeWtd57fYQUz1MA5OpN/w9/5EVlgg5JHAEfwv8oueN/JpBqXE3Ekj9CrcwjDIoC4GtxjS8rPtSmLYS0hJF6eaR670t4DIkj3HQgcQZao2gG7zu04B4QcZE4uMKpmfNXMnlynOYGooHtBFMVsDt7oQ91jx764chqxYEETlPAWQbPcEQxl7eYurI8C0uRkRZbEYVztmGLpREsoF3cmnHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5x1S+R49QzSM/GlwjdF+5kxxI3HBqHCTqF+/XifmD/o=;
 b=aoIrVO6UrQJ+ufZCcOY+v1r8lNspVYKl+Ut8BrGAVwUL23sc+gS0qgfHhDD+fLZuZWMClJHyRIumIfvjAnkEl8GghDVOYSuEA58L4iUWdVdQNw1h0t5Q8wDWl145sXI5DVG953lSdLplT6cnBsgg2eMS1370DwJ6insTyQ9i2G/3mz12OYRfeflnwTq6WeGIuBi7sCwggZkLsVQ68fz7HvICsjaH+KZAeBYns2haCDRQpoX9EymW6PqsNxLONLXVqRc61mG12xM8JLyPqyyD8v02Julw18Zk2F94I11b9pFFgLXd1q+08bZmnRFJYEICRTuZ1bCFG3yjGUxzQPvbRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5x1S+R49QzSM/GlwjdF+5kxxI3HBqHCTqF+/XifmD/o=;
 b=kc1xjYMJ1mT5+MkWc70FxrvG7WbiUlqsqsc3DJo0EX5Jx5zoLfUaok5Lg+1dEpP8nWBYUPvwf7XK8cY5xOJmY1WERLdsRXlRzWK353rsQOh6tO/AYj+wCEROo3mWn3FZb+OvJHjuCa1tW/rtkIsHoZYjXC/sdMIBUDzz+mhgtEoTEZGGWUoUvmnUIICW/dt5E7E5/CFxr43dINK7USa2TUYMhYS6m8ATURCXMsc6PJnigJLoK1dNFzL7Q8vwJohh5j/jrfRneLPcXIIm5BkmNApAZ3NTn50vsvWf2W4HQUlw7VJB5MjAzhJ4RAVNn01oSVh83aTC9m2Oj7uKERd8Ww==
Received: from DUZPR01CA0215.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::9) by GVXPR10MB8438.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1da::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 08:58:01 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::8b) by DUZPR01CA0215.outlook.office365.com
 (2603:10a6:10:4b4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 08:58:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 10 Aug 2026 08:58:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 11:03:29 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 10:57:59 +0200
Message-ID: <d98136de-5d37-46f1-9b4a-2e9e9ba1361a@foss.st.com>
Date: Mon, 10 Aug 2026 10:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] ARM: dts: stm32: enabling of SPI DMA/MDMA chaining on
 stm32mp13/mp15
To: Alain Volmat <alain.volmat@foss.st.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<clegoffic@baylibre.com>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
References: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|GVXPR10MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e7c220-3ecb-4315-7d02-08def6bd7b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SgAJ1tMBrOI0dJAp5VYvV+a9vJcdFMIFJsg9nHdYeedcTnVKJh7WIbT48lZJun4pEyr/P0le4c6tyJw/mTYsh6tCXYMIKRjEymhWbNy6HZTjuf5idp+3I3UjjxpbLeD2qisT3X84yE3eL/cSsVWUIrT8aeX4+XJA21F90mDspuzvWVeUzTWPMsdaxzPW9Rt3VAAbqmkK7rOSLxxgnA0rEAuUCrEuzBvIUODBbenX7lsjwQIvQT6eB8aRJXwQx9jBGk48B4acRWHI9hlHvPJU+UqT1Gopf9+8/8qRfj+Jdvj3PQuR0PAz9xedt0LNrU0opTA05fV3ata6XsgmHeQzlXo/7fN8HDVTgmwzHS5Ui3C4TR/waG+ej2PafrteST/ZHwec/VneFr2O9OIfXNpTTn9H8qGk6ecAzJ2jDqyDRuqZyV3GGW83ZP+dg73X+0ChBZsfnzS2z/9peXxHFtw7vT/RHgJhREy9K2SlRlP6J8F2KztQpKZ8LkJW+lJrY/dixzLd/kOqWa2OL3L62oWjpNaiXGcAGT9t/sAnntzIFrPVGsQQEErQwbosk7fEmp6U074rah/RvNRDb825fxcV94oKzMwGCcBwKjS3OsAOAJDwuOVhpruQaR5MmsiIeFKBM8OKXM1CseI+YCpZXaEbjkQocCkAPtUOiTqdvP5pcJIBZXNAnwpFcL/Kxv30LxkwxjhZhG+VPj0Bq2NGWElcHw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JiEWFB7vTu8ef2v9kAIZv1T/hzI3Gb4ypJpZjdjn8AARdYenqk3emLCXAiwWnWMMVHJPxR476Oo60ZgGignSIkww2k5E6DLAnduF5msfk0CjBZoFPzl0jaOh22XKZnY7e0qrUrdPj0pFDJVJGKJWDyLluWEHVgm+/eZOX0GUiM2jv+Ru/o7Jj7iY8cyEyeH4IqHTI4GH5a2DbKVYD42zMQa2rKfLYH3tSGJPL8whe/VxxqgrYHn4DAlSp1I1c8xZnUD2LjQwYriaW7Tea9D0gXB/LLO5VX8+MAZen0BVbGYWloLPiWyqLHEi4AcTwYMrnuV8HMBLRF3vecscr2jaDwILVbOByOPSaHUre+mbGGoFWVixxgKbPrPxizA+Aj+LW6aQb0uL/nnj4REJCRVQJAyMdzL+pAUVy40guL1A/ANYUzZItQdXYIwd4J9DsvTE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 08:58:01.2839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e7c220-3ecb-4315-7d02-08def6bd7b79
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8438
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_015808_845249_04686B1B 
X-CRM114-Status: GOOD (  10.50  )
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

Hi alain

On 7/22/26 11:16, Alain Volmat wrote:
> This series provides updates in the stm32mp15xx and stm32mp13xx
> device-tree nodes in order to enable the STM32 SPI DMA/MDMA chaining.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
> Alain Volmat (2):
>        ARM: dts: stm32: Use DMA FIFO mode for all spi in stm32mp151
>        ARM: dts: stm32: Add disabled spi4 and spi5 in stm32mp15xx-dkx
> 
> Clément Le Goffic (3):
>        ARM: dts: stm32: add sram[123] nodes on stm32mp131
>        ARM: dts: stm32: add sram pool to spi4 for DMA-MDMA chaining on MP15 DK
>        ARM: dts: stm32: add sram pool to spi5 for DMA-MDMA chaining on MP13 DK
> 
> Valentin Caron (1):
>        ARM: dts: stm32: add pins for spi4 and spi5 in stm32mp15-pinctrl
> 
>   arch/arm/boot/dts/st/stm32mp131.dtsi        | 24 ++++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts     | 12 ++++++++++
>   arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi | 34 +++++++++++++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp151.dtsi        | 20 ++++++++---------
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi   | 26 ++++++++++++++++++++++
>   5 files changed, 106 insertions(+), 10 deletions(-)
> ---
> base-commit: fba4a31a7f3b6b29b01c83180f83e7ed4c398738
> change-id: 20260721-spi_arm_stm32_dt-c650d8a3d462
> 
> Best regards,
> --
> Alain Volmat <alain.volmat@foss.st.com>
> 

Series applied on stm32-next.

Regards
Alex

