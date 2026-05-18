Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610E4CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 03:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPDpaQeHNrCq65cCV+4ZfIgSPAJIkMjINljltrPDkEw=; b=PDqgdFzf2hhB863Op2KJ3R5AL5
	4Do3sjKI6USKQpvvO4QkBPOnhds0y9A38txh+NgksFOn4tbWrbSvu4rW0fxBM3Z9nEaWFix8TG2OA
	F3Ri4SWREEpcAlA6jZH78KBpiUUtaHXTIWBoMZLo15LEdgOJcSUL2Rt7+qWWS9Zjg+z7kCbfsEI/U
	ERX0cnZxYI+Oks6p7Fgkz18XwpkC/MQFjsD4M79MDKwsppOyHS5SJhU7GWFpWcWI14URmCZ5vbcqx
	FsAosF49MNVYXRzZpFs9I1FjDn0z19JTzN0VJEQrf5q/7kWkNrnRcRBFYHtDfDj9dXk+tke1bghBM
	yjQsg/gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOp2S-0000000E6NJ-3reC;
	Mon, 18 May 2026 03:53:08 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOp2Q-0000000E6MX-19sa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 03:53:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abzJbSr+Z815mPY1MTZMZFj44OCitLT+ho3O7nwOdqr9Ze3EUeuPjlDichzlmszCVlwsx1koYftP2Mnt/qQi04BpImIseR1Q4UfwZdcxAnL/kfCB6WFZ3JVcDOQZnXwNUqV1ULtJD2p7Ys0Suc/YM3y6cWdGsaOR9/sciNExlFPj1RkRuxc7EmWDDXaXKzwa0R4heBuxN+6MeoS1e3DX1PhBQ2coZxHD0ifP1NcZPJ+spSlQE1QMqVdUlcgAZqG0OlDnsg5kwJm8L0gocGnY/jOALJpTEay+bQQwr4FR30p+MpwSwgNCZfiO/mSnJhPGeq7+ADhyvjAVtuPAfNv7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPDpaQeHNrCq65cCV+4ZfIgSPAJIkMjINljltrPDkEw=;
 b=C6crtPza35lLQagsmm4B3lNvYMNbjQahlOACf9FSp0Eehes38RBzo0EhrwFfCoqcqVhUwtTIMf7C497T+xxAR3CUYBHBL/Vhg6ecbEtV3iA3L9i2kbB5Ziqqc3nujNFtOTB54dXS1NQuD1t5l1OQSJSC89G9tqwYxqn4n3nRw5ZAzhZmCtTXLjrIyVkfPmDfSMcxlYfPywFmvMUKXDJGVIWMqXSq2KwuKOuNqfC8q+6hLIXSMGQqayv2izDGzhifC4NB+BNZUXvSGlC7ekGaI+EGn+qq5kLrJz+qwtUm4qFkJiuRhBE9vgyJvxTyK89mF1xACrHNr3sjmwr2rk/Pog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPDpaQeHNrCq65cCV+4ZfIgSPAJIkMjINljltrPDkEw=;
 b=FNYJ8X8seifiPPn/lbbccd/P/FewAyPBYlDzpJBU3udhQfaQoQ6HKWMtt09O0x0c8h+9BrswNnILmywrW5sNQGYkiPxaiW/e97xWMR5n4bd++1EdKwHjCfRdIttY+IX569jSu2yXSKkc8jI3Fuv1eaoBGrKL1vs69A/CUDbZTT4te2nFGRDLQrNyZhrsoFD/zUh1PJUPfA9PpM2TnV5k5n7ofxdbF0T9Q6SMEc3TIyjUVVAS+V1amNzX6lvxUMUmm8663CRaBAewusKTzKkfCKIv5vzFDAAJiuqx4oJlEtcb1n9m9Xe9psBRo/Cdtt27te7fl9kGhMw89OaW2sNhlA==
