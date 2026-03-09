Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F306EF36F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 07:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndE/BvTBhpf2XzEwuxhr+ULMKWuUcSk21gfW/Tqnv3w=; b=xi5Vke0QYvJpD02yBXiZaQ/tqc
	ut1JF39/moKO4N/x33G0PHDC0fqsB/TfKzAR/Y4BWkA85rqss8S13PLyffW4Gy5HBjGX0eqEQTnRb
	1VdtH17y/o1IGwlQLFjA5kOJNhRf0vCZinI30GGGXw0nGrm3KCWJpPKReIyKB09jYtywfFc+BqqXK
	zybk1ZQEY0vSBEuXbYkKxQJjKL8YOFhwBMyOBCJFM4WW7VbHdQGWKhw9+mkRPHK/qaYGFvKpD218/
	OIVNhgo6jg/h1wz4xQ6yDwaTBI3FRdyVufHuKijr4ZCh5e6LgY7riTlEDR4bk50NojJusHMlv8TFI
	9cYWFDiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzV1n-00000006nu9-36mt;
	Mon, 09 Mar 2026 07:27:47 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzV1l-00000006ntk-0erf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 07:27:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D38KCRUkZu04+xPXey9EYB7uFfUY2oeIwfsE/XGzR2MmTb3GQgajhBTgF1p+nR2jGIY5bl+T5WFu6uVGh4yj8ihz6nuwGBqYTUy4upd5+dPptMOnkrk7/VZEIDd5M3GPjCnFi7tRjlPjfB5AXfGDK3OtdvkYbX8moYvgOYiAO+OgSGMFBcuG8xAt+ktK43y1ZRmnHyUkNMf6jpNG8JG9zwpaaCcvMALUUPm4HXT4RZQvvqZqeo881J8WFgtCtr7qJWJ/ev+1xip7rmIoQ0cZrWBPl50RXhYxFzL/wYXkLY+M/I4/8EzHNhcrff6XYXORHOjIBdzO/yOmAWH70f257Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndE/BvTBhpf2XzEwuxhr+ULMKWuUcSk21gfW/Tqnv3w=;
 b=vgF41i4lo0KlSY2Got3uhEQJOw5K7tN2eVcs8Z9psJ6o/IYc/obndeC5kZKN1b87bkXPiqW9oEgKhslNGDCEEB2HjqnNl1yTIoFJ0y/DDGbrW5Mv7Urkbn7aX8pp7O5Ap6ZLBbkWKM6ITsm5RDY88S+URx6HQUbWCxgI+HjiK8PFgoQRxEELiYqceQEtlrvUr/xAmXw5r7aRWbLXNu26OpgABvaMC0DlnzH9dJe+nbM353q4E2Q53postC3a5hEaOx3zjZu7iLADmhxzo9Bl48/zKZ6K4saJF/tgUn9Y8NQ6DrANb/0QjGioTw52d0MF5TwvxySjkR1igEYZ+61IOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndE/BvTBhpf2XzEwuxhr+ULMKWuUcSk21gfW/Tqnv3w=;
 b=arg2EJeAMooje1J4r+6KLTtDraJYJm3mWHG/px7GzkhNb/E8WxN6VxCkvqi6LvTWe0OlxFcnPnuwk7zgZQiC4AozLivxYo0Jf1nGLRWrhSiofQXlwE+YbSzgud1+NMsUUy4ax9eKX8AMS2zuQ+WGGqWoTdkE4pwo12bmw3h9SQo=
