Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5590DCA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6ADhZTN/Bi5nvKo+1rrVTnm9eDj7Pbd3NR0LHePGaM=; b=UYWiAuvFzebVfNSathsVTf+RgV
	Sgh9ypR4FFqkQUWsf7FWl4IWzcakqGIPjEiC6/LLdGmeNpWi0cvFGLtrDktpuO68IjSctiSsV9YBt
	PHIJoTiFups5pmC1fpgpQHC23ccQfApQvQ9E4syudQneI/r22MdyA2LYngNeIyl3lLo1atiVxRXrb
	jwz46FbTiwkCUCYu+B+xcHZrW1FG6ZtaMa2l9GgmWdwXhPfzg8/DIIbLEpZCpkk4XZqAhOi7lvqbH
	avCJFPlARbQ7SWppQh0LLdiIXad3VHslRgpY0RJ8BDQRhRIYrd9n9Uam3XCFjfhLY8k2RrvM/XA3J
	JJeFtf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSeH-0000000FEn8-1CVJ;
	Sun, 04 Oct 2026 20:17:29 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSe8-0000000FEfr-1WJo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 20:17:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLwb1Z0GBFWxZjQl+9dhtZ51RAaEbatI3I35qfvcbAC74kwvuoLGgIX9L/vJveM4fE6ZW6mDRS6iRqHnA1iipGhZP7dCYxvi7398LAsBQVcDceytfkpj5KOEanwuKGA/3mTfaJZV6nm1Ma3+6ImJxzcY0rBRoc+aPK0+sQgCb2sYPMeUOWiTNN8r2C5ljq4e8VPJxhM+sVycVxIJQH+hT+4HEIeteL0Ro7avrOK5CF5bvWL5j092osnJFq1hppcbApk/OlZeLtmD7GelRxcM51K+6AIA5ZbQ0eDjTPcBo1W92+PfV3Xx0aUOZkL7wALKXYHBKGf4O+XQ9IPZOaPx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6ADhZTN/Bi5nvKo+1rrVTnm9eDj7Pbd3NR0LHePGaM=;
 b=fzATyH3PJWYgi1XwDmdPxtZAI75IJfxWO2+px/nCGn18kHaHVxvLTSXDtBpjqrPWWub5xYVsazJxLknSDHCq7tyBsLyztW5b1n2nCjgCFoQqf8yEDyfLY/n0RNJqZAibDuiys9MooV1XQiCZhZan7/uHT2DuM7TbINkU9AbtbCT3ksQeLzyQX0Kntv/jPtRMoKuablbspX8Tr0TiSA1flaZQfo+WwtHO9UZa9Bl/xoF7kBlyXmeCwSKcu3BUUpbqaiPvxzSgYDuvczILaZgv4Mq1OnENFTwKW8XtkycFKdXpZ5gRknDtqgoGWjJ3BREPsPqdi7cBmCLnITUOE974sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6ADhZTN/Bi5nvKo+1rrVTnm9eDj7Pbd3NR0LHePGaM=;
 b=DWFnY2kgXQE7ur2aL0Qsi6V3PCa1hbb9T/sNbqj8b0zmstxFjS0anhYjapfB9ldqtYLNZb5fRi44aU8iD/vfou31V7Ufj0Q/orivYgcHAKxcepo0jbL/puSzTJO8vbmHq3WHU6M2tYU8lKg/Dxd+aTECpb/KUXMlynNpSoM0y4g=
