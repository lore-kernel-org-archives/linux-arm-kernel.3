Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8BD10706D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 12:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPtVSl/knnE/VhzPtb+pdr0mJ4YVtDQskPkxtP7df1g=; b=LQdnNEZGhzvbsUwTXqhhs+b7Np
	J9J2EJzpsSS5v1RpEuHRIMPIOOWYQkh57i1Fskok6sYvmdOBZZmHuc5Vl1OBsfTTDU2RiZr8UkEEA
	YOhL6E6vqem+bBQP9sNkoCVrm+moJyA6IesKTUCTNjcHq/ocqqaJa1eI+YlezoFdhHIDxEOQd3/Hr
	W5JT9EW8d5IaJc7ewi81GBW1F5bF5dO5YGE3l5mGIpcFAgm4+8JqIp6OC1hJcKYMhJKsrKoTEU8rs
	KQb+eoB/ZI+kLHZJoQCQ7oZ4VspxJnwES37Y06oPOuBXtsMmw7c460usTXor2FZ+S3DK6+jBcVB4J
	IsqGEt+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1OQ9-00000001quK-3RwA;
	Sat, 14 Mar 2026 12:48:45 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1OQ7-00000001qtx-1Rkc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 12:48:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sr6BLHjIj8eEgwcWE8w8NUcCfiHdJHYCWCfIQkkAM8GFuM2PCyc6Fi71Zl8ogSWWEhbhZzIxj5RsQ/qu6lhJKyGo+DcEQlLu3XJYb8NEYqi+bKUTaVuVuW24B0rfgVhvFVrCgD+PsJCegWyNKs1F6R6WO5QSA/PghvObGxRzBwwgES6pHVS1ozK+pbut2NV4QapwIS3b6sLtDVPqlYIKxOdqnmA5ieRSbwLC1hF/DhBI/0GamQjT+kzZTyRqQ8IR9eaR0B8t1BatUO6JaILV0DB775seeZYdsgZ9I1sPQcDjN4q9A8uTjYc0ouTJm3pREi9lA1IoucD55U84jmzhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPtVSl/knnE/VhzPtb+pdr0mJ4YVtDQskPkxtP7df1g=;
 b=S5bc7evnX27OkW225/TWwF4m3BowqBdO7MuyXFro4J3vWK3FKFfe2oqN0aXNEF6y9i0aBP4ilIbuzLhbjoGKsUDoxL/xOG9nArlSZJxp7pxTazP1HsPhFmcJhCs3acAbWWY0CCoboKYvGiR/q0jqUbCqR5Gt5k/teHIMV9RnAsg6T7rlRPFmSPY1Rq8dmSKU5uK1+W9nEY+URyFh1RanV8eAG6irlaWcv/vLRHKkQ7vre0LBdVtJkrPa+3ZRcbJYDqGRuNBR2QDcUbU9yKykyJfG3hR/xA4+fsuHSr5VZ1UkIdt2zpbqlTqEezGMh2T5uX4ZEAYsxxGQwrGw7peFLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPtVSl/knnE/VhzPtb+pdr0mJ4YVtDQskPkxtP7df1g=;
 b=JeqeaAwa7GNEW9sBAN2Eq1WSLiTlS4KfU1nrYeK9QO4rGcnHOpzmV9eYGNwCKDMvN1f3BG6iFGEcYEU17Zbise7QDaim/ziK++Y1MMOQIWI5EAWL0bQzbtWD8U8IHHoN4RaIfnyL12PHFAzReXe75tYY1oMJzyMQzHvbGddzxUM=
