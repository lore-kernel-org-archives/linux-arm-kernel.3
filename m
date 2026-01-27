Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2149AD2F031
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 13:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O905Z9FyOcHnzgKWSsnB9t0XxDBscQjyE5NodgqeRkY=; b=azl4FiE8aHCpS3iENWl+vEqFXJ
	R8IVhMBX/5zFkK2Xjow21GoLvx0/pAZh7QyAwDcPVEDT6w6cUJv0J7DjNTNwkpuwQPzamV1TmCY3K
	QHd1mBmEXJxMr1aus7DddUFvupi3jcppzFIiCZLsPyksZ8n5EgJt3hbSxCPExNLxBecz75D+2FUji
	kdDpFM36utcp1m2qfOk3TvM+Lye9y9B2H8o4EqG0y8bj+3zuE1HCGiLD2jlIVO5yrIZDwEk6/Fa+x
	JyPjYMSjPyqTCpwAQ2nU2/ohGdL8XOwACRvi6a75hYK7TSPsVcq32bhCP87RT0ir36/ZxAK4agR6L
	nZ223z0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjWr-0000000ELAM-338q;
	Tue, 27 Jan 2026 13:54:49 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjWo-0000000EL9P-48YQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 13:54:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdbH6i+XV9aLNmbXF8aPeGtYJi4/kacly52YVIRvPfiXpqH5ium3z6M4COiZiCdL0cWs+DZInp/hcXSZddQJYdF+Qh+oRykq1E5d5cyAHCxVFuoxuGYfOmPWC6XBmwI1DQS+1/oNUTm0RuM5uY4ZyYsNtL/+f3bcHtTlCliiE7o2xRfNEJ3InnkpCqpm0tWeQ9G29adoGHBilz3cTLOCi3I+0H95uoFZMpLBlE5lg3Bzx9FTIPCtP7ZX422oyXuUrkhSGh8YYZYUf6GUhdO/Bn8O8WpFBR5GzC0nJfk9LHYMbLgz0y9mIOiVmnv11OZV03eJfoND2fSFASC6snC4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O905Z9FyOcHnzgKWSsnB9t0XxDBscQjyE5NodgqeRkY=;
 b=Xo2Ozmlayy156H7bVp5F+EEd866kKoEdJbw6+tLffJ7VARIK6xsz/29TK53VUjrnvfXCsQ8Wff9JPVbYbXovctkxozWEjbDCWHsXHOMqaT8W1fV3nytp8U8A3LBv3CcnStR90rnLQWOxZV1kbfjYn0lg9vbEzDpjhDG3M2Joq/eDTdcB25hjrAaNuwwvSKIb+W50Aj8IMC8i7E4DbiCYDZdDjG8xOeHsrdEBNPcMB7TBuUxJyvX+Qi/mIaK7navruX0o8ET+kyhxi4b3pP6PAeDPEGYCNGf6Fen2AZEwxs/TVZsJEQRToUddCiRSp/9rkcMmIFtJl5Aij2GZQr8wIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O905Z9FyOcHnzgKWSsnB9t0XxDBscQjyE5NodgqeRkY=;
 b=igOlHFmrg6/nKNtthhrI5vDjv5KuM71zXV+lBAAPQ1g0YqFvkMlWRjNtr1iHlru+MqgUku1r0ww+C+kFzShXX7i/r0O7kcvs1s5WsiS2VKdAQesp+uZWTpfRzcBNtpWyNE3YNCh7TuA36XJ4PQlF2z3kVm6fr+AjOW/so8QtsKc=
Received: from DS7PR03CA0329.namprd03.prod.outlook.com (2603:10b6:8:2b::33) by
 CH3PR10MB6763.namprd10.prod.outlook.com (2603:10b6:610:147::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 13:54:40 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:8:2b:cafe::62) by DS7PR03CA0329.outlook.office365.com
 (2603:10b6:8:2b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 13:54:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 13:54:40 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 07:54:40 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 07:54:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 07:54:39 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60RDsc9E604158;
	Tue, 27 Jan 2026 07:54:39 -0600
Date: Tue, 27 Jan 2026 19:24:38 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] pmdomain: core: Extend statistics for domain idle
 states with s2idle data
