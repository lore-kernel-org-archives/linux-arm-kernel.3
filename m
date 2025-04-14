Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BE3C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+vtWUHKmBiFnBRpCp8inGdVeqctV42pWnJAm0icIU4=; b=bQXaoekyluWJmXSoZBLm2UD2Zv
	UMTzxzwbIIpt1NhHfpgYh5A9t2BvwtfBRhKHrcFaVoEKNpmt4IwVYwXaAMEx7hckeXb3IMd09Ys4a
	grIonruegXUwYPsC6pkioOfTp70xE+mbWuFSmslZdG8QZTPn7zNgsU/m57yJq1ztEhDAXul9GxQ1k
	ByJXgeIGf5xCKoUwuGFxzh7q0u2rugFq9MXbFW6l8rbvCXY+QMYhdQnjGqKBG7ycQQQ9fcwMq12jn
	qQu/5P/AHQRbUA3mgpezKsW4coa/zRRa7cNI01INXCF7xOD6G1OUr4UUGzIRcTAuKQqVXDeTV1Dms
	Bbg+2iww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KrV-00000002Oh7-2UEI;
	Mon, 14 Apr 2025 14:32:37 +0000
Received: from mx0a-000eb902.pphosted.com ([205.220.165.212])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KhP-00000002Lxe-3U7v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:22:14 +0000
Received: from pps.filterd (m0220294.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EAsWNB003262;
	Mon, 14 Apr 2025 09:21:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=e+vtW
	UHKmBiFnBRpCp8inGdVeqctV42pWnJAm0icIU4=; b=ggmnvdCcq5CMVUqMNKrsi
	mewnWBX8fYY+zGJHuYFvZVllqggg7iKVA8J/i1TaF15Ygsqa3wxQT8sFqKuiuGyc
	ZEnMUVfKIvu4NqzKyiNAiS3mXuZwUSJDllKenq1zqrK/57R9gvxgHViAh0uJ2t32
	pPfJ8zA+cteCFbXC3sREIDW74cR/CXCdqiwKvhq2NeEdq4YwD+eCvGMjrL1qQRmA
	sLkN4FgRNsoD8SzyjIk0H8j8yZVJ9qiWCK57uTeUIWQ5tzswm098p4hUgvdskyzM
	GRLfRcRwvqIlHbcTTlT5RGMGqmTTeTCGPpS2awR6n7jmZlkQL66YSQhNLwB6Vlng
	w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010002.outbound.protection.outlook.com [40.93.13.2])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 46110drf5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 09:21:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bY1f3XyYT9Eyxv+YNM1qvtETY2Uek+ar4XqSqR//1kLiYdDIx2dM2aLE867zeJj9F7H++pmWbdJcphwVjTEn/f/wVCrSPzoZDRVh15/NAoFsxGNTy8E+fXYxauYnnZL073OwY2W7KgQgnarBU/pWRQZInScmMJG/DY7v7i5DBEQpDpXJO8pJEeWpUFpDoHNSbfhmarZWLodIbD8qLt5T8F0Oco378UgDRzIGY/2BR+Fp09XhHaXe80HGLDRVs7QwK5GFrdp6EY3soJrPGdokqeYwSoZCWTXAslYXrA8Cu+sEOqQooUEZs6xtR8/x9AMQxM/AW/J56UVtgcyPdl+SjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+vtWUHKmBiFnBRpCp8inGdVeqctV42pWnJAm0icIU4=;
 b=UQwyb18O9KdSx+vxz8OLLBcLhif1ACgVfi+gTKlGTLHSv7MD2osHS1CH+jRvdNAsnAL5cXHNhY0GJKUlSjTOJNlvi5shTxJZOx9j6UAAbGbb8n4IlFobibEhDR2PLss8dfncrnOC8B2ofyTWTJtZdNIKAoMUJiLaybO70KyYgI+n93SPQ7pAFUr68LK4P+nV/hKoz4dR8mPG2FMhfbeNQLsXwTN557ajJyuUf6yi0hsVAbPSacM424O0VL97k6pGb8+FN2j1YU1Wvexf8lrpPqU79LH49F4x/rc80lr0CQA/7MLJRex0Zs9e05WVk9e1h4in1UzW1Iq5bSyvZUc9tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+vtWUHKmBiFnBRpCp8inGdVeqctV42pWnJAm0icIU4=;
 b=ZEbIHhfMYX7dYzVmatDd5g/qPas0XomvEss4DTlrfxUN4LB08gpZw60FXdhOHf4D6k8adeBGudqMMcOATUJNWBwuC/HjsMkhCdCCfpwXibEHrFqHiQgDb+uw1rXhhQBMnVjOpiQnZ4X7CucbdGz/LJR0ZHmKX4k8R8YUrKtJogKqq+Nk0v7gjEflRSIV9+wN/oRmXncDyNLBWpxgYts+vhkyGFrivVEvMPqypbUQUDhn5eExaNjIKkwJXZE/fc6wHBIyNNp99Ag/C6HduEuoMqeuEwNhIFO7o5CSD/oMmKKJAaOcnUtxRjvk5VB19zN0473X61l+wP3Aql7VBsv0Bg==
