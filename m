Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FA7CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 01:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kOW9uNz85iqupxfqoOIFDBv7dt/aXLiDgPa6sRcwmk=; b=flTh6rF9q/rKh/7UnDl32oS8BU
	vGVlnh8+yt5rVe7MCz3PEQkgR1yWBw/Mfi6WX+WlrcZ+HV1oCjVJAMmgnlQx+DHoF1XBqdRyKhRra
	Ek2vscb3fcvuFGhwKtc/h2TwmYAxue0gUjjXaXiDy2rPHQNroLn1EILBW60trNERTAu06VKPtIvR+
	WrgGTI2TFUU8aEjI1YPYF0KZiaueUExqLcKA4NCzyrtjluvD1B7nvZ8H6g/cMDca+g+7ImKse1RJC
	bYrokIBJI4uK1iSvFLVdyiWfVr6ADui0fV0ihxOKwxzHN5LBd5WhgUYHsMjYs1LwNP3vpwAa+fWqG
	Tx/+o9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPfi-00000004wy3-2veD;
	Thu, 28 May 2026 01:36:32 +0000
Received: from mail-westus3azon11010058.outbound.protection.outlook.com ([52.101.201.58] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPff-00000004wxS-3l1l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 01:36:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=db+z5HBP6Dvbre3mPZGKlCRFHkh0JMy9Rhxl5bjZPR9dv2w/n2P4bcMaX+2xoDdBz8kLT0cWgzhzJK3tBADCLTubqTNVs+a5cN5ybDr1hgnmRzpwsyLSjs71PSo+mhCo59RYMsZzrV+819ANr1uXCheeQCIu+wWwG8FItw5tjEhYtTGrPqemwU/S4bL99tz9PJqpeZO+el0U9hoZ4NpMCcjcgQvyS4vqbZnnPgeDEs2B4QGdamIzV8J/aY64rSeAVTW0s9mddOseppagb47OOUqI6RToOhj3aiL0fVYq1LBtIhJkNDxiClmylRLuWS7mTUAfJng3pxyTnqXDXswOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kOW9uNz85iqupxfqoOIFDBv7dt/aXLiDgPa6sRcwmk=;
 b=V+1hRGB/ljiVL+Oxn5EYRLbYpDJkMutA1IM4tm2S8a5JbrPFBahNS2222DTEekPpu9EdjiH1F0BwbTI45c+GdGnwKnJge76DfRDWs1h2f72Amt6XLOrQ6OH3sVNh/SWpReI6g13RdjBPUkkRs0S4rreFpWg4+PjOHpHDPj1NtCACew3IRVsrtmBZPLf4gaUMqB12fMKeGxhI9+CLP163KVHiEAowHz1SHyNlq/2cUqwgddrIaXzIDmmomdP33tQXPG9DNQH9hn+9FwzG5/6AFr9UmHNvhIxVJBznKyHG63yCSviCGcod4RCZVM2TYW1veRBmjcPPhioOpyyFfwDXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kOW9uNz85iqupxfqoOIFDBv7dt/aXLiDgPa6sRcwmk=;
 b=uKS652IvCNX/JOdzn5W1F0v/4OfS13htWMiHTHLZZ9IolXUcYW1bnFEVpe3bOQLkp4cVfPOzE4A3A+QejwUKetU1WqjTWqX62bHPgOioInitTEJW+FDMTM393CHokMp0yBOx+AzHcd+xKEoEXuWNa5y6SOGyRcqGT96mQ01yIa9y6jji7RC8Gk+/ePDaUaVvy7XF6MYyUuaCsCnVSh8A9Uii7efgcWmAiyNKQXTduHX2cJR8hvnOj3Qw9dWDWbe0LKNHGS29NouwpSdMLy4WLHdgyAv4dWY1oASpyCt15C3MinR0a3+raVg1T+e4SqznZg1qyirQ2g6a4VQ3wv8SaQ==
Received: from BLAPR05CA0024.namprd05.prod.outlook.com (2603:10b6:208:36e::20)
 by DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.12; Thu, 28 May 2026 01:36:12 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:36e:cafe::43) by BLAPR05CA0024.outlook.office365.com
 (2603:10b6:208:36e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.4 via Frontend Transport; Thu, 28
 May 2026 01:36:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 01:36:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 27 May
 2026 18:35:58 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 27 May
 2026 18:35:58 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 27 May 2026 18:35:57 -0700
Date: Wed, 27 May 2026 18:35:56 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <iommu@lists.linux.dev>, Will Deacon <will@kernel.org>, Joerg Roedel
	<joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Daniel Mentz
	<danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 02/11] iommu/arm-smmu-v3: Add a helper to drain cmd
 queues
