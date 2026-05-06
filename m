Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAB0CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 11:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfN0H5M8Q/r16hqwDOVheTHjmfIEomibxA1V1NGFP4E=; b=NLzlfQLHtgZwVXcbtHtxdcN4pv
	YYSH1FFU+Ty1afZ0Rw7XCDfZ5jZ/hm5oPIsa+ll47nUkU7unqNCRYT0zOiN+aNrxMTDPzu4WhnED5
	QG+kqXDUIgOXDHzv2qbvUGBpjV9bzu1H8fsQsI4jzHLsZN1DVahvag0y0CZsug3eocysQDrxLtYgJ
	NfasEYLUZMByJtm3S4G6xqg2WU6KjclBwavrlEbdfzpwds3ZomaWib2n9ryEdhFtxsFeOsl6VS9u8
	QAnyv/YzRdPSZ8O/jRFHEEEqo8aZDECUKrIKo+tmkVBxHXoqWSdxSNKPPUQMfotlvl8HfEFg4qm0C
	jfdQDrHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKa87-00000000aEe-3eSL;
	Wed, 06 May 2026 11:09:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKa86-00000000aEF-4C6c
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 May 2026 11:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AfN0H5M8Q/r16hqwDOVheTHjmfIEomibxA1V1NGFP4E=; b=E8oGC2UFT8Iuy4qf2ZGvY4fNWT
	eDIfC31BFexz4WYGh1tVGmAOHJEvExMscb1+pI7c1whlW7+wGc4nDITTk7QaEw7e7L2vhHsng7/HI
	P3fxzvu2seGVc6WpUXp+O/xv85hPO0Udu84XcsNXUYx5LkfUAiGHvIACygDw9YTCW7Kh/+RGGu6EA
	gNO4VcD+KyjzN3k4KPPJNsAU6tSahqsoDPdwtj9tLEO/4odnPyk5hPGD5XGWDe9Yir6ndl5/SVphf
	bumrg9bQBlM4UDDgXPI95890VIq9UNHTMwqW09ZURVDRTKPzoGdcASPVmYHYdbZ59KqEohfTavy8E
	EESlBkMg==;
