Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80558C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 18:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vLozT0m5oG0y2rPgeuFNEVkCvTkafRvLZf0SWr6F9As=; b=AJ08jF3sYXlUqcs40ZwTf0MFA2
	ab7iGd15cBm7rmXEk2TU2o06f1yZhBU/xFOh7sD06Qatkvb1X16D8iJQA09VcJ9OKc6/rDe1gUFpZ
	ySEqm7mGKFUiEK52SPGPHGCcq0SH/kPodHw1uzUBecHo0iSXgzDenPxfvgJINirsGdzGx1KmKJwJa
	bHZZmoMXU2SMxLDucMh/Fz3vy8z/0eB67N+FCci6ppUI7KVpct2a0XWDYTQhdyTyp2+/JprdXb/lM
	p6bkPoTSpVHBp39w6mNMkbFVWwdi/nC4XSfiADtcDngoREWn99ImUJt+KetqvCaeDBwP413RWg58J
	F/ujpJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJFzq-00000007UGP-0MUx;
	Sun, 25 May 2025 18:22:54 +0000
Received: from mail-dm6nam10on20609.outbound.protection.outlook.com ([2a01:111:f403:2413::609] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJFxk-00000007TwE-3r1d
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 18:20:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imjPSX/+5WXWue8szjRdsXl4s7W0iwVWcHMS/DgNuGWPte0Pykfr1ae1Q5i6DJFOhulQWwgpEvuBWE5VAIp2gkAIDJEeVqta71tvCHT88YQCKmHctDn3LJTeIwTxbIBcRRMSDnzk2eTfxmz5cc6EQLRVIB6ZBytKVGSgRJW3JeG7tF2y7delzsv9z+6ZlGAfaOvh5A/T4W7zQrXrEysdgimap3tSrzqDtHtheO9RlqcGCUn+kFaFImef0b69NBp4u3xRhC6TYFFPZxMf+06jUxNpnFU3VmMNxMzImJcXGhLbGvrXHpyPvVs0yWc8Eus+zq6H0mFQo2LcvzCUtQXR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLozT0m5oG0y2rPgeuFNEVkCvTkafRvLZf0SWr6F9As=;
 b=QzXM3GhPYEZD5wlXea0jRDfNpE0PlLuOfvzT0cd4RCkQWjumWB4HcXGZOjIZhqsrfiu8mpFLH6//HhvuNE6h52BR0CJJGl1x1PPe+pFt3lkaSKctHWtNePKkOPqCrQuP9tHYySvZv0eDoLFPxXQzMP5yTwo1trcKBR6FKHFVHt/EdPKh2jKMX/MqrHiIvrUWn3YVcnv8jn775R1gsSmiMNFhIaTFTSiH/xJcmGsOp2LI1lHt5j2fjrjf+TAdk+vgi+WeYV/9haiSH+6V7K10IiQ9W6uEloMl+WMt3wTRSa1MzNXWo6JuDr1UzwaSf8D5mI0cexOWmnAu5zPLJYlOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLozT0m5oG0y2rPgeuFNEVkCvTkafRvLZf0SWr6F9As=;
 b=a1Pa4WRBWKg39ARaJBJ1zDjfQ0/Pp+3/ngVEA+RxUcJ8BabDiSxfju8sW/5HkAL2ybgctrUje/9n3VuMSo6HcS4NAIc+tQOeY8Yh1oLK09+6hHckvJ4V1vW02fZbqg3Wc4V4CGNYsTgWl258mZTX75MsS/kaLcWSfq8BaIOmd4d4Pq+jCxrarnGjGlzmh+tn7wSiJ8mhQ6RkQehOttveSk1ShWc0X7YBho9EIOet6LF/BuXmTTxRLYgHI3P/KmU2I2BA9H6zeubdCA1NjfhhBlsI6ReskT/VCdLTpDhdL68QukoJ7Ii+Z9cf4buztYtjQSEjhBBj8BMsS3daGPoFfg==
Received: from BL0PR02CA0064.namprd02.prod.outlook.com (2603:10b6:207:3d::41)
 by PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Sun, 25 May
 2025 18:20:37 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:207:3d:cafe::2) by BL0PR02CA0064.outlook.office365.com
 (2603:10b6:207:3d::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Sun,
 25 May 2025 18:20:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.0 via Frontend Transport; Sun, 25 May 2025 18:20:36 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 25 May
 2025 11:20:22 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 25 May
 2025 11:20:22 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sun, 25 May 2025 11:20:21 -0700
From: Willie Thai <wthai@nvidia.com>
To: <wthai@nvidia.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Deepak
 Kodihalli" <dkodihalli@nvidia.com>, Ed Tanous <etanous@nvidia.com>, Leo Huang
	<leohu@nvidia.com>
Subject: [PATCH 0/3] ARM: dts: aspeed: nvidia: Update DTS to support GB200NVL hardware
Date: Sun, 25 May 2025 18:20:16 +0000
Message-ID: <20250525-dts-v1-0-9ac63ad3bf15@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250525-dts-8eca0cb6dfae
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748196599; l=798; i=wthai@nvidia.com; s=20250525; h=from:subject:message-id; bh=7BFMgi807I8aR/Q0oI7lVfE7L/MxJG2zd9sJGIaQcP4=; b=gsmzAe/VzboOGPKZXVQwjg2IflCsMbGg27BfiL4oqQwy6KgvPj36/cfDgyfbzENgosciK2IRR ME5CAkplLDwALcAxV2KuyiT2w0LVEs5VTZ42tXYv8x1a8ED/IRa/OiA
X-Developer-Key: i=wthai@nvidia.com; a=ed25519; pk=i/6dxnUqKdr7Z6GA0KECRkwz5HX4RCiodw0v6kB9fbs=
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|PH8PR12MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ebadae-7a2d-4515-56a2-08dd9bb8d89b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXF1b1c4TGlDcFVocGNGSjhlU1NQWlRpVDlWSW1aUWJDdWJjbDVKcXZ6NmNF?=
 =?utf-8?B?K3JNTmJPNG1JVUtqN3JZdHhZSitDY1VWSDUvYStzQmc5MTRxQXl6NEJCeVNq?=
 =?utf-8?B?L0E1eGFkOUlWaTgyVWlyTzVuV1hKZ1V5RGNLOEwrekJEbVRTelhtYjVZTG94?=
 =?utf-8?B?dmVxZDZldGwxVUlDVEx3MUNPUzYxTVFPYjk0WExxWlp3c2VBa3Nid0NIdDJU?=
 =?utf-8?B?Z0ZwRnZaTFNBZHNYR09UT1JOVTFLMWMrcWoxL1BDRnIxaEI5WEM5UTlnVkN0?=
 =?utf-8?B?NmRrMFV3MHN3VlpkTFpkQWtnSDZSY2U0ZkxOcXR2ZENjZGNNWTFJb1pHQ3V2?=
 =?utf-8?B?K3F1QkZveEl0d1dUUXkvVWJaSzhaNjd5NWJKV0cweTNYNzFvbzhlcDRBWUtC?=
 =?utf-8?B?ZTF1ajc4K2JwV0xzelEwZ3FUT1ZYWkFCaXdYdW9wWUdwWFQzYmxJcndKY0Zj?=
 =?utf-8?B?TEk4STJsTktWaGEzK0tCdlVoT1loTlpBQWNZVmVqQkJsa3JmWU1UdEYrVUVK?=
 =?utf-8?B?Mkp1UllwVE1LeGdubWtYcG1yK3VxNHJ0ZmpZSm1qakw4djdueHFNQ1RXeWkz?=
 =?utf-8?B?MGhadEVPVFFUbHVnN2pobW5rWUptUXVBcG54UzB0anc3QU1TNUxRZTUzVWlu?=
 =?utf-8?B?T3B0THkwMm01VnhnRXlvcytpUHV4bEhDR2picmR1R1N6SmJXK0FlRFVaNUNC?=
 =?utf-8?B?dDhVS1gvMTZQWFFtYzRzTWxRS1ZuQkJwOVVBTDRLcElxc0xrSVNSVDNsaUlx?=
 =?utf-8?B?YXNmbXZDQXlrbHBRK2JCME5OUFJNZkVveWJCV0N1eGRyelVBRCt6VlFIWVQ0?=
 =?utf-8?B?UmFXYkdReWxGdkNGK3E1TE94aUVIV1I2bjBrd2V0VUUvY0xxbE5vd2k0TTJV?=
 =?utf-8?B?V2NxNlh5S2VNNERwZHlzQ3JWYnovNzJMcEJRbmdHY29HRXVoZHQ5Z2ZBditk?=
 =?utf-8?B?dGNsY1hLU3RoNEFYaDFxTS8zUUZub0padDNvSDJsWm4wQVFMRVYvYkxRWUQr?=
 =?utf-8?B?S2RaUWQ0UXRGa1Z0QWpTTWRRVTRqQVFEdzU4YkJuWlZQSGJFZEFkaDNDVi9w?=
 =?utf-8?B?dm9WQ0MxYXFIR3BnM2FuMmFuS0MyaDFBd0taTytxTG9qMDNqYzc5TkRwUGtU?=
 =?utf-8?B?d01EbFlhNDhOdFQyYW1MNmsxUVo4ekowazNKWW96WDFMTytWR0VPRkFza0or?=
 =?utf-8?B?ZHRuOW16ZHk0d0NDb2ZTNDIxMjVVSWFzR3poekp6cjFwWnBHTEdtUldxZlcx?=
 =?utf-8?B?S0xvZ0hkT2xxaE1oZVRGUmFuZGlFU2l0L1VYUzR0UjRMRUczNkR2REFsbHox?=
 =?utf-8?B?VkhoNktsM2ZRT1poSFlDazRiZy8yTmd0VjZPeDdiZURIU2gvKzQ1dHZDcnJr?=
 =?utf-8?B?dkRWUGkzeUZ3b3E2bytsdDJ5UzFGZkc3SVMrSXc2UkkySjB0b0NvSjFPWWZk?=
 =?utf-8?B?aW5Ca0VUNEs2aVBCUVFhT0pIeWtVYWhPUmRIOEh4Nlc3WVNCUkxvdUdOaGh0?=
 =?utf-8?B?d0xHK2lsRmloMjdOUFNUeFRxUnRJUTgwYkcrQ01wdU0yRXNRdHpqUGQ1U0w3?=
 =?utf-8?B?d3JxOFg1U1RRb2RyYlgrWGNWanhyZWlBd0xGR0JLdDN5blpwR2RhT3AvNWxT?=
 =?utf-8?B?K2Z3Y1FnRnlrU0h4NUQ2bEpzWnB0eDVLZ3ovcTFYYVFvM0lqYXhvSUZycVRI?=
 =?utf-8?B?RjVTam5BdWRYSnllQi9JV0t3cUgwU0JGU09tOGl0VDd2TSs1eWxkWFBQbDQ5?=
 =?utf-8?B?R2MvQit5SUl5amx4OFFpd3UzTWdvelkrczFuMmtYZmRDTExYTHc0MTlyY2lu?=
 =?utf-8?B?dGtBQ3JZN1F6akxIcDhwM01ONXRxRXpJK2JLKzBEdlFFZ1ZEa0RvZXY2RUp1?=
 =?utf-8?B?SDV3SWo3YWxPWHdpZTdZQ3p4UHE3MXU3dEVEVDhvNG9NcXRKY3F1TVZRbEs0?=
 =?utf-8?B?a1MxY3FTZGVab21qUHBvZkJQRU0wWmh5YmV5NjFnNkNNZGhVN3JMR1FNdy84?=
 =?utf-8?B?ZjlOb0NqQUZ1T1RqcGJvTjByR1ErdWNyZlZwMmxuVm9TMmUvZDl1USt5VmZS?=
 =?utf-8?Q?6n4INd?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2025 18:20:36.4690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ebadae-7a2d-4515-56a2-08dd9bb8d89b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7327
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_112045_149134_57B90D24 
X-CRM114-Status: UNSURE (   7.48  )
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

Update the DTS file for the GB200NVL hardware change.

Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
Signed-off-by: Ed Tanous <etanous@nvidia.com>
Signed-off-by: Leo Huang <leohu@nvidia.com>
Signed-off-by: Willie Thai <wthai@nvidia.com>

Signed-off-by: Willie Thai <wthai@nvidia.com>
---
Willie Thai (3):
      ARM: dts: aspeed: nvidia: gb200nvl: Add VCC Supply
      ARM: dts: aspeed: nvidia: gb200nvl: Enable i2c3 bus
      ARM: dts: aspeed: nvidia: gb200nvl: Repurpose the HMC gpio pin

 .../dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts  | 39 ++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)
---
base-commit: 13c9c6eabf033ed4f369ad4d29bdc58ed4a411e3
change-id: 20250525-dts-8eca0cb6dfae

Best regards,
-- 
Willie Thai <wthai@nvidia.com>


