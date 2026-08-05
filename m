Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975A6C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 00:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vXAHMHhsz+xJ9PiU7JhB4nn6iXA5FaNsBQ9lyUDYgc=; b=B0jgHxxADUVlvYxE6KBWOhx5pP
	tdh1xbjiUx1aRb6XRCzr3DuYUc1PUTikibRcHmRAx2L8K899bd+cg7cyxVS6adgl1CLJMD8EaaEC2
	/YlFcppeicj5bKh2WxS4fgoRgW08BBo6H8E+eEYisRw9cWymjAgl99SNd+JqDQjp6zJlbOjTP5Bar
	yDW2LehWEc+fHhI16R4Wkc1LELCxiuxgZOposi5IqhO2JAQ7MG8LxfyCBUkf2SP3g9hsQsrWh8sXK
	jaMCH3zbzq5L7KnchIsRcmN3XMQeYM9TxnLSNR5XkQ0uC8mC9HwjK6UVrtjxvVrdXmtee3AMQ9Qy+
	YQi8W6dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPoG-0000000310G-20o4;
	Wed, 05 Aug 2026 00:48:40 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPoB-000000030uV-12AX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 00:48:36 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674NFhEO4116562;
	Tue, 4 Aug 2026 19:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7vXAHMHhsz+xJ9PiU7JhB4nn6iXA5FaNsBQ9lyUDY
	gc=; b=erChoOXXBMMIjY7c6bFUk91gOfQE+2YJuTwoTDCtg+aL4908kbohMXiUe
	kjPHBaM34uheDcxJi9LcU19xE7eX5tyKK4y9r8nKdryrk3or1FMVE5tWxO8kwcvh
	MegWN0eF80LjG4319BNCLqdUIUUdMmI7h28zf4Mrddvp9+P6+lzVrZLbIfI5PpAT
	Vl2FZCqYm8oIVhcLrDicWwmF+U+YXVzjk2UJ0B7W5OzCNy7vdEAlVLlrbJsk5GDq
	3fN2m9mz5C7X3wMtiSewnWB/7g3+20xskI31oS/KqzYN59EdAHVejWmbOVnaNaS0
	HYepyu8fci9SEpN97m/JEdQOl2RbQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011037.outbound.protection.outlook.com [40.107.208.37])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fufckdkfb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 19:48:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRpWxD5hOmiQPaLsl/Huicl2TIxFFPk377btsrrvlLUgB91qobMvWj/5rjC2guMG1Gm9quzFJJQoYgN0Yki49v/C2bi9WMothbphD7lxWMMY0HjbhFm6ea+EnxUGIG2cyX0eahX2b+NoS5Ge7vT6v300KCgQcz3NrKK8l/3m94XCGiRJMsfPiLOOj5SU0ucVwdW8uBZEUaSRHSXMqkxj5AV6oOlMfEkpGaU5XH7gZqLrmPwfmB2s5gA5jvGqLS94ts70Mvfq8twI++KBiKXUl/SRIJwP+LTR/vsEtmFGzq7f+MrizeIbjn6t4Qc5cZbNYRPVT0d3LNGHQCCEyiplIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vXAHMHhsz+xJ9PiU7JhB4nn6iXA5FaNsBQ9lyUDYgc=;
 b=uCSgbk+MXHdPIl9LeDdez0J/PjIElVFWeRTtmUlWNrWihlAHUYtSm2113/whpcCaHfXfiVLCw9jtnwHhDDtL0Y36Zq9ygsvWLAjosL289Y1yIDmXTkPv41PYL8+228AxWlyqQkWsBAp1R1ua8TDH5Fakv1CM+DhtQxs6/X+skV2R243qfidgX1FgrPwqF/uEi8vJEPFy20yW74i2oKhZf9/FR7ikdO/IocEaDMhpZBp9gi8mD5kT/WpL+Q5FuzS8rNj6d9qyZoCD+ybOs1dOFe93/NeUta4URFUnGdsl632mxuNqShK+J8khYdSbI2bDmzksNffhCjTV5RNIGZDRtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vXAHMHhsz+xJ9PiU7JhB4nn6iXA5FaNsBQ9lyUDYgc=;
 b=OQnhiQLPQaxKmwl7204q3bDHLcxv9AId1pC5VN2kprZlugGyIu/wtL//68UFZlYEC4tUk3y6sEQjzWM89g4kjQ6ZvrMiO32tXYKwFzKvaf/vdNZORD1yFBrZUpy9/SCn9b7fWnW5dZ3icjlEtUhkegSjbHqIC6PZzFkOH+FfAcg=
