Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DB8C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmcaDwpK93S3fAsc4ociQaqlFYC8VzbLTh28xMRc87Y=; b=Tog0bT+XjEsrlxMSK/1UBchz0S
	GT6BiMtQ+XfmJo6ZGw7keriljOPuDV0BR+XiJwd6D8v/kYM3OZcoZ5AY+YwJT2KUR39dPXMRCbnAu
	nKPl3LKRm/5la+Ms169kiYYY6DqDpeG3wmUXA8PKZ6VaKbaXnWWMoVXeeokWkHv5XM6U+NzvnwA9+
	tfICaXbft+W+bZT1Kr2sGBSpQue/dEojacopMB8ZIfY8PlQTpGw1fk3EJ95lIlB+7Pdj3WcxwaeRJ
	r1ybkjEDWqdLkr9AAshveLuatvFvww/le8tMoofHercwmWF31lSk1bfYF1+xq9iBDd+YstYz34PPg
	NKx4Lq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1oA-00000006MWa-1Emd;
	Thu, 06 Aug 2026 17:23:06 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1o7-00000006MVr-27lx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:23:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlHGazu7V3cPgsKaAx3rhWU1LTgjdNRWwQhijc4KfRMLhPOqS12HrqXQ8NlCk6gDXecm0//3qVTfjRjlqq34jp3ryBv2B0b/maVS6OJDwHcbQq+jrcsGtiSM3964iNB+LTBcy7lUJz42zMkO6jUDMt/DZjZ+p+eIUd3HRf2AbmNXhxA6gcZbBQFNgZ3nVDqFXUni2ZMAEhc1PHn7A/hYM38jSKIjMObN5awSv00GqN4k4xTRDSxx+HRmHoMPLGT91ISqSVUbQ9DqnXUX9Y9RLLaq+/cbeHCWVuNBjw+RXTqNIXETYQwQJQ7jxWgNXBlOURvzgtNWyqUjxeMAM6xFDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmcaDwpK93S3fAsc4ociQaqlFYC8VzbLTh28xMRc87Y=;
 b=Zz+gP0S1qU+dJNfYbb8gFZwVpdOdnZ5nvNa3SCpfVGzMmjevuQtXuCSIWD939EYJUdd4Lvfa+6NNgCd69uah11nPxTwaada6+aC6ouvXjtdCCXDfYGU6oSEnwuglAsDdxPpvR50WNG6UIFtH+8fTjwBlTCPK9b/iJSYVyxkFRCVGksJl2tlTPUxCaftou7Vwwh0S6UjvsLNRD3Zdzh0H+mAM0SXaFVHsGd6PPuO8AryjY6MjXltqdilJIXoJ7/0jF5qdbvXQixt8gLsDORnt2F0YZb3oDa1ibrxUKw8c5nLY11BUJLe65msT7Ii4kYJfxngkpgd/mZpyH7ZZpftUjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmcaDwpK93S3fAsc4ociQaqlFYC8VzbLTh28xMRc87Y=;
 b=uZ8VO3ySvt+SKLogsUdYOjhKlZd/t5NiUR4YTd3lCvN/eWYt1BJoUpZZAFoG6R1YPNb+oRg1jX0B0N6upXf1sUamEBfHybqqr8G0bTHKZ2yWbRP5uxQKH9JaM4mAYut2+/9beE7Vppq2ZLS5lOJCLwcbKoiU46JeiFq4bm+e5+pEmM6pJdGaTrEpq+a2p96ZV2lbCsgFTk7ugEkZ/bMp0OpCLTq8z/BGmAXLaOrB6GnaFE2BNR5G450Moxz//wVh76Y6XgTxOiogeiIAK3U/I8LPXdMKWZsYy19cOR4cKsM0Q6Jda6iYsyibb7c5Z1SAaX48eIKxgzoGhei4w/KUqA==
