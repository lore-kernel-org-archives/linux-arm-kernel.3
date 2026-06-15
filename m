Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D52CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rh7gV8X/3HGSyPXpac1fXAHcQVc0304KE83t4q8JChg=; b=N4PeTFHYsKU2TFw0OImmTelamZ
	tkQ2T9RwjWwYAJXvHMtzmBnsKJ1+edl0YAbKjS3kyuOiQtBJkDI+vU5y2QGd+7QoNMYYgi8MdYXw3
	ZOOEl7qtIt0B1BoSpEtDZep3pb3iY6Z5u7XfbyYOUJqHM1T0b8E5oOPX+Gk5yhxFMy2rKbYwMOZto
	koHjVLUNcYWIgjBEVI9kUZ9yZdLpaUUFGiF0lI+24gM7Vc8yIt5mwVt+t/BJwX8IZAtuDyuuOlWJE
	zZd3Ga0HU+3spTbE4FIfrd8iEM0QKSc7GWBT4HjBdmtfCd9SWg9CpARbyDTjklqzHorRBW2Uw2436
	5TUCwFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7eT-0000000EL0h-1CoL;
	Mon, 15 Jun 2026 13:46:57 +0000
Received: from mail-westcentralusazon11013071.outbound.protection.outlook.com ([40.93.201.71] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7eQ-0000000EKyz-08Ks
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 13:46:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEGKzuF+Gq3ZMrzCcinWKcWsqWgUHunwf3oUZ4UbrIe0TRmRg0bCfA9Q6odskZWL14c1LhCdhOmdv50Nz3jo9JxSI9DOlmV8bOU2zkKCOu7Mp86GxYAK+acZB2i7UIDLKC7KjoW5Z586Xoc3igzo8kEfOtvI/e5ihWIDJ7ZVkHeMxvlzpp+ZsvvCcz6M25uv5EDd+EsqfmdjF0e/87/CyBy392DNJYQ6vVnIl+SuesOY87QGXCQ4C3ewnQuXDhhn5r6ltWRQluXlZl2QbVv/KIInhLdnPBlz//5TeS8wT0BAs6vOCUaoYd48H/3OZiQByXIhPqdx1eu0gbOHSXkMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh7gV8X/3HGSyPXpac1fXAHcQVc0304KE83t4q8JChg=;
 b=whvLZVVEAvONL2Ky8kPfqYzvq5H+QFLygP9STgqGaLPC8CbdLEMwcs6Vc9Cr8FKprzO7sdZP2xyavpad7/txlbSAtjbKN3As15A0NupcHHySG5sSPLpEBdTp77bUadOYJnfC9082vc0mCuxWszBVNX+vj2f72jtpcVU7Yv/F0kCOONiWGRo4a0Sb963rRAgllN25sxoJJBw3pCoTOMHeQ1ga4mSEmEhvZzVfe1NoH3dhju0QKFroxG9WV8K7w2dFtCCFwseb5ul+Ce2/yjN8+YfYeHml6Rtz/oORrHg4e8g9FbhMq8kYEAMaNeENiiGqiWmmnNagbx6FWQoao2jMgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rh7gV8X/3HGSyPXpac1fXAHcQVc0304KE83t4q8JChg=;
 b=OpduJSBZ602ty5GakxCqjIR61/XiE0R6qjTD1e+JLP/7XTCUSAEm4ZymFcG3rcmzfvzMiUM+sVF1J5IAXnKw4X33KDyfzPHIB0VDELua/JlDO5CSnBshqDAgpyp8+S11LdrmlgyhLgQcIZV2cFcGybrCL6D7ejzPbdq0umklrwo=
Received: from PH7PR17CA0010.namprd17.prod.outlook.com (2603:10b6:510:324::10)
 by SJ5PPF2D96878B0.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::79a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 13:46:49 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:510:324:cafe::5e) by PH7PR17CA0010.outlook.office365.com
 (2603:10b6:510:324::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 13:46:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 13:46:46 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 08:46:19 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 08:46:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 15 Jun 2026 08:46:08 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65FDk8Mb2021966;
	Mon, 15 Jun 2026 08:46:08 -0500
Date: Mon, 15 Jun 2026 08:46:08 -0500
From: Nishanth Menon <nm@ti.com>
To: Francesco Dolcini <francesco@dolcini.it>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] MAINTAINERS: Add git tree for TI K3 ARCHITECTURE
Message-ID: <20260615134608.adr62go2doeggkaj@margin>
References: <20260615132640.161584-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260615132640.161584-1-francesco@dolcini.it>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|SJ5PPF2D96878B0:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa58c83-3fdd-4dbb-42ee-08decae48b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: PSMshE1vy6Z4MV3eeJh5oULYts8crAwIn4NgVKBsUQl5rmElJl8AEx7pGxvbbRq+81vbOZdrq391Ar+7YziBTpWjR9cwpATCKtUkRGQgQ73BNb0LjurscBbgaIDnJKS5bxxkU6j4BrP0r3NzNwjZwieZSddwOfyM5hYxRDWcIctM4rotXdcN6GBQoVdTjhoG4tqSKZT+Q/0AdC5MrQ0TJFSJJUfULKcmYze6LqFJRBut/5s+1vvfMWJwbkOMH+Os4s3kM9jRCYWiaPJSj5GxbjP9Ihh9wn3kxkHMnDAx+ccwM31/vhbtRq3/1frrHq4X687NALTQqvrGCVP5BLz/gcwTJdVqxnHpy43vonIOxPnHCtcCGzUjKhXhEcbifc+pY943EuFJ5nPZEL6D62fx/VPcYKl0E1//wvkcpp0JTZxzcGrMat4qx1L1u4vDRO7oBB+FU/RwX4G+M7KOYprzQikKcmunuszVY7TvWNZQsN1muewwC0f7pYncaXPrA1allvT9ZwmdfI+rrf6IJlhM6kdU+cpqV760eXnvb/R6JV1f2BYNvDUFpB2IntdmaziPEdTDhxVFfTX36SsPCRAIJ4eETZkdlJmMuParcN4w9Z9pOTqlbeJbabCxTZ3d8KSSrfz6tkB1yWE+Ll57xIsY3hTqiCdA2UQG3/dYboQIgQZHTiiSLzbAnF/R9IXedec5IjG0JFW2RNSe2od9TEZkAkX0Wd2QPITuUUl0pVLDi+k=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eGYd82Ov0Zfp9Iy18INs1fFsYwukCjKf2A6DaMVoQLGnodnbXHH5YtSfPnFp5NS/sq4ekqyUraetY877cgGUvKn4QjbPIkNlRypmPTa55NSTX3nU8dux9CcHwT2jzcWvLPXLCeUKSUHPIepmRP81Rl9sjTC3YchFeG+bZbr73I3aNTAANH4PyR0r+V6LyP2mi1p4PS+gIFnnkAA8nttoHdk+IEjNcJqN1GehYlCJXk6O6+jT2nOjSFqycjpwUSNasUJU3x6mNGiQTBBQWZ5wU+Kit/KiUmpKLnrg3hpaPPGVJk/Ix7VqVhWe0igLGUdAnxEW9Oy96Lo5W4sIhW/VGa+g3/yQ3jexjzaDwwDdjf7WfcQvIMQeY/YCQkUD3LrgcdE2c2CG8x/DHJNvCZHpyurZviUBhRX91m/73PqpmXnYacPcoCNwnzIyjDL770Xr
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 13:46:46.7905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa58c83-3fdd-4dbb-42ee-08decae48b1b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2D96878B0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_064654_193058_8542AA48 
X-CRM114-Status: GOOD (  13.25  )
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

On 15:26-20260615, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add git tree for TI K3 architecture.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Thanks for adding this in..
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8629ed2aa82f..cbc56dc242b9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3756,6 +3756,7 @@ M:	Vignesh Raghavendra <vigneshr@ti.com>
>  M:	Tero Kristo <kristo@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Supported
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git

Is it better to use https?
https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git ?

>  F:	Documentation/devicetree/bindings/arm/ti/k3.yaml
>  F:	Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
>  F:	arch/arm64/boot/dts/ti/Makefile
> -- 
> 2.47.3
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

