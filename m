Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983C0606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 00:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c7KjfOTx;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=X4LZjCPj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DsEU2njoQasW9dUeihnGKG2BQIMo1tqQQtIULZmQOcg=; b=c7KjfOTxez/TMSE4Q/BErYNOch
	1wXR1xj5Vfx/tJjI4crWZQ3tLEnJgAthWe9ZK1net96znK1wQp7Yqh6+VF4KPz71SB7mknVXGcWjg
	IfbrTWiN++LMRIaBS1rpMyZz4cNwVlzCbe/8cmjKUhBp+397EMjYK8tqI85aAvcaAMlRRUEw1/mKQ
	yoPiHpVTN54bH0zpcGRtEi7Ysz3cFKSJo+pqt/m1fpxj46mLdIxfkU8i4feQ138ugPO4TXoqb2mgm
	K0eucw5BYuqNr/6SGzgOwizxCgebjDn0kNBhRAz8oxf0Yey+x7C9irtHXvpjcIL6kriIzqgX+Wurh
	XpbKvuQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP7b9-0000000AuDV-322c;
	Fri, 06 Nov 2026 00:14:27 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP7b7-0000000AuDB-33bt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 00:14:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yP7zAlyKJj+Ga3AHG7zJPk1GIJnYTwNoe1OMTw7Ss1dVAfUrphytM0SS9XWd+SgV/nxooQoKjKWC+PgC1TTJJHogKMiTZOwi9ZvGDlmScYHGHAYr7pwL98mtRPjZ8CeubZDGy8mnMP6QSAXrlpSQhtfbh3/DPvKYVJm6mFhQ+DGdgacZ69yVk+zwSViBTIrMbiB1MEZOiKGpkL4UFK+QgKe03wkFITstS556KlJOMZjLdTUITZm9taczMbqON9048Jk3EAuP7ZkvfTAxQJkvLJsJ+UqvWpcP8TwUqvoYPuM23FrSTMQ3V31FD6sfEtNCUTCC/o6pgW/JMkIeWmzYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsEU2njoQasW9dUeihnGKG2BQIMo1tqQQtIULZmQOcg=;
 b=dLGpXrZxiZyFOtYPpSSsNUegrMYR18D7bfvYzyMfugwHMxggm5pFU4R9aogbKBVNs4fkuB5o78oTOkmsOHKMLHLddvxFc9I5UpJzNSxL0vC+6F4GrVZZMQf334G7OI+h2LfC/4s/LnXgU1StTg/AXXaa7kLB9L9hTH7eahFmreKMazqXTdFgxIdWC6dQ9N3UIh2swDBT3D+s0rgKMBRNrnlr0lu+BekSE0hRYhUbfh5T90eOtLL2/JT3WdAnz77ch6/dtHNaS8tsy5G7BTPtAGpGfwVMq0GeZQmtXO/PjtNMheLk6Zum82y4U63L1FB+DckQfrzizDrA3mxK4kAhqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsEU2njoQasW9dUeihnGKG2BQIMo1tqQQtIULZmQOcg=;
 b=X4LZjCPjMmAK+xcvj+7qT029aiNvbOkHTpH/K4Kn20FCFEM/ACbNEvuYhoTdcp0krsvZKpr14ksxxD0cE7YnBpTPDvPj1ghfqknL5MGu34A9pjwN62ZwZ57QEexZgj4JbOwt3arlncrca6P+iVX1HlS0vLa4d9XNR1AHqsfHwdzPiyILlkWUMeT7djNRRpUWxO0mv5q/FT0jTBOyD1WaTLsKAc8TmFJQMdnu/ZeJgwAfDx0jk5lUkmUjyoMB/frhnvQx46TSTPYNUDFKiYKBfODnGLqDsrrB3YnhPhnsqvVjjnOJ2OG+hHf/TyO7EG+OmTJh78oFYyNpMdeMA4CibQ==
