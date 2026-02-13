Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D0DEF48CA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 04:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gboInUYbdyhxKo27lO7q9QC8e/h2POTBxZYRuF7CkfI=; b=XJ7wygmLDJ6nbuGD/dEniU5rkZ
	L62eA9EriTnmjDZAOSu4uMH5Rxo139BdlqpAdJwxUpsDUg9IK0OIo+eyBSe/tKdtybQ6murD5LNL7
	A2zlBAamMEV/DW98JMCUhnQi/76U9rPh36p1Vh1ZurscsKuJF8OHUDZzgmghVw5Xc4D7uIwPRNLzj
	zS4yF5Gn74aw8w9ATrmuSQDMTFiFk2L/+K9pjWhyVPSnYeL+43Q/HaqzeTkX9IphooNHnaotPgygV
	PR9w+V9jlSLCCYny1mG0dBeW6NSUeCmhPcbqhnhx/S5V8/sCeRHCj6fG1CJwfmATUkS0Oa5q66/+5
	LYsuEThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqkU4-00000002x1n-0D1W;
	Fri, 13 Feb 2026 04:08:48 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqkTz-00000002wxj-20AL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 04:08:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnLI/DNE7BJ180UUR7K4WEaiCqsLRwQwpLLBIoKFFl32FPz+wqjisVER4IlXkFQ0QqhfdkM+xEzXRAkkrcZ5gtQOAzTrW8wkRKP1zKEeCDCKW5nJ7MqBXtxCyc9ZJvaTW15cMdbB6QDjkYe2p3WSCjwqL2bu7QMyhojl3R74CiluqbpVIerIoiQdMorZ0yHk70KcEkk5rw5PQQY64QFEudjy+PjmpXgGm5kUQwkCN3MxLZNMti0F+TX7vqwlxndkL6oed5VoN0jCU61XwIwdHQjIxhz866VH/Ao/aOW8xIUOmplvcqjAqBnnT/8EtFCIaZBqUke/gR2KADvbFoF/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gboInUYbdyhxKo27lO7q9QC8e/h2POTBxZYRuF7CkfI=;
 b=jZMaM6loTNqO5PVTTmkv4lcrBo8KAGMLdJXg10p/qmkRxkqmvzCvd8pMhLq9Hs7mtzu5zzs9IHzSTljbwi3w2UT5lSQiSol9piHLNhXaqeRX3BxAJyOic8DPntdg9DIgbfgsXJI15wum75BAiZfpIrjXUe9pOn8pGf1bcCsnh1CcaVZpP1IzvLQ5E983wWyL7DazBSVEV2WDsFICNpVokl5KWbetnMCmjV1B4X10K9Y5YdENz8e1f05g1Z9nnaYkjZxRsT8GjT9Ne3OHya4XKzS8N4bs0oPqZo9B6XrCj8IGAEw/H2A42iaTGoweHtPDRi8G4EFXPIrVN0m8VvcxWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gboInUYbdyhxKo27lO7q9QC8e/h2POTBxZYRuF7CkfI=;
 b=Roxq4vrLbbzqZMo1iwZU3w7ds+ZzZ89DxzsRTKgMjd2Ey33Raj2i35DDZ9qW9mcjJbpGpP/aVeKGqnJyA5qgogm2g+GaWDVGSJFbKIQBk0alatOlkODYW/bIi8tMELZyCEOCUuC6lcfHjBd+s3lTzBmec7xe/T7ywaoO/gmvBK/bgDYDFduf7pav0b+YcX4G/q2+iXNB/Wyw37/1lv5JspiFiQeVON3R0rfcJ4C6q5g2Ca9e8dcYHI4Xm6ZB4rWXTi2BsQuLNmvo8ebhzYmAF0kZxRgLRuhFfH5Mkm/pjmrFzn5yaQeCG68epFijYsrAdkdu39764NMoNEzysFzk0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DU4PR04MB11900.eurprd04.prod.outlook.com
 (2603:10a6:10:61a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 04:08:40 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 04:08:40 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	Frank.Li@nxp.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 08/12] arm64: dts: imx8mm: Add Root Port node and PERST property
