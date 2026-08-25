Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35339C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 18:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxQqbuYBKB/rQCG8tD7CF5/rsVfr9eXLg2YoDW/o0x0=; b=MKaHhIZVKFjBFF8srSmSdRTHtK
	1BuHCUhCUwsiAwExszc/2gLrBEosv92XM3O8EO7zSRhPb9negCOBV/7sKy+1JHPN9rMLnuRNNKcOR
	0Qlu4S8m8W0opCA2dDEtQjUOYpvknIKOcpjB09pwNUX6FtbNXT22pIBZ0L99nPJcSciaf5dEBYEXi
	PDCzS9fvmwflYcquI6QcECKQBcVihs0Vid8NzgSzqinMVJcm3zEgSUVzegpnmaDWbdE59XL24UVYN
	u2SarSX81qkUDNDvd9lmkBz9Rd5oxTooWSyVGo/CSPic2ResTYOj6EKi2ACCk9hpRm6sJiVu6F4lF
	feWs70sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvi5-00000001Hmo-1SoM;
	Tue, 25 Aug 2026 18:17:21 +0000
Received: from mail-westcentralusazon11010070.outbound.protection.outlook.com ([40.93.198.70] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvi3-00000001HlC-0eyA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 18:17:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDD+FU0+IvuT1geeGoOH4ZTdL5VJSqBKWDnssY0CaJEIVNEkk/zMJG/IKMLBbx/bdPz44jiRjIIhg8KzzDWcdmOw28dMKTrOmf3iEIpp5KKXnQaSQ6tiFrRyCtz4ugfWjIKrU5O0HkDR4ldsZOSYhlZnu9fiOT2YzrHXy3QhltpJYsaV0E/CCwJkfbKe+8cIoE96WKNWp9BxjMj6p3Bn7wzdiRFVfxQY8D0JHe/ZCFcTMyliimM9U6iRboqh0/0RJDUUw0HRbZ3eRPaHOIZuLfC5Kng0vdveDWUXgPvnZm5MCqJ65hccMJxuRSNZjalTNY+dZ0jf+YCuVs7ONGiUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxQqbuYBKB/rQCG8tD7CF5/rsVfr9eXLg2YoDW/o0x0=;
 b=P7R+sCns9rwAaETlpuFXCBs/YM8gEZQb8UK7hnbfKUuLSKCiTiYpLffHeLZj3dqikiK0Fv6RiAkitB/DMh8AalS1dMD8LpfLTHQ2pxISR3M7TKzfixFTL3FvaLbd7k66RSW068rNYdVFciAfLFA9ew4bharOdsot56vb3KGvME+HyglU+aUt0Qfko6Yk650y3oxOgJV5PH/L4TPdHx7ztIx+bPFE7bP0cjUbfxHVlP1F4uPmjMzQpq3TF7J3A95GK0dKsWrdPAhGgYptlEbGABEm8PS9izpoZzXgPhcvIsUoN+Vf8iGJJ2XYeL7gBov8Na4Fqlt0E/ygyfLTuhbkdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxQqbuYBKB/rQCG8tD7CF5/rsVfr9eXLg2YoDW/o0x0=;
 b=q47PUbnyMApnmctJitFYuiT4oWGjPDSOcgUrZX/AmIMw5rtnH02GZ3idVg+P251Ww92m/8Q+Ub9d9o0yrKQsBk3wOFfTV9swV53Y4jxiu3QznlVm3vEk+fQvOOV3ygW30pIndHYfyy1iWdniLHXBuLJ03+1dNK64veEq0+SlRl9i6ewcnPVckv3Xm1Ea/gk5m3qd3rOcJeFtEZRm08pg1rYQRjz5sYaD/yc7VrUwmr7R2X9yKE3EcNbIOnznCVvkPKJo9ao0r853518f8VGPwpt3QmRNzhze3PaCfU0ORmxuoSYhXF2qtZP7PmZcuHaJi8MZN+CY+oFDLTOdJjRa8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by IA0PR12MB7675.namprd12.prod.outlook.com
 (2603:10b6:208:433::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 18:17:13 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0339.010; Tue, 25 Aug 2026
 18:17:13 +0000
From: Koba Ko <kobak@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Breno Leitao <leitao@debian.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Fenghua Yu <fenghuay@nvidia.com>,
	Tushar Dave <tdave@nvidia.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	rupakr@nvidia.com,
	mohammedk@nvidia.com
Subject: [RFC PATCH v2 2/3] Documentation/arch/arm64: document arm_cpumod
Date: Wed, 26 Aug 2026 02:17:00 +0800
Message-ID: <20260825181701.3-3-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825181701.3-1-kobak@nvidia.com>
References: <20260825181701.3-1-kobak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0035.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::7)
 To CHXPR12MB999244.namprd12.prod.outlook.com (2603:10b6:610:2fc::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|IA0PR12MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 9432af1f-3e20-4d44-9551-08df02d515e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Lpyd+LBG8wiBwtqslCkjtdszL6S5keRi8ohvHtJLz64nI37/Yg8VYHeayNV7/ieGbN3p0SWiK1evQrqCGPstgUk5xlgdR2tHvyO32hY9Gt/l60FR2VzK+Q3R+SxhhnrnQtXXBwUqdS2403ew0zmcINFCD8YOft43ZUvPjsKB6Tek+HLSYVl/5PnAK4Q8p1dxNdDKFkBE19QdB/lzdnIyloxJ4x1IdxCZMO7y93jGlLBqa26RzNhM2EcxsJ3929PL6CtiFiG/p49udeFTP1chjhOBrAXi+VaHcbwHSCpLttZ0/Y3pHAFHNQICqwgjE7uAobV+RPOJkkoByglAjTborKDrCF2b6CVPGqVG4Q+rZovfNxNWDTgRpdV6f4Xrs8uswkHudgh/70mvcNg85yk+agd+Rra90qJvCc5hpYSOGFcXCSDYJU3EpufvtFB9EPhQQMKEPYJ5wR0HDXQpblW+SlYzRqYH5elue9xjnpp1arlJnNYMsibFBTyxVldErcbcLJ5j1cSTifnxYsGdf0zENSOQk/bl4W/okT1qkfwUNuWGAw4o6hN2QfPrA/z0aEIrIlykojz+Wyiw7DhEvt4x3KHnD0MHU9rMiEQHsFe8w9ILcaiD5rkpCszSCgb4JCyOjGE7i7tQFwxLu5ZZHMFsZptEK+E6rDDKgjP67AGubM0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wAXX84S49BOZ+k5lxS/09qTD9gJpHXTM3pATXarBgPmJ/SFJWnL0NNMvswo2?=
 =?us-ascii?Q?HyXJpsyb4xzLvwTxN8fvDgDdL6Hk/wDJFg2yJLZ4QOp+N8ktmctnhbVfKrbj?=
 =?us-ascii?Q?RkTpO1t4PR7MVppScWOEAzjxIJwQAIc9ZrPZd5CT5bq5xl9WqrU2G/n7VB58?=
 =?us-ascii?Q?KDDcnmVnljCd0jrRE4xiKgHvON9QHcGjZ65bp9LBHm4peLycevcjUjwvLy2W?=
 =?us-ascii?Q?UhRCvYkyW2RbNqyHIMyoWuwOeZ+5AKPGYnGdFq8RzeS+OnAzZdZXDHcfgO3R?=
 =?us-ascii?Q?jYqc4DSuR/PcInaWXnZnTuBNCQkRCbaFW72KB1exUZvctn9ur0DxlioUDyAU?=
 =?us-ascii?Q?tveW9fH946qxbr+QTH4EgRQGNYThLIKZA/HjFGbO8gkkmxDUOC3+/WZahyNt?=
 =?us-ascii?Q?snVegbY+cadIXqVv2XG0RF3z05e3QnHsaD4mH0X267vAyjEUsSY0//L9Djdf?=
 =?us-ascii?Q?Lt55Z6dCv36pwmwTR9IfEUh48VDgOJhi6Flfbu8l4eQ3DQLd+3i1ZXTXXZRQ?=
 =?us-ascii?Q?0f8r6THIbqgYW/Arsgxfu4UlmB08tTOY5C/pKdzKISuldwcPodEFoHAPUw8A?=
 =?us-ascii?Q?KMGqLkveGgIV/flZdPsVr1X6yysEOp0Yd5IJSEcy9b2R7FUd+/xfJvsfkPD7?=
 =?us-ascii?Q?1LYI3f4JfKcO6yjbK7Sa+Mo9MmLvkpLhsi+slOAew2sSYqt6bLQUlSp0BfGA?=
 =?us-ascii?Q?bLUW4RyxbAeyRBIOnxcZxfbQ1LEto/ho7plqFfdXy8buGE3K0kj+/DUUqHGx?=
 =?us-ascii?Q?uWa80dgmushR7ALLpW/BZr4Ily6IE4btLyvLV337RrpxLnW/VNKJc6HxpupE?=
 =?us-ascii?Q?HmlPXYONqge8q0yFDjNDwOYBE1Mo5vPY51vxFhG3stxQJjoaHJ3RvITh6Lp+?=
 =?us-ascii?Q?aZ+E9sSuwo39v/3jVoIptToB4RD9t4nr612un3Hkdc7mcbBN64sn6VeEqThD?=
 =?us-ascii?Q?Zw1iIV2UXlxzWKf9rEv3n5XBCTbKmHMOU77Y+L3ct0t9OadLBbfe1JFtPPxe?=
 =?us-ascii?Q?cem1XCXXPQrARLdDiT0FeFLovMwLP8qQGtyY3Nz8HnNXfQFxQXZ4BpQ9jsVF?=
 =?us-ascii?Q?wYindTVYf/OTL4Ne9HcpzGbqwqPO2VneSVFbO67M/jaZsKrrEkGrE1PhQfhD?=
 =?us-ascii?Q?Ra1U8k2lK7G48x1OjNHbB+sUj81Ep+f1YlICznzx9ij+4Z8sthwURea6DB40?=
 =?us-ascii?Q?AR2HX0nQXYI7BoeWga1YqNluMh58RXZV7fRrzGBv4R9PMgQ8ykrnNhROEzge?=
 =?us-ascii?Q?GsbN7bTmaIya+eAoxOJ3deHIRVbOg3p9Jtc9r/HlNCfeQ61zdMZfz9EwIOxa?=
 =?us-ascii?Q?wlzpFmLC1km65T5X1oMlhtnK55BxXJVMLj6wfW7SkdXTgg7BRtubRNTo3ERo?=
 =?us-ascii?Q?P8jVHDKPqZ9EOardBSAIGkLBGbCJdELEXsySAtFl/tkjw5g2+ZLZW8Aq4gI+?=
 =?us-ascii?Q?TVjgXVYgIssM/alrd5yvVMgLSpY/rpJPi4LAJqlyO87W6ROkGHek40u6h8st?=
 =?us-ascii?Q?hQfsu4OKGOQlTQ87kFqRT8ZH8nmSTtatGLid1iRrYKcCc3UUIHvIwP9JieUF?=
 =?us-ascii?Q?uqOatVhtPTEh1zZE2LYRlzKdS71VdVwkCt+GeScGB6f/sDFfZwoAFYoLbARr?=
 =?us-ascii?Q?Zy3PgQWDfMS1Fynwru/YIxzaoc7waCAMjgSVvXf+lP0bp8WRWVaMnjZvyFlP?=
 =?us-ascii?Q?Bk4Z4dRbSA0/p4l42tpXL45Jcxt3pNucS62pMvEHC3rtuYAdd/BWZQAIVIQ9?=
 =?us-ascii?Q?JNb0Gs6jTw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9432af1f-3e20-4d44-9551-08df02d515e1
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:17:12.9347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMW3jiyB6a25wuiFvSKcOiO/GGbCh69p3cTLxTwBcgog6zmz7R+4270l0h5X5cGqmUm6fLG69J+0JrDohdnxJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_111719_286791_7746E9B7 
X-CRM114-Status: GOOD (  18.16  )
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

Document the ABI intent and scope for the new arm64 cpumod interface. The
sysfs directory is per-CPU and is created only for recognized Grace and
Vera profiles:

  /sys/devices/system/cpu/cpuN/cpumod/

CPUs with unsupported MIDRs are skipped without blocking module load or
CPU hotplug and do not receive a cpumod directory.

Describe the common attributes, the Grace- and Vera-specific attributes,
and the accepted range for each writable field. Document affected_cpus as
world-readable read-only (0444), and the six register-backed controls as
root-only read/write (0600). Out-of-range writes are documented as failing
before target CPU register state is changed.

Document the CPU hotplug lifecycle explicitly: the cpumod directory is
present only while a supported CPU is online, is removed when that CPU
goes offline, and is recreated when it returns online. Reads and writes
therefore require an online target CPU.

Also document the firmware prerequisite: EL1 must be allowed to access the
relevant implementation control registers. The interface remains an RFC
for controlled performance characterization, is not a general production
tuning ABI, and should stay disabled by default on production systems.

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Tushar Dave <tdave@nvidia.com>
Reviewed-by: Kai-Heng Feng <kaihengf@nvidia.com>
Signed-off-by: Koba Ko <kobak@nvidia.com>
---
 .../ABI/testing/sysfs-devices-system-cpu      | 77 +++++++++++++++++++
 Documentation/arch/arm64/arm-cpumod.rst       | 66 ++++++++++++++++
 Documentation/arch/arm64/index.rst            |  1 +
 3 files changed, 144 insertions(+)
 create mode 100644 Documentation/arch/arm64/arm-cpumod.rst

diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
index 82d10d556cc89..7275399e33435 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -806,3 +806,80 @@ Date:		Nov 2022
 Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
 Description:
 		(RO) the list of CPUs that can be brought online.
+
+What:		/sys/devices/system/cpu/cpuX/cpumod/affected_cpus
+Date:		August 2026
+Contact:	Koba Ko <kobak@nvidia.com>
+Contact:	Linux ARM Kernel mailing list <linux-arm-kernel@lists.infradead.org>
+Description:
+		(RO) The decimal logical CPU identifier for this cpumod sysfs
+		instance. The file is present only while CPU X is online and its
+		MIDR matches a supported Grace or Vera profile. The file is
+		world-readable and read-only (0444).
+
+What:		/sys/devices/system/cpu/cpuX/cpumod/pf_dis
+Date:		August 2026
+Contact:	Koba Ko <kobak@nvidia.com>
+Contact:	Linux ARM Kernel mailing list <linux-arm-kernel@lists.infradead.org>
+Description:
+		(RW) Hardware prefetch disable control for CPU X. The file is
+		present only while a supported Grace or Vera CPU is online. Reads
+		return a decimal value. Writes accept decimal values 0 and 1.
+		Invalid writes fail with -EINVAL without changing the target CPU
+		register. The file is root-only read/write (0600).
+
+What:		/sys/devices/system/cpu/cpuX/cpumod/pf_mode
+Date:		August 2026
+Contact:	Koba Ko <kobak@nvidia.com>
+Contact:	Linux ARM Kernel mailing list <linux-arm-kernel@lists.infradead.org>
+Description:
+		(RW) Hardware prefetch aggressiveness mode for CPU X. The file is
+		present only while a supported Grace or Vera CPU is online. Reads
+		return a decimal value. Writes accept decimal values 0 through 9;
+		values 10 through 15 are reserved and rejected. Invalid writes fail
+		with -EINVAL without changing the target CPU register. The file is
+		root-only read/write (0600).
+
+What:		/sys/devices/system/cpu/cpuX/cpumod/cbusy_filter_threshold
+Date:		August 2026
+Contact:	Koba Ko <kobak@nvidia.com>
+Contact:	Linux ARM Kernel mailing list <linux-arm-kernel@lists.infradead.org>
+Description:
+		(RW) Grace CPU cache-busy filter threshold. The file is present only
+		while a supported Grace CPU is online. Reads return a decimal value.
+		Writes accept decimal values 0 through 3. Invalid writes fail with
+		-EINVAL without changing the target CPU register. The file is
+		root-only read/write (0600).
+
+What:		/sys/devices/system/cpu/cpuX/cpumod/cbusy_filter_window
+Date:		August 2026
+Contact:	Koba Ko <kobak@nvidia.com>
+Contact:	Linux ARM Kernel mailing list <linux-arm-kernel@lists.infradead.org>
+Description:
+		(RW) Grace CPU cache-busy filter window. The file is present only
+		while a supported Grace CPU is online. Reads return a decimal value.
+		Writes accept decimal values 0 through 3. Invalid writes fail with
+		-EINVAL without changing the target CPU register. The file is
+		root-only read/write (0600).
+
+What:		/sys/devices/system/cpu/cpuX/cpumod/cmc_min_ways
+Date:		August 2026
+Contact:	Koba Ko <kobak@nvidia.com>
+Contact:	Linux ARM Kernel mailing list <linux-arm-kernel@lists.infradead.org>
+Description:
+		(RW) Grace CPU cache-management minimum-way control. The file is
+		present only while a supported Grace CPU is online. Reads return a
+		decimal value. Writes accept decimal values 0 through 7. Invalid
+		writes fail with -EINVAL without changing the target CPU register.
+		The file is root-only read/write (0600).
+
+What:		/sys/devices/system/cpu/cpuX/cpumod/l2spr_cmc_max_ways
+Date:		August 2026
+Contact:	Koba Ko <kobak@nvidia.com>
+Contact:	Linux ARM Kernel mailing list <linux-arm-kernel@lists.infradead.org>
+Description:
+		(RW) Vera CPU cache-management maximum-way control. The file is
+		present only while a supported Vera CPU is online. Reads return a
+		decimal value. Writes accept decimal values 0 through 7. Invalid
+		writes fail with -EINVAL without changing the target CPU register.
+		The file is root-only read/write (0600).
diff --git a/Documentation/arch/arm64/arm-cpumod.rst b/Documentation/arch/arm64/arm-cpumod.rst
new file mode 100644
index 0000000000000..cf4ef9baf165f
--- /dev/null
+++ b/Documentation/arch/arm64/arm-cpumod.rst
@@ -0,0 +1,66 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================================
+Arm CPU prefetch modulation controls
+====================================
+
+``ARM64_CPUMOD`` exposes selected CPU implementation control register fields
+through per-CPU sysfs attributes under::
+
+  /sys/devices/system/cpu/cpuN/cpumod/
+
+The ``cpumod`` directory is created only when the CPU MIDR matches a recognized
+Grace or Vera profile. CPUs with unsupported MIDRs are skipped without blocking
+module load or CPU hotplug and do not have a ``cpumod`` directory.
+
+The interface is intended for controlled performance characterization and
+evaluation. It is not intended as a general production tuning ABI, and the
+configuration should remain disabled by default on production systems.
+
+Configuration and placement
+===========================
+
+The controls are built when ``CONFIG_ARM64_CPUMOD`` is enabled. The code lives
+under ``arch/arm64/kernel/`` because the exposed state is CPU implementation
+control state accessed by the arm64 kernel, similar in placement to other
+architecture CPU-facing helpers.
+
+The ABI remains separate from the existing arm64 ``cpu*/regs`` sysfs files:
+``cpumod`` exposes a small set of named, range-checked control fields rather
+than a general raw register dump.
+
+CPU hotplug
+===========
+
+A ``cpumod`` directory is created only for online CPUs with a supported
+profile. The directory is removed when a CPU goes offline and recreated when
+the CPU comes back online, again only when its MIDR matches a supported
+profile. Reads and writes require the target CPU to be online.
+
+Firmware requirement
+====================
+
+The controls require firmware to permit EL1 reads and writes to the relevant
+CPU implementation control registers. On systems where firmware traps or
+blocks those accesses, the interface cannot be used.
+
+Sysfs interface
+===============
+
+The ``cpumod`` sysfs attributes are documented in
+``Documentation/ABI/testing/sysfs-devices-system-cpu``.
+``affected_cpus`` is world-readable and read-only (0444). The register-backed
+controls are root-only read/write files (0600).
+
+Invalid writes
+==============
+
+Writes outside the documented range fail with ``-EINVAL`` before the remote CPU
+register state is updated.
+
+Open register inventory
+=======================
+
+The first RFC intentionally exposes only the currently validated subset. A
+complete documented-field inventory, including L2CDP, should be reviewed before
+adding further ABI nodes.
diff --git a/Documentation/arch/arm64/index.rst b/Documentation/arch/arm64/index.rst
index 98052b4ef4a1e..9e085ce55d9c4 100644
--- a/Documentation/arch/arm64/index.rst
+++ b/Documentation/arch/arm64/index.rst
@@ -8,6 +8,7 @@ ARM64 Architecture
     :maxdepth: 1
 
     acpi_object_usage
+    arm-cpumod
     amu
     arm-acpi
     arm-cca
-- 
2.43.0


