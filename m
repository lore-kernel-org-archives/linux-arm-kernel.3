Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AFBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 07:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2zuTswFYWZBMMG1g2ud0JYOyUEMC/0FbBtmymupnVo=; b=0EAHqDeYgb2x+qlj5rDoCQ+FSw
	6OegmGORaJw+vHT7bKe+1mVYU9kbjoE4w8Wbzo3P7G3/dh0Y62vyc04TlXFf6E6JHbmFmr1ByM8pk
	fIo6Bk55QiUZJYL1lOon+Y2siFM6pMEwZvRRo/iT7ll2pje0+SN/c8g11CxHwJDOr7cJig5k9DcKR
	TMfioYjAIONPsFVXV5OFb3c9BYAXJb+JDVezq3DIcjZHHUO1MTWGAsG6/I6S7fVfToiDist5+xgCV
	XL9HDmv7uKMSHrB8UCfn7GCygpjy+yosXZUAlaRWNW7eK2Dc8iiRCJH+OItOJmKQAZfHSljz3ou6i
	GeVY5jBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0DV-0000000EJpp-0p5K;
	Tue, 07 Jul 2026 07:27:41 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0DS-0000000EJpF-3nnC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 07:27:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxwNG0fPvK2MBXnmUk1UOEESnglcBOkO8gaLMoTjfDDoRSJghyyKP+BEH1sX+sSTQnuQACBOykvd5xl2LVTfG/ksyGMPiTMN6W2gk6fU+YINO3R80zbuBVPsjey7vfPmvLABiSxvRvAxQSXueUKU13KgmtQ/FtqnEfFC7kvQ/2yk4kH0lVt8n4niH4YxV3oEi+HH85cg93TuiSdHjOn6mX1esOSw5R24ZYbCB9AwLzNkehj3Ql1aPvRoaWl1ztYPqKT4ktlycSKJQbp9bczW0aRMrl4qaHxugs52HW8PSX7i44yd7LTTUAbbbn9q05V3dUg+kTHME6HtiB8MQMmQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2zuTswFYWZBMMG1g2ud0JYOyUEMC/0FbBtmymupnVo=;
 b=uHDztIkTe6l2NRDOIsFhYcLfujFj5xlvKZmdIbwDjhHMiQh4A+XTbXKLzj4aElnnSqcDueNcO7yjdHzOU1ZerXkCTNRa48oj08jBhV1pXTO0ozkpxjHakI0eMsMenZKF0YgtBKa08rQsWX+xFX9VtowIh0swMdZC+GLHW7izUw+XgoeKPeTHP6Eo986MstMCchjiFhPQ2cOcx1PgMqUD0c3h7a+KAc+aRZ3GnyYHyrU5QiJswOnogU1+o6+qBkn40B8ycmP8zmMP1lnm72BceInM1CgR1/OfMdFD2vzT6JMe/gE/lVLLphtczGFx6JnUs2X9LTsvBL10g56hpjaj6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2zuTswFYWZBMMG1g2ud0JYOyUEMC/0FbBtmymupnVo=;
 b=tMtn6lg3D65MX4jc6RcPsHxJihAXP042SZgorjk0cIqy/0Fo3Dx6V/bWPShWpNux0IyjXc1qilgyCT+684mh8IRjfYyiCAZCs34Ig5/Fc3WFYcnOE+CttaJE3uiEL/uEN372K+qtJWLCqhZvNjxwgnYJ3ZTJ19qQKK8Na1WvVcIZWX9Wf1cVM0IoSr6BoLUzQ46A3ui/fiyKBn3nBspONs7zgw4m/J2RiW4cgioq2hS4WuFv4jjsQJXLoE3QtN8Z6imcerZVMZcqb5t6f/3M233T5YWYj8T03DG1UY/nUeD3IKrtfyGjkvUWrEV44Kusjto7ecBSEZjxxQzI5Z7XUA==
