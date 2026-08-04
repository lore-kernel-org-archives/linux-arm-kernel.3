Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB438C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ag6NWqqSgOsVB6rCUM+cqBcKkX7ZUoxIF/glK1eRdws=; b=BSC1kQ7jPp3a4HiajR5lmELVQ9
	gViDFvQtPVbioxEbP9gWxDnSmHrUVWoYcx5v1+WIHh6Zuy8/QZA0rvUGQ7774qCH+dxZeVpTtM9U9
	lshcioez1x6a58tCXu+89c6v2VTM+9BsxbI+bFsgqd0ZrE7B1oj1WzWuKF8Kqb99YHV0bH/fjD+wb
	Ec2lJFJtWgUfxD6cCv+rWONSzqL0QyuU0dcKvIyLihDnpqcffwBHHvZWxKOCXb3sZahDsuWy48PaM
	pHKX0tgc9WMGAa0ggS3euha5eA6xfGhApQTTupY7uhXXAQ1Okrt0HnnlNIYP6dT8LTumPduM0m/ca
	LoyyZe5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDVm-00000001jZN-2Z1X;
	Tue, 04 Aug 2026 11:40:46 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDVj-00000001jYg-3rTj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:40:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4qE+imMc7h5qT7kWibKrkHb8GlihsZ9AQ9AzU1uaQJMTOTmUs2+cAM0sW+prVJIksJsBFpnJXY5r0FI5sfyVhAMDURofbuzIq6/lfxRK9JGL4yPEQn5RGucBVtxjiE/3+0lBATq7yaCJSU/+Yoo51LuOzVbZvUFFNqsnj5wdFH36Clafe8uwnG4PaltOJrjMBPokhUVq0A8sVszBos7OVZJJBT0m6t/bBsBts2z3fNRv+Gy3pAby8iQAB7/kytZfphzZcUN4YuGcrEzkp4wkcyNh/TvtXqrMQNjNEmu4/h0N+IJB1y9fpsBK+NWWse+w7Z3WrhLb/jMtOPyCwq6+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ag6NWqqSgOsVB6rCUM+cqBcKkX7ZUoxIF/glK1eRdws=;
 b=sZyYxYveyf9tGBWlLlbYNOgsdyOnyvrRKvxnAmTIAp7GeovfvpPz0PdrxvkRQDViS9Xb027cw3kehNzTksy4qxJnop0ZHDtTzsydqLoVDDasn9cWtl5KE6KabjxprWW05wYIpTH7tT5LLJtjZPbADsNc/iii6LUl7Qch+VfP+gBkRT2y8Rwf5xn2SZkfnSjjm8xM8SEO+O7ztAwJiseukL57+fNrs7hHpKx8JLNjvFMZGguG0xDs4oxF2ybvegU1rz216+2sLGy6x9/4DVo6oXUUm3l+Mj4UEQWZPX3XkveNCbFp8a3tGC5TZyrhHBw07sEcJa2zFGKiBjm0sywVRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag6NWqqSgOsVB6rCUM+cqBcKkX7ZUoxIF/glK1eRdws=;
 b=Juq63Y250DJzWZXDJlE7QFkhIYXxGyz+6mY23RVi9SsHIxFjjnbRQM6nW7ADaGbw90XpDkR+HSK/iw/HtkGnQgil4JZr1aTbMscZbkHiGLtlpVf6Kt645KvJN6YVh1FZtGyEZOKJQw0AAhauJRmOFXb+BUexPR+xb0ZFloMzalz6b9ZTSHBCoHLRKCr+MTJ/14EHcIer7YI9znI0xboRO5XpZwXZDT7/1/LqzTnh8czuMfhxv5k+u5flBfTgq9ExPUSFKCCy9Wps/I6xGaomMcVFXY6G93MLyZNzPOo3HA9gRrVwO1j3wgbM+0o/uvw0lfnvlEc/MKCzSc7eX2ePvw==
