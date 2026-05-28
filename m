Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B59CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 19:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWskFpAdRysCC93eNYw5GyebgbDIixHzNLcUGPgxric=; b=yigJofM8cwXYabXzvAMcMG0fOo
	DM7Oen9OmyovSMXrpVm33iQvf0Zn1kTHQoBL+FV1oyMpfc2gYvmKSAopP4ok54HMkrzG4Gk7MKagt
	lbrmig0TBy2Btk6Z0H1Qw4Ac+oR9qmBBjQfYuLAvRF4ru/PftgQHttF5tnhDYyAZjWpdA9+hghzw+
	hff+tTG83+LphI5h3Weq2NHbwXAwBNAgH7s5/t1uTDxlu3peLmLBnOkoJMPU/eE+DOzNuO3CvIHHR
	MsD9v6tqM6A9PwhO3x7UQLM+DeNtO8FdVLxEfD7G6ebtFK2lgATqiJ2T3htkUnD1/rfP2/ACH1YJ2
	FirLauhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSgcE-00000006I54-3Fao;
	Thu, 28 May 2026 19:42:02 +0000
Received: from mail-westus2azon11010001.outbound.protection.outlook.com ([52.101.46.1] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSgcC-00000006I4W-2qeY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 19:42:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEQxOiiokF7SyBN6s86AHhur1+V4xYxWh+R5OECLEyeHa0ut8egEUTATxgarqg7lPbPPn4glJVmz9jcQ+f385UE8SNoN+mwiOE+I5HQtKVj7lrQjAOJ2hQ4XJi8dMdI5dYSOyqJ6GSqLKQqcEPmJ63JcOKSpzXJRUVsMFpCb8d0Xk1bESgRZ1cCQ0tHPbBzGF4I3PtXBHyAKP4KRoiWd1lm9d14yLYYiO8smPZZc+WDqSCDwKyPqy+T5nPdjwpcxeSSNUzCZH/jnEpCiIWJP+CSd/dEJ2nDFetkssZ4tzLaa6iUvcdLyHb/KlX6fUR6Idk1YXoucFLTsBzhMD07Zow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWskFpAdRysCC93eNYw5GyebgbDIixHzNLcUGPgxric=;
 b=D1B0JHNx4s0w6biu/TVdVwT7R028BdvMMyQTMhGEMwWl+6NiJB1spF2wlQilxF8/fFrLz9MrA3KAZh2Yzp/g8E00jHeKNjnmjA+ya7NB+NJH3mi/OCVzlkLAQKdX3Lrqm1kTbwiXtDZJ3sQMy1/jVROKUIL9E6rzvONkgq1ziRtIeOwNvKzNZQoHlRLBQKDpu5UQflOAgmhI/KgV4uyvrM5NplAW87GPJZyBhXaTYcbnJHQSFi9JjD7ENSh9ovQWMHkoUhm9nErqTs+j9zp2UGt4tMH27rf8DrkyLQvwxMzKLEUR4rGv+2u+uKyn2e23c4xtvFXqIxcxldV8JFN9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWskFpAdRysCC93eNYw5GyebgbDIixHzNLcUGPgxric=;
 b=OFDHoEbr2jv0IiTVxPTQeO6U4fFNgNNKGxwPBW5AW2VgFMEM6/wuvcsAzVQCpkXbUxhyJfQ9Fo1MuHBqDCR2RxRHkd64pXbKcplyf0nIeHXZULgqsPdp95+CND1X30ls8ZDjEOo5XNmiPQo52YfaUS3A0zregdoJKit9pLbAaP7NjRjTxmfN+IfdJ7u0N1Dck/eGgJyTqfpO7sylKd/AUN1/wTqbRBiOOdz6GhexpHt3LGcuWCpQj9/0NqCcGIcnASQm9/pnKEHEQZQpcKt8LdhrhmYwpAjqCRaRqT12QgUElvd7tmqxkTU1cXG89Zlmi4Yf0uJ3eyCgzdnPxJx5LA==
Received: from CH3P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::32)
 by CH3PR12MB8996.namprd12.prod.outlook.com (2603:10b6:610:170::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 19:41:51 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::6b) by CH3P220CA0012.outlook.office365.com
 (2603:10b6:610:1e8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 19:41:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 28 May 2026 19:41:51 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 12:41:37 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 28 May 2026 12:41:37 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 28 May 2026 12:41:36 -0700
Date: Thu, 28 May 2026 12:41:35 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <iommu@lists.linux.dev>, Will Deacon <will@kernel.org>, Joerg Roedel
	<joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Daniel Mentz
	<danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 07/11] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <ahiabwoaBdYwbtar@Asurada-Nvidia>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-8-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260527221407.1756491-8-praan@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|CH3PR12MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f68088d-3ae9-438a-e021-08debcf12a4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|3023799007|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: /pVZzbwTqk6IJ+SR6m82UhdXmmT/pXjkGMK5V5W/Ku81u4vEnoCg6nWKL5Hi2ZqbgOMckAmmid66imsN/2ev+FZA8CO2fgjl4VuHp0VwGXH95coyv28WR21md53y8SHsSEVEgm6CX1SDYBr5VNz0B+LXT4gv1t+N2rya4PJu0czOT8EQKF4FYx78/CHtk8Vntd7i3VSGgKZHhS6xGj5nC8wR+b5dIkEjSafHSEPNEfKUwa9nWXJX3Ym7evVF2Kflc773HSbWgGYFkTsazAKCUtyHwQVLaqD0Ml7x89o1aDgKWqgpADrkGdrvQABS5vmdjmvDkaC+aztovZIEybtM9cJsc0dTdVAb6NmOV1ad/3okQY/y/CFkGNom4vthaGl+X0MEnB3yOzOhwExTd6PzZKEM29sqlTtYBzSLY5BQg9VXWSKMn7XZkcc19rp41t2xxd2IZYg8sfCRoUK2zllYNu/htxliFJPPfcmmaZ7zD8C+B4vO513IRn56hByngGKMCd2FRO/FgiUaHx4h5VBUWI9cOQk2BShI1bR0zuW6//lnoY7r30+72IADfGusYDVmdhIUV8yug7M8E1OBy0XWiSgyephVISAAEgJgntSe7ofTv8iIpc0nySXheb8/6c8X7Rljk7H2B3Q61rTEqgCWK7wiwaUGFvhbDbjI/O9Eu5791iBuTCmrKnPoC+82Zx9gXvqP3Dr8J7oYsKe/1TV5lBR4G6jF6RAsgL7VcYhdvsk=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8jl+sLBi89h617LzMKtCITipT+x/fBgNSJA+Ttqrgm0xsFn9Fo2zsnwNQoA37LqdxuKDj12aIpuJVB8kvXD/eauuthtGVD0xhguLPNrc2UlJK6lnOqmztm/mMU6Iul8XbW2LravKUUH5Tp2PAPw4lE3Js4no9JfEPBcN9s/s/yK87xtUtyfOUslDg4jz8NJjJ6SjmpVsr0oeEmg5VU6rgaaF0sgTzZYMAYFaS0kn8NlP7acFaeHkkj3Fe7ftKNHgttE0bxY6kpOms8WOz2Xu62wzlEBAVF/G1R3mWK+Sd4jTNgQV/qjraxm0U16V0NpPFjgyV4ynIbX7XLOSUD4c5MH4EJWnkyM+LgDfRwc+G6GPOEYTU3beIoRK9TVPvt5UFHz7GAWHHwzBlj221j/XYDuT/W9UF5+Zaa9NM8MmTMM9mTxKnWus2p916qWE08o7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 19:41:51.4540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f68088d-3ae9-438a-e021-08debcf12a4e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_124200_720638_AE94D0A5 
X-CRM114-Status: GOOD (  12.76  )
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

On Wed, May 27, 2026 at 10:14:03PM +0000, Pranjal Shrivastava wrote:
> Introduce a new bit flag, CMDQ_PROD_STOP_FLAG (bit 30), in the command
> queue's producer index to safely gate command submissions during device
> suspension.
> 
> The flag embeds the suspend state directly into the existing global state
> The flag checked in the compxchg loop in arm_smmu_cmdq_issue_cmdlist(),

s/compxchg/cmpxchg

> which acts as a Point of Commitment, ensuring that no indices are
> reserved or committed once the SMMU begins suspending.
> 
> This prevents a situation of "abandoned batches" where indices are
> incremented but commands are never written, which would otherwise
> lead to timeout during the drain poll.
> 
> Update queue_inc_prod_n() to preserve this flag during index
> calculations, ensuring that any in-flight commands that successfully
> passed the point of commitment can proceed to completion while the
> flag remains set.
> 
> Suggested-by: Daniel Mentz <danielmentz@google.com>
> Signed-off-by: Pranjal Shrivastava <praan@google.com>
 
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