Received: from SJ0P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::9)
 by SA1PR12MB8120.namprd12.prod.outlook.com (2603:10b6:806:331::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Tue, 7 Jul 2026
 07:27:24 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::a8) by SJ0P220CA0004.outlook.office365.com
 (2603:10b6:a03:41b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 07:27:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 07:27:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Jul
 2026 00:27:04 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Jul
 2026 00:27:03 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Jul 2026 00:27:02 -0700
Date: Tue, 7 Jul 2026 00:27:00 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <iommu@lists.linux.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, <patches@lists.linux.dev>, "Pranjal
 Shrivastava" <praan@google.com>, Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 3/8] iommu/arm-smmu-v3: Optimize range invalidation
 for latency
Message-ID: <akyqH7f5h42wru8a@nvidia.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <3-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|SA1PR12MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cceb60d-e0fe-4b1b-1f69-08dedbf93093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|23010399003|82310400026|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: c8MMsXtEz0M0ZQ2juKeSW/Ci9JTgTDtzKgjcNASPDbrnxaZFKiS6mTUcKCu+bP8oBi3kD2ZdRtViAXV5YiK61nujbxJeOp9Xiz3uCdWBXYnv5C8EiOpP98L1h/CTvGVsIn4H820GOF0T7tNB0aNWyJ3XsXOjFnEBXEB0f4aE2Ji4bg3bP/uWsCYxx8bBL26UJqc2nNwBbn/FJblv4aO7Cw0hNkfJ4vvVmOpTC9sffbVlkHJOK5CXShCnig62DEW3Fc+9hKj63og2Gn67ns6CZ0Oxc/rmF8FZfVL3/vPjktmlym5hfzLliEv7rJFc4zuHrgavfWSWAhI3pz9BfPBxFXP2ma2earjVkGZBhB86WVGts7UJD0BsH+4p8DEzF1FDM01ZEChd7zkdrbcDsKfkMw78v5Du9SoW6iotaTWi7qt7CF2vZI/6S4uCVs2HwKWJ4bD9rd5kPaYSXRT7tN3a/kULmQPozCud/7TD5nvb9xJH08VvpxVyVhASA6RT3+2icBsNTXDJEwCefWsZyPiXFmYGS+yIpMWTgaTWer9d+3QoDX9qsC2HTEshoMlL0SS9JVGO2Rhw+Dw6pGWACSaq/xzqHJORqh9QWiojWCAYS29CYOKEraBI8Rio+FV4+JNr0yH6FOaLUZFq5An18e4gePY7wD7fgYnm0DSRj84jnqoQ+cigWCOreyoJ2uGd5jzsxsB6KP2kJApVv09KIjt2qA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(23010399003)(82310400026)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oRwdp5pkFQq3Mh+WtdgE3IuY6MgbpYfitKFoMhDDkfmsm6vcpjL/Cl2YdUW9qkzFhDH/PW2qXwys1C55oB+vdCjKtwO1XwRsy9aC+5CzncZ2BbGHRAQdoSQNXEKvn+kOZ/l6x48XysTogu1vq1DGfppqC+TTIKHctA9iz5YGvf18nR5t8ze+OlFf73gNy3KEuxwRdJrcjDVwP6xNvcYU/z4ftiPEkz19OgU0aWjDTUl6jyImrl6QOeuKcHPe5sZP/adqOlD0Ic0u2Hyruc6pEHkODA/XNL/Q8/w4SlUVYzXGZEKWtptakbfGIJoLExLVdyiMSzL4CcgI06yHaQIOrzo7GlEmB1vOtd2QcwaB3WdxdWyEQkL5s+qMtXuwJ6jyvbwUJWvYxIedr+RHITkbajOdPgtTBIGkdgoVxrH7BoRu/US+nAMve98B3uLj95Pc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 07:27:24.0194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cceb60d-e0fe-4b1b-1f69-08dedbf93093
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_002738_959294_DF6260BA 
X-CRM114-Status: GOOD (  10.08  )
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

On Mon, Jul 06, 2026 at 01:26:40PM -0300, Jason Gunthorpe wrote:
> +	/*
> +	 * There are at most 5 possible values for NUM based on SCALE. The

Mind elaborating the "at most 5 possible values for NUM"?

> +	 * highest NUM is at the lowest SCALE where:
> +	 *    ceil(num_tg / 2^SCALE) <= 32
> +	 *    scale >= ceil(log2(num_tg / 32))
> +	 * The lowest value is 1 where 2^SCALE covers the whole range. Pick the
> +	 * highest since it trivially also gives the tightest range.

The spec only mentions:
 Range = ((NUM+1) * 2^SCALE) * Translation_Granule_Size

Since CMDQ_TLBI_RANGE_NUM_MAX + 1 is 32, so we can get:
 num_tg <= 32 * 2^SCALE

.. and then get that "ceil(num_tg / 2^SCALE) <= 32".

Maybe worth adding the first two steps to help readability?

Nicolin

