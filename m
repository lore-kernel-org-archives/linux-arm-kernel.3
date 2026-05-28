Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EDDCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 22:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pl4ZuR/uAzULRR6ywozuD/ZT47QzI8yCZ2q+kPawkCE=; b=t+r0E9DMnrMcptppPhzSNnkq8W
	i73Q1VgM9A6cSFhTmEEKmg+GTg9nRo1Hy9BQfEGQp+NRsfk07vg1z5gE1UmA1McJnne3xppBtNj7A
	Sl6qLPGE12syU1jD1lB5dGaN2RTCXfIDxh4DQZaLRhW6wTFNnejUfXmBoQfOzdkyAiNy0OC9bGk7I
	JOVUfo+omHhKHkDvlxFJ62IY0KfxBKCZ+wIiLAiHfpbR+cBXDDJ+LuyUR0MiON3RQwS/w3POOsWLO
	yj4X8KztVMeSOQzhPGcC/rfw7rNazdq+PE74bF3orGPu0/jvnSRtmDsR4d6WKvB17T1Th6/JQghMf
	G+za8iLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjhZ-00000006VaA-3JFZ;
	Thu, 28 May 2026 22:59:45 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjhW-00000006VZp-3mLB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 22:59:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gboZDGrSkCMt1+3Gvesi3d6EnbMgIVWLbx0I+pO/ly1+7GnaynTema3dt9Du41j9M+IsYuYgL5r2Na+SZ+omA90RXNw0x7Ko/zgdxyY3hWRJD9qdiMWskddCSDjRZ+Bo8fFUXrPAnXem2E+NvugIYRdRS0m3nixDgHp6Fp2HK8aRM0XqZypFxhuxsgzwNb8jL86m3U2l+NmChH6tC7hhHznWqjcx/MMuutbxqva6wIs1AKbeKISLb0akyEhkiliPceAjqOctGcrN7uxLbf+lOzQ1zqyNd5B5x4z3tO5nuCIh4hnUzeJLTt56gSVYKPDs3Kvh+FqI+tfVAw3qoIHP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pl4ZuR/uAzULRR6ywozuD/ZT47QzI8yCZ2q+kPawkCE=;
 b=AnGWvIfqNrHzV0MzmxQkMZw1RJLYX7Nyq/uDzZVaHbNvIyUTb/syrgHiQKBGHQWNeUuR5o5JWN07DQTUJ0Y2m3ITzcGAjy2UE82s1p618JISgc1Za8SRBBxlDABi/uyLy4EcCRXk1ipAb+CobWf1BAlJtMxlxZvXDTvtzdQQjF2yhq+O3HhFocP3j2QklaU38GaBArV2MYd0qiYicKH3tdn6iWLmaKGPvZzvOfQeNeQ7AZRP1ipanwJROiuHfuaiHQa8ZndWukQ3resRBQCaiZGvWpRwg+rGj3KQQ81i2s2A0ifns5y6X6nK1UE4W5oRkyE6hyrtyKM98qLyAHrvJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pl4ZuR/uAzULRR6ywozuD/ZT47QzI8yCZ2q+kPawkCE=;
 b=QAsSEgf9SAbCJCiice99hJ67bIL+/x7Muk+Dmb+mfPmMmy3aK5ZUOCtYOXVlZACxUvQOtimJo8znwcAjNP94Q89HAm3CWWNnN/ZsP59S5MJ3lqT4/LLK73Q3rWEbCfGvai+hHHJxLCpuU82bPZVy4MQXvixyUsl1zZ10Ei+WLRU=
