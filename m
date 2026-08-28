Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E4BC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmgsPmW3iKnKr1pRc894hOmrT/H1572O1cUohF59kMw=; b=JeHogp0M0ohjTupVtoF1EyIHvH
	83q8U/Wc4iyCxD1hvqVY0h9JbDmIzsCqR5WGmpkGZ4g3Kkz67WEb8HBKFFjNqW2aim+ZvO0EQt8Wf
	3iAAcjy4bICq4aXMu+HmKmvypUFiXK65tNBf9CQyuUhFMpkpUwxywK1b3lUq182l+6bFh1J6LFc/o
	p8mG5Tl8LGNN6mD0KDYIvvF4//AX9tp23PWwtJLNq/GqczNRqo1Rvd5Hbam26Wkq/wzgZ5xWuM7tW
	wtjz0TsPToD3o6Ics4dlpsqauyyVSVjpzK6iCSmXV+tLatSYl5qbUVhEEQ+g2Ptq16+IUSMxZCKcP
	n2BOKIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzys9-000000068MC-1vCQ;
	Fri, 28 Aug 2026 15:52:05 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzys6-000000068LG-0DWE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:52:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkCs21mtrfPcl/l6kXE/LEwatbiKbfz/IrIKd1EbxVpKrfokpjgFtcKiUMcGWQV2hh3LHGlmAeeE/UxrcrRXe4wCU6nH269LY3Ma8giGPgdVqLW4avpIcTdbM0qDThp0F5zJlagzpJOLxhQPwlZ3JTxK3IPQfBk9MWlGudXXIG6HHuWJmJtMgJkSl6ixRw9jMDhQauwoAIh3rnQ+UsFhTSl/V9oUKcOXdPF7TX4tTGwBKmwuO2Lsiiz4jnAGBiqHBo8joHQqf6PlzlR1xq3ukgLZmcsQ6YUICjzBgWLr0Hnuw2KBxU1HIQB9Ctgz2fgQNT/hlZIt9RnaC7L6RQy16w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmgsPmW3iKnKr1pRc894hOmrT/H1572O1cUohF59kMw=;
 b=BcrNLg2kjMvtg9b4RkczNzVAstDo3906vIINp9XmY3dtw6ukNkDsX/rRCVfyjmZ7e4/QXOAI5XC9PTh6vw1ELjW0xjfeutgaPhe/LyvM49cb87yuUILFnVbg0E5X3GsGLM92PtdCpQ7M+iys5i+YkVcF8jWq5Q8g3dxZzDMSFGzdcLwuycF+wY/eoUaxoN73ahY+Q4gnGeAXTm/GjpmmkRiBajEKZ7rslqDxgMD3P1oKmDlzJC96+dUKhRz00mZvfBot/LzUUlvsGR0qUanlNl5Yq/Ycl0vWJqBkm5lq/PpTgeW+M6bjBXUXhUJl4rC2zr03fGiVEsPuARzslz8cuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmgsPmW3iKnKr1pRc894hOmrT/H1572O1cUohF59kMw=;
 b=l2P8szl1xHfpbNIWnCfXMXShG38s0EwxPYQ1c1Ny6/72/U0mgm2ISlsIJT8lmfAwvtXxlpIri1GZV92aCCmcse+Mkc6LG7AnKcAP1bWfr2Rdh+K4Go+ndCAa2L+SdbiJcZ3z1yW6s4HcS0vayOLs6TxbePhuTSyLXXsZNoqOVwY167DjiLon3IS7YhYebX8vF7JEH/Jw8GRmvIqHUeayMCxxxJj6cc9h8Vf4PW2HRcW+VMO1kzE6jpwLD1cFCD2dE4ZvRyj9CGhBg8RS6CNZzzA6AhQmcW0uuHS9cRS6Mc6P2klBJIT5mUcYqCnpKSES6f9XzCqoWsOgVw9ktJ1F6A==