Received: from mail-eastus2azon11011013.outbound.protection.outlook.com ([52.101.57.13] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKa82-00000001IKf-3sEM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 11:09:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMvbCv5HfemFg2sSV7O/cXMjpJqJCCdDMW87FfXLH/NMqI+pVvO8viVOeZeiUpp5Ryt3p5HYBSQ/F/+v2kAjeKd2zubmh9FRPsRF5g9gmGSyI47GTLqS15BhZv8NjOKvapTZdT0LBMefVaBsMSxWLVqwAIYQoG77FU9m7Hh3FCYr3eAaTV+fSUpqSZKM1a9EU2Rm0b8pLuwIfKNSMtKgafcVnM6XkkwxOEFSCuK7urAIkWtdeth7vK1YNp34C962rOmCYY+PifT5UiSYVI4htbhy8yjBkCMljrdJTj6kFIJygpDc8bv2ZLerXwNUu4CwG4QLa90cq5rVZUn3nxNLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfN0H5M8Q/r16hqwDOVheTHjmfIEomibxA1V1NGFP4E=;
 b=BQjY+VCuW8zES14bdrZjV3r1P1l+Vfvk38cykvpDdx7bT0GZgSp3sodFwtwn57cF7Wm7yt4LMinU+chPO/NRo6+FyjcXiXEzYPGtCzQbv6bdRYFzDkGUT/g+QptRhTaWilIZ8295ZG/tDSOH7hEyZdiQYko65H5m4/Vx1rQHqIKgwFLivmN4M+UrPbX8FtQgpnGBw9XgntKrGhd8njwssWYQbK6Qyb2rj+emFALMqRu6YP2nFiQJsPWjF2jiE8SX+/x4sGNctffOUsO7+0rkdXuLjUH4exZYYsi6yxcb6bsdTjU5hMHxa451mZU/y+Z1J6msa+1De79y4U54nZ5vMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfN0H5M8Q/r16hqwDOVheTHjmfIEomibxA1V1NGFP4E=;
 b=Ub1n0yeoe5YVPBx5XP/6xXg4bb1J21JeMZy0/52ZZqHx/XvkJ3ZIPAaqRzF/QwBVsaf0/ynPN6wahtk2+Jy4FmWsBEPDZK9sFL3iCpMXWaaM6qgprvz07jXL+F0nvvOM2h99NFTXCy6jxUgU91d8OOy+Hi+/KtdXTY7jkDkCJ/E=
Received: from CY5PR15CA0075.namprd15.prod.outlook.com (2603:10b6:930:18::7)
 by MN2PR10MB4238.namprd10.prod.outlook.com (2603:10b6:208:1d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 11:09:15 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:930:18:cafe::55) by CY5PR15CA0075.outlook.office365.com
 (2603:10b6:930:18::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 11:09:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 11:09:15 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 06:09:11 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 06:09:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 6 May 2026 06:09:11 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646B9BOV938080;
	Wed, 6 May 2026 06:09:11 -0500
Date: Wed, 6 May 2026 06:09:11 -0500
From: Nishanth Menon <nm@ti.com>
To: Rosen Penev <rosenp@gmail.com>
CC: <dmaengine@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Vignesh R <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, Frank Li
	<Frank.Li@kernel.org>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva"
	<gustavoars@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv2] firmware: ti_sci: simplify resource allocation
Message-ID: <20260506110910.su2s6ncsi2xfdiwm@pureblood>
References: <20260504031209.618949-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260504031209.618949-1-rosenp@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|MN2PR10MB4238:EE_
X-MS-Office365-Filtering-Correlation-Id: 34bbb321-7ae3-4e62-c19a-08deab5fe942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: MCHrfzp7qPstGYsPC9FAZZzoZXtL/cfSDd2zG+VWsILLPuS3Y2dejWvvtpTBmR3PcFcuWcmGe2zKDTNMZVeHapkztEern63jYkxk7KTt50hXcrtS6dCLJnDMSLI+fcYIPc2Z3vjbVZikkdCp1P8X+D2MPMg9x1yQdysoavW5l8Z9FaYYpVusTiNt4goPWTRV9Pzb9Wux79WahC0EnS+U5RAdajA7Qydt6copDdIOgz78QNuWpLW/fcHkO5lwlR1TkrHMP1t567mkPRO24DBWymyRra26b3uWUCUMocEYsuqjZQxZD4/J/IVOYem40SdClsfPmm3D5I8FdV1cCh54vFkPJ4pLDXr/2wMirTcZwuhxB0Hw264QPNE9dKJ4AKiECMPwJsTDM9bYiV0zLccRBwH+S7beWfgYr4USBIhdVXEV51Zb6xRPgj8P0i493XwZUf5RYmxQVTVAsDpfgK3GyeNDKdr5ae6oSpkQcZcFO0Ib7qdav892Pf/Hz0VnbEvGeHLExNcKIwwbrvftZTPozzGBNek5FxKhKx9kV/H1t0eVOYNRvSmHmREZ9EFkpSsrMb5XSabvzPGpnHpzqv/0UEK2dp1azHpi0BQmWXECrTtEkr+QZD+XWbaAvONhyedd1GiHaWY0frpR0yY4jj2f/4MMizcrDQEzjtTvZf2B0de7J0D/0niEqRvk2VzR11ZuWZHToGlga3ojEWyCU0kAfVTfJYrVVlzp40Um8K8DdzI=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GS6tE7L4WyLqHfNFvWXFtioBvtzrjTm+0caSi8pjAynSRuXvWIBEc95P19AStLVMuNH3e43fIyD82Wh8g2Hi4GwoRQjvLVJ7pTImqR5EJZbFReq+QAELfMYTItRjnppY9arCd6y0wpz27y4OjB20hH/j3RQDXYuYU2gcAcccStHiazA5DWsP+n5NeRtGh5yWpzePv536iqbH15kyYWohFrnWAvpDpUcB4BJs1yKKLc8b4/Gy0PSi6N1lvbCz6AC6AiUNeYhzSv78riy0rXn+ufDRYXJVOW7AWnXMYYvEGRJCzX8AjbbhaQfVfzKDfOw/ouyp3KZZMezelUiZCVZaaeKTMvDjwDVdD5ew9pkD9Equz3rOdYbYZfRUbYBWiF/LLzdOw1L+XlgyB4dLnVa2kmdw7/w2ll3HRugVvGpVLJ5Hg4swNoe/h72dx/mmwT0l
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 11:09:15.6030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bbb321-7ae3-4e62-c19a-08deab5fe942
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4238
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_120923_266059_1EF3A7A9 
X-CRM114-Status: GOOD (  18.36  )
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

For some reason, replying drops the CC list. manually added them in.

On 20:12-20260503, Rosen Penev wrote:
> Use a flexible array member to combine allocations.
> 
> Add __counted_by for extra runtime analysis.
> 
> Fixup k3-udma as well since ti_sci_resource is used there as well and
> needs fixing up to use kzalloc_flex.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: add k3-udma fixes.
>  drivers/dma/ti/k3-udma.c               | 180 +++++++++++++------------
>  drivers/firmware/ti_sci.c              |   7 +-
>  include/linux/soc/ti/ti_sci_protocol.h |   2 +-
>  3 files changed, 98 insertions(+), 91 deletions(-)

Since majority of the changes are via k3-udma.c, if this could go via
dma tree, it would be nice. Else, please give an ack and I can carry on
my tree.

For the following:
Reviewed-by: Nishanth Menon <nm@ti.com>

> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index e027a2bd8f26..04d99c1fafa1 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -3574,16 +3574,11 @@ devm_ti_sci_get_resource_sets(const struct ti_sci_handle *handle,
>  	bool valid_set = false;
>  	int i, ret, res_count;
>  
> -	res = devm_kzalloc(dev, sizeof(*res), GFP_KERNEL);
> +	res = devm_kzalloc(dev, struct_size(res, desc, sets), GFP_KERNEL);
>  	if (!res)
>  		return ERR_PTR(-ENOMEM);
>  
>  	res->sets = sets;
> -	res->desc = devm_kcalloc(dev, res->sets, sizeof(*res->desc),
> -				 GFP_KERNEL);
> -	if (!res->desc)
> -		return ERR_PTR(-ENOMEM);
> -
>  	for (i = 0; i < res->sets; i++) {
>  		ret = handle->ops.rm_core_ops.get_range(handle, dev_id,
>  							sub_types[i],
> diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
> index fd104b666836..7632bb11c862 100644
> --- a/include/linux/soc/ti/ti_sci_protocol.h
> +++ b/include/linux/soc/ti/ti_sci_protocol.h
> @@ -599,7 +599,7 @@ struct ti_sci_handle {
>  struct ti_sci_resource {
>  	u16 sets;
>  	raw_spinlock_t lock;
> -	struct ti_sci_resource_desc *desc;
> +	struct ti_sci_resource_desc desc[] __counted_by(sets);
>  };
>  
>  #if IS_ENABLED(CONFIG_TI_SCI_PROTOCOL)
> -- 
> 2.54.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

