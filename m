Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D98EFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Dw62R+FCByi5gopu+2HRV5jigeobhWPm71jGGzho2Q=; b=pcW+MB2LSmLwpeVy6000XwWIkG
	Wil0WaKsAfomRCuLaL7zoGMC9SA6XZZdKjyzcRLeTlc6bPaszQn7uxLLCGKGXtSda9cWQLEHvlJ0K
	wzIgjt0uM324SwwNRp4GRt4NNpLSnIMbClsCqre8zrx+VU8jS4aQFwm2mmoezcCRlUu6j7wyudVk7
	pbwOC6u4Nkk88XHtayVK/8szlGhfOpQxQiqvZLmUZKi13vfdsvu7UzOpzxunt+09mMgJDAwCd89qI
	1SdxX9egxsPTy7dM4uKSVdzj2jYqaJ+VAyi0t7GCxLumpN+bCLD8fgmcdcMlqxhL4AeB5OmwuViTf
	YyYw140A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcr3-00000000zkj-0a1m;
	Wed, 06 May 2026 14:04:01 +0000
Received: from mail-eastus2azon11011066.outbound.protection.outlook.com ([52.101.57.66] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcr1-00000000zk2-0Qkc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:03:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u23pHIv+QxXTyQEJPRNFRLWibSxEi70tVGutoI/qZ9Ze196L4maDXTLPXi6VoyGLOmrfsp1XeE56kfPOpOiO9BbAWC5wxIqComk5XsfwmGVXcAJfC6JeSRfsxeL+P0ddvPfdUjYqsZPU627QXZ05RiqHVgIJdyx22zBFVYAe6RkQfinQwI42dptRVLQE4qQRjhH3xegKtRiO2SIu3a6Od18ot6uM/Ft7GBeiWoclFvE8hJNU+eCYqY6KmF1QLwmSp1L2TEp6e+ipg1TQ10teeHCnshmA2qmi4L5sZdTU8SulYF+K3VAFkw5nG8nh8CiQL9yRpRKKjFEAo1RuGFtsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Dw62R+FCByi5gopu+2HRV5jigeobhWPm71jGGzho2Q=;
 b=oLTb3e5xiPU07yFFZys9f4aPAk2IBD5kK+z3f+NsySD9hWOt6G1GDBcHMLv2hBvLTDZXhtNB80+RFLHcMDSK1I2JyUN3yLp8ZpX+ib/KpRafH/YJsTeOFrwAC+bb5/4k4fJXoXnz2nH6M5FnRY6cJX+ZFErvQx9P5L81As4AG+9NFPnFFJjdteCSfzFmL/XzleNM2Llo8DlR24qQwxNhOWigMAfcwZCem57jwFV7Rc31blQZ7n7SHehaocHZ2dFtopqIgQv3hEeMiMlldFZG43oKR4TQeTNkWZvyH0S7yPo0il8aAA+k0t5D/HjTPYt0NMZhStEoys+2R09VNQT96w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Dw62R+FCByi5gopu+2HRV5jigeobhWPm71jGGzho2Q=;
 b=FBbwJVgFF367sijRnHEDscpdLDriglrRoZdmhkqJSL4tCS+IhPSU38IZIuwfNnvZQGD+ic5Qaytp41tlZXImwjiULOzSFSd/ZlorLKS9qi5sDIQ3Uxi1+dYE6Of1jJS6VaLU37OBLtbbO1c81QW0jWeLhNi8p37JHFDE3wwzyOo=
Received: from PH7PR03CA0014.namprd03.prod.outlook.com (2603:10b6:510:339::10)
 by SA2PR10MB4618.namprd10.prod.outlook.com (2603:10b6:806:11f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:03:52 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:510:339:cafe::5d) by PH7PR03CA0014.outlook.office365.com
 (2603:10b6:510:339::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Wed,
 6 May 2026 14:03:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Wed, 6 May 2026 14:03:51 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:03:49 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 6 May
 2026 09:03:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 6 May 2026 09:03:48 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646E3m571214599;
	Wed, 6 May 2026 09:03:48 -0500
Date: Wed, 6 May 2026 09:03:48 -0500
From: Nishanth Menon <nm@ti.com>
To: Md Shofiqul Islam <shofiqtest@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <ssantosh@kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] soc: ti: knav_qmss_queue: free resources in remove
 callback
Message-ID: <20260506140348.isoq2arfmaai3plh@perch>
References: <20260505234600.8196-1-shofiqtest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260505234600.8196-1-shofiqtest@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|SA2PR10MB4618:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d8b415c-a416-4301-0fa4-08deab784d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: B8AdL30qiPcBlec9/HXbXB9NEFYlPnhReG0DP+ET86JJtFsHHNzMsytA4+08kE7bddRND9p+tVkYvupaI+US/ZOxBuWeRTYUOl7XXDE4PEQumjlj+MQq1LO+G9n9BFjd3cx0AUJCfEUXw2TfJbRwMEV8ObzCO8G0oZhf4K8Znyiqhzf0AyjqkAsYu6eo70mI4LoAxs+DsNAgKlnVP14wbiPRTFBtSI9Bi8O/kgQUhrX7xE6l4gdALZDMq04aQy0JEDXA07CNBLytATIK+qMzFcQsDetEQIcK4YWrsnHywxYLKEySS6IHBBR62CQEQGhmxdByecMSVyJeh1pfgASH+y5VNiupa9DIHXzrHfYK8c7eEUP4Ki3kZPI9NOg/J66kwYXGrRtjctTIELQYLCaSZhpvZGr/CnW4bShAW+z7CHPMWEbvYm9oloByaWtSrsZ9ElL+nWFh7hbWDvU+3cC9bl4YtNyy+MdOi+SnZXufT1zlTpuXjDuSM7ZGyj8QeChGBWk6jzO/+epVzUEMAaDrlF3IGU20NnOH4t9EUVWxd0Df2eZP606Dl1Y6Tqh6MnDBdeZz6U9zXZbBYJ5hXY+C9mFUizOR+7lyhd+xsGuNWpPfyCpRLccpuZ6hbb2o4Z6oNnHCbEfDPviJV3s09RnnDodvqbG636aQFp/iF8lzTrzvDgiSBj1qJID+Xv92PBgmM4Bv2fMwyc27Z+mTDn8w8UBGMXCGtLDu9IAJ5w+Khxo=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lUGL7n3wYSiWXJUV8K6q3uH2tTqLBXDvyl7DO2R4pC5UO5jqGvuqM+4ns8Ftbq9G30JWgOX0y6cZNW0e+QzEX3KdtH8zf51s+MK6exkNeOZrgBQcyddTsrqNcFvouy5Ho+xobTCBaXUYMShjpGr+7ODOla9/e5d5guKAUO5kAgf0CbVRu3HknxZlUod41xXm5JIH2BfK+YciY4tZetMiCIUlIFlPed2vffv0kbojznkggf4MlqMeOkkN6r1k6whWJFg3X53A5oP3S0jfo3IktpNDcY5czCGkcvdAJiJyd3Ji29n0br0IXQ71ZnDdm0dSdONns6Y0TxFmuYb6Q4x4tK8R0LEc8K7eEuzS+vETKPuJJ1ZmTMNfgjL83xlULytKnyrAdRX7r+VBrWyW7StIpp8H1ot32iEnsMJ8QlFBhfqxQgbCdr4uKqXeh+hjgaSn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:03:51.6752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d8b415c-a416-4301-0fa4-08deab784d84
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4618
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_070359_351837_5ACEFBB8 
X-CRM114-Status: GOOD (  16.80  )
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

On 02:46-20260506, Md Shofiqul Islam wrote:
> Implement the TODO in knav_queue_remove() by stopping PDSPs and
> freeing queue regions and queue ranges before disabling runtime PM,
> mirroring the cleanup performed in the probe error path.
> 
> This ensures resources are released on driver unbind and avoids
> leaking queue/region state.

Missing Signed-off-by -> please run checkpatch --strict.

ERROR: Missing Signed-off-by: line by nominal patch author 'Md Shofiqul Islam <shofiqtest@gmail.com>'

> ---
>  drivers/soc/ti/knav_qmss_queue.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
> index 86d7a9c9a..8d8245352 100644
> --- a/drivers/soc/ti/knav_qmss_queue.c
> +++ b/drivers/soc/ti/knav_qmss_queue.c
> @@ -1873,7 +1873,11 @@ static int knav_queue_probe(struct platform_device *pdev)
>  
>  static void knav_queue_remove(struct platform_device *pdev)
>  {
> -	/* TODO: Free resources */
> +	struct knav_device *kdev = platform_get_drvdata(pdev);
> +
I suggest adding:
	device_ready = false;
> +	knav_queue_stop_pdsps(kdev);
> +	knav_queue_free_regions(kdev);
> +	knav_free_queue_ranges(kdev);
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
> -- 
> 2.51.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