Received: from SJ0PR03CA0009.namprd03.prod.outlook.com (2603:10b6:a03:33a::14)
 by DS4PR10MB997770.namprd10.prod.outlook.com (2603:10b6:8:34b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Sat, 14 Mar
 2026 12:48:33 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::8c) by SJ0PR03CA0009.outlook.office365.com
 (2603:10b6:a03:33a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Sat,
 14 Mar 2026 12:48:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Sat, 14 Mar 2026 12:48:32 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Mar
 2026 07:48:32 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Mar
 2026 07:48:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 14 Mar 2026 07:48:31 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62ECmRY12257177;
	Sat, 14 Mar 2026 07:48:27 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <jm@ti.com>, <afd@ti.com>, Siddharth Vadapalli
	<s-vadapalli@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <stable@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62a7-sk: Fix pin name in comment from M19 to N22
Date: Sat, 14 Mar 2026 18:18:22 +0530
Message-ID: <177349248630.927221.11137917567321094680.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260309045539.2070793-1-s-vadapalli@ti.com>
References: <20260309045539.2070793-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|DS4PR10MB997770:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b8a428-237c-4415-3923-08de81c80005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 9bTDtlNPO1UkuZr84N3fn4r4noeLzd/LUePdcmxT9X37RRp3kbYcteP7DXCFj1/CYhn3H/DsKxi1oeryDw2rGSlxw+Q0A6diCEMyxqK/Rw3JiNY6CounFeU+J4vQtdPPeTIRsjGALjgMzkXl3+RPKBICFp1tDXib9Hog36zjG7CUJ4VGtUZhJ1/dCYud8OrMNmtk2gqeJ5+yrqi8fuN2w16pOZ8gyKDMacXz2vA0XNMLHF1EgX9PpQoaXvHT05EGFYf7wUAmxbkSGm7O7cl2d47S6PFqE3kxn2fIv1YqvLsbY1vnEAp+j/A3rNkkcTPbXR6CSEsb1cJzKVIVaJYAo0evl/HvJ73VwtM3cfpqLbHmkVGM2cKawVS9J/3l8JkmPFhzw/BfWLbmaZEQA4Yh0O94i37LwEpjwfnY5W4b4ZF54Eu3vT255VDkw1EQVi27EbXjZkMz3HWcAk1dRvCOG2wHlpnM0HVoufe1dATt/eKElePHxVPO0rEuGqMFrzfzwjWIPK0SxNuFUjPiWPb2J/mWk7M3nQLtgf0cg7OaxsvIN4YncwlI+fqOXzjFTl0qD5S3je1K6hICO/6NPRxyvl5TbkmpFv22FCUJGDWkDKWqTu5YP3AjPKRLk3RxaPso5tyRvtn0oTd7HTkdOA3k2pQ/NAIJDzuaEiQZ2xklhrFl23ybk2zyxUoZ5D7eyUNjygpYrORODm9eCG3S4AXT+fZmgBh/7czrhCFcGwwMMhU=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oaKZ40wKglCVYYAnTuEMFM6FParPsBrWlRDS1e9Zfgo3CvrQJgVxsvc1KASPX1w/KI2F+n7k1HlU8eoEjo0YTY8qjyHVrEpG4TaVIzMvrgYq1Xw5bGL+AxJOy4AW0vEm+B0/559t5tmbIypqaT2IcagLiGVQ7m4Uuq3IcfMHa+/b+/tohtghmM2ucDBAfSxOPEdrQlz7Tdz49sgtRhD8KGdot6o/uqZ1ncoR1uaHTmgEsbeUmiIo22WGPpXXzEDTLn+PU8yDPrqhmpBNulCT62LtIAzPI3IjOPTeFNAPs8YOrz+16QX9htsh9PFlsbjr8O20iC0MFjwP4kxXNeqEqg8iySyWK63IpTwR+8fuhWfvEk786qTpMiihMgdYHZ0n1hp0Dv1+cXf0Jjs22GYJTdVdUZqhF5567eTGzryy27BRMn23KvQLlU/Owkp6tmBh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:48:32.5717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b8a428-237c-4415-3923-08de81c80005
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997770
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_054843_406367_B8100B3C 
X-CRM114-Status: GOOD (  11.54  )
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

Hi Siddharth Vadapalli,

On Mon, 09 Mar 2026 10:25:32 +0530, Siddharth Vadapalli wrote:
> The pin for GPMC0_CLK.GPIO0_31 at address 0x000F407C is N22 and not M19.
> Hence, fix the pin name in the comment to avoid confusion.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62a7-sk: Fix pin name in comment from M19 to N22
      commit: 6ee0792d83d5c690205c350825a4c30746c0e0a2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


