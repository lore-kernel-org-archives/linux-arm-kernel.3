Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CEBEE57C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Zhpjpc1c0TMlMC5CGUy1aalh92jBMjf5Wu35zNspyg=; b=O+Ybh5J66gQgVyBmn2BzMhficE
	4NSVvF2sEN6Ym4vxR8WKZ4fUe/Y2e9+eHe3v70pUFC2Yo2oaoVG7hxN8iEfl3f2wedf8kjEcLGTPR
	UKYLynZcuFSRggcpx+HNDUDDNOJR4HAISfXo6BQBLlsjsiyYQ6ZTIfmz+ZDmwVKyKDYxukDGVs1sO
	w3hyzB+lZbwCfPZ9SCEG2YYRsGefDRFlm4qfnbpNvRRIt2y4/lxzAb6IUAu65Yaw8ZiPVgpdIu7q3
	9sP69XGAbYsKk58wOwmyShTb5EuTcWCfawrSwyE6z3/fC2UzJCCQO68mzo+nlH5DnupvTEHjodbCM
	qsf8CHaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamJd-00000005avQ-13B4;
	Wed, 31 Dec 2025 02:52:01 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamJZ-00000005auj-2CuE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:51:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNlr9Qibd/h1hymGOCIqmGoR3P8sC44t3dpCNu8NvEICFc5N5skIQjO81IOL+r1ofEH7cqdBBgkKfxsxjmAB4dVI9SatzM2JmUTkqwGPXQ65M7Ltv4RXB9B890BKVP8tCoMnFyeRubizimckkXHv4znp1Gadjmik4nV9OXR8AG+A6sceW8eo13bwwD/axwvoCXuR96m3Qz5sDW1q2BRwe4jzpMtlqbrO5EqcenZMMw6g/lw1R1WB2GQpbtUIN1RuGJs++bs3TJysV5ghlGbwlEA/iMBXfwEOLd2R1a1w9tsKah9R0Wb7RH0ZSy2qBMxpCQ21hW/Twc2wZFxI2hOtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Zhpjpc1c0TMlMC5CGUy1aalh92jBMjf5Wu35zNspyg=;
 b=L7y4IeLgSk+20WrdW2UrHTf1ZzM4I5GB+VoM+tQ3i0pHBHiOiSYNvenHm9oGnDqerQhOxYLGMUtqgdvhLqRtEKXxXGopacv9gUpVm+oyWLyVZUxa8MmlOKyTm4CQ2sXeheOT66dGhg4diE9TpwqAHYqt48IY8D0Ns3HCALkBbU2VHcKIW8YtCzB3Cf4RSIk8pgX/KK8u5s0NA62L6WKXytAogztDxbAuJu9CitGaXQnvBxk53AqXgCwROa9xckfk4KEVqO9b+059UiRZW3UDbltixrCEWsMZ8z4JEQGBEU4867CMQgBdqIwzVRSccCgVNHiH6J37kTnz+M/4R1CQvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Zhpjpc1c0TMlMC5CGUy1aalh92jBMjf5Wu35zNspyg=;
 b=Jv+jAOzg/FDoh6jDy/zs09LEooHXI9hAE1rxWBVz+NFVb+6zE2aErWz987SlwVNsWw2o8xE5f2VoNZbUdr2ruJ4mDANj8DjezMZUH1ljrl/1xjezbJilOmeuMz75VEyeSyrtLuJoqAwKs5PS5hbeoWMuKjXr5mRfpvTeCCMUlZ4=
