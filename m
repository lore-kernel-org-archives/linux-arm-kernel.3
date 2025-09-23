Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6F7CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 05:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4fLJldb8Zm3c4/aGiWqHNke47b+S3OzoDHIgUtntCA=; b=IUQ4wl4e2aEgt7SGLILTimKCUE
	A0Xszf677MCSk1KPkxN1pjrDIB531NyWrGPs68b82Ur2UPOyrR4Kzvm4mLnoR5NzgtNSKdQ9sFr3A
	anCgV3H2jvSRgOp7lrRWvPYkMpWaiM2i38uwWhg5357KcKOE8EaPrhvj9vuBMNJ6Mf8LyMCL/0ZAw
	C4ueRS/3bJdMyi4/vseBJ0WZV00YqmxYna8z6AhU3xkezqghT8E1mI4wn7iFBerW5PdOHH/rb7vj0
	nqovF8skzhjl+0bRRQAssN8gJUotHU4MR8RhL1zSIzC4h9pf0mozAffDKQnL7J8Sz0iLqZDXJjg2P
	FLmmJJqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0vtU-0000000CUrD-2vT7;
	Tue, 23 Sep 2025 05:48:52 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0vtR-0000000CUql-33ts
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 05:48:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyUbYXW5cOy56uvuuF29vEUBUvQlmJVG6puuvquCOdZ495nlWii6+aoxcAMrdgPibsNiHEbBo30sd1NbS2obOB9+ujaQC8LdiI9SwKjfUusf6GJocb7pGDzrX820Fb6p1JLLt/uXpB8LzX6QPLRCNFDKwPTsQYIcEsvVKj6cmcDpT5rV1ykWn82ZpniODC+XEkAULOEkT+zK1xi2FgKRFtPEplOZf2dnKkGGt9b+rudbWcL3C23byx6q9FU704fhILnKIFPnqELZ2k0M4tz50LUnhth5uacR83R6S/bfF+HopgcT1F76Xrbi/HEQ2i+K1xmQx273UJKeCrEvcpZdng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4fLJldb8Zm3c4/aGiWqHNke47b+S3OzoDHIgUtntCA=;
 b=FjJCPKqI6zzsMZw6XEfTfk7P/mJ9xM5bAIMOb4YS06woC+tK++VXhUWwm8u0o2v8I0ORhyXkhG12308TgjUs/aP8gdIUDSIhpi17WIj1RklyuIEsX6AzD3ZiKb8/Hr6mitaGYNsTMHqJAwQT6yhiOiQN4afuWaEXOdDjneBXiLX4ZPANCzmzstzBy1OBDpJKs9DokJk34cRz337WEl73jjXc2PXYTbMOc0M1Ap+bDZufpjQgSMIIC/AQgm8/emlGsg3m3xFi+GnFUz4AHEuE2ruZsIlW1329cv2CNg3F4B6AOmPEwjoLlYWVvhxaQh9q6GqhwO3YMES390MMUXpLrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0170.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::26) by JH0PR06MB7293.apcprd06.prod.outlook.com
 (2603:1096:990:a4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Tue, 23 Sep
 2025 05:48:42 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:28:cafe::93) by SG2PR01CA0170.outlook.office365.com
 (2603:1096:4:28::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 05:48:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 05:48:42 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D942C41C014B;
	Tue, 23 Sep 2025 13:48:40 +0800 (CST)
Date: Tue, 23 Sep 2025 13:48:39 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Jun Guo <jun.guo@cixtech.com>
Cc: <fugang.duan@cixtech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <cix-kernel-upstream@cixtech.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: cix: add DT nodes for SPI
Message-ID: <aNI0t9tYGG_CN1do@nchen-desktop>
References: <20250919013118.853078-1-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919013118.853078-1-jun.guo@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|JH0PR06MB7293:EE_
X-MS-Office365-Filtering-Correlation-Id: a00bf145-eeb6-441a-c38c-08ddfa64da41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gnHI4WtS1LCJ3mGNO5wUPjCeMYzvQu4eOOWcNURYiNRKboCVhwgmcJvos8UJ?=
 =?us-ascii?Q?5IjqkY/Hjqj9xogaYGdfEnqa421BxGlSCQHwlsIpsidh9GWP4BagkCp5VPqt?=
 =?us-ascii?Q?OAQdczpWYBMkY7IjG1s2qSrr68m37BQozWflSVI9em7qcliSUy1ABruVYqvw?=
 =?us-ascii?Q?BTNb2qssqKkHl+f9HY1cd2mVgKkm52aLoaWpXBUBhLgS4Z2RkJ+AGSdX/lzK?=
 =?us-ascii?Q?UH9iLqGvr9GbEv/aWFWbL8GKEq2A+I8+zsALSAGOGO4Xl4QnHHxKxvjqui0O?=
 =?us-ascii?Q?o12SeLmtNAIxLCuiCxn1pe1mTsgSsUQcbUUmHgcLGmwAq81ueWc4zqnjOEsb?=
 =?us-ascii?Q?lE79JMx731CUUhvbklX7EyUKSI9KQZhUQLUGMRwoYELjUx2qoIRMH7xHiE9x?=
 =?us-ascii?Q?kU3MIIY3wBntChQ0THSbkAF+FJEgGqg9hH35ci5KYeghT7ATPCFKK+OX+QOK?=
 =?us-ascii?Q?dFkRG23Plm0UlT9FVCwVd6BYzg7f6H0XGCrxYgoGXBhiQ0WhPd0h6RmdIpWe?=
 =?us-ascii?Q?rUaFdTIkqCwlWefrUSDH5o76SEzdG8Y8UoW0cGSHI4hf3vpws0Mi9imqRNZl?=
 =?us-ascii?Q?X5tc2yPBSkdsX1+2Zvab0N6aWX0PusCafkHbU/O5hD2ZrqVm4tPkGzy5Zcrc?=
 =?us-ascii?Q?PBcdC1vXu4CGpFDjA6+UyVoYSa1HS6YMAI72MfD/aL49BIY8NMlmjEf2FxRL?=
 =?us-ascii?Q?EztWaWfq7x2mGuUZu2BG6gc8Ir6SMu1g4CsJ2NXNsTHIMUcOjJw5i79mRMuC?=
 =?us-ascii?Q?9rBQ8MpiIipmXX6pmhJhB0hO0T7LPhb8G4a1IdZGk3YUcaaefSrd6Oqp4PUn?=
 =?us-ascii?Q?wGaArZSphS7K3/UpXKz5rFNJkRYJnh/m3BGPUdmKrHfHC9pgB24bpZVvKPGZ?=
 =?us-ascii?Q?cG3B1xJ26vOwE/cLoefgZsb00H33CUkY+nENiW30vPTH8fzmnMJIEGNvN8jj?=
 =?us-ascii?Q?Q1Gge9V7gjUCPVkH4Rk/rL/WMrqV47Hqp8H4U0AaoXnvbXOppJgINA/lL1ga?=
 =?us-ascii?Q?wbrarD0EIMqY+jaPI9kfzubgPQvT0vtRWoUKf6FdpFFAjXJ7UWBn2LqRDZlc?=
 =?us-ascii?Q?YSLEKIU5boRg8+SnughhK386G6vKPXEZWuU+Nboy00YkY3QJk5Jrc4XRp9tt?=
 =?us-ascii?Q?nxIW8DXgG8/rtefYF1XA9/zjYY0GfAXJEINGkViwLBaE+A65mS+si5XzqOdz?=
 =?us-ascii?Q?VFcAR3AmAJH1OBL2Tf1zp4fS77sF+4FR4MhxiGc7TAloxtlhhmOJ4Ylu8Yyt?=
 =?us-ascii?Q?j5AGhTxwQSdUOEjIPdKH0hFpiD7C9rAGLFWXGfumh5DORzQ+/ib8U1hFF9C7?=
 =?us-ascii?Q?Kwr/gSdvoGZDG9g9I2lOVZm3kmHzsuwGVvBMM7Y0ylY6ZNnsHv06oZ/0V+dI?=
 =?us-ascii?Q?9XCun/fNb7lSwf+MBo2wop7SiDN1GXed3hGYIUUtjErxQ+ndg0zBaxV/8S4M?=
 =?us-ascii?Q?0jizg+cUmFueS4ukIVK4E41ACGbLsl+0Q481QDXPbwDrybn2yUtTL53nf09h?=
 =?us-ascii?Q?LNCXRb37fG1cgbSgYkFO00p2N4NMzEiPSgb/?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:48:42.0076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a00bf145-eeb6-441a-c38c-08ddfa64da41
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_224849_772581_C2CF04F1 
X-CRM114-Status: GOOD (  14.25  )
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

On 25-09-19 09:31:18, Jun Guo wrote:
> Add the device tree node for the spi controller of the CIX SKY1 SoC.
> 
> Signed-off-by: Jun Guo <jun.guo@cixtech.com>

Applied, thanks.

Peter
> ---
>  arch/arm64/boot/dts/cix/sky1.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index 2fb2c99c0796..ea324336bf34 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -264,6 +264,26 @@ i2c7: i2c@4080000 {
>  			status = "disabled";
>  		};
>  
> +		spi0: spi@4090000 {
> +			compatible = "cdns,spi-r1p6";
> +			reg = <0x0 0x04090000 0x0 0x10000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_SPI0_APB>,
> +				 <&scmi_clk CLK_TREE_FCH_SPI0_APB>;
> +			clock-names = "ref_clk", "pclk";
> +			interrupts = <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH 0>;
> +			status = "disabled";
> +		};
> +
> +		spi1: spi@40a0000 {
> +			compatible = "cdns,spi-r1p6";
> +			reg = <0x0 0x040a0000 0x0 0x10000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_SPI1_APB>,
> +				 <&scmi_clk CLK_TREE_FCH_SPI1_APB>;
> +			clock-names = "ref_clk", "pclk";
> +			interrupts = <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH 0>;
> +			status = "disabled";
> +		};
> +
>  		uart0: serial@40b0000 {
>  			compatible = "arm,pl011", "arm,primecell";
>  			reg = <0x0 0x040b0000 0x0 0x1000>;
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