Received: from DUZPR01CA0292.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::14) by AS8PR02MB9720.eurprd02.prod.outlook.com
 (2603:10a6:20b:61f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Sun, 4 Oct
 2026 20:17:16 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::11) by DUZPR01CA0292.outlook.office365.com
 (2603:10a6:10:4b7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:15 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:11 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 86C084CEC;
	Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id 2991C803CDC0; Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:16:13 +0200
Subject: [PATCH 16/17] ARM: dts: samsung: exynos4210-smdkv310: sort child
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-16-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2972;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=kENmu0sbWNXXwM4GlEAEO0v7RI0x4fZyDeC055kDc40=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrRD764zpbuSWReka78XkgASm9BqV2lsLbHkk
 zdO31wdWlCJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0QwAKCRCwB25JC3Fh
 a88tCACCNiZttYssh6upFTtQxeXUjxWr6LciOLUg+D+X6vkEQ3/qhTk8ml1lMM6tC6HDx0wIaUc
 0M9ga4PObQcjV3gUbAvAUvgEIQmW5/JJDrid7t7AybmXFDJeNymKsT+sojrRKAzGjziy3sz7vfP
 aA0z5GxOdUyZ56XnzXbkxHS4/nDA0WP+4L/dfEcuTOL12m+OYM54m8lYEFoI9bnxAMdnz0hWZCS
 8ktSFlhXMYVdWbI2GU24PQPjEA4tojqNtx7ScoBaiqRj/6UPta3uCq8ic1a6Gioig2MLUjCjfbO
 53+iMIZkfezK75Yp/nIY5gDWCyzVyar4bNWCIg+se1xRttdv
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|AS8PR02MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 1abaeeb9-a5c6-4ea9-ff05-08df22547bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|30052699003|82310400026|376014|1800799024|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: SQd2XrYggSHyXzDEJmV3LURGmu1UsSEIiCw2SeWxFx5fAOMpGsg5gFZauXzClqz/+6uVE4sW5KzDzTyE0UP3mU7OVfWqLYl3dxZdxYVsxPik4o8dtLZwwa0dTv/fCsNgd0Be65+La2NzpMykVB8NmkecuONlzdcRUWx65+joajZxbJaZ20Ps9WPdRAqIOEgoY/x/Yp0awo5dCvPjXIfwCMmc5305lnw2YPWOqGbB34i7kMBYaxAyykTIm5r/PLyuJH3ATQIShaDGjs7DXoLhHi4oNa5WxUj6OSeVl/E+HZ0Za3yslmXbfwmbzo9h86a3406oG1tXuCX9JrrqMTPgd9sIKSpNfoHAeaHKcTrZS/5jTsf+E/c1qZBgtP2AW/7yx5GcaY80r2+YeOA+g+48IbkpJMcXq40ZFsNfyFu7irYVL9jdgotUMc/hnSsAySnWcS3nL9pBRDfaYkgDWCZl2F7ofl0C/XlMQXEnW1m52E3bUc+eltp+JpmFLAK5wViXwXrSrQytxiVFA1Scm5FWWmb0Iokdo2wz/Rau9c4WKBeXQhUdl6nSl2I2mGoCi3t7AI9ZtLRp2RvvdjasnrEyvMQdkW9yN+wKaN9cMILA/hiiaPHlQvIf3XHhMLc+Q5M3LiA5Gn7DQzm9nP3G3GvltZCy6eZSB6hm5/GKrWFDTo4P5XrskNSFQJz1DPsdJN3HHyI0ADIq49dMdzACCcjEBg==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(30052699003)(82310400026)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ITGpCxNK1NT/1o1XpyyWll3TaagERGpNFtjUxJV6dl/A1A3SUHAai+yfpIZ8KaeH4SSVU38k0Lf+9fJNvGmzs9fPyVRJvjnQu70P5+PRiNaU8ticihWY34WJVrlwiv0CfRJ4zO7o3WgDsWP7NIWanabociYmK4/WpHnUybDZ/imAPAHHYqSTnulK8o64U9BrvzEtqR/vfQvylXhW5tI5f+U/qw0Y8Yq0YoTEVAyXPILbwHB+cIg5PJGaTMrgFDe2EBENbfjBdl0wd5+wLkaWItO+mwyWC13pt206a5xe6G/6ndUiRcvOZ31mzRzDkja+0HQ6jLkrEiFu+R2nfghX5wp3XWAg7C2N4P24k1YFw7R9/gFj/yqdfA3e1vzLA91I1TXCtH3tMkytwFJ8qP/pPcu59yrWdpvS3uwQqIFC9TShYFbOA26ulv7PCSvWlOyx
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:15.9864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abaeeb9-a5c6-4ea9-ff05-08df22547bd9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9720
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_131720_413307_B80A7411 
X-CRM114-Status: GOOD (  10.65  )
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

Nodes should be sorted alphabetically by name. Move a few of the nodes
and child nodes to achieve alphabetical order.

Fixes dt-check-style in strict mode warnings:

  samsung/exynos4210-smdkv310.dts:28: [child-name-order] child node 'aliases' out of name order
  samsung/exynos4210-smdkv310.dts:43: [child-name-order] child node 'xusbxti' out of name order
  samsung/exynos4210-smdkv310.dts:48: [child-name-order] child node 'pmic-ap-clk' out of name order
  samsung/exynos4210-smdkv310.dts:168: [child-name-order] child node 'keypad-cols-pins' out of name order

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts | 40 +++++++++++------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
index 609853bb840a..5c703efacc87 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
@@ -20,11 +20,6 @@ / {
 	model = "Samsung smdkv310 evaluation board based on Exynos4210";
 	compatible = "samsung,smdkv310", "samsung,exynos4210", "samsung,exynos4";
 
-	memory@40000000 {
-		device_type = "memory";
-		reg = <0x40000000 0x80000000>;
-	};
-
 	aliases {
 		mmc0 = &sdhci_2;
 	};
@@ -35,9 +30,11 @@ chosen {
 	};
 
 	fixed-rate-clocks {
-		xxti {
-			compatible = "samsung,clock-xxti";
-			clock-frequency = <12000000>;
+		pmic_ap_clk: pmic-ap-clk {
+			/* Workaround for missing clock on PMIC */
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
 		};
 
 		xusbxti {
@@ -45,13 +42,16 @@ xusbxti {
 			clock-frequency = <24000000>;
 		};
 
-		pmic_ap_clk: pmic-ap-clk {
-			/* Workaround for missing clock on PMIC */
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
+		xxti {
+			compatible = "samsung,clock-xxti";
+			clock-frequency = <12000000>;
 		};
 	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x80000000>;
+	};
 };
 
 &cpu_thermal {
@@ -157,13 +157,6 @@ key-e {
 };
 
 &pinctrl_1 {
-	keypad_rows: keypad-rows-pins {
-		samsung,pins = "gpx2-0", "gpx2-1";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-	};
-
 	keypad_cols: keypad-cols-pins {
 		samsung,pins = "gpx1-0", "gpx1-1", "gpx1-2", "gpx1-3",
 			       "gpx1-4", "gpx1-5", "gpx1-6", "gpx1-7";
@@ -171,6 +164,13 @@ keypad_cols: keypad-cols-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
+
+	keypad_rows: keypad-rows-pins {
+		samsung,pins = "gpx2-0", "gpx2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
 };
 
 &rtc {

-- 
2.43.0


