Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE0AC55184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 00:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RWJ38YAxRo/3dBlUd6fJDvLJPso7fvhWh3u21mQTaw=; b=n4HU6uW8CQ6hKYeyKDu+D5sbTz
	GeffLTjaLoiKzojPLJt4FvcJA1mp196UauKwvJOmO4ZmW/k6oZI8V4jEfnQ9WUuucxk9JTixElDxB
	rhEXRjG5TOfhpkXFj35riBBoCq2MPYyRmBsIcwAyhTFb1Ar0+OedmivaRF/UsF28OYPHPf8ip3kXf
	rLGTTIhCyfrRhBok5iB6LbBEWqG3WNNWBflkrHNAB0i+/vSjYhVdTHn9YC+atzjDrG8CM5hPVcXES
	5i7z7t7xUW8/uvTwk29nc7BIslS1SLFyhAqAVHvmxVNwSK+l92+XR6wnPIq5JRpO+ujBxDdGhMY2a
	8Wl/GxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPo9-000000030tp-3a0t;
	Wed, 05 Aug 2026 00:48:33 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPo4-000000030sC-3Bj5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 00:48:30 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 674NFOSt732572;
	Tue, 4 Aug 2026 19:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2RWJ38YAxRo/3dBlUd6fJDvLJPso7fvhWh3u21mQT
	aw=; b=PKO2EIH9pBlv4v3v4EliJHA+E038AnHDNbSv22t4Sdrp0KpoUje9WyooR
	mllSbhTQG3rgiM1cTpOSF+eYi3RYtmK5ZC9O5j2GDyOMCE1AyW790HBrFAPNTTtv
	ruiAd8M9wDliImX4CuwI//m2hNEGfgM9O8QRUEljcmE62I6bBqclrQXSLN5VDU/s
	hIoPXWosXUs2YGjjVsdlbHguna4Q0zPRTxqJUQCWAFkQPW7XnUGDBbHVxWRZdQyi
	U5UIK4UF5LwuqfRon/ezW4sU0GIJX7QGAyIwM4tghzb5hRigiDIvDv/o4G+MpCT+
	a/TSynjzSN5F+tpQ/sK6j3UHOmyjQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fubus788n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 19:48:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1U5TaYOG65eRfaRz0+mA/lR54N36FMeqnzvpm4U99vcfK3NLsRVs14itiYPpRKVQ8Q1QqnI5GkqBhiXIsJ/b2zJb3P3peP8YVB52F4TfKGLRnzO2YGkFPZtOZVuGDHV+bvF52V9YHKEfqHkOf75CSEtUs3HyJrNmc9RAu8RF5nu8k7MthNiQAKp7DhdzPNKjeXJ9a7TR/eAQ5f1d/0S2A+T4bnZIFoiifM8wloi7E2L19E5Nb+MSmobOFQrKYQvQcCkbZtKMBIE5IIWod0s10XoB/LCypoIhDennRl/833PLMGiAcYpnWlnHeuj8/DH2L4NLSVsHaqWO8X/ge7Mmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RWJ38YAxRo/3dBlUd6fJDvLJPso7fvhWh3u21mQTaw=;
 b=ltOQlaKUy9og2lRApzMutGlkEbuKLD4BIN3uZkZgU36KX8BuwXwKheAeB4Rc709xKEqvWtS2AjtWhzHqvL/ZajaImBQk8wvVvAbBwf2HO7vlemlbJ9El033mbNYkwZiIo0Sm5g1k2rRF0DN0AmWg22A4PzMapZyj2R+jmjaiLkkGY+g7vVQHeqyyD5y+1vlQ8bTgm9lCUF85ZV09YFkGk8kHW6h/p5nqFeQNVvbRKEMjGPKT7AjEO5SVR+vfgCgURXUrO1YdPp/tetb4dKxevHRG32x8VmUX99a8qHz2KJK9JOHHJmje97LBc4m11Iv+/16kGWx1K1aZGvrinzT+bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RWJ38YAxRo/3dBlUd6fJDvLJPso7fvhWh3u21mQTaw=;
 b=urYktj0vZ6wHnAbYfr5pgdVE6r925wz7YplpgyUZlZ1F/vTZOMmLxNdv+P/XMCgI9BupO2RZHMdGBfDyu4tfZboMv/C8dBCOi38DkhxVZ1PRiQk4tthsruhK8cMAq0F2dnVG+LVFVsXwBBIFHunkrbq+0cXZ7VFaI8Q/L1K8LYI=
