Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A97C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 20:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=60/HjgM1ljr9pYdE6AhUALWHKzuz4qfofab4QczpkA0=; b=K7hIwXqI9M9we7MkDLF5CazlTD
	Zaah4nYWRuPKXv6bEqZAH62jjphWn3VXlUZKKeUH54iQ+ZBrD+EhaqVxezBqC+J756XXAeaqm8aEd
	g+pbOsNEyBmW4/hGeCsqpuU91W5tuxmIpMyLZs43WLkeUbuzW6vn1hJl+byxiS6iP1WgsgIVtq4jU
	f5I561XZeeMM9hwL8ij8p7d2+wBuy7o6hO4jUKXjZ/Cy5oKjw8jqhzlYDEenZ0v8LMQR9IPYPSMEU
	PXIg71kuq6UWlPSWbW12vx8TqddFYTmiHpfkwJI1D/U+U+1ZnFD9BszysYYLG2TQ1HQ+FJNh1A4zK
	xTHaandQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnMaS-0000000HDz3-3Sf2;
	Fri, 24 Jul 2026 20:33:40 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnMaO-0000000HDyh-2Gvb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 20:33:39 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGss8p1568489;
	Fri, 24 Jul 2026 15:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=60/HjgM1ljr9p
	YdE6AhUALWHKzuz4qfofab4QczpkA0=; b=RIoNFNCZbV+Qz6uvKHDI1JB5dZeg+
	LOX967z+6xMC5qe/mVeysCj25SlB/0tg8ZUAASGicSTn81rp5l95eoPQW68g/GiX
	wgllnvu7PxQep3TetcLPH7jRWEjyskUWharVwtohozV1fBwyoQmMyyU4DsSdSGtp
	tDBsPMmGm0M16qy2yP10xInLUu6U0sXIpa9WU4SNzJhFq6jL4WHuPBalvO2CR3Hy
	gmWOQKASA1wp+F1oIVoNJj2yLOHcKtV7euK5bd3fIVZ2LTM6ScV+dz0QCEP6rMvq
	MiSgwZLl+2yzox8tF9RtA7r/5rHyjDOwUG7Fh8XRnSGxre3H6yBHFXXPA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010013.outbound.protection.outlook.com [52.101.85.13])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fm5p33186-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 15:33:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCnl5kZLQN0qVHwQ16lhrWfJbgDaqtMQ0Ol5ED7D4qz8K209uSjh1dD5MnaZtzWs7k1fzUgp4s5Yv3CwP5Eg9R/zMzjyOG+TZ5KGM2lVWgOa5mERGfmD7XC/s3gbLeo9atDABFhrGkiV8raDeRiTBi/jez9mfV98cHyQMcgtyiL9ZoVmKkRX6aV+a9sBoPw0iudunUTp5hINWhgZuEYjDhmZROsVvrfAdbubslzFLxenVirXVixm4wDduj5FMvxz/B5HMJ0lNY3DZ+drgAU/igk5x9JXHQX+XbwZLCAzg0642EGP+a9HgHVpsS/ACYDBP2n15so2OL2ZYn1P9xpHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60/HjgM1ljr9pYdE6AhUALWHKzuz4qfofab4QczpkA0=;
 b=CnLVLBs51UBcBkMfX05j3AEypSBCiP+ozju/J8FckFnW/JlOg/n0cuMiFvfrjsroumlo1q3U5hHk2082t9Z8ne8GH9i9Sd3l1LLK5GzlYxcdPcp8CrB126ORbzUwsZ6PU9URmqPph2nBx690zcx1rJJY2IMAFHIdRkUoCH04iX0yf4wnRs9nz5W3Tr5AI94hJJonzQmLumLPAz1AHnWZBk7ejz/d5+QcAWDqoAgeQQ0bSR0VxTLCysp83bhpkdkkW7qdL4Y0Py+isljbcsuqDQ/alrBYrCMNJmwL9VTaGUe3lleudx2BvRWzdV+0fZJWNVkJY+Iq3tPcsj4GiZFeeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60/HjgM1ljr9pYdE6AhUALWHKzuz4qfofab4QczpkA0=;
 b=io6Vg/F/5bRSpsmutIyR4m3qH4t43voRthVUzFWlEtqMklV0W/i0PeNjPl9+n/0DA0bEtfxuMbATovlZRWl1NPjNl5zADzGa/SK47K5k9GMld614I5kR48FWLDTRLMXaVfMJwff6CGOL+1V8wMoYRL1yM3xXqyWK0n4aG121pxQ=
