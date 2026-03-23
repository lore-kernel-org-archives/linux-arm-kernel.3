Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC63D58CBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 01:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzrCrJGjR3PmypvsGDuvaTqbL3Ye4CBqJdbul5iQIFo=; b=S2Wem5NRf73DxWSUY4QR/El+o2
	N/Kg7+V62jymghLXtx8C3/pMnXHmFpgGMxczbngMwZh8C7v8TP/pMU+K/irUE6liTaao6oWCTm/mo
	umbXa1aw8QY5Nui+dbdh25thSxGlsct7SuB1Fam7Y93/J/7vd4aiv8BlyPc7C2AAGv1Lm0Cm7pCAS
	hAt5vj+T/NMX9tbpGoD2L2len20A8GwujNO2fhLEt2X9BdXyZYt5KpuPEKqUOnNeMhtO/SmiuWEbM
	86vlRiVqiWVdN1zaZk/WSraz9ui2lW9k/x0IUP8yirgiMz3dRXrQXnLioi2tAE9yuEnQtmBpeYzPj
	hXQNhW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4UCT-0000000Fprx-0b3S;
	Mon, 23 Mar 2026 01:35:25 +0000
Received: from mail-japanwestazon11022101.outbound.protection.outlook.com ([40.107.75.101] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4UCM-0000000Fpmg-0C9J;
	Mon, 23 Mar 2026 01:35:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2sY7CRRbm8jJz2rEo3fpF9yOhfQZ3JsWM78sB4lSHHnbvzSlNwpbZlOWNrzZMLrj+fhg46NYohu85rSylqUHZ4jQV/PEfbV9vWI0deYE0PpaWzw2UnUlDgAq2SyHJVpdSm8ZRSW2W5mWiJ3YchlY2p3wVhi7299IUKkzKTlSv6RFmpr2ISQM1c01fUhCtdrNNNZO30+XJedyGkcCELxCwqrcORwUgAeoZLm0jBNw4xju8ML5OmAu1sRUm2wP20KYnBbUd0T4NJoPZ7tSs2xKdqgzvNWNCje9NbRylLlJvRC1bkBxTz9Qjeg4yjK21PQYnJmaLgWnIuO3Z6KQEndNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzrCrJGjR3PmypvsGDuvaTqbL3Ye4CBqJdbul5iQIFo=;
 b=r56zCo+h9tqGj/9s+mMUnvUxoHmvsvzBVx9Q6ZHZC52zHwpuMf2clUgN7OIkPR4T+zw8do+xocbZsNURFr9WOV9wUIpkEBx1vhPsUd9m3iGz+jq4B5oDgJY59YUkg3N2mnI7MHHGUuUuY0oAASKMMQYl83zxNsNUi0CFAgfssaT2kMiQce8+TG/pqU0takuQx7eL1ziVGwhlddalNvOgU2+JGxft9heVL+LTkCJ0qM9c0CUColYiSFy2pzFkOuH/0LEhA19I0jOGZXEO0Rt7DRPCONf1RPPOG3zQXv3NPaJzTBgNWeZIeB8+t+NKzREU3a5GuESUMHw2LPo+LNPJSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by KL1PR03MB8142.apcprd03.prod.outlook.com (2603:1096:820:102::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.30; Mon, 23 Mar
 2026 01:35:03 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 01:35:03 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	andy@kernel.org
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v2 3/4] arm64: dts: amlogic: meson-s4: add internal SARADC controller
Date: Mon, 23 Mar 2026 09:34:07 +0800
Message-Id: <20260323013408.429701-4-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323013408.429701-1-nick@khadas.com>
References: <20260323013408.429701-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0047.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::13) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|KL1PR03MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ad4b8e-a9f7-45b3-8491-08de887c6800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: Uec9Yvy9vEQ+Tm6u2oNW35rzgZbsOx3tQVQRmMOj7X4xFwzS0s2isvGeYExEQQUpl9TlPytNaXhLag/t2ixZarwsOhhAhIzw//1xHk2is77bJLgaLorKOmgdx5i6M5Aw56wHF7UgEdiJHAebUumAyRMlTdHUMpGuH54veJox8L87PZB9cp2uPhk0Vdt0jRsCUXihLRTp+jliju8yc8eP/R/CSs7HN6Xx5k4mpGOJblvXWiKrWn1ftkEP5ahMbmOtL2xGpDYChW6y9RHED/5i61DjaMrJiS80t2GlsZzMWTHTgmgoK22549uSfEOA/QQv2A1PkybBw1RwGE98lhDBbxvqZkyAgSH78h39Xnzh/pjtlIcJSgDpttTg/WhJu6n1Z0DVtQNzZlQuIq4Uw9gyer68QvI8PUpdqvDuBgbkU/yWwH43dJ7HTCCkhG4yKcH2N60DjT2CE/67snE9f7dT65Nkf05CpTcr9lpKJao4vSa5b+Wej4RL8OKbruaTWeaa71st2gCvdg4JbfWFg9uhEHGBwAWS1pgTEASirGXKqhuZJeW+CCv5FWWvHeQ0pxrHcsAucsKPRFN/Gj233qt3x0AlHTrcbwHvkB5Cqg8+j9k/plnrN6Ygty1LQiI7ZVdunAUQMHFyZy2+v0UcNIjDj3cISuX8NKnUJ/kx1G6++qWF2wkMexPadJ40j0mXBvtxbWNWlVmmxzv0fOnepFtNt7CYfzSzZv/z16bNBNFFKcKbqavp79NHlyYk0s7EyHeUmcNUKbN+mPfjVi9Rpm9lfTGdYIxr/xY7r6VPECslv3Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NaN1+NkpnLCYBr5LDHDiosvGSOWUW7mewfK0psrzaoliiK5z6tf5oc4jx9fA?=
 =?us-ascii?Q?pBc7YCLwUj0h9sBavIRS3IREMZDUHvDlOAJ1ehp3VRhCzaWo8dttADdXqrK/?=
 =?us-ascii?Q?EhDWLB1J1U3P/32fL7rr1ZcyMu1tZjukLa6gyYm5IqRz/mA/owaz8J1gObLY?=
 =?us-ascii?Q?Tq6yPT/tKZAAV6bJaIfz2X3P09o8h1K+vv5Gt+0xRd8kJjQuDXdJu3ZTZ6vl?=
 =?us-ascii?Q?4kQJVWoIZ2QnYwKfV4OSG0xAf1D99BUUrlg+JJeRys4fTAkqKteOfpWrhDye?=
 =?us-ascii?Q?C0UaovV1hQXMFwjNRSEINcJ1GdqtifG7nFgqJQCpUdZgAYEiVNrJAnGVE3Cu?=
 =?us-ascii?Q?nvn803XiD+KoUVJdE58LdFe016O53gKWrCfwBn8L7KWOy6U8gCd4kMZ7RI7g?=
 =?us-ascii?Q?Z5yG/Zr8JrIJWWM5vJepPfUt8qkhblfsEbkdLFTVODNSFdBtM2gr1DMP82CC?=
 =?us-ascii?Q?R8xCRvS4K/2aXDeAhpqyrE8t5M1gQyaulQ6xSdIQv5J824Tb1D1YdAHvV08q?=
 =?us-ascii?Q?0iCohbA48z/tmsANcpfkosUv97IqANPhhlbgNENlM4r1W/WihACqwNntwcBq?=
 =?us-ascii?Q?buu+L1AWa+ErXOJzIQdX6lqxltAKQ0RZvX4CTedH0//GEnpL4ZeCE6FsLGt8?=
 =?us-ascii?Q?l5OSEKXIHjXnn9JP9dQ/gMbQjgdLUZSQ/1JV0AyJfCXD3z1K6L/m9VV0kqyo?=
 =?us-ascii?Q?0urFEM6ut+V/15k8ZWt6wIFnWvrygRlb6BpCNo9CQojvjIxWMk/kKiz9MMjZ?=
 =?us-ascii?Q?NhlI3xtLq4eq6ckZXAu7sz32Y/5C24nHRWyhzAcIU/cpCETqDYBdICdneVcO?=
 =?us-ascii?Q?2oiSsZnFXZcN94koNk1AgPbfrmo9IzRbiT8wF15sRAsi4rnV5PYTA7ugc38q?=
 =?us-ascii?Q?3z14IbxPHNicL28DCf0DRMvWL1g6znqzIE3uIDsS7oKk2LVsAy2NYGtzX0Nz?=
 =?us-ascii?Q?Rg+EdRblfPHRmLX2nEK7l8GojvCJ8xFnjm1mAP5DZcoyDMa2BPTazhxpe2lZ?=
 =?us-ascii?Q?25uCa00jOdYZyBX/TfnEbwk+BMWhHCMhD81e3XLctt8V7pova7FTGwhPE5IU?=
 =?us-ascii?Q?xaIwp4YDj94O2otWAXoE2U9z+GWCLSY4Tp50lwQOq6w64Dk1c/UtB96oou1o?=
 =?us-ascii?Q?83VTkmQXrxx2d1+hIp+cOlYkKmizryEt/+GwsmbkiYbpFy88UaDaU+ggnFfQ?=
 =?us-ascii?Q?YJuVQvU2NMCC6QJbPdjyvg6XbtUbCNIwpeDR8vzHt9dwHgV9AheWt9FHyNpg?=
 =?us-ascii?Q?YYRLo5IKVgTwFopphbqru23e/3aN4bouUm/3oBYun3+rK/PxUXS+/m7sq3ja?=
 =?us-ascii?Q?EFHAyKepCCDtZGf4OAS1CngErc/LiVYyHTl3UQ+FEd/37GUpWZJuZJKIwocY?=
 =?us-ascii?Q?q8Qd0APtd+BJILhs3D/Z9j4yG99beZkGumJnIe/LSRcbnDZhYwfe+6+eWoPE?=
 =?us-ascii?Q?M1JZ3yNiUbUndm6LtDeGqEKne5K7w9oXXwwHsbMuFq1HUfAGYbyj3wjiYc2X?=
 =?us-ascii?Q?wVN3WIRWrEpLlVRt4+I3/IzELLbQHvsgsCwSdDa9BeRVE979JZNozPd5WAie?=
 =?us-ascii?Q?kBeoW7yqBwSQAjrBZehVpVsoTqdWmNZIWgUPAw1asodbacR9xnExSJjel1j5?=
 =?us-ascii?Q?Y7zL8myrIB63lzKVxnzOZ2TRFsI8EUEMdYoou1NXcMP8yAyddep4dFMjHkP1?=
 =?us-ascii?Q?CHb6iJ+h0fhOFNxsTntBrRPcH9+wS5UXMKXd6YvEjJVarNXd?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ad4b8e-a9f7-45b3-8491-08de887c6800
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 01:35:03.7167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJLCq8xhHSW9VbWf5Fs3ys1m0/Zpv+9CKlRNpeuo3q0Kn4IGNoUPdsglPU1DuJGx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_183518_099746_8059FC67 
X-CRM114-Status: UNSURE (   7.54  )
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

Add the SARADC (Successive Approximation Register ADC) controller
node to the Meson S4 SoC dtsi.

It uses the S4-specific compatible string with a fallback to the
G12A generation, as there are no known hardware differences.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 4a3e9ad82d280..936a5c1353d15 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -77,6 +77,20 @@ pwrc: power-controller {
 		};
 	};
 
+	saradc: adc@fe026000 {
+		compatible = "amlogic,meson-s4-saradc",
+			     "amlogic,meson-g12a-saradc";
+		reg = <0x0 0xfe026000 0x0 0x48>;
+		#io-channel-cells = <1>;
+		interrupts = <GIC_SPI 181 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&xtal>,
+			 <&clkc_periphs CLKID_SAR_ADC>,
+			 <&clkc_periphs CLKID_SARADC>,
+			 <&clkc_periphs CLKID_SARADC_SEL>;
+		clock-names = "clkin", "core", "adc_clk", "adc_sel";
+		status = "disabled";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
2.34.1