Received: from BY3PR03CA0027.namprd03.prod.outlook.com (2603:10b6:a03:39a::32)
 by DS0PR10MB8199.namprd10.prod.outlook.com (2603:10b6:8:1fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Wed, 5 Aug
 2026 00:48:24 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::a3) by BY3PR03CA0027.outlook.office365.com
 (2603:10b6:a03:39a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 00:48:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 00:48:23 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 19:48:22 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 19:48:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 19:48:22 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6750mLQ51184200;
	Tue, 4 Aug 2026 19:48:22 -0500
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
Subject: [PATCH v2 1/4] arm64: dts: ti: k3-am64: Enable IO expander interrupt
Date: Tue, 4 Aug 2026 19:48:18 -0500
Message-ID: <20260805004821.416613-2-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260805004821.416613-1-jm@ti.com>
References: <20260805004821.416613-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|DS0PR10MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: e727f5d4-b506-4e23-7d53-08def28b40a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hdSKzKyRWtdNpNRvakxMH75cgSHZyGWw6woXVb1rqHTvpuX7IXG9jJLkv5VJ/3OGVTKQccV1jgqqf1Du6vx/DGxf9CgiVrkYIuH8xczETsTu/pQTYoGE0LajDQGjfpIYDvj9tCFUsVMcHieMAD3x6ZZp6mVBmUrWeYHihgkAlU7oud7HotXJaU5EuUp2WjoJm1TS9UfB0O2jL15raqKSUQ4en1CT1v3cXgtfe/9ll2JJjFAzsBjsLN5zG+Q5LNrRjps3fQ1D7pZrQ4uj6nNUcTy+qyCJ3y9JrgIfxIeIixEzvWwO/5r7rK+RDRKh+JnruC3ncnaR2qlnwh/6ULivYtm4UrcDWe8rmZbviaj0azSV2LnVMuSvndIA/MvgNMbUertGy7x5MhJP5wlkbdRhk5wDWBA0GqzgMTHRvJhlAZZt64/OHMkZHedP2o53Ksqt0UaM07/QHqcNJh703W7GLpnyZT1aw1HL0dXcIjgFu22L49fpaZPsPyKO866sj7HayxgX81qdvpohWAu90yFzSZUBsrBZHClQ8GoUzIrpyPxZgOTnNTgI3CX6qu1F1wmGCAe9XRWHSqJxmU6ERrSQ/Olz8gHInCum6ARyzxpKhTgf1TR/FwF6MICXbBEE1bxidfS5/3aMjp+m/agm9lv7cRNCruRAFubhL4XzsMBM50ZCHfGVfTBbgOE7H00FUOfBh/rGLy3gv6FkQjGDMO7SBw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: edksACiNQlzDYKElyDBLUGQSFu0a/VoMXJ/nBhxgj8gpZ9xQygj8RPgpcQxueFkI+1HbEHQyBp39Fk1ObeZj16uwyoF44QIVkJtuZrq9TkED/t/I8mYvAJSnY8/4Lm3tsNweQmDCE4H8oCvWrwsXbAz8/u/b2D3+cxZ1XXH5lWKaRg6d2S4uEpgQvxh3Gq/2Si5qm4MBg4Mi6WZZFyJW9yLyeZtxOm+84P9W9194P7v1b7TiCxt6CyAYkA+Odbiz94utGSee0xDTwyOpn++XjK8QcT7U5MWugkP+OvUTaa1cD5+/edIhbPh9qMjM1Beg0iXTT9adIe/PBHGz2yy/VSTKKoA0LFsxT+qdIuobhNXDpIZOJ33ETNVSuynEKmPww8tppuq+hWygBvMT9P7nFm5pKY5ZTNJGI2cBfVfCDA+CfWZVp7VBGX/KeyS5vJ8F
X-Exchange-RoutingPolicyChecked: nzgs5paznpnGhMcyYfYqlajgXn2wsl6rfBe9fLTvfxRJ4o3W4thNsJPBTYAVidSs1yitOO7e+WDT39LWmx0HOse28jd0OFGnfBBrkhgChDNHCbD5twCGcTfpYaqhfREbC0RhCRoFuIZGKYJUHE8I9gvQKHbtan/v4bNg/vDZ7V+yOLS+e3euniGL5qhBKOvEXWKcy4k2kwUs5+1WYswl7KqTr0NwYpSB4lhxJBH9k7/nGX5Q55afhPLBxNOeAd+V8sGIrF1/dLpARdphZYecNZGgku9tz9oPq+hSnF+J91R5FWeee4nEXaUt+KGtN+1uUNTYWtfVSqn9NrrZC768ug==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 00:48:23.0925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e727f5d4-b506-4e23-7d53-08def28b40a7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8199
X-Authority-Analysis: v=2.4 cv=RaagzVtv c=1 sm=1 tr=0 ts=6a72885b cx=c_pps
 a=CjRpyDoPu1ZhyeacGh9KdQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=69n5StGKHvAR_yp2vncA:9
X-Proofpoint-ORIG-GUID: Gp3LywH_hUAhWmRQkRz-QtlplvT190NG
X-Proofpoint-GUID: Gp3LywH_hUAhWmRQkRz-QtlplvT190NG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAwMyBTYWx0ZWRfX1WGJgMQN1A/y
 14ls8Y5EyJ9SWlJSPJGoEXmfL6l3+rS/DNVKx1ifpFnlnORKvgeKOq5OveiSQq/8km57ybJCUDW
 k8ucCqvmCnyUbq/KHTGAFQzg8DG2r0h/Mdn4sZmp8EYoNVlGpFXhJ+c+CfeR/Jw4cztAtVqN4Es
 KGO47bCjn06AZdDRpAEU9mBXZda8sqk8Z0sD086pBLKosqjUoEAuHm5Qhpalrnc5uMIX/m2d94G
 RiSK8Ny0C3l0zOZegwFkK4sCcFfTSO1MIcdZDSKC3cCFx6EnMdwpyj1u8I52Sm4RTPlrVl9YPpV
 oYMfwSaLqnSlwElWmGRWrEfx76qRX1pDA35YPlWadZVos6Po5obZIVLTZCXo4rauNftaIdbnFBC
 dw75pe9jW2F47IY1PtWlBhdTQMyKA+yJirUBV9pSGku4/1FvSlMJXoRTzSDvReA23dpCyFGVrnl
 E5K9nNDXyFO+S/I0yJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAwMyBTYWx0ZWRfXzOxd3j7ye9ot
 23rVuQIiPwgX1josIhVa8NEHIUDp2tWTcVsf8N7xw50IsFiX3c8n9bSqCJqG5yKMdEP5BDwF0tA
 Tv8ac5eGeDkGzHGBzMisRzv8SG44MRk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_06,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_174828_809787_35A98D5E 
X-CRM114-Status: GOOD (  13.17  )
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

On AM64 EVM and SK boards, MMC1_SDWP is used for IO expander interrupt,
remove from MMC1 pinmux node and setup as exp1 IO expander interrupt.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642-evm.dts | 15 ++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 15 ++++++++++++++-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index bc4347cf71140..28fbaf134af4f 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -8,6 +8,7 @@
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/net/ti-dp83867.h>
 #include "k3-am642.dtsi"
 
@@ -259,11 +260,17 @@ AM64X_IOPAD(0x0284, PIN_INPUT_PULLUP, 0) /* (L21) MMC1_DAT1 */
 			AM64X_IOPAD(0x0280, PIN_INPUT_PULLUP, 0) /* (K19) MMC1_DAT2 */
 			AM64X_IOPAD(0x027c, PIN_INPUT_PULLUP, 0) /* (K18) MMC1_DAT3 */
 			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
-			AM64X_IOPAD(0x029c, PIN_INPUT, 0) /* (C20) MMC1_SDWP */
 			AM64X_IOPAD(0x0290, PIN_INPUT, 0) /* MMC1_CLKLB */
 		>;
 	};
 
