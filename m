Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB12DCD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhuXNHtRR1GbQ1JX3xbTdXWDv5xhygMrzSj8+v12phk=; b=oEWRPDZJ40AjFJ8AgtQ1tG2s5V
	DX33vV8ZEfmyARiGWos0jivN751GGzMLd1lCowQmyxJCufIlk50kl+ralq4HnZ8VL+df8ZRN80GBq
	GeGko33nhcsXZIryC8vF4hfWcUG0qSoRW6lBgEofWl1WuKQP+3LiBn/4iDIXLlUxfKl/FkdWtZZOL
	iHlrpOFPYDeueQTxLDwJ5/Akdjwzo0l3Bctzj89PoYVtnbx0WBFjR4OcoRRd+bCxEP33wx3S1/i+O
	3+Y5iIp5nfcsf7TpnmyEwlgyS4+cTqaMc/skJI6mHO6F2d7mcT56aS2loYmgxaRjNs2iiA4lw9/nU
	FBflUJwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITFt-00000005dOt-0o5R;
	Thu, 30 Apr 2026 15:24:45 +0000
Received: from mail-westus3azon11010055.outbound.protection.outlook.com ([52.101.201.55] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITFq-00000005dOU-3t3h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 15:24:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnS+R8I5wczTLfJiMEobA62fJhZpnpAL9NqXf6nv7BttJPO7N1fur8klzR6LRBVBJIjEyPX4kepy+U55WpUXm2ZBWl7J+z4hEDkmgCPXrnz0FIi/aRcoda5h9Yj9H2AvjIJa0gE387YLUDPvWzAkrCF/GOM+msqNc8i50Ku3aX4wuwVONZjVxTrDDMiMqvnZguw811n2Za9ONlmu/J1GaLl+JCi3CoOS0/CcBIrGH5fKIqEkacwdgimcjP/sVQCfxcOLh6Eben0wATUvOm/LeanLgL1WgrQnLq2GAPFpNbVWlKu86cUEifDyO94KPFEipyCGel1dekxbzum4kwLY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhuXNHtRR1GbQ1JX3xbTdXWDv5xhygMrzSj8+v12phk=;
 b=YAewWpuGOUlDlVzOtCffESA5bhOcRmWwX8nVaz+b8XXx+JNV08xaN2biroXdxgbjtqsisKn7Ni2YA9CLxMwqGH/VuR85LPMv59julfiF35WKFqeD06Ed99Nu3lWW/o5rSruyGWb4FVpiZcMw8Ke7o9fpHl1gqSv/WaGt9rrR9PZS7R2GfMw/qc3QLk6G/eJwwGWgvmkPv+hB95yO4xcY041oo19qUoYYhWbHkYrXUw++dNxaMGaoy21aEXrZVGwZVLVyD+JN2xcM4aCCkVCpJLq4yjPkPJ/79FFRwh3SVv1X0R7FLG/20dfSkxtOhNte/RGIBxXsvnc/EIIY8Rv1qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhuXNHtRR1GbQ1JX3xbTdXWDv5xhygMrzSj8+v12phk=;
 b=pk0zrc4u3NWQIFtvO2NIXshcJUNJ2FHEoflKEiUdc6rMKp1NAjBEr2Tq2Bp9+iyQW65VswA61gCI4U//nD0xjlEf/lUBTe/AHOSJV9USFlv0cyqb+g9FOHuHobht9tCC+N2BwsZ0WWt/K4p8x5spH9D0ZBBbBbIEDgfIcu083KR7B/XP2Q18akWbMfAsryGrieiSuGKYwYzA9Z7fJ7TEHVWjpoKwkt8zvIMSzep4NDAbJKA8MVOVlIA/38p0wv+KxyHKbT1H2hPpBa1A7DBCMN6eFwwYRafVGu798ezqZ0KTaSMru5mXjvfhEkzhRNhIjVY33CmAdVPrRF3Y2l4z7Q==
Received: from BYAPR21CA0024.namprd21.prod.outlook.com (2603:10b6:a03:114::34)
 by DS0PR12MB8069.namprd12.prod.outlook.com (2603:10b6:8:f0::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.20; Thu, 30 Apr 2026 15:24:28 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:114:cafe::20) by BYAPR21CA0024.outlook.office365.com
 (2603:10b6:a03:114::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.7 via Frontend Transport; Thu,
 30 Apr 2026 15:24:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 15:24:27 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 08:24:03 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 08:24:03 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Apr 2026 08:24:01 -0700
Date: Thu, 30 Apr 2026 08:24:00 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <kevin.tian@intel.com>,
	<joro@8bytes.org>, <praan@google.com>, <kees@kernel.org>,
	<baolu.lu@linux.intel.com>, <miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: Re: [PATCH rc v4 1/5] iommu/arm-smmu-v3: Add
 arm_smmu_kdump_adopt_strtab() for kdump
Message-ID: <afN0ECiGuN5TvT9g@Asurada-Nvidia>
References: <cover.1777446969.git.nicolinc@nvidia.com>
 <edc9df0e05559ee3edfeb833b84d421d9b040dba.1777446969.git.nicolinc@nvidia.com>
 <afJ6Lu0aZyff5TYZ@Asurada-Nvidia>
 <20260430115513.GG3225388@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260430115513.GG3225388@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|DS0PR12MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: bc122854-d6c0-4d4d-fa30-08dea6cc9132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: KNs4Qz1UcbhUYyn7/Yj+U3qOG1UdNItzYgxzF5YUNhSfhDLCGFj2ra6mlbaeU1ymqX0RWAwjaaNNJ4NW3aQ1eFw5LgEsmtYkfIA+2xclGFBUsIqEHnA5/YWst/EpYnS1Ud9eg/7SZKfAz4TDHxSkkXit7EC59+YaSSziCbdpdcSuk8frU6ieMP+kMxzUrJVJZo40ZyNSrFBdToZEhrJWGxbLpr8n08oQPEQv0VBHh/xerxrjETWMNPRMM8QjDi4OQ47uB/uBmTjSfsOKkip/8XaSWCj5EkOp7ZkA4GCe5dhQIkrO2ZJGS/vAWrifycaIGxAxIIK+M42MQZhLQ0F9MpMI6ojmOFpfgg3bDfq95BUGhLB8eRl7H9Ye/ZfOiKwgjpxWC0IT/M0jbL6eJFP4w+dWVWafFrNNowG4cCR4CA7r+KOlGTJvQqSbzQ3ncZJ/Bz6EStat9rWbG5M5eLuWTcABPrGI8vBWNYVDu9K2CBW6kya+aaKOIPFdt/f4n6S6b7k1VqMYnjNHbbO356P7xkpGiyTZCMFlyZi8KDYw5/AuRyG6FcfvWSGf+sTSELRPOoTKoCvDJTiJkRQlvWA2A4GfrUws0uo0hcv5c3/69EdD1TqngZgJAgctZQptCY+53Lru+qHmgI9hG1qPaGJbNw+YMP9aJwTbNhOswuEKVgqO1/m9iKN9uJPhiEjzxzpD/6EA/Wg4tpq5Q9djyTCmDn1zKf1DIYijdtm/gs5BpKh/T8uQv0Yxji0nF11SsR+lBkFSdpH2soiN5aGxUXmedw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6vb41SXAP0tACjvGdh/5rZXbQI3WY/sjaDZkuMET0eH+XVyNY/t0C98zAwot6UxlaYC3U2LB1Lb0EJG5Q9QO1BXeNM/BJ6XGKHBEyFxe2r/N3BTDhmdzDhpg2/hymmFenxzaFcq99eDLKllWrB1TCV4VLq1j9Sc1lvSfDcFfpgxBiX/SzE44MQkrBvkTxva0ewIv7g6di/nRvePMs8S5Q/zJvSiJpm0rRcMglCXyWhonrz+7eSeqpx9w3KzaI1xjgKYPxYtiOd2hEMOzgCB4HzMB6/+yjPMiIfwd0rMGwkNJhGo0SN8XKzxu2T9p8DbPqEyKwxRLEiw5/YeYl2f0/xQaJzIMY+Nz1AN64RsnvnglClTSciZHYFTJUEBTzB6juOAl0O6K9oGbvMfvOmmpfg7346Nyo+HJpmVqDCCOP+rYpZjEG/gO82QMSj/w3j2/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 15:24:27.2444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc122854-d6c0-4d4d-fa30-08dea6cc9132
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_082442_969732_59CB5540 
X-CRM114-Status: GOOD (  12.83  )
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

On Thu, Apr 30, 2026 at 08:55:13AM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 29, 2026 at 02:37:50PM -0700, Nicolin Chen wrote:
> > On Wed, Apr 29, 2026 at 12:20:49AM -0700, Nicolin Chen wrote:
> > 
> > > +static int arm_smmu_kdump_adopt_strtab_2lvl(struct arm_smmu_device *smmu,
> > > +					    u32 cfg_reg, dma_addr_t dma)
> > [...]
> > > +	for (i = 0; i < num_l1_ents; i++) {
> > > +		u64 l2ptr = le64_to_cpu(cfg->l2.l1tab[i].l2ptr);
> > 
> > Sashiko pointed out a missing READ_ON here.
> 
> ??
> 
> There is no concurrency at this point?

You are right. I got confused. I was thinking of an RID-sharing
case where some race might happen and adding READ_ONCE could be
defensive.

A kdump kernel has a very limited use. So, this isn't necessary.

Thanks
Nicolin