Received: from DM6PR02CA0110.namprd02.prod.outlook.com (2603:10b6:5:1b4::12)
 by MW4PR10MB5810.namprd10.prod.outlook.com (2603:10b6:303:186::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 22:59:36 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:5:1b4:cafe::92) by DM6PR02CA0110.outlook.office365.com
 (2603:10b6:5:1b4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 22:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 28 May 2026 22:59:35 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 17:59:35 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 17:59:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 28 May 2026 17:59:35 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64SMxYgV2429021;
	Thu, 28 May 2026 17:59:34 -0500
Message-ID: <29c9bd27-df32-4c56-8df2-987722d02b9a@ti.com>
Date: Thu, 28 May 2026 17:59:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: ti: Use syscon for the Control Module
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Abraham I
	<kishon@kernel.org>, Roger Quadros <rogerq@kernel.org>, Devarsh Thakkar
	<devarsht@ti.com>, Swamil Jain <s-jain1@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|MW4PR10MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc2ae6d-ec6d-451c-c5a7-08debd0cc9f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|921020|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: XxXrqc+IPFRb4I9BQtS3lj8paAwSwaVmifcpfkVKZfLaJ3zJP+TRrIneuexVTQx+em3q7u8YxR0Tb5hg4sdiKRW+c68KJ0qxTG9/vMVjo/MpnNepgrhM1HatterRptayEq4NayZZxYFjDq+8zdhmC648tDzCFpbEWdVJK2/pejOZJ8kMLEzXWgSFX4rfI3qNKT5wAVkWBG5RhuL3HsKZtvwgyCzBLQRLadhYc4KM+PYJPYzy3ZRtiQTDDnsjIIX8vRpifN3V2Mp9JfYMwghBhKfgPGnygra8qkZfQv32qG6xeJpvEKERNKq8iLknd/r725F7bqTRH7KQqnp/xCjOYxQgjGXtQHDUrJuvsd3D8mucSwKKV4/N5zN5Gs4jcWqSq8ABQjbc0A75GrMendoA8xYIVMtP6QctMdrbTyb3UIDWimfBjRzmfyS6IyabaHGnqTGSnLNkpjXcCYyfe3dVibcMV8qSovmmoBhCG3/esOzTnSe0DsvY10Kc6kck973tUxVpCEvNpoVL0wlwS+cfmnbyKzeIVXxPNnuqNKcKtRqanQ3er1k7aaXIlVo/b7aqZTBSvc5k/qKalHTzFpdgXvTgv/OoEjgNpYnYxYM7kXR+wfY6ANIRhYhE/Q3Qp/yI2QPUkiCTI9RP4N6ceQNd9fs91tOT0yua+92DSUxVfAev2PXCNAdQcbCJMInRKM2kyfxtnDdkFLLLPw/KOQq+e5cr/yJJ4TmGay4DTCiimDKqDk6UYJ2Ky/mL9Tp8XLJ/ZjNVDxcT7dSwjfrsyGoENA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(921020)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JpWOVXQmS4xmm4iVDvCVEsazLx6UGkH+ZWVykQ8MFNWakkjiLuAHF+QnL7At0OjESx9wBlLuhcxfJ/ntaWJOFjiIxSGgGnzwCSPzgdM6tG3vvGkol/VL0DrxH3pPWtXUi5ZFmf6e0/mq5tGlhdqJyxo3XHoamJboB8NIyAS4CxPP1Nb/BHf3DgOAXsjYC4LJC1iW/pZ+JZrzEwGPWddznXhpn5dtHC3ca+FVOQUwIi+SMKxzpNeGwd5N998WJ28A1CbXuKuotZnJYrbAojsAo7LveTf1BpHpTgr79LzlgZtcBCUMQzpq1RoOIt5cbjR+nOe1BahqC2uiC4UyH5ehCcnQOIJlYFfUnmE2gAIN+wE6M5r7ufwqHGVi05LhV+cVvPFaH0fJUbeSs3+p5mhQ9xUh7+2BflJVZvrMdVw4R12Ile2bk7qmtiTb+byQURei
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 22:59:35.7816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc2ae6d-ec6d-451c-c5a7-08debd0cc9f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_155942_955018_95F8FC2C 
X-CRM114-Status: GOOD (  24.66  )
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

On 5/28/26 7:53 AM, Tomi Valkeinen wrote:
> I have been trying to get BeagleY-AI display support to upstream:
> 
> 20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com
> 
> One difficulty has been the handling of the Control Module region, as
> we need access to a single in that region, surrounded by registers for
> other subsystems. In my series I made the related node a syscon, thus
> allowing versatile access to the registers:
> 
> https://lore.kernel.org/all/20260513-beagley-ai-display-v2-14-9e9bcefde6bc@ideasonboard.com/
> 
> However, that's not a correct way to handle it. I realized we already
> have ti,j721e-system-controller.yaml binding for older SoCs, which has
> syscon but it's not used for the newer TI SoCs. This series takes the
> same binding into use for the newer SoCs.
> 

We moved away from this system-controller thing because it was always
a hack to allow us to poke into random control registers from nodes
throughout the DT. This was a mess and also caused issues with multiple
mappings to the same registers (some sub nodes inside the control space
also make their own mappings). If you need access to registers then make
a node with those registers in the `reg` property.

The only reason we didn't get rid of `ti,j721e-system-controller.yaml`
completely from the older SoCs was we were told it would be an ABI
break to correct those DT files. Let's not spread that problem to
new SoCs.

Andrew

> I think this is an ABI change, but I also think this is not an ABI
> break. I hope people with more expertise in this area can confirm my
> thoughts.
> 
> I believe we could drop the renaming patches, and just adjust the
> ti,j721e-system-controller.yaml a bit more to accommodate the "wrong"
> node names. But if there's no downside to the renames, I think it's nice
> to have a more consistent naming.
> 
>   Tomi
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Tomi Valkeinen (6):
>        arm64: dts: ti: j784s4/j742s2: Rename pcieN-ctrl nodes to pcie-ctrl
>        arm64: dts: ti: k3-am62*: Rename 'clock-controller' to 'clock'
>        arm64: dts: ti: k3-am62-main: Rename 'oldi-io-controller' to 'dss-oldi-io-ctrl'
>        dt-bindings: soc: ti: ti,j721e-system-controller: Relax the bindings
>        dt-bindings: soc: ti: ti,j721e-system-controller: Add more compatibles
>        arm64: dts: ti: Use syscon and simple-mfd for the main conf region
> 
>   .../devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml | 10 ++++++----
>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi                       |  9 +++++----
>   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi                      |  7 ++++---
>   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi         |  6 +++---
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi       |  6 +++---
>   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi                     |  4 ++--
>   6 files changed, 23 insertions(+), 19 deletions(-)
> ---
> base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
> change-id: 20260528-ti-main-conf-d75aea5e5c2b
> 
> Best regards,
> --
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> 


