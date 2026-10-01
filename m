Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF98CA5FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3n0CnZvo+6eTpzF1nBxQ1ccBSLbwhr/WCDc8ErOCpL8=; b=LtvdJHUki2WM5B2Ofevj+7TGg+
	Byy9zfFSM2D4x+JzCl8SElqYfJKuIRM2l22CQ6zNzlMtpAkMuSH+FRRnFso/eiiKMv/RIKQSwtKow
	05vGwhg6gFJqWRrJs+EfjuN4GuodJHcRazwxFZOn1DNyVO7zjOT49h0d67bclgO+g2cFpQtNB22zz
	Nod1x+Z02TiIjDBWiQ9pew1X4Xkp6Nupn2xI2nKwtZrK6gXkaVSEjnfxcTpY53yj9txkRm9T46cDC
	8+46/njUdtbFWwc7EJ8v9wzD9dHJ62EBz5iA+kQoMVnC5oy7NVos/osJvnoJ7AO++wnVrXR9Eg11B
	lghKmJ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDKL-00000008PKR-3BoU;
	Thu, 01 Oct 2026 09:43:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDKJ-00000008PJs-1BUi
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 09:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3n0CnZvo+6eTpzF1nBxQ1ccBSLbwhr/WCDc8ErOCpL8=; b=DEILBzUlNNa3CfbS8coQXVuWB8
	+F6gvYZjIwzGyNn5D8boHd4DAQtGThPndsHmtrguuqaMvLL//uNUP8nLN90rT6ZKSVYee5sKIGjEg
	AaIXmkzsugwEvJSr3d60juF8cp65gu1WPja0epjNBDiZg73XViWyg5Uhb6HeyeAF2cgjdLwTCJccq
	EozHwfAGOkx88a3Bdh8o8dW/Tf7O/fkAy6Azjyg1yKtqeFp4LygKTb6gLsEiKj3OMOr6Vp6yE4zdD
	3jGcEesF0CTeDQ0ordyGlFNVsrncyUcGwNrnb9R6aGSIiRchF6sepaI9ilcBemJ5X9g+G9OQKVrRO
	tLLm2sEQ==;
Received: from mail-westeuropeazon11013001.outbound.protection.outlook.com ([52.101.72.1] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCDKG-00000004nzU-14Id
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:43:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A79zMjvfTkaFOZyOwjVGQPbN1vbUJJ2h5+BawzG8H9LNUO1Bjh8odlL9UmRi8tCT1WRUXR0t+GGeYBICku4JgmWBBnQMfb5jQ+Z5YYyxvvUrC5JsTVYuLjmYfqCEyhf2G7ZcwORHlxDzbf88F5SeSQspBB+Fso3ApI5t6FxDZHN1zSh46WINm8tJrjmvAwCcp6AtXJTNs4JybztxXZPvJRg2pxbqR9g79Q6yPtivxwSwEacym1qVRx37J4X28jieYhZTIs7SMJnPR2bSwmqGWT3Fx02pmBDtHyyZDuZSf4FWyBHFLg4aY4tfirQfS4fH7Z4Jt52rfPabGXTs6jLHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3n0CnZvo+6eTpzF1nBxQ1ccBSLbwhr/WCDc8ErOCpL8=;
 b=V6BO5v3RLy9eKWmCB08f9Rh74dmTV1KIKxBlDMVvEUNvpO6ILfnKZQZm+hCIzR02UTLjSNZ5Me0ATl/NbZQdvpA/T2dXdLO1wBntgkeDFcZaXrLABq7obPTlWTB+/8FF8Pfq9aNi/Knl99HZCtRU58/h1rcgS6gX0da5HI/hZfyj0vjuQPxFQfR0oSuFESbI4OcZ7RmkCKDY+oY0IG4EINfhGX3CY91VltjeE41JV+0bs9R+TIhaKM4fMR8HR6yxFsXHPhQMiIv1qn/R9sugGFKkWNGBnfn9Q9RA1rsvF3MD7y3ATWBOPMd43arjqLNTrCL3GDj+oCC+PSEcncvG4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3n0CnZvo+6eTpzF1nBxQ1ccBSLbwhr/WCDc8ErOCpL8=;
 b=oPGe6fC4jtROPYSL7/ztUof++UoKSooX5IAvnzHjaybcA8AGt1X8BkLz7R2c24FiyXVVmwvyCit2yprW6guFvNvHogW9Tfdy8aGnxPT2gAebDlK/7Z89S/7U8zML+upls4IATIplDwTc9tTx46TKcaMhY9J44MTGB3aVQtR+yNTK+DciA4DrTz7htTGI3v/p+a6YwI5DIrjnCtxWCv3jKmE47GbpEvupbXodV3FR+Bcw1suiUNKaXXjpFvWKYNucF7nbV4z/irYvpWXWo6rvKZyVym1wuz8IVA+JeR5J6fikluL/LInRkIBoLNONBlJlZGztG0mmFqc+U+rATP9Gyw==
Received: from PAZP264CA0201.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:237::8)
 by VI1PR10MB8134.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1df::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 09:43:34 +0000
