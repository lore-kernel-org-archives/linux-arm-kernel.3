Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B795CD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUYk8lD+a291OHqguuiEfZqGcNUEgLeGspxyAkjLdRU=; b=RYBvMaxtLxan2J11g4w8qLXh6N
	bxboFkalvf3NKclc6voOT/SmK2CmLFpPpm/Oyr0wW87BfXiSwOpnvx/AghC4DpFQZObSfMT7Rn8H3
	N8KNmgHKOgsHw93coaMnYSlpbOOTkVzk5ceLRopb8BVvImsuo0M3t5YS970GyZZFsdM2XV8pAbudr
	naBIeqfteytx7CnRg7WCMpTOWVqFQQi+pRhXaYXdi+sRMiJ7jNwhoEMQ78FVJaqQf0wulgIfJsj3a
	iKlg+NH9Zg4Obt5fVAK3VMkWcKVtjuqRVnqJvcacNUw2bC6vA7zT5l+v7/CQQS9qs66wggQajj5At
	SvPRQMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxaX-0000000AKGi-1nlr;
	Mon, 01 Jun 2026 08:01:33 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxaU-0000000AKGH-2YrX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:01:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRzzmnhUwyquc8iDiuHsoX7B7N+wzAoz45f7jvJMy3MmD2fsPnP0XrRh6u0yOX4x4ZL+zPr94BR3cPxP4IXMOeXO6oE0NGRCec4NbcE0kej3GrApScwz0JTPkq8NyXu9Z0C9wGNGJedqlslAOrKCbX6kygTk+QP6nL+WCWUeJBcVwHOJaSe6x4MuLDqaWkXhY50XS9wg9SX4rusG24rVPMM5PYYapn2iRpPTNqf8mEsGNzQS7iQ/QBjBwpkwZkNYaUnuTjtbt1J49ScjGcB0XqnYPyWsUcpdH7gAPMGH/lbrSKSq9+W6ApjstIb9taZUbuI9k84oX2F0wkdE6ycIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUYk8lD+a291OHqguuiEfZqGcNUEgLeGspxyAkjLdRU=;
 b=OQ4Nd6yvt+QXvQ5Ormd5xZNy5JwbhTJhPMyIGnKK8EclzxhUDZySGYDo0/0lqT5q5H0BOG48HQleTYlCnGe0HNspQ07uMPIHbHpiHtgREGZf6pll3KPKL/xyaLTxlnh7x5N6TrzMBo9qMkRuaKJ94wN7+SArCJAKQmsvATkd8IxaFc1m2AEL8SP19Y35G0lUHlu5gP+5FbFMml5tbDC+Uh82f5VXxUZs5q91E7Z+Kz/70VZpZeVtY3hJTJ3+R69iaoy2WDWYR4tkwmPzTsQ+H2WG+0WwkkP+lwH8COjKuwW8CMPlw/5vfYkiHAKKP1He0uBH00CaM345gEnR7E8MsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUYk8lD+a291OHqguuiEfZqGcNUEgLeGspxyAkjLdRU=;
 b=PQ5kla0ePEj6WL7BmJJ0w4iRpZXPTVom63jP9CD7M1meiEGuAVuylFbvneY190MxrTOUoHa7ShZOjVaLu8l6De2i4uSaeuLMkL1LwHVDlMrCN93jvghAB63IBEnwE3iQUZv1N6dO/mr0yBMi2ure8SrtHkhcmFANWHGT3DhW/evuWyIT8J6GgfAwEZD4KuLsVsp4XhbWAAOfWSLIK26EZ6KmLe21fMoLxi8UgkIBHlZn5doFgAQT3BVakyfbjJkW94RTgURk9efPsIX8v+VwujZoj8M6EtICK9rZ+y0+VKSewzJzPUnpf4OMmC6mpOdt/rJL8UPgmnM41nFnJWjXVg==
