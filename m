Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03201CE8D65
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GnAni0z0+nGCMgjbVP5aUBSduJvn/0sMF8C8HoJvpIA=; b=iwC/5nk0TD52pu
	7HYcl0QGCw1awBO31l96RtQymQv/SCu6T/kb8KUfLiSjzC+qDQswbDOKMDHsgHycm7YRfgZRd1oce
	712CkQxvcd4N32IqfpjFNFjh/yBrs1IoJywnfLEAp+ONwwlhZEV5C6WXCgIS42qjHjmgOLGBBpuKw
	N2lmhJrWAx37Y7MfiwvwwcTM4/G6gAMkmsqd8z3F5p2f1bf948PTDFwBVv372nnxJQxl9FWRJzJiZ
	aAB5WvHKFXjj1w5EKKc3bJUxin31kdgWYas9qfUh5MZHhMCfNHJi2EcC+r/eT4LWMmoMhpyCu10QX
	3MVo6qlnqydKVKrqGDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxZB-0000000Cpzl-0FwI;
	Fri, 14 Nov 2025 17:26:33 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxZ2-0000000CpvY-0jVd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 17:26:27 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEH2Z6N2627446;
	Fri, 14 Nov 2025 18:26:13 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4ae4y8rwet-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 18:26:13 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6DEBiVm6WWDVwee8SVL3NukAvKWoX3DvBp7WqqP0j2Q0ojB5gr0E2y7IxxPLai3EP6fhWsvk6rwXlH6BJXoQGu2voN+9dwhM2HHxFPSQpfWtzE72Tsk4DBh8s6XhyCRTh3/vDc5vCMFrDiYj62LaNKIMIfAPNCAl5pXxeWXXL06O0Abv7uwFYGhwE1xHAhTqvC04dibxIL66axa7alFw67N0dHgN1qh9gGsdrFPoaxJqlq/RgAK4wXT9pM0pLdIiitMzjYMWlYeFwnnyhpuTNWRR+329r4d2CgOW7My1skQZUd9t/kGQIAtJQiIvw1wQlf3GXPtvp3aZWN2qPZucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnAni0z0+nGCMgjbVP5aUBSduJvn/0sMF8C8HoJvpIA=;
 b=iIiGYJg30Yq1BPZ8gy8sah05G77KFxda9oDlp9A4/lP1L9Dc3rfNreJtq5JnmiYWIT2WKE9ll2oCkQTjRAcGBwof+8UTpcbeqP20vcSrIka27PsqtFKW3JwGV8fptWItO3qGVi/vOZuGXUt1tkpqIuWYdqefexsSTc5czzssZtwkfpWOjeNXBXT+kcU5klcWo44wBgt45jY5dhFKSm2DyBX3I6MQm/kUdxqn8ZuVK7ak3NCv6J4NX3nmbnJ5PG9IVtejpNfQa1BFJ0jCxf5UKg1d/63n58PvbCYCDUD6oV8xUVYFK7BKoX84Om+28k2Psa1egIRC63GIvn1yQ+lQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnAni0z0+nGCMgjbVP5aUBSduJvn/0sMF8C8HoJvpIA=;
 b=QtQUj/r80ui3STXYd8Eknazj/Vbf3mxttg/vvIyh5phG+l7vNCEoPgZ/XYmrCnXTUz5dr7orXegP194hMSvHluB/Y0+IsC15WDIxs9MV2YIJspwGzdJRWvigakT4EJ/Qp2LqlBqat8faVwAOmZNK3zz4LCZ5w+9Rhfokcq2DmMW4+QESaTgS8532X5gRx40Kk/KwqpMz+gjv5PDq9+dxzFdwteE4hT6LI3QP+3ej1Qe+BlrvzbhGphiTja8FdDDECI6oWzrt8CDu+cEo2a0Vr/1TpfIj1qt8u1sbMoLBfmmu7/43AGj5Go6ABLpcPufORVrD2IOqXLCFVMVS3Uguwg==
Received: from DU7P251CA0010.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::27)
 by AS8PR10MB5877.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:521::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 17:26:09 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::c7) by DU7P251CA0010.outlook.office365.com
 (2603:10a6:10:551::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 17:26:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 14 Nov 2025 17:26:09 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:26:20 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:26:08 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v2 0/6] Add boot phase tags for STMicroelectronics boards
Date: Fri, 14 Nov 2025 18:26:00 +0100
Message-ID: <20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAChmF2kC/42NTQ6CMBBGr0JmbUmnYPxZeQ9DCMVBusBpZgrRE
 O5u5QQu30u+962gJIEUrsUKQkvQwK8M7lBAP3avJ5nwyAzOuiMiOjNHTULd1M6eObVROJKknDD
 O1Wfrra899pD3UWgI7719bzKPQRPLZ79a8Gf/qS5orLEeL1hVJ7RU3QZWLTWVPU/QbNv2BevMB
 97EAAAA
