Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93DBC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 09:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XM8gbORMZrnwiBvVL6Mz7ODJvLr7RZVQOMVOLKvY6zk=; b=IIO1T4b6GKPdX+nOLPdTRiQ863
	1mkpPYaNMni2YAY4jejJnpZM091Vh4GwCQOljiEPrICakuI1L4AOZ7o1tB/W9l8YvCXnzvLlvWjNA
	f2z9IwjV3d2GMDcZp92+MIdxtsru4hyrM3rrqsebAIcW0SSukJUEeZdpj1IA5Vlo3aIlEYuA8jnZM
	AO14l8Rl/CbmbewyLaRyXqLvTm8IGaPTQtMxqCTOh7ntnwd23JnAAvO+A6OsTRBo4aJahz3+u9zmj
	JwnS+iPqtt05Iu/NcBTIEBm/gTr+1r4rP7T9wR/z7QO/PK/hr3L/Kr430JlcnsPeMxgLaa9iLRdeC
	d7XY8pPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtM4y-0000000BNHh-38J6;
	Mon, 10 Aug 2026 09:13:56 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtM4w-0000000BNGd-0mCS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 09:13:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h74DKY75wTdzCltA02X+eaflZ+P2i+dxKAFQlxaqkMtbMTPfgZrATEMEHQreOVfo+ozhKFeKK8Nlz7fhm//32VgszZPCNPK4SWV3oproLmIU5qUfeUuxDBbBp46tDJ5oNMUygaoqC+PThuO7REaq0uoBtqw3CEYZRM6470/ZRTKeuYmMAgGSuRuWC4xKmpyDQei+dVU8/eXyAzXh/a4wZ0SZgmvgSsNyCcZWuDPuIlP8FWnP2qWlZRBpEA069En5asqt7EwQh2B3KEUxlaafJyCQvRdneld7KmnXgCJmLx6OBxJ61QdwqTSL2bHnnuXjdBSsEBoh1zPZ/HylYP7pjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XM8gbORMZrnwiBvVL6Mz7ODJvLr7RZVQOMVOLKvY6zk=;
 b=jHWH573o737wHH1W0c1jqARfevcCctzj1/yU4o1Q7f2X0VQFypCQhzFdLyml5Yhn91K+VXkDVSZTqnc0CdBFXfb9excuPWfSolDYFeW11RQfu7CoKDNIVkIm2nq3ZDWToyxyNkLPCQPHKXaMAcUY8Me1Ze6o6ly55qQu7Ou2315Bino3fXzgyEkd1udpVnuf0abA7UlnZA1JQclUoXBWNbmRG98YiO6Rk7D6RQxEJL5qurU/PN7jamQ7mOMmRviCSj9tl6L3liXAB16JWiKeeVeb69bX8h36336d8CZkBr8/FvrHDOktQY2pTixMrXCLrZUQhNq/+i8TjBXmO2Pyww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XM8gbORMZrnwiBvVL6Mz7ODJvLr7RZVQOMVOLKvY6zk=;
 b=FVWrFwBjR0/JEUGmAzplyRm+gdSFPXRVy7y6fIntlSpOP691jMqBaEMpXmzeryQsndmjvpLq1OEFV23D7jaDHHGjSd1TXvsqVFvRy50oY3M5v/x55vMhleCuM79+GmIhB8ULDR6uaiVxpVNuOMWBFWvZldVeo+XBgnfXZN/jlJqsns9ZjBxhZOkphwoT8ay1xxWG3RXye5urm6fbBXjQ1fAELSH6eFsRmc1bjlHCrgjoZQNmPVccbY+mM7E0k7t1r+3kdwwenLCIwz5TxQ301pljW+SJsatSSTt3s6Wgle+LIng6pDYvvj3scwPRa0pJpkKkM3bRStNHUcNUJJ+dWA==