Date: Fri, 13 Feb 2026 12:08:48 +0800
Message-Id: <20260213040852.3340547-9-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260213040852.3340547-1-sherry.sun@nxp.com>
References: <20260213040852.3340547-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0206.apcprd06.prod.outlook.com
 (2603:1096:4:68::14) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DU4PR04MB11900:EE_
X-MS-Office365-Filtering-Correlation-Id: d4062039-854e-47fe-c31c-08de6ab5922d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NApN2jOV2G2GqSLp2yO9pW3WGgBT8caeui68U9YyGgnOJs1+lXt28DG0CncY?=
 =?us-ascii?Q?aIIkgOpSNqhTV+OWs7+mV1bcoOIRXxrNCdDq38uNhK51vifdyqZO/I0ykHNs?=
 =?us-ascii?Q?ZmUHx6xOA8laQQtsPGNYQpd4LNHGN2HMABtH2sa4jZzS44TTvGiZU8+eSTeA?=
 =?us-ascii?Q?7223DlpMlMBaJbOymlRfMB9+HaGSbFBeYNLmsytRUT49GPJStrGrnh+iw5J+?=
 =?us-ascii?Q?hDBardDlOh+EEuV1RqMPhs4o4TzY6Z9qIvB2WQ+VVlKNLtmfIACSp1JjBEdT?=
 =?us-ascii?Q?DSqHcO7dbBeBUEAtZAQjrU+5RGFajJqh4ajZ7uOQZxEtsJumnVUiDurANy/s?=
 =?us-ascii?Q?XyyzqbQbM9dgYq7ji0Os7kVpn+dAIlkdeT5ly4s2q64m4+XvTRiJfq/4DD4O?=
 =?us-ascii?Q?TR02wHuFAKdVpKimkJFzc/x2aWrLQU6xFHiwird6m19KC5XvmbKWGCegF9bR?=
 =?us-ascii?Q?I7Qe158WhONDS8/at8g7hRhyPueTObUhON9yCUkuv/EejsR8KjO1XHzLmvrX?=
 =?us-ascii?Q?x5i1yblFyqoFxIHwQu9jdsxg/IPxI2hZ3SJr3nEII3RcqxJ0B9DGOOD5J3v3?=
 =?us-ascii?Q?N0BPvDm5cEaMlrJ3qaSd4ynEezkOv1jIYXpjO1JxaoHrZmG9MurPafVQxdVx?=
 =?us-ascii?Q?t/Z3l8XgWbjxaF9zsS/GcHaDMoXRIhvJkkRydmkxHxKZMFtIYmeNqUUeSfsu?=
 =?us-ascii?Q?qzykeSz/TDamo613KYnB5nW9oXMgkLOZf65tUScBcdKz+jFk4d8GmFIkk0GY?=
 =?us-ascii?Q?YP44ZwJbRKu/B5gVxLV0Nj6jPnbjH2OSKCFiNAYMhoMz+9r21rBGiulhIb4Q?=
 =?us-ascii?Q?OQCZus3lfl1nmbkD5sg+kcTonqf07XGRNd2ZRjA4/tTjwocZi4wNC4xdLwOp?=
 =?us-ascii?Q?ER0af7dZmKbzm0s8fcHBjYreLodY/N8M0iYE/QUehSoPBKM2cMSiDOoelyY+?=
 =?us-ascii?Q?bbdvbNGvUK8dAtNHA2JX96veijkm0P6iRr98cx40zOhocBEccKRUS1vjt9aH?=
 =?us-ascii?Q?YiBKjVX6PAX192DTjiftX5jngcqabBR7OK2O/VR+eHb/UTdd1rRhpo8icfL5?=
 =?us-ascii?Q?xzY7G89uHlXTFfsflK1NBIuov6tgISHpqsXR3Wlc56ok/muGgg0EybN8pUTk?=
 =?us-ascii?Q?okDKnEOxoh1wLxP6UA7l1+fYI2klENXED9O3lUDGAvVVW6zrbXTRj60C2+QO?=
 =?us-ascii?Q?c7jlE/nE1Er3mXD0VsPAUu/iQtydGklQhHpOtrTZyKZIKvwWvq4wQFHkKpU+?=
 =?us-ascii?Q?1aRlJjQ3znsznf2BwQBTakZk/JkYZMdIrSSP47TUH6+tp6Nk/X4EUgSdp5rQ?=
 =?us-ascii?Q?QbKfgume6NMrQoepDTzpaZmcq5HYvEuCviL67IL7bvPCsIdzs3s6q4YEYq2A?=
 =?us-ascii?Q?/nEev/VBPbgN+ZcbIXSlE/0r5s8KaPznDmLIgWZpCTwzoRPjhfHK6BrGZ/g+?=
 =?us-ascii?Q?0WiZy0t/sKnum7O6Nu2OfRy/DtXvMBdO6Be05njddHSL95EpdEWz3DuSXwtP?=
 =?us-ascii?Q?ImJw4ofCnz8xe4dmdi9yNXSG8w+iLIYQjmccDRW21AHwp5i38O7YqeuVO9Ne?=
 =?us-ascii?Q?0X9ympluw2tSPMIXt1sxCvPBKBeQ8IIPCvibis1DDiR2ebprGi7P9ZAd4S6b?=
 =?us-ascii?Q?3uOJVNiqS+JpZumDNVvy+yxHj+JHS0BVVAz7RUfYyv9a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jcKtNNh4cenSWY8oxLVksXquaTxho5dHDUUw/Bp/RtdaIv/Q1DCsZKxMFKOY?=
 =?us-ascii?Q?rKUxPwbbCX6hiGuJwEsBix8hTKgDV53bdFzjqvUXmtGDXWVPecvqKbDtCmwr?=
 =?us-ascii?Q?eHZS+6sFlpBUbEeN4dOZOYiJ4CU+iVNaiZ6gtZ623uU8e1FB/EdJIysectjR?=
 =?us-ascii?Q?7X47w9nFzw1sL5SeeR5pkrz/yUgMmlisXGFZaNXmh65gDJogRJ78J2XPVFfJ?=
 =?us-ascii?Q?UMijUmkFIVmhx/jHdlW9mLyWgSlF5HjTyj1SBznaDctIY6Nr61w6e2qwvTGf?=
 =?us-ascii?Q?Pbl0p00SSnbKHKz9eiQqNL6E4J2pBa7YRcsjeprnhxRq9wnZNgBIZjsR0S6e?=
 =?us-ascii?Q?lIOX8SbmcEtdW+yvJTP4uPQiA+AbF47UeKrHFzRAO4h02Ze0qeIpa9GwxKoa?=
 =?us-ascii?Q?ohb6M+LbewrkxGN1+M1bGchWLpDww+HnTTczxnd32ZGUlfNm8RSKFTul35So?=
 =?us-ascii?Q?lhYGQVZ2gjfAS2/zpayuUlf8AFfCK1EL8gKcdW1TkfGy/1dcFnsvLWy0WQvL?=
 =?us-ascii?Q?M/DY2orI8jCJ+ENlc8ccbUPmtHcoYwlF2zwxAgPFlruJ318/eN1JGGkBmEav?=
 =?us-ascii?Q?flHAmTuSfKHjX8fRzpo4xYRgJ1UJ12BJFiDGTKgCYEamD/prHMdg6Z/z9K5z?=
 =?us-ascii?Q?x/zM5nRfIaYwuVfbebkIvJFdmVBnNVYsP49zbjYCt/5JKZFOf7KByM45gnzv?=
 =?us-ascii?Q?CuZIPHqoj6MnYcymI/+Oz7kzoLQq7X8bAPIvTGZwthQ0vP7VsYPCFOw8sZu+?=
 =?us-ascii?Q?f5ETreHQ5cBlHi7n8K72Pved9KH5UNJEbB8+6nvibS6iBiekUcvfEVLZnETy?=
 =?us-ascii?Q?Nf0Py0rDqHrF5FwsJk87pmgfvNqLV0zoq0qejYbNHCozC/G5equSXPKgt/Od?=
 =?us-ascii?Q?FzZYYDNEDVzIp3Qe7WOJ+P/GgBfHBeqXRaNoyNkhyObPakKFAiA0zyWX3omk?=
 =?us-ascii?Q?GDY5ixiu9UFYP7TISKQMmmlZ5Hoc5YbBHgtqKFd+S9e4ca/4bZcI8FKaeqG0?=
 =?us-ascii?Q?7hKrOloFkp+9tbSoYbtdR9sG8yNycByF+Bi2S+cdT73UDc0l1L3md6YwNZOO?=
 =?us-ascii?Q?R7IW1bYgGRiSTKdZzV3zkDtil+tA3zTOteHANCHAui9fN8U3Z+zoo7XCCnLr?=
 =?us-ascii?Q?zNw0ekfGXyXFI+ubyjvnsyHX7rspLNZJPDHabgLMcn2GD+o+W9NnGDjCIhnR?=
 =?us-ascii?Q?7xDh3i5RjMBxjxb9T9+vn+otCPEfYlkatKSERKtEL9gOHqwLlOhH30wPycVX?=
 =?us-ascii?Q?DBq+e3BChDdmyGWTtIhnwiEYyLv6aUBkA53R1o8w9Uo8HKKU6Tyo6GxQWAW3?=
 =?us-ascii?Q?yQWR1WBlCmgglERgS4kYDDXPFWsXRMWEasAukWjC7TtdTFNBglQscn2cf6hN?=
 =?us-ascii?Q?wDGRFVmjJ05iSz1vecoXj+vAt9DPuJBgkHhieiaLZIYLhSQu71UamkXbH52T?=
 =?us-ascii?Q?9y6zj+ba0JdbGjWCkyhN2X8AQpAyGK7uDZ5TGKHmhOoC37zTTmXE35K70s/D?=
 =?us-ascii?Q?6JzVlvCzBxZzcCZk9DgKWcxT9XRB/8XAKmiU4gBtoXpm+/d/+tJLDVpAT+8W?=
 =?us-ascii?Q?P1QunDsmLjtk13BpcjHrariVboFapciAzV0PI+a3m8vnH9ZFp9B04kh/IqgF?=
 =?us-ascii?Q?xE0BQVOh5G4g1ysyMR7qqlumnwP6evgE3pFfpnw9GHRDQB0x8fiKOeg4/ons?=
 =?us-ascii?Q?YtIlTK48SJrxUXcwda4NUEIiGpFfjf82itFiPesx3iyHARbEqS+AlYcCu7rs?=
 =?us-ascii?Q?8ttJt2NX0Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4062039-854e-47fe-c31c-08de6ab5922d
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 04:08:40.7995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7KZ6qq+XJsMHvhMD2NjXtOiYj8E14XMKUDqZm/qIh6ZozUfHY9ghI7JjfP7EYVvEoIwd2jgJnbGr4Byh6x4sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11900
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_200844_077145_357E6C13 
X-CRM114-Status: GOOD (  10.56  )
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi |  5 +++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 6eab8a6001db..060860f24e7a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -533,6 +533,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio4 21 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
@@ -559,6 +560,10 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
+};
+
 &sai2 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 9f49c0b386d3..1204cc4d3f37 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1369,6 +1369,17 @@ pcie0: pcie@33800000 {
 			phys = <&pcie_phy>;
 			phy-names = "pcie-phy";
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_ep: pcie-ep@33800000 {
-- 
2.37.1