X-Change-ID: 20251112-upstream_uboot_properties-22480b0b4b1c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D03:EE_|AS8PR10MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: 9213297c-cb78-4f00-3b80-08de23a2e6c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlZDNHV0R3hHSnllSHZLTzZ1ZmFEKzNiQm9wTTlUbi9HTWw5dnBTblRmVStx?=
 =?utf-8?B?UzVzanozbUlrdDhtSlltcXFYWmtDZnhEV21JNW5CVkxYYytHNTJOWGhDeG51?=
 =?utf-8?B?ODNMWllJSjM0dENtTVRzdXVUVTZDcUZSNXd0YUowL2VaaktKNU5YNGNjUktt?=
 =?utf-8?B?WlVyQXRpR285eXNrYW1xNWlMcG4vOFhIOTJYRVgwbmV2RHNzSk9GeXRackEv?=
 =?utf-8?B?OGZaankzd1JaVUlCVmVUZkNxajA1UEd1d3p1a1d4cUNyTkFqWlY5eEtDekww?=
 =?utf-8?B?cEhTMUZJaUtlMVlRQm1RLzZTeG9vVkQ2U1ZYZ3VyVnNieEVyTFlhQk1tL2Mx?=
 =?utf-8?B?b1RaODJuR2NqS3pINVFJZk44RW93aUZVMnE0MEw4d0VseGU5cEc0VXVjZ1py?=
 =?utf-8?B?cnZCMmMxamJIZ01reXFsekVjclZHMWszOStGZlhpQXpQT3JnKzEwRDVpVHFw?=
 =?utf-8?B?U2sxQXViT0luRExydVJjemNVdW56cHNqVXdrY0RMSjVrZnNYUkw0UGxzRFQz?=
 =?utf-8?B?SFdINTBMWXRxZEpSMUppa1dzc1BVNEYvUWlYWFZjL3lHWUJ2anViY0orZmsz?=
 =?utf-8?B?N3VJam9OY0hmVVNodmFwUUlNblJkMWRFQXZSM3JnUnhGblFMLzRxTHJYQ1cx?=
 =?utf-8?B?eFQ5NDhUWEdrMHZoWlNKaWRYVm1QTFBHREE3Z0RaSVFHanBOK2Q2Ym5ZYWFD?=
 =?utf-8?B?N01GRDJmZFY5UUYyQ2hjRlE2dEd4dDAwM1V4NExuVHNOZ1cxVjJlQUQxOExj?=
 =?utf-8?B?SDBnS0h2bUw1ZDlrUHJBVUduMlFXYnBDTk1aQ0JmWUJndXVIS2RVT1JSQjNN?=
 =?utf-8?B?TTFEeEV2aU9sWEMyWkU3MDZRcTgyQm1tVkJaOGdod3BxZVJZVUg4M2dlRWk4?=
 =?utf-8?B?WExFdmthaDR3ZCsvQXlRdmI4WExOaUdmL2h5SmYyTlYvZXowY1lJSEZhd09V?=
 =?utf-8?B?OCtnc3ZqOXdDYWx5WUpRRVE1blAxOE1RcktFL01nQUp0Y1g3amFuTFBUWURU?=
 =?utf-8?B?WHpmUEV1N01KNUlCWGtjNmtjQnNDcGRrMWR4enA0LzZyVXowZUxtOXduYXMr?=
 =?utf-8?B?NmpzWVdVVXFPbEhlMHlraGJCQzU2eHlzZzE5eTc1MDRJd25Jd2ZjYVI2M1Nu?=
 =?utf-8?B?QllrdE4za3BNOUVZVW9FM3YyRWMzMDdGeDlQRVR5VUpZUXNvYTBqbzZWbWhP?=
 =?utf-8?B?MWsxTEJLeGw5QkI0bGhzL250QUdVRlVkclA1RGRhcHVnMmY5ZDlLZE5BNzhH?=
 =?utf-8?B?TytJOHZJQks0aWVEZS91TlAxZElSQTFpQ0R1M2hpOFBwNmRzY3NpdElXZnAy?=
 =?utf-8?B?YXJnWXJDcVJ1SmR1Ti9LeTRiQ3hRZEx3cHRaQlJwdDFYaktaQ1BLMFhyN1U2?=
 =?utf-8?B?QkdYWVRnemR0RFV3UnQzN1RUd01jbGhPazlVbDAvN3d4cnRWZW1yRnRLWXZL?=
 =?utf-8?B?QU9YQjNUZitJL0RSYStrbXBveUdSR2FaVjhDcXhubnJtV3pCL0pmR2hXSTlL?=
 =?utf-8?B?cm5DNUtBQkdzcjZPTDNYeENOeW13NjZyZEJaN3I5eUZqd2FjbnVCYkFmQTB5?=
 =?utf-8?B?SysrUyt5YTRzaXJmRE1vSHdsNHBVbEwzTHFvYVduQm5JUXJZclh1alJaVVRq?=
 =?utf-8?B?bk53b085dVhPNXRDQUxSMTg5WjZiMmg4SFVEbXJpYU5yYmIvaTZBdyt1NDlk?=
 =?utf-8?B?K0kySTFLOGh5K3lLZEFPVHc1WTdpUjRXSjhnUHV0N0pub2RiR2dsaUR0SFVw?=
 =?utf-8?B?d3VsTjNQcHkyQVZ3UnBnV0ZSY1VPc2JNdG00UTl1WDZDdEVsbTRMOGZLZCtQ?=
 =?utf-8?B?dUxvV3diVzV3U05vTkY0RFZlZFlaV2FRY0dNNkhuZVdsRWJzTG9VWjRWOXNp?=
 =?utf-8?B?a0pQQ0F1SG52MDk4aTQ2UEVMdFQ5V2p3VWZFM2xyR3BmRkZNOHBudy9OdFAr?=
 =?utf-8?B?THQvVTNwV0pxUE14RW9PRFlSTThKWWZTZXl2VjluNytUR3QveXJOKzVzUFZW?=
 =?utf-8?B?eHBCVVJHYjk2ODJHS3ZNamRvZzJ2WE1xSXJkRGx6QjlqTld5MHRvT1E2RG9Y?=
 =?utf-8?B?cDFjZFdsN0NJbzFEeTlZdnZTZWlyVi9rR2NsZEhnU1c1Q0V4aWtiZnF0cTBU?=
 =?utf-8?Q?4NJ8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 17:26:09.5185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9213297c-cb78-4f00-3b80-08de23a2e6c0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5877
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE0MCBTYWx0ZWRfX273J+Ytd2dIN
 Zb4Hz0/oGkPLvB4mewa8YSB58XHrQ94YsTHVNFhSUOxioheMHHxNLXRwE2KzzMYkmQthX4Utypt
 FrwdyTkgDfIRxczdnU/nS9UxwxIqmA39/Hy2kCKtxn+1ECLIEbCPNT2tb8pcLZYSp36R5NWeHYJ
 aFyyGljRr5otnvYsHasVg/bAb+yhBTgb37oWfn9uiDLp00OPN+MmiV/BHZiuvxOjK0Sy5HJ9mGc
 +B7ceUSHu/oxweWLkcZfpOYZTvmmyVEpECp0PYkVuuBAvcCpfaLc2/vOiqx3z8++FD68DsL/ZrP
 GJAqqnWrMPL0bZk4bX5vlMObUKZsPQlYaiF0B4u4ZXKIVX9+7cyYGhpEdL+5oCijHosgFO8NCMc
 acvVEN9aSeMpsKeZIDO7LZfKbPCeXQ==
