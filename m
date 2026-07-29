Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9966C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 20:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jc5MZT4gJ8qT30jpFN3wBDyFjWafFMt43d1LHH9CzZM=; b=VLQt7RCPbcM2vlxwluaP8V5W/T
	e38teX8cUf2R46NxI155onI/TjpqTssyIMfZY9NZvT+EdiBpaUGoHBiaI6jfy1IFND6d9gv0kAunm
	5KSu4mef69Yy/y3mxkrGyz/pu0KrrVihjMoKZyzegrHRCNvzMS26YWlwHRlg0NcGJdgws+Vm3j8t0
	HySSDcynCtK3X+8qAJ2QfwyNV9kQ6ZN2vG4U+cce0BuS/8gIi+/NJBeR1fL4R4wF7xbuf/vuqSE2x
	r0k5AAXPE+Qvan1xxCtl+R7jbqmfqFneqEHzZfjl1NobZ+ysP4IFroqAyu8AzqqjQ4fYR9GDv3Ral
	CjBJ4zrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpARv-00000008v43-3GpJ;
	Wed, 29 Jul 2026 20:00:19 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpARp-00000008v2L-1u4H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 20:00:18 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TJ5xdI3536768;
	Wed, 29 Jul 2026 15:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Jc5MZT4gJ8qT30jpFN3wBDyFjWafFMt43d1LHH9Cz
	ZM=; b=AX7kB7bCB6/NvT0yOnGACz5ZSOd8iNeXr2eIL8XjTpK1L84215w28G9VO
	I4xj7FEvTjD2Qp/9qCwObbFeJHmO+nFT+t0cCg7mWlZGYZLWo1USGudu1FZeauD3
	AuXucBJ6zKkqW7xmciAdHA9pioGEghK6UIE5tYN2dRiIqU82a1eLGPypQeHA5La9
	PCKAdnde2j4yFR06nmVI1Rm87+7UtZ/R0pw7fcnfFYJVdaTFOXAy3qhjQnSY1pVJ
	FiMH8lEXZK1RZDWow1BQM7WivexZWxhzgtcnR1H7WtH21z0ok1TjJljYvGVk0cor
	0WswQJqGZN6+kBCnribuXPNz/QMuQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012063.outbound.protection.outlook.com [52.101.43.63])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fqqcmrapj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 15:00:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkMYZ81JTABej8ptxBJUMabmT4FOwh/wqpzxqg2im0ulSoHmd9NcokpVe0oV4l+bW3VSO7wZhTWxczQo9i8nlB6cK/H0p1jAF03+JE8Ubw8q1c51lC2LXPuOoM/24cZAvZ6Xy7lxhakLuckgr2McNrd8tg4zCdp5wpbn8FI7ureZe+q3o3/6ybd2H5dUaOUDmByh0TrSB0vtmhGkykMj9o3HfKRPCjonSC/PEBwqSYcrIjfYFyX7DC9aVMUUInLgniLwS55X9zCXLXbumu8Kpsp2+Ip3rBkUxLs9kUwIYc73Oyj2UeZ7CbZ9Gvc+ZJTXgZMwAx+sT2x+dqM1iXvXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jc5MZT4gJ8qT30jpFN3wBDyFjWafFMt43d1LHH9CzZM=;
 b=BB7d/+df6DuY3IvdHSbxh+mp74ZTx8Sv6QmmxZJuT1dIGa4a//aYyEZ88kUUMsAjZLySTWdM2tGHpxhZm5pAfscO3Jn1gvdvMBJG3v5r6fYDskEBBkUm8urzNYo2QqT0dWQfxjQ/iES6l6yQfBj4l1v7DdA6Ye9rwnv15PsrWC0Ztueg0tNzxvYSBhctzKE4B6LpB5r1Vq/AYSEvdcRwVJArLJDhJG8t1VdyOjlYPTx3b7C4c5UupxmHauq4DKeR6vVuDExJ3cQxYMLBTIyYkcS+6vkrceTHMRW/NvZRIp4U9g51qeLOOgaMS2iKWkULOndCUxsnD8AysRoIUAPC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jc5MZT4gJ8qT30jpFN3wBDyFjWafFMt43d1LHH9CzZM=;
 b=iBhnMRWLP9o1TT6Qq02glX+wOtAkxNOEsnexZ1qGSmgGBoFEZCKDbgGB4bGMvfW+gqAj00X2aAtVNuntvGR8pEdLQyzpN4xXkfp3mdo6+5iiBfx0nkuh2yTTXBPeXrVoTEqjkdd0jkJNpJ8Y9MSMJhsNw32f6wektNnTnW/P0YM=