Received: from ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
 (2603:10a6:102:237:cafe::b) by PAZP264CA0201.outlook.office365.com
 (2603:10a6:102:237::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 09:43:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 ZR1PEPF0000E6B6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 09:43:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 1 Oct
 2026 11:50:06 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 1 Oct
 2026 11:43:32 +0200
Message-ID: <f404d273-352c-436c-87f1-885297b01418@foss.st.com>
Date: Thu, 1 Oct 2026 11:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: st: Do not encode path in
 sdmmc2_*_pins_a/pins2 phandle
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20260929194035.496244-1-marex@nabladev.com>
 <20260929194035.496244-5-marex@nabladev.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260929194035.496244-5-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6B6:EE_|VI1PR10MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ccc822a-c6a9-4fcb-12b5-08df1fa075ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|23010399003|376014|1800799024|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vU7mAdSS+VnyzDRVITBacqKHruGXjCJhG8YiCeQTF/FsP0Qz/ZTcI/ZFn3O0C75PUz26qYma9vDDvosZuPF7LeaacSKp2XGPyqVt/h6k3GhmcBDUq6g/Bi5H3uYWOuxVg8O//4ArNJuWYEAOjMKXTUqhUFTJviedsMGnceyj2P1i61mN6x2HeDk6mWmYeACJ8FfGTU7Daztvs9E/LSUCL+ImqxGErhJ5fTc5YQX9HVcR/bzJg3yR5KDeJ8VDMmyQkzhSBb9rl/b0qy5Z+y0wJ6AhiF2xJ/MdecZimI+CJbWh4AyjCvgsr/DCrdeJcum7HSX3jUNblrMEmIHRNDLHsLt9gwTiXoD9r1O11KVsD9RfXWVY7MP8WnvhTvRXiA+2ZEqPOQd/gL2mIg35fbUHNXEDFFYPpeKJCiXluVvatI1cHEai9PTxS3GGz4UXDLcg/uknf2Gvdqx7XsvMdaum3p/bI6jcq5IHlk8/8KjcuuTO/aqKucLNOlzyX8MeT21vl61ut3AjbnsoocR+KGBsW9Oa+QVHthO0076kZvrY3P+pDolQtCoXKc41fjK0knmL20qXXXA2fV5rUTsiunuDlsdkU37GQukenz59m1wn/ulIACCNAQhWbty0LNYeBJOLc44Za8S8nFYjN4Q+LvB8cSIl0rhBY993iYx4WviwIWfsuJwfM7OHQJv0cURzdq4p2k7uq9SzsCndCiAWqqI1Sg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(23010399003)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2hROHqvPEYBCqwjTFmD2b6Qw5Oh0Dw+x8/OWtAm91W4PkMI7RJqyN/I51dNvm/RP7rld0EbwzdbXHfGoGO8GKiyfZBqKTIctH4fokm95Mnx2sJiShV774E3jvBFj6N2n7WUrRojndZIpneHaXfgni2Atthl3MJAUe+3MFnoKdUOcqCCOLxZjcPN53duudzYEH4GlJbCGfBuW/udek7hdkos2I+9QapqpWpLeDY1Q3o9rLQxqoZarCZq3VOEUx1cJm59DiW9apOZK72uD/4wYtYxGV+9PYd/S41s29yVMoDVctNVVb9PXtlXZxbC6Fu1m8rwlLqMzWe+pnQeZc/EG0NLdgRjysfjzkaWmLNxNwF8KkcfJcAhgvb3hrUAMn4XftvrJcKHbmKadw4Wr2JwUtzKTS3tNdud5bEIHqokvZmWD+aK/LwG22Yj4/sezvPc1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 09:43:34.2819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccc822a-c6a9-4fcb-12b5-08df1fa075ec
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_104340_472479_202E7208 
X-CRM114-Status: GOOD (  13.85  )
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

On 9/29/26 21:39, Marek Vasut wrote:
> Do not encode node path in phandles, describe subnodes instead.
> This is only a consistency change, no functional change.
> 
> Fixes: 9b584c92f94f ("arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   .../arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
> index 80d829c55d9d8..bcf63e2ea9898 100644
> --- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
> @@ -389,14 +389,18 @@ &scmi_vddio4 {
>   	regulator-always-on;
>   };
>   
> -&{sdmmc2_b4_pins_a/pins2} {
> -	/delete-property/ bias-disable;
> -	bias-pull-up;
> +&sdmmc2_b4_pins_a {
> +	pins2 {
> +		/delete-property/ bias-disable;
> +		bias-pull-up;
> +	};
>   };
>   
> -&{sdmmc2_b4_od_pins_a/pins2} {
> -	/delete-property/ bias-disable;
> -	bias-pull-up;
> +&sdmmc2_b4_od_pins_a {
> +	pins2 {
> +		/delete-property/ bias-disable;
> +		bias-pull-up;
> +	};
>   };
>   
>   &sdmmc2 {

Patches 1 to 5 applied on stm32-next. Note that all patches have been squashed.

Thanks
Alex