Received: from CH2PR20CA0004.namprd20.prod.outlook.com (2603:10b6:610:58::14)
 by DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 17:22:54 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::8f) by CH2PR20CA0004.outlook.office365.com
 (2603:10b6:610:58::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 17:22:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 17:22:54 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 6 Aug
 2026 10:22:30 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Aug
 2026 10:22:29 -0700
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Aug 2026 10:22:28 -0700
Date: Thu, 6 Aug 2026 10:22:26 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, "Joerg
 Roedel (AMD)" <joro@8bytes.org>, <linux-tegra@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] iommu/tegra241-cmdqv: Reject a VCMDQ base above the
 48-bit hardware limit
Message-ID: <anTC0q50E9Kp2zFC@nvidia.com>
References: <20260729220329.805417-1-nicolinc@nvidia.com>
 <anSCXUjivdb_aOv_@willie-the-truck>
 <7e66d67a-f63f-465c-acb0-c1238f534c07@arm.com>
 <20260806140951.GA71449@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260806140951.GA71449@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|DM6PR12MB4401:EE_
X-MS-Office365-Filtering-Correlation-Id: da28f438-9f02-4eaf-20f3-08def3df59bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2L8Dyx4kdzQuG7U+4p4infpKguGeJ829MG+bRQQftwrVt888FUV04ftWAhzWdrCry+3a6VEjyEofqD5tLt9p6Yz2QzNxu34eUyhQQxMh239Tn7t/ugqSzNYSLscxwW+G7R11uqohvfgmHXt0zIehA/K//CPoXDZox/raajnHmLWVRIRMGeQVcll+xr2JZ0OlQ2kPAabOLZjwMQ/5e+OZZzYMZjwpKbjewoDIebBnii7CN6HLrL9+j+uzWLIBTwuateQH9CCBtoX1E5eNWRkf0CD6cV9/ryL+xfFy/+0Evh44iNPYI4VPL090F5FjesB88E699yENKLSm74MERyP4d6iIcPSA5Z35IRfnqfdl0c5ovcjUVaKpazRUYt1XE2hXjWWw/J8NSibJ4uON1pqwYGLjzxRh5QU/06JoN9jz+BSyZTxC3aKXXfr6y/G0zlDVr+wyHxjSmPibjs/pGq91YCG2UGxdq1dJBDoY8nmOYCKsr6tVzBsUr1d4ptHbLOCky96GHdHBFM78clUCOJXYBSWbmkukpWVHuyShkLfoWqa83r+JvfldQ66kjXBh5b3BCUejlTHKk4bYlxQjjQw/lmp5LCfObtiBrGNWRzRZeOYiWAwluNH20oYuHOTEkP2wi1TceDs8zWaPWBPJYeuqO1L1EydEPsJTual5U7dtYA+/k04GgOkST6vsDcWO/9wzYe0z9oLQe9ewcfvyWbMjwg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dLgZWk2+fknKTMV0iJYzqhdSKkUL3/wD13c3RThLCVQHU0iVdpgqKPXCeiaNOVRfC9hqYhotmXFwnEBpxbHPUUIJf1hB7Nm/y3FJLdxdJlcgIkWca23/Hct2NMCptinkXog9MRJWbJy5TPVs5KlWpBm7jLGrcebTH7yiHGmedojSOyw8CMYUfvkYJbIWWuTQgwEUegT1RSLX4+bqiFX6S6WJGnaGtSmFTi2T4wBfiTezzwZchFv/37Waq261P+YHIFL6e6mjDIOVC3jz1I+4LzjaPOyk4JtS1KZO+tN3dSq+0iyoSHm+ief905QmvWT9OvOu2sDOI7ht/yNlMxuCc48vvNqw7de/YNZBsoaMoCdUYhe4E2yb5CxmXLe0nx3lfueDfU6x2uAYLzWTU1HakjKt1MESj4XKBIx1ObRNXWnWMoxwv6Y60xcpdaXqBjMM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 17:22:54.0021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da28f438-9f02-4eaf-20f3-08def3df59bd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_102303_547752_ACE8E29C 
X-CRM114-Status: GOOD (  14.19  )
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

On Thu, Aug 06, 2026 at 11:09:51AM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 06, 2026 at 02:17:31PM +0100, Robin Murphy wrote:
> 
> > But if we really do want to bother sanity-checking emulations, then why
> > allow them to still get away with being broken in the case that we do happen
> > to allocate queue memory at a sufficiently low PA anyway? Why not actually
> > validate smmu->oas itself (plus anything else relevant) in
> > __tegra241_cmdqv_probe()?
> 
> Yeah, if the VMM has setup the SMMU so it cannot access all of DRAM
> then it is going to be really broken across the entire driver. This
> just doesn't work at all. No reason to add any special cases to look
> for it only in vcmdq.

It sounds that a rejection in __tegra241_cmdqv_probe() wouldn't be
necessary either.

Let's drop the patch then.

Thanks
Nicolin

