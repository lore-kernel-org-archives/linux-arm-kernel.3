Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F3DFEE4CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 06:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRfXO4SzyDX1u5fdAtDdMpwIjvCD711tRu/raZRirdo=; b=i5J6iMYkU5s15Na3hU8aru91bH
	UTPeMRtrMkS4txG8kNsAKqoOjh6FrNzzZObBdaeBGvbAUGQGEHJRyrPQRXFhC5k3lBgMb0DhfCOBK
	KJAXQyhneWb5OPmw0gUmeTdeOv22zj2MisTLIgBvBE7ud0AmQ2saFz7TYKaIAO7A83fTnXptLdhMM
	1GGuawbSZzEPHCkX01XBNpSYo9Zh777r8n9mbKOTOTslKy2EkxfU2JFEgOHTMqHoTSG7J10IxmQqK
	YN3SxKDhR0AEWMg9dfLJ4teXIKLDgsj5tE8TrlA8GlofkBlT7qz5LTza91ZckHBby88ynWMlReG1A
	yo7UPKRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDyF-00000009YOm-1Yee;
	Sat, 28 Feb 2026 06:38:35 +0000
Received: from mail-koreacentralazon11023098.outbound.protection.outlook.com ([40.107.44.98] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDyC-00000009YNp-26iM;
	Sat, 28 Feb 2026 06:38:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uevGpbL8UhMWYxQMstnnuJuro9FsiVo/MWrICGzXz0b45YCrfB9L7ro+MXbTTRkwOiPM4lGxK/XOZzcWNHMFOSsWj0kNVbvaxVNSxOhkEoV5Rw6eZC+eH8rjMPJ/9KA2PUoZ19FcbQnZWWMC2TvIJG/fNBEvjlK1+k1kUD602/0E+pIbkhozstPrw1DxQk+pqm31pMax6mZ2sWw3NJ+PatvphhD61K2hQq+0ZJ6Wf4+F5qhU/LfQizhwGSkzzmiqNBaVf1vK0h9TGwdgoLKNNdkUpQhLnxrUYPk161WwGbuh6g/jWU+4wqyt3+GA8b6GZoCzkP0t/ODzO/tGITZpqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRfXO4SzyDX1u5fdAtDdMpwIjvCD711tRu/raZRirdo=;
 b=BbFgAfFYS4was0XZKKM3RC4amz2YrS6xzFSJzHelLXHQNzndd393OZvmIVSRcpIh7EfboMmdARSsC1/uJd7pfOHblDtKJM8BlEynMpXgCNQ1COs/qBjbeECgvn6GFSbGHPbLDttqZ0pS8vjmu3kO+8ni0CUwMvCc8VO7sQv9tn+SgzfPW2ghoRm6/rq+TS9hobmeeJJV+A6sn3CWw2fcV+DVGWMDJTVtzp/Gaeg5tYxVEiQKXbjr5npfZ26cBvyNra6olYI+uc3MdxYiicAED4bE9rqRSgl/zzdWF5/oWHlWqTZzINgl8HHjekkjHf5O4/z/2W7H2t7Q2HGEzn4Rlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SI4PR03MB9867.apcprd03.prod.outlook.com (2603:1096:4:298::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Sat, 28 Feb
 2026 06:38:25 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 06:38:24 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com,
	krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v2 1/4] arm64: dts: amlogic: meson-s4: add UART_A node
Date: Sat, 28 Feb 2026 14:37:47 +0800
Message-Id: <20260228063750.701887-2-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228063750.701887-1-nick@khadas.com>
References: <20260228063750.701887-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::7) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SI4PR03MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dfc6608-51f1-4b80-0f51-08de7693f922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: /arK71MR/cjXcu3iaAqsjqX7JNz78oA5iQFafCRWKhZWvFkVudDq4xk4L9Cco5oyPCz5yKHZbU8kCTFNmtFD0nsQz6eV9wcbA6tD2N6mkrHYAWOkLvMhEBEKyvs++5p/esmsQFp24EUjkTOyhcCc1P2av5fAhqjYJMq41yDceEE68R7u6heyy78kNQCiaCWSY99tkg5yLArzI23ZYCevxL9tD62pHBZ+4EdsajwIT1MFhFsR4/r0YfO+Y51PiwL0qI2XeIdiPiqu/ptRkvi41CAuuKJcgNmDqrt36NeM7qRDEhWCzyn1/mdLBu4oH8WyH0B+X0gG4b7qjJpoeKGqc6IV5F9BYk5bSAUuf3cFryMCl11BL+zc2A0y60e0mBDGPGcVxhJFWFCuVlsV2tL0pzGzEkUawh5Wv9GuGdRjOcUhixl+S3L98MjEMY5sU9oMhFwNxqFpdLBYeIq6EpI5Z9JK+Jpp3ZjiITYW1Ex+WVRRI6I2eyrqJ6VqieFyobaGuUkwZFjmhsecpSPpF3h4drOTE1I0esgHXQHqAm5qBKMDj0p3G6nZld+t4vQxsJNWDEokzIEOHptNUmFqTrkphkwhwSfIXTg9Qu3idFP8ggrqeJz0pdS5/xDa4T+8A0qEVyz1aa5kOIBQEat0v7t4JxhfG3WhZWPrvf9MWyTV8+RcyQtBCdUP2xGVx2dMKj+Vyqrrv+l3lgDi2YF8p/LuXvwFCP9gaNm3tTuZLKAJw3codsuUv15ELhapO2aLLkl0r99AwobI4uzS/HTCqOk+/qf+RxEx5V56mfxmPdGbcCs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/HK4qiXL60eUvMXho0FDIjVFELtQ5b2X1TZLV8sVW7yltQcWyly7f+YVtQwE?=
 =?us-ascii?Q?dYAjaj5i+GiBa1wQwo8T8cyOYtAuZZZPa8dQ7hG8hPT94yAytz6/nuGVvkGu?=
 =?us-ascii?Q?DwBlIg1zwrBG4sV0N0V1Ahl07HepYdPR+R13AqUGiyjPsA1J8J4MDtvSJEXk?=
 =?us-ascii?Q?Nn/HguoB278DQvW2N5QaaW2RM4UXq9piVPoajzZpdvbZRBdMglBXDK7Jb+DB?=
 =?us-ascii?Q?vNixWomglxpJJQps9qFyZuU25VO/K3jFXgI1X1ouQVx+0XtYU0dR2yx871E3?=
 =?us-ascii?Q?7R7OJD3ZJD5K++64D1T5kUBnRrTkDoqzYHGK6BvMB+0pcp/nKKN95b/QnZGC?=
 =?us-ascii?Q?NmFD3Aocmr0hRz+cuLrihasX5KudyQaFHvRQKVr5DE++nllzpArdOP3tmiq2?=
 =?us-ascii?Q?AbxOXjb0SFBZnDLPOceq1zOLudkE/2jkwtC3OWn2LauI1gW7/OCM6BVLFzbm?=
 =?us-ascii?Q?qOaDJ/zPB8nsW75jEPuEdCM5Kmlaa1GVTYWXxJ+Q6TlfBROmZ7AjGLZhlLyR?=
 =?us-ascii?Q?w4g921FJP0eojqKf10n+R4DgYbvp9z45uJPTOtRvrmS5Ga2jffljuWBXppQ7?=
 =?us-ascii?Q?n5/pTL5CH7NTTSbCsEdtGop79ECLQjEjyQYrprZ2TJy2oUZVXiWvj6g3O8Gr?=
 =?us-ascii?Q?WWgkqsdPhvxLNQDV3M0y18usZv5KrTuuBmAgaJk32okkCl0KxojFAaUZx9DJ?=
 =?us-ascii?Q?DgMvZH3FZH7iTr6kMhEJnYTrYQ5qXSplFt3kv8a2hohbm7aryzOAe0/QUcis?=
 =?us-ascii?Q?VKI2Ejfxxx+WrS2tgYFK8en9sxN6/apobTRw51Peg0MQQaGJJM5ZJiaSd5Gh?=
 =?us-ascii?Q?9sV7R8Mli2sxkv7gEbDJcS+ymQ8O5uzJpctMzM6hZBe+5Jl0JMpyNfZuMPVt?=
 =?us-ascii?Q?M9Or+5JVZo923nc803lTOxpuNPrvWocofDWOJ336CRMYDdqvWOpWMVrRuY3F?=
 =?us-ascii?Q?2SfarSQ29QJ1/HWnp31DxqG77jpmq13dB6lm24oqaYk10x4mL5stSg1Z+JQg?=
 =?us-ascii?Q?MFgsY1/8DX/oZQC2iWCbbxr1Lnh185qbN5b/ACZL7SWoL6jcrXGaHB5pTAai?=
 =?us-ascii?Q?1ECFMrpg0C0uC3Z2fgEXaE3aFSN+NBjNO6hVK/2BiFRGZqgfIAKU1CpKOxhm?=
 =?us-ascii?Q?99pg5lUkxA25I1VviFEG1KDDdnwMcQA9gKSUfCtXi6QkMv8KSfXxHIfqTGRj?=
 =?us-ascii?Q?6uYWMr3DxnbDGDMU/dTFBNDWC4ZBA2xdQ00dHu37heHt6UqDGBKPEn6O2Kyr?=
 =?us-ascii?Q?H1Y+4pMuH21iOdjZUHSZULgT/6s25DTirFgjMr49J3GzFrE1K1WdoYoUTP83?=
 =?us-ascii?Q?GW2WE96U0YFWviQO1K6H7DaRUd4ew200Y2I4Nv5oxolee69+lD2vuFBRR1V/?=
 =?us-ascii?Q?aAAKvWOS6NnW/zx3pJBSFVUOGzTixEvOH61SwEs0jGU2rC7NsudxJ31ClrF7?=
 =?us-ascii?Q?HGgubyYJ6Ey9Sl+CRSCKqAqIqUc7vV6rIJJXg6W4PxhcOyRMq5tJg9W3WZAr?=
 =?us-ascii?Q?cjgeIlBMllObcwdC5oRZFazMFAFufSdni8o0c7jWemSH6K9se8eo8X0cKto0?=
 =?us-ascii?Q?S6kIJE7MwiuSGfO/Rj6jHPFhRMY3SUuCsRQjM7ModYUtyQwvaDgOs7+V9BW/?=
 =?us-ascii?Q?kubujRFlhD0o63UoMb/vuanu7QaqU1o3RcoeXwrdmEmCuFwtiPQj2G8i/DPP?=
 =?us-ascii?Q?T/F9hC6k3EXBUu1Q6AoHqYxgWsSV5t+19xztRXJ3mL/LB5SQ?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfc6608-51f1-4b80-0f51-08de7693f922
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 06:38:24.8366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cktArQLqFK9NnJFjxvkMNUG8UAACDmQQy3pytTFLtYKo2e75KhyivWihOHjl4HJg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR03MB9867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_223832_539682_0DC1D260 
X-CRM114-Status: UNSURE (   7.71  )
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

