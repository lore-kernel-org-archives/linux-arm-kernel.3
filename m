Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F1FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 02:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bV6RN3Ye6yFYP2UzoX/9zTs6n9TGR6Xbkye9W5JNZ3s=; b=zrYOQ85ooX510wRosRFSbrrBEm
	YHYvSqcbmGE+LXJu5fmSkiEwJAd9Q3D49RKE6j8noCiZjuve+g0MCZ6nPwgkC28E1DZuhsf7/Pwkg
	ij0EpX6rF4rZtUeFx43tjKT4Ef1PwxzC4rFUqtYsnKiTh54KVsunSpNUUZmg/0XuF3MWwCxnUIcfb
	AETAmU2cfdSdm3avEXZ9VTnsVBZdCu23ScSicNgsc0icdfzRZjGXR64wis1zMuZliZzPi2M3S4oaD
	xXh+vcs6zu87XXpJWC0l7WOENU+/8Sxs1mn7MKLpcf47VLdQbLeo5/fW0QaEbprsSlHGuX8sdsAOw
	ehkPFWGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whHkh-0000000G8hQ-0uzB;
	Wed, 08 Jul 2026 02:11:07 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whHke-0000000G8h2-1Vsg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 02:11:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXYZ21usfZBTyPXDMtX5fvOJt79njtfnFRB6aPqwMXgAUPrUEc5VVwzk6lDDIrGdIV827ZyrN+PRYZaQ4zfWEO4fvsNVa0zOsxzxSsfn7XcY3wG1Nev45JCFr40MSUpBWC6EBOgKnJVFtLkqXFQ5UREUBCAVWnCjYuYqEnuxp35hqmgexMH/oVsLK7wvcEVeZUO5HE91Z++M4kd/cG6eogfwSi/h3V0wczx0TfwIdH1uYbuQCLoNC2K/vCGhITWqBQdelcRF7bJXT8XH2qfyHMkaqpuV7v7s/SSAS8aiskYMRxWf+878i6hIevJ4e24IjnHsoz1ai5uxJzFaLnRiCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bV6RN3Ye6yFYP2UzoX/9zTs6n9TGR6Xbkye9W5JNZ3s=;
 b=X5QoY0/OBXcr8byfoKlK1Wr/fOHjLneY42s/fv7QXAWT7sbhXXWinmp1tsFz7lScgDnh+X+2rlO2g1e+LymNxdIim9/fm1CFnH/RfnlYQ6zRtfQVyifOAmPFZPkZNLlvjLdzq2J6lxryqc23i2nFI157qBX/7CrjtZVb/wRsgtX+iKom9+drLBcRxJAq+Jjfof0cIf9be92OUROzn9s+ZiyR7HHTnwmaUS948bixLE/DS3Wd0LCo+c3GUz481hsSryG4ZEP+H4rBVwLq/Vm6BXKRerMuroQiOM4uFUPejifQxFFtAVH0taeQZsw+m59WSNTyjO5hMUpqrpxp64d6Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bV6RN3Ye6yFYP2UzoX/9zTs6n9TGR6Xbkye9W5JNZ3s=;
 b=Btthan0FnDR6IYfISI9iTJLbRW6moIpP4r9KqtjGaut4bZkBRZo4oVRDWDb2EGtbCHpXgoC4R/vlnlmbQhr5V58nuuNpsQDZH4WwP8bN6hrl+9gdcOpmxF+GjcesGC//cy8U8UEqGKcpq6PMBfjSVQgt5zXp85HbwQBNLEt1+1czLkqpGkrWi6VR3kaQfRC8Q4OrYA2DaW43q33/bB9H6s3SqTn/xXE02I9fu56vrc0rtLmqRuxcXHi+xUhvYPPY2OX+ivnGAgEFI59RAaqNsh+0njY0/Gk55xvWs4RcUIXq6VDa333jkSLmEa3HHtl4oMwPLYZGyvEQ7atUVezwxQ==
