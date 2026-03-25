Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34C5109C029
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5RRD3wf9aWOZDjla3ylpxHPMpUQ5H4qTEmln4BOEyk=; b=q6FbJYySBI/OSYs6fgyWal1rv1
	XuIrGTzCpMqb/lUu9WdUGj0gTtv2cCVEH0V8sEZFabUqXThchSmbGnWixlZxBZ3/YRYGLWWwFMZIK
	M9hcfoxBCPGcj90u+vYdS4Xi2tHkySdYphxfeCISjw1rmkDLW/s4yMxFncLM8AWLJ3SHVgA6C/AxS
	RSmpjHRkdlWy84rbWppU7F/fbHI3wGOOsKqi9QlgW2KkPByMmJtl9GayXOldoi1RQ3EJeSyCb7bD8
	4OYWzFgtNYczGQW35IxnCfQzB3wGRsS4JU0N3OQQpHgWuJ6JiIj/NKRXS3/G5/MwC9WWCuCbRgD8G
	sd7XmLjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PU0-00000003e9w-35Oa;
	Wed, 25 Mar 2026 14:45:20 +0000
Received: from mail-francesouthazon11011031.outbound.protection.outlook.com ([40.107.130.31] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PTx-00000003e8C-1rAt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:45:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHuqTMNPYntHs0VJ3KZ0QOImjXKlEh68cxcHnEAPmmFjcu3zFwAmClaS2bZEbSrQ2aOPLhQ+o1nAL8emJlzvF1edMlDznyL6AZ+0dsBhdgPspV694uEdk0xF9L7TMT927YEZTuk94GfcDAJ0M45NEjfIgnMacvpYlc8fRLG1OO4+5+3C5ozMrITA3AXYfC56hETe9sj2h0y4uwtTzC9YoVDXD3yUcEmaACOl4gBEuw/Gf8imT1R7NlLNdnswyOPIdXYIeKNyBGNurZCrGIrCkby8anfcA0wTJShsupJ87LFRWVTdGbFxiwLFgoGDAauvHDhogfbMBA0wu8B4t5zsEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5RRD3wf9aWOZDjla3ylpxHPMpUQ5H4qTEmln4BOEyk=;
 b=NKfxIwWUO/sj0uwRmzdA5AQDKjhNN+lvj/nt+3j5cXpnQ+OFRtdCev/zS8Q7NRMCAU555A3nN+//3Pu60NuGv6syCt4SetWJpx98JZ9h+f8StbwJ6RcZ02GOp+bHEHcUJOoHqnAJiqjkbHzmtGpSKKujU+hJbs0oA05ycYeoQwXe3fWheR0AqewjMcxH8O3nTPpIPS9jPJxBfVuAtk50GxYXWfamSKms9Lg/zvZHw5GhaTZKICK9DQ/kKpobtny+M26Q3aiHrNtmru08ixg2TI05SFhXsW306HPVc2c5kP4voYOQnFXfa3peFM8EIPhmisJk25O2gMOexKc0mpAC5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5RRD3wf9aWOZDjla3ylpxHPMpUQ5H4qTEmln4BOEyk=;
 b=LojPukD0YklbZ99BZqyDsrkSeSa5j0rdVoxcpDqHoXJ7s05fm+sjc7iP9ZA1XESwA335t9I90CNk7M/fS8AE/fDk33gisRmuIFgyxydF6t8KfycFQPYDFoznD9LnmR6m2h0wBrCL3ZkMiyCzBcJRP6nexxsKix8Zu3VkImj+RuyH3OK60ylPeTr/1EjNDmpUo94PpCkk8VwPcEXxZMGxz8h3qhKHKdUPv9hjs6rCIhsDC5S/W+cO/DitQjvkXvJ5tIDA2xwpJGmlPOhcjuL6N+nU9lXskow6KG4+tp18DHU8e4Juwj9WZmI9U0rbN+evBvP62xLjg7Hfa8ZYjb7vHw==
Received: from AS4P191CA0039.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::24)
 by AM9PR10MB4038.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 14:45:12 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::a4) by AS4P191CA0039.outlook.office365.com
 (2603:10a6:20b:657::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 14:45:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 14:45:12 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Mar
 2026 15:47:49 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Mar
 2026 15:45:10 +0100
Message-ID: <ed2ae5ee-af2d-4aa1-90c3-eb13bbb1de69@foss.st.com>
Date: Wed, 25 Mar 2026 15:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] Enable display support for STM32MP257F-DK and
 STM32MP235F-DK
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
CC: Philippe Cornu <philippe.cornu@foss.st.com>, Yannick Fertre
	<yannick.fertre@foss.st.com>, =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?=
	<rgallaispou@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260210-display-v2-0-0592bd514958@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260210-display-v2-0-0592bd514958@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000048:EE_|AM9PR10MB4038:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6d990a-d88a-49df-e90c-08de8a7d1e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: KqTdLzWCvnF5KEHiVGw797LUIGDz67Pv05cmR8Oyc1gwqoJzpKWg2IRA7MzSNPrLMCyFy2ADEtsbeqdlIlSYzzuB3xZly3V8IO67d5I+gShkAT0jO1I5MeFz8/UUlZ3zRxqvIACGVnFBQzFqBxKCKq7wF5/+uOCM8jRrrtoF/ChWn+e2yyfsyDShtUCqW9UXN0MzmZ9byd9Cb5L35NNnqWJINEMXN5TepI4Eko6s8RJvlwnmlAdOHnAz+I507mKJGthTNU3Bx8XWjsJD/Fr+9vjp1NFZClk6Awfd40NZjosna/uS7g0FzfX60CGdT6g93DAddwvC4Rq9TVmOAZ0uAczMrbL3jPDJlriQWLMYXIIQCm8fVaa7jju+4NCjqFdxYDALs308O05wXpaDbpNAVvf5DPtcBovOplgN94mgT6GjzwYCcds7Y0QsnI3LBFpgh1PhV2+G3nnFRbctJ1vJWf1Wg2ORWGPnKwJ2uMcLIa8mH4X6ioSIDim+a3beSNCXcPAQOkf/8DD+FuyibMO42qz1pgypibl92+EQYaNSl+d1wgIRUlrlpAXSK5AHK6iRM/S/gKkJxFcO7nV5/e3ZCrSeEVEJU6Tt40OsoWjnzt4yVR9Vv5MdWrYQia1j9KhcehAU6sD1U32KJuMIDYgaJCndgU7I/SunVmJegphOE7e1iAxRH7PMf3HRfEWyoYXonExwOj15BFvCCyQIxMt+xSpioSqPd1Gage/jjnTMAIY6b3agyWBs0AdR775hbt4y5X9J4zE0vjMzmQ4hWNexYg==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: czKLHLUEpvZl5wOdQcxdeTJ2bPVT0cFxz4ZTOOoDOSqqthvQf7NTWrv6H8rlr4JMLPAuy7urySO4iJByTn0m5QUeqojNxKG9VDF0y2EETzYm8WJSWTdP9zskXZWRcy07vaBCEr9uF78qmK4foFdD69AYsYgqZI6xECEp7qXNmQ8fPt0oMPlK9UyKluLdyE33+YUQhOGfJYoKotPQiGWhyYbs3gtq5RC8JhygbheoTlAQxoQTT1tN3s6V0Djf2Ci3kOZysH1nUXAbsp1PVo6/GingR8APdzwrBsNl89qq3sahUFURtzP9aOjvUAt6xQhYWal/WUu45+pqH/xX5R6cm0yQcWp5ZfwggERdjxvpA4Q/ZAZ+tSyrnCPnZ3/BKGsfbxC0WApReA4O7nrpv61FHzuNSTrNauzR8pTwPu55iZoAIV7+iYEjgenVteLomapx
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:45:12.0166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6d990a-d88a-49df-e90c-08de8a7d1e9a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_074517_485454_1BC8A604 
X-CRM114-Status: GOOD (  13.34  )
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