Received: from CH0P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::34)
 by CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 15:51:55 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::15) by CH0P220CA0017.outlook.office365.com
 (2603:10b6:610:ef::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 15:51:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 15:51:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 28 Aug
 2026 08:51:18 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 28 Aug
 2026 08:51:17 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Fri, 28 Aug 2026 08:51:17 -0700
Date: Fri, 28 Aug 2026 08:51:18 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
CC: <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <will@kernel.org>,
	<robin.murphy@arm.com>, <joro@8bytes.org>, <jgg@ziepe.ca>, <praan@google.com>
Subject: Re: [PATCH 2/7] iommu/arm-smmu-v3: Prevent rbtree corruption from
 duplicate streams
Message-ID: <apGudts94pqFL20G@nvidia.com>
References: <20260828125409.1921538-1-smostafa@google.com>
 <20260828125409.1921538-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260828125409.1921538-3-smostafa@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|CY8PR12MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: f265d673-5bb6-4ce9-0bc4-08df051c4789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: y1rBw821mxY2zYBx3dw099KH4PqiqIInOZ4dfWDVWZbR3kQsTbn5MsEI66ng24oGU5qX7CAId/r0ZU0bo0hLrxSiBopPv70vp1VwfBqR8nxJ3GHjauLYU2zYqo8xOrSb+ro0R9LjarTSKew1bQkxm3xXeOYqkZmCZFUryH23bXOVCEKYHFAKsttYwh+KqdKzV9cUI+Xn1eW4q5E+BGyI23vQb3VmwyiAO9rz29OkgaVTTzCgv5xB6JRItRzYO8XAiLLVi9wkB4qoFoUS/Q9CwsEhP4WTOvvyUlMJGijQfKE+tg0QiLVPY7WH5JAZ4jVLEpf+UIA5d2zfyflIECm2wLEUn9SW8RMoUQaP4ZaGIpUzeASsizKBLL7xg0H2CMefttTdVpcLZZJ/gUVxG7KHuQfzp+VeJ0UKboVQ2jjFrHePZqmve031AWzafiwdFATk++hjpd5u0v6V/9XDD+rUYNybdTnEP56c8MV2GK7n4ijN+dZwX4n0L79X2TEYgyj5J1J3Qk+RuLjI9xTWjpwY+FxazuTAzc+2RxRIxFK1Alzt49BEy1aGj0t6wiuWopjHNv0+0vKxQLogVxOFBh//LLAOlJgNN/6kmwlnGo05HEi6HrAUeJuHNvSJ4NF/2ACJwC8JNhKrr0OsDrOMhurIR5YC2es+I61sUnZyqj+sIvXa/5rfemph5iL7ZqOklns0zCGnpJSYQ0KgO4epsgNkKw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7eOhTPLg1cEgD403fDj6f7g1ssBBUmqjnpg2ouw6yFJmvUY8c75+rB5h8RYFbF9pF7pjpxJZlE7J57wRhCwF8WdgxHvT5IpI/66gCYTxk2lxhBwHrpouFm7TcjvVdzYEA9zXEjZaTxsOfX7lVxmKXzlvEf++PEVCcQdAx5e+PNFbvolJbw09O1eWTYiKoYDhIlhxI4T7xju38ypL+C4pJHJqQLw1fBsHraKNuIKw425CFusvHvX2HdUy/OmRkEuHqyB8S5z6Hd8EwsEsooQorrwzx8tN+ij96Rd2lWaV8LeMq13VQUzrvMF7I17Jvagv+ACbqf+wvxqmQhZxomQPUSBJvOsU+cxLdqw2ZqWiAjK8J1/cb6iENBsSgXhNPOf591U9gx05IJLiMfq2jwcC1n0EgjmzrC6dlkorSon0hBqZMApOMXI1hdJdafaB8Kq/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:51:52.3895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f265d673-5bb6-4ce9-0bc4-08df051c4789
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7705
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_085202_095574_F6A968B9 
X-CRM114-Status: GOOD (  12.66  )
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

On Fri, Aug 28, 2026 at 12:53:37PM +0000, Mostafa Saleh wrote:
> In handling PCI devices with duplicate IDs, arm_smmu_insert_master()
> will continue the loop skipping the duplicate sids insertion in the
> rbtree.
> However, in the error path of arm_smmu_insert_master() and in
> arm_smmu_remove_master(), the code loops over all fwspec->num_ids and
> calls rb_erase() unconditionally.
> 
> For the duplicate streams, the node is zero allocated including the
> parent pointer "__rb_parent_color". That means rb_erase() will think
> that this node is root and it will corrupt the tree which includes
> other masters not being removed.
> 
> Fix this by initializing those nodes with RB_CLEAR_NODE() and check
> if they are empty before erasing.
> 
> Fixes: cdf315f907d4 ("iommu/arm-smmu-v3: Maintain a SID->device structure")
> Reported-by: Sashiko <>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

I submitted a similar patch a while ago :)
https://lore.kernel.org/linux-iommu/9136477b9c737a50cecc38f2ee6704a01510169a.1783044582.git.nicolinc@nvidia.com/

And I think the fix tag, as mine posted, should be:
Fixes: b00d24997a11 ("iommu/arm-smmu-v3: Fix iommu_device_probe bug due to duplicated stream ids")

Before that commit, a duplicated SID gets -EINVAL and errors out.

Thanks
Nicolin

