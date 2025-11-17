Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717BCCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7E7WiAQ8nMpI6y33yPslhWFJnkDpf0YV+3TomhWwhtI=; b=IALgwQ5QgD1vaaxZefBWSaXDuy
	+vcU0AGJfwXMhtlJGNUH5GxLuHkiJ/z/QpBoG/7KeZ6qjKFXSo2d+gXCVZ/XdiBfCNRDoj+DWO52x
	8G65UqL8g5lmEeZWyaj+okk9h71ioweAoVLVrCBD8xUv5pSW46LGEj/m8jJLHhr3bie/GsQOCEteJ
	8SM6ygM/eCZsf59prlx7BS8jBud26uM9/jNZSj8gC7E32wz61KiFpV0/xJsZ75rCmrIDhTWFt9LvF
	x+2WFXn+QuRh/pqSAXLSCHGjr2QuM1HgI2hp9CdugwMB7xvxAjLU6X+tIGSEMGPzhpNjhPjVZvxfQ
	WMQUq5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvb1-0000000Fnix-16pV;
	Mon, 17 Nov 2025 09:32:27 +0000
Received: from mail-koreacentralazon11023121.outbound.protection.outlook.com ([40.107.44.121] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvay-0000000Fni7-1yc4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:32:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpVuO8psbfTjm6EZS2DM30lKaRvarACpwPQTcPjXAIUlxVkNVP6EuVSTlBDFr9HWamx0ny5PZ0M16oHEeT5kT+zJyDlKcoWwcNr0UeSo+UMmVqCfKFz40GBpMrb6OeUa0AAMiH7P2dLhbVtWCf3OlfFGtI2Rw7weoiwx+knhH//yENCsG6J+JUREk4tcVwn49R8En7OWAHmLX7wobY8tVu4thCGNzw1ivpMLYhEH0ZLPDAtrkK/myYt8ERTHzNOYMYfMbg3iVdt39X0nDsnMDp5D7GPFtcsyiFmCC4JMyv4ko5qjSwi2Z+y//VzsD/a6Ou9TMQq0mX1U28yAXUPY9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7E7WiAQ8nMpI6y33yPslhWFJnkDpf0YV+3TomhWwhtI=;
 b=Kcy7/Wm+m/zuvg2fqqCWH8bJNV/WPiPxY+x8ty3DV+bv9D1wDAZwMS1+IxyrfTRfmzwx93CgrbLjGAWTE7rDApr9hivAQbrh3LcqhifHK7oqUEOiyX/ndX5KW8EC4jzd+Xe8K4jfurZb2nCPixLVBgViKPhuDOoEeSEmlrvSHhd1gS9dhZXkLvC0Lr5Y9H1PpaE2l0x5gjM5kjaR25E2ZVNVjC3eeryBbzQoVa6/TWVx1uvekD61zpt6hAbPKhbgHBOxQ2J+M3yUnhJUxm6fVeo7URLmJgJsobJxGzs9ROcp5gLaURKleqbZPmqKt+/wgxMLnYlB5L/BT+k1Rr0hyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=amd.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0191.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::6) by SEZPR06MB5691.apcprd06.prod.outlook.com
 (2603:1096:101:af::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Mon, 17 Nov
 2025 09:32:14 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:189:cafe::c3) by SG2PR01CA0191.outlook.office365.com
 (2603:1096:4:189::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 09:32:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 09:32:13 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 80CC541C0143;
	Mon, 17 Nov 2025 17:32:12 +0800 (CST)
Date: Mon, 17 Nov 2025 17:32:11 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Jun Guo <jun.guo@cixtech.com>
Cc: <fugang.duan@cixtech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <michal.simek@amd.com>,
	<cix-kernel-upstream@cixtech.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] arm64: dts: cix: add a compatible string for the
 cix sky1 SoC
