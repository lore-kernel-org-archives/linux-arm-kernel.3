Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3593CF6A86
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 08:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=crFJpDN3nCDaetNr5f4ymY46WdWtGa78wKvC1ohY+uY=; b=tBDGGZUbup8haM7lgz6oB7qfRy
	wtI36itktCMzkeqgUQKtw+sowu+3vHQ+RsrW3kCKlQEeasWq92+8F10NcJ45ICDVXoisFlFEK/wY0
	8DNGaRU4zcWqCvXDOwM9dewOKHb2Qjn1xtDJSYVCVMKMSlssOrUAqRUMQM+iINcU4I3ZdmwzVRRAj
	n0ySv/tIlmpmeB2suPSmMF449GmKfA6LI0zR3bH5tsFOwb+S3XbsB4nOlzg+oLFU2nRkxDZkWMPMO
	IzOAF1Hc0eWSXaWozbd1hRWFe5Lq25aW+SGVn504SxdcFPl08d9zxXnNVvU5fgKqi0gzrm2/hyiIH
	KzMq59Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlmf-0000000GMEh-0t0s;
	Thu, 08 Jan 2026 08:54:21 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlmb-0000000GMD5-45tI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 08:54:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5zFNBYx7DNtdujC1hLTFIgisewavy9gddekb6/lMpoo8wZydJE0BWDjWEQ2MOdp0MWCo+YqsPVnp6Fx8OMsk+1Ft8OKybzB+n+aaD4eNqUgYtxQVUomDXSkdmFz/QDjcvzvLW3+VgFQrEvpbB/m9Ly3FwSiZWbbvMJ72Awcilhg+w72d06pudYbTImDRKKw+4jpt4/m8b4IBCsYsQLBeSa1v+JGkO8ycF6wk474xG7NwbQYrWNvseq/pYO67PZx7X2YogWSTcb/SJEUyEKBwqIlLtl0sqtlSVaHGVkITh1Z9FQL86MhkshJztPWGY0mG7zmzx2CiRxYzzLy4GvEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crFJpDN3nCDaetNr5f4ymY46WdWtGa78wKvC1ohY+uY=;
 b=kkTqMopISVtBivS3aoI+COYjFGfYDWZnaQ7NuzZMqQyBmEY4I5Q0H38iM6rb3aXjehFt4PpqBSzpiqx1hTDFmBJgciobXRHdTTUkGK93EBqiobgDE9xaAyU5TksMqYX0XcxDNOtPiIG7S9W+yhSbAm58LO3yrVa/7VLIHl67Y0Yq4Iu1qvk0NS2W5q9MccJiLdj1xwNd49tEPjkB04fsVJe1wassR9FwFhTOj1HGYgJlu++AF6gDBy/iIUxeSiYBcFsEUK9njKajgaW7+bFEZzKjQD3GMaesG+QfAoyCq55wJ/sU49bvuyXyPE9WoNkK6r85ssaJcgk9NvtKNwJwdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crFJpDN3nCDaetNr5f4ymY46WdWtGa78wKvC1ohY+uY=;
 b=HY92FRImxZ3qZKAG8hSD/ShBD0I4rkXlHcIShfXidSZ3DofoAGt60TUNcqgUTuVuGeMsBXsCQR3WXHkGI3JDu2j4WfiPQBGOF90xjaf5vqbqhIhWj9wvq38gk6X3cM4uC8xUZ1nA6xPAjPXct1Cp1qzeOfnGtXyyVVQodnEqiJc=
