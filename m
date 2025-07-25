Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7105EC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 16:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2Osc/J9AktKUOm2ESBbMztYe/5yoS/Ssd9ftnapSIc=; b=xUJ9pQu30v1lv6tZMvBO9JvOzP
	mu62OcsQvHdEGTljcRYhEmIkh5QNcj9Xn83QQe/DAYwBlOv+6oyh2JkyTsv6hSMeyE3oRNaUNRDw/
	lus4drYKgXURvHHxD1iTl4jIIUbvxKu/Xyh9Olj0o2p3LH+g+/BtQ/tCm6n05XCT3GyBXBJhPCSIZ
	+Ui6srrRdF79mbVNy/BJ3STxz1Xf++K9qbRCQTiyWga4Suq1/gDIy5OLBCflY10Sp/unBkoB6woAh
	OVKWRcPRm6fvrkBoIrmewrnuxo3ihi9fDJA8jagaE/cIJSk30j/1053ENH24jIIfq0/0hbiw6OHg2
	QoSIXoPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLHC-0000000AE5C-3PMa;
	Fri, 25 Jul 2025 16:28:06 +0000
Received: from mail-dm6nam11on20627.outbound.protection.outlook.com ([2a01:111:f403:2415::627] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLDu-0000000ADXf-32ik
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 16:24:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUZNGG/lTC/YMIbLm4FVlI8iLhpagU6Z6O/cF7bHR2rAUvZBW3YeXJFC36+/b8KnGgyOsQFK1fx6ogbxLZXkzkYo9RGL7UCmvrT4p1JKzhcxol2ALQ9bEY+owr2j2AjAHRrKGkCC0xahwA0N5xh5t5T3bVsyeHJ4JxbS24oUODbTuNm+E5E7ZJuCKNOM6RqSwTSMyIS067M5eN5VDFIICgG/1FR1jzI2vrWZ/VwI911bZhK4DSovwIlGbPoiF4fBkIfdcyoqnFSNigKR2q74t4zqk/kupAMmdprxi2pfxxHmBsrDJN8ufb9Av2I3VyURl45XRWLsLuPxiPgRt9MugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2Osc/J9AktKUOm2ESBbMztYe/5yoS/Ssd9ftnapSIc=;
 b=vxUKbsMsUBuDv8L5PaVq76hQRSL5CT5GZAp0NoaPHxG9ZE1N5huYgX6DKJkzEqkG7MiS9vXrSZkJqxIfoxbfR0TN1Dnk801Sb0k+ninGAbGOAc+TVihxSR7lNFvPYGIGjzb5Lm6ovoYfP1F9Ic5G1InD4RituuHZ0T1jYtx39o5jQsQStAuuTB9TYxnyclotA2oiSLpX9UlZNs+H4Zt9C234sSGpfSDQ9s4AfIAogvj5XEMXavta97qcQM9JwMDxaaoxeW8tGL+DLZsEqwMzrxGLthT6es4gCBXQzemy3OBTakWTw+R99Zc/EqNX2pbtTbl3YPD3o+Ij4hfPARy9DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2Osc/J9AktKUOm2ESBbMztYe/5yoS/Ssd9ftnapSIc=;
 b=jOftkMc1C+rre7LLqKK3FklcccKHjrNS4ddL4kyYPclHGhEBqrFNlJfp3kt9v6mEUOyAhW/afkX9/JOM6e3LLqkTY1ZnWj1MfdFONc/iXFDitnyuavfxaXj9GmkEZLD6bwba/0HgN+3Vu3F2IJJNnLzFOPzM1jNu8Vxl00IAhCZvmQO6cHsmwBA1OVsc7VQv65Uhwjq1vrP5sUCKpjWMKaD7AKXzzgKvQ+7mR+ei0L2YwGXUWkwn7kb0uBJe1asq9oSaohoEBVilxrZ/WDJH/pKLr61sybLp4BhCwsvaQLSuU+lKhhhco49Kw6eL5UJxeFJLyTppApkoor0qbtH+1w==
Received: from SA0PR13CA0024.namprd13.prod.outlook.com (2603:10b6:806:130::29)
 by CH2PR12MB4040.namprd12.prod.outlook.com (2603:10b6:610:ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 16:24:38 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:130:cafe::ad) by SA0PR13CA0024.outlook.office365.com
 (2603:10b6:806:130::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.7 via Frontend Transport; Fri,
 25 Jul 2025 16:24:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 16:24:38 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 25 Jul
 2025 09:24:26 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 25 Jul
 2025 09:24:25 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Fri, 25 Jul 2025 09:24:24 -0700
Date: Fri, 25 Jul 2025 09:24:23 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
CC: Pranjal Shrivastava <praan@google.com>, <jgg@nvidia.com>,
	<will@kernel.org>, <joro@8bytes.org>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIOvt+atxTQp57R/@Asurada-Nvidia>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
 <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
 <aIEwzM7mKUI8-h9U@google.com>
 <aIKd1owebUNQeN1-@google.com>
 <aIKqaGMMpsIuAVab@Asurada-Nvidia>
 <aINL66r_1NO3Nx-f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aINL66r_1NO3Nx-f@google.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|CH2PR12MB4040:EE_
X-MS-Office365-Filtering-Correlation-Id: 504d02e5-a138-432c-3d65-08ddcb97c036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lwPbCUEoDWaT2re6UFvXZRBgFG29p9bExk3yTeUWwDKB2Uwyje9+0KWIJwAl?=
 =?us-ascii?Q?3iBjOdehbZihT1mVh4uescvJ6bDCJCme8Z4h9bBc2iTnmYrYYJzB6B3B4nwv?=
 =?us-ascii?Q?XW4ypHigodUGYd/VN4Xr8rwUAOoypYsJsVmL4W7yYHj9fE02QN3WFhN87xqq?=
 =?us-ascii?Q?w+ouUpgLYaqGo/zqBZRSDgxZmNkDVF4LD5QvIEMqwSDqig2KlLYIuvJUNpHJ?=
 =?us-ascii?Q?BjzAXyV257qnX4bu3q+1IRODbrL8PhfhEGt8VffiCE+Eo9imnKVUrnJcIka5?=
 =?us-ascii?Q?KQWE1Ee8cB9j+NCpvT3B9lLnT+4kcAjQ4mm1e9unZ2UKu7iI+8mkONFs5SG1?=
 =?us-ascii?Q?xHftrSrbylS+kc+RMD/tSxcfu5Wz9+ud1VKzDZ9o+kGe2JXSCUawwbbY2SNg?=
 =?us-ascii?Q?eHtxEEpNcOV7ePZwBrjQbTLy0nT7MxHstf9BUcL08QHL7ZN++wPNLO3N5cng?=
 =?us-ascii?Q?3DMT3WmRtBKYu6X1VLZhm/lBUENx6eFsSYjvcIjtxB9oOAi3F1EKYWE2ASG7?=
 =?us-ascii?Q?30RX9YGpkef0AYM5StOVpw/MsinECg+w4IyReJs7MJ2+gcY9hcvGhDCI2k67?=
 =?us-ascii?Q?YekiLjBcoqz2XQoBtDbozqbNzvEmAVrEK4px+CFJsBfZNyrCeegjFDWLf/LP?=
 =?us-ascii?Q?A2PB2TR0+4GPAD3D7nNpYSv65d0+eOKcULTHkpmIg92l/LFdAfXBPofn+cUi?=
 =?us-ascii?Q?X4MyTa6w1Bhp0aZLP0Jl/p8jB/f7ieDhiu2AktDKOWuIdP7mMhH8g3ettnoA?=
 =?us-ascii?Q?onJnPGqzytNdK8Ke6xlLiJCgGS7iuDANDgWAm5TIs7WjlpDqQPjcYE9q18T+?=
 =?us-ascii?Q?oeWRN/KtWThPLJrwPV9en2/fauVWY+cUWuRo/l94ontlRUgTGzz3SOOFVHDW?=
 =?us-ascii?Q?F8W858zwQDZKffbP3kIGdSUgeAAnVmbACDYm9WRkr0wYWbxtzmXq/YQGG08Y?=
 =?us-ascii?Q?P7bB5jXAk+DGzB5VDzW6qNJQOW7uHR5h5r1eaGm6hiRLVNBuYXa0gdIcTseT?=
 =?us-ascii?Q?z437n0AiMKF/xajhlJAWMbMopMG5nBmSmE9Qo+AwMI96Wy4kUf+ATwgTR4gH?=
 =?us-ascii?Q?CUC66qRsgfYtjQm+lw/A6b7yKnqTz/+ia+1LArtW8MFT/FzGvDBZkip90LGo?=
 =?us-ascii?Q?2WWnoUVn+T9pWZwm4tp4FMyDO70jRigMJTXqgWH4fsrg16zecRq7IAAZnseL?=
 =?us-ascii?Q?SEx8+/ruE1YXM0HunIIjhaVoUbnv34/UeXfWuS8PGtMte4Bc3+at1Pz33EKZ?=
 =?us-ascii?Q?7/h/yfbJD0hgbOilTfrIK7kPVyAyoBxDoUnaSRCt1STsfEvh01yztpNSCRVh?=
 =?us-ascii?Q?O7cqjR3hk9PI49ER0ojyu2Ff83EeBM0KM2KPL2t/9Z2iaFFAJOo7A8J4Iy2j?=
 =?us-ascii?Q?aUu1InAK1tWIWJ9Vh1Det4bvtPPqqc0vd9CH6Dh7KV/iU66ya6UbxSn9zMm0?=
 =?us-ascii?Q?FiPUk6EigxfD77LfLPsGRn56sIvGlOns2u4fiyTMwOUfHvQKE99J20Jwlnuz?=
 =?us-ascii?Q?yAcFcS5khneuvwdEGUYQcEPm9NbsYgKKmFvp?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 16:24:38.0329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 504d02e5-a138-432c-3d65-08ddcb97c036
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_092442_767091_CCC637A8 
X-CRM114-Status: GOOD (  14.75  )
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

On Fri, Jul 25, 2025 at 09:18:35AM +0000, Mostafa Saleh wrote:
> > > > > On Wed, Jul 23, 2025 at 01:37:53PM +0000, Pranjal Shrivastava wrote:
> > > > > > On Mon, Jul 21, 2025 at 01:04:44PM -0700, Nicolin Chen wrote:
> > > Had the
> > > vintf_size rejected it, we wouldn't be calling the init op.
> > 
> > A data corruption could happen any time, not related to the
> > init op. A concurrent buggy thread can overwrite the vIOMMU
> > object when a write access to its adjacent memory overflows.
> 
> Can you please elaborate on that, as memory corruption can happen
> any time event after the next check and there is no way to defend
> against that?

That narrative is under a condition (in the context) "when there
is a kernel bug corrupting data" :)

E.g. some new lines of code allocates a wrong size of memory and
writes above the size. If that memory is near this vIOMMU object
it might overwrite to this vIOMMU object that this function gets.

This certainly won't happen if everything is sane.

Nicolin

