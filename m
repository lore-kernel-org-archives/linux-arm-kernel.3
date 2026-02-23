Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD07E63C8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ee6aRlOGTv+YnZm06vTr9I+fOvEc+zQd9HyT0q+aC8U=; b=thaOfg9cGRhZEnBvYBguB775rJ
	zqpZVBzIccJ/i25Ru9wlTw5HB3LbBPkUV4hOw914RfZl52O+GeW2T7Ep91OXIhLX2uR3s6zp4u8pz
	539+Xey1n4Xzql92YmgolXl7RXlDjqgm+6Z0Iu02E2ZEfCBUoBMyVj1bL846oYBNl/PImmABe840u
	cVXSllgmAovDEsC6U5VsRkId5PmKuk1aH1OCAiSoHciC2eoPdja0uIv80TWzf+6dysIJQBN3cC1r1
	JM5+cZRja82e5XhEFyyeKqMFNKKZP3TwsEI++ERsjkuxnVumfpp35lE71itiMrFjmau9VtEp1Cspw
	KuTP33pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTZN-000000005vn-07d4;
	Mon, 23 Feb 2026 10:53:41 +0000
Received: from mail-westus3azon11011030.outbound.protection.outlook.com ([40.107.208.30] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTZL-000000005uJ-1GBj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:53:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g75eMF1Anp+M9BBMI6HlxH1LGKY9Qn7REhsPx5g/5yhp8FS77Zrlg41JrOUkwoRvopq4gTO3STuSAlfZd1we4H4v8oJuy6xEYvfAMLyLbcS658edEt1EIw2/WH3etwqsLfecw3oBnN9EUW5qiWp7QL3msw/TYgm9c071gcFmEai/4VtO0BBYIndeMzOJTed/Opv64+2KZXzkgEA7HFcymZDJAeEEjFLi3hCKJWL4Cs6LNxefWDbmUETYfKue1pmbJ3hlfJpYRBhn0jc0tvAbrQcDf7PYFB7ju/qBPzvLjg5eRwJsMBT1qITmMgTpJW/RCis9lbeFD8zUsSi1VAAcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ee6aRlOGTv+YnZm06vTr9I+fOvEc+zQd9HyT0q+aC8U=;
 b=sL/k2jOPJ80/zpV9GqSant72LAWFs49J1HCqFiHj9y553MNIXeYEvmDW8gf2/azXwSlPYZgF1F0riFqjyDwgAqvyU5K7+k1aEwLGcMg5ch/w7yIPAu9oXPU9oK1av4TyeKHb9kd9NmjbaGlDQf77K79/6Cck7FFPJQbb+DAc4q/B5mo5Gz4WPLJyWwVJdctkrAegyod/iaoydHYvdyMHwoRFfmuQCHvcdXGGL+u9mA5/syFf+Lq1rLR3QRUL3oTiSVTykG2Mr3tYyYGvk8NLYhydnPpUBv1UPvZUigpSEJzXBI4PTeJi4e3qJHI+hnM8d5aHwAO3rJTql+G5VLEmfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ee6aRlOGTv+YnZm06vTr9I+fOvEc+zQd9HyT0q+aC8U=;
 b=mjh2MoBZ7/MPIBpvaa3K/PBXwR2Sw0U1azyrOeD0A1gJAIctnj+DvP2R5RckhJtesKw9dxoIAr7/RE2o7aVkupfXZAKJJ0YdQb8I0ggEeVP5p/PCU5/IY98Uckkw6qG7qU3zHeO/nCvThQsKOGHkoRfch7mllZfR6KYEhbnaEM8=
Received: from BYAPR11CA0107.namprd11.prod.outlook.com (2603:10b6:a03:f4::48)
 by DS4PPF17DE2E3E9.namprd10.prod.outlook.com (2603:10b6:f:fc00::d0c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 10:53:30 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:f4:cafe::e) by BYAPR11CA0107.outlook.office365.com
 (2603:10b6:a03:f4::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 10:53:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 10:53:29 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:53:29 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:53:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 04:53:29 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NArIFF179443;
	Mon, 23 Feb 2026 04:53:26 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 2/4] arm64: dts: ti: k3-am654-base-board: add ti,min-output-impedance
Date: Mon, 23 Feb 2026 16:24:13 +0530
Message-ID: <20260223105448.1110428-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260223105448.1110428-1-s-vadapalli@ti.com>
References: <20260223105448.1110428-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|DS4PPF17DE2E3E9:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1cefac-c626-477a-7f9e-08de72c9c7d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6xVtRdtPJAWnVLA4bSvHwMG1TLtN56KDt1fhbxGZOXl4QCfM+xjUaPgUJ5kG?=
 =?us-ascii?Q?DRm98XyVjGSKutuPP8Q/V83bEx0oUBE0sQFAJ1qq+slBigOr0sT3x4JyYPep?=
 =?us-ascii?Q?nrrCyiIeNsqzEbesruQSkd5exD+NDnn00fh3mF47JQLKNLdqleFXB4oZhX/g?=
 =?us-ascii?Q?H4xKvVBpmledrtRhV5v2VChVnxJALvfFq1Qe4vWeSqnXWLZYTJ5ywejnlANo?=
 =?us-ascii?Q?EotQBQ09zN6/lfHlYE1c3gtPLdKLrpMXS3+ho0N1XoeUrJn7EJNfwft/yUWT?=
 =?us-ascii?Q?I1Pc8wqN0TkdJvyx06UJagoJdNiJ9rz3G5edvfIzgn77gCEJ9TOcyE27heUO?=
 =?us-ascii?Q?w8oS4fH2XYxjFnaBGdUDEORC573O0uxva1vlxXSpOUxsWmEySKGBXir/uC7R?=
 =?us-ascii?Q?kHF4JhSiI5InBYrbJV9dGjAykIrKw1qOHIc3go2VOVQG4SWgDd8B5eQu92zc?=
 =?us-ascii?Q?xCUHIQdZ/3INZcYg8mQvztjWXqvH+uERdoMb31tOFfDK5mHd2b3GUG1Qg8i/?=
 =?us-ascii?Q?koyf+ytI5Op2nnXMBE5KjKcFJaSl7x5hFz27qjy6MQo9cM7oZ2miRWZg2DiY?=
 =?us-ascii?Q?4RUToKm29LIQbNlUWQhqnXe437ZXMPtSqM4nSq9JQNV+272igU3kKwvGPTFR?=
 =?us-ascii?Q?NnAG5ovPl4BniKyH55D34qLMqG9dh9JNkCo3XrgdNIzIan1IP4mySmnzG/Dy?=
 =?us-ascii?Q?3OUiHrIp07BM3D2EcZJpbHhOCuVH+N7NK4fyW99vBwN0QkCc2yeSKyO3TFau?=
 =?us-ascii?Q?0AKRYp1DQzOQE3Y8YXHAerF7pdMiqSUQpbFfQWj9+3V6dATg0pT2w28tics/?=
 =?us-ascii?Q?vY88q0XZPssmOkUUiYnBWr5JWHKUYIftGIoEhX0wko7EK7EgZh9S5fzPu8Ui?=
 =?us-ascii?Q?Eq3mcjaDudIQ199+idFw5Zy409xIz3rVbM/aoqZb49IuKj5als6fxrpmcaWW?=
 =?us-ascii?Q?1cw8tfLT0DVb2iAkXvcMElPI52giZ1PVO4bFcGgm7iNbxno3y6/yPIRget/K?=
 =?us-ascii?Q?aGn2HBx6iv5ldMk7K4RuI7MhtT4WrU/iohWZFN+EopmoCzSR3zu1gtr/L4P2?=
 =?us-ascii?Q?PyTX+yZTUN1eF7mcK8mcvv7tg+tidEPu4yr91vqu3fcOuSPFaTU81DLQdXeV?=
 =?us-ascii?Q?85/dYXFD+hXADWBnD+tjbuw1eccIzr9uUQlGbgTinPlK/5qpnjRMZJjZ01kc?=
 =?us-ascii?Q?mBcNuhCnU9h+k42Qokyc1LBAfyWNfRxTMOBtgSt3UIdmqLBwqnXJZPyKAyjs?=
 =?us-ascii?Q?MVGVnHxucWYsH1fnx++ayVvLUHcCWBZ3I4ZxXqAD5gEoKYD75hO3X3QaOoJf?=
 =?us-ascii?Q?d+jrlTyZCPDcjM/Oiyx0oVd7RLIg2YfK6cQ06mg5l58QzHEiL0vXbR4fjIbg?=
 =?us-ascii?Q?Ciz1bD7gguDpLVdlHyMiliZ7IisXf4ZJVYcL9IUNC/pHduDH5JHNCgOC97zG?=
 =?us-ascii?Q?W2TmKjsd7/QTCVLd1jOCnfU86HKXFm39m+vMpFqugZy44i7TuAz1Ay9LbKw4?=
 =?us-ascii?Q?DmC7ZLQrOApxIOCyaGozF+8bl5dr3uXD4B2jPSGMtpd8ax1rokfz/tfq6Hj+?=
 =?us-ascii?Q?Bzybs50NVXMkqG+P2vlpfdo9XfpJm+gA8gXNmzR4lOWZhBcNXiCLEYLBrZGR?=
 =?us-ascii?Q?m/4RMrBmeb7CSSW2woUuO5WOxoICtmdUit1PM9Kz/fQRRcfqTZM2P8m8a/gb?=
 =?us-ascii?Q?nkOGZQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZcuGrSFrhrOQUZXpuXBVVMlVpYf+lPrVbcoVpd2wrx7cCguusmcvS3E+6s4If/5B/ZSLvXJUxR3+dTBlzaWbAsC6KIExvzg7KeqzC4rMk0BHElZXb4wSCBm52mflU68g8J6RygKC3iLfgJJdFtTddvdg0Hf+BVR5Tk4NYi9BhjwZ2QsWEGWxaFljN4AmRR5zKghlm67SDmlYj0X5uTAUZ7P3eIaBJddifrVZ0faYT5PD8bf4w2kKo2jP4bIwaZ4STchMsJulB19MBtmL+f6nt+bG8cpBBQ5OZIs8LBHJll/17KmkMqEB3Cs3ry1GbL9Mv8THyL3VJNdLU97OhhkUgKI5t/9kFR0bA6jnILzQn9buk1fvjJvbS5+fJhusXNX4aulQ0tBPlvqH1Noto9pMrIpuyEkXye6rgDjkFClR0+8GFflY+6bjVB0jhYRkHqta
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:53:29.8322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1cefac-c626-477a-7f9e-08de72c9c7d1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF17DE2E3E9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_025339_349634_CC9FDCCF 
X-CRM114-Status: UNSURE (   8.88  )
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

The default impedance for the MAC I/O lines from the DP83867 Ethernet PHY
is 50 Ohm. Based on the board PCB traces, this impedance is relatively
higher than expected, resulting in CRC errors for packets being transmitted
and received. Hence, add the "ti,min-output-impedance" device-tree property
to set the impedance to its lowest possible value of 35 Ohm as described in
the DP83867 Datasheet [0].

[0]: https://www.ti.com/lit/ds/symlink/dp83867e.pdf

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index e0262c2743eb..ca1300e13093 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -583,6 +583,7 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
 	};
 };
 
-- 
2.51.1