Received: from CYXPR02CA0038.namprd02.prod.outlook.com (2603:10b6:930:cc::11)
 by DS4PR10MB997550.namprd10.prod.outlook.com (2603:10b6:8:31d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 08:54:13 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:930:cc:cafe::b4) by CYXPR02CA0038.outlook.office365.com
 (2603:10b6:930:cc::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 08:54:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 08:54:13 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 02:54:10 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 02:54:10 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 8 Jan 2026 02:54:10 -0600
Received: from uda0543015.dhcp.ti.com (uda0543015.dhcp.ti.com [10.24.69.9])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6088s6202211937;
	Thu, 8 Jan 2026 02:54:07 -0600
From: Abhash Kumar Jha <a-kumar2@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <u-kumar1@ti.com>, <p-mantena@ti.com>,
	<m-chawdhry@ti.com>
Subject: [PATCH v3] arm64: dts: ti: Fix the number of common watchdog instances between J784S4 and J742S2
Date: Thu, 8 Jan 2026 14:23:47 +0530
Message-ID: <20260108085347.1416637-1-a-kumar2@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|DS4PR10MB997550:EE_
X-MS-Office365-Filtering-Correlation-Id: 14665c1d-777a-4f32-4405-08de4e937f40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|34070700014|34020700016|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P0mKYxc9aQjVtaRKAQrUIoD6hdoilx09e49JVDEHaXXxC951ZyXd4/WKvXts?=
 =?us-ascii?Q?VLb9pp3L1yCCOhxgdT6ukqhEV2MUo/qKdmC0y+awsJsP/UhnaZHUIGJJsTZR?=
 =?us-ascii?Q?MQKrLIoz+ibH6+NtTMlY7jIXmjEZdeivhuCFvOcnS6NXO4/oY47Vji4G/CmB?=
 =?us-ascii?Q?V3D0eBNpEfSkVOh/Kj5pEkFeCeT71pWXxDvqSrMxhab6hAKA/Wwmv9vJlQPh?=
 =?us-ascii?Q?k9Ej3EqNzS2KaIZdQy+kOJcf9Vwe3u3vpzjHYmxi0tsxyGhJHkJwcB7We4Ua?=
 =?us-ascii?Q?/SyvSmeDakk9g0e/XmlE/L85S1FRp0OtsBcLiZLtTiZOgaSZ34nrjQ5X6tWf?=
 =?us-ascii?Q?gmfN/xQpo28PfJg7ijWBkbFyWA+MjPNDIWaH7ssJ41xSMG7G7LJ4qbqsh7qs?=
 =?us-ascii?Q?hK4XCntpZ8woelmr7HCNQxc2+y/Ek7g8kk8d8Fo9gd2ftvF5JzXszuGdce6i?=
 =?us-ascii?Q?tXecNYhr6VSxnUgU1wz8xVU3NuCua+GqOumQTxp067FVHauTxBOlgzGY3utx?=
 =?us-ascii?Q?TPX7/TDkuNUXblRTBXa1pJhzqOE6gAaJbX9tU5DkP1BRgJW4/y6uCxElw5oV?=
 =?us-ascii?Q?nmlLfj2S7LbUZCg3HcFTD/5aHgGRFqFP88HTa+MgbNOV3DLWPbqG1Oluuzym?=
 =?us-ascii?Q?gIwlmVKkiFw9VOsqvLc5vAYQifhok73jCuFz+TbvnjfG0kZfFg6tO8g4pgxr?=
 =?us-ascii?Q?s1ai/rtJQpglRrXPtmL97Xqc87InCFOrbZaIdhgSdOAtCs5wbs03vU8m6xCg?=
 =?us-ascii?Q?ZsS+jHB1IzDjRWyJF0hvOow5AcIbcud6OtYbN2/0TLjCXJ/fakT64sygZDcg?=
 =?us-ascii?Q?FAw6pIzTMNAo8R0Kmet2AX5eWii3jG6sub6vBEyewJ2HBP9WuiVYx0irh3Ff?=
 =?us-ascii?Q?ixXTriZpUqsPSQm5zstx//UD+MKrm8I8zI7hLiGsYZGa16igA6J0Ut+LJzCU?=
 =?us-ascii?Q?AvKxDjjcFWw0qiLKsJC5Tvkkzn0RnYPrHHPyTT2soMV89sMhfb25kn6/98GM?=
 =?us-ascii?Q?hxyyMygFX8WTxSFffdJ0r/ZGlNl9O/FdErc2uMeXFE1tHbSl/3BeSIXSDrRr?=
 =?us-ascii?Q?tE+PKigs3Cx6y8EozliNFCKhbu2NDDz+3ZWdKN6WLdYbP2raMDJJpxNjiYZP?=
 =?us-ascii?Q?EhW281XLiv31uHQ1bdNjedWW8ILEj73EMQ9ZEjIoIwkYRAgXK4eSE6HKGPT5?=
 =?us-ascii?Q?ixFseyX9GxyUgOBw72dATowf1rqAVaStC/zdykLsK2JGH4bnnU1hoMWivaLi?=
 =?us-ascii?Q?J66jd1i07xffZdfQ3A+K1BxZBaISMn0I4FwnhgpXMFhgZhWMQsUOGnH6evDu?=
 =?us-ascii?Q?U6mQKcWJ9kmUJGaNaXSMgm+fnh7AAdSNgNqJLtXCMxN4XDsrP/ELZarSDFDq?=
 =?us-ascii?Q?8aZENePGZCMEcn9qCqk5hJ4hR3DDym5VEu+buMCHS9kYwXbLfeHkB0WbFNcy?=
 =?us-ascii?Q?I+lHtemKfzjkIbh7w4HDYS089YHUqdp/wo/H9szDB0SXG+joKAYAOjic91Nr?=
 =?us-ascii?Q?Ptvgu70emyVDZVx05t1wD5a/+KR5xk6GP+ndOq7Szih4ZNg/NdsG/CNy5x0S?=
 =?us-ascii?Q?y2qOa7sgKWd0imsF6/vULihd+u8BjZaRdT88Knnk?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34070700014)(34020700016)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 08:54:13.4511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14665c1d-777a-4f32-4405-08de4e937f40
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997550
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_005418_193523_4D959D10 
X-CRM114-Status: GOOD (  12.54  )
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

