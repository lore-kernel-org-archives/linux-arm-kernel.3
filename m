Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56994C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 20:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qf2xfpe1M2Wf2+fEkgkGdHWjezsXMCwruzjiYhNqDQI=; b=ElF4DabK0x1o8UfVjElL6w7ixW
	g2uqa+8WKE6Rs0ZGRO55x5G7wEJ6p34DnYzaY+7p/LF5Jt2c0Y4CTZkiDjKvOIx7ni2BVao8MjTGg
	f5HmDolXeeDkAF1uwjSZLj+WNGwIr+l0bKrbvkSYKqiftzjoEj2uMlVjTFRpRa9o8/QpRbbxu0d+o
	2rE0prZTSElg6v3knhIbLiqiU7qws+mmL9CU+16AUQ3ki8735/OiDgtCTdccRit20SqNsMv1gFOsR
	VT02LNdIVXFlCoVoFgySe3A9elhUdrpKD8Ws2vskbhTXQBtkEkQUR3+IqPLL0DCDZLORWC5wmERP8
	z6KZvlyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpASB-00000008vA4-3k5G;
	Wed, 29 Jul 2026 20:00:35 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpAS3-00000008v5v-30E4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 20:00:29 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66TJfP5U737369;
	Wed, 29 Jul 2026 15:00:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Qf2xfpe1M2Wf2+fEkgkGdHWjezsXMCwruzjiYhNqD
	QI=; b=Qd1t2oJ+X5J+Gqt0H7T7Qnmnd1mKvYJEv5UVUZcfRVxJ7juD3ISpaUkTJ
	iwZkFWUmPtHG/F0/jb0J4ezE2e0/7IqiozL3aveXLgyjEIIvn0wr2dMHUKoxpqyB
	Gl+wGsOXoqGMHYitAPSwq1cZiN/qNv/GlqoePQimzMJnZKwh1sN/xHh8WNIhpEdZ
	KBzC9aSK6cvoPySS5fmh0CSjRbntL6uMRMgUSSeFPWQ3iabEX8dJ7ERJZAFNgL7Y
	EeH8hk7WKikPukEYN9jVzxxWjDxl2mi1cyNJvLBHfGhtBBKVicTfWA9/w4NAO1gy
	28Q+vENEJUdHE/wQjv5ppOhIDaQpw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010001.outbound.protection.outlook.com [52.101.61.1])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fqqw7r45c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 15:00:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhHIHPcULIQdIEE/MIz6H1TqCxEEagBgB9wro/uca1P97t3K87qclXmb5GzyEZNBrKmiIcLT4fDuDonTBRxub2KeAlVikf6+xdDZiMSWcGtmFGQzR6oRGC14yimjmCqnQR4ZV6b53E0yAaU6tDzNKAuAAsBD09u+QDZ8zcxgIGoJvvIKUm4DI4L3EYIQESz3C2g1+YSLUIhM9Szfg3W2A8E5qFAX8bNYRpO+px26vNR3CGbtGjvR5FaPAjLG13+UH2tfHzAd3ljbA/dvXvXUq98dY1CLvEpMcnJlmjdQ6LdEjNKINV2BfVuySgkrkWifPsBxTOY9Fh3T4D6mquLmXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qf2xfpe1M2Wf2+fEkgkGdHWjezsXMCwruzjiYhNqDQI=;
 b=ZukfIXScNVFcUi7VyPHOrsarauFoSRizUeTzSsh19Gu/XtgYBU15GHRlJzR+qoDkAGVRryB9a8sJZMSe204jfPC2BS455mk6nZazDSMi7yNq8eQxm76Tj3zYWpHckG3iy/hEcpy3qLHR2rgf0FomFCgupDW098A80NrPbqPWAiWFA+3jvvjW0JfpM26QX/lvivCpE1oMiFjwukxzYGrW38x32HwD4fguxCckBKjW1bDSnzq75hbS52JnRDBpzNbRCzoEaUzDtMS2Lno/y5ZriO2GplDJFm6LpYjJ63L+xXnnXGDZ9lpxgI781f6ZFBMMMyGyrIasAaV81dI1wz6ZFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qf2xfpe1M2Wf2+fEkgkGdHWjezsXMCwruzjiYhNqDQI=;
 b=biZVs8OfsgVyeEz557bioPPHhFA8VWGELNsSW8H0CinSCg++nsIznSbn4yeoE+EBqQHzJLpJG77+0lhIbmN1r9mvrHBOVGKqe+k2Loi5SnkHjMv6Px47VmW8iNomC6wI94L2/wtCYUuqSDTYwNbQJLZ8QUl0lmCGKduVSLdp/g4=