Received: from CH2PR15CA0012.namprd15.prod.outlook.com (2603:10b6:610:51::22)
 by SA3PR12MB9197.namprd12.prod.outlook.com (2603:10b6:806:39e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 02:10:56 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::2f) by CH2PR15CA0012.outlook.office365.com
 (2603:10b6:610:51::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend
 Transport; Wed, 8 Jul 2026 02:10:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 02:10:56 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Jul
 2026 19:10:40 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Jul
 2026 19:10:40 -0700
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Jul 2026 19:10:39 -0700
Date: Tue, 7 Jul 2026 19:10:37 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <iommu@lists.linux.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, <patches@lists.linux.dev>, "Pranjal
 Shrivastava" <praan@google.com>, Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 8/8] iommu/arm-smmu-v3: Support the DS expansion of
 RIL's SCALE
Message-ID: <ak2xnfGDSnITiEjk@Asurada-Nvidia>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <8-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <ak2J2gLgXD7WJbfv@Asurada-Nvidia>
 <20260708000239.GN220801@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260708000239.GN220801@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|SA3PR12MB9197:EE_
X-MS-Office365-Filtering-Correlation-Id: affbc64a-6f48-4b68-09e3-08dedc962559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|7416014|22082099003|18002099003|56012099006|6133799003|11063799006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info: ASIjjqs4FRG85zprn6teE8WekUUH/C5oZggAA4p6Zrg23c2ubMV/LN536UbgyZEG8EFSCm0Oc4f69monFGhRQFy15MqxAGbRyLAtpvwHWDWMCpfJB/oGlkeRp3nUhLs6ObAP+8+Ho07/y0/is2XICRAl8tH2hahy+nl3kYwa0ZjICq5iX8WtTW/Tvq5YQPyOIhzjVXV9dTpbhFgukOGZHs2KxyQHBeivpMMxhtvAoddFKpwRScfF2W7lO9o87rNXv5Dm9cqZb23t4akjWoBIO8i68Pm7GBKxyIFToZgqvWdGEC+JE5g9/JGwdfaf5WZKlbMlV7k7IQBTx0pYPN4+kNcilzCxfmLrChKywicQ1k5EnCLdaut8CtT6fKwP1mCS+HliWqiHr8J/etmbswa72EVWB68B1atUGqwL5ypculdVFmw84KZseoMIV2zCfGxjGY8aWuBvCUxb2mhgDdvr6ldMPQOvkVoDVBLYM0wyquhB67pwHsDScLPqQs8MAs2vK8D/YKNINXUyrldnsewUd3BTX0IIqo1q2j5ULgOlMbWjWMf1zkOqVw994x2b/ce1DOuJdTJ0LZ/BtKi4Y1qSw7iwu2yupazkNqCWK/Gyz1QUVPgEP/+VX/xty5V5Mk6KyxQIw8vMy8krylx5XfsjIbckIHsaYmqR6rCHpzzRpI8FLA+n4DV76SyCy3Ew6ZUYvfWRWYuXmzWG9legG4WUJw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(7416014)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 41hz39cUpXaqv2fvvNR8r+4nJQJ9TyLM+TE/ky0t1sui3aLTQnaP/AcPkRfHw+25kV0w2ICyYEH81XO/NCr++PYf6LyEsiF3GGNGTskwLUwzQEhwq1jCupQJoQDtKtTQqhcVN3gKjTC4A085OYJ18g/d3g3lIa1UUMsEqdq5cXHocsoHaOLWVXgvHwqGy0ezpDd8uMuFKr47URnONo7ALQTYCDeUaN01SrNFKRoyA9SWbg2fiea/A/6cincHdG16Ocv74DuLv42HE+DW1mj19hLgzVzGxxGm7vH9q4O2gwWX8+UoFHgYahfO41cmra7znqVzTVwtU3fZ8+xdauWg5dpVfBKwfvNPXagidej5/CyRlPIqFILusY0krwfzezD5wzbgPUjfjPEaOXU+kCCUPpqechG2KvKsCwYZ31sG2/bt8EQxbbUDbmTpq7PcRZt4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 02:10:56.1480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: affbc64a-6f48-4b68-09e3-08dedc962559
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_191104_408276_ABFDC487 
X-CRM114-Status: GOOD (  22.07  )
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

On Tue, Jul 07, 2026 at 09:02:39PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 07, 2026 at 04:20:58PM -0700, Nicolin Chen wrote:
> > On Mon, Jul 06, 2026 at 01:26:45PM -0300, Jason Gunthorpe wrote:
> > > If DS is supported then SCALE can go up to 39. Detect the IDR and compute
> > > a scale max that is compatible for the entire invs list.
> > > 
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > 
> > Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> > 
> > > @@ -5235,6 +5242,9 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
> > >  	/* Maximum number of outstanding stalls */
> > >  	smmu->evtq.max_stalls = FIELD_GET(IDR5_STALL_MAX, reg);
> > >  
> > > +	if (reg & IDR5_DS)
> > > +		smmu->features |= ARM_SMMU_FEAT_DS;
> > > +
> > 
> > Just a note here:
> > 
> > This somehow conflicts with my iommufd_invalidation_loop series
> > where we sanitize user space commands, because the driver would
> > support IDR5.DS. So, one of the series would need a rebase.
> 
> Oh that's an interesting one. So if you add strict validation it will
> technically break DS, no VMM can set DS to the vIOMMU as then it would
> face invalid SCALE which the kernel will now block.
> 
> Maybe these hunks need to be included in your series, I do expect it
> to go first, and we should try to validate fully.

OK. I can take the minimal DS part into my series.

One more question to confirm: there are other fields like DS, which
are defined in the spec but not supported by the driver. Should we
expose them via hw_info while rejecting them via user cmds?

Thanks
Nicolin