Hello Raph

On 2/10/26 11:03, Raphael Gallais-Pou wrote:
> This series aims to add and enable sufficient LVDS display support for
> STM32MP257F-DK and STM32MP235F-DK boards.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
> Changes in v2:
> - Added support for STM32MP235F-DK. A second series would have dependant
>    to the v1 of this series due to the pinctrl.  Better send it though
>    one push to reduce dependencies.
> - Link to v1:
> https://lore.kernel.org/r/20260205-master-v1-0-fe6399aa3aab@foss.st.com/
> 
> ---
> Raphael Gallais-Pou (9):
>        arm64: dts: st: add i2c2 pins for stm32mp25
>        arm64: dts: st: add ltdc support on stm32mp231
>        arm64: dts: st: add ltdc support on stm32mp235
>        arm64: dts: st: add lvds support on stm32mp235
>        arm64: dts: st: add clock-cells to syscfg node on stm32mp231
>        arm64: dts: st: describe power supplies for stm32mp235f-dk board
>        arm64: dts: st: enable display support on stm32mp235f-dk board
>        arm64: dts: st: describe power supplies for stm32mp257f-dk board
>        arm64: dts: st: enable display support on stm32mp257f-dk board
> 
>   arch/arm64/boot/dts/st/stm32mp231.dtsi        |  19 +++++
>   arch/arm64/boot/dts/st/stm32mp235.dtsi        |  18 ++++
>   arch/arm64/boot/dts/st/stm32mp235f-dk.dts     | 117 +++++++++++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  17 ++++
>   arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 118 ++++++++++++++++++++++++++
>   5 files changed, 289 insertions(+)
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260209-display-516c2cedc734
> 
> Best regards,

Series applied on stm32-next.

Thanks
Alex