X-Authority-Analysis: v=2.4 cv=ZOraWH7b c=1 sm=1 tr=0 ts=69176635 cx=c_pps
 a=OoqrPP89fG8PzfUgsW4dTA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=HILBdA-kGuq4vTFu6uoA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: weAIv4Tt1x4TCtbnopKo4Eico46SdRNc
X-Proofpoint-GUID: weAIv4Tt1x4TCtbnopKo4Eico46SdRNc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_092624_588965_9EE1DBFF 
X-CRM114-Status: GOOD (  10.83  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.
    
To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v2:
- Fix 'pinmux' is a required property for arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb
- Add bootph-all property for lvds and ltdc nodes for stm32mp2

---
Patrice Chotard (6):
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics f4 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics f7 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics h7 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp13 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp15 boards
      arm64: dts: st: Add boot phase tags for STMicroelectronics mp2 boards

 arch/arm/boot/dts/st/stm32429i-eval.dts       | 11 +++++
 arch/arm/boot/dts/st/stm32746g-eval.dts       | 10 +++++
 arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi     | 12 ++++++
 arch/arm/boot/dts/st/stm32f429-disco.dts      | 11 +++++
 arch/arm/boot/dts/st/stm32f429.dtsi           |  9 ++++
 arch/arm/boot/dts/st/stm32f469-disco.dts      | 12 ++++++
 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi     | 11 +++++
 arch/arm/boot/dts/st/stm32f746-disco.dts      | 12 ++++++
 arch/arm/boot/dts/st/stm32f746.dtsi           |  5 +++
 arch/arm/boot/dts/st/stm32f769-disco.dts      | 12 ++++++
 arch/arm/boot/dts/st/stm32h743.dtsi           | 19 +++++++++
 arch/arm/boot/dts/st/stm32mp131.dtsi          | 21 ++++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts       | 11 +++++
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi      | 26 ++++++++++++
 arch/arm/boot/dts/st/stm32mp151.dtsi          | 29 +++++++++++++
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 14 +++++++
 arch/arm/boot/dts/st/stm32mp157a-dk1.dts      | 43 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts      | 43 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 14 +++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts      | 60 +++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 25 +++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts      | 36 ++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp211.dtsi        |  7 ++++
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts     |  1 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi        | 22 ++++++++++
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts     | 11 +++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 26 ++++++++++++
 arch/arm64/boot/dts/st/stm32mp255.dtsi        |  3 +-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 11 +++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 11 +++++
 30 files changed, 537 insertions(+), 1 deletion(-)
---
base-commit: 53c18dc078bb6d9e9dfe2cc0671ab78588c44723
change-id: 20251112-upstream_uboot_properties-22480b0b4b1c

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