Received: from PH8PR20CA0015.namprd20.prod.outlook.com (2603:10b6:510:23c::8)
 by DS4PR10MB997549.namprd10.prod.outlook.com (2603:10b6:8:31c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 20:00:06 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::3) by PH8PR20CA0015.outlook.office365.com
 (2603:10b6:510:23c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 20:00:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 20:00:06 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:59 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 14:59:59 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66TJxwg11923570;
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
Subject: [PATCH 8/8] arm64: dts: ti: k3-am642-evm: Remove unnecessary internal pullups for MMC1
Date: Wed, 29 Jul 2026 14:59:58 -0500
Message-ID: <20260729195958.671147-9-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729195958.671147-1-jm@ti.com>
References: <20260729195958.671147-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|DS4PR10MB997549:EE_
X-MS-Office365-Filtering-Correlation-Id: e57cc850-69fc-4936-6238-08deedabfc70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|13003099007|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kvcNWcz0b5HzteYinRP8kkBKA51mbBpEjfdTt1TrfH7qGMGBk0JfXfIa/BgfaJI1AqPKarZVb6O6a+14d7+fc3KVZalvAr898dYF9gqK2AzGPkK+ZVo7n/ithSgsR4IlsGIkb7r2v9baELxZQz7XjQZudmabmFC0CNFn4RO9sV03RfYSB841zLURr240ypMb6Z204kUfbUTOgXJkggRrccJSKcM0l/QAmnSLHFWXmJyAxJt2ss1CRBhLATUDAavcDZcSHRoDJbES91FqoeB1s+mkCqRzYkQpw2ZQldQGi70A2s003Zp9JeSUuTRqQlDMrWB2jFHMc2ih+7tzjdedbTCqnO/5RGp6iTTx5cR7JM38UzzH3h7MPj9BgP7qgRh4SB5J5A8GjIMxBNNXeLHaWSgEbMkKqtCPsZmQpFvYz+WcKhQowHy/N7R76Wv8LVIt7DRACzhrxy3EOzU1/G86UYAHBNOlDwba6E+wAE8lwi81FEbsm0dX03RsLSvhPnjOTFUiWvdjWigCnj6uHggzcxNPfeqUI//5xN6CBfznTjP/Rz0JKunvkUKIOgwh4RBz3qaaAkO/pBcTcoPa7J+xIaEQ0vzSlFZUbt/AAGbZPTC4mSkvQ5nhRXgo0IzCg4uMvtorO2rfo4KZMhpyMX2hOZkbuwBLucs6Js7dS6gebLcvBui6W5oeVffeZYmyTsvaFPiU8F+Xw4S9rTFgNs5J/Q==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(13003099007)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PIaiuGIkA4Mb69+vM79uUHml1n5uaIqecjqaZ1Gzxgk64vyBB0ldOdI7IDxyth5Z59McERUc1/NwDVK+qpPNlBruVkb8+CSUSR68sN3T4zcZhyfLwPAjwjCcFEznCm2b/+L2U/ShhUEmC9uMvVTnfnRodVg4T8QOIrYnwNBdOs2IoLKhEQlcBypadjhwXadXHehlBvWI08iNJUA3Mc9zqE/iB5YUVZUcafF5wUSrBXXfwad7HyW61A6v7xbGZGLEKGyiCb7hsZorvVJH+PtjnyPOIUXOYMGYo+cuwyXFUjHlppHVUFQEha/r+vWBm6Zy6aApQBeB/o5yjzky1vmKTV26CSCoaiZqARwNLWM6CnLq9uWNukXM3EqDk5pmWdMI43RBMFqc0yIv+3t0YICVI4DqROmNBNYJaD+6cMTwLBeVs5lj10mbQvg05Nd/7Wff
X-Exchange-RoutingPolicyChecked: GsZgT22qZbh034R4oUsfNR8ssJ4PtuMoqWenlZ29qw/jWbzKOxmySwMr4TCeezzzxmSdVzOylkoJSzwRPMCVxKQtC889RLU5YOlw7qqUD8+IoK6c9BGj590rNaWi4iZZEklWxiPDjsgoQjbL1LyHtN6dE3HAq7xKmGuFIlklrpzOvJduMhvPVDzV3ZCJ2Dc4tmvZQGkjFKtPtvvzGwlRX1j/LxiuMz/s3xBRQrKbE24HFXwRtzedxb94husZOLO6/fG3BF/fm0N9qgr4CFp0T3mKsPjsMj73OzU2oZkIC2xSLd3GjEpVkliIDTdll8iJTbkI/uFHcGEnZz2s+iNTnw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 20:00:06.2754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e57cc850-69fc-4936-6238-08deedabfc70
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997549
X-Proofpoint-ORIG-GUID: EI3fIk6W4bnDUqnzLps6rWSXwriOTH_u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfXxUbkDH30dv6K
 IcJp7oQe1FvIGxQHz82grbdhsZH5IDgklmY/iTl08R6p0b2fQND8KSM9c0tRrIpFxZxeeBORMdD
 eKDWMJD4FLVwzm3DdVr9A5N1IKwkJbg=
X-Authority-Analysis: v=2.4 cv=UtZT8ewB c=1 sm=1 tr=0 ts=6a6a5bca cx=c_pps
 a=ZIPBhjw7PX4DPdPA1Kx5nA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=HwV5A_PEb1klVR8oUxIA:9
X-Proofpoint-GUID: EI3fIk6W4bnDUqnzLps6rWSXwriOTH_u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfX7JonOe2WOCaP
 Ue6RkhonBnfG03ACYxx18LMpTg9gshzoQk/M+el4forNRh+8Kl5DVxQnWzCfe2T0e/baXroXW6a
 RPWHfpqsR9arVvnB43Lk08v5Aap5rW9LMsgFrz0rRfH+ZeWKiU+9VWgAQU68YqcgjO0VTQXdqzF
 ObhTwYX+fNSLIqOKalFi5ycM9pCGNc+rgaNmMXhQ8ezPbUsiwNouNXp41db33NuZQrxGweWIyeX
 e/4IENbf+UJwYf7v5wPn3Zdq8h/U7qYfOUaQw7JYyivIG4B5hxKjErXADv1WL8K3klMhpdg8+sF
 hhCh4TZQeBrYKaqrJDSj/JiCvKkx74VbGmvhl4VRQv/0dGCFu/hHycOhW2sQQ1DhFZ0andJDp5W
 KmojHsh2g62xFdgBxnC7Ox6DK4Y0uLh6u9bB6+kAn7HjeQpFWwLjzGCsyDf2Ui0T7QaWWFzO/HC
 mf7h69plsNTsSomYFYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_130013_959651_0760E0B9 
X-CRM114-Status: GOOD (  11.95  )
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

AM64 EVM has external pullups on MMC1 CLK and MMC1 CD pins [0], remove
internal pullups since both enabled results in unnecessary power
consumption.

[0] https://www.ti.com/lit/zip/SPRR462

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642-evm.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index f57f39f8579d5..37e3dd862a43f 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -253,12 +253,12 @@ &main_pmx0 {
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		pinctrl-single,pins = <
 			AM64X_IOPAD(0x0294, PIN_INPUT_PULLUP, 0) /* (J19) MMC1_CMD */
-			AM64X_IOPAD(0x028c, PIN_INPUT_PULLDOWN, 0) /* (L20) MMC1_CLK */
+			AM64X_IOPAD(0x028c, PIN_INPUT, 0) /* (L20) MMC1_CLK */
 			AM64X_IOPAD(0x0288, PIN_INPUT_PULLUP, 0) /* (K21) MMC1_DAT0 */
 			AM64X_IOPAD(0x0284, PIN_INPUT_PULLUP, 0) /* (L21) MMC1_DAT1 */
 			AM64X_IOPAD(0x0280, PIN_INPUT_PULLUP, 0) /* (K19) MMC1_DAT2 */
 			AM64X_IOPAD(0x027c, PIN_INPUT_PULLUP, 0) /* (K18) MMC1_DAT3 */
-			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
+			AM64X_IOPAD(0x0298, PIN_INPUT, 0) /* (D19) MMC1_SDCD */
 		>;
 	};
 
-- 
2.54.0