Received: from BLAPR05CA0020.namprd05.prod.outlook.com (2603:10b6:208:36e::23)
 by PH7PR10MB7766.namprd10.prod.outlook.com (2603:10b6:510:30c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 20:00:17 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:36e:cafe::7d) by BLAPR05CA0020.outlook.office365.com
 (2603:10b6:208:36e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8 via Frontend Transport; Wed, 29
 Jul 2026 20:00:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 29 Jul 2026 20:00:15 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:59 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 14:59:58 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66TJxwfx1923570;
	Wed, 29 Jul 2026 14:59:59 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH 6/8] arm64: dts: ti: k3-am64: Let MMC1 clock loopback use hardware default
Date: Wed, 29 Jul 2026 14:59:56 -0500
Message-ID: <20260729195958.671147-7-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729195958.671147-1-jm@ti.com>
References: <20260729195958.671147-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|PH7PR10MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: fff58ca4-8262-4654-cb98-08deedac0212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 809gRcgRufRDhFVmdaeexdzR/OQ8fUeHiAqgM2u7mvfL6QpkhIrYR1It3ycACz7cU7j6bTxEe3ypxo4Ptcsa+PO1lyDJCS9lMc2ofthpPZuSe5NKnlIFwqhPasEEm5DGKv7op5HJxHdxs6Lhq4R+nXp5dAHPGWE27yL51v8j0ZJbdCKf5QCUpH9s9M5BOu5Os7zXidScNkeuT6kNKExBiwFyXizYuNwh2+trOP538ZlMci+233+AsjPyEyxTvdquUhOYgDDOTA3vQvsGzaN9nSZ/2YtpBB7zfszrYv6ugBMq0wq+ZSRRbG1ot/oVWfHtSm56pawHGQWGc/L0PXoWqNxK6rWjD2qHUMJ8vj8XDC/bKwSfjSLBze2i6XevwISWplQwkuHGRt1IuXyiiXOBZOGUL+3NcmPJH46nbmZRBApgKOMPUAwAuhfiW/OyTKEt3xkzvzCHqxKAIg+zd1ulsrlTkmwTcUaxEZjXLfBLejoq6WaXH25fGwNI/LhaN9+m0E4UGHIfKdpmyQkhUUW4qfMhnwThB+CVT9KDvg+oKe39izmAz/2a42hOzzRvpqifITRnqkEfRAr10fm+OuqIPQIL0SQE/dYcg8BtRZ2RWtWs0VSpEwKT3b5I9EXlWRWI3HYWFUAJvM2ukIJtVfQzv5yjYyNoHLQmdbHju80r5miYS0nSbyePCmI+UYUNxVAt/M0pIUPK82AuzHVhmY42mA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0n4tHHeA71chPWt9r6+aLSP1fuVtUrbMJX07AC0vo9mE/LSjxyTntDHKiG5yZkyl8qFRHPwRz61fBNsOhKf4eF/XQIy/T43mlZNe0KAP1iux5EryRcwOm6hxzPGzzxW78wWtcaBFK552Nyalu6yQ8z3vZBcg6TMemzwDHAsfGGqETn3rJCp87ro1T5z5W7tYVOVTM9or9kQB4ZDTs7TEVrT1POHxDW7oXhludWWTVJfW+jaMB+HLP/BPST224bMtFP9DyxHQyGmEhzOdWXMtxtEUiWMSPL8gRoW72BaHnmBs3NrrRYtPvtuN5FA4ADh5k59EquRwDQiLvWpR9pNnbIN+HasFV5ai2eYBvRAxzxEiHLXL6kEKFY4K7bCxrzQAkctSmpzZRkLUGembiN+LL+07m8Bz1uV5YZK7W/mEFYr76LvoLY4YF/jW1vZ2FK0o
X-Exchange-RoutingPolicyChecked: XlhKGeciKde7zg7FBJSYQb5nEtklQ04l1Bc6bIjRZbzWSjjR0LstspMdHonyOyfaTT2agXaer8IZitDq9QvdKT0NULlI6NzaRGijnG5wwJHenSuYhW0pG6s2J5Jby0iaUpebZMLRcrVO1dp7UaN2++O1afaYSM8t6N0rWkpSoafcJKXvqqwjxy2kZpnZ6JOve5zuSGX7PgqqTrL00+b6twyR9YKQTuhTvclt92QLtp+OnWItQk2LP3fo9Xm16q7Tg7UXEoksiDvSkz3SCTo8QnsBYEbJ0aRunX+LKrJ2i65WfDvBkw5UqTGJq1hZLQOzGrXfbqrplB+oiytcy4RPuw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 20:00:15.6902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fff58ca4-8262-4654-cb98-08deedac0212
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7766
X-Proofpoint-ORIG-GUID: MfklbzV86YSuheJRLbr-LLj5FRqdP96y
X-Authority-Analysis: v=2.4 cv=ANVByGx0 c=1 sm=1 tr=0 ts=6a6a5bda cx=c_pps
 a=j7tsCyGgeYHcZD8MHzM6Gw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=4buhbUbHMmNEhEVYUvAA:9
