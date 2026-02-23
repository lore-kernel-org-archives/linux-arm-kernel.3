Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A666EEC2A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 22:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fhik7GFFJZ4PNIUjr8SvnHSLg0e1+Varhdc7OTRQ1ec=; b=EnSpcV5N8AFS8tikJJ2EgUaTS1
	ULqCLmbGwEpsGPBY5BaBvislBq8rusfdCPufTbZFfgS7Wk4Ke7aGu2yUqcdVjAGFMtWxy9ZPCqm0u
	kE/S427v7Cc0F1vnUTPpsFMDCLaGz7cKmstjNeJaPQ36Kk40UXHpmO4pHsqIrU2k9/FZZV7DhZTgZ
	6Wq7Qxvnob9LzUoDqvMcrk1yrFqD+gQaZcWYgo+dcVb43l1SvOhaFyUFwGpeLK/6moPixEAUo5l95
	LHKF8vzGDOzohfHPt48eKSzPZvq80bcaBRjkk/XsGZ2rUCDR60BzyArl/nqoCQsZyCjwnx+0kTq0e
	m6waoFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuenP-000000018PC-46Mf;
	Mon, 23 Feb 2026 22:52:55 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuenN-000000018OQ-1qHW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 22:52:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tu6zOBgmh8ZAiTv9NSRFYGvQqAll6nrGKujw5HTybNT+e3KjKpAMjpBWg242A0EsfBbY5ir4Qm5nrsrjdC9ega4LKziuysGs8q2Zpg6oeoZMoa3EfbWwFWt7+liLweDv9zmuIiE152i/77GPQEeRX5NdCe0dR5s2ul6Y10GgMhnzLFsaPEWlVWa5KAr8M8UmtT1QNJix91sNwjLwPC2bLBURcxPvIu+rmJEJPrjUbwW7vqrYJrGAFPVpfZo9N7EtufMudeml5KzQehFLvdppsYYNq3HYm85ENASB8mRzF8H5f/gXlj37kyTR9EUQpy8JRr4DadxqRes9yG420w33QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fhik7GFFJZ4PNIUjr8SvnHSLg0e1+Varhdc7OTRQ1ec=;
 b=vs3z1RDzNe/cJ0eZE0rrEO099/Yl7uzZbSkjM1WsmclF13c38yAwv6tnZH1zZxEHit5jqD1llkLUsCoW/S9HKXg2xniDHhPPxXtX9wNyLYLTIaLdE/utQE6FPVKwij2qzIXrhOpqTwn3rSNEhVjwxkW62YWcYpAP9bgEZfljO5jFbpeH0ELMLAr6unByosfxAPJYuutLRQN2lp23SX1X+AqWMdgF2JE61FXVjJBq/Q8Nvybln7wn8U3TJZSUE279gi6/ztIf0nQGMZKRGou9+7Hth1XAWuDiQBPyCs4lSm/EsuJDQhKk02v+cMC3/Qdaz49L2RhBMsU0PEsjySzCtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fhik7GFFJZ4PNIUjr8SvnHSLg0e1+Varhdc7OTRQ1ec=;
 b=cXb7q2VXg81mTTKbgxb2T/OZSEBHZ1GmuRiYiLII1SRT0EqnVzDrU6m8X5smBE/6RDn8fjimVIRjoDk5O3zutzOsVjeJ0XwmqKVvOvegqxL15JMiHF/X3RXO4I5hci6hU79vI6pCCtK1ASJ34ABd1SM652dyOzTKylm15cKJno1jXGlzRptXl9/MtfW1/h2WrVV0gy+0BqSv/HrFSTlzjJk+RiEeE47B5g9Oju66QtQE9dikT9jjfZGQRErsYspBe6mJgj4YC+e+Di973vUMp1/5m26294LWY5ji6MfHUWdWtCjjsNNdptdCJp+WbTMgM/ZC0cYeW/TDqRxbiFp5IA==
