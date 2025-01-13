Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E022C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXRBw3xLC8HkupB416xfNOcJbozaIA86suw8QpYRrXc=; b=YU4F7wHiM4TO6FJyKJoMwAb2V1
	eub+aaT+p5GR6E+xfkrD056TztxyynjBXKg24QzSVEEPtO+NUr/323fQvWNzvH31vNzSDhRYkl/7M
	dy5loRg62fkZoAj3elpy9ZBXw3vC/IMDtldmf/Xu/YNDTs8nAhZviie9JkGR0kM9Fh3O6jUGH/rNy
	LAd+gdR1YoVoG+vap/Cm5JGmZSz2cCcTBJpDZqBgwhevUvLfn/CddIkZQjGNG9WBNkl3IvdgjgCvl
	Cwqd+s1y0WMMoUXc9m+kvajbKhpIwdRRT1ri94Nvvf3mjFCutjO8tkmhsedkzt1uHw+vDkbHT3yQ9
	qWKBx7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPi7-00000006JT2-2L85;
	Mon, 13 Jan 2025 19:02:51 +0000
Received: from mail-dm6nam10on2061d.outbound.protection.outlook.com ([2a01:111:f403:2413::61d] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPgs-00000006JIQ-1ZLT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:01:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YULzVPJCeoNPp4GeXlok1o4Xa/Mmz9eDCs+NV9zpsuTGe5PrEIOysiQwbfaiB2K3/NyCE2xM2pR2cr/rFS39y2RSocnnwrI0VXK+3zlzzzPcuBVXdwIEdWR1Lvy6AGRUyZuAaGUSxGL0pI5uqTyl9uSL5+JrzSeYnThH2f44OVN81WuFBi35UyH50paa4AC20VHAJqNqdveGxVzgLEiotnBI5kB1pYub1OM809GRfVPEe42s0bNas6+NB7NUe5JsZbX2XhDGpwXtZwPJXVgV+ARmJvMmEIG1G6hEueAT01nDkFt6cOpeGUelyWwKefMDlr0XT5rrs9r1Pgka8TXrVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXRBw3xLC8HkupB416xfNOcJbozaIA86suw8QpYRrXc=;
 b=byr/c0dYs9SdgwX0gQG2nqTbfMJdQPleWnAsPU+y3DtkZEOHgVypkE8z83GgPCUvDcmamV/fcr8n33RnaoT3BS3cDR7eYiyRkul9ANDJEjfXws9EGV7ZpnVIDYOZQ59ZHGLOitdCIM9dq/0Wkit5rseplcw02RM3fZlIlkkXH8O6Cpmc93GEg9VbbROI6YPooBMBg3K7v1NDd9Y/qv1TOun33xT2oUzl3+MKPCQd8STqkbmtyrQYPXiXlab/EhKga91R1QosWTUkY8U05cLlex6ynkDZK/lz4FS90CTzpvtVr5xctnf8hVACh4Ig6sv0w1AToCt3VQ1KZyWYtbSkOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXRBw3xLC8HkupB416xfNOcJbozaIA86suw8QpYRrXc=;
 b=HLmy2aTkHPYjqdo1dPfihLv/IaPbMrglQTRSTWNWdWhsFkePA5NMvb1aq6/CHdQ7AslDIR9yiahk4hjZgkGwqwIBNjNKCV2nqP2uXYJxquKvJibG914iMwEPjSHWvC5MNlDgCBRBLUPT02EVdhfMI59tLBQUsgvC9So3NtN6hVs5/n6+IJDBJkXPnO2ooqcB2I2KDih2EphhqYe4x8xpuha46Wn4h9EEwcqoPX2lX6Dn+KLH7E3fTaPA13rT5ri0ZvxLKO9ejrlOeTrzhFt3Rf8q9KA82kKgmjgQb5ugulC0ym72xZ4oiF3DCP/orY+omf8yc8AQUrD4IMCoVNRbSQ==
Received: from SA0PR11CA0045.namprd11.prod.outlook.com (2603:10b6:806:d0::20)
 by SA1PR12MB7151.namprd12.prod.outlook.com (2603:10b6:806:2b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 19:01:28 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:d0:cafe::19) by SA0PR11CA0045.outlook.office365.com
 (2603:10b6:806:d0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.17 via Frontend Transport; Mon,
 13 Jan 2025 19:01:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 19:01:28 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 11:01:13 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 11:01:12 -0800
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Mon, 13 Jan 2025 11:01:11 -0800
Date: Mon, 13 Jan 2025 11:01:10 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<oe-kbuild-all@lists.linux.dev>, <joro@8bytes.org>,
	<suravee.suthikulpanit@amd.com>, <robin.murphy@arm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: Re: [PATCH v5 14/14] iommu/arm-smmu-v3: Report events that belong to
 devices attached to vIOMMU
Message-ID: <Z4Vi9raM/lOot/SQ@Asurada-Nvidia>
References: <03c01be90e53f743a91b6c1376c408404b891867.1736237481.git.nicolinc@nvidia.com>
 <202501091822.4ocbIobQ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202501091822.4ocbIobQ-lkp@intel.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|SA1PR12MB7151:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b91a22-f096-4db8-232a-08dd3404af7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8f5S4/miFkdIvB1saISHe/3iUgKsEsAIdpsujnXd4lUolsK21weuueJ2zc75?=
 =?us-ascii?Q?MWdKM1MDLQOeZxGTMMj4lDb15Dj4KB5u8twnpmVtP1VYYKNcbM14TkXULzdw?=
 =?us-ascii?Q?/mibjGGJLS3eHLEvXC/QaclNnxLa6RQhflKaszhhjth8ovlBumL2I/J1IkTG?=
 =?us-ascii?Q?sSkExiNyRD7YrrB6Ca+e4YmFnZXBeCoXHfOvw8lItI7CbJefu03OU1hpi/s2?=
 =?us-ascii?Q?cmWm9hf8i1YckxbMGe8rjsUuWIjTWgtqmzSHApq0ZaoyWH0F+unA8MiC3Xx+?=
 =?us-ascii?Q?74ePAzt6dNmOLhTFcwrOdWDtolxBlKVSCmbg3/+xm1uBBWpzleSH+eHIT5V8?=
 =?us-ascii?Q?6MDjiT7U8p13tM82aUiXvEkqlAbziRjQBdFp0W/wVuojJ2MEShabtvooKbRP?=
 =?us-ascii?Q?GepjzX7bvUaLuE/g7mftkSZsp9cCmFT8oOyTr+1oDkJjKruezNXV9ZMUJbLS?=
 =?us-ascii?Q?TcThM3sUS5lLdwZQMrwRgFqt8Cs2NqeOHpN+iJ33tMVkqoxot0/0dEAFMepP?=
 =?us-ascii?Q?r8cFO/bW+aovoC0XYg/NfQuGo9lBMFcnpneV/xqfJzbYD3zEBryQOc45OC9/?=
 =?us-ascii?Q?kwbfvc1jmBoXRMdNclgF7C7xVkZ+o+2BcXlq0SxGogB6d91k4Yp9CeeaibL9?=
 =?us-ascii?Q?2gCM0BTlOHBQsLiHffUXCZgG8vsODUDUkp6LUCA4CYqhGjX+heknxCu9C07C?=
 =?us-ascii?Q?2CVn5lxr3gbc4t+O+dWrrypBV+XHCuqEG0tk63TjvEXBTa6fWYHU693Ti2Ls?=
 =?us-ascii?Q?mpPFpLEt426IFO0qI9xcaVo5NOjUf6j3fqd7u735khiZ9OurPLcjlo0y03k3?=
 =?us-ascii?Q?e2LqXeG+w5Oe2I3p0uKrZijaLXAX9UmyG1qWR4ADnMQp+qLXxxEtHiHPtnKl?=
 =?us-ascii?Q?Qd3dy8M44MJacCEZJy1Q/Dn5TllldocLTGze7pmKstkP928ttOSKLAFA20HG?=
 =?us-ascii?Q?u+3jQ8MTroCU8y9aqqJVfz2LcE8mo0vL/5sAytBZ8vjs3UjAgFYy1Q2R9eB+?=
 =?us-ascii?Q?z985WRHjJ5X84PWuYCITNrrM45pDmRBZ0IeGAyVf8LfeBj2fYiuUphc63MrX?=
 =?us-ascii?Q?Jc8bkaB4qdbUHk65COEO/zgIlOs+LRKtWc+kkvnnLysEXNnQqmgTUVrWFXMI?=
 =?us-ascii?Q?hJDOiG36omxjKGyihoXrGdOQTCgahPhREPTdJBfpxOv9quKsy67VA0CW1vkT?=
 =?us-ascii?Q?iW4+2WTZV+iI/ROevf+4Q4NgoCTWJXhKBgj+bvrgYL7OhCwRuVKBNom7kQCj?=
 =?us-ascii?Q?to8hmwQkt2K+EOCuSMyaXBcsykqdruX6CGf0CcPbdXSEqYbR54b8KOpdkIFB?=
 =?us-ascii?Q?g4Fhte857GnmUNWIZ/2FbChdoVF8m8o9+uKQOqZNack4/LCdk4Z/IZhgUbH5?=
 =?us-ascii?Q?A24ZmdC2lfnFS18IDvyGA21RJ77OkJO57YTWsPyuiHj9TvS3iMTuhE9lKTbt?=
 =?us-ascii?Q?Zrum1BKVJKqjHJGSXyXiMjb83+5NROkfPy8zh81vCjK6lDtnplxOlL4FYjdk?=
 =?us-ascii?Q?PRZdQmOWTV7SvBI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 19:01:28.3446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b91a22-f096-4db8-232a-08dd3404af7a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_110134_434180_5EEA157F 
X-CRM114-Status: GOOD (  14.82  )
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

On Thu, Jan 09, 2025 at 07:04:10PM +0800, kernel test robot wrote:
> sparse warnings: (new ones prefixed by >>)
> >> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:461:21: sparse: sparse: invalid assignment: &=
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:461:21: sparse:    left side has type restricted __le64
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:461:21: sparse:    right side has type unsigned long long
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:462:21: sparse: sparse: invalid assignment: |=
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:462:21: sparse:    left side has type restricted __le64
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:462:21: sparse:    right side has type unsigned long long
> >> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:464:23: sparse: sparse: cast from restricted __le64
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:465:23: sparse: sparse: cast from restricted __le64

I fixed these with the followings:
-----------------------------------------------------------------------------------
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index 0c7a5894ba07..aa453e842a39 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -457,20 +457,28 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
 	return &vsmmu->core;
 }
 
+/* This is basically iommu_vevent_arm_smmuv3 in u64 for conversion */
+struct arm_vsmmu_evt {
+	union {
+		u64 evt[EVTQ_ENT_DWORDS];
+		struct iommu_vevent_arm_smmuv3 uevt;
+	};
+};
+
 int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster, u64 *evt)
 {
-	struct iommu_vevent_arm_smmuv3 vevt =
-		*(struct iommu_vevent_arm_smmuv3 *)evt;
+	struct arm_vsmmu_evt *vevt = (struct arm_vsmmu_evt *)evt;
+	int i;
 
-	vevt.evt[0] &= ~EVTQ_0_SID;
-	vevt.evt[0] |= FIELD_PREP(EVTQ_0_SID, vmaster->vsid);
+	vevt->evt[0] &= ~EVTQ_0_SID;
+	vevt->evt[0] |= FIELD_PREP(EVTQ_0_SID, vmaster->vsid);
 
-	vevt.evt[0] = cpu_to_le64(vevt.evt[0]);
-	vevt.evt[1] = cpu_to_le64(vevt.evt[1]);
+	for (i = 0; i < EVTQ_ENT_DWORDS; i++)
+		vevt->uevt.evt[i] = cpu_to_le64(vevt->evt[i]);
 
 	return iommufd_viommu_report_event(&vmaster->vsmmu->core,
-					   IOMMU_VEVENTQ_TYPE_ARM_SMMUV3, &vevt,
-					   sizeof(vevt));
+					   IOMMU_VEVENTQ_TYPE_ARM_SMMUV3,
+					   &vevt->uevt, sizeof(vevt->uevt));
 }
 
 MODULE_IMPORT_NS("IOMMUFD");
-----------------------------------------------------------------------------------

This also fixes the array size from 2 to EVTQ_ENT_DWORDS==(4).

@Will,
Would it be possible for you to ack or review the two SMMU patches
in this series? I am still hoping Jason might be able to take this
after I respin a v6.

Thanks!
Nicolin