Received: from SJ0PR05CA0148.namprd05.prod.outlook.com (2603:10b6:a03:33d::33)
 by SJ0PR10MB4640.namprd10.prod.outlook.com (2603:10b6:a03:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 07:27:35 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::ca) by SJ0PR05CA0148.outlook.office365.com
 (2603:10b6:a03:33d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Mon,
 9 Mar 2026 07:27:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 07:27:35 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 02:27:34 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 02:27:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 02:27:34 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6297RV9B659938;
	Mon, 9 Mar 2026 02:27:31 -0500
Message-ID: <89c40ed3-50a4-419e-872b-5cde8b26b8a3@ti.com>
Date: Mon, 9 Mar 2026 12:57:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-j721s2-main: Add mmio-sram node to
 main_navss
To: Brandon Brnich <b-brnich@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260302181800.445653-1-b-brnich@ti.com>
Content-Language: en-US
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20260302181800.445653-1-b-brnich@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|SJ0PR10MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf56efe-e82e-472a-9560-08de7dad558f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014;
X-Microsoft-Antispam-Message-Info: rheRtfbHTugkp0MZNaPCkt49m1zCyDePuWTQW6SOWwVQth90dE4SjIAB02vtZ67E/RPmwvIZ4297RW/y7S4a5+46Fc/hxYYjSJUOAsAiE2f0p1TEqXt9WC5XAeCx8mBWrHhlz7/cQz6OW1zr17XAoSxASrFb5NfkUC19BR/a1meGe4zPkvXFRT5tqV8UHArpenlDkPwUq2GYX2opEwdqLee6ObqQoPHdKbEchEIGMDPwmbDUSpVmD8DTyijM+y7CxcdsRP//2dMPlIioiO8/LDhv/kp6+Y9xcwidzXmIkj3F7l50sY3zMKPJAJxwsWVPkxe9QTSPMs6wSXHTbksgm2fFTeYYIJVi2j9EaRt7Mi1IMvOJs1T6xSz+ZuWmy0hmARPv5gyMvxvN/rHogzZqFsgslhjEeQS0tuupnU0zvy+MGPqDllpSGrY927d5PXlzOP4nDJuZct13qPF+clGOgntkyGq3sp+7W8Poo6JhwCSvYo5egsVApEGy0OAcaXLTTZ3Nuba7mYK7ykx93/fynFE+C7rkK6KB6yhiU1iqObooEUrsKvTjgdyCp4ErEBuXSkjGPDwjvdMm5pv/cNNl2DAh9MqaidS4Qosg4el0IWJuuf68UknGDsRpD5M0nqtaasZeU0Da9Q0NwPyLBctkzCFw/qGNBrRI5YDnAsQbpj1KQAJGdr6P3ze+3eEO102ZwyXdL6acHnQwgwkjgyA4xIKWByrs90tN9zHfpPFcgyRMbH7jNBTMr/ahEvfO6NJ2iaFB/q9JTNn1w5GbvcGUPw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: E09Ik7qd0mAiuQi6Kz+lIYFZYrauMYMRbW+ZewahOk+99zsY8JslKDpQ16hGDFAh08UpdRgg5doUJArdsEvmZci+/iYlCzwj/WuVn5AG8bhxyLjzk3GQQ61MORboG/V/7McIyBKKQ1BERN3BdoaeXfCyWG/e2D1RKLmxASuT6RQ4MgPIXis9YDlj4n+Pb2AnbOnfqLR6RaplNpbJIfuy2P36fWJKVLJkyhBtFwzmQmvuhG6CYHQ3Whiq3HabAaTJpE1/y3hWrM98E621bdlLcbO4GiCKHKTZ03N7tp9QZzcPFzkwYzCec3MrTTpKpYk+1A+hmNAwFHf0Vk8ey9MXOx/JtVuDTA9KAtdcUYyCZNcAzytDN1rEVcsnkDW8exLNuXwqnq/J/YekP/fTrh52qD+nHWzQWqFRV+WXf5ROs72rFJzDW8mwHY1HrKMazB3X
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 07:27:35.0077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf56efe-e82e-472a-9560-08de7dad558f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4640
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_002745_237304_0D8D5EBD 
X-CRM114-Status: GOOD (  11.71  )
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



On 02/03/26 23:47, Brandon Brnich wrote:
> The NavigatorSS (NAVSS) address space contains a 64 KiB on-chip SRAM
> region at its base address. Add an mmio-sram node to expose this region
> to consumers via the generic SRAM allocator API.
> 
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> index 80c51b11ac9f..7b1ba34ab719 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> @@ -785,6 +785,14 @@ main_navss: bus@30000000 {
>  		dma-coherent;
>  		dma-ranges;
>  
> +		main_navss_sram: navss-sram@30000000 {

This fails make dtbs_check

> +			compatible = "mmio-sram";
> +			reg = <0x00 0x30000000 0x00 0x10000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x00 0x30000000 0x10000>;
> +		};
> +
>  		main_navss_intr: interrupt-controller@310e0000 {
>  			compatible = "ti,sci-intr";
>  			reg = <0x00 0x310e0000 0x00 0x4000>;

-- 
Regards
Vignesh
https://ti.com/opensource


