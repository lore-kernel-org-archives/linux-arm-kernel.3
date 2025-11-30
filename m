Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9D5D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 04:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+C3dWoU/YTxYArrXNAcmjUbGgbXVTHJ6m8M5gYtqm8k=; b=M4794QBRw4fe1PToKhACDn06+y
	fgyhawZ3Rx4jjAa+EcB4tDrMtdwCp8yCbAda1MCy2ta53tdD/CsNeMlrlyLC5+s1Nk4KuYHOqxQNg
	Tg7sREC4umV2hdeK2s3fHhDuOfmvsYFPAN+ATAyyzAjzYL2KQnT9BBXu1xtTinOxfVpOk9bmWLoPj
	Re6KkkSKqTWNPQBBGpaIdvuTO3Q6omyitET4BlQX7q/XA+uqqJwRDxsNvntZZaEo4jwE95e9hf3Sb
	84/n3VaHGhvhIY7vyt9I9dyPnjxWPqFpd2+F6M9a8spwz/Ru7sWBuDXxjiOPtxXp4UtEyHkEYLUpt
	gKqiaccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPYuH-000000021X6-0zov;
	Sun, 30 Nov 2025 04:19:29 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPYu7-000000021T9-3qlk;
	Sun, 30 Nov 2025 04:19:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Isi7L4UBxweVeRvutevu15tp2R8Xu6Gd7Fwo4StpeoKPGj1SXQiPg8sX2IL+kSnjCCT5KIdUT1dWHAVa8HBUcOwBbbU1pUldB+x/bqhXf33J/ZVovukyf7fhxKx8yLVBVZWikRMVTNJO7YjYAA8wb84xNHHivWP8V7qbIufF5kvnMOwRni7YZMb7UaeDxcsuOcKFkQrMD5OXd7kH7Rc4XkJsLOvr1QZdCtMVAVt1caDz09vm4bseMPmmVZFzkyzAyGdOaxA+YOfYPMi1vyjGXkqIXqpac2J7fIIRgsh9dCwygBZvwNotnT575hK0FRi24VF2wGS/zYNoVK5XStujoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+C3dWoU/YTxYArrXNAcmjUbGgbXVTHJ6m8M5gYtqm8k=;
 b=VuuchWIiIuZ1cG2s48yDQISwDIyZu4GZuXRwGvR8RrUz6T0M4ViYA+KtKdlYg3YnnH0O1Fdwvjksc0TY/CuzqQ5NwioteXTso7Nqwi5DJYta/3LEZ1s88V6/jTYr4DfZXQEw71S5/Ni6t0M63LMReh8ffj7h2HwCnS4uQB8Qb/gZVwFyllyEvP1xuN1rM493FN+x9HHBz0uA93ufu4cqGmL0ey8Eqy0UkgNBvN/beiB6u3F97mG5r3dmz1WJi9b92eGOXwObOjwkhmFQkDjd6hKS8qy8+gNrykmUkanxN1xrCRNdbk6orZdeA0ST3Yec/2hSv933ooNLHx4nHK2POg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+C3dWoU/YTxYArrXNAcmjUbGgbXVTHJ6m8M5gYtqm8k=;
 b=z89Oydcevve3IAU0No90r9HSacCrpMhs49RCou1a5okrFznVNiXy4zgZUcKcPVzOA9Pc4htGORZpgp6YamOup12XoUndk0y9ERJrkkfK9LaxvGTIbntkYRV007+doMB4ifM1jQzLkojo8OG91UhVDi6QURDdDPSk7dC1qza5jtAH3GqvFo1k7k3uBnVQD68GTK2wlI0xcGcnBNfMbd7qGG0WlJ+4UrZIF3r4GBnG89DgUQ3Ej1x360QIWJCTSbz1vkgFiAfyym5H2cnHTX+Bg73q+h5Hd2k216pCmC6i5FoBZcM5xOAWxTjsKQExQsz6kPorhohVRc1aw7J6/N9EPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DU0PR08MB9049.eurprd08.prod.outlook.com (2603:10a6:10:471::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sun, 30 Nov
 2025 04:19:04 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9366.012; Sun, 30 Nov 2025
 04:19:04 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH 2/2] arm: dts: airoha: en7523: add SNAND node
