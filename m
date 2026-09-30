Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0699CA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 06:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kSpXbIl7uyCbma4TQ7vyMsXR0GriMgKcxLGj6DB5k8=; b=VaiT8ti1898t947eBcelpzxL1X
	cknK1zf3VFuxU/1duHfk13Oa/T9JmAk7w2cAjCe57ZoYU8vy8T0UWZxaLMqdhi8g4gTfK+Rt5GjmF
	qSW4IWd4shHXrc0EBDWpSkJ9LsZHEcUNoMfLQdWhor64NMeTmrKzCLnJlsf78yyyay+4M4XpZLIZi
	ombBiZehF9Kkjgpvn6ZQiT/Z71LzX9Wi5vuyQQ8QZAdzRMLC6Sv0kc/aqZoDOL+WsckIbdhQswRoo
	TPWNBRf7k3jKzkDezUEgCqUkLuFEzk0C/CgITSMws96v3cPNr6Bz2BpiVq5AhHkBWGAZz9/ry3ir+
	CXypqX8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnZq-000000056hv-31xz;
	Wed, 30 Sep 2026 06:14:02 +0000
Received: from mail-eastus2azon11010001.outbound.protection.outlook.com ([52.101.56.1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnZn-000000056fd-2Sl4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 06:14:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPiS2gGLL1HOSxCYgsh+r5drENAXq8hUC5pconf0GVEZFawhe3+EmRpNUnt8eqNpLXXaqSXm7QRmqYtr1XWyKy5GeWq5VhMwpgcqZgw7bEzHDL0aRr//wlkPch/0qT+IU3i4qNiawuQEvO51cFkXxzayfudBeAhOfOLaTE7QGYUNTJrCAX3Vb3LUKw4g48v0nNZXOvZDrBm3hL673/7p5pTrkXfIMLTschoSo4gCMqbrgtwKy9YjNDJyAQnX2P27diIcOH/CQiplRXQ4riKAzEOPJuY7xonqCob568FFU7XBfVaGguRAVK+jF6RIQC5nO8kYV+JMu1hXXOabuR+eDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kSpXbIl7uyCbma4TQ7vyMsXR0GriMgKcxLGj6DB5k8=;
 b=shdneQFN0eG6m8LNcO9t+0uTEGKQEDUxBMQOodGvTTsBXWdVc8WEd/FsqJtaULFHH+e91KN2kFL0JvCFsBTESe5ZWi4dmeafMeT7NNEu34J6SZDJLMYwOW7wP8UJMTqhBK/TSXj0cVOW3Se6ASKJgggHJ7wysGVOFtfi6bZWp25kMxtXfEiGF5q+ski0DXhkxJGt63vyxkqxxHcbzdIIvuOcZQ0QJ+4eXYLXLFth6O+UF7EPrysTAGz+kEs/f+UJtXP5sNCQ33VqSx3G3jzfEcn8GnJ5Js61cfKEn65w0xdOp6jqTPLpXF8ayC1F/TiyAcrYfmx0Sj0CcvzPmTMdzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kSpXbIl7uyCbma4TQ7vyMsXR0GriMgKcxLGj6DB5k8=;
 b=nt/2GFUzsXcKILR56LTpqsgthFMuy+Xh8BaaHnRxssfO40KcUadungwrAyKc5ndx18OlLNi7vucghuSL/sBGw9yBnTNHOoMMJDHkfawz2lwuA3ARYmr2R5onNUHPUwYsjo8vfUGsIL4Jmq+bRbAuCrAVL6VkEgZUwpmQusOI4S1ok2MfUuAQNh8fx5biWUzCUBxUvpJ9rLFOSmoCFzsTyZdsMnYIa6Z8uHywi8jDPAZNOFdjM1zLisCh9jrLajTMc4Lf9fmDYSeoecmeYsgy6HxqChglNCw+u9PLdAZjtvE7qK/qibZISRw4D/IHmlwYkR6bUc4pTOWCTiJM0KCDGA==
Received: from BN0PR07CA0005.namprd07.prod.outlook.com (2603:10b6:408:141::20)
 by SA1PR12MB8841.namprd12.prod.outlook.com (2603:10b6:806:376::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 06:13:53 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:408:141:cafe::78) by BN0PR07CA0005.outlook.office365.com
 (2603:10b6:408:141::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 06:13:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 06:13:53 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 01:13:52 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 01:13:52 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 30 Sep 2026 01:13:49 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Wed, 30 Sep 2026 14:10:13 +0800
Subject: [PATCH v9 05/15] ARM: dts: aspeed: anacapa: Add eeprom device node
 for NFC adaptor board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-anacapa-devlop-phase-devicetree-v9-5-f08aa0d7182d@gmail.com>
References: <20260930-anacapa-devlop-phase-devicetree-v9-0-f08aa0d7182d@gmail.com>
In-Reply-To: <20260930-anacapa-devlop-phase-devicetree-v9-0-f08aa0d7182d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, Carl Lee
	<carl.lee@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790748641; l=833;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=pAsMpGEbYbQLqQx0xG8zEgHoAeRohruYjFh5hP58kBE=;
 b=0WpRjQtwXOiMx8prUuyEdMO+x/kGUL4CwZWSM9fuMSa/gjrqDSt45eQCzI5r5YH0TYhH9mA2H
 78qhbYzVVv+AKkRG9orEY6SJOl/6fY4rIlZK7o1DeTHJAnbVOmzjRoW
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|SA1PR12MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: f205d76b-efcf-4933-6cd3-08df1eba009e
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|7093399015|35950700016|61400799027|48200799018|82310400026|11063799006|4128699003|10067099003|56012099006|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +Q4KPhfnx8O3d2OaIaTGSTJc6E+lxAEGEb6V+zcUkX/9so7qbdSpUw7AvPgx37T/Tzb9aib58cqv9ECok8vbmd2dyBZM1u+CItwb95Nt5l/oEqEPmlwxDMZxCSCxBKdh1zQYKp29oY5NvBX9TR+5/INSEagX13NKFg9SaWrzepGeNa3bJb07WVSsNf6ZLBJ3/rPoomr9JDcSG8bWzmvcyKC/QLMY8e/DPFYiPXc7jqu6HKN/v/9PhpkB5JiO6H9EFWjeCQacpiw4FgOxuzune8H9wjlU22wCvSqVgUgMnaGTvtADInwYWh4EHu4bUCg+vP94HncdmX3IQf7npY5pKF0cTO5TWklPjdEhUBLVMVdH2LS4lcXjXs1LE5vOcwPdVNmy4jLOnt3m9AGO6rJiogFJc2goyb8iNUAWmbtZdDTFznMs9DnaJ7mL0DTFTZrS4qbem9rslQ2FsoOfXPRCVZyneJC6BglcekEA0Lo/JgPqH2WrG7hCPocPAQwBUKN0q9lIXAMTk/9XbaTg3R78Eok7JzrSm3sHKLwQRSNfq8KV2z1oLZxTqJ20ExKOIk3RCILDgBVfM9L1YsIs7EriGoFWq5OcJFq3EgM0Y4VGgdAJZUhfZjZFSlU8IvXLgueGADDs+tvdHwoG6DWBXPNw8a9VRhAOzYXxTUhRTSZYBh78ULH5sx+o8wRXFzV3uEjlMaTeVntgauvtuDW4Fea1NA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(7093399015)(35950700016)(61400799027)(48200799018)(82310400026)(11063799006)(4128699003)(10067099003)(56012099006)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: K4uqSKLKRqDs+/wXmrHg1bNqsF5VGL5M6+dYqbTlUkogmHVC8uEeOB98SmRhH1JeUfp4b138jx7o0vV3QhQsKSDTCjmisVNHh8AwPaluREz3RfFtIYjoDaan1deK2KOcCiHkOwiEIDNRAdHWl2OqDru3LplPCMXJh4ohdiLfbsYT5PkrrSmY0qLr3MOrtpNFH0whhlWTQicKMRl8EtrvwPyWDq2620LifHxfEJqljWgJ3NeDGAj4tZVq8zTPa9Vm/JJKTulzX4eXoq8sRrvtgoIXaFI7/N1z37UecEF0ctpDbDYZX0WudCzW9wEu0fqn/34IdT6hPpILUSKLG0Mu7eeaCCA7UJ1LeAc+09jljxdePwLzxdipM6ZDa9CB4ByFL3q9db+8fS8BW1dcrGkqLxB1Dh6J6tpsk8+KA/1HUpy2s9OTrr+LKkKgGLNfTSIg
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 06:13:53.2591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f205d76b-efcf-4933-6cd3-08df1eba009e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_231359_633900_75A383B2 
X-CRM114-Status: UNSURE (   9.80  )
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

From: Carl Lee <carl.lee@amd.com>

Add eeprom device node for NFC adaptor board FRU.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
index 8c4a03a82d44..a2392f684b80 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
@@ -16,6 +16,19 @@ eeprom@51 {
 	};
 };
 
+// MB
+&i2c13 {
+	i2c-mux@70 {
+		i2c@7 {
+			// NFC adaptor board FRU
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+		};
+	};
+};
+
 &sgpiom0 {
 	gpio-line-names =
 	/*in - out */

-- 
2.34.1