Received: from MW4PR03CA0087.namprd03.prod.outlook.com (2603:10b6:303:b6::32)
 by LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 00:14:15 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::7c) by MW4PR03CA0087.outlook.office365.com
 (2603:10b6:303:b6::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 00:14:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 00:14:15 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 16:13:58 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 16:13:57 -0800
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 5 Nov 2026 16:13:54 -0800
Date: Thu, 5 Nov 2026 16:13:50 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kvmarm@lists.linux.dev>, <iommu@lists.linux.dev>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <maz@kernel.org>, <oliver.upton@linux.dev>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<joro@8bytes.org>, <jgg@ziepe.ca>, <mark.rutland@arm.com>,
	<qperret@google.com>, <tabba@google.com>, <vdonnefort@google.com>
Subject: Re: [PATCH v9 15/25] iommu/arm-smmu-v3-kvm: Add CMDQ functions
Message-ID: <au0bvjRBF7X+zpc+@nvidia.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-16-smostafa@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261015200903.2735565-16-smostafa@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: e788d155-7dad-41bd-07b1-08df3b9ae45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|82310400026|36860700016|261026140227099003|11063799006|4143699003|56012099006|261022105027099003|261026121527099003|261021121427099003|261021135927099003|261102123227099003|261028144727099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: LAPH5rEkAwyVxUpTjw2FHmnplKXgPN1sCviXnbxs6xo7f97krFE23WiAjqFtlPwh/hqtPnlVtNEZncWTA1n0Pl8Fo35DWzB0hMYtaVCz5rrgxntksJ/uEA7cv4/6358nXzydJ+e3QKYEJKGnucnGasP50VsnYOWeyL3qMfpxRMOIrShJWN72CzvdJGyKoKEiX+bTAkja5gue7bwKIlBqMd44Qqt/yFWJV4ig+YLNJjQvjVIIZpQ+vaHNgn5LwjQKiDt+ebkkAgQ2ChRFgkaYdIoZrM6Tg6j+gTCZAvuLLLAbt0+a34u/7BpzeM+SJdknjAaT3i6FOmgN4JOJYyl4IsnkYA7cZsosmj64i3EAOSU/HQT0OnFkHR/+V1A99z1aVmw7t8XcLF2FpwWJe8KK01QBneJgTcu3bd6BoU2tIFS3cHhImQiUg2Z694kD4PB/32hCCxlwaKBtsmu6wwN+pffYkXALlWp+afyQN8m98wJSM1LJxkhslyf3Zgj0Gvb77P1abGTQeW3XPcwtaiqVDjRxTIS/0boKu0ZHnnRWD7B5+E2wsR+pkpWcNqgFkwxR1asenOZnoifCxjYfMFn2liepCwx6EAGhSFv9ErNPsaUhUwXJb0caXs9MvQwexXHl6BEgOA5f5JNiitQldBFZumqD0quFIv994G1VoUfYcEWMGR4J0zeVYupOPemE7mZpbgTd6yv0aHDGtzfvRBw60w==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(82310400026)(36860700016)(261026140227099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261026121527099003)(261021121427099003)(261021135927099003)(261102123227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ISdUsgVn+G+XHd0kq3Vb/V0UCUU79VxRjTuOhyfLrEUqcoGM9KqzMb/P8Pe/JWG9F+G+H6xAUNZz0qKP6iBYpPemec/gZrcQ4CHZdCvv3EyTyiTsBd42hVbxauFsVANOY7cnVBmUEHDYYp3hC57LOQWaPclQJOk9BOe7PyUPegxDhutyh1vXuBsLEZRIjG5eg2cPOz0RnSllXOhFP6gNQJN1tMEtIKRZUHWz5X4R/O5Nvhw+8K6IUaib79Axj4zwSk8SIWe3H2vUFLLMxa2i5f/2oJ+HX1xQT139SejtYMpxj9s+7KH6jxVodysIsrHT4OQOreZsWEiNsHQopeiwGl1lzaPjcF+pliCfV6vzQ4cKnl6dzpIRdHhCvXfnRc8wjZZ/bZRDbdO2Ysr3P2j7U5ofmW3ISmHTyGMAFmG1851aY2waVUYwERz9i2bHWDP1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 00:14:15.1733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e788d155-7dad-41bd-07b1-08df3b9ae45a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_161425_787472_695D67D5 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 15, 2026 at 08:08:46PM +0000, Mostafa Saleh wrote:
> Add the command queue accessors. The hypervisor's own commands, such as
> TLB invalidations, go through smmu_send_cmd(), which queues the command
> followed by a CMD_SYNC and waits for completion. Filtered host commands
> are copied into the shadow queue with smmu_add_cmd_raw().
> 
> Polling is bounded by a 1 ms timeout measured with the architected
> counter, and sleeps in WFE when the SMMU supports SEV.
> 
> Split queue_space() out of queue_has_space(), as the emulation will
> check the space in the host's queue.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