Received: from MN2PR10CA0022.namprd10.prod.outlook.com (2603:10b6:208:120::35)
 by IA0PR12MB7774.namprd12.prod.outlook.com (2603:10b6:208:430::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:52:47 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:120:cafe::5c) by MN2PR10CA0022.outlook.office365.com
 (2603:10b6:208:120::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 22:52:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 22:52:46 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:52:28 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:52:28 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 14:52:27 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>,
	<bhelgaas@google.com>
CC: <joro@8bytes.org>, <praan@google.com>, <baolu.lu@linux.intel.com>,
	<kevin.tian@intel.com>, <miko.lenczewski@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<dan.j.williams@intel.com>, <jonathan.cameron@huawei.com>
Subject: [PATCH v2 0/3] Allow ATS to be always on for certain ATS-capable devices
Date: Mon, 23 Feb 2026 14:52:19 -0800
Message-ID: <cover.1771886695.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|IA0PR12MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: 089acd92-1a85-4f28-a713-08de732e4370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P05skieJWxkWFTPsZlS8CqWE+1BHvzmGtChfkK5YEt0nkPOZQDwhqPY1KPUT?=
 =?us-ascii?Q?TyE87A7lFcIZCdX7WhYUB0/cEGXGW2axpkHDksX/0dVOLT6c4QoW3ZlFGYoI?=
 =?us-ascii?Q?xLIoqLit6q4kPqh+ZniWK0qEcWGWlSqD1iqxXWx1Vc3zU5owTiHBfL2UMfyf?=
 =?us-ascii?Q?R6KMe6QQ9dFOsGeHC9Ls5rDKVrFIEWNIKl48t3TqoaEY+qTkFJLmQpPTpebc?=
 =?us-ascii?Q?TJnHFdExL3XY1LN1T9weN7mn4cUti0aPZz1NCXAfrUHuB1o9nMySvuQbLeSC?=
 =?us-ascii?Q?I7C8mZwyX922yKaSHk7yGdso93CL58LO0Lf/ti4qvbznA6j/yDghIeauuLY5?=
 =?us-ascii?Q?YwojxlPMsBRPTJTJRv0QaO9UoElhRABs866diRWQDMcu6us0hgb7BmDOEeaS?=
 =?us-ascii?Q?2hVGq5q785zJOwnAuXkW6bHhZ+EL5trPklGxE+0jTXIK4lXy7aF2TyY8kBTf?=
 =?us-ascii?Q?M6KiS2lDQQfGoSvyTd4Jga709XFrVxrMg6Qe5+LkEd9iYJjqNpVymmVhX8dh?=
 =?us-ascii?Q?aadFzeDLhv23BUR0vZL8HHcoNiWc8jweeTzwCsGhKpwI9AOUlZn3TcnmrlsQ?=
 =?us-ascii?Q?2EY8iaP8qbZu/vCUwOAP6TUWsOsOJhzRrVTjrZuHwk8Xq1gHCqRuz2O3Sptr?=
 =?us-ascii?Q?pYQpFVvWfr2yVC86W7+/cg3ipa/g2XpduspOqvEgl6H0dHIJiup1DflosHtL?=
 =?us-ascii?Q?RjKE3oFDw62CpNRJWGF8frTQaoX2TW1rZFYPzcsQcOuizyPJQx6zfCIh27FL?=
 =?us-ascii?Q?r9YFn8Cny7Vklb2DF2V0vzLqtcbT8r4+j0I9cY1bq5XYQu7qd4BTWiJanjGV?=
 =?us-ascii?Q?LzE6VPt/DTmoH+H2p8c7WoVpUelSxttpqmix55IeaQnfIw58AmlmroeZehR2?=
 =?us-ascii?Q?b1Ri6SkcfZZMAn6CjbhJ3jZDKhp7hW0WS85uB9udskpiJ7x6lk1u/UZwZRHr?=
 =?us-ascii?Q?TPVP0xcH+LSRdLbLlFxfvk4GyH80edIYFWDv4uTQ3uUEuxfm3spoig/fErTv?=
 =?us-ascii?Q?y8BOcSeg3vVM7Hyl4AlTUxk3zVqNsqtCHFuwkDx13EFXsiGcy+3It9jdW+je?=
 =?us-ascii?Q?+erHQtbonrBFOjxrUzbCc0rcLiDPEa1YmfHT15dfnNOPLEhierqUFOV/vHGz?=
 =?us-ascii?Q?zZ31i1nK+aXy0ug2ng+sdjFFYaz98iaOyEkj+x+0Lq71FzE4mG+qHlErYixi?=
 =?us-ascii?Q?rSPU1HZetvN7b0EbkinVg8d4zs4Gn0F3NG9H/4VWt0OAomj1IzX8ycHGNBFK?=
 =?us-ascii?Q?PVMrAQn6hqxNRz79UTTROxdTRkgHwvT7CzHFs/KDllhChNEoHFKZjQq3G3DY?=
 =?us-ascii?Q?c6VR02Ue9JMoDOLOJaDxvWHx8RacJYAslrJA0b2Ei8d7/MjT86qbJfboi98R?=
 =?us-ascii?Q?A8pXrW/+5tEII9F0qxnOTroyQc1jKar2fceWvVjDgmzvNMT1z4RqwPqy3Glp?=
 =?us-ascii?Q?eg/r54C9S601CSRbP1i9tqGzDNmXKIc1AxN28QYmUSGiE8hTv5dTDFqUdrlZ?=
 =?us-ascii?Q?pD3yhGkgKYQmNolImNuO99ELinNevK7mSwMrXK/VfVOhdRfBuk8iPZ4x6pJL?=
 =?us-ascii?Q?mxUaIiyKtxneYl36RGJLt7sMbpBySNm9HPv5rYcOHWO3N22rb05d5ygZ3YyP?=
 =?us-ascii?Q?KgKHJhPiS8kHKRQTidYHYOAdFoTo8S4Ydsu79mQZEWdg3kT49cM2hT4t5xCL?=
 =?us-ascii?Q?/0xjdA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wR2do5sG3pdVhdte50f7f9yUWUbBXTWmBS41JTq7L1J4ZJh8BuC6cAeE6UY8QeDDlAH6gOKxXVnEjWyfltBleaj8VKR/ghw7xdxOkbVBd9q1uLEzxUbyVLhq7tw6qx5Jy8TLs2jLJP8+MO1b6IqqYVdCjYEHWSqlIa+dYPYJr0bHnUVuqPycTgSpi7Zlts+9rvo3QS8YJtRGGyAGjro6ROW1vX3ryPmjTa5tpdrz+oc0q/Q/sznrMt0fUR7jI+Ns2fX7Uqgh8fcLIasjvVqGlzBqWo75BppGSh2g2kJmIU6KN6z7vNkB/eJM+5pZB2H5lvOtxblitYlTvaSCzLvw+uikkU5j5jEq/rMRshMK6DdpDCeXEgRkyIGV95zDecsz9qILpNptQ2q+mbrghnIhFP51/WABtP5ttmrEdm649vF7X3/NtjialMAD553hhx9e
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:52:46.8478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 089acd92-1a85-4f28-a713-08de732e4370
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7774
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_145253_494919_EA1BF9E5 
X-CRM114-Status: GOOD (  10.49  )
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

PCI ATS function is controlled by IOMMU driver calling pci_enable_ats() and
pci_disable_ats() helpers. In general, IOMMU driver only enables ATS, when
a translation channel is enabled on a PASID, typically for an SVA use case.
When a device's RID is IOMMU bypassed and there is no active PASID running
SVA use case, ATS is always disabled.

However, certain PCIe devices require non-PASID ATS on its RID, even if the
RID is IOMMU bypassed. E.g. CXL.cache capability requires ATS to access the
physical memory; some pre-CXL NVIDIA GPUs also require the ATS to be always
on even when their RIDs are IOMMU bypassed.

Provide a helper function to detect CXL.cache capability and scan through a
pre-CXL device ID list.

As the initial use case, call the helper in ARM SMMUv3 driver and adapt the
driver accordingly with a per-device ats_always_on flag.

This is on Github:
https://github.com/nicolinc/iommufd/commits/pci_ats_always_on-v2/

Changelog
v2
 * s/non-CXL/pre-CXL
 * Rebase on v7.0-rc1
 * Update inline comments and commit message
 * Add WARN_ON back at !ptr in arm_smmu_clear_cd()
 * Add NVIDIA CX10 Family NVlink-C2C to the pre-CXL list
 * Do not add boolean parameter to arm_smmu_attach_dev_ste()
v1
 https://lore.kernel.org/all/cover.1768624180.git.nicolinc@nvidia.com/

Nicolin Chen (3):
  PCI: Allow ATS to be always on for CXL.cache capable devices
  PCI: Allow ATS to be always on for pre-CXL devices
  iommu/arm-smmu-v3: Allow ATS to be always on

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 +
 drivers/pci/pci.h                           |  9 +++
 include/linux/pci-ats.h                     |  3 +
 include/uapi/linux/pci_regs.h               |  1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 73 ++++++++++++++++++---
 drivers/pci/ats.c                           | 45 +++++++++++++
 drivers/pci/quirks.c                        | 26 ++++++++
 7 files changed, 150 insertions(+), 8 deletions(-)

-- 
2.43.0


