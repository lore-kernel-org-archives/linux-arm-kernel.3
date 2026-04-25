Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A2DFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 03:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqzDIS4dnR7edifhAc46V9bpYquzevTiEeSagQiwEFM=; b=bau9sN6vO7YRxYfxwy9nqh7eMM
	1CymkXFoY/a3pmSLjBPMV2LsSsBvTxCUnOKRWZsyZSEE7gRgtYJ2MxdpAz5+LyAh5avWcJ0+GEQxg
	7wSHDtFBYYtRonroHva4ZHQJA2nWTkJnfLtPuT/f33rRCD9KGQgx+Xq/6cB7GntBycZhJqPqLFI/O
	eY4lVIGTNByeSTWck5TjsEq4agcJKAwFga3HSXi//kvKik4Lu9jmlFu6RzCSugEXPtBo5V+umTDG8
	911vfTD2Kz1m6/FVrDSpIYZZkMOfdLaxysLMeorkWz4pAGwmF5hDjbMgWxVMucG0iI//z8d6umfn/
	y4Q0TUBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGU3t-0000000E3WV-07wN;
	Sat, 25 Apr 2026 03:52:09 +0000
Received: from mail-centralusazon11010045.outbound.protection.outlook.com ([52.101.61.45] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGU3q-0000000E3W8-2bUi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 03:52:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3NOzQFX09R7UoVDTYm3xGRMN4w7RazYjpikie+tUgpHFgXSLvvdUjKVKnOuOxcQIyup61qzfLWqunasOCrgD4bsJpSy/V6kjjRFF8j2anqSyZcLCmaCmQ4Wh1xqXDXiczBoOSHvO/S3eAos9ulMBatu4hzX6ImLDPsXtFfNo3qXu93c8gMP3VeLhHgGyjo0kFSWjsUOdZBxjdfqzoMopoE8TXFbUBrSO9H47j1OGc6QGp29WivwHYqU2VGUmnlulz3xK/UtOUctlwPbuk/FX3/N4luBvoxKqtjgdIUjILJkP7llafapizBMekYevGsPpRLLQf25v+rh+S9saxF3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqzDIS4dnR7edifhAc46V9bpYquzevTiEeSagQiwEFM=;
 b=D+EwpgvUMolawGG0RsffVcx9dwOkx4GQTRlDHdVeQmbpMh03tJSNXvBgQIbTS+wTqPNVgqv1RZ8/VQTrEydaS/gPBn5ECRCetOht87gU0TcMOaDAsVoPxwET8RCNG5j83bmcrzzIX/9uO0T746bC2ORCpWFWzXranrqvgI7nZPB0gXagmr6hgc+nV7RmDH3a7yGO+gg/I6vBo9BBd4pUpuR3FfQPLl2P+F8U7rdXZVnOJKid2CaVIuWvbcBRHvhmRLnXUAqoI2MZcMKIoQWyBx8IpW7bvFPHMS1SbBbnv0GQMYbRIGbFFyhPx/kPQYHg5DgcmAaw35ESWAZRec5jJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqzDIS4dnR7edifhAc46V9bpYquzevTiEeSagQiwEFM=;
 b=to+G3mY1m6XNsfpPOXekWXkxveCgsc/ls48/ITaF4yb020dhhkkrElXVMHNHL9J1SPaCWCF18vy/0kNqTrlUWFPnKtVGZfTiFrBWXZR1t553cLegzzFUquTKXe9IcV23pfTarddmcwsFoREBMkAYrQFr3P8qlsJlMfYX4tpyjMY=
Received: from DS7PR03CA0118.namprd03.prod.outlook.com (2603:10b6:5:3b7::33)
 by SJ0PR10MB4576.namprd10.prod.outlook.com (2603:10b6:a03:2ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Sat, 25 Apr
 2026 03:52:02 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::f8) by DS7PR03CA0118.outlook.office365.com
 (2603:10b6:5:3b7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Sat,
 25 Apr 2026 03:52:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Sat, 25 Apr 2026 03:52:00 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Apr
 2026 22:51:59 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Apr
 2026 22:51:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Apr 2026 22:51:59 -0500
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63P3pqwS3131032;
	Fri, 24 Apr 2026 22:51:56 -0500
Message-ID: <93ea5065-b8a4-49db-91b3-71170905fa15@ti.com>
Date: Sat, 25 Apr 2026 09:21:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: xlnx: check remote node state
To: Tanmay Shah <tanmay.shah@amd.com>, <michal.simek@amd.com>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>
References: <20260425030231.3145225-1-tanmay.shah@amd.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <20260425030231.3145225-1-tanmay.shah@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|SJ0PR10MB4576:EE_
X-MS-Office365-Filtering-Correlation-Id: 078d81d2-9a3a-4654-8d8c-08dea27e0136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: KmVsRjFRiWeGwm+ulvBAn77qNDc7aHNJq5wgIad0n06SFwOjznhkUKYlghTEfYTuZKXdiYypccaYjsqS/GYJ8IQQbcjVSoWPlicNAV30GdijfDxHGqwEdxmzFq59d0xZ2ARNuH/KUGXM5gNjNuWO/gfsOvcAqsAmxem4Ji3WRLq18ZdADwm09VRpDnedf3PP8h8YVPigOfUvo1xlfaD59Xbp89oJ46Xk6OwJDDuj+Im1cANDV4ONn880DCUyoqJlY3ODy6zPZAT6iL4m+fqmaaRguzj5Bybsa/mvcYfOxB2i6QKm6Eb4Gbfak2jmEPLaKENDv5EAxS7FGSzO3OK3C6w14I+cnd9rF0uLzXntVo6odfwR2lR+Vbff6dxl7n1NgWhNMtNJYB5a+0x75PyFPYowZ0xX+vZtish6PC5bf4UV4D5JKGgfdMMBPFflNmFTczxPqP6MFjdVX6MyLK5ZgcfXIYH9/UpQgW0i4MVNMp5CiZrITOUB1GxEltWUSvS1rYQA3pN9YMRH4vHznP+zJUe05tVagw+2WD8FxF0fvYLmQgh/9ede+RqQQyOJvG+2kgn/cv1SHkJbM8PU76gmrbbo61ZF7BMLCFWIoLBx1Giru5o6U6qDUEJI+RIbsv1vwyAYkx5dFsI4ys+XOyj9A6BVEcgTIsAONz8CH3Lp3TfqzK/0AuWpsxAP89/T+Es5fqkN2W5stwsx2we/EcqHgDMw8FQuAyw83oCYCIHsejxGU8RzkPJnZwWo0eeGPTEeX7EUfrCEHl/vh+5k1PMySQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Yg4UtacDdA892N4UAT1CWvAVjOkJSEbfZfJTNPcPVcTXdmVjk8r4eheBT6HF0pw4FiNI2gsyJY8XMujcD7OvDjv7i6pzd7jm9emEAl+bjEy4GKD6TahReDesGsYsxyXTuOX+uxu2YKtL05q+hz0NsBjrdng6rvEO3dL2YaFJkA+BDF9QZnxu28xsSZr6L8SotLvUCcNQYQpVQQL3oycF9cLwHPpRtEHz4hKeLl99ib3h8VeNPrSLKO9XdT3X8CT+Q8i7F99Ytzrve/V2CGzcpQdBkeLIMaN1CUacgBmvHpfMNRe9D8XHdBN8Mpb8vSDFWJTqjsd3PwaPxJ7++kwXFHfYAUIsI3vzR5Vw4/ufR6zfcd2iV5fEEaDX0U4MsuHdfsdmfYKQgsu3MjXtI9alTl/Ii3oUPRmIVLlfVGywECfgJNG/Q6V6zmYtjdZt6+FF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2026 03:52:00.2077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 078d81d2-9a3a-4654-8d8c-08dea27e0136
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_205206_775110_F83E5B9A 
X-CRM114-Status: GOOD (  35.62  )
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

Hi Tanmay,

In $subject-line, s/remote node/remoteproc

On 4/25/2026 8:32 AM, Tanmay Shah wrote:
> The remote state is set to RPROC_DETACHED if the resource table is found
> in the memory. However, this can be wrong if the remote is not started,
> but firmware is still loaded in the memory. Use PM_GET_NODE_STATUS call
> to the firmware to request the state of the RPU node. If the RPU is
> actually out of reset and running, only then move the remote state to
> RPROC_DETACHED, otherwise keep the remote state to RPROC_OFFLINE.


This is a good additional check. However, one thing to note is 
remoteproc core
framework will load the firmware if the state is set to RPROC_OFFLINE. This
will override the existing firmware in the memory, I hope that is not 
fatal for
your usecase?

>
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>   drivers/firmware/xilinx/zynqmp.c        | 28 +++++++++++++++++++
>   drivers/remoteproc/xlnx_r5_remoteproc.c | 37 ++++++++++++++++++-------
>   include/linux/firmware/xlnx-zynqmp.h    | 21 ++++++++++++++
>   3 files changed, 76 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index fbe8510f4927..af838b2dc327 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -1450,6 +1450,34 @@ int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>   }
>   EXPORT_SYMBOL_GPL(zynqmp_pm_get_node_status);
>   
> +/**
> + * zynqmp_pm_get_rpu_node_status - PM call to request a RPU node's current power state
> + * @node:		ID of the RPU component or sub-system in question
> + * @status:		Current operating state of the requested RPU node.
> + * @requirements:	Current requirements asserted on the RPU node.
> + * @usage:		Usage information, used for RPU slave nodes only:
> + *			PM_USAGE_NO_MASTER	- No master is currently using
> + *						  the node
> + *			PM_USAGE_CURRENT_MASTER	- Only requesting master is
> + *						  currently using the node
> + *			PM_USAGE_OTHER_MASTER	- Only other masters are
> + *						  currently using the node
> + *			PM_USAGE_BOTH_MASTERS	- Both the current and at least
> + *						  one other master is currently
> + *						  using the node
> + *
> + * Return:		Returns status, either success or error+reason
> + */
> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> +				  u32 *const requirements, u32 *const usage)
> +{
> +	if (zynqmp_pm_feature(PM_GET_NODE_STATUS) < PM_API_VERSION_2)
> +		return -EOPNOTSUPP;
> +
> +	return zynqmp_pm_get_node_status(node, status, requirements, usage);
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_get_rpu_node_status);
> +
>   /**
>    * zynqmp_pm_force_pwrdwn - PM call to request for another PU or subsystem to
>    *             be powered down forcefully
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 50a9974f3202..e2f25d94177d 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -948,16 +948,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>   		goto free_rproc;
>   	}
>   
> -	/*
> -	 * If firmware is already available in the memory then move rproc state
> -	 * to DETACHED. Firmware can be preloaded via debugger or by any other
> -	 * agent (processors) in the system.
> -	 * If firmware isn't available in the memory and resource table isn't
> -	 * found, then rproc state remains OFFLINE.
> -	 */
> -	if (!zynqmp_r5_get_rsc_table_va(r5_core))
> -		r5_rproc->state = RPROC_DETACHED;
> -
>   	r5_core->rproc = r5_rproc;
>   	return r5_core;
>   
> @@ -1210,6 +1200,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>   {
>   	struct device *dev = cluster->dev;
>   	struct zynqmp_r5_core *r5_core;
> +	u32 req, usage, status;
>   	int ret = -EINVAL, i;
>   
>   	r5_core = cluster->r5_cores[0];
> @@ -1255,6 +1246,32 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>   		ret = zynqmp_r5_get_sram_banks(r5_core);
>   		if (ret)
>   			return ret;
> +
> +		/*
> +		 * It is possible that firmware is loaded into the memory, but
> +		 * RPU (remote) is not running. In such case, RPU state will be
> +		 * moved to RPROC_DETACHED wrongfully. To avoid it first make
> +		 * sure RPU is power-on and out of reset before parsing for the
> +		 * resource table.
> +		 */
> +		ret = zynqmp_pm_get_rpu_node_status(r5_core->pm_domain_id,
> +						    &status, &req, &usage);
> +		if (ret) {
> +			dev_warn(r5_core->dev,
> +				 "failed to get rpu node status, err %d\n", ret);
> +			continue;
> +		}
> +
> +		/*
> +		 * If RPU state is power on and out of reset i.e. running, then
> +		 * assign RPROC_DETACHED state. If the RPU is not out of reset
> +		 * then do not attempt to attach to the remote processor.
> +		 */
> +		if (status == PM_NODE_RUNNING) {
> +			if (zynqmp_r5_get_rsc_table_va(r5_core))
> +				dev_dbg(r5_core->dev, "rsc tbl not found\n");


Do you still want to set state = RPROC_DETACHED if resource table is not 
found in the
memory?

Thanks,
Beleswar

> +			r5_core->rproc->state = RPROC_DETACHED;
> +		}
>   	}
>   
>   	return 0;
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index d70dcd462b44..7e27b0f7bf7e 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -542,6 +542,18 @@ enum pm_gem_config_type {
>   	GEM_CONFIG_FIXED = 2,
>   };
>   
> +/**
> + * enum pm_node_status - Device node status provided by xilpm fw
> + * @PM_NODE_UNUSED: Device is not used
> + * @PM_NODE_RUNNING: Device is power-on and out of reset
> + * @PM_NODE_HALT: Device is power-on but in the reset state
> + */
> +enum pm_node_status {
> +	PM_NODE_UNUSED = 0,
> +	PM_NODE_RUNNING = 1,
> +	PM_NODE_HALT = 12,
> +};
> +
>   /**
>    * struct zynqmp_pm_query_data - PM query data
>    * @qid:	query ID
> @@ -630,6 +642,8 @@ int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode);
>   int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode);
>   int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>   			      u32 *const requirements, u32 *const usage);
> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> +				  u32 *const requirements, u32 *const usage);
>   int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
>   int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
>   			     u32 value);
> @@ -939,6 +953,13 @@ static inline int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>   	return -ENODEV;
>   }
>   
> +static inline int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> +						u32 *const requirements,
> +						u32 *const usage)
> +{
> +	return -ENODEV;
> +}
> +
>   static inline int zynqmp_pm_set_sd_config(u32 node,
>   					  enum pm_sd_config_type config,
>   					  u32 value)
>
> base-commit: 6f860d238b44da8ac57be25289b9f4410691c4e2

