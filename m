Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67EFC5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 05:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjsJaHR1py00onar7p+ORVRER5NY5pItpBN72A/VwaE=; b=T+kHjSuXP2geffbhK5RaPH5JAF
	VtLgVdAfbpKG7Jx0ekbnN/42XXcNPPMx+XiZv+nFMgRPu39FZWtA1UNUUz7hBf2Ws8Hly8T3rjazU
	ZhajMouaC8o5/v+M2xfTASB7jauyeYKvTAYImabdZWAGSkNrH+A/I3nuKjWp8qbtKFOrSZk9wj0Wg
	CTd7BuFfuOJknXF3tMnc5t7eGi2MsnEMQwrJMiXxnU2PiNLFK3qjYN5LKIZYWUIlwx7weD1FR6roI
	zSlFlKN29fM5X+rw71k6AkPhQJIdEz3nhDdNzQ9di6Sl7zxQ61Rap0FbxfTvGUNpAvhpw3TnqvlBs
	4t5qnpYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUHvw-0000000CL12-1dKz;
	Tue, 02 Jun 2026 05:45:00 +0000
Received: from mail-westus3azon11012016.outbound.protection.outlook.com ([40.107.209.16] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUHvt-0000000CKzY-356R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 05:44:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkorlzYCKU3VHnH5zqQRnuyVOZPuVxSDhJmtybpeTW79NzWQAWUTz9QwtsDaJFpUmdOeVAPf9nIafLb3M7ghkdWjQyMk8Xm3qDT9JIfcevA8UhijPk8WhEBgECXsKsth50d+CbemrDDVAgnlRi7c0ZbJRF1SwMX1WigyMJNeD0AGfG09VioVsfkQ14KwWFx2CD+3MQuIIqCY7IcdTuXwBxpIkOyDkd+kRu2UoRTfE7fwJa+gaHTRxy8CQOD+RjZMlI+Y8JRW3fqdrxm8jOM/FD+XIjmiMCpJj+2PX+9Df1qOgKcDEnxhZ/VPZAs8HF96bfwM+hbspF+e2PN9rO1I7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjsJaHR1py00onar7p+ORVRER5NY5pItpBN72A/VwaE=;
 b=O8V7QdDpJ5D+WaorIQfH4d0v2yUt6UbtLGtGfygFXZbzH4GMcL3ZN+l/B4YJNPnYwezhkHf/QxslFJrla0TDd80o6pp7O96ixU6pBagR8MftNULf3nIQIIM6RCudwFrl/L3eExRHRwCbsJ1CNla6D6EYEbPWd4K8kxREsSeSpP0MXR1gamHoVXvT5jexO2MpK8aIagr6vhYy+ri1+AwAH37DLQQZxS6npBPBHCRJ4W4RYhkQETUcfpIxWF7hnadS3TSBEYUxZ7lC6/wmimX6sIPqHjk73COHfMl1oUgCrP/vPK/2yyYaUERvTplvi0ONWv/pMqto+uXoznEdoipoIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjsJaHR1py00onar7p+ORVRER5NY5pItpBN72A/VwaE=;
 b=RpFqpGSQ5vPLo0PAxcF/nBIP6mVABWaMzFwmnhPe+FLuT7HbVFWwfOQRcZyMYqMjRzm9afgXu6hKS+D6CutZWpTj1oG8mkT79G2ll5mXAGF6gV4enr3Mp9+J02Qc9K+UfjVLBNKq5tOb/cNQFbyH3CRJLUKVlKU+/9L6gXMKghGxqo9vwFPyCphPdUWnk0tDRLj8YKRdpxrKiG3c8gpYLPQkjii18pEiTJ/qXjdHZZ1vD2gCEX8jCAAms5/zEz8MG9Z0IqRTF3BKNXJlJN16twKDspD0IxkNF+2p/pSn8rJR8J1LHSeLI1iqEq66+i4DBtePWv0F2lwgGEiITtnX6w==
Received: from CH0P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::32)
 by CH3PR12MB9217.namprd12.prod.outlook.com (2603:10b6:610:195::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 05:44:48 +0000
Received: from DM2PEPF00003FC6.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::8) by CH0P223CA0001.outlook.office365.com
 (2603:10b6:610:116::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Tue, 2
 Jun 2026 05:44:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM2PEPF00003FC6.mail.protection.outlook.com (10.167.23.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 05:44:47 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Jun
 2026 22:44:39 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 1 Jun 2026 22:44:38 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Jun 2026 22:44:37 -0700
Date: Mon, 1 Jun 2026 22:44:36 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, "Pranjal
 Shrivastava" <praan@google.com>, Mostafa Saleh <smostafa@google.com>, Lu
 Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <vsethi@nvidia.com>, Shuai Xue
	<xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v4 18/24] iommu/arm-smmu-v3: Introduce master->ats_broken
 flag
Message-ID: <ah5txKCvspL8zMeG@Asurada-Nvidia>
References: <cover.1779161849.git.nicolinc@nvidia.com>
 <49dde0a2e2dc88e421a3010956db33d47cc92aa8.1779161849.git.nicolinc@nvidia.com>
 <20260519120658.GB3477375@nvidia.com>
 <aho9DB6it2R5O5Nm@Asurada-Nvidia>
 <20260601123231.GG3195266@nvidia.com>
 <ah3udmX5SIO9lAXR@Asurada-Nvidia>
 <20260602001547.GR3195266@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260602001547.GR3195266@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC6:EE_|CH3PR12MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: b9807550-d834-47da-62e7-08dec06a0eb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|18002099003|56012099006|11063799006|4143699003|5023799004|22082099003;
X-Microsoft-Antispam-Message-Info: m0RmmVkDSp30j9EYwnr6prRt7ZBvHDzJzckrKbySyAlPw8uDJ//CVpJ9Qncv860czYzQ5l+tNjH6OTBGmSBkWRyXWaoYuhfWmU1/mozGCVgv2hWYf4X6N7/O84KxnVjdDxT0//bWbNbZLxVYM+kN68fsD4KXgsPvX65Nld/RjtAtDGQEVY7WTiKXu8aQVvvL7buzFK0untTrL87yqdFCgjZEj1Hvkt8fBhI1XEjuZEAYyzoZMX9L+NuCwDm5Scq/Zydmld0V5z55ZIIbBqnrlyaxdVos/ZQsCrHgWqi4oNS/0NAzQO4wHvFSY8sScKMdSCIE6Drtd1E8qa1+prOBqNkfu58hgLAeOXeW1jWKqynQ/s7S2EIxUqteexxUpzXtxW1na9VpRNAJgEyXY8UtniwI3XOdLUyxr8aNasywvwGP6fqAavNmnQOgtmqa2+Fw0Qz+hLJ3a7rDEktIi7pkq0m8UmqFUOIGoOJHD2eTQwd8KG3VuJSHB27KqoYGzJSFqmKHsWyiN18vR+OQL2OHRb6GutslM0jr2wMWxBWFGLzGRTuvpWP+mT8g+1Ei66U8Xys78aMCR0JE3gEimNlTksfYvHasxlBJZ7Y+uUjsDo5RiIvZrn6kvmo4aAgsY/eDOJFeBPn69e/k3BEw0oFrjHRCPe2EnQJ/cEqAsDBHMMil6AmL7HDjmHUVftc0dVoOQESp+jl6XpYIPUziiAHPwf36A4nXvmWHdBmv90HLGpk=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(18002099003)(56012099006)(11063799006)(4143699003)(5023799004)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: C8linV14utpEEA5F5wTSSuE5i3JaNoXp/dyM4U5Slrud1Hux1xultJ3RQIRG4N7QIMyvgDURrKMcy4YOPxc+wAY+UC49Fe1CbyriMtIfAF+08y/BbpvwQf556hxYy3LN2SR1DDRkaSgzxWVlZ5yPNQm5l1yMHtHIxVHkDIfgP31whyX8Uavt9r7BYfKhsuQIIwiWNg6H4bavQV1kqHoVe2VWSd0hdBFcVDCdHMToGGBLnUpb15Dnvi2GUMWOumWlH5yHuSyvMJJHFX/LV1GALJhOlVL17O31J22T1A1O1dsknwfYrp4GYtL/Mp7GAr2klGjkr5KutfxWEvcN/UlmGRt1JfXMnFQ3Q6FFw78A8KVwHcowlN5LFUv+QOh4P7rcXEZ9s/mfrD1wzaEmzJ1JMyiV9gA55+5OoeKvJsThCZRqF0mOuVUaDBshj5QBKutc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 05:44:47.7545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9807550-d834-47da-62e7-08dec06a0eb6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_224457_792262_48FA76FD 
X-CRM114-Status: GOOD (  29.04  )
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

On Mon, Jun 01, 2026 at 09:15:47PM -0300, Jason Gunthorpe wrote:
> On Mon, Jun 01, 2026 at 01:41:26PM -0700, Nicolin Chen wrote:
> > On Mon, Jun 01, 2026 at 09:32:31AM -0300, Jason Gunthorpe wrote:
> > > On Fri, May 29, 2026 at 06:27:40PM -0700, Nicolin Chen wrote:
> > > > On Tue, May 19, 2026 at 09:06:58AM -0300, Jason Gunthorpe wrote:
> > > > > On Mon, May 18, 2026 at 08:39:01PM -0700, Nicolin Chen wrote:
> > > > So I've tried INV_TYPE_ATS_BROKEN: during per-domain invalidation,
> > > > each batch is built from domain->invs so it can carry the "invs";
> > > > if the batch times out, we can immediately mutate its ATS entries.
> > > > 
> > > > But I realized a limitation. E.g., if a device attaches to two SVA
> > > > domains on two SSIDs. An invalidation timing out on one of the SVA
> > > > domains could mark INV_TYPE_ATS_BROKEN in its own invs, but not in
> > > > the other SVA domain's invs?
> > > 
> > > You'd have to mark all the S1's sharing the STE.
> > 
> > That would be a bit convoluted as we would have to go through all
> > other domains' invs arrays.
> 
> Ok, that is certainly an annoying problem.
> 
> I don't have a better idea than storing the master unfortunately
> 
> But I think the locking for that is going to be tricky, I'm not sure it does
> actually fully work..

Yes, there can be a race that sets STE.EATS back while per-master
flag is set, which would skip the ATC_INV in commit(), so no more
ATC_INV timeout that resets STE.EATS=0. To close it, we can force 
STE.EATS=0 at the end of commit() when state->ats_enabled and the
per-master flag are both set, which is only possible in a race.

However, after more thought, I found that there's a big trade-off
to pay in the invalidation path, if we go on this path. The invs
array only has SID, so it needs to convert it to master using the
rb_tree for every entry (holding streams_lock).

I asked AI to list and compare the three solutions that we have:

(1) Per-invs marker: INV_TYPE_ATS_BROKEN + master_domains
    disable_ats() in the timeout path walks master->master_domains
    and flips matching ATS invs entries to the BROKEN type.

  + invs walker is free (one case label in the existing type switch).
  + No lock or pointer deref in the invs walker.
  + No master pointer stored in invs; no lifetime concern.

  - disable_ats() walks every (master, domain) and marks each invs
    set; the list needs locking usable from atomic.
  - No master-level flag, so atc_inv_master loses the cheap early
    skip and attach has nothing to gate ats_enabled on. Concurrent
    quarantine self-heals only after the next ATC_INV times out (~1s),
    unless we also keep a master flag (i.e. a hybrid of (1) and (2)).

(2) Per-master flag + streams_lock
    invs walker resolves SID -> master via streams_lock and reads
    master->ats_broken.

  + Single source of truth on the master.
  + disable_ats() is one WRITE_ONCE.
  + atc_inv_master early-skips via one READ_ONCE.
  + attach gates ats_enabled on the flag; a concurrent quarantine
    race can be closed by a short post-attach re-check in commit()
  + No master pointer in invs; no lifetime concern.

  - invs walker pays streams_lock + rb_find(SID) per ATS entry on
    every invalidation. Measurable on ATS-heavy workloads.

(3) Per-master flag + inv->master pointer (v4)
    invs entry carries a master pointer; the invs walker reads
    cur->master->ats_broken directly.

  + invs walker is one READ_ONCE through a cached pointer.
  + disable_ats is one WRITE_ONCE.
  + atc_inv_master early-skip via one READ_ONCE.
  + attach gate + post-attach re-check, same as (2).

  - invs holds a master ptr, so release_device must synchronize_rcu()
    before freeing the master to drain walkers under rcu_read_lock().
    We dropped this from v4 for that reason.

Side-by-side:
                (1)      (2)      (3)
  invs walker   fastest  slow     fast
  disable_ats   slow     fast     fast
  atc_inv skip  slow     fast     fast
  attach race   slow     fast     fast
  master free   fast     fast     slow

FWIW, AI picks (3), but this would reintroduce synchronize_rcu()
that you dislike. My personal feeling is that (1) is the cleanest
shirt in the dirty laundry?

I'd like to hear your thought before finalizing the design.

Thanks
Nicolin