Received: from BN9PR03CA0484.namprd03.prod.outlook.com (2603:10b6:408:130::9)
 by SAVPR12MB999146.namprd12.prod.outlook.com (2603:10b6:806:4e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 18 May
 2026 03:52:56 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:130:cafe::1f) by BN9PR03CA0484.outlook.office365.com
 (2603:10b6:408:130::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 03:52:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 03:52:55 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 17 May
 2026 20:52:36 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 17 May
 2026 20:52:36 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 17 May 2026 20:52:35 -0700
Date: Sun, 17 May 2026 20:52:33 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <iommu@lists.linux.dev>, Jonathan Hunter <jonathanh@nvidia.com>, "Joerg
 Roedel" <joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-tegra@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Krishna Reddy <vdumpa@nvidia.com>, "Will
 Deacon" <will@kernel.org>, David Matlack <dmatlack@google.com>, Pasha
 Tatashin <pasha.tatashin@soleen.com>, <patches@lists.linux.dev>, Pranjal
 Shrivastava <praan@google.com>, Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 9/9] iommu/arm-smmu-v3: Directly encode TLBI commands
Message-ID: <agqNAd04LHNR9m0y@Asurada-Nvidia>
References: <0-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
 <9-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|SAVPR12MB999146:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c52f6d2-1afd-4b39-c1b2-08deb490f1a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|7416014|22082099003|18002099003|56012099003|3023799003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info: LInagtaRV6sDVQLVkHHfa5PCWHSDZuYopdvyxiFBd94opoAuwa4KI+edkJn3Q2OnDrLQJeOzME9biSBkZuupOrCxKYLPlDKUGFtHQRbFK/9phetpNT7Ah/h1DXKS9D0E4Ec9QwaIAKAw9wgLgKK45GQmJO4CMp9RbdJ0ZqBxXeqVq/5cmdLrH1RlGepWTbEBae7Kr0WFyRpGQSc+hakN1RtGGbuMA3tBzcWxCat5hez+67uz39SGQHDdUiXf9YXu0eufeB1Qe7G1GFsWruF8ljeek4eBzdo2joZ0NF6anw5Y2TS771e/aGOS/yPiKuTrmrphDKK23gyKmxaqn006zlMMjZEhRGN3xbQh12gPsZOEF1ZNByn9rxkhpRfkf6uMRuPkXhLNPY6tdXifxCAR18EiDt+qCs/rghT/RyY0zGPyuuIz3YEM/PfBh/KPx2WzB4wFqSlHbKdHYWz52Y5gGyZnXVRwzkcYHH/tfnXRVasN7YBoTe3VWr8a574iZQ8hW/9LQPL2S2SxMPWCowchoZw3mpySbTnSbbPr/MhiIN/q0oDIhIxOcq5TGyBWD6L6QMjZRI+qiP1q2tlR/2BBJgbQk+i2jFsdHyWi02bJuiBOkL8kIgphMmOj71srXH0KhrOadEWzKj37haPvKQxjNfEPXvidLpvB5zdBYoQ713hh4A2uT2ncWXWzWuumD8+ldy1DFm7taEd57DMfvUmCU4DCepJzr4zKpLxGyM+EJL8=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(7416014)(22082099003)(18002099003)(56012099003)(3023799003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rcOm2p1fOHI9m0zLScI01Ls7xJ5fA4552o0ylSsLXZTJWRyNs5wnERew02xMmyU/tKJFnLQKlOWpyLZmBFxaQTsbWOitwqKAEPeK5yAaCLrUSnh0HVPPhtYF7NYUJrQljlymiPF8yIZgaqnYY9JkXxJf+6bqy6JbPtmTCOZav/+S3Svwzv6BOYpjgH+vGCXQ7aH+k+O6DA6He222xAB/xoZnf57TIF5ceI2Gf77l1I4lRWB1EUPi7qzbX9sAs1zoK89IBEZE8I26M1ylyY7rHevA75Q7wh4N4GSb9VcTT1zI4DkrqtijBzEMieBXHLSl9RfGtcGSUUXeA7EfySKmZB0mzWu61RRmA7/OyUjGSoLJ5qS9AZamy7lgYoCAKmVkWJdY3rgOP56h8Xf75o4vDqAQJaRD4YwBTvP6eUCOoJCDlrsv/mqOPDfn/vbc+9ey
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 03:52:55.3831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c52f6d2-1afd-4b39-c1b2-08deb490f1a7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_205306_323598_F83F3327 
X-CRM114-Status: UNSURE (   8.60  )
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

On Wed, May 13, 2026 at 08:57:48PM -0300, Jason Gunthorpe wrote:
> TLBI is more complicated than all the other commands because the
> invalidation loop builds a template command from the struct
> arm_smmu_inv which is then expanded into many TLBI commands for the
> invalidation.
> 
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Tested-by: Pranjal Shrivastava <praan@google.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

