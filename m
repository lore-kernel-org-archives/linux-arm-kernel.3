Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B04C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUVJOjqAY6ZKGAG9+ZN2cDa8oLcN+Mu0uyn6y/92Ndc=; b=3R0J0RvqArrQbpBI5tMu9QWZam
	53zLGvggJ5eHvBQWsPHKYkuExz6zn/n5UP12muKx/8DGXKh7qAwV5YbJbP+G6BRy413j9LvHy+oog
	RFRDpOWV5Fsb8x615TzebcaEwVY+UDtrpbUkoTyyv4Hiddy1xtWSCw41NrPUXTa6l7uFPu4+mP4aO
	xd8yU8uPFmX1o8DnfgIP+IPREON+x2BeCF0CLvu/dp1wHn5o90fxMUfnetml23VqatPlOOA2uO5jt
	vBnPqwudf9xunCsF4taueRIOGgSulBtZ/E/dMmOIcpLYsbqWRQZKcbzF76Qad2CdgP15Me3bGdhbw
	1zpII7UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93oO-000000067Z0-2NwI;
	Tue, 22 Sep 2026 16:57:44 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93oM-000000067YG-0sz2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:57:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0PTJvZ8KMf+jur3eRYj+agBLr8Kpq0Ao6BzWK/w5/gJOHLNqikrai1Pk/nEgV3oBr3dUdWPsTCug3zhukP8/sKKM754M9c7TjqFSyC7AVjnU548o+IepJcoLV6PcnWBQSj+6cKk9f8icFHiIzdp26yM0GCXu17LNzCosSFp4FZw/FsIUgOWRXD9BjqpfhN25BblU7V25uMD/4tnoTcvGn3gTmC655wTpfNBVEabXnI923Z2iKxIu/ZJQ8alIUpikHJ5coJvwjRLsUqciY8gqEsmnA2d37DMk2tI+hLlqPA4i7JNXs8xgfZRMqXpvKXFyptv05GJWGJgRxi03CyL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUVJOjqAY6ZKGAG9+ZN2cDa8oLcN+Mu0uyn6y/92Ndc=;
 b=UjNmSQeZcyLIe/EBGxZMYiMdOnRmG8mdkw5SzLprJaby7Yf1FX+YpkWX+H0qS9rGj0GBghnuafyIqeau3Bom6QaDT45hPz9OWIdZlIjpgpgRlYgx6IwRTlq947Jag/h5B5Wl1BM7CdgzrvUhKxEBl372DedbtQkYNh48PP6UbS35KNIF4711zv38Hs+9q6Wp2kDCbx9RtTXL8roid8gQCMr7BYnAV2Ll7R24r7Z4EOIZptf34WtFAze+iOp0MDr3cr8ncHg0SZNmiEmURAo0jQ8o+wq+y2Iu/aXqh+AJFPsu6FYlWIYFoEnwsm9ETixZxmIp94h8fnQmQwwpwtuuQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUVJOjqAY6ZKGAG9+ZN2cDa8oLcN+Mu0uyn6y/92Ndc=;
 b=BCp1D8qNl0VHtYqfVIObysdJ82MGdHdCCYQ2FrA9Llt1+VQxeUbuAHFVAC8JKsRRyWWZIyzEmbsFn4nW5orhk1rOFddNTrTl0UgyLVOPHlmlknfCCxbjtmR4KGdlw9MgMlPC03NNR/HkEVZyWWumWMbAlxyiUD7WP0+qjC5P7bgCaMBGTIMTD6WYzLBpLqfBvnEwC7SceCSJFuyJglmEWZAIGBcG4qMNUp8plrWvzw1KfSBbDvdZwEdVbqZR/hTvzmabWHAuQlDUPNKqdz6Sc/lKyh+7wqLlyl/kMwtbNu/NKObQ1q3PCVWYc6oxNP9om5Txwi4jphnApp4RWRN3kQ==
Received: from PH7PR13CA0012.namprd13.prod.outlook.com (2603:10b6:510:174::18)
 by PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 16:57:28 +0000
