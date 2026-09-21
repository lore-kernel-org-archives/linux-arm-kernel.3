Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBBCC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghYGPH7vELo62p4qjEl8XbjYQ9cyl0Cw0SEkMk1uLhg=; b=thumBXlruFOyIwz5W7k7rk3XD3
	aHMSNcYheK4EDHEfLgD4aKpZdWk+JZnM3GQoTuLa9vkfMoymEToqeaz9plkdBo1zf/6AcIndzYvX3
	U5kxMTIenEeWxiE+u4mLF9uRM/b9y7np7SRTygf6g+or2kIxHf8JrE/rzVcrZsagkLel8fOWgJv+E
	sbEJqixJhMtexR2oeXp57vEsed6IHmNTV4w8XeQOncpBO+JFfoZ/qzNfuR5XOtxm5fIXKtdiioMQg
	vKI0l9XhOjvOBFPMuvYnXqXY4tm9dM7rNZpjEm2p4oFXRImzZ4Y0I+j0NP0LWxhHoGW8grrMHCA69
	o8JXRMTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nEn-00000003eFo-2sl4;
	Mon, 21 Sep 2026 23:15:53 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nEl-00000003eEr-1cIH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 23:15:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=et9LxqjynHnVFl6hlCp7rQn+O0JYeTACOsEH8ukvXuxw0TtKfLCVzN0vZzA0mvXZN/QbwcVxJZ0HytMDNobRx/bzeLf8MVAQEcjkq8BnZKem+aaXdN6xtYkY1eT+tmfENqV27fnCjz62y1dCp9eX580emQLqHP+pGZJfZO+Qa9ha4+QniDzgWNtjp+rW/bA/d5mSSNUX6Trg2OKeLlYhSGz71yqHUW86XO5kB71AJL0OXHBd6LVHxNWcTez6UnIl8EUJSgX1+HKAxRhFY9bXlx9y6JyZW4j/SMgt3b9qM5njtQIY/jcK8ZA4FDrF50lw8CG8yp3BLe0uRuWgXAzBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghYGPH7vELo62p4qjEl8XbjYQ9cyl0Cw0SEkMk1uLhg=;
 b=Fc6k4T8+ZSZcKKliSp7ZRlWC/nQ1UOhaPR05QP29DxKJZzMZ4ElDllD8oSsDdbBrIp6Ka0GfRHEfhnQWG6nvofsrP1SRsyPrTTK3myAt/3cB4yCOc07m1V0qWxJYpnWnw/ybFV0eFqEQE08bsF55ppIIxZhXOMMl8V8GQe35n4kiGGRh3RIYVVn2Evg5yM5itMco5OGixNokGfmuhumeHh1e5qoNGU74nU/DJ2o5pqD053c5Cl7zfEhYpkHrYXRkf/YCqFxiNgZoOWrFk0oDoaNvp4GbFbbMiLmcFaplGhqCTpZBJVTaUO3zG55RsZEcB2MnMXQ6ZD2QmYCmO+QWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghYGPH7vELo62p4qjEl8XbjYQ9cyl0Cw0SEkMk1uLhg=;
 b=RhcHAHSJ0SO7wyDjJ359OfAoStaigzisouzySNg23VUWsrPsONOFfZle5Q4MgfK0DItYoyPDC2tz3fmv4xYtj0quNFA17vlxzaRWmha7jqwNjDOwGsm7JBAIrVo5wHX+wCyLRGEZsFO7+JC5h6gDRwbVf9DEnWqLAlOS6wRACXW4VzhZB7ceN1M8Sfmpn8XksZw9h6N5nV3d/7RINcjhfQVXsYObZ4sKp4xh4E4YCF0KPnELeLMezRwZFxTdSdvhFa2DqUAhUoM65vzovU9CG4hiSn666qZBLAijt1ksxg6Q4smvBkuQ8i5rdS/F8ztbL760Yy0AbR98etXunQwTPw==
