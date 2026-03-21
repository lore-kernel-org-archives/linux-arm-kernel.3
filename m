Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA27109449D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 22:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BkO/eZ80g9qwziRG1uf8SmceLZEv0aN2pjVx8Vtoud0=; b=TBFCb8rxyusMAy9X4G6J3kq2n8
	anbsYi/6B1zejnENlKM8ydK0nq0bSkjD+AFG79X8AoPAXpT+OPytjwFLLuSAyKGFVGL+i7yLtIfgG
	OFn4ODVKpIUbA7gqBxa0C5Neoj6anOrGEOGNehAbfcT6fMDdOw6nkFl9hqgwDtZlX/oMUasdUJEVJ
	gXJAEq1xmesN+Qu2V3pIn3Eiqijj+lyS9TRCXvL0Rky7flLaIU81toHsXRmusjRpB8nQHmDJhedgs
	MV7sWpPMMN2QlsX642N39hahXUB4HkmfeysGSZSueTywNoyqPEW89PPmjQl56I1FnBPwDckCPvQ2i
	sFm0Lxng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w45AR-0000000Eqsw-10SM;
	Sat, 21 Mar 2026 22:51:39 +0000
Received: from mail-eastusazon11012054.outbound.protection.outlook.com ([52.101.53.54] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w45AN-0000000EqsI-36WO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 22:51:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZWVncCRz2Vx39hFM2U7etW+sx/u9/jETReU4EHEwCvZNVLAnqJKIrMD3WCu6PAQyJ0aFFzYM95/wRUPYzLLur0HBtq89mxv5V8CL5z5vy5kKDJTIRGjXKo9I9JYddUyikpd5Yv8eyGWV1ruosYkG6PrviRLqkqx+O4atR6db6jc6mBc9kZVfwigFAgK/37UDxG4M6gTSI20qMSmTjSuw7+nlOnfqPKKEbGu74LJxk9rX3hd2m7+0UXXQDjpQ+eHMhN40ARPlQCyezy/k2HQd6dCSXrKFTOdolsxZjhpy51/V8yVLQDwi7DecNshxOwseJgzjye4vsIy4blKMjW52A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkO/eZ80g9qwziRG1uf8SmceLZEv0aN2pjVx8Vtoud0=;
 b=G90cYIfYOVUeST+aFwsVQIVdukFToHshdDBTyIq4wh/UZ3fAHBWEluBpMaQf632pwfuouHGDLcXtzc+oNCHJ7Lf6C5VxYkB2XauSR84rZPw8pphWwcTP4KZuZ9oSc+YYykAPEKFX9nJeKzBHMDr1ZF3D16FCufRQgNTw60s24ksrrTQO7ujLqtKU737BgapW3C/Q/+oNRXkiqrcxsjsV8onIXFc2p+eGSDgNAkkM+gje9DqXku+PiWuFPJ/icumQ0CSRXzXPOQVLcYV2WWbr6wWb7AibyWhQKk/wNidtI18ng7FrpheMNS6k03Z1D5SGQiTaRa696nGRA83mgmSlTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkO/eZ80g9qwziRG1uf8SmceLZEv0aN2pjVx8Vtoud0=;
 b=FyoWXrxopve/VUvBK4kbwiXMg5nDzxYCJODK+9wsXjx7sRTnAyApzSsJQg2lDUSfcuYYj3kaMtDi0SHx9NwKKx6u/GF6mOsAjxHjMe6hnDpN/cmtjr8fgGvuMjtHp0GubP6PLrau7eMiPCOFsxd1y/m2onjCdLF0R/5Wlr89OXAi0joO5lo6nc6v8jo4E6anyz3ep2drdmJuI7WH8JMIEgOOWgprEx2lQnV0X0CoH8dUWk9MBCjOMiovOjNpMLYAnB2t0MMPlXN+Cm6+d7KsRTfWO12UDJJ4SiTsonqL96MSWy//ReVmHxb/Och8xwA3o7+F+1tYyWtp7CGHUjnGtw==
Received: from DS7PR03CA0101.namprd03.prod.outlook.com (2603:10b6:5:3b7::16)
 by SA5PPFB9BA66B77.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8df) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sat, 21 Mar
 2026 22:51:29 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::b0) by DS7PR03CA0101.outlook.office365.com
 (2603:10b6:5:3b7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Sat,
 21 Mar 2026 22:51:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Sat, 21 Mar 2026 22:51:29 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 21 Mar
 2026 15:51:27 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Sat, 21 Mar 2026 15:51:26 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sat, 21 Mar 2026 15:51:26 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <jgg@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] iommu/arm-smmu-v3: Fix bugs and typos in arm_smmu_invs series
