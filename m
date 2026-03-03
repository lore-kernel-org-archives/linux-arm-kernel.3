Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9755BEDEBF1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 20:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vy+8Gg3COnUOgETIsOGKL8woA1AiV+SHZhdd04p+FYA=; b=aLUWWzvp1m4qw1PewUYvoC/c12
	pEkTUJ0e0anok4BI1XNRtV8XQxI+ntG4vho2ssOq1gKbnGNFcg9iMq8lb5R0QE6Z8Aqp/+flKb/dG
	cMDeYdy2xljFElzI+IRgJ0h26sskOOC7KrzxX7nGU/AV2vpSV1fItb0M1J3HhF95F6zZE45upVO2X
	xKQnlupBT/AGYC/EKowGJaGNqEF6RZFR/QC6EygtVm6+UEHhScUeMcPamxUGhLHbe4Ifu2vNev/bd
	xLbUyjE+ntPwPN2KHBk0lTbvYpobwgpKwcca6UL6zHwhp0P8Fzl0f0N77WWQoRR4MjJ5hhAk+dvvR
	WubYYRlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWjZ-0000000Fvoe-1KZ7;
	Tue, 03 Mar 2026 20:52:49 +0000
Received: from mail-westusazon11010002.outbound.protection.outlook.com ([52.101.85.2] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWjW-0000000Fvo0-2mU2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 20:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCJAJRAin4c0sT1RQUo2dyFxWFWNCwSJR8jXSqeIYU+CRKgDq1bMQB0G5q0ARIpuKhwrsh15GsjTHOujhDtULgcVeqZrqK1PaVE/bMPgpjT/ABrEQ64a/SFlqqM24u/MzL5gb2ZzFsbYEjOa9ak2VcBsF240BYsWph6kHMn9RmZdxM/jn9PphwY4P71bMeGwwrMeH+C17XKNbqiAdhGJwqKvPUq9Gb6wG3dj7GCtbYrQwpXnZf5iMe/Vo/7FjZLFMzipxBjCi29vL1cCPNhnvcY13NV4XqOwUbQVFi1ZhGDHX6W8yPlECNMTzUdVeytrjNzzOPnS1aihgf5wjYX0Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vy+8Gg3COnUOgETIsOGKL8woA1AiV+SHZhdd04p+FYA=;
 b=MNrq4aln2hX5WBtB5V1+uHz++xCSz/uXdI+lRxjBaJIorsD3dLzJaOzLgOTHNh0hhrCa14LjjyBnHrOlcH5DurD3mx7IrIKcZeN6wyQiYhdoL+xAGT3ebbXEm1jvaRPgCHG+LWY3AQRsUOv06hszJAP/ZUuowkXpsx/yCFqainIqIZZCqTjPwDKf3Pan/6/1Im614Y5vi0sdk6BFEsjflOKMar1T5WH6iW2Zd+CxH/s+mdkoTqhf29XEpkxKaYG2w7sFHU3IEZcp4LZmPY/1M45QB7//ncXGOZDLId0w8vIhMQwTb0VZbOybHTrI6C3Q8YSes6Ifmh2Dp82GL5MBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vy+8Gg3COnUOgETIsOGKL8woA1AiV+SHZhdd04p+FYA=;
 b=TslKlv5LfrJRgvwVwbV22hI+GjknwO8pXzknvNAC0fpdaTsKPKmtMuxeuLNOwAlJ6ph+eBh5C8zJCl73p7rguV7OFSrlYhOKUe1nptv1pH0RZolrOse20vyCK/Lg+xr2HZzoIsNUW7gaEuq38uGf86A+MOOs79xEORtQ5SpH0EA=
Received: from BY5PR04CA0020.namprd04.prod.outlook.com (2603:10b6:a03:1d0::30)
 by IA0PR10MB7350.namprd10.prod.outlook.com (2603:10b6:208:40e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 20:52:40 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::d3) by BY5PR04CA0020.outlook.office365.com
 (2603:10b6:a03:1d0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 20:52:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 20:52:39 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 14:52:27 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 14:52:27 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 14:52:27 -0600
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623KqQBv2782957;
	Tue, 3 Mar 2026 14:52:27 -0600
From: Andrew Davis <afd@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-j721s2: Make MAIN domain system control bus a simple-bus
Date: Tue, 3 Mar 2026 14:52:24 -0600
Message-ID: <20260303205224.108217-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260303205224.108217-1-afd@ti.com>
References: <20260303205224.108217-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|IA0PR10MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 7995074b-34ed-400c-b235-08de7966ceae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: nNtqq/yqyIykq94gOwhO3KQMCVTrvUtgmXvEEajkXHRJgKC0XCqG9Ph6rHVKDxLgcHXdmxrL7OU/X6Em1f4VpKbYkvbknyfxarqLGot/Rjo9V+CqA7AqZfQ43BPPglaflPBFWqlKT3NeSJAqL7Y3hgS5aE9cmKsrFXTO0hYTUSxmzqT29XLtZeR8qD9Df+r6tDpuabE8LRs+oIZsSgKZ3SbWmub90M8+5FfWslS6OY6zgzVOC/xGT+K8I4BWSJHJmNIk9uZkEnt5wfuewz9aSHLEbZNlCO/01cY/Lhp6tlVdlY5v5ryPknFH9nb8V/NLbq42aeVhtbRvbukAWaZthSI50i+TQRiunaC/2z4hfYpITPXPeB1YB6z3hqa/mn4/Kt/iVm5Z0G7nQAWzQWObVHbNKqwoFTlHXs35+RhF6zbQ2QmWUXSQ3aGDrLFurLN6MVnUP+ICDe+hpDcT1v2caHx3TL4+pCywGgjg14E0/NR6ARvv3HjYiQmCk/jrRjbQMIwQzYvYa/Z6N1v3YmgmAr8LG/zwqi3v6fXrGzAr6Kxy/JgcsuLX7JjrqxG2x5iXZAA6xGnrfGx5bFFb9d9jzfKEuVg1JKvTPTSWyY2p5M/b34qtcpr2k5ZX2BNA0CFtohN85YhflqVZju2XnxOdfYkbRQ9MY05y6q1LIbQ+0aesiOEZn/+jxznizp05Y5lLAr2ShhKNNmnxozKeb5HueG1A3vdOuDXb7GdcRwub6O0LJPae9HqzUQODElMtkfZdFuoBol5qRBcuobjvIy1Gke5tyR43FZx5J0VQQfD2iE0u+85lTdJqaOlrLLhWrOxZdnhegzq5zGJhHUzo6K6+mA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: H9xB0Il6na6TyDr5VRJoP37AKxOfzsAi0UxlYLocPb5EywXfg/XhshtmG05ZtbmLxgx8l+QvFZjRF0064OSE6GWs/yhsTY9FNufV7coyVaeXJlKYCoRIkSYzWuPjnzQY0wiSTvb771WsDCLZeLdyqndmgZlfIsQD+kM9qrW1WPizB1p3YrXKQ14V8/uqW2SbRbn91ssQiXGU5sV5sZxU8isDNYBhhhnKokfHoUQnJrB6QthBBuSnZrCEQQcp3kYmB4gTUj5+OTpwGD/Nhdh6V1olcv7AaUv3j84Ne2KgP8GjMEbdpqlP7YXPoiAKgfN7q+NAmXM/GONm/Qo6M3aNMqUTmV+dKHpzSP1HDOS+B9ur2qm8ugX/phx4x0evnbqVkMP7U8Ns1yIXXZ04yb9meUszIVYVuowNaShX5nr6ge7PLqrdDjY837LH3VKPt6FU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 20:52:39.3060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7995074b-34ed-400c-b235-08de7966ceae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_125246_776350_53F1164B 
X-CRM114-Status: GOOD (  12.74  )
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

This node describes a memory address range containing several sub-regions
with control registers for various IP in the MAIN domain of this SoC. It
was described as a "ti,j721e-system-controller" but this is a J721S2 SoC
with is not compatible with the system controller region found in J721e.

No project consuming this DT has been found that makes use of the syscon
compatible for this region, to prevent any from using this node like a
generic syscon region in the future, make this a normal simple-bus as
it should have been from the start.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 80c51b11ac9fa..774958aca880e 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -37,9 +37,8 @@ l3cache-sram@200000 {
 		};
 	};
 
-	scm_conf: syscon@104000 {
-		compatible = "ti,j721e-system-controller", "syscon", "simple-mfd";
-		reg = <0x00 0x00104000 0x00 0x18000>;
+	scm_conf: bus@104000 {
+		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00 0x00 0x00104000 0x18000>;
-- 
2.39.2