Received: from CH0PR03CA0419.namprd03.prod.outlook.com (2603:10b6:610:11b::8)
 by CYYPR10MB7652.namprd10.prod.outlook.com (2603:10b6:930:bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 00:48:28 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::9b) by CH0PR03CA0419.outlook.office365.com
 (2603:10b6:610:11b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 00:48:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 00:48:28 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 19:48:22 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 19:48:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 19:48:22 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6750mLQ81184200;
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
Subject: [PATCH v2 4/4] arm64: dts: ti: k3-am62: Set MMC clock pins as OUTPUT
Date: Tue, 4 Aug 2026 19:48:21 -0500
Message-ID: <20260805004821.416613-5-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260805004821.416613-1-jm@ti.com>
References: <20260805004821.416613-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|CYYPR10MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: aa9fa471-a240-46f9-6128-08def28b43e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|13003099007|56012099006|22082099003|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: v8rg74qN2NpP+yTY6X98eE32dntHZxE8uAChHgQzP6rXHP2xEBkMmty/oRLCc+rD0EGL+1Z8N26E04wLb8ntxL2OpPprXQ+71NwkOQzoz7OfXuZhntTIjriqFCbVw8Kp1MOc9LujEMYgps1JSKfkn13480VtyjdFZSUNwmm7xtAsRYJEbBQO35UU0OO34AhCR9GMt3+W4ytqox/2FGvpIFx3v+OTUnpvfvl3RdcVk5h4zkQ/NkSZ/SCk16EeepWP1TfxEHX95FqRMbWeTqpDokGPSo0UGNuBu6CMI6qD500hREQwW1vXTpxiK0/gMqtWpr1KgCDSEjjOeEhp4LCIH4X6phgmD2toeDkJOoDngq/AQWO8SDDZY6o5ihTaNhG7V28xbJybTRyzZJOwCQGc/yG0eKIHL8iH/m2GQqSp/wpoE2lP8AXsTMbqUlIZOSozo97mzjwus84SJyIasltfVzODW+gbWvyLAj/aQTHETBbvnUs89Nr66k2pf8aDdmQADiQtF/z1MY21pP0C+6LR4t2B+46Y6QF1saE+hpz/6DRph9j83C6cOwLyb7x/sWO5UKxO7i1PmtigUrq8KuUfTUBufnX2Dq1+x9INiVQmvUmEojJ+qxJMyV77tfmmCaA2GSeaqwtUXPZOxiNsBMwdzy9to+ryu0dRxoLV1CQdjN8CQfBWM5Ol8S8aX1HaazedMGSVxN1FezuFItUU3HFc3Q==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(13003099007)(56012099006)(22082099003)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cwPS5s4ch4HCA3NVX+i8HF5d6a+lns+uwuK+lOJT9YIAG0beFOeqOUrwYD7a+T3EuraVdOLLe7HSJjedT8XBiK30tOxDX8B6+TQvIGZ9CSm9DuQXlSqOYtD+EqCVXL0eL6MRaSWNdxFuyIKwzls0OkfzWtDJT9e9BjD84GQkCmedhInEUGTiXH9uhvOGN1aCI/Zbep6XiFdYTJCr/MYBCkRvlxgEJgnX40ZK/QbLUGi5LlYsd2TZVuvD8wyCYso3lvB5Tc7uvgSNo/GkGiklGYmgipxb4MDXTET2RRf12zVWiCWWisETtsxVAV006A9g3Ad23H8HAXQeZvsSGuSlvYc+FsdBRrQLl+fkD+77CEZNLZ1BpnAX8Er0kNkobe4YFvskFpxP/D/lOulhAnauSrZqHsvrXCFgEgc/hfibI51vgheTICvtvG1H3JO54YWs
X-Exchange-RoutingPolicyChecked: jWb8ZQ6EOGcYKd0gXJZjeOxozq0NgIr9kIPL8akwQyLwJbY/VHaUxOMZz4qVzwmgBzd+U9XyfQCOXb0kYSeepC3dr6psbJCwDGhjQVKWZeiO+QMjLSSbBHFHVuR3dtaDo/i5r7wtRyZ2GFbQCx1KfqhJ5x++Rx8svTmWlI2JoUIBouTAZRT7sWUBiuBV+X/XYcTMzjBHNeUAGyOms0z4fYM5xphLL7bOr3IJ0P3nKRkXYs9dQff0yc0NjuW73RVza9olVQqa64CWn2h1ccXaDeWy0grgNVAaVZ7D0+LNLu3Oxi52XHWIKrWMWc6ALm9jIlriumsE4u2KvIqUnkSfbA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 00:48:28.5942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9fa471-a240-46f9-6128-08def28b43e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7652
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAwMyBTYWx0ZWRfX8b89k3weS+gG
 nlgwXqW0bF54wppoAL+ScQB2LdQxhPC1gsIhC4TVB3iNVp31WKA6JaK4O6vLuCclzkt9WcURP3H
 5cr8iAfpDbylKmbEJKGx1ok+XVh5KcTBATcBLqAAHu71qpHHp6ceb5/QEZtgKufzJVmmwwwe3oP
 R46z8uW3ZR1Bn1TzNnmEG+PLA01ho3a4YQbRLUUlPJojdyp0f0DraXFVVqIyOwVil8Wnw/nNuz2
 bUL6423E2LwQa8ESGecOtdifXD0TxxFi06KVJb0hsYdF6onwhIBU5T2Xk4L0NEIGfHNt2eeujNn
 ZvmeFU1iVD2EYFlbwVEJwBwydjimzadkdY8Vo1bRiwI56jhGEu2Nc8ozGctH+8JswuEggoGDn+n
 /Lc0E8gsATPcrxEz1mC7C6K+Kh8XsVEXjITr1Q9mbX7TnWLATFF6OcfL5plCHKB9WUDAGTbGC16
 Y94rqhv5HfT99MyFHgA==
X-Proofpoint-GUID: hSfrVdFsHxn0CC6J1KY81fZ_OqTM9phB
X-Proofpoint-ORIG-GUID: hSfrVdFsHxn0CC6J1KY81fZ_OqTM9phB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAwMyBTYWx0ZWRfX2dfscXSTwsJg
 DlPehzZKAdsFKHdg1tMvPb3BrFOkCuGQ0OqLdoGRe8ZkkkxvGOlHNd4R8CpObGuOZIu+BEVWOCC
 AmvdzD+uaFE2CkLw6uBgRyF/TmrY/6c=
X-Authority-Analysis: v=2.4 cv=GNA41ONK c=1 sm=1 tr=0 ts=6a728860 cx=c_pps
 a=9z8yexD6E2gW5LInT/Y/IQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=ea4yy_Dv9dZP40v1UOYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_06,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_174835_452617_58F9247C 
X-CRM114-Status: GOOD (  12.37  )
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

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts         | 2 +-
 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts | 2 +-
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts   | 6 +++---
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi   | 2 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index dfd65c00f5b95..7fd508f4eddf1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -86,7 +86,7 @@ main_mmc0_pins_default: main-mmc0-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x220, PIN_INPUT, 0) /* (V3) MMC0_CMD */
-			AM62X_IOPAD(0x218, PIN_INPUT, 0) /* (Y1) MMC0_CLK */
+			AM62X_IOPAD(0x218, PIN_OUTPUT, 0) /* (Y1) MMC0_CLK */
 			AM62X_IOPAD(0x214, PIN_INPUT, 0) /* (V2) MMC0_DAT0 */
 			AM62X_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (V1) MMC0_DAT1 */
 			AM62X_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (W2) MMC0_DAT2 */