Message-ID: <aRrrm5kEYGIG-aP_@nchen-desktop>
References: <20251031073003.3289573-1-jun.guo@cixtech.com>
 <20251031073003.3289573-4-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031073003.3289573-4-jun.guo@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|SEZPR06MB5691:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f21231-15d5-4262-334a-08de25bc30a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M/uDj3SeoeCPGbNB50f47nAYHxdcOJKAn3lHezBVel23ovXiLhonSAW9T8Dj?=
 =?us-ascii?Q?SKUq3/IeBVK7yIcUAf93xDlyPO5yef4vmWr1oyKx/WI0qb0FTEA7hYsUP5V/?=
 =?us-ascii?Q?W+JNXAtYHr1HsFFylF1tBnBLX4FWZFBgLKcdC1kAxjSHIGYBbjFwRXr0Ylig?=
 =?us-ascii?Q?HEu4GYotIMm3bcFsj+RebashnpeNPMB3aFlDvEdQcRNN3YuIMUSJ7HBdVBe9?=
 =?us-ascii?Q?bb4LIhQRWoyVRTe3orPd5Q5JGnoH+YzJQgaRO1PG+Zd5FKIQf+CgwL9ZGy3z?=
 =?us-ascii?Q?L1b8q/odmInZmk087iqx6vXBhYh9o5zO7gdReNIQ7oTkTpjnH8RQhG+s96pr?=
 =?us-ascii?Q?WC7yW4kGUoDMDD4Im9K54HAsP7wxI8eczB5mKtfFoubD+Obe4BJ4Sj8/3fBg?=
 =?us-ascii?Q?d389aqORyAR1vkUyskH1kj6PrFVouM50ELQpuqpvZKsbbMImoeO3MvRdZTfv?=
 =?us-ascii?Q?A9FSZjpMWg0eOk3CaboIB0wyqIOF7iqHLfJsadgGJhpaDLMXO9OZ06QHHXzR?=
 =?us-ascii?Q?DCUf0bZ5GeK25WGYrQR79i0LNRO1vXL8NLHU+N+9fpFtdXj1P+hT6YQIQTDP?=
 =?us-ascii?Q?N+Y1djAgzFrISZZQHaA0lUtfo81lhtWTxn31hG+h/qHGaXnBvMnWugW6Xmp1?=
 =?us-ascii?Q?56Dfl/V8PdhF7sYpnsehDBNBclpvw+GqptuLxmaSwDkHiNEcn1PqTvoiVr/j?=
 =?us-ascii?Q?ZJYXukjosJ2krhoO86TOu4juC0bSHCfSGXcihPfsL0f8VrdIdqspaW91g2aB?=
 =?us-ascii?Q?3dW4uxuAWiOkUyEnHuRxzrxHwMVOmrYGG+7L3Bonax5LNbRaytkYa41RzFuT?=
 =?us-ascii?Q?881bu/Htt6KVuz0EkNwQDgyhgA5i2d4nF/K3/XagB/xUeBp08fx5XBkjIqQN?=
 =?us-ascii?Q?z7jYNYXnPeTXoBTA+brxyL5Gw9NUMwvxZZ1OwfA6HsDrl1ymfI6E7k0/uF5C?=
 =?us-ascii?Q?xP26PuS9VfhtWm6iD5Bu5ArZsi8w0wYMB1Wh93E5JUl4xH+yRRUFD0Lb811k?=
 =?us-ascii?Q?jvucdA1SNKxYvopjD7PdoF7SnXV6SGMrfs24+ATJNDyuQhwG+OcfSWhIZEBe?=
 =?us-ascii?Q?YwJjsrJ2pRrXEV3mOVr/WPbM1xxVGvfyHcCYh8HWFM2CG92B6ACWeLiPNTdF?=
 =?us-ascii?Q?fsFwoFVP3tRgrxi9TpKFTJSRBFMfykhcAM1hKyZIhEc8x3eXKjCqwE2hoBiW?=
 =?us-ascii?Q?nSRjKCuo68tcX0oLohC9upExnnS03/AD88/TRBSjnuMt5051Im80swwBQVbe?=
 =?us-ascii?Q?kL7zG8fUG0RdPOqyACIGjjinzYDAdNkzNMChKegP0HX3O9M8f4iSBlc0jqBj?=
 =?us-ascii?Q?QofRuXpiqmZ3XDHBegemZ7V5+uHh9egZNoITmBT7Ar37W3TXkJWHp7kIt6Kq?=
 =?us-ascii?Q?3dF7PwKVyroOYDqFNTq4HQPqld7++sgFygz/DkNpqfqmRU/s6tbkQVFBpldY?=
 =?us-ascii?Q?B9Yep/TY4C/oTuxm9yZxLwZf487hHMGjyoHHK9om66N0PEWvvDtsfqrOZA+V?=
 =?us-ascii?Q?dCt6XLSluxjsugdVyziq6fMxUcWx81qfyAAk91terq0qghPym1a5gZ/DXLxr?=
 =?us-ascii?Q?gJWCRDH54QBRaM1aFug=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 09:32:13.1352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f21231-15d5-4262-334a-08de25bc30a1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5691
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_013224_512482_0EECE09A 
X-CRM114-Status: GOOD (  15.44  )
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

On 25-10-31 15:30:03, Jun Guo wrote:
> The SPI IP design for the cix sky1 SoC uses a FIFO with a data width
> of 32 bits, instead of the default 8 bits. Therefore, a compatible
> string is added to specify the FIFO data width configuration for the
> cix sky1 SoC.
> 
> Signed-off-by: Jun Guo <jun.guo@cixtech.com>

Applied, Thanks.

Peter
> ---
>  arch/arm64/boot/dts/cix/sky1.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index d21387224e79..189b9a3be55c 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -265,7 +265,7 @@ i2c7: i2c@4080000 {
>  		};
>  
>  		spi0: spi@4090000 {
> -			compatible = "cdns,spi-r1p6";
> +			compatible = "cix,sky1-spi-r1p6", "cdns,spi-r1p6";
>  			reg = <0x0 0x04090000 0x0 0x10000>;
>  			clocks = <&scmi_clk CLK_TREE_FCH_SPI0_APB>,
>  				 <&scmi_clk CLK_TREE_FCH_SPI0_APB>;
> @@ -275,7 +275,7 @@ spi0: spi@4090000 {
>  		};
>  
>  		spi1: spi@40a0000 {
> -			compatible = "cdns,spi-r1p6";
> +			compatible = "cix,sky1-spi-r1p6", "cdns,spi-r1p6";
>  			reg = <0x0 0x040a0000 0x0 0x10000>;
>  			clocks = <&scmi_clk CLK_TREE_FCH_SPI1_APB>,
>  				 <&scmi_clk CLK_TREE_FCH_SPI1_APB>;
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