Received: from AM8P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::20)
 by AM7PR10MB3720.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Mon, 10 Aug
 2026 09:13:46 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a::4) by AM8P191CA0015.outlook.office365.com
 (2603:10a6:20b:21a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 09:13:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 09:13:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 11:18:40 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 11:13:45 +0200
Message-ID: <46dd10d1-a877-4d92-94e5-2ecdb7006ad4@foss.st.com>
Date: Mon, 10 Aug 2026 11:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: st: Add I/O sync to eth1 pinctrl in
 stm32mp25-pinctrl.dtsi
To: Christophe Roullier <christophe.roullier@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260804114019.201949-1-christophe.roullier@foss.st.com>
 <20260804114019.201949-2-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260804114019.201949-2-christophe.roullier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019A:EE_|AM7PR10MB3720:EE_
X-MS-Office365-Filtering-Correlation-Id: 365cee48-8428-4956-2eac-08def6bfae8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|18002099003|22082099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: e8kHuXulC6bfgQUUjRM8wFf3szm2pnLKqMrF2Ln2KX5O0XA/OpwWhcLuKmH/qJtNXYeoPfrPWvitfkuocS/juos9PJv2Swg4Pjff5Y71A4W2hUffn1R0p/lmFiD0meZRXIKN6vXInZTjkmxGySgaRhLwBa8A8l2e/I5VN+JMO6is5euTYoZUi8swRWOFM5f56flSPLtbsXeRWUfr6oqHj4BTWOGXwIuwXXfDVI+7+7D2+P5iZYJHMK7htJtSa497iwxN+7LSlKGT3WqTbc2qK7nQV1Yf2Rkx3d4wr8TJyvccKT54z8KnN5cxy+XRuhO7UC3fulLzEOH037kIKp+FGoBiTp09V8nzZLMX5eWz1mwV39ohy6Atv3s+i6DhOFKpMXUWfeBzzP98gpTOaOeeD712PY4r9y9+XIvdZ/NEWr/Iz2i6pSTMmIYPNlVUF/fn9J/zABPOsW8CCCyvaaiRBxBlYvtUslLBNilgTQwZ3sB5IRZ+vpBeoxE85dhFqM98mzyqf+K7UE9o2MXPVAgZjoSncIdc0/SSaGGmgL3w+9T/10b9lDRc+kPrlhCc7e54H9ws1VOKHFk8DW+s60ADrquJXwV74CdqJB//Txyg0PBoqv7b6F0nYrkTs0sTMi4fUli4oD+TrN63d7xoJM4jFKlyRrysm4e+UcS+FSE2CHhErC5lyk4FIY45njZj9r4Ef1DmE718nvlFPuq1ZO7f7g==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GnDcIEgOyymXXV4y2oVT76C3t9grDL06rnkAPmiqtmJ2HiuHFjmbu9Bvzt4Egif34Ix87wDMST7dLiXl1yqRrEeGzzjDYOrJAw1NCpaheBLyDGUhugrxxEAfSeIP7lI9S1uVJ5O40uK0gwpT7loFmWQSfr8V1vUaxwYsdS4i8gXLkK7QYcTnki3nZGOvN2A26YTFdD1ctZHYnw+hGWy6r4qiY4QmjC8y1cB6srf5VQeegZ8Rk27xaNR5cEE1wRGhrn4cDOkK18MPD8nEv6P61PMgmY9rEQoMxVLS79p1ZJmQapMBQuWpGnMcU2m87t3Fa2CWkr1dGtsvAbslkn3WuFMxKmK+dTDeIakblj+VRpGQlBMDN4PzdO9JjZJdaimeAATPvap9Zy8sWlbOfBOHxviwTn7An7JR42DTAuGWS3LwpwfJwIhZKjw1k3deqjky
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 09:13:46.0057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 365cee48-8428-4956-2eac-08def6bfae8f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3720
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_021354_335498_46016CD8 
X-CRM114-Status: GOOD (  13.31  )
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

Hi Christophe

On 8/4/26 13:40, Christophe Roullier wrote:
> On board stm32mp235f-dk, stm32mp257f-dk the propagation
> delay between eth1 and the external PHY requires a compensation to
> guarantee that no packet get lost in all the working conditions.
> 
> Add I/O synchronization properties in pinctrl on all the RGMII
> data pins, activating re-sampling on both edges of the clock.
> 
> Co-developed-by: Antonio Borneo <antonio.borneo@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> index 456ece7f8ebc..4fcfc4528c5e 100644
> --- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> @@ -95,6 +95,7 @@ pins1 {
>   			bias-disable;
>   			drive-push-pull;
>   			slew-rate = <3>;
> +			st,io-sync = "data on both edges";
>   		};
>   		pins2 {
>   			pinmux = <STM32_PINMUX('H', 9, AF10)>, /* ETH_RGMII_CLK125 */
> @@ -112,6 +113,7 @@ pins3 {
>   				 <STM32_PINMUX('H', 13, AF10)>, /* ETH_RGMII_RXD3 */
>   				 <STM32_PINMUX('A', 11, AF10)>; /* ETH_RGMII_RX_CTL */
>   			bias-disable;
> +			st,io-sync = "data on both edges";
>   		};
>   		pins4 {
>   			pinmux = <STM32_PINMUX('A', 14, AF10)>; /* ETH_RGMII_RX_CLK */

Patch applied on stm32-next.

regards
Alex


