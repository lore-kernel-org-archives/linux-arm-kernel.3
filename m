Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBD1C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B/k3VkhzFaEeq7e3DqZ9bZQ7HV0gxbU8DbTf+GaFJfs=; b=BdCA/THMvrySjKlTFPg2Q6Nk3V
	n/i/l/IouGHdGENwV33c8MbcgnEatysRxFQIFxuLAgLwxJNiQO+cZw3/YxqA3zgIPA9pW3o6OJHYg
	sjciBHBSt8yeTdzlesQJgf45adwiZLSonabpK+Lg49iOUdO9tEVBTZ1KWGxbwxVnQI300DARZR0fj
	23/BcwVMyxd9ybcoHik8jheSuRoxtjuflS/p2XOYpE7kZJTk8dOljiNK/v6CGg6VECTPdpxTMul66
	RytxXDEHIZKJG0RnzHqVGnYMy4p0+i3ulwJVx52VvLz17IwNtr/5ROdDXL0p2Gr8xG7d6XtqfDVsf
	l9zpPBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTAW-0000000AuAq-3GSM;
	Thu, 30 Jul 2026 15:59:36 +0000
Received: from mail-westeuropeazon11011007.outbound.protection.outlook.com ([52.101.70.7] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTAS-0000000AuAS-2YSZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 15:59:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APnRDqZq0aA1s5pI9EOrwmJI4zy5D2htONg6MSbhDVGDNFEe0XsGy26rB2HEKoKAZT8CVazue0Etacjc2u+67DiSJwYNsmg1c8O+P2QRBZdMD7fogbZa45chJBsHIbguGco62+nk0dGnnm04du0V6GFwKmVaoVqWL0G3noZX4KvX4cLOuQBW9zWplAqqSRJWBPGNM/H1vFhz7X8oeCfuL9Bf9VQtp/0Wba/G4pbqADQyY+E6d/w9xnmW6EHFuPi1lyTJVgAB0Nj7XAaCtOzzhzTet6ebP7aYxhbo19TNiDUpKiOWb5dk1cCgPF+cAFb+U7+IHofJVNEgqfV469BlrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/k3VkhzFaEeq7e3DqZ9bZQ7HV0gxbU8DbTf+GaFJfs=;
 b=MLll0AaVSlFtgEu9TGAKAgBXxWJFy0gnRu/+HQqRa4ZF1eMvI8O/vZT1h33tEyAwduP0UmmSG22s0S4fAIgInT1ZxAgKMGjzyO9RrN7Rj0bzk7QjdErxK7z1jJWZxyvuPR1Y/I8w1O++cieLl2YLL/0wgppbdd7LUHYZTRt3AbwU8NISdfP1vsV+cboJvQOjd20SM3PSecWzmT/YBG9YUrmV33dTGmL51q6WTBVhRtq2aSrU95zRAWV6fvVYvroG2V0eXhJ+x0ILPp83zPYkJo4jt3LnIgiNZG7NpciPoWjXpouFDKTz4GmSommkMrpX/ZEwTwGgmpCoPB/gIp/IEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/k3VkhzFaEeq7e3DqZ9bZQ7HV0gxbU8DbTf+GaFJfs=;
 b=lnRjiRivp00uoGEZiFk/FP/3Ojhg2jErNu4tgu9hKXYiyZGoyjJHi4fWPp8fLwwTiWwOUo9/GjLmOHtbonhRGn3sVrkI+4yDFC9oWVw8W8a1ms9ovUk/m/xSpxwzi+RVoTI5ahpqg498QV6V16AI0b9u/MwZCm+a4RCHe7QEbhI7OyjU5kl2DJDWjTU9TZoKTNVffUwqz5yDzgS6G9D5PWzHuTq7W83rTdmkgDB48yvwhhjExzD1Zx1IXjDkU9TCqlPxt+1rANyJ2WOC8hY088kNvewm/fMiBtrniMptwg0oIVjXCIy5zH9AiVviDJvIYt/tXlbdvHhzwYUFgVDV7w==
Received: from AS4P190CA0044.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::8)
 by PAWPR10MB7817.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:34e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 15:59:24 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::95) by AS4P190CA0044.outlook.office365.com
 (2603:10a6:20b:5d1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.14 via Frontend Transport; Thu,
 30 Jul 2026 15:59:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 15:59:24 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 30 Jul
 2026 18:04:13 +0200
Received: from localhost (10.48.87.235) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 30 Jul
 2026 17:59:23 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] arm64: dts: st: Add I/O sync to eth1 pinctrl in stm32mp25-pinctrl.dtsi