X-Proofpoint-GUID: MfklbzV86YSuheJRLbr-LLj5FRqdP96y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfX+++1UFAMNs5t
 zgdC9TL8sPIyG4UY5LOdHobO5hJW3u144ZkK2Qv2wnbsmCLQZP40guAaKadSCIVI2ptq4wtmZ2I
 7voK+BjaxOrPhJbIdQAv80EIcrWl6xQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfX69lp2ErBBBPT
 IW4Y/Ad3lH0Q52iUgjbbYca9um4DAo/VjDrJPEZUCNgiLBnaK9h2IvWprS8tFcaNhgFgxqv/Vqe
 xcJbZTk3/02IflL94LHCdv8Ds6yebbrV675RXbL+n1uPyY1Enh/jNzu55EzKUBDiWiYsSzadpjS
 o+67C71AJ5n8JOy7T079xSNpHvhmHwsX1UMYLrdtoheczqcwCtiAharj9LrSsIWL8D/sRJrf8Gb
 YK6i79wM+bbnTs9684ErD0rRt6+rib9LNaqgo/Nz3Ivay07iJl6HqvwHrtotxRX+NgX8doUHAIg
 rcS30GZNzh4VJ3zM7Kp2IxGgMt+pzrX0dGWy+oVrGYVJEs0KLoGj6xTLFzKsjSjQCO244MUXpaQ
 ZKPgfvZqn9zV95wywNXPIWy0qle3xS4ZTk/O4jPSahGMEoz45MaHSueJNUEM0DTNpYGN/t5MPE8
 3UtdA9WlVtGEuKvvK6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_130027_758290_AF0620FE 
X-CRM114-Status: GOOD (  11.46  )
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

Clock loopback (CLKLB) should not be changed from its default state.
Explicit pinmux config is unnecessary and overrides correct default.
Drop CLKLB in pinmux node for MMC1.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642-evm.dts | 1 -
 arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index bb756c922252a..f57f39f8579d5 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -259,7 +259,6 @@ AM64X_IOPAD(0x0284, PIN_INPUT_PULLUP, 0) /* (L21) MMC1_DAT1 */
 			AM64X_IOPAD(0x0280, PIN_INPUT_PULLUP, 0) /* (K19) MMC1_DAT2 */
 			AM64X_IOPAD(0x027c, PIN_INPUT_PULLUP, 0) /* (K18) MMC1_DAT3 */
 			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
-			AM64X_IOPAD(0x0290, PIN_INPUT, 0) /* MMC1_CLKLB */
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index 3d7160400cef5..7f2483968f4ee 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -200,7 +200,6 @@ main_mmc1_pins_default: main-mmc1-default-pins {
 		pinctrl-single,pins = <
 			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
 			AM64X_IOPAD(0x0294, PIN_INPUT_PULLUP, 0) /* (J19) MMC1_CMD */
-			AM64X_IOPAD(0x0290, PIN_INPUT, 0) /* (#N/A) MMC1_CLKLB */
 			AM64X_IOPAD(0x028c, PIN_INPUT_PULLDOWN, 0) /* (L20) MMC1_CLK */
 			AM64X_IOPAD(0x0288, PIN_INPUT_PULLUP, 0) /* (K21) MMC1_DAT0 */
 			AM64X_IOPAD(0x0284, PIN_INPUT_PULLUP, 0) /* (L21) MMC1_DAT1 */
-- 
2.54.0


