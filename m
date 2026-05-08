Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53835CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDlV4NWCiR4kbBA8K7jTos5DT+Ggq8KUEZufI5IYJmc=; b=aySd1VsV32VrLRJUZW5MniK2m1
	Gwnacz+8rci8+kucc3NYy2jU1s1cUe9jVjIecj0BOXMMrUVzQrAeCd3gPK1SkJGubwlrW/t+oV6Cq
	E+BNRdpkauIu7y0hYUa+MUibyiBjR0Mx8pJ9hZQ7x+w/Yquy8ZKd6X3LdOrpL1vsjxq9ySwDAa0uM
	daqNMTcChyZljF+6bbLEtqLDxIpjpUu0BbQ026wBjr/hAmx9UzxzhysmuV+dqJ6MVCYBTfST31aEI
	X9upexQgefTLV6UVjGhpntKYTL23MYFiW8pT22Wp2x5SAJBraKQrsl/etdVbasX8lQtEB/k3DNmBY
	pAk8luMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOeJ-000000074Yw-1eMo;
	Fri, 08 May 2026 17:06:03 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOeH-000000074Ya-1Nnb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:06:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXoBV6bpVsyruAv7qF5egHQ1WpPSkZH+MJYuUSBj1dzQw5cYUEi+NOREfO/iDMaFEpQaJBMWZUnRwrUPDaImaESPtruTzhe+w26/doWbV+PMsAHiMnvpbAJYDFzkeiFCJsk1ZTivnY23dEV2PfXje2uRheYI2dcjh62KeBF5yIcbseDUof+aJBZvSquSQYB3mCO1neCMZxLrzgUEa7aX5Lg4H84bVi+r1XKF+sxnps/nwg/xQ1p027pLIMLSzSS3TfMFtaqn8PaYNq2UAtgv4qbmkUDs2CDF3jFnVsYkgSY+aAtWHenEJH2mDej1W2ekfvw0vrdi2eYEb1EfDx9+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDlV4NWCiR4kbBA8K7jTos5DT+Ggq8KUEZufI5IYJmc=;
 b=QVoveNuG9eBcIsVMTDpe4kakA0TSTkhxAYvTOYRJbHx9QDpoxFczvWc/YRbVgGGxd19WCdveVNyDvU0qoX9GaaV86dYQ1WT38z1/Fbk4HkIYsOYMzoJxd8zysa8ZhbKOHNY36s4He1h7DbUCWFaW+lxyUCZX6HEvX4UOpEE2DV23IrRA+1r/rBfKtFEVywtzjtXM1aUphx473yeYyscdRKXWh5ArC/AJHIrEMxwWF1Cjc9HbRtArO4EnwgBxocLK+vfkB1MJtbwuuaGXtI4OEBMMYIRBKaOedZz+49B5XJ4nJ+PmrkIGxV83RPTAgmiPgWMTrLf9S4d8xWMjH8Ejjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDlV4NWCiR4kbBA8K7jTos5DT+Ggq8KUEZufI5IYJmc=;
 b=X5IfblKY8qrSCk4IYC866Hat8eOAO5miCGDnVZ5MGCrLBOT+1kVIc9LUGBxeblYzPunKGmFZNSQSjLtRQqMyjsoyv7aDWs3pUHbU+thZCSDpJD3o2P8NLw5Nsu4R2Wxh/qiCl6ELy59sFSba2fufQPlDDvDWtGi8nmgNooLe9kQ=
Received: from CH2PR02CA0018.namprd02.prod.outlook.com (2603:10b6:610:4e::28)
 by LV3PR10MB8202.namprd10.prod.outlook.com (2603:10b6:408:28c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Fri, 8 May
 2026 17:05:55 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:610:4e:cafe::3e) by CH2PR02CA0018.outlook.office365.com
 (2603:10b6:610:4e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Fri,
 8 May 2026 17:05:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Fri, 8 May 2026 17:05:53 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 12:05:51 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 12:05:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 12:05:51 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648H5oF81803757;
	Fri, 8 May 2026 12:05:51 -0500
Message-ID: <a994a69d-2482-4e96-8d18-70a09146ce36@ti.com>
Date: Fri, 8 May 2026 12:05:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] soc: ti: knav_qmss: Inline lockdep condition in
 for_each_handle_rcu