Received: from BN9PR03CA0214.namprd03.prod.outlook.com (2603:10b6:408:f8::9)
 by DS7PR12MB5839.namprd12.prod.outlook.com (2603:10b6:8:7a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 23:15:43 +0000
Received: from LV8PEPF0000006B.namprd03.prod.outlook.com
 (2603:10b6:408:f8:cafe::23) by BN9PR03CA0214.outlook.office365.com
 (2603:10b6:408:f8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 23:15:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 LV8PEPF0000006B.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 23:15:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 16:15:22 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 16:15:21 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Mon, 21 Sep 2026 16:15:20 -0700
Date: Mon, 21 Sep 2026 16:15:18 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jpb@kernel.org>, <jgg@ziepe.ca>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, <peng.fan@nxp.com>
Subject: Re: [PATCH RFC v2 2/4] iommu/arm-smmu-v3: Support shared SIDs in
 insert/remove_master
Message-ID: <arG6hmng3NddGEHm@nvidia.com>
References: <20260921-smmu-shared-sid-v2-0-4b656ce68178@nxp.com>
 <20260921123846.1663580-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260921123846.1663580-1-peng.fan@oss.nxp.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000006B:EE_|DS7PR12MB5839:EE_
X-MS-Office365-Filtering-Correlation-Id: c0fd8ce4-912d-41fe-3150-08df1836428a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|23010399003|82310400026|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: d1ccbHEs52RCKq4UPbzTSRJfCJOOF8ODbjmMFHgpNOj1mzDr4DBiQ0EwoC7z+GJaHgBghsU5IeqyGRjyKpQZhPeI3ZN92Mx/3KyPrEJWi0eKOeaZOBvk283Yk0aTCOMoxz8kX/EPq0wWD7brH/eRxqbaZsw70l0m6Ou2PXhVvao665+m9bHwS2LRNtgOQMEYePlhXr6GzoSmbWtdlF7/I2tPhLPU2Gsb4Gm3NQ8PgDUFDtleA8+/UvqHCjt7k4xLHH1qQWtiN7gjVDz+2F+nuZKJfhzeI1MAvd9Gu4dIXHYlE20mI4i6F9zUeuCHsKkdcZSZs+c//DME6wbeaYgwFNjPhI8Ya8SljV6tcm/4jxbyBOkBHGPWRjzxWdbymFKIATNMYeR7LE5SRzIyCxe9GKXEOrcrelu7ZXBFqp+oZvNG34ixjik5qBpYwHNdGQV14SJ5b+gaAK0KNU8/vQ6nOC+KO9Cz1mP+ff+mCTLUv7MQEc+PjCWhqttF4AzIHfKmiXQHB9GRYwrqHTRHH9etZXLFWEZlPcBxv21QoqFHsFiftgKtSLMGixC+paMDec6XPUV9hhHocmCsPnIDF6yS9A0dgtCuulbp55b7TqTalW8ViQaCq94PEvfWrycpOPVSYoODOzh9Cu1XIr9qjzUh25S2TpKEn0xcYJkl26jJOn48tynmV/vHTIbY+lJae5kI6wf2u/CpZs+Lq6N+s/OQWQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(23010399003)(82310400026)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eRtq7lUYmJzepv7M6QU71XULvrqgcn4jY5YI5/9fhlIa3t0vPsI7I5RZ2kZb2nCDSJtZEtEtwfQ/9qvM78wiERDpqOyvCmjulJCq8stJdv18vh4Dbr45sY1metxacwTuDjnL85fJaWq25zTyTdme9vZk5PJq6ephPYYJe00i08zKjQknrMXYsNHdg4+IaFPqqxBvnU/3NAEPqiwTPnHjODD+BJdWbG1etJP/CsgF8PDyH3D3IbKetldPAzAswuNtbWBuIPg9ebYEcG/06FRQU9YoSkOq3V6IzItiVqk162DvLU7kp5xV+5qRkmvTHF06KGbl09RiNR/qBoRVuY50PNpdHoPBdhWyni2XSG+2iEpX38CueRLcJHBkVQ1cudLywxywaY81qElstB/W1gvGx6W+3Gy05EqoQeSdyWinsAYFqBhlv/uuDBT3fHeEIpj9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 23:15:43.1773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0fd8ce4-912d-41fe-3150-08df1836428a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF0000006B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_161551_438063_918FF763 
X-CRM114-Status: GOOD (  15.49  )
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

On Mon, Sep 21, 2026 at 08:38:46PM +0800, Peng Fan (OSS) wrote:
> @@ -976,6 +976,24 @@ struct arm_smmu_device {
>  struct arm_smmu_stream {
>  	u32				id;
>  	struct arm_smmu_master		*master;
> +	/*
> +	 * ref_count > 1 means multiple masters share this SID.  Protected by
> +	 * smmu->streams_mutex.
> +	 */
> +	unsigned int			ref_count;
> +	/*
> +	 * When ref_count > 1 the STE has already been written by the first
> +	 * master; subsequent masters must skip the write.
> +	 */
> +	bool				ste_installed;
> +	/*
> +	 * Links all arm_smmu_stream objects that share the same SID across
> +	 * different masters.  The canonical (XArray-stored) entry is the list
> +	 * head; non-owning sharers are linked into it.  Used to transfer
> +	 * XArray ownership when the current owner is removed.
> +	 * Protected by smmu->streams_mutex.
> +	 */
> +	struct list_head		shared_link;
>  };

SID-sharing masters still allocate their own streams. Though the
SIDs are the same number, they own duplicated streams linked via
that "shared_link" list.

  master_a->stream[0] --> stream (SID=X) --|
                                      shared_link
  master_b->stream[0] --> stream (SID=X) --|

But maybe they could share the stream structure directly? I.e.

  master_a->stream[0] --|
                        |--> shared stream (SID=X)
  master_b->stream[0] --|


The stream structure would still need a list for shared_masters:

struct arm_smmu_stream {
[...]
	/* Every sharing master, ->master included. Empty unless shared */
	struct list_head shared_masters;
};

ref_count could be simply !list_empty(&stream->shared_masters).


Does i.MX need to support SID-sharing with multi-SD device? If not,
the master could have only a simple shared_masters_elm:

struct arm_smmu_master {
[....]
	/* Supports num_streams == 1 only. Empty if SID is not shared */
	struct list_head shared_masters_elm;
};

> @@ -1024,6 +1042,11 @@ struct arm_smmu_master {
>  	bool				ste_ats_enabled : 1;
>  	bool				stall_enabled;
>  	bool				ats_always_on;
> +	/*
> +	 * True when at least one of this master's SIDs is shared with another
> +	 * master.  SVA, stall and IOPF are disabled for such masters.
> +	 */
> +	bool				shared_sid;

Then, this could be !list_empty(&master->shared_masters_elm).

Nicolin

