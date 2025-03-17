Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C75C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4dxEuz+54gi5V6a5wH0pnhTBnvYwXvrwibnM22As3c=; b=2F5B3EblAm2hcOBMGDw+WPQf5S
	35IdC++6LPMTA2dXJThq4Ve1lnpteO34rqOjqcqX4LYcxLljTH+mGIo0lupZXN20d0IweD/B9P+OJ
	yktlzqBlchOCyu3fieKxnIRWHC9vKPqlXdtfYy7vDVseLxWaF5y74KKRyOt72bOZELXqZR48bjwKn
	ZMQFwUHstVBjlxl2nM0OEsnLinLvVmZAEKorLars5nPMtB/wpzd6t7ewTnT4tf8hjg5rwXl1cML00
	Ps+RX4VWFlaX475Ie04uf4DuAleK3A9rAzErq4KhxGOVQHTml3K3uiUb3vCBe3CiLR85743xWbQKQ
	5BV01VDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFZM-00000003kNA-1eES;
	Mon, 17 Mar 2025 18:52:12 +0000
Received: from mail-mw2nam12on2060e.outbound.protection.outlook.com ([2a01:111:f403:200a::60e] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFWl-00000003ju2-0Fqw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 18:49:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwDSDmlNapy/1aBNtDP3B6yOVpsMCZbYWBRH3yaULiSRO6ryOgjFokSG7CerzL/XAxclIZiklzDihfGnvvdBMNMh912p4c8sjajazuBCBrqJgoUWepCPS8C/Rep5VSE9giVMiydGCUo0aCteQ+BMMGldFM2kAM1n1fzQu1otVAmBvrRm+kKPZ9TsJPkbEY45xGYI3xgPyAjFCIBColGBaXpi9TZMizZlmskKwI6E/UIrwYshjEEKX2/a1tYHHWb7I1iZbUuU43dItlAyZfDv+2M0Ifs3bFDP88aUWF6q7j25neduc7a2cIX/7mfzgZ/t7y+B3zMFk2YSB/uZAojNkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4dxEuz+54gi5V6a5wH0pnhTBnvYwXvrwibnM22As3c=;
 b=HmV7oVRdc+I/CDla61nV6Ek4OuGytCyQ3shElm4xG1eSjA2XBWmEukDF1zBCBrlluIwNSklXKM0vaene6LsOgJKSxEhuE0wsRimTj3IP4QdS1sYYiniQrcaCCDYYGV2rOyXXgcPW1a4204rTpskqigL5cVJcxUKgzcRWGGLyNLhCKkzMC1QCHfSZbvraL8F2vwZjST08JMLVjcaBikL45IAwF5bjnp4+w4hP8YnCqv5dlYMFgqBkQCM6y3DD++tBWFqSCkr6x/x3BbRp8UJ3L9AmrqxLlXFikvppAMegxrIeETT/Rsl28QLyAmAOkIwgj7BeCwzme5XMUoYTktTuzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4dxEuz+54gi5V6a5wH0pnhTBnvYwXvrwibnM22As3c=;
 b=Y0y/QwF0ioMrsClprKiD81yYyszBJIcB5SwA811JNYoh1ZoyKCnEeyPbN5vYzUJqqkKSsJTHKTtVqHV/A4u5b/BEpwv89qJ4UOfN04Fqj9WkuRpdLo/NPxbFjvxPbg+tTWTE04iFSp/hyuRPD3WZx1eq492PT6mMnGFH1zWg9UjrBf+JfJbovNSh1emDYCs8ExhmLXgU8mjtggjZL2jYWX04MrfLoefoTIUAKMxaYvQZDcsfFFhY3wZym01+XZWlYUd/z8I0FU5QoErcWBGexGcgQ3wIlWl+G/GgAn8NtgyNug+Z1Kjhc8FtdJjiNPBeNAkknpZM2ZhQKMm3iuOyyw==
Received: from BN1PR12CA0011.namprd12.prod.outlook.com (2603:10b6:408:e1::16)
 by BY5PR12MB4195.namprd12.prod.outlook.com (2603:10b6:a03:200::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 18:49:25 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:e1:cafe::1e) by BN1PR12CA0011.outlook.office365.com
 (2603:10b6:408:e1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 18:49:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 18:49:24 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 17 Mar
 2025 11:49:17 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Mar 2025 11:49:17 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Mon, 17 Mar 2025 11:49:15 -0700
Date: Mon, 17 Mar 2025 11:49:14 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<joro@8bytes.org>, <suravee.suthikulpanit@amd.com>, <robin.murphy@arm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <praan@google.com>,
	<patches@lists.linux.dev>
Subject: Re: [PATCH v8 12/14] iommu/arm-smmu-v3: Introduce struct
 arm_smmu_vmaster
Message-ID: <Z9huquCf7YuzIjqx@Asurada-Nvidia>
References: <cover.1740504232.git.nicolinc@nvidia.com>
 <f205a4e2f5971cd4b1033d7cac41683e10ebabfb.1740504232.git.nicolinc@nvidia.com>
 <20250311155714.GC5138@willie-the-truck>
 <Z9B2LMIi+88hlfza@Asurada-Nvidia>
 <20250317154423.GI9311@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250317154423.GI9311@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|BY5PR12MB4195:EE_
X-MS-Office365-Filtering-Correlation-Id: 42599462-f418-49a8-20a5-08dd6584701e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+//gwnTu/WTQlJHJplb6gsA4hh/0MU5eV3pFELQzhiQhvWCh7op16bHAz0nq?=
 =?us-ascii?Q?Vimtv7Q+cVAEpMCSWhl+SMcQ5Q/raV9pWiYYHEpPc4OnNq9LkxKA1Mqppvrh?=
 =?us-ascii?Q?790vMkbT9IfUptqBuk1nk+gtpeTziXpGUQYZuQKrh5WN6XUr+q5rK6Ic/7qp?=
 =?us-ascii?Q?JdqnV3aZJXp+ytawX6BFwkIHjnNZOG8TOHYRTiTYrDMM/2eDN37QANDXDhF0?=
 =?us-ascii?Q?uWY7mhHORDHkX6lgCX1SoDO+LSznoRpRqt4IxYrQGCOWSl/ExjFPxi8eJ7gL?=
 =?us-ascii?Q?nMUfFuazZPCppfwBBHqRlyU2Qy/JDOqzRoTz4KFoTZKgApQjgPxBytRfaqVG?=
 =?us-ascii?Q?E0M+jFHBy1pcaMoQVB3eEdrOrSVgxeJnRc0t3UMlYCPHmDKDeibVlV2ZJ5fx?=
 =?us-ascii?Q?I+ZJTHckTguUBwgL8OVpGMJwQEubODp/VFEPhcwL7J9gtvayhxxa3kKAo0Gy?=
 =?us-ascii?Q?x8ypQXDjx7e+sUbZPw/YhG8vVGaUz4nhh6SG0UaMSBuzQrypcxZhlPE+qe5Z?=
 =?us-ascii?Q?rfmF8Zyhuq/cuHasP5K4LibqYGaVsxD3pVIZiVwUtS5IyLAwWZqdAzwP/vrC?=
 =?us-ascii?Q?zHjC5iWmTtQDuCSI1y+N5lHAZ0Wiv/9uM2zrbudLhp+UYgjBGpdHMaut6RC6?=
 =?us-ascii?Q?Ukfq7YNAa7M9T5p2/LyQrKxBQ+a1eN4n4lVEJzmHwu2tjkMImipszjnytMni?=
 =?us-ascii?Q?6PLAJ4vhvfTvY18MdcqSwfJ4wlCI8Cp8sfaff2AdLVmX6JFcmicm3+uGEKp6?=
 =?us-ascii?Q?sNvpkatfYJb78Gld9JYSLH5jGygdiwVqU9DffEnJ1Sm4/7KzrkeFgJpryiUg?=
 =?us-ascii?Q?1mCiNGw7whnuZz/4yCum37caLFrAQWQC8q6+8UffdtJTTTmzcH6IoAdoC9lG?=
 =?us-ascii?Q?XZA14onQTDQ3D9ECOHs2YKXDS0/HJansBNBc6DizuBlV5rINS2IK4sJAkXvp?=
 =?us-ascii?Q?RXwnVeLaLeC/XXGj/BEsIc4UePvr1b4kUo0B2krzwoDMG/uTp3RaHFlnfFsA?=
 =?us-ascii?Q?9iuIRBznUfxvwSaPw3Eqg70WtJgGPzuA607QmRoR92eq5bmdfkP33KwhBjEI?=
 =?us-ascii?Q?NOl/lawk5BR4u0kIdmjPCWrZCUpS3mHHIzjoUnwrLXNKFNMbCcQIBvJA58iq?=
 =?us-ascii?Q?JF7PWzMeGfYv+y1Fri826IrMtePO4BZM5uXsxVdPZACuJoftpzIwIbroW0w6?=
 =?us-ascii?Q?f7XeXUPNyFvjZHc34Oooyvu0o6V0u1it+Bs+rFR6LcPvSdrhxS7vwhj1iHNk?=
 =?us-ascii?Q?J5uiijB2vPxtsWEGWxU+9UNWMRVz1+kzqFpALtFNZxaaVmb8lJjJ1I/TR4Bd?=
 =?us-ascii?Q?dvSy7Ekckv0irZxh9Ha2Aa430saxK0hCJ3x2ls81d5BkWIiFzA4/ziYcl3sO?=
 =?us-ascii?Q?3uP6CZLy4Yx7TjI4Q0/hUtEYzwxFEuMIKIMp2MLxejDG9ryhkjUJbmSV0T8W?=
 =?us-ascii?Q?4KybTpPOJ8CMnQBbOsAgjKGZ3hNTUeCdLfOW134e8RvZGdqlpiXcpOFfch0S?=
 =?us-ascii?Q?q8dBqVw8OSJ5zVE=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 18:49:24.5714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42599462-f418-49a8-20a5-08dd6584701e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_114931_114856_0BF7D8DF 
X-CRM114-Status: GOOD (  24.55  )
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

On Mon, Mar 17, 2025 at 12:44:23PM -0300, Jason Gunthorpe wrote:
> On Tue, Mar 11, 2025 at 10:43:08AM -0700, Nicolin Chen wrote:
> > > > +int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> > > > +				    struct arm_smmu_nested_domain *nested_domain)
> > > > +{
> > > > +	struct arm_smmu_vmaster *vmaster;
> > > > +	unsigned long vsid;
> > > > +	int ret;
> > > > +
> > > > +	iommu_group_mutex_assert(state->master->dev);
> > > > +
> > > > +	/* Skip invalid vSTE */
> > > > +	if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
> > > > +		return 0;
> > > 
> > > Ok, and we don't need to set 'state->vmaster' in this case because we
> > > only report stage-1 faults back to the vSMMU?
> > 
> > This is a good question that I didn't ask myself hard enough..
> > 
> > I think we should probably drop it. An invalid STE should trigger
> > a C_BAD_STE event that is in the supported vEVENT list. I'll run
> > some test before removing this line from v9.
> 
> It won't trigger C_BAD_STE, recall Robin was opposed to thatm so we have this:
> 
> static void arm_smmu_make_nested_domain_ste(
> 	struct arm_smmu_ste *target, struct arm_smmu_master *master,
> 	struct arm_smmu_nested_domain *nested_domain, bool ats_enabled)
> {
> 	unsigned int cfg =
> 		FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(nested_domain->ste[0]));
> 
> 	/*
> 	 * Userspace can request a non-valid STE through the nesting interface.
> 	 * We relay that into an abort physical STE with the intention that
> 	 * C_BAD_STE for this SID can be generated to userspace.
> 	 */
> 	if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
> 		cfg = STRTAB_STE_0_CFG_ABORT;
> 
> So, in the case of a non-valid STE, and a device access, the HW will
> generate one of the translation faults and that will be forwarded.
> 
> Some software component will have to transform those fault events into
> C_BAD_STE for the VM.

Hmm, double checked the spec. It does say that C_BAD_STE would be
triggered:

" V, bit [0] STE Valid.
  [...]
  Device transactions that select an STE with this field configured
  to 0 are terminated with an abort reported back to the device and
  a C_BAD_STE event is recorded."

I also did a hack test unsetting the V bit in the kernel. Then, the
HW did report C_BAD_STE (0x4) back to the VM (via vEVENTQ).

Thanks
Nicolin