Received: from DU2P251CA0020.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::29)
 by DB9PR10MB5977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 08:01:19 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::24) by DU2P251CA0020.outlook.office365.com
 (2603:10a6:10:230::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 08:01:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 08:01:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 1 Jun
 2026 10:05:02 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 1 Jun
 2026 10:01:18 +0200
Message-ID: <d0bd6b92-328e-4fdc-80e8-b4e5f493e19d@foss.st.com>
Date: Mon, 1 Jun 2026 10:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: Fix SAI addresses on stm32mp251
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Olivier
 Moysan" <olivier.moysan@foss.st.com>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260411130300.19603-1-marex@nabladev.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260411130300.19603-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|DB9PR10MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 372fe290-a6e7-4982-bfcc-08debfb3f6b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: aPElhx97ZD4r2DPi+Tz8SkeH78izHX/qNZX59Zw6N1l+7UcH9Ebzs07fJggw0RISAl72g/J48uWJ1aqt9tvlSnG54JELojDWUBVMROLHS/2f0nPkNkPv2XhaOh98upNkxsjd5CfwuENSWvcmFAHheBSpuTUbIl2GrKzWBZC0lEe4iuDlt1K9azaU+h0HnxksiNQxWbCG3JSemG/C/D3in8PUVS10/EGxsuXXWq3UFlw3kjk6PDPwsMzuRRXJsWj+BlBANpOgF/lwu/HN8lQvSs8X2HylNC+4ukq00uAxcgNBZ2skjVlIMdca7qZOmXiuW2tRdOhukAET2Wj4FAWc2kEByISL+BuHcqviB5le9JlZUGRiG61htSoBJUFVL7+T816ju58V4M866GDnrpJ+S2I57MYwTlk30tRHKRxfeMInBaPJ6nbkycKsimjLX1HRHHcCheAnzzt3I8W7imPbUY7iD1BiNxonV+M0fTx+g1uuHG+hdo0RyxGTqr6sBQhN69UY83mSdgbNEhYuO7sSPT93Cn6DTLd34P3MI1rWLgdysX6dEcW9ET2OcnNvm+BvhPOiw2H8m/trXGxk8MTUPuUrT1ccOFvOm75tZ6LsRacthxfpyevtdWcxWqftxDhnBUHDFz5sJCbvuQ2MCBpCqofrLpET5OcjIiOhqQCt+bnV/zz6+j+eeJfU52LdO0JrAg9iFkhYLPufMlrn5sjUbNOkJvsucTaWeDyY5qaCYfg=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ziudcibVk8rBqC1AEjIqg4t4zu1giFF7rlsol8u2Sw6fNYUUIo7H3E9Pq3dYpbU1OmFqxEU4kgryqe47+pqwCoWDm7gzRCS/cIqzEnZXtkYLCYZYNzz3J0NAaoQbeeUf85nVcTr+W1rixQtJDroHGL5IyKf0O5wFiOmkWyXDzd6Wr/LSEk46LXJUf7VJOu2jk4/bH6RhFty166Hk+6DaANaFR7gyC5T2/JwWhVp0hYyxRoERchxki8vroN++glqG1ejnVzvCX1rtiFFbE6rbU/3MMAjgyLwgKL6LV75UaSpixDwVukkG4nW3571XQ+5Ln041FgJPwegqgpe169fww175ylyUWjz2AhnstY8x13fxUPe1iB6vcmFFYafyBwvWGu1gStf8o/kTkurOWDh7HroTFeagBO3PgTx7fi3+5/8j3km5CnZRpKYFfcoEN0zs
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 08:01:19.1241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 372fe290-a6e7-4982-bfcc-08debfb3f6b6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5977
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_010131_119196_12C09DD7 
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

Hi Marek

On 4/11/26 15:02, Marek Vasut wrote:
> The second field of SAI register addresses should be within 0x3f0 bytes
> from the start of the SAI register addresses, the second field describes
> the ID registers which are at that addrses. Currently, the second field
> does not match RM, fix it.
> 
> Fixes: bf26d75a95f1 ("arm64: dts: st: add sai support on stm32mp251")
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Olivier Moysan <olivier.moysan@foss.st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 673fbc5632e69..9c63fdb5a885a 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -1202,7 +1202,7 @@ spi5: spi@40280000 {
>   
>   			sai1: sai@40290000 {
>   				compatible = "st,stm32mp25-sai";
> -				reg = <0x40290000 0x4>, <0x4029a3f0 0x10>;
> +				reg = <0x40290000 0x4>, <0x402903f0 0x10>;
>   				ranges = <0 0x40290000 0x400>;
>   				#address-cells = <1>;
>   				#size-cells = <1>;
> @@ -1236,7 +1236,7 @@ sai1b: audio-controller@40290024 {
>   
>   			sai2: sai@402a0000 {
>   				compatible = "st,stm32mp25-sai";
> -				reg = <0x402a0000 0x4>, <0x402aa3f0 0x10>;
> +				reg = <0x402a0000 0x4>, <0x402a03f0 0x10>;
>   				ranges = <0 0x402a0000 0x400>;
>   				#address-cells = <1>;
>   				#size-cells = <1>;
> @@ -1270,7 +1270,7 @@ sai2b: audio-controller@402a0024 {
>   
>   			sai3: sai@402b0000 {
>   				compatible = "st,stm32mp25-sai";
> -				reg = <0x402b0000 0x4>, <0x402ba3f0 0x10>;
> +				reg = <0x402b0000 0x4>, <0x402b03f0 0x10>;
>   				ranges = <0 0x402b0000 0x400>;
>   				#address-cells = <1>;
>   				#size-cells = <1>;
> @@ -1362,7 +1362,7 @@ usart1: serial@40330000 {
>   
>   			sai4: sai@40340000 {
>   				compatible = "st,stm32mp25-sai";
> -				reg = <0x40340000 0x4>, <0x4034a3f0 0x10>;
> +				reg = <0x40340000 0x4>, <0x403403f0 0x10>;
>   				ranges = <0 0x40340000 0x400>;
>   				#address-cells = <1>;
>   				#size-cells = <1>;

Applied on stm32-next.

thanks!
Alex