Message-ID: <20260127135438.vkmcbpng6xb2adod@lcpd911>
References: <20260119143121.161583-1-ulf.hansson@linaro.org>
 <20260119143121.161583-4-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260119143121.161583-4-ulf.hansson@linaro.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|CH3PR10MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d6f7b4-2aae-499a-7647-08de5dab9e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/yICRF53vBYMvaLut3AoxjZvRzMj74BPYH5ktcB7nSwxuCEG895sBWqwdRaT?=
 =?us-ascii?Q?G0QRwwLXLxCqOfmKKbejwcbLwCJ0uw18A1VCTZxTtOySUIscdOktE41jou3F?=
 =?us-ascii?Q?YhaHSWToG4MT3tq2mmEqF4czZtxSU/RX9NCCZget4AKA44FAk1DEOWgNz4QZ?=
 =?us-ascii?Q?+EbgEyCSHoRG2XG65P/akOvRD+oFesu5UFjBz2nEahlf/t17lgbho0W9mGhG?=
 =?us-ascii?Q?32Y7WTPn9qI6zaVVApruVYUIXgArwE9DsUdxNby6xqrXUFP4j3z30za+i1RA?=
 =?us-ascii?Q?wlovxN/0rdUBu2ytaziseypKZZ8sLn66Mqe+N9nGx4JKNCAWvjwkQuMahyXZ?=
 =?us-ascii?Q?CVwqgMDB73FBe8PkCwVqx15hR85dhS74YKKBMeehYxme3QvdQP02bKQR72ot?=
 =?us-ascii?Q?1LlQioGW9sf6jlWeOOyreoqngIe47XerIuuaSgJcnbfVZShdmr7Ai12PAxaQ?=
 =?us-ascii?Q?oKB63O3rsOS+8By3fcbdc5SblaOSRFCf9x8rQ/e2ZFp+4OwnWosnCL7BLTHL?=
 =?us-ascii?Q?foeUYAHNxYNDF6SZphX0X3KGKmIBY7dDS2FOI+AVbEZZM9R/mAIUWuLcOwiL?=
 =?us-ascii?Q?fSf7OHZbpg93zdw3Yp8FkLp2by7jbI435DS9DDt5XF6v90PcZ4nh/QnwNtM2?=
 =?us-ascii?Q?mfIt2s+C45AJe8FIs1ilZv4CeS29QFkOPMrbJEyfx4n3Z8DWxVJtDCKtk3/p?=
 =?us-ascii?Q?w14Oow56ZbDah7XMNxI7Qt0UUv3DgjgOi51s1Ug5Ud3Qw+Of2ekABuqXH+54?=
 =?us-ascii?Q?jZeW5l6hsY8nXRLl5VYEz6JCicIt+ufsppfQ5sSUsZDFs9p3N5InCURC80GD?=
 =?us-ascii?Q?iSJLb+lGus/6Jr/OsjheabI6M6jDwjXhNLLi4lLjhC1TJF4teXdFRm7S7WI+?=
 =?us-ascii?Q?4I1G1/AJwZ/elhjfiGir4NChQM1JYc2m4PdDkz6+1+Jn1NODb+wUvlwOJioC?=
 =?us-ascii?Q?McH6KiJFnn75d8VqUgeoEI9lVCbm39XXSfr2ErtgzzspXBBhPXAQ8tZZUmR1?=
 =?us-ascii?Q?+OwuPmlPhoRzfs/PjM8SCoOtgjlTaBkxi/U3hCdSSSpp8f3WloDAzeSP1CU6?=
 =?us-ascii?Q?EgoEIotJ/j8lJ4j6XV6y+65j6Xze3oL7deMskOWdo5fK7MNAvFglVmMl5V/Q?=
 =?us-ascii?Q?E9P6Eth/x78YJrls30Uve9cnUfpe04r627ZPVctjaKEeNnPloM+SEnwKvx0N?=
 =?us-ascii?Q?mWQ8kHcXs1Ae4tG6HZf5qixqQWaOOoVAf3yOLJ50gAwUKB7l1ak/GzSc3915?=
 =?us-ascii?Q?hxYmnt2FHKcfpnARJWC8YZZiXNUOFUEsAmkZxL72hsWbZqqXk1HbudkWIgtj?=
 =?us-ascii?Q?1Gf8hpUE6yiBtSyNuyv+dnpviQGV4rVeqCM/w96Xk9mZmekEtB79Qzn7LnHF?=
 =?us-ascii?Q?EGL8jn4xUAROtygB/NLKYxstBp2x9U7Jmjvn7+enGMdy0UxN5BKEoITnHbkG?=
 =?us-ascii?Q?PhzwVV5Lfx7QxohWW2fuXyitSDhxwOBVLsJN+YoxRPwnaq16GdEwWAYEndvd?=
 =?us-ascii?Q?zy41rQNNvVBXWLlnzp3UMinFxGzoVXRlw0G1myqqH6JZqoc+nC4s9J4o9so3?=
 =?us-ascii?Q?Rmd+kliMol0UHrwBPLHkmVv7EoIjCnFo2FEXeZOPt4H4/Hr540LAV32BIZLS?=
 =?us-ascii?Q?GZenoUZEf+X1Rn0+BnP9vabP4tgOi1lRNjlG4/TixbckWAN0nfKZVNBl9JeH?=
 =?us-ascii?Q?OU1V1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:54:40.5538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d6f7b4-2aae-499a-7647-08de5dab9e19
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6763
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_055447_217711_5736C039 
X-CRM114-Status: GOOD (  22.77  )
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

