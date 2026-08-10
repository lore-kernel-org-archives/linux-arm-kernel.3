Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F80C5B570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 20:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+OVnkF7JERHCEra2CKswAF0y0ZGu6Tp5lLq6Q1HXAo=; b=QotfndGXd21Y3arv9wI7zgZXOn
	4UbBJf+RCqb5IECKB+BOfx5ZBlmRSuKasyV9Sbk/aLiCgfZFkwcWGfOsKcTnmkopkCct+rfDKAtz+
	UEeE+1JnYbg9mgpyMl1IU9ZUx7Jg6ueyRdXKiO93CwAezHHD4jwoQso6i6II7+vqUuGNycdcQVY++
	zNnZQb+3wBTyNBhTsVkMi+nyEshc3E+A3ITT8mBfq080MClszIbXFEDgCWLd+JGXut3K6yAdDBEoi
	6HfgbQtQEwDCgrdZIcpaZbeTEfJ7Bb34NMWMErKPHayNulrrIFWB0E0hPPVraQIEkkBmoYy6QHg0L
	iWfSGmyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWz4-0000000CrOh-1aQn;
	Mon, 10 Aug 2026 20:52:34 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWz0-0000000CrLJ-3VHC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 20:52:32 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AJjQQr3700986;
	Mon, 10 Aug 2026 15:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=h+OVnkF7JERHCEra2CKswAF0y0ZGu6Tp5lLq6Q1HX
	Ao=; b=SXSOOh3iQs3zClsVpuGBhRbFvSvUP9BSKVtjP4Tt9hLv9MTDciK+PrSut
	mU4gkX+7i2Hwu1mz8ejK/LIUJ0J7a7Zs4I81NbCr+aylcNpwPO7KxJH0aYHSAXxw
	AoKaBb4+6ej3ZfIeJ5yo4nU7Xw3AITiXYOM4L7Mfqyonp5/R74w0IEa6AdjQk0vX
	9FFvWroOprtw9bdkkYvUGQdkiZ9539NShdm3WjRq1czQ9Rmptuo8EUKavHlezgUc
	ORRLaGNdTpcQaB0Pw387nNBTZMy5lyQvWG28f0KM2yuCM9bNCEAvlm+U8enwLnTW
	LKkdxb6DPHRUhSDMSDoO+KUgxzERA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010061.outbound.protection.outlook.com [40.93.198.61])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fydkwv0ad-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 15:52:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0ojxbfoR3R6Vo5eZYmo9R8qLPzIt7sWLAUZeq0y9zrLkKU8oSswzYWbOSsQHC8CN3VMi7z9JfIRGcdf/KXOu2t7xcxr5nDWBTLoFk+N0Xzth+8clpFxXAQmvIM7eiCaUcKEIF5fOFcmhdXKBXIwJHtBc4m9i/5TL6GWNcYSpABC2JXNdwqdaYVJg5xFatB4EWJ3PyZRPkuAwW4qhDai8+Ry6WGGuZ9kB2OntTJabCiP4LH1yb6C0PSwsaGXHq09CpBckqnC4vpT5Gwg59Lfqw8BYInj+l90LVSXjFBXt+wU8L2Uzta6sm65ZX5fFHWghbn8kALrF+5K2YorZU7o0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+OVnkF7JERHCEra2CKswAF0y0ZGu6Tp5lLq6Q1HXAo=;
 b=EbQMpAKC3mFZIoD1mVSrKfGE+vYvWNAHLtlxsxzegt93ws10dXlzexx68TJ+6DQMJhjcu4l56kPh8RIoM+gFUQ+l8GN/WYek+MrC8uoC48DdAzn0soelSdOBDBemeMdctPLkcydMCT4grApEnmXISfRweV2E/ejwAj+U+wPoSwj7vY2G+ZUkr9x3Pdcmd+lQ3qvdN4+vD4D2uzjQpp2MZ5I2r+9la4IL4PnD8K6ADWyZBgRkkJectnOFGE4dKMJZ55Dud2/iKPc88bvRMlaN7bmn+8WL/gwupWh/2IVteuRbrXZVeCnvrsI8D1QcLCyUaXcT8D89mmCnnhh4dcO8DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+OVnkF7JERHCEra2CKswAF0y0ZGu6Tp5lLq6Q1HXAo=;
 b=l1Ub9wtHIfM6hSkPXfS9Q+a5jS1+9+0K1n6Olp+ANadM/yOKMfUTV16SW91rC9pUoqplDq9ar0UaEcYEFUyWw49jowbzMlf5+v0qNeQHmlwERCa+mL72fYui35ttg4386YUw4XsTybOnta6rKptMS5xAHxgb1Z0w+mTlY2flcr0=