Date: Thu, 30 Jul 2026 17:59:13 +0200
Message-ID: <20260730155913.16285-1-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.235]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A795:EE_|PAWPR10MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: cb191653-097d-4e3f-2741-08deee5386c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|11063799006|56012099006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: IaK7Kt4L7Km1F/2jCqMXBxHxTCQ6kTDbjkUm+6PfJGICGG5t+xW9s2MeTFN9zuvW38t0Mw3UIzQCR46yTH9CeBH9iZrvVliN4qIHg2SW/kZdGb7G1gBfO26u5CnalXkMcoDYotoJSnawnyIKFv3DjnhbvYwTOWOHs5+9E2A1iYg++uomNnIPLoI5DvaGWs1bz3aC2AKNkTeGbSQ6NXNCtxWKTe1FaII9P8dExSV0F/jgJpyFv5AsoNoxl8Rrehr/Qpx0J/VEE52xv0D5t1+M6ZTL22lEAjIvjridzTWGprrg/tyJNjlXIvN7QbnjIFXe9UiGJ9MrcCyhK0N/yIwu8jx+8caVt3SYJ/7om7x6bb1WzTiDQIAqpNJtdKXFNVyDa8WwcbcIJLNAtIfWUKT2WJxp5jd/ab3NA2zTtB3xXKUhpivd8x9SnNPWXBFIhMY046oFBSyNi1AJv7MIgLT+Yi5i5h5cod2noG0m5O7gL0lcnLqHnnFz3JvUBVXvNjMXwgLL9ZoBiZLpN5ARTd0yoUSfjvgy4l2+SD8O6ShFgYscwcYdyua63YcXghcGMAj017kOb0QtfN3nbs19BcMKxTazF6ZcKilT8bpL2ZlbC0t8qN4plb9wPS7q3xkr+07c5nrg0/CCKpvrY6QZNqdjP57dmqYE78mdrDdsQOLVPyA6BiW/o569NmJj9SNTHy2VHns0JWBqkxd8p9bJwgJMcw==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(11063799006)(56012099006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +vr96nXRr1Khp2MWL1vDuQVzVhE0uJDUVEDbBnwWqSGrwXEyvIns9sG90IjliTrGlJgAjGsNXsl6/itjG4je+s9MG/0/zOwBmEQlLwbygHoFYgrdAiQbg4HENAVt4cdv2q3FpHYyT9MMGQQlHv5cJ4lgPTsFTbeeWgvJvP9jFMVC++LVn3lSbYCR5g7tEBd7q/5X6kQTlbDB/cqc3jnhrS8Mo5aZJyDZTCeEBEnIYcdFvzv2BHNgxR1ivakFRMXV126i9Gxn2CKveYpG38nd1ffJp1xdSutdqpA0SONnLtWaYH5hNBxjjAgwrwFnimLJRu5dTRQkKh/zEBXCwdw9i9M7eAdMRmSznVdSh0c3n4NbBzfjxJOwkCqrVkkO2LW2reF4CTszGanWK3Q4TQIRQx5LbYCSecaeLOtChcn6pSEFPOC4JdzC31jlFfkdkCVD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 15:59:24.2764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb191653-097d-4e3f-2741-08deee5386c0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7817
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_085933_142400_26B902DC 
X-CRM114-Status: GOOD (  10.87  )
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

On board stm32mp235f-dk, stm32mp257f-dk the propagation
delay between eth1 and the external PHY requires a compensation to
guarantee that no packet get lost in all the working conditions.

Add I/O synchronization properties in pinctrl on all the RGMII
data pins, activating re-sampling on both edges of the clock.

Co-developed-by: Christophe Roullier <christophe.roullier@foss.st.com>
Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..4fcfc4528c5e 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -95,6 +95,7 @@ pins1 {
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <3>;
+			st,io-sync = "data on both edges";
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('H', 9, AF10)>, /* ETH_RGMII_CLK125 */
@@ -112,6 +113,7 @@ pins3 {
 				 <STM32_PINMUX('H', 13, AF10)>, /* ETH_RGMII_RXD3 */
 				 <STM32_PINMUX('A', 11, AF10)>; /* ETH_RGMII_RX_CTL */
 			bias-disable;
+			st,io-sync = "data on both edges";
 		};
 		pins4 {
 			pinmux = <STM32_PINMUX('A', 14, AF10)>; /* ETH_RGMII_RX_CLK */
-- 
2.43.0


