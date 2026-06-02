Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32808CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 00:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUMbvMnZKXoLVloVOC1f5Nr36GpjS+t8f3bhVpZfBL0=; b=MLHGqO892+1Y0zpw9TFYH058Ik
	CDzLL6cdWb4xB+egwvUt1lKkjP+PkyhILSWtQl755pPD3S0ELPeLlRYmlbxSAWF0n9uZeZdIsVR5H
	/X92QH3EkXLpl2FafOPLEocn1XscGqrXLjV9qYRp23QwstuCRQasD0lCv6pHhkNYM9pAXBNyOZaJM
	u2zKA0k4AuebKGU8klCLnnAluy6XUAq/ybbrIKHWQishFLbnWmPCG6rVikEhI4/hLZxN2rRYxK1dv
	CABfr77f4tF70/vo4NOheXaDcUwPJc+w8Uj4AXEfbm7ho/lnfV4b1S8QK+MQtUM2NmJFUwUtBNDgN
	34CcWGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUCkq-0000000C5BY-1WZ8;
	Tue, 02 Jun 2026 00:13:12 +0000
Received: from mail-northcentralusazon11013018.outbound.protection.outlook.com ([40.107.201.18] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUCkn-0000000C5Au-0i7W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 00:13:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6QWYtiju6MfhSGGeb++kuGgHpK1bgluXL+IuheCyek9u6jRVRzlAP5sw3e+BF7Kw5l71PAvsqjEYEuncXiLhur2gFlL+A9/jiwg6ss2Ot8gvHwkq3itn3aXPN+8LqtSAzvWo+vPOlyKBLFozniVRNdCIUpnwetG8C2lgQpaoTHMd4v6Zph1vEDj0QkpFfVJihctIj8iIkVkRuUOkItb+Eg3uZpHtyao1lNyXualv8uDaDTeqpBeGOzsOrWtbFUjnZsviST7Cx60OENSV1BnNFIO+seYa4C5YavUxrkreEmDWzGti0WkqrX9wSoJ62XjaYYQVbtimELYqwJMaCkYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUMbvMnZKXoLVloVOC1f5Nr36GpjS+t8f3bhVpZfBL0=;
 b=rJGFQaE+3chSb1epzn6uI890Zy2i/HKkiI6hFaxpuJzllH6t7lwwOjH3biDn/0DwF9VxTjfA4UF/prGfRolIGDAPhJVdvHmhz3zavIViVQhkjamvy+fs9NM60cvfVqVaZK+DgjcCTPgCFM7w9Vnp1ejuKV98niyk5MIJu3qFYjRXKk9ob7i0pay7gkBd+3pA2pyFWI6NrXY5A76N7P3dSu7t1MU7Jv3RCDArhZTkS4YARIDalTvVZnPfb/e9n1U7VFaqpAdB11gFRq9WE0jcsO8WgtRWLEUlRgQmS7C9e0+0e9H34BcpvncDhpsfrNX3PQ/p/ufcESUHZeinuwQ8+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUMbvMnZKXoLVloVOC1f5Nr36GpjS+t8f3bhVpZfBL0=;
 b=jnBM6TMT83Jmj5/j7Zd7SjcT41gIoPwXRpVb6cSl8c0YlNPcVRpKGyPGECbEfMRQ0FzoSrvHK2m1b8fijzCwVVko9Q3OpPV2fEPHvhCwKXOfwNuvbepAOZyv6sZABOITvRBaYyGs0pWj7X0yFV7kJIWAiNBpMNbhl6ybZV8+yyTaaefdBHdToBWwdZv6Laa23KAnWfWMnOIqkKM8a9n304YxkTd5pfXaa0JTWfaIv79ELS6xroHtZ8Q088gf9s0DHBBrAp6yycTL8QzvZsAtViiGaLLpwC4ly8nbtF5mjssDa5ta4t21Be63OtiPOmJJ2ACD2ziUkkjROfmQSircZw==
Received: from MN0PR05CA0002.namprd05.prod.outlook.com (2603:10b6:208:52c::11)
 by SA1PR12MB7411.namprd12.prod.outlook.com (2603:10b6:806:2b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 00:13:01 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:208:52c:cafe::5a) by MN0PR05CA0002.outlook.office365.com
 (2603:10b6:208:52c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.6 via Frontend Transport; Tue, 2
 Jun 2026 00:13:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 00:13:00 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Jun
 2026 17:12:42 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Jun
 2026 17:12:41 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Jun 2026 17:12:41 -0700
Date: Mon, 1 Jun 2026 17:12:39 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <iommu@lists.linux.dev>, Will Deacon <will@kernel.org>, Joerg Roedel
	<joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Daniel Mentz
	<danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v8 02/12] iommu/arm-smmu-v3: Add a helper to drain cmd
 queues
Message-ID: <ah4f90HTmum4ZxbR@Asurada-Nvidia>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-3-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260601215909.3958732-3-praan@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|SA1PR12MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: d15cb3f0-3f03-4b53-43f2-08dec03bb547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9FepvgtaZWCjQ7yE3kEEhwKwnoQvODfj0OqTp7SkW3Aa85fFm81osoQqU10ZMViY43DtM9vnkgVTO2qV5vQBH8WvDvZ2v0WnNYnbfiIHR8Hm5GZ2Ggx6F3ax3gnNv7tfkiVgzeqefiOghWTS9qRRVJkeNLwwfU21a5G2ITl6CApYqT/CqTMPmPb1lMFf9PubrOE50jMxAqoF/0dJTpOFCX+ln7zGBD0uAlFZJHZZb6rl1qHPZfeuzo9miyEvMH9HAbF49WI5+S9HvSph9UXybVmjl/ZzMHP8uLtj6RpEVVwKH3UyJs/vwg/TwvZ4POUOCLLsRD+V1zGGOb9oqSdRjSrv4x1Plrjz97V0XPM67va/1NInuOtIw3ZIXOfh3irVHnB2pqVygLBoU7w9cquTwHvtL2Y6dgIRblnPC/kiSwFSHRXfdyx0AQQoC7uvWa/xoBdyihnt0OztXhdbjc5QUqRhyg5BwzNPq9/CJi/L5jm2606x+brX6cRa7SYAxFq5fgE8xRTI9Dtw0euO1YNUgPcvmHDJlpIwUXDVux4JuAwSVXtC7KUhqPY4TYuHXEpMo0tXSMKKjiCizjxYLYbRdIk55pSgKuY+tT4fh7Gck31lYY+44HlmLS8eKSACeGo1phvAx7B78N8rQye7nIkJGUu/DmFTp/L76gbEFNbGpb7geUbFl9f0pRZcgbbfSnZ0FgijP9yGzcvMQHkSkfH8l6xXrPS9QFfxXtDeHFSV/1A=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: r2On5ar8Z1py/Kf7+rUQG5YKSbYgM6xM2NdJAoi7oWFhtXxxFw7TXfvsGQsluGyLZndHo6goT2xfo41jzi2eFqbxHogjb1BfRVeJlST3hMnMrjaGMUeYYjU6F8s32V0gyuuazy17cZmqoOE7q2GcnL6+MrFmkw4lOpdJIsOM9Mn4jY3ffns/Tj9KbtRJEW71ucG7Hf2mh1nBMQfBVi+y3176/pkVclBMY3S1CbLKeNE4yHOKj11yBIzISTc3abzCSJ/wf4VHq/mKNbZm0K5qbL3xkWDosniCkKOkBACXi5xSxT6jyaV6f7qnZ4RHvcCTsR7ECRYb/otXvvBeIDyQuFLyYPUjuEJML1vu7BXTZAcTLWJHc9Ipj2KiMOf6PVQ3Q3Vp3Ty0bIujbNOBpyuF9HYuURhUzLDL8HZTaWTG26/UvGdP+Y1rPtceg7E1yzK6
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 00:13:00.8114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d15cb3f0-3f03-4b53-43f2-08dec03bb547
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7411
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_171309_224146_E42E59E8 
X-CRM114-Status: GOOD (  12.36  )
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

On Mon, Jun 01, 2026 at 09:58:59PM +0000, Pranjal Shrivastava wrote:
> +int arm_smmu_queue_poll_until_empty(struct arm_smmu_device *smmu,
> +				    struct arm_smmu_queue *q)
> +{
> +	struct arm_smmu_queue_poll qp;
> +	struct arm_smmu_ll_queue *llq = &q->llq;
> +	int ret = 0;
> +
> +	queue_poll_init(smmu, &qp);
> +	do {
> +		if (queue_empty(llq))
> +			break;
> +
> +		ret = queue_poll(&qp);
> +		WRITE_ONCE(llq->cons, readl_relaxed(q->cons_reg));
> +
> +	} while (!ret);
> +
> +	return ret;
> +}

Hmm, this is not the unified arm_smmu_drain_queue() that you sent
me lately? Do you want me to change this function to that version
in my series? I thought it could go in with yours.

Nicolin

