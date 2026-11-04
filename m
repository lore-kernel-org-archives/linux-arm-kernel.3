Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF85606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oUvkdUJX;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PIvlG9eA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dO5PvkddWLpNvKFbk+m8+55MaM+688ftRTh1BZ+IQiY=; b=oUvkdUJXwMW25I29T6/VJn5yVK
	sS9b+EP8CsreIBf9YpbkuEHk+WgXbDlheAHR1mUpxml21tmKWYfzzanYwtfxa2lCW/2tWKta3WN9Q
	bvS/Lfo10MNVbXExv2z4eT8plFKwl2qZrOXdMcVtwWTSKyhZcMU4xTAj5a49JtGhxg8PuIkfNUNCA
	JSzR+OL1n6pCZ2kDsBFNDtw61/EGwsXp6f8Ja5zHD+/d25z1SLByDK9CWG93pWFkSRBm8fcU9esr2
	IVJMfxiWswhEvvzYDJkr1JrO5eUXXmtUlcCC5dDzJpEvjP50dfP1c1telF1uz7XkkGu5khCni2c7S
	3SA1aviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeN9-0000000681D-45Hv;
	Wed, 04 Nov 2026 17:02:03 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeN6-000000067zf-0b9n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:02:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gz8ML518XXiIFRI4u9tdB2WTveUbyxNp45XcXyBN+pEhRVEJ+wvJ2SbJ8f+Ksujpa77rMi7GIvBGYFHQMO0TIfF5wctM1UZwa7kNdiBLsQgeWc2Dnb3m4sT6ojnQdpHwyFcp2pBdsnj8TFnZGO/AYVdkGUC/FaHvEZapHbW0A+j6IIBgMy4GXytM8nBDYYawhmmWVcUZdradrsnC00cYnjo0zWd88ik2k4QyuTF8wLs8vciqe/pCzRoG98txjaygKpikoIPLmFeDo21Pq6fmGzByNX2VgTan3Y7/mBxR6MbOR1hfaP69g/2kspID2XVHt0HaOUeItZBAjGMWXW/61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO5PvkddWLpNvKFbk+m8+55MaM+688ftRTh1BZ+IQiY=;
 b=HJxa+N8n4KGB94Ir9RjtGXPccgtOA3r1IWK5I76BvjyNjHAHt5QyjbshDIz5cWJPCRMeTy2ptemWa7kl51BWGqcxlyv3BO+OlISO+kQ2vp0hbpKK8+KwhA+ulXX8NDcD4L9hgCyuRvaZHfSLLGFHZpm/qDtO7ImM3eSY+UKuc/Q2Xgla3gnTndiCh++im8/qZyrh87zNiKMGOMRv3tWb33iSI9p2ddLmvlSh4jyC7f2YeQjRqHPF2P5lUi24wEKdaafok8MMZ3sFIgjnyiSlltTDJ6jyxhJYbkYQPhdZ7TWvtHnUMyl+HVwxIdKmCxAz1dsWoWb1WwJgobw5XE0qcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO5PvkddWLpNvKFbk+m8+55MaM+688ftRTh1BZ+IQiY=;
 b=PIvlG9eA6ZOtu55Lg5bUd96WrDZXXeZUhgt5QC9oK7VOnSwSC6Xi31D0fKEOw/NB9HhEXshooSRBSDNtyEsxNzlL7AavjnKFFmSUkFiwxtOLQvh7uk7+njbXDYUgVnDhg2UAA1QMNOPO518Lxup2/xNDfH2xj58av+w82tzyOEVpMBzct0oOb6o5EmcXyHy0ZSqbrCdgYHCnAZiaXGzhHTDEVbZujCWeqcQrMLlFquPbMjQshOeVuvLVi4GCFPATB23xjAvsf1YCPZ9SCr0UbnREFoydFDxg5+Y2eD0fZ/mr8cfsea7rISjXe9h3nkUV5vB1i0VD1QsOY4+d2Phh8w==
Received: from DS1PR03CA0016.namprd03.prod.outlook.com (2603:10b6:8:233::6) by
 DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.9; Wed, 4 Nov 2026 17:01:53 +0000