Date: Sat, 21 Mar 2026 15:50:39 -0700
Message-ID: <20260321225041.11090-1-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|SA5PPFB9BA66B77:EE_
X-MS-Office365-Filtering-Correlation-Id: 55650d7b-612a-4e0b-ed85-08de879c63f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: bwiw8ig5waji7SQwpGKsfubNzm8TdMCXV/hTh8KOK2qQabQ4thcuYUDwPNArFqPqcR6jUHL768RvjAnEg4jxj3mKyaWKOxYJUGfZrbKuK2zyF3uBtFASzLdBqcLhLMZJHFiZGEkNgq48j1KPPWmS0mIVkOapdxEEnH5/3t2kbCx6THtay2/h0KgYASN2s4f79MIx4Z+WPWdCpaVVJZ0bySY6kC4BR/JzwkpQSgo6Hpbd7DgI6+euGOfY9WQiGCTL+LdCQ+DkdFWTK6iA3bhiJZQHU6dOqxT7hDlp1mqE5VGxWGa798aSBEJFxd5twQtTW/UfefB55ZjjHcVO+MPYivTumg9yGxhM2OEjik9LaB2Sw0psfiBYjP8ZrLZePcy8RvOqsx9fzvq8RYzK/GpTYFaGBKMIK50alwUBUvjt2HsjEEMNeFfZ5CFe9OFveARGECP+MW78tZq7U5MxbR82rA5WEFlrsJkhkh+rwtRFXX2vZP3ngN4G9X9s3LwG30zazJAnmeUpiNfhD7qElV8i1fHJHck5m6PZilGbQqKgvaxgYdtmDArngExaSjYx9n6VmOiQMNATSyFOLMibNQoqDKJ2AUWtJTINdirbB2riiiCeb4TzPLS+XkTO19WqHGd2Oy9HDC3BxdZw7M72OaNMAdmDLJ75Pj3RL0Vh7217JE0YOP5NxOxhshIfnmDgNhSw2P8fiuuwlAydUOiwu6ohEz7xjmkR6x7Vd+wfIINoRVv1UVNhdIB2we9Ken5+nAQmkfB8WOqYpdWzhgk8pcy1QA==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: k2yMq8d/59QBJy7rXOHs2Ums5t2TW+vvqHgraABusL5l7MIigA7ho7VBERN/CvvoYi8DHfjy2MTeRxgUUrDYZp3bahORGUR7PWPGoKXtm6lSYU5tgZpk1Dt+iOr7Q1JIG6ze9LopsqWL26riArnCXfFHHcTmtDpeyAXhuunHyp4Aty/2w4UrP1qk8uJauE5LHJrwPAtlbvAbHvziFuvMZOJhrttF6S2Jqn7gE2I6feR9WvtltoF66qjzyjm2ZRXMbaAtlaFKUTYPQfnV4mCGJkGaO4Bf+RPKTfvk9DMacs4L2UACPt4WDksLWc5Ou19HFX5v4+re9RYYklsbdFojZhPk9ckvOu1LJrp6vu+ddPv6Hpxz3tjc4bxdC8XWABSKRupWBuxjZINOrk+j8261Lk0Jov7ND02386yFzrdZJFWJViK0qKGI4awV8djh2Dd8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 22:51:29.3145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55650d7b-612a-4e0b-ed85-08de879c63f0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB9BA66B77
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_155135_803222_F55BF776 
X-CRM114-Status: UNSURE (   8.63  )
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

Hi Will,

Thank you for taking the series!

I found a couple of small issues in those commits. And here are the fixes.

Thanks
Nicolin

Nicolin Chen (2):
  iommu/arm-smmu-v3: Do not continue in __arm_smmu_domain_inv_range()
  iommu/arm-smmu-v3: Fix typos introduced by arm_smmu_invs

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 +++++-----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.43.0