+	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x029c, PIN_INPUT, 7) /* (C20) MMC1_SDWP.GPIO1_78 */
+		>;
+		bootph-all;
+	};
+
 	main_uart1_pins_default: main-uart1-default-pins {
 		pinctrl-single,pins = <
 			AM64X_IOPAD(0x0248, PIN_INPUT, 0)		/* (D16) UART1_CTSn */
@@ -481,6 +488,12 @@ exp1: gpio@22 {
 		bootph-all;
 		compatible = "ti,tca6424";
 		reg = <0x22>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <78 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
 		gpio-controller;
 		#gpio-cells = <2>;
 		gpio-line-names = "GPIO_eMMC_RSTn", "CAN_MUX_SEL",
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index d28a38c87f32a..aa87845d77598 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/net/ti-dp83867.h>
 #include <dt-bindings/leds/common.h>
 #include "k3-am642.dtsi"
@@ -198,7 +199,6 @@ &main_pmx0 {
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
-			AM64X_IOPAD(0x029c, PIN_INPUT_PULLUP, 0) /* (C20) MMC1_SDWP */
 			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
 			AM64X_IOPAD(0x0294, PIN_INPUT_PULLUP, 0) /* (J19) MMC1_CMD */
 			AM64X_IOPAD(0x0290, PIN_INPUT, 0) /* (#N/A) MMC1_CLKLB */
@@ -210,6 +210,13 @@ AM64X_IOPAD(0x027c, PIN_INPUT_PULLUP, 0) /* (K18) MMC1_DAT3 */
 		>;
 	};
 
+	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x029c, PIN_INPUT, 7) /* (C20) MMC1_SDWP.GPIO1_78 */
+		>;
+		bootph-all;
+	};
+
 	main_uart0_pins_default: main-uart0-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
@@ -383,6 +390,12 @@ exp1: gpio@70 {
 		bootph-all;
 		compatible = "nxp,pca9538";
 		reg = <0x70>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <78 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
 		gpio-controller;
 		#gpio-cells = <2>;
 		gpio-line-names = "GPIO_CPSW2_RST", "GPIO_CPSW1_RST",
-- 
2.54.0