Received: from AS8PR04CA0165.eurprd04.prod.outlook.com (2603:10a6:20b:331::20)
 by VI1PR10MB3982.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:141::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 11:40:38 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:331:cafe::28) by AS8PR04CA0165.outlook.office365.com
 (2603:10a6:20b:331::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.17 via Frontend Transport; Tue, 4
 Aug 2026 11:40:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 11:40:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 4 Aug
 2026 13:46:02 +0200
Received: from localhost (10.48.87.235) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 4 Aug
 2026 13:40:37 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/1] arm64: dts: st: Add I/O sync to eth1 pinctrl in stm32mp25-pinctrl.dtsi
Date: Tue, 4 Aug 2026 13:40:19 +0200
Message-ID: <20260804114019.201949-2-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804114019.201949-1-christophe.roullier@foss.st.com>
References: <20260804114019.201949-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.235]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|VI1PR10MB3982:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a862397-39a0-4818-0350-08def21d344f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: EF9NUnT28By7QjlGO52a8ULfhO6luVtqAfQ07pJcwSwKTHEMNfzsnzUqFFvvzGZMEMIRGZGdfAaqwYEQFun9Phrb6tDSUvwZMzYMxqo7oHf6c7t8Vl6+NAnmnE1jurLlm8tQg3kwFJHSCxEJF4YG6RULuiGBREXzustVX9Q2YwhkSYLCTVLQ3anYlcWld815cxmE0NpbADzeSJxsGUqERa8hvAHe4ubBlPGeCCVa/8ASMGOQFJv79M0LIocIxsXq/UiXUCPhCaLxHF0QTNPcD9ltTVrWjbFbkOEW3eO78MSJD36uI1swVHLapWJnJExvTRKpjOIPEZCh5VxAPipeNYGNJiBP8zp8lcQPDy2QKhMpf2+3oTgfqq08XiifkOQJGP5Ork+lj17+YduGBcreypCHbNpCZmHYyGNs/Sq/ys2LcFYNPcLUM5eCdOwZJd33qtaBPiBp/dcylwjNquxnn6U1I4N3FHQ+ddG0XjX4B7quJqA5f/BnN6dqlj4W++tA0MuseL522vSSzf9Js0j+QKXlraAXT1hFi61kttOY18dtK4wo3xhaoPsHUq67r53QFnJdBcnFjBrFMQF9LM59MPlLlCzmItZSxkseejA65UuFzQXy1v1rZpt+Rj46zBO8w0KjDyElTCJbEd6o2lTIitj+IvK5Rfif2eYNOZ0c7ZJIgtfDEZGOs2jFcqloWVZnGjKbVZmmpZycaO0bsLP7qw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dl4a4I6risWLoSeYKDq0CQyNdieMV1QK5D8bg55A2zTeS4vhQtn8FOpwjJNfQJyZKhvjaQcnzWSEvAoVfxqaQTdFgaFkZWG/gppROPqNFN/7waJRqTyaU/6rCqpxgzqtxxEOz6OmorNtsuHPpaoKfwwThzSOHWToQ6KnR5gmOW8TiMLy7pLt2vtl3ovKi1a72a1IV1eQUSB+3+69Zw++QBT6S8KXPT3IonGym8dOW2iF4w4nHFhacI1dtNdjZZ/Kx5aCridgO1VRw50byNEz62iFzE5zAVFicbyELq70m9WCy7LwmBeRgTr8mWGgINeV6MSZcngmZzgT8ikxrmJcuofGwmpjSTdEXgKAuz7vQPF1HnyK6ERgy3FUeaib8RG19lDioYLgWzfE8/WsVOV1tk2e/zjBaa33YOdqiPqQOXFTUfMNDmYegxnEZt9dsr+O
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 11:40:37.7912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a862397-39a0-4818-0350-08def21d344f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3982
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_044043_956566_7EE8ACD8 
X-CRM114-Status: GOOD (  11.90  )
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

Co-developed-by: Antonio Borneo <antonio.borneo@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
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