Date: Sun, 30 Nov 2025 07:18:54 +0300
Message-ID: <20251130041854.2909001-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251130041854.2909001-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251130041854.2909001-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::13) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DU0PR08MB9049:EE_
X-MS-Office365-Filtering-Correlation-Id: dda4306f-9adb-4ff6-147a-08de2fc79911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X7pzpMtwR//eH0hgmZiAN/lFgjdYm6YlKsfbC0TPMT66Bf161VVYxt4Y3arh?=
 =?us-ascii?Q?UjLCiBMrRh6liA9Ou98G+OYYCifaS8rTh53NG0n9yvTeSL36V1BMmrw9nQ33?=
 =?us-ascii?Q?H74mjclbqFqE9EOGRZ1PA74OkswL4/I+wqs6e4V0RYquf5jf7RBz+nUlKyQB?=
 =?us-ascii?Q?WcUGLURSEcNMBhu0k7IRGw0QDsHRgImTZ5ZNjJCPIqez30cWFEQZpkz0H1eO?=
 =?us-ascii?Q?PfGONXcSHJQOzgqldJH8FuwMCMeLGOELC0pOlhEcCGaM+MCBdznFZGrTPQ8n?=
 =?us-ascii?Q?xbXcXi1Fy2wKmYQS8DCQm5vMWqKXAOz+pee6m/PwtGEOb62W/PMftQhSi38C?=
 =?us-ascii?Q?rgf2HLeCVDgTBJhdQlsHleiYOVPx6x7gy0/X1RjQx2Q5VKu2zjDuHJOZ8WP8?=
 =?us-ascii?Q?pHD4QxsSvHmBkIOrXMKctKNLteRG5aaD3GTFZUv9OSJ+1WfHJVOiQHEYyyQc?=
 =?us-ascii?Q?x9nTLeKnz0Q+9BWaSib7JJfSzxOALe0d/8mZhVKA6P+2oc2quUsTMp1tLo0d?=
 =?us-ascii?Q?FbvkqbPAfR0AQB/ME+ttkrTMQU62jup67oyKd2leDkImxNDgxQ+ZIGYAqz2M?=
 =?us-ascii?Q?Z3Fx26sCA7X4/TV/hsnOu/7MSm9G7V2VI2uFlbBTlNr5fRdXiCghIndeW0NQ?=
 =?us-ascii?Q?iwSuANNRPaYkDUGFk+OR4xs1wNjn3FTsL2uSC8EKDzNWq5zE+PvU6RuiaIg1?=
 =?us-ascii?Q?DKnx/4cUr1wa588plNdH4i6oCvElszlDHDYqFSSj8oPaCFRPaFl0SXpYKFM+?=
 =?us-ascii?Q?R04nuoUIIQgi96WP52iaMDnN6FhLd4HlDi4OEzz0702GBAvRfTqyTlTiJbEM?=
 =?us-ascii?Q?KZQYAockKLArAQ5npcLNF384q4cO26I6REbVgX2ItgXu91g5BCEUmTShgXW2?=
 =?us-ascii?Q?qajnkJ8ikZs68O85METDqXlwmsZSTz5iiFQ262c2AiVgKH/30R6j36IWAG6H?=
 =?us-ascii?Q?F1KhL6BOqIw4kL+ABrUnEPtEQ+Y46zI2aIqamx/STZMCoBzcDYmlSIj4axzH?=
 =?us-ascii?Q?QNhPKTxDa/YPV8b5APzX8svUuo58zErIJhm8KQzroYTmQphfPHkdNazng4Wd?=
 =?us-ascii?Q?kKrDS/Llk44Gk/MBVZvszShi5MfXCyd/fQRhuv3CXGjWYy686tb1Y3CM4Wfh?=
 =?us-ascii?Q?+RV1rKP8Fpj+Fau4gGkozUkujngjAVkasQnlTuIv6HUwAg//tucoiYurOmvp?=
 =?us-ascii?Q?fvBqaUvjq0BdOnA8pp5NIAKtOtmnkxf4lanLM11WRoZUDgYTT0eGW7rnzAX0?=
 =?us-ascii?Q?CGOarFF5MXz8kIY6UadWSeADaJCx/acqMG5XTdbpuMLL9T4p0HPGRcV8x/Rm?=
 =?us-ascii?Q?vIyxBQDn26QWxSfBCsT7qF1pS2aYE7Megkb5rIpyJHAu8jd1vTMY9MRkMdes?=
 =?us-ascii?Q?1CWOkB7TrR+tOT+dTa+GFpl700ii2D97fj1zRisoMNcv+B2TVVd+MvSo249a?=
 =?us-ascii?Q?g/B+s3UlRdUTyt5JdfqDnWOKdnXCNC0vReUBonr1E5YncBOSg2G7FdKdhp+e?=
 =?us-ascii?Q?enYvgBdZLvSJOJC0lXD0oLk1k2xjmzrtJuhw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8RtoJDZ2PFEp9ud0RTv9Bp8ZKe/unfsxQswLtzquJ5VweHyxx1cJvR/lQXdk?=
 =?us-ascii?Q?Gop8K+2JPzRmvUs8xE5CHGhmA49SYPSul9/45QchUDxjCj5ulXIN/Vrr0xRj?=
 =?us-ascii?Q?iwZyXKIKLqD3R9lGkB3JLFSSO60gCPfwBWvK3MDCEGvWW8UmmWIR4ff3h6Ik?=
 =?us-ascii?Q?gZnPWKOV5IITMXEkd7he5L30hpiBMJNWURNlDTmXQiaVXjDD9QJ29G6hkODI?=
 =?us-ascii?Q?0j2bxHr8pBaxpscUY6auAeiFXU8sBgcVMfeI2Ti/0g5QGmziAOPUViIZVvic?=
 =?us-ascii?Q?Tv6bbV25wZObCZ97sDTFjWFAZAhneKnAJXg3tdu+HvHXkem6rA8JsZpMz5CB?=
 =?us-ascii?Q?6uHICq+Mant+AasB6nGv76lok2VwNMMDCtvGl9OGETtTFDBhaNhc950TZfFM?=
 =?us-ascii?Q?s9YK+icY7vyLTfqVrYlpRZWGRN5oHabNbvnVogfA2oBjKWa4tSL2kSUg/9X+?=
 =?us-ascii?Q?xN4PEKaH7Xcj9DfYgsYkSsez1EAcmCd2AN0+7YjR8m3Ces63jUynAoMR7q6z?=
 =?us-ascii?Q?+pfLpEoeChIIjJqbIlvE9OhqPwSwj51dBKxvcjURrdK8R53w2QwM6Op4bjKt?=
 =?us-ascii?Q?XxVa8OVlgJsASCrmpHggzOrg5G+PYSKjtBRyL6r6p7Mm6nB2IGobDTKslC0J?=
 =?us-ascii?Q?tVyCww7GoOgBpaBbJFw78CAPVCdBAAqDnJerckjJT9W2TsXG9jR8i0yGXY47?=
 =?us-ascii?Q?VV5hngI4EQj2I/10eL+GyGh1Fa0IiNmYNq1p+uWQdgv87GLKBKqX/WmeP80e?=
 =?us-ascii?Q?6ptNVjkjQJM6eUqd6Brcx2qZbAlZmYU29XgmZnDqw2uHJOoqgpj0ZfHaD6cw?=
 =?us-ascii?Q?h2FFF6DW8IH6Vp8ckG8MrN35cdJ60MR5Pg2tUpyaisK2YEHCAvFm7aofThlW?=
 =?us-ascii?Q?PzwdUgwdduBeL2zJsx3HcOWcrVeyD4iExLkSG4Tz/BJu5miXyTaX+cbAQ9Vo?=
 =?us-ascii?Q?tNvl++bh8fZvQ5sI17e9oLgMvgtaJmUOi0xEfEfwevVEqQhMAcoGLzvvuvJf?=
 =?us-ascii?Q?YSxxNoEYUnU8GjV6uJk3eqEEe6Uk9jxM2+jtyk4BqMYAfg/7qGqPe1r4iF0k?=
 =?us-ascii?Q?TSSCtLHuV1Cwa/vJuLQ3lDAzkDUmVVUQYM3+MBIOjbm1pzL4YZ4+UoxLn9YK?=
 =?us-ascii?Q?yNVPMvT8OFVXJ9fA71CgPncWqRSwQ2MYwO6eoPL+6CXq7ZrO4MO5phOZVRgg?=
 =?us-ascii?Q?IVLIAmOxrftWJQBqNpV2KAfFeGyaVlZvJoYTQYH3jduT7ayOj7ie6plkadwJ?=
 =?us-ascii?Q?JHI0nHpEpMbb5Hwk90j+ft1SWLrPMqpc5bE4q+OoqZE+c5OhLBKBoXSJH7ZY?=
 =?us-ascii?Q?SVfhQMrWs8njbQTRIQ/LbDqT0EI+pjuadHpYaHTqdB2hVpeQ9eONMtUOTIEo?=
 =?us-ascii?Q?p38xg3wYVyEg6gPwvYlT4oPS3wFiW+KluMWkAjRvWH2Jb5ODnoZuAH/eiohd?=
 =?us-ascii?Q?rT2sk31fxF01ZBNErSnsJZvI4mKKkR8P7bIRFhpYsG2mh53e8WYaYfdx1018?=
 =?us-ascii?Q?qXtbNr9U0RBmQusoxh8lV8+r1l7j8sNmMBMsLz2ySJrtBKHT8JxiJejQ9xSe?=
 =?us-ascii?Q?Ls2q8rbeRgKYpKA1XHCci9mGxGzEqPFN+C0VXK0Jsi8ui8WKCTNnhrAK7wBs?=
 =?us-ascii?Q?CKnFv9XmzX3eaB/lWHzUxnc=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: dda4306f-9adb-4ff6-147a-08de2fc79911
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2025 04:19:04.8048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrEtpz8XTnYDOrQldT5EPVgRfqE4SGtcKTqGb4Oqs/tZ1rumX+2I5eqozrKFO9r+6yXQcOkq6RLpoNFQwDgupWrSpIQhZJyLkRMf9UR7sH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_201919_976231_887CE570 
X-CRM114-Status: UNSURE (   9.08  )
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

Add SNAND node to enable support of attached SPI-NAND on the EN7523 SoC.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm/boot/dts/airoha/en7523.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
index 231638b25c5b..115cc44093ab 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -205,4 +205,24 @@ pcie_intc1: interrupt-controller {
 			#interrupt-cells = <1>;
 		};
 	};
+
+	spi_ctrl: spi@1fa10000 {
+		compatible = "airoha,en7523-snand", "airoha,en7581-snand";
+		reg = <0x1fa10000 0x140>,
+		      <0x1fa11000 0x160>;
+
+		clocks = <&scu EN7523_CLK_SPI>;
+		clock-names = "spi";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nand: nand@0 {
+			compatible = "spi-nand";
+			reg = <0>;
+			spi-max-frequency = <50000000>;
+			spi-tx-bus-width = <1>;
+			spi-rx-bus-width = <2>;
+		};
+	};
 };
-- 
2.51.0