Received: from CH0P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::17)
 by CY5PR10MB6009.namprd10.prod.outlook.com (2603:10b6:930:2a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 02:51:53 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::92) by CH0P220CA0029.outlook.office365.com
 (2603:10b6:610:ef::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 02:51:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 31 Dec 2025 02:51:53 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 20:51:50 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 20:51:50 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 20:51:50 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BV2pn4x1608844;
	Tue, 30 Dec 2025 20:51:50 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Tue, 30 Dec 2025 20:51:42 -0600
Subject: [PATCH 3/3] arm64: boot: dts: ti: k3-am62l3-evm: enable WKUP UART
 wakeup from LPM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251230-wkup-uart-wakeup-v1-3-cd6e15f8d956@ti.com>
References: <20251230-wkup-uart-wakeup-v1-0-cd6e15f8d956@ti.com>
In-Reply-To: <20251230-wkup-uart-wakeup-v1-0-cd6e15f8d956@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, Bryan Brattlof <bb@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
	<khilman@baylibre.com>, <a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767149509; l=798;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=lgf0ZIV5f3s9UNgQ5Aq/jD2qkU7crEaLbDnOdW/oDCA=;
 b=KXceLbzPBeq6W5/BbP43MV9obi+SKVOlGMZgazl/1TuVmT5UgGQTYsBPdqP96oHZmxW5MxhtU
 lrT1L+mgRx6C0rcJzGg6T7h/JaNG0NAc7YRFlvb0DXrHPbNCjndb7Q7
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|CY5PR10MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b91aaa1-e815-4949-8166-08de48178dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekJhLzdYLyt4V285WUVKdlVndzZsTmhXVk5pclN6U091Vm5WdkowNG83bit0?=
 =?utf-8?B?ODZsVDAvMDkzUCtPT1ZiWUdZbnV4MG41eitzRXNDYjkzSk1sTHRYN2QvdkNC?=
 =?utf-8?B?V05zMm5qVWlVR1FmaWE4UXFkT2xKZmZEU1JqUStTQko0cUgzWHVpZlRLWGp3?=
 =?utf-8?B?WVZuLzBqM1pBZGQveXorYVRHWWJkS2tLZ3VtQ2FmNFQxOUFQNi9aS3I3Sm1q?=
 =?utf-8?B?UUpMQmMvQXI4WmFYdnMrODZ0MkNaMXR5enY5alBoVUZNZ3Y3bjcrTVVYY0w0?=
 =?utf-8?B?UWFOZjdxNjFPTWRlNzdXeFN4Q3NZYjN6a1ZaeC9SRkRzSE1CbE5qOVVNTXdI?=
 =?utf-8?B?UGpjTzhWcUc4ZEVzVHJ3ZFhyNjdKd01reVg3Y1dEb2M4RVlIUnYxWWo5TDEy?=
 =?utf-8?B?SlVxZ0t4Y0VoRk9UeStNcVdKMjU5bEVqSi9Bd3dOclkyMWhZVnB3UE4yY1M3?=
 =?utf-8?B?QUt2c0FrRkVtNkV3TkZHMkY5OHFwckZqVnVJNW5BL20yV3cxemVlWUNHM1VF?=
 =?utf-8?B?MWFWMS9SclNpaFFBQWxQVENKMVNpZjRPUkJoOHd5bVc3K1N4VkcyWkpscGVy?=
 =?utf-8?B?Ym0wQm5KUWZjTkxxb0VDZGxIcXlmZld0NWczeVV6M21pOGVWZ3REMTkwaURp?=
 =?utf-8?B?R083VzNvUVF4VGRCOTJNUXViRHphOVQ0Ukt5NjV1N2tIRzhSVUJQOHllU1ZK?=
 =?utf-8?B?WlBXVjM1RGRNb1FPcEhNMlVMSVRyeS9lelpZNTNzM0NpNU80WGdjZ0pZSFJq?=
 =?utf-8?B?MVZGVmJmbG5JMTY1WXc2MEhwZHNvZ0R2QWk3azBkc3BoRUlWMTJPUm5Zc2hC?=
 =?utf-8?B?MHMydlg4dWxPZ3ZZaHRYVWlhQlZHUEs0bElCNXpQMjdwTkdXQy9pL0g2VEVJ?=
 =?utf-8?B?NVRzWGRhUjNZVmxKcUozR0pYUVdjSE85Qk1CZ2ZTMXdNVmlGOG5NUFBSVk9N?=
 =?utf-8?B?N3JlQmJPd0dDYlRIMUdFamZTeFVDOTFEMzNERXFTczZEdEp1NHpkR1pFV1Zn?=
 =?utf-8?B?bFM5ZHlYc1BKY2tKeEhvczRSa1grTkdqa1NSU0VyWXNGeC9uM0pXZGptR3dC?=
 =?utf-8?B?YnZiblR2bGtUYmpqUGRiRTFkVnBkYmZpdFdJZU1xd1lpMkpVNW5QdWgveFRq?=
 =?utf-8?B?bVg4RXhYdkxxcGttL2pCMEZYL0ZVQ21GNTZuL3U4b3NWbjZZR0V6TUxzNEtw?=
 =?utf-8?B?ZzJXNFFkQmZ3cVMwSVNvTnFnTlVNeGJGRk9tYlpyeGNPSnpGOG9OaWJBR29G?=
 =?utf-8?B?dDZlRXJ5YWpHTS85TXlGYUsvWC9Ea3NhbDNzMExHVlR4a1kyUDlxYW9VNEJX?=
 =?utf-8?B?Qmg1OVI3SFIrOVBTMnM3NUM2UzNTSm9VMWU4bjJucjNxUTYvTE5oMC9helFa?=
 =?utf-8?B?ZXBZZEdRcW9hTEtBMkdlSFNhRlZNeTUrZ2tWWTlSNHdLaHlKbEhMcklnMktO?=
 =?utf-8?B?b0VYK3d5a3pxa3FlYk1IeGlWb1UwSXBzMEpyejJrS0VnSXliM1lNRGU3bHVD?=
 =?utf-8?B?R01XTmRyRmxjVkppVW0xeDdrRzErN1Ric1pOWmxvakFzRGE0Z3FBaC9vOFVL?=
 =?utf-8?B?N04rM3U3bE1RZVYzdjNwOHptdE1oRHM1QXlaQnVFSHNXODVhMXNiZm0rcXNR?=
 =?utf-8?B?Rk9yNkRVbWZjQUE3NjNGbjhCN1dVM1hpUC9KZUxadG5PNU9Xb2JVL1VYZjRi?=
 =?utf-8?B?SFZxck9NUW1jNFVCNjRKbzRSa1hxYWRKNGtMUks0dlhpL3RPUGN3OGx5NVNy?=
 =?utf-8?B?eDBZZ3N5bzB2dG5ISDlDOW1CTDRrVjJPUWNzSmh3OVl2NTRmbFpQNVFEckda?=
 =?utf-8?B?N2Nyd2hzMUJvYVNyMHd0WHpsNUVaZFBxNVR5VEpoOG1Takl6ejVHWlI0MXNC?=
 =?utf-8?B?SUMyaWRJZkdxT3huVkYvcmptRHlIREZiQzVRakRHYkRMcko2UnA1ZUUxZWxE?=
 =?utf-8?B?WmlWZis4TDViWFU5YnE3b0w5L1U3YW9kR3V2RE82T0Vnb3Y4ZC90SnNvRC9h?=
 =?utf-8?B?OXR0d0FvVGZqZ3BPN25WdEkvdXdzZHRLK2xMWm5qRkhFazJkQmVXWFlTSmIw?=
 =?utf-8?B?WE9aaVhYV2tOWTlHVUkvRmtGUE9JVlBSelpESzRkSmhndkhuMEdiWWFpc290?=
 =?utf-8?Q?a6VE=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 02:51:53.2192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b91aaa1-e815-4949-8166-08de48178dc0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_185157_575995_658C49F5 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

Change the status of the wkup_uart0_interconnect node to enabled. The
target-module node sets the UART SYSC and SYSS registers to allow wakeup
from WKUP UART in DeepSleep low power mode.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index cae04cce337366b50928d39b0c888550b14e43d3..02b1a1c76b2ee05d49cd69d199a6aacdb1973fa0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -359,3 +359,7 @@ &usb1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb1_default_pins>;
 };
+
+&wkup_uart0_interconnect {
+	status = "okay";
+};

-- 
2.34.1


