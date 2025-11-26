Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E17AD10F4D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 13:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1GbayFzDnfc6pky7AX6VcgLhtNAuPvYxDBNu5oltaQ=; b=bQNZgK6asuzBu+IexnsVfNlYTD
	jET4ZUqDgmxdLbmxFqUPu9uD2Yc34rR3N9lB6HS1A9+EXnZER5LeQJXBs/AJ71mzhwTxDrbnljKjE
	t065XV6EjGB8wECYfJPOKvILz4Fr1Rf3fD/aAx5KTMBgXJDB3t0s9dMeX+Z5ZQGec/HddWt8pNPN9
	inL4IYi5VxZeZ2Uu2tNJ+TYtZloFtyY8TL12AUPubNvDjWeDlbCfqPFMQwEekLiMOp7o0ousQIvuc
	b6JBgmlj/RWKKHxl31TIKDXB5A9Bf6/33moNndF6xWA1KCsLp4jxJOtTWd9HMnkkjyljH/WKuM7oe
	sgfuqv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFYe-0000000F2X5-1OsI;
	Wed, 26 Nov 2025 13:27:44 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFYY-0000000F2WN-3SDh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 13:27:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w04ws6Mf7aG7PbCFzWRtdZ8JvsaBFMv0yZC85xty+Wa/a02X04099wPfXmgyJDZI+2UeJd6NXWO1P4Y7JtHitOTaHzM+A1P4N0uiPVsMRKoMEJy6csyPyJXDqBsWLYA9UcR3UtLN7iYxK4JryNNHyUnrF52xsHS6BGF6Idm/R+Ok4qw9gp0cOtJUjG1J27Tjxbjm82BGArrSRG4eb/M55RgPnpTiAhcEn8vmNFnHtvSvyPTkjz5HarhojEf1OBXCfDO/pg4pdW3n151KNFyReAXakB+gKvNdRyL9NN/mqeKHic+kru75+r0NbZ5egFsa2O/xvTWtf90/rff49z545g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1GbayFzDnfc6pky7AX6VcgLhtNAuPvYxDBNu5oltaQ=;
 b=kUYCxxlC0rOsThQwGKad2IDpWGM7inI6562+vDGoJuwjYPMgsDZJXFlg5lVmikKJkmffwICT8CNNwkGm8dwGHrhSX3vxMY+H5huSKfVS/m6IgOSWKpzRUYBc9cB6KVURi7teK0F+Rrpnm9MdTv8aqjU9pTrhnHncln6PNHKkZG9eguDEchJpP9PB622ontBr7prGF3H40DtMEQfWtF5PTZYG9KMFBreqLkY2tvQvhauZ8qNS0y+gSBdFuVynpNjZvjXDtSYDVea4TH12iWSUrvH8t43GTEvpBaftQdAUjHRojD/rJhAFTHo3oR+oCZEMm9SU01Rg8Wm9Mw7RHyewqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.phytec.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1GbayFzDnfc6pky7AX6VcgLhtNAuPvYxDBNu5oltaQ=;
 b=m6nQ8g72Nwrn777Fob8L5UzNSV8ke6upmpYh/XV5RbOQnaCZUeLcOrvBKC/P3T4SRAJ6Wix5kXKbpCXx9RgyKM1ZXkr2mXj4uEcuuRvaYujMWvlwn2efqbgZd9YCUjRHRcFqLLQzEbdM5R+U9G8cC4KmDHK6Alfgfk14Ov/8WMY=
