Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55021C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 20:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tORqD/nPTQKmyQt2jbOXBT2Ckw1hm2GLpKRQZFr75ac=; b=IzWCbRXFYk6VUf/CgwawNsdWGf
	RgEp2g/TZ1pPIRaGKxo5oIHSJ3TfHr4MPFtHEw7dZ7ow/Kd7RnblKIlRapOhAqTLdaE4ci3ul/k1N
	aOE7I0Ouej8wUAhs10t9mabDhQVnz+XgLgX4EEmxC2n7PniS/hAZ7KgoHwgMsoyHM86jVUaNSHePU
	J/46Tx1yEBbqsTSJoDjiudd2aLiiVAb1eUbAkCkQXPv6eyAI8XzO3Fy1jR2UUXGAAerx/kv3tsTEt
	1dZAkGlR/eQ+KyfDBp0tAt/d5yW1dHLosohaRUJ8ElaHjwhPMlrW6+zfy7ZQHEWKtikV/OMa7ENWU
	Lp+gOZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxsDu-0000000EmLY-3AzT;
	Sat, 22 Aug 2026 20:21:50 +0000
Received: from mail-westus3azon11012067.outbound.protection.outlook.com ([40.107.209.67] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxsDs-0000000EmKz-2DMR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 20:21:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiHr1WcJFgv+y7IyqLufi9kxWG6T1p3zJ7PCQPFankoPEd3gSo0AA/G4d//oGRN9oCnOAj3618l4WbfgoeJNi7PAZ0+PVUGbZ1XlMamRE73U+65oIB7BcXHlL4tio5f2dWw0R9YEcqd9BsjOUf90tvxSpP0iRo2Ooo+khleK5P87MgpfLrd3bN18adsPjSDtacmUswJXvKE5nZ6feFAlB5NfKZasf2J0mE/g+3zIy4cpcsA1n3d+YcYpFO5cFR/llux3xR0F6BacybSxbmxa+LJqCira411dMsWUNQGVzHew/3qN1Jzl4e+/v9NNX57ZK7O8ZbetPS0r+Aw9M4jbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tORqD/nPTQKmyQt2jbOXBT2Ckw1hm2GLpKRQZFr75ac=;
 b=RZCSgPrrxzZbD6HxS/Ikk7ju6N6RSnUoQLtMEYSbPf42yeT0/aDz3OxDB96MenO/KCvRNVqK39t8aS8nH/EHjd8uMs2B9iVKtw7mlfaaRkplQWjXglOhhM+j+mKXy1XC7JFhdK9YVOwDdk1+d62V1cqO5O2AqdG9ZDBBIw/zdrk7EpfiPP6remA+Ug6yQadG7WuP5ErNbui9V2EhMTtrwrrMS7i0d+ja8j+ZNGd7nVLws1qRIdMA1js07oDP7U30hQwwlTUNKGBMnDZ9whli6L4cz2gDQcANZsh3Fj0DsrdY6U6mAyNXIdWkOJ1z9QU1Mp3OtYwXm9+p65JGqy6G1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tORqD/nPTQKmyQt2jbOXBT2Ckw1hm2GLpKRQZFr75ac=;
 b=rMxA8EdHuYb7NwpBazknL9KD7sv2/Jypl5G8wFdxQv5UdLAPqQbkrIr35HGKreSKWYTA9IhXQeAAVQXqzmWf1VyJ6oRm+KVTyD7L39HemBnfFfGbQA23o2PyYoqrSze9btdsmSgEaDh1Dzt/kNOTdN20XSuTZXkJPE+jWZWqyOfRQeXFyXegG10CtOsYhOhe+UihOk3kbvOBRAMBiFLmAvR11UlY7wX5MRq5eKqXxFvTCf1XSj4cluqZzURG0d7AH0ICGw4CFW8BBfKHxaSJseiGTKeMkJAy96MEaY5MKyzTWSaDodijd7cJJZBdFRx9eJUermheAiliwqb9/VR1og==
Received: from CH2PR08CA0009.namprd08.prod.outlook.com (2603:10b6:610:5a::19)
 by PH7PR12MB7329.namprd12.prod.outlook.com (2603:10b6:510:20c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 20:21:41 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::4c) by CH2PR08CA0009.outlook.office365.com
 (2603:10b6:610:5a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Sat,
 22 Aug 2026 20:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Sat, 22 Aug 2026 20:21:40 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 22 Aug
 2026 13:21:28 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 22 Aug
 2026 13:21:28 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Sat, 22 Aug 2026 13:21:25 -0700
Date: Sat, 22 Aug 2026 13:21:25 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<praan@google.com>, <kevin.tian@intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>
Subject: Re: [PATCH v9 07/12] iommu/arm-smmu-v3-kexec: Add ASID/VMID
 reservation helpers
Message-ID: <aooExTciU6EJTM8J@nvidia.com>
References: <cover.1784663183.git.nicolinc@nvidia.com>
 <9f9d227c0adf472e93293008e7083973688d015e.1784663184.git.nicolinc@nvidia.com>
 <178735412602.18212.13622444378152698190.b4-review@b4>
 <aonvzux7UJVxBSfm@nvidia.com>
 <20260822195954.GN244917@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260822195954.GN244917@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|PH7PR12MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5232b3-0f8c-45ef-dbc9-08df008af9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vbRtAgwuLBcS0MisPwZIqmYIv7fOjJuKKvRfEKn1OhY10Thqb7L9ONJLPiUzvlXzL1x54mxOvHkdrrO40kTiFayIa7Wq+7J7gVgh+eeX5BWdDwJxGr2QjqWl2mdVTlumoNRG+7H1GmHKpYZPtMEtNiYn1oa4cIQk6afs06s9+USQo8NcakPHPfbx4bLNJpA3eHKQPWRJzaRfAJfxiM7+9o/ac5+mEk7FZgGECpNUVEbHYrdy7P3hK5tFKGa/hnfTFji+hmAAG9fFRQOubCDepGlCZcIrBItSlS57y2S2ssGldVVGjDon/AG27Cyhv+wtMIS6xDVyhNoSte4uwFKgxQVTK+yBU5xBfpj+tmyIe5iqjLhIHD1DzyJABLi+SS5yKSWIvaLlbkKdsTRSp2n/KXcJ2jeWQIFv80Wr79fByn/s20QneEBtQUqN+HALrepcbjPEWLD0u84J7VHvcPuas/turSswcR4oFbJ5/MD4i/Q02n6OHZKGR1z/aMY5q2qZBwDrRMjNOAhF8HnkjJ8E1KMAjZKhPIlyn7jW2D/3Iq7lGL1hxIDIkkPkIn9DFRXG/FbYOz36hwmR4+t6YtGmslvht/0HTkuHgMVmxjh/mC6E1/SzyFVV30ZB+4hE29aeUj8XtjB8cf9PoKxWQLiMY7cXeuOoVrbivPWgBoa9CkNObOvXGrIxCiskoruSbVwVPZJ6d0Nuh5b+NKsKAE19Hg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fGH/DjybdHjiLEcG0NBWO9+cjIZiV3U6NySgYjDcVyteNZIDCDeRj6NX0fMDdJNpAURh11+eJd/INfkOCGGzKy4hPZW9DeDQAksaORKldgS0CVLUbnqL/PSRwpuFmfk5W+FPM/LmB4yE3ED/X7u8+/HYCXU7xEa4Vbr1MIhendlbV82bLvLbgO7SOnJGXTg+2YkNsr3LqxiIlZasLO37s8YktwHkM+QEEkcW1tKB4TPtwJgKJy40aMeulq4Tp/n9GWSBpKrc7WEIGjpSA//uNagka0xrpdaddjnP0D0utrd3V41K0fkpVylHCx7ZtOv/sE6C4R8j8cwKGWKEbwE/EDHfzBnR5keTVV4A7cEh9bx/fBhl4WMl86pUHp6mNvZelr5xE2Pd1TEuFtngxEKo2VdQ2cIepvDhv3k1FI+/mILEo68XOZYxYyST2pyCRYBo
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 20:21:40.5793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5232b3-0f8c-45ef-dbc9-08df008af9de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7329
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_132148_572097_FB6FC154 
X-CRM114-Status: GOOD (  14.35  )
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

On Sat, Aug 22, 2026 at 04:59:54PM -0300, Jason Gunthorpe wrote:
> On Sat, Aug 22, 2026 at 11:51:58AM -0700, Nicolin Chen wrote:
> > On Fri, Aug 21, 2026 at 08:15:26PM -0300, Jason Gunthorpe wrote:
> > > > +/**
> > > > + * arm_smmu_kexec_unresv_ids() - Roll back a failing reservation scan
> > > > + * @smmu: SMMU device of this kernel that failed its reservation scan
> > > 
> > > And wouldn't need this either.
> > > 
> > > Actually I think this is overkill regardless, just leave the xarray with ASIDs
> > > reserved. Who cares?
> > 
> > ASID might be 8-bit that would have limited ASID slots. And it's
> > a quite small step, so I think it might be worth keeping it.
> 
> Once you have it per smmu just clear the entire xarray on some
> failure

Yes, there are only two destroy() in the function now.

Nicolin