Received: from BN9PR03CA0156.namprd03.prod.outlook.com (2603:10b6:408:f4::11)
 by IA4PR10MB8494.namprd10.prod.outlook.com (2603:10b6:208:564::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Fri, 24 Jul
 2026 20:33:29 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com (2603:10b6:408:f4::4)
 by BN9PR03CA0156.outlook.office365.com (2603:10b6:408:f4::11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12
 via Frontend Transport; Fri, 24 Jul 2026 20:33:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.1 via Frontend Transport; Fri, 24 Jul 2026 20:33:27 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 15:33:27 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 15:33:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 15:33:27 -0500
Received: from localhost (uda0499903.dhcp.ti.com [128.247.81.65])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OKXR9O3875612;
	Fri, 24 Jul 2026 15:33:27 -0500
From: Jared McArthur <j-mcarthur@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Sen Wang <sen@ti.com>,
        Jared McArthur
	<j-mcarthur@ti.com>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH 1/1] arm64: dts: ti: k3-j722s-evm: Switch audio codec clock from audio_refclk1 to external clock
Date: Fri, 24 Jul 2026 15:32:50 -0500
Message-ID: <20260724203250.1914444-1-j-mcarthur@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|IA4PR10MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: dfee4752-bea6-4278-bc66-08dee9c2d173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|13003099007|56012099006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: gd5RbC8Dmj3l0aAI6uIPu+/iOSHHe/MpzgRFUES0a17qnHGiukPJoFtySOem4MJY6LCYOI13UryBJOQMWFRKjKGvT0sJHhsEepoJNmIw6jR8La48U+4/dRPYMARlO5F8cc2ghDrtp9qvMseFcq0n6qf/8RBRqV7AeWTAvDaBQ/PSfHCXXPvhZfjc1jhF8v2AiE/0p1qkAbzUEW5V1E1xFGwMdqjW3ZtVra2zFUpHzu9QpJFH5W8V5dZnMyeWbc7qyCfBhF7QPRqO4OaXEaTy1mBNeQfQ2KQFgsyGSFhk3Ikq1tYjjmY5pgtm7PpObPDqdix0FD8KT1C38RG39uktvGPDv8Mh1N0GEuJK1OprGFH4smZpL3zG2+ODRBX0mvURC43JZFc3FOj/SDhh70jrMBBhaTIG/BYZuszUFGkrTN6lyK1GcMNSaAvNdewht50g/Ah6jvhYmbaKYQMfiR8ZL6Lu78E0sRNffKaw0L7FMbbNJBUNsN0a35IaPenzlTVhAUNhoYXRg4WH+nsCYLSCq4HMwU36e2LmBzznsPKn2Vae/uP9YFpQr3gBrzGVJ7ekngVCjJGFEVpZjNFlka4BrZZE8DhbftHsBYK87lBZscdJZZD2wMMiGISvGkFR0Xel+AnjDtBD6DfpjMGNGrWdWDn00EdY00q7wlg2lsBE5tG2a22ET9tT8VkUvc/G1wBUgUHXS94cGfuFj1J+ptVDag==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(13003099007)(56012099006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: p6RyYkdS+JOObisx1NdC4Oh4b8vjwWhUvbpG9ex+75vaLwT7v1r6HedhCStd/kJapj0zlKrLYn0r1yhsf3yG3uSyjW52UrBOEp+e0zQ124HoNwooTc8PokOavMmb7TY+ZnAnUwgUvROsHqKsQwaQzO+j+z4bvuDZMFeTIqHtf9HzAIpw0zh9CN53w90nGq84+ZZq9TNZI4kHN1PqP/fD3u5NpLanFBnjoUwsRzgDthFktSioMXwSXUGE7+f58DIvpHNrfAoXtLLOWxPcKVqysSU8CxIAxU+CZyT4F+L1XIhAkgtKpWqtnvrGQfWPU4mXXTG+PMVMnvvreAMr0otmzBcvxOxoYO1zdErbbX8kxqCMVEY4CyOGk6sWeLxabueu65mkMCQwQufrbQ94/FjRqkdcixVm7m5IVlxvuwb1Og6GIvHrm00H6L61hoKZVU/3
X-Exchange-RoutingPolicyChecked: RswCLA3k8LQBb+E3PW7PZFYG2Lg50u0kKE+9sMdDmGQMqAjJxwvntvl9ut+iI5oJrD0gYIjcRXLMuYu5UtrWzMHckOQtZwdjyrlv8W/2+70B+I29NRY0RTjo0YNyhnqlZhTOV5OeS0e0aSo4dF2j3dk1OSeqH9R84173RvEMxE/jtLqi0dlXN8t6OKzNui2bIbkVcjf29vGU/wpzmjWYTYvxKkSDHunEyPFu//R/j0JUW5N6x3Ah3NTFcd9Xw/OdAjxbSMtguir7rX1TOOTQF/42ojpXDES9jxSVKJllqrrjZm+ZotKATGs5m2FzWuMqvw+NABXT4D5wD1t3sngGbA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 20:33:27.8994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfee4752-bea6-4278-bc66-08dee9c2d173
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8494
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE4NCBTYWx0ZWRfX10O6kponN/AP
 ePDkrkfZpqaxuI+N23piKN45v1HeHEcNJ++++Alikf+NfgFnmOS68OGfmg/W4TD6GjilZiZ7Qdl
 FxyXQbSijzBu54bKJs7AnDR2SBAj1Fo1STp5cv/Lenlnz6sKstIjGHSt+umEGgWU1JYXsFTTsLz
 eFZN1EwMxYeoht59g6OcUOxYLYe7scpBEgWP18NMwoR8Q6lPBeHIqZyoUqHtXc9+ysWw1xuhDug
 80FGaa1GOJkaW/w8IXdsDVG3Q33s1GSdDIy/fjBDpdxj8PsL1XRueMOa/5qKEhb58tlkhn/I4BQ
 SQMG2wDffNbARlPMrE264lnwFEv1ocHNO7/hxRDvOVt1cPOAlx5asY8Z+V58Wk2fxrKqH0iJEDk
 impaVqoY96V08A6y3oAbGz/cMapbq3rgU91eIV51BApsUnUINIMk2rqyGksz9PJAHs8ox/aXrhp
 yQ5AxkJiC45I9Sj/9XA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE4NCBTYWx0ZWRfX/1EpCvEZzIGf
 O7AWW6D98RbOS1cIKC/7QHoYnJOTke2Xky+e9LmyI27IUszNlakB49OKKdncRhyXOGwi/VxaVwi
 sIUE6DvLFQBqDzepAEevGo/5hMM5xPg=
X-Proofpoint-GUID: EYmR7ZvJpImjEXs29QvB8aG3Ep83B_km
X-Proofpoint-ORIG-GUID: EYmR7ZvJpImjEXs29QvB8aG3Ep83B_km
X-Authority-Analysis: v=2.4 cv=C8PZDwP+ c=1 sm=1 tr=0 ts=6a63cc1c cx=c_pps
 a=s0vAXdo1X8BWGfCUIwR35w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=Yxu9Mjik3s8nxsdQ4ZAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 clxscore=1011 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_133336_833297_D2D5F527 
X-CRM114-Status: GOOD (  13.37  )
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

In revision PROC170E1 of the J722SXH01EVM [0], the audio codec's
(TLV320AIC3106IRGZT [1]) MCLK was provided by the AUDIO_EXT_REFCLK1
(96MHz). Revisions PROC170E2 and later switched the MCLK's source
to an external LMK6CE012288CDLFT [2] oscillator (12.288MHz). The
PROC170E1 revision of the board is not publicly available.

Fix the audio codec's clock by creating a new fixed clock node with
a frequency of 12.288MHz, and switch the audio codec's clock from
the audio_refclk1 to the new fixed clock. Remove pinmuxing and clock
muxing for the audio_refclk1.

[0] https://www.ti.com/lit/zip/SPRR495
[1] https://www.ti.com/lit/gpn/TLV320AIC3106
[2] https://www.ti.com/lit/gpn/lmk6c

Signed-off-by: Jared McArthur <j-mcarthur@ti.com>
Tested-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index e66330c71593..e796784e5fd2 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -162,6 +162,12 @@ vsys_io_1v2: regulator-vsys-io-1v2 {
 		regulator-boot-on;
 	};
 
+	lmk6x_clk: lmk6x-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <12288000>;
+		#clock-cells = <0>;
+	};
+
 	codec_audio: sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "J722S-EVM";
@@ -187,7 +193,7 @@ simple-audio-card,cpu {
 
 		sound_master: simple-audio-card,codec {
 			sound-dai = <&tlv320aic3106>;
-			clocks = <&audio_refclk1>;
+			clocks = <&lmk6x_clk>;
 		};
 	};
 
@@ -228,11 +234,6 @@ csi23_mux: mux-controller-1 {
 	};
 };
 
-&audio_refclk1 {
-	assigned-clocks = <&k3_clks 157 0>;
-	assigned-clock-parents = <&k3_clks 157 15>;
-};
-
 &cpsw_mac_syscon {
 	bootph-all;
 };
@@ -358,12 +359,6 @@ J722S_IOPAD(0x0084, PIN_INPUT, 2) /* (N21) GPMC0_ADVn_ALE.MCASP1_AXR2 */
 		>;
 	};
 
-	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (N24) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
-		>;
-	};
-
 	pmic_irq_pins_default: pmic-irq-default-pins {
 		pinctrl-single,pins = <
 			J722S_IOPAD(0x030, PIN_INPUT, 7) /* (K23) GPIO0_12 */
@@ -562,12 +557,6 @@ ldo3: ldo3 {
 	};
 };
 
-&k3_clks {
-	/* Configure AUDIO_EXT_REFCLK1 pin as output */
-	pinctrl-names = "default";
-	pinctrl-0 = <&audio_ext_refclk1_pins_default>;
-};
-
 &main_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c0_pins_default>;
-- 
2.34.1