Received: from BY1PEPF0002695B.namprd05.prod.outlook.com
 (2603:10b6:510:174:cafe::f) by PH7PR13CA0012.outlook.office365.com
 (2603:10b6:510:174::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 16:57:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BY1PEPF0002695B.mail.protection.outlook.com (10.167.244.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 16:57:27 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 09:56:55 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 09:56:55 -0700
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Tue, 22 Sep 2026 09:56:54 -0700
Date: Tue, 22 Sep 2026 09:56:52 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Peng Fan <peng.fan@oss.nxp.com>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel (AMD)" <joro@8bytes.org>, Jean-Philippe Brucker <jpb@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Peng Fan
	<peng.fan@nxp.com>
Subject: Re: [PATCH RFC v2 1/4] iommu/arm-smmu-v3: Convert streams from RB
 tree to XArray
Message-ID: <arKzVL3PA/d2o8lF@nvidia.com>
References: <20260921-smmu-shared-sid-v2-0-4b656ce68178@nxp.com>
 <20260921-smmu-shared-sid-v2-1-4b656ce68178@nxp.com>
 <arGEXU2GqmYYBBjb@nvidia.com>
 <arKK9+M85xeknRa9@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <arKK9+M85xeknRa9@shlinux89>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695B:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ac6c9e-f053-497b-ef52-08df18ca955b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|7416014|1800799024|376014|10067099003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: xWwn1Cp2MmQMliErK03wpQFqig6mMJ67WTPFEZCNYnzzjYuhw/VtjCHyTh7VjzmNG3s4a3PpyLxFvEjGhoUAP0yqgxGOCvM+ZwbImNDz65S28MiTyqw/fFtL8iWSajsehxJKgrv3LRMkGcdtm3qwwACq+bk9Hvgyrf+A0v8E9JoG5vwWqXKc2K86+PxGdN5GFHWyD5ltD1Lgt9episkzi6wCzC05USCQ1zFeXZ3zAUEngHaP1VM4o2gKG4vIKMoNpeYGkA3rVF21k9OxTb4kFUeQ0yBdXCq8iJb4H+F7fdyHLOqNSDJJJPdbG/Sp1K5xRH7QZjMW+dKX8mF0Io0fEDLOPN5bppH0RpeWbQxP6DbHzUH2+VnKQ6GfJJRktQ7TS+N3anoy7BXZNa1lELeOOdulU2qTWmOMAxgjhHipNFgShKD/Xvl4jvlG5Wa8zYwzLQJCOKTi1XMnEUvY64ULU6Lr6mw7AKQeKi2KahoqVHgnbASqQgpO8azvG/wDa9TMvGHlS1iWKuo+/dT2IvCtYaS+VATk3C161yJbZFlXGxuFOwhrh+kMbkMRR8vghsFsKpbmhiE7Kxu8+DJAyWswu2iFi5w85ufSL5u7ph+C4qH0MZt3JOKqn5WIgB1788x1QhaVMtOUzN2INAHRzZXDsx8j1QW6B8Fr1+YWzrp/lSxryWCW0jOdx1aiXh8J/4xYg3btfZrZ2O2u0EQ+U8GuKw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(7416014)(1800799024)(376014)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: idCZSX/VW6FVDEXd7SoUwktOMbWu1varLrU1eqvJmj+s9L4GAAMtceFBnkUs9qdAg+M6JlqpTuAhqW/w7/QIW5965Sax+IBamwEF4R3xJ9noJf4AdlTFM018Lvk1djrELxEqAluVWr7KPkINVTuIBCzk7hyU6qCB7ZA9gIV0hWhlT9wii0z2AMd8JTu8aJBWvaic1OKsL0NHjuhUsZJvoJ2MSEb30qcJ89o9MAVM01MUgasCeivt7a4ruGnrAWfLllvJTEK+rMSeBDBfmwZAxxAluB5gdAhsyq14mwVqqMwJ6bLN0Z1oJp1mAtCsId5kDrql0nxWL2mBj6FQc05jLzFJwL2tAqOD6gEsg6eeZdnQl9IbWVE2iE4nnKqkIh3JfixQL0cPsMuxEofT716WASklEM7SY+gapnbXD/02oia30ye7gqAz/8npnLxGryMy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 16:57:27.7900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ac6c9e-f053-497b-ef52-08df18ca955b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0002695B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_095742_253302_558B99CA 
X-CRM114-Status: GOOD (  13.71  )
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

On Tue, Sep 22, 2026 at 10:04:39PM +0800, Peng Fan wrote:
> >... and slightly mentions "simplifies". Maybe it should write about
> >why this is necessary and how xarray would simplify vs RB tree?
> 
> Jean had a comment that "maybe simplify the driver first by moving to a xarray",
> see [1] [2].
> 
> [1] https://lore.kernel.org/linux-iommu/20230518130459.GA2587493@myrica/
> [2] https://lore.kernel.org/linux-iommu/ecb3725c-27c4-944b-b42c-f4e293521f94@arm.com/#t

You should have put a suggested-by tag and likely one of the links
as well.

With that being said, I don't see the reasoning in those emails very
convincing either. I don't dislike xarray. Yet in this series, there
seems no compelling reason on switching RB tree to xarray.

> A subsequent patch needs to look up an existing stream by SID and
> then decide to share it rather than reject it - two separate
> operations. The RB tree's rb_find_add() fuses lookup and insertion
> atomically: it either inserts or returns the collision, making
> "find, then conditionally share" impossible without restructuring.
> XArray's xa_load() and xa_store() are independent operations that
> naturally support this pattern.

If you avoid duplicated stream structures as I suggested in PATCH-2,
there is no need of that, since you would only insert once to the RB
tree.

Nicolin