Message-ID: <aheb/OLd9AQO6rD8@Asurada-Nvidia>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-3-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260527221407.1756491-3-praan@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|DM3PR12MB9416:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e3bfbd-0f00-4020-c30f-08debc59807c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: FQlX3zfsBSVwV17L+0iK0F7St2aeIatcSre0xtpLoCRiJwI+SV/F8mxXlYo29Xs5fWFuRK+Zb1d9+QdgHnKubaQ7sD6PHuUPeLvP3fjk7s32TdbTRTvdZ+VIVvlwd5DsAC8J1TztWsH0UTijb/DwmVZT+KfDRg1XHFddoTn6k+4E3GJwFIYIjFdBwJNBMY9WxDxEWao1+2FkxU6q2A8I++FeUqqxb5Z8u/yesOLfbUXlqLhbBeeW6jSfVNQeqfrA/2nGbt6s1/aYgZp5sMX36rH0A77HecS0ruUreB05VPC65qHGb0DtVcFMUilBdwqrvQ0Qej3O12A+B97Kcc2X421b6/WVFO41Dh6Qzgc5eNTn7m5BX+vPeB/8F2Rcxb4HFQI9oAHatbBCsbaljnqpEFvS+JyQlf+bWFsoBBMe5uKkBjadrSpnu6MIwxglNpz3GgmurC+VZltjpv+yYmDzPIvjCIhgToTgb/WqjLs1OfT4WfVJigZs4Qzu0LqN22LEBiwx9p6Ha3CTobFPFjtAhQcUz1Qr4VDIggFHklHLi8VzXVXU3UvSOqxSzBmXLg00pPGDIRG4ugQadA7X62QFps9ekvZIxuKGrCXwD9GipswtoHaDYs8Df55iS8QSJjsw6vKJLccpTfjQ4GIbJAn3w0iokzwhzNl0mOYPLv/Z7LPHwQBTdPdDNoHiye6gnWZIxq7IhS+DukVc/1SBLUN9nzxSttg8h3KA8nvA8RhMQxk=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nBChoswQDjkWoeWdNzxMR2ZFix6M7qzOGUMRtEqHMB/16ri1Gwk4Pw8KVinGIfDZE6FYYHa1CEJCWCVaCTqa22ae4g+Cs3IwLv3spMwrRjgC9AxSRSb+HHs2zL0DYgwzh3Tgfmwwo0U4mqdjDcBF8/euSzjCRUFtIPvtNNUn6VvJVB+KHaS+2hDPal90FFmXCBPPWqmQ18GJeg5DlwOo2q25DnRRRUZZdLVh9gOA0Y9NBQ2WWpl7RCt99eFhZLgtwXKUuelxlojBFYXzpLO7k8odi19sQAopK0GoWb9q6PL/ldSZtuSGLQofPD1EueAGowMTvrNMnseX4Ijb6t+/3reP4xXIngz1DJJoczLcA8KpUfoJI/xX6HzdMaxPBSkB3SJCqN5HUfRrlXjJmnm2v3LSHgIx/eFvvojIkhXVHoBUbxkTISHM3bvGPU/qmIw7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 01:36:12.5183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e3bfbd-0f00-4020-c30f-08debc59807c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9416
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_183627_948767_05EDB296 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 27, 2026 at 10:13:58PM +0000, Pranjal Shrivastava wrote:
> +static int arm_smmu_drain_queues(struct arm_smmu_device *smmu)

So, this function has a very generic name for queues but its use
case is limited to cmdq in a suspend context, and might not work
for other queues.

I am adding another helper for in-flight evetq and priq:
 - Drain a queue for a detaching master; other attached masters
   might still advance the prod, so queue wouldn't be empty.
 - evtq and priq sets wfe=false.

So, there is a naming conflict here.

Maybe:
  arm_smmu_drain_queue_for_cmdq()
  arm_smmu_drain_queue_for_iopf()
?

Nicolin