Each A72 core has one watchdog instance associated with it. Since J742S2
has 4 A72 cores, it is incorrect to have 8 watchdog instances in the
j742s2-j784s4 common file.

Remove the last 4 extra watchdogs from the common file and add them only
for J784S4 which has 8 A72 cores and thus 8 watchdog instances
associated with them.

Fixes: 9cc161a4509c ("arm64: dts: ti: Refactor J784s4 SoC files to a common file")
Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
---
Changes in v3:
- Improve the commit description and subject.
- Link to v2: https://lore.kernel.org/all/20260105050557.3459321-1-a-kumar2@ti.com/

Changes in v2:
- Added fixes tag in the commit message.
- Link to v1: https://lore.kernel.org/all/20251224055410.208516-1-a-kumar2@ti.com/T/#u

 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 36 -------------------
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi    | 36 +++++++++++++++++++
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 9cc0901d58fb..c2636e624f18 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -2378,42 +2378,6 @@ watchdog3: watchdog@2230000 {
 		assigned-clock-parents = <&k3_clks 351 4>;
 	};
 
-	watchdog4: watchdog@2240000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x2240000 0x00 0x100>;
-		clocks = <&k3_clks 352 0>;
-		power-domains = <&k3_pds 352 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 352 0>;
-		assigned-clock-parents = <&k3_clks 352 4>;
-	};
-
-	watchdog5: watchdog@2250000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x2250000 0x00 0x100>;
-		clocks = <&k3_clks 353 0>;
-		power-domains = <&k3_pds 353 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 353 0>;
-		assigned-clock-parents = <&k3_clks 353 4>;
-	};
-
-	watchdog6: watchdog@2260000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x2260000 0x00 0x100>;
-		clocks = <&k3_clks 354 0>;
-		power-domains = <&k3_pds 354 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 354 0>;
-		assigned-clock-parents = <&k3_clks 354 4>;
-	};
-
-	watchdog7: watchdog@2270000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x2270000 0x00 0x100>;
-		clocks = <&k3_clks 355 0>;
-		power-domains = <&k3_pds 355 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 355 0>;
-		assigned-clock-parents = <&k3_clks 355 4>;
-	};
-
 	/*
 	 * The following RTI instances are coupled with MCU R5Fs, c7x and
 	 * GPU so keeping them reserved as these will be used by their
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 0160fe0da983..ffc61ec77635 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -113,6 +113,42 @@ serdes2: serdes@5020000 {
 			status = "disabled";
 		};
 	};
+
+	watchdog4: watchdog@2240000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x2240000 0x00 0x100>;
+		clocks = <&k3_clks 352 0>;
+		power-domains = <&k3_pds 352 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 352 0>;
+		assigned-clock-parents = <&k3_clks 352 4>;
+	};
+
+	watchdog5: watchdog@2250000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x2250000 0x00 0x100>;
+		clocks = <&k3_clks 353 0>;
+		power-domains = <&k3_pds 353 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 353 0>;
+		assigned-clock-parents = <&k3_clks 353 4>;
+	};
+
+	watchdog6: watchdog@2260000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x2260000 0x00 0x100>;
+		clocks = <&k3_clks 354 0>;
+		power-domains = <&k3_pds 354 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 354 0>;
+		assigned-clock-parents = <&k3_clks 354 4>;
+	};
+
+	watchdog7: watchdog@2270000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x2270000 0x00 0x100>;
+		clocks = <&k3_clks 355 0>;
+		power-domains = <&k3_pds 355 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 355 0>;
+		assigned-clock-parents = <&k3_clks 355 4>;
+	};
 };
 
 &scm_conf {
-- 
2.34.1