To: Nishanth Menon <nm@ti.com>, Justin Stitt <justinstitt@google.com>, "Bill
 Wendling" <morbo@google.com>, Nick Desaulniers
	<nick.desaulniers+lkml@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260508153211.3688277-1-nm@ti.com>
 <20260508153211.3688277-4-nm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260508153211.3688277-4-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|LV3PR10MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: fad5b9d4-0199-42a2-e7db-08dead240fef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 38Hx39yLlb4w747KTMFUFWU6g/sk2yKeWX1qIjfIR17Hh3fY8fVTEhvrVQeXB/xyiQTFyzIv2bzLbENT5i095oVnbAPz/ZNiFF2e+oEO8CCj6itIAHXKEN5VqLYS0nou9XIIGLt7222p/ScPi7OJSyvwn2fkr7vnU4JGSxwzzzEE8//gUCcH6u0FWwjVAa7/9kTAswovb2/hs7yQMXAl3fFuxd9DHE2ptQOYO1x9L5jHutg8ZJIiw5fHAkiPF90dN4FE1iYIIgJuF1cUe44bAdALznsWKsBEdWBWZbrTJ0qaZZMUPrdtWyWDn13+mN2/1BfKOFnqe4xZaf03COY63CpOFcNhxwTjuHQvstPiM8S3e5Fb4WtVfyeslb1zvKdXQIv/3OOFQ+qD1CkAHpHVkqrpvw9a9qqzJga4a5iKbsgqxTMSEF8yGTSWBy2NubT3fph6h4Zw7ScGrQK4GXYa7J6D4ZdymeE5pUHVStyrkZtjYfczmT9TqzkscWJGQHW9AyfbHNxIazD4hxtJCjWwFuDWVWJ4MQV4KdMQbzaK65z5jgG8OZrkwIm2uYlHdqMhyaL17isyvE/2HZSAHeWKKCk8qs/DNbXS5ZGbLx6do/jNU0UyU1hC5joAt8BLIO/6wgfAa9vAFUZZy34nOOCJ9tj0oHSOUxRNyRuF8uAP+fL6qdGrTNk4fkXnG3eju6fUZWQzJGi0i7TSmMCFkXwmAZsiQTMetpFAaduCaYYRBvQ=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: S36an4qp2NrZQ6n4ytx+bZxAPE9sp/AZzZac4nRQDlnzfnVZaX0TuuBziBgsFtwJEaJ2mcbh9f+WMaER0BmO8pIzD/iq3/kGpImQ0XoVgzm/pXRkm9s3rfc42D43QWPOIsIfjsK8BZBQsD5l7NI51V0fK45SB6XwMaLHFg0o3XAy8xcYCpZuREt3nLVbboQtAMQbkYKsSpsTpztvMaib7QVZ+G/7ji7SGt9ePMujG6kE3O+lS9wD5RWL2wYHFJKfE2h3bKXyHnP6KJJJ2UehE6X3EEjsgjlIvUzrLMvRqxQ30xIGD1MawGWLA3tmDn/K3aI7Zb7UlqG8isyC7WdKxEeDK9ZIHc17q8gtrL2PJtXHIz4vYgylXImrt0sJSopwXyeOhwN3qJx4j8npoyoThS2gPaszSSO3lJLB8n/SEeZXvKjWyw2RKi5JXgLrjerZ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 17:05:53.0004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fad5b9d4-0199-42a2-e7db-08dead240fef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_100601_382550_21DE7DA4 
X-CRM114-Status: GOOD (  16.62  )
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

On 5/8/26 10:32 AM, Nishanth Menon wrote:
> knav_dev_lock_held() is a single-use wrapper around
> lockdep_is_held(&knav_dev_lock), used only as the lockdep condition
> in for_each_handle_rcu. When CONFIG_LOCKDEP is disabled,

Is it when CONFIG_LOCKDEP is disabled, or is it when CONFIG_PROVE_RCU_LIST
is disabled the condition argument is ignored?

Anyway, good to zap this single-use macro, so

Reviewed-by: Andrew Davis <afd@ti.com>

> list_for_each_entry_rcu() elides the condition argument entirely,
> causing clang to report the macro as unused with W=2:
> 
>    knav_qmss_queue.c:30:9: warning: macro is not used [-Wunused-macros]
>    30 | #define knav_dev_lock_held() \
> 
> Remove the intermediate macro and open-code lockdep_is_held() directly
> in the for_each_handle_rcu definition.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>   drivers/soc/ti/knav_qmss_queue.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
> index 2c103bb6edef..f65658014b05 100644
> --- a/drivers/soc/ti/knav_qmss_queue.c
> +++ b/drivers/soc/ti/knav_qmss_queue.c
> @@ -27,9 +27,6 @@
>   
>   static struct knav_device *knav_qdev;
>   static DEFINE_MUTEX(knav_dev_lock);
> -#define knav_dev_lock_held() \
> -	lockdep_is_held(&knav_dev_lock)
> -
>   /* Queue manager register indices in DTS */
>   #define KNAV_QUEUE_PEEK_REG_INDEX	0
>   #define KNAV_QUEUE_STATUS_REG_INDEX	1
> @@ -58,7 +55,7 @@ static DEFINE_MUTEX(knav_dev_lock);
>   
>   #define for_each_handle_rcu(qh, inst)				\
>   	list_for_each_entry_rcu(qh, &inst->handles, list,	\
> -				knav_dev_lock_held())
> +				lockdep_is_held(&knav_dev_lock))
>   
>   #define for_each_instance(idx, inst, kdev)		\
>   	for (idx = 0, inst = kdev->instances;		\