Add the UART_A node and its related pinctrl definitions to the
Meson S4 SoC dtsi.

The pinctrl groups are split into basic tx/rx and flow control (cts/rts)
to allow board-level flexibility.

This interface is typically used for Bluetooth communication on
boards like the Khadas VIM1S.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index dfc0a30a6e61b..4a3e9ad82d280 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -163,6 +163,22 @@ mux {
 					};
 				};
 
+				uart_a_pins: uart-a-pins {
+					mux {
+						groups = "uart_a_tx",
+						       "uart_a_rx";
+						function = "uart_a";
+					};
+				};
+
+				uart_a_cts_rts_pins: uart-a-cts-rts-pins {
+					mux {
+						groups = "uart_a_cts",
+						       "uart_a_rts";
+						function = "uart_a";
+					};
+				};
+
 				i2c0_pins1: i2c0-pins1 {
 					mux {
 						groups = "i2c0_sda",
@@ -814,6 +830,16 @@ mdio0: mdio {
 			};
 		};
 
+		uart_a: serial@fe078000 {
+			compatible = "amlogic,meson-s4-uart",
+				     "amlogic,meson-ao-uart";
+			reg = <0x0 0xfe078000 0x0 0x18>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&xtal>, <&clkc_periphs CLKID_UART_A>, <&xtal>;
+			clock-names = "xtal", "pclk", "baud";
+			status = "disabled";
+		};
+
 		sdio: mmc@fe088000 {
 			compatible = "amlogic,meson-axg-mmc";
 			reg = <0x0 0xfe088000 0x0 0x800>;
-- 
2.34.1