Received: from PH0PR07CA0030.namprd07.prod.outlook.com (2603:10b6:510:5::35)
 by SA3PR10MB7022.namprd10.prod.outlook.com (2603:10b6:806:317::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 20:52:25 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::a8) by PH0PR07CA0030.outlook.office365.com
 (2603:10b6:510:5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 20:52:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 20:52:23 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 15:52:17 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 15:52:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 15:52:17 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AKq8Sj3838072;
	Mon, 10 Aug 2026 15:52:17 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <b-brnich@ti.com>
Subject: [PATCH v2 6/6] arm64: dts: ti: k3-am62p-j722s-common-main: Assign SRAM to VPU node
Date: Mon, 10 Aug 2026 15:52:06 -0500
Message-ID: <20260810205206.685971-7-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810205206.685971-1-b-brnich@ti.com>
References: <20260810205206.685971-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|SA3PR10MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a49f506-196e-427f-db5d-08def7214767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: boHEIUetyg0rF4L0hRK2CU6Fswl7+VUn/6Nqi7Y7MGo+0lmZR8DpGhPYmwAbWk2NxLthoj9ZbfjWwYqWgDmkJ/moQWM/KrvYPFko9whf0t07k1yuODijfUBoZIch+DmQc0wSCmR2ginDaSBjfmEHpePZ7yEhITZ8fLZb9XMeNf1Y/S2Q5IDGYEjkquY+z4I22LIibUak5LH9AuZGc5dAVdAeRB3ZHdmqvmsRJQ2smflMG/iTzu+xXHtTZRAoSRNRPheErwsNW41ajti/nw/2YtoiVb05LntFu5WYGNHsXdlOJ86aiS8B/v1/8XTf/l7F1iOmDpTxGQiJDkMlJIfiH5n4fSzJwC9bNSU1ra6q0Vg8KvmqJ3J/8gjQiCoZwTZGgONPABFRqPcqseWkIpT2yauyXg2pnNOsJ/SsMnAneZ6U+vAodXnvVzuV1FYrzdRT8ZV/vIzO3/m7FaTRbq3t541P3mOXXPZsRlMLVMwo3TIALxPQ9zXXxnhc7vBy/x4fHN8a5Amudy/nV8RWLRUFuMkE2TLS/fIEZGQ7n8YdzUfffDi7y9eTEyxnRanGb6mjvAEoQcTG9Nao3Fbb2KyxBJd4N2loH+HVmPJ/+mpSldRFH3T7vqfCpCbMk3hPPi/wtPzOQaWaLIytPNkBjKyr//8JXN/5SBd3GGu6EGQv6wSsa2rHUen/3ItEF7tjfeUglJ5IzgEU20rMv8IwDQyL/A==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NUMLfBv3cMCOk3qHnpl//a3kuyZhbbEKDeJf8r5oUY39yzC3PCtIAaz9LEwiEuJiKRDIjzex3+pa+tqbL0MW5N9rbzk81LrpzPlHrTcLl9jW/SBpDRyNMwofN3ZrtxE0Zsi9D3mmWW3sAJMPQGmwT8GxhAgD2UfKNkAIIRLVEe0z6oppxkynw2PA38F1yaac3ghuah2Ouqvlfb6SlS/ZEDnaXrzCxNvflSlO5888cTcXNgqG4l9zcBYXVbzEDO0dlcutxFJG0/chii6KsW6LFBhPNwTPUQvz+fEhaDE0wkGJDe4FFWRNfwpBkY5RyAfxPonmKyCtH1P4EfHIPBYlC1j9ybaQDfex9lyQPBJumBOJJmws85JZVu7V5R7e/XrZBx9cWYA86NtCC1ZioU+E9y1TznmFL4L3HQYLkPSDRIDS0Q7QGFwbLosM49WutDnU
X-Exchange-RoutingPolicyChecked: egFeED6tJAEQVmddayHaGR3XIpazFRFvegu/asUwsVdLxyXDu4L27CZq4DilCj5BWUyFlUl7Fe+OxeP1z8pkriPSsfwNk4vyx6zc4ZbFENQcx3S2B1MWQPeOKXU/UYDNMqO9KYGnsb5544461aN+Peg7zNu39B3jMC9K4eyksDaDhOBAu0Hlt/h3eixCMq6EKjfgBIslhiaQziTwHdNfwksZy78Ao5J+IZj5Hc0hzjzeV1YmfTmXxZWvHGyuCN8kdsG/g184LYY+GJDVWTlYWgrLKCVzZtOTi6p2O+awO33W/nukO4m0mIjCCm7g/QubXXWAmMCvv65FDytH/5kp+g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 20:52:23.6268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a49f506-196e-427f-db5d-08def7214767
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7022
X-Proofpoint-GUID: Y9GPKZRsa1Fz--nASefZwF08bUiNaE3K
X-Proofpoint-ORIG-GUID: Y9GPKZRsa1Fz--nASefZwF08bUiNaE3K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE3NiBTYWx0ZWRfX3LJ4KlyaVOMZ
 4Q0PiR0UQLn6cBypFhXoW8C2YeIjs5Lbu1rnT4RrdXkI2NsG3LGYY02fwlLRZufIzKBJosdPd/O
 8/eRn63r2F6mR6dncQuNTnzLqyZgZWmwQRmH9Gj/+ZBpFarI5EKo/TsJ+RS57eBp8XmyLPHL4bL
 ycNItEJlSGs+saaq4RKuyD/BJFUfveo2ny3oSv+z3QCTW/6zeJgjO2x1i3ZBF6cqAmnVWVBayxK
 xYF2abtUlibmW+In+VSl/K6LJKDrmNx3Clh8uYkq07vubCqt1RWwXY1mFy8qIBBK8/yOnaVq40N
 6xSFjJc7zETI3gpMiEoyuigii5Hnm4ZVM9Wt8Knu0GQM/+wj0eSXG3sTUXUXd+cO2tRfzAdHw/Z
 PI3SbGH9PQXr6JOJ+T1lCpBnvMMuDse9x7QDY+C8S4bX1RYsxn4PEpc6JlwxqcS7j0O1YQtG3VJ
 IGb4YE6dp//9u8tvRug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE3NiBTYWx0ZWRfXy/RP1PF1E2I1
 qhdMIb/rNW2DJiniLt4H4ChHW7ZsGlHUvqfVXzfxo6vPZgb2PaIHWmj3xf/N+lyMevgFLj6EKXB
 sTxeoI/M8EqvP52kH6rmNvy0FB4jR7Q=
X-Authority-Analysis: v=2.4 cv=F8FnsKhN c=1 sm=1 tr=0 ts=6a7a3a0d cx=c_pps
 a=tFiMKzbuKqM0PzijJMXBtQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=s826d0Vf4ljoQKYSzyQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_135230_886649_6EB69149 
X-CRM114-Status: GOOD (  10.07  )
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

The Wave5 VPU supports connecting to on-chip SRAM through its secondary
AXI interface. This allows temporal buffers to be stored on a per-stream
basis, reducing DDR memory traffic.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index f130c7cb998d7..61e3588bbfdc5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1117,6 +1117,7 @@ vpu: video-codec@30210000 {
 		interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 204 2>;
 		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
+		sram = <&oc_sram>;
 	};
 
 	hsm: remoteproc@43c00000 {
-- 
2.43.0