Received: from DM3PEPF000265B9.namprd04.prod.outlook.com
 (2603:10b6:8:233:cafe::58) by DS1PR03CA0016.outlook.office365.com
 (2603:10b6:8:233::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 17:01:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM3PEPF000265B9.mail.protection.outlook.com (10.167.23.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 17:01:52 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 09:01:29 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 09:01:29 -0800
Received: from dgx-1v-42.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Wed, 4 Nov 2026 09:01:29 -0800
From: Jamie Nguyen <jamien@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
CC: Jamie Nguyen <jamien@nvidia.com>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dat Mach
	<dmach@nvidia.com>
Subject: Re: [PATCH 2/2] ACPI: FFH: Support FF-A direct request 2 calls
Date: Wed, 4 Nov 2026 09:01:29 -0800
Message-ID: <20261104170129.27701-1-jamien@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104-poetic-durable-jaguar-cdf3ee@sudeepholla>
References: <20261103173907.1996118-1-sudeep.holla@kernel.org> <20261103173907.1996118-3-sudeep.holla@kernel.org> <20261103211136.4122648-1-jamien@nvidia.com> <20261104-poetic-durable-jaguar-cdf3ee@sudeepholla>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B9:EE_|DS4PR12MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fe712b-fe92-4ec2-d401-08df3a955311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|4143699003|11063799006|56012099006|261021121427099003|261102123227099003|261026121527099003|10067099003|18002099003|22082099003|10063799003|6133799003;
X-Microsoft-Antispam-Message-Info: iIcnMQQckzjE/bJE+cHFmRCUm3fldSdUfq6fPG6SNgwWowOKxqK3fLuhA5T1+P+Ia+2/YwQbdabYTdVfP1Vgggb7sC8CPvp9cxyTvrKsIuKALKQdDwjmnN4rHji45ZKDNulRX1uVBp0FErBhHEIee7s4Z9wLF9gI1/aEOdA6OlZ4HamOvxVizRKrPdh/o5V8y9wmZrWiyL1hp5gAqbQu4QCtdsCqKAUumAtvZ530yJuw+G5UzJsj2LeljW4MQ5hYGO4pOUNbH7F3esMF8OU/OrXXxbSpPnQYnuYaQTLI4CkDRtP3/i/TQU7mKqZxT4B3aqP4hqbIMjHY9DS+7typ0VtTPLvAtwAQtHb6OLOg/xRDR/78slKYU1HGu8Zb/nO4ExaaloFa32w17h3f5K2CHsZhrqpxJiexEn7qPN62JdMQjrKK6jmOftrsO7SwMMvZLZ5SfrOz03qf3eOoWb/yp9SE1mGwIwOgG8l7QVClGSTpKhK6qiOeg/1O9z7N26O+CYivvalz8/f04opP8Vxp61K0bA5VhI5Xz2ScRGgXOU2lCIk4R3AAs1kd6xng7QxI5OeEpih54PLXlGRcpuRErL5t/hPYKqF89jvOxlSG2n6OrNJxYFdiu13LU3GhfRNh6VaNRCWrKNHkS8oalMGCyrDSFOTcJgFhs4/xyq4zf/BTfzeYn+nlD79Z1ceJZWP3GpfhXrSGcMqr/uJCIZvNuA==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(4143699003)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(10063799003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qSDuLOTL7b029s8Lk5p6ANocMhJHH9du2yEVaJyGxG/s+w/ae/wgncOswevKI941oweQj8DHwjygJ8oXL+BQ9zspzq2cBhq8EelDoHH0DwEPXFh0XQwX2+XYmOdJvlElMuL4S5eZmn+CGowB2o2Gvvzl3E9h4yVEWfvcqW2j40ZlABR6NQW+C5LfhUDpHszR8nPPAdKymP86WBpBVpCbHD6X90VXOVJLYZXb8Z+Ac4zHiniZnCvCVAsC9jj0PsMM2RUtkUQilr1GPKORUyPQN7LT/5XIn8kQVfScYsUV+tDsgbOtaUhvcDCjB0BcEMt+VE1AF52SpKvI5cCqtohwy1H0KFw/d7atSwZTJMrD0BUEFD6iLMFZW9MPBNBeFQnI2JmsQ3C9LNF15oRBlEggqUC3wuuxyXl7cu7GPI9wez34edJs8qAiZlFtiE4xLylB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 17:01:52.6664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fe712b-fe92-4ec2-d401-08df3a955311
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3PEPF000265B9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9660
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_090200_179523_B90F2BFB 
X-CRM114-Status: GOOD (  11.22  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 09:40:08AM +0000, Sudeep Holla wrote:
> Handling this coordination is difficult, which prompted my earlier query about
> requiring v1.3 as a baseline. On ACPI platforms, this initialization conflict
> is already an inherent issue, as the UEFI or early bootloader might negotiate
> a version before the kernel FF-A driver probes. I welcome any feedback or
> proposals on how we might cleanly resolve or track this pre-negotiated state.

From the kernel side: the transport driver and ffh.c are the same FF-A
caller from firmware's point of view. Could a small built-in helper call
FFA_VERSION once, under a mutex, and keep the effective negotiated
version? Both would use it, with the transport's existing compatibility
handling, so it wouldn't matter which runs first.

I haven't been able to think of a clean solution for the bootloader
case, though. It looks like the same hole the transport already has
today, since the helper would negotiate the way ffa_version_check() does
now.