Received: from BN9PR03CA0100.namprd03.prod.outlook.com (2603:10b6:408:fd::15)
 by CO1PR04MB9628.namprd04.prod.outlook.com (2603:10b6:303:26d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 14:21:57 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:408:fd:cafe::31) by BN9PR03CA0100.outlook.office365.com
 (2603:10b6:408:fd::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Mon,
 14 Apr 2025 14:21:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.4 via Frontend Transport; Mon, 14 Apr 2025 14:21:56 +0000
Received: from cv1wpa-exmb7.ad.garmin.com (10.5.144.77) by cv1wpa-edge1
 (10.60.4.255) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 14 Apr
 2025 09:21:41 -0500
Received: from cv1wpa-exmb4.ad.garmin.com (10.5.144.74) by
 cv1wpa-exmb7.ad.garmin.com (10.5.144.77) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.34; Mon, 14 Apr 2025 09:21:42 -0500
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 CV1WPA-EXMB4.ad.garmin.com (10.5.144.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 09:21:42 -0500
Received: from OLA-9X4GN34.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Apr 2025 09:21:42 -0500
From: Ross Stutterheim <ross.stutterheim@garmin.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
        <ross.stutterheim@garmin.com>, <ross.sweng@gmail.com>
Subject: [PATCH v2] arm/memremap: fix arch_memremap_can_ram_remap()
Date: Mon, 14 Apr 2025 09:21:40 -0500
Message-ID: <20250414142140.131756-1-ross.stutterheim@garmin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414133219.107455-1-ross.stutterheim@garmin.com>
References: <20250414133219.107455-1-ross.stutterheim@garmin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|CO1PR04MB9628:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c2ee73-9062-47a0-1026-08dd7b5fb659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Jd6gkP9O11aRFsv2O2dNzkGmb9XKabYZKWZ2Ae92lGFPqt/8/NXXwdOOe9y?=
 =?us-ascii?Q?HWDAYgx+kKnvBMglZ/w092fbkCcFuvMPQQbvy1p7TOGKptVA5/MtiCFHK/1c?=
 =?us-ascii?Q?Sbf93zxoEsqvsiZs9jmnfiJ+tL5n3qe5fJ8mVxfSBTrdIa60fAMX2l+zklom?=
 =?us-ascii?Q?DFqeRAbxldxMh/Pw5Quf7WZLek/ESVRnLmkWB0Rrg6sw1KX6PnBymG/ZThrP?=
 =?us-ascii?Q?6PlYlve/VTkQ7nlBuFyfkdZWPhcXc8oqJQ6YAHakmRKh/oHjb5IOmI9rwyUI?=
 =?us-ascii?Q?2QrvkrDSb+w6PEhD5D8V+PGrrjiUfS15Bm38LrcigQb5fp4cL5V7BB2n8ynI?=
 =?us-ascii?Q?Ahnp2yzXS1gvYKSaLr1DVivO7nWPIeKAVtcDxSCuykPq6wUPl15Y9uFA49cM?=
 =?us-ascii?Q?c5DPRPoExV29qwQ1LulId5Abq7D575RexOD/szPgsKwGPrYgdGPpmVJWBSH/?=
 =?us-ascii?Q?890VdaUalV9C5VMYd1Rqj7nqBiwdN7WxIcgSQu7d15VyqArs8itA2JZyuHeO?=
 =?us-ascii?Q?pJ5E1AmdTWL51oEiDqUK6UpkaOPNVXbUbv62gvnFrUkyNOpuWmZGhK5nZOx1?=
 =?us-ascii?Q?2/6jz190iL81pKehO1c/hdqkV2lyFVwIbgbo4PJ5Ej80bBbKLY0oIPu4EGrR?=
 =?us-ascii?Q?6ORtIfsR8B5Ft56wbn8SaQF/jnAnv6lncLKjNhzpENqyLMBoMvTYkWOHIf83?=
 =?us-ascii?Q?4+b6cv/QdRxoLumJ8Mc6hNo9IwviLr7bahdzBm9+fXSyybDey4hjtGmJPYs9?=
 =?us-ascii?Q?VicIbOfEvmwRBKwYGNQ1Z6FJubRY4eIMbQtFDQnWpY45XSfF2qUnndjNJeYl?=
 =?us-ascii?Q?f0ZGS98OYj7UsITXMKExYay3BVFywZ5HT4roIumyVrDd9SOS4pgq/Pjsw1oI?=
 =?us-ascii?Q?66cO3T5+3xbKEfzYsSByqBhYyr12xr59p+3dUdpmA1BW7T/rsgzd6RYW2OCR?=
 =?us-ascii?Q?qU+5Ki0H7XkmB7L4Cy+BsqfzOHFx4y6+dDO3UNAQJCOq3YXGm7+R867cNVQQ?=
 =?us-ascii?Q?5gz01H4DHJwijUMRtFZ++NeIyjUN41Vp/VQycl30aT6nk3hKlO+7t8LxjwrI?=
 =?us-ascii?Q?UTIaEdKouo05kbpRPf6aRSxn6QIxhjIo2Onsgfc1Wo98+DWHCRQ9Xl8yVOlb?=
 =?us-ascii?Q?cNSFZlWDoG98ZjIKSHWg4YDg61YZUG8YckXPrelO9g3nZxIuWW/1l/XF5FM7?=
 =?us-ascii?Q?6NdIJc1io02PAh6HK76vqTT5pVfYvNxQ935sFBvPOsuuJ3QNDopoXJSjj9qJ?=
 =?us-ascii?Q?Ob54moT/LGKtwGJKeoGFsNiCxHe2pwoauZ+rtc3O671njaxPtNXp45LM5Cc5?=
 =?us-ascii?Q?j0nNRfIux0hXjRIDFwWlXF2oi1TaGGECDrHXRJoHSUhQM+niS+iCA1MGcAY+?=
 =?us-ascii?Q?VP7WI5GxW5XHA4UzmBSv/+4R56xUgcS22X2FDJM+LEbxFabfag1uU1RJvQ6c?=
 =?us-ascii?Q?SQb54X91JCVon9nDaQZEJZqLCLU7ZPRklPJeaXKtMrJwpscB/IYQzXSPUTC7?=
 =?us-ascii?Q?bHDs7w/9kK1VxD48sCNUPa0vDA1VW5YBbpH2?=
X-Forefront-Antispam-Report: CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 14:21:56.6667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c2ee73-9062-47a0-1026-08dd7b5fb659
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB9628
X-Proofpoint-GUID: OWecP9cfBfDdOJgiLrgnFgBOjEjk9gJl
X-Proofpoint-ORIG-GUID: OWecP9cfBfDdOJgiLrgnFgBOjEjk9gJl
X-Authority-Analysis: v=2.4 cv=BPizrEQG c=1 sm=1 tr=0 ts=67fd1a07 cx=c_pps a=rknZK0v7KRh+kGA6vhtu4g==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10
 a=qm69fr9Wx_0A:10 a=NbHB2C0EAAAA:8 a=9gHwPnI9gB-c3_oHrSwA:9 cc=ntf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 clxscore=1011 mlxlogscore=999 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc=notification route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2504140104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_072211_876185_547997A8 
X-CRM114-Status: GOOD (  13.59  )
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

commit 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure
presence of linear map") added the definition of
arch_memremap_can_ram_remap() for arm[64] specific filtering of what pages
can be used from the linear mapping. memblock_is_map_memory() was called
with the pfn of the address given to arch_memremap_can_ram_remap();
however, memblock_is_map_memory() expects to be given an address for arm,
not a pfn.

This results in calls to memremap() returning a newly mapped area when
it should return an address in the existing linear mapping.

Fix this by removing the address to pfn translation and pass the
address directly.

Fixes: 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map")
Signed-off-by: Ross Stutterheim <ross.stutterheim@garmin.com>
---
 arch/arm/mm/ioremap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
index 748698e91a4b..27e64f782cb3 100644
--- a/arch/arm/mm/ioremap.c
+++ b/arch/arm/mm/ioremap.c
@@ -515,7 +515,5 @@ void __init early_ioremap_init(void)
 bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
 				 unsigned long flags)
 {
-	unsigned long pfn = PHYS_PFN(offset);
-
-	return memblock_is_map_memory(pfn);
+	return memblock_is_map_memory(offset);
 }
-- 
2.49.0