Received: from PH8PR15CA0019.namprd15.prod.outlook.com (2603:10b6:510:2d2::21)
 by MN2PR10MB4336.namprd10.prod.outlook.com (2603:10b6:208:15f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 13:27:28 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::9) by PH8PR15CA0019.outlook.office365.com
 (2603:10b6:510:2d2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Wed,
 26 Nov 2025 13:27:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 13:27:26 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 07:27:23 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 07:27:22 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 26 Nov 2025 07:27:22 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AQDRMws1310186;
	Wed, 26 Nov 2025 07:27:22 -0600
Date: Wed, 26 Nov 2025 07:27:22 -0600
From: Nishanth Menon <nm@ti.com>
To: Wadim Egorov <w.egorov@phytec.de>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-am62-lp-sk-nand: Rename pinctrls
 to fix schema warnings
Message-ID: <20251126132722.xeplfsvg6eon5b3j@reggae>
References: <20251126084403.24146-1-w.egorov@phytec.de>
 <20251126084403.24146-3-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251126084403.24146-3-w.egorov@phytec.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|MN2PR10MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: 348d1e5e-5b3b-439e-be62-08de2cef8a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O6PonMs3tTSF3XVs01BscSXsoE1Si/pzoyzBPK53Srg7LS8h31p5hG8rlnIh?=
 =?us-ascii?Q?vgtjUdRSR8LvtY76G2p2WizrEUpM4v8sn1+0GPmqTuxVH56g2G/IOXQ71sGP?=
 =?us-ascii?Q?xZbIHlM9gPXq/UXVaUPJt6jE0nmZp/hDIU65DADGvuZxeD0Mr0BHh9MFbcHT?=
 =?us-ascii?Q?5FHbbzBmep5ToRKHBro5BKNV7LvxqxTEM/3oKvd66kc1IaqS1PgIbmdY1wpv?=
 =?us-ascii?Q?JU42G6D9+qU8LB/uLkuEIoP3jqCyE6w0xvI9+CIwUzbP1pXalvhw/z1tWey3?=
 =?us-ascii?Q?8wnT++XkXxxd1PQRT6vtysuQKlcu/T9UUAMKZY5L2SLz33doRoBphXxB5mlK?=
 =?us-ascii?Q?W3ErO1WjX464mCRlMK3qeyLgBsPVib2nRtnp55+e1fyVk+OG0m+OkTNEwrt+?=
 =?us-ascii?Q?RlmT9+wL4mOIWj0ZLkQYoMlXiylwjPxgaHLfVZtl4/jdEhr1N9mNiZ4JOmQM?=
 =?us-ascii?Q?kzjV3uM7V34eAW5INeta9PJNsUWjpAO7AGSjqMZDTXbh351osSH1wmqm9saK?=
 =?us-ascii?Q?AWYkgBbmjfrbqlVjLnDKwLYbQi/AL5aqN7i9+Io9NLhxT+YomDrCFtulq9Eo?=
 =?us-ascii?Q?vf6wRG/CeA7LyINqULznMj8MLlrslxLUibHkh5iHrn1vYfdDYQNwU/yBemjB?=
 =?us-ascii?Q?BcbS4ckbc2+GOKLmOivPb3Uz/S40mlYFyKHi+WikIKvygsgoJbg/M5GfmuvE?=
 =?us-ascii?Q?juNPBA4tTcb57k9NiOjK1ffWNhuiVT36CtrD6uPqzosrBU7X47mEuKKg+0pD?=
 =?us-ascii?Q?ua21/o/1ruxd6Zo9xZ0tXGDEb+PPf3sLYc1ZsO8P5PhBfpYFcE4zWEFF+vTK?=
 =?us-ascii?Q?IabmYT0MsPgD6pmcc4NgwMW/GA03O8e0y84WAeASPO5xEas1AYZTf7Ve32Fr?=
 =?us-ascii?Q?cLsMpibcs+wl0XTVV+O1xg6vEQFR1bNkX5pOjxql37xUpdJ5SaSXfBg0ngq5?=
 =?us-ascii?Q?jMMYHDI9Puqrfx2FKIZ79gNrwO1Zt26QC1ItL4qqgTHmiu1vBcHgerhBXbJd?=
 =?us-ascii?Q?bJELjNvDwNVzIpgjszNbnnRklLAmuvkrVNzVLDqzgXYoD1/WXCOZ+Do8Bw5K?=
 =?us-ascii?Q?hBN5s2viXfgD8nfiYswL2MuNBr/NwgCYPn9IDVovk57JAcyAjv7dZG87pLFH?=
 =?us-ascii?Q?qT3xVviQiDgd4C9jjGNHPbdbsGdQkuvIF5undS0EatOLK72sY+rGwzXUvdGS?=
 =?us-ascii?Q?uqwl/3xluZWmswkCt3HbhHRNnH886uyBbTdJmFhkdxDrXZ5kBbzWdsKgEmLW?=
 =?us-ascii?Q?YOSm54W5tDgks9yEgHyHmBubtG3C9lZhreMR+O0kjnFEE9D1MkDBar1djOdN?=
 =?us-ascii?Q?PNi63pZj+XfrGLsHzF/XV2eNCx3On5cYw6K0+rPtxQjr5ncf77f4J2JyZNqZ?=
 =?us-ascii?Q?avT85fw20VBik+ep8jMP4IRdfRDuzbpZ3s9lzDiXzpN/8mN4GX2zs1/cg7aJ?=
 =?us-ascii?Q?fGOzPLsKiUMDIKgN3LJLCFElU8vehOnJavoMLxwEZYxSn5q8yiG7R4ygjuve?=
 =?us-ascii?Q?PVZ9f0P9en+z95sP2ahu5EkmQdRLT7Hw0szRezmqZZxMsATC3pPxKAFhKiXR?=
 =?us-ascii?Q?1WyXHSrASYDjVp6K2L0=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 13:27:26.3532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 348d1e5e-5b3b-439e-be62-08de2cef8a64
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_052738_965633_A63260C2 
X-CRM114-Status: GOOD (  14.98  )
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

On 09:44-20251126, Wadim Egorov wrote:
> Rename pinctrl nodes to comply with naming conventions required by
> pinctrl-single schema.
> 

Thanks for fixing.

Could we add:
Fixes: e569152274fec ("arm64: dts: ti: am62-lp-sk: Add overlay for NAND expansion card")

If I am not mistaken?
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
>  arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtso | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtso b/arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtso
> index 173ac60723b6..b4daa674eaa1 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtso
> @@ -14,7 +14,7 @@ &mcasp1 {
>  };
>  
>  &main_pmx0 {
> -	gpmc0_pins_default: gpmc0-pins-default {
> +	gpmc0_pins_default: gpmc0-default-pins {
>  		pinctrl-single,pins = <
>  			AM62X_IOPAD(0x003c, PIN_INPUT, 0) /* (K19) GPMC0_AD0 */
>  			AM62X_IOPAD(0x0040, PIN_INPUT, 0) /* (L19) GPMC0_AD1 */
> -- 
> 2.48.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