diff --git a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
index 7a4cffc27bda3..1c691629d4ad0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
@@ -235,7 +235,7 @@ AM62X_IOPAD(0x0020, PIN_OUTPUT, 3) /* (J25) OSPI0_D5.UART6_TXD */
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x23c, PIN_INPUT, 0) /* (A21/C18) MMC1_CMD */
-			AM62X_IOPAD(0x234, PIN_INPUT, 0) /* (B22/A20) MMC1_CLK */
+			AM62X_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22/A20) MMC1_CLK */
 			AM62X_IOPAD(0x230, PIN_INPUT, 0) /* (A22/A19) MMC1_DAT0 */
 			AM62X_IOPAD(0x22c, PIN_INPUT, 0) /* (B21/B19) MMC1_DAT1 */
 			AM62X_IOPAD(0x228, PIN_INPUT, 0) /* (C21/B20) MMC1_DAT2 */
diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index c468b9c5fc09a..898e4ca3fd87e 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -323,7 +323,7 @@ emmc_pins_default: emmc-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x0220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62X_IOPAD(0x0218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62X_IOPAD(0x0218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */
 			AM62X_IOPAD(0x0214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62X_IOPAD(0x0210, PIN_INPUT, 0) /* (AA1) MMC0_DAT1 */
 			AM62X_IOPAD(0x020c, PIN_INPUT, 0) /* (AA3) MMC0_DAT2 */
@@ -346,7 +346,7 @@ sd_pins_default: sd-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x023c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
-			AM62X_IOPAD(0x0234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
+			AM62X_IOPAD(0x0234, PIN_OUTPUT, 0) /* (B22) MMC1_CLK */
 			AM62X_IOPAD(0x0230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
 			AM62X_IOPAD(0x022c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
 			AM62X_IOPAD(0x0228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
@@ -358,7 +358,7 @@ AM62X_IOPAD(0x0240, PIN_INPUT, 7) /* (D17) MMC1_SDCD.GPIO1_48 */
 	wifi_pins_default: wifi-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x0120, PIN_INPUT, 0) /* (C24) MMC2_CMD */
-			AM62X_IOPAD(0x0118, PIN_INPUT, 0) /* (D25) MMC2_CLK */
+			AM62X_IOPAD(0x0118, PIN_OUTPUT, 0) /* (D25) MMC2_CLK */
 			AM62X_IOPAD(0x0114, PIN_INPUT, 0) /* (B24) MMC2_DAT0 */
 			AM62X_IOPAD(0x0110, PIN_INPUT, 0) /* (C25) MMC2_DAT1 */
 			AM62X_IOPAD(0x010c, PIN_INPUT, 0) /* (E23) MMC2_DAT2 */
diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
index 9c83626826453..085b067d96fbb 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
@@ -98,7 +98,7 @@ main_mmc0_pins_default: main-mmc0-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62X_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62X_IOPAD(0x218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */
 			AM62X_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62X_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
 			AM62X_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index ab9e58c2d225e..d2f41e2ed6239 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -194,7 +194,7 @@ main_mmc1_pins_default: main-mmc1-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x23c, PIN_INPUT, 0) /* (A21/C18) MMC1_CMD */
-			AM62X_IOPAD(0x234, PIN_INPUT, 0) /* (B22/A20) MMC1_CLK */
+			AM62X_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22/A20) MMC1_CLK */
 			AM62X_IOPAD(0x230, PIN_INPUT, 0) /* (A22/A19) MMC1_DAT0 */
 			AM62X_IOPAD(0x22c, PIN_INPUT, 0) /* (B21/B19) MMC1_DAT1 */
 			AM62X_IOPAD(0x228, PIN_INPUT, 0) /* (C21/B20) MMC1_DAT2 */
-- 
2.54.0