On Jan 19, 2026 at 15:31:15 +0100, Ulf Hansson wrote:
> To allow user space to monitor the selection of the domain idle state
> during s2idle for a CPU PM domain, let's extend the debugfs support in
> genpd with this information.
> 
> Suggested-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/pmdomain/core.c   | 13 ++++++++++---
>  include/linux/pm_domain.h |  1 +
>  2 files changed, 11 insertions(+), 3 deletions(-)

This will be quite helpful, thanks alot Ulf!
Reviewed-by: Dhruva Gole <d-gole@ti.com>

> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index bf512ff0857d..bb04cb7ccdcd 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -1438,6 +1438,13 @@ static void genpd_sync_power_off(struct generic_pm_domain *genpd, bool use_lock,
>  		return;
>  	} else {
>  		genpd->states[genpd->state_idx].usage++;
> +
> +		/*
> +		 * The ->system_power_down_ok() callback is currently used only
> +		 * for s2idle. Use it to know when to update the usage counter.
> +		 */
> +		if (genpd->gov && genpd->gov->system_power_down_ok)
> +			genpd->states[genpd->state_idx].usage_s2idle++;
>  	}
>  
>  	genpd->status = GENPD_STATE_OFF;
> @@ -3772,7 +3779,7 @@ static int idle_states_show(struct seq_file *s, void *data)
>  	if (ret)
>  		return -ERESTARTSYS;
>  
> -	seq_puts(s, "State  Time(ms)       Usage      Rejected   Above      Below\n");
> +	seq_puts(s, "State  Time(ms)       Usage      Rejected   Above      Below      S2idle\n");
>  
>  	for (i = 0; i < genpd->state_count; i++) {
>  		struct genpd_power_state *state = &genpd->states[i];
> @@ -3790,9 +3797,9 @@ static int idle_states_show(struct seq_file *s, void *data)
>  
>  		snprintf(state_name, ARRAY_SIZE(state_name), "S%-5d", i);
>  		do_div(idle_time, NSEC_PER_MSEC);
> -		seq_printf(s, "%-6s %-14llu %-10llu %-10llu %-10llu %llu\n",
> +		seq_printf(s, "%-6s %-14llu %-10llu %-10llu %-10llu %-10llu %llu\n",
>  			   state_name, idle_time, state->usage, state->rejected,
> -			   state->above, state->below);
> +			   state->above, state->below, state->usage_s2idle);
>  	}
>  
>  	genpd_unlock(genpd);
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 93ba0143ca47..f6f6d494f728 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -183,6 +183,7 @@ struct genpd_power_state {
>  	u64 rejected;
>  	u64 above;
>  	u64 below;
> +	u64 usage_s2idle;
>  	struct fwnode_handle *fwnode;
>  	u64 idle_time;
>  	void *data;
> -- 
> 2.43.0
> 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

