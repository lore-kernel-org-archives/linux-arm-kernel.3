Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E178E668B1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 05:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADTHSpRp+uv+dVOZtQkY5yAvdQXOfCFG4kzF4oSxP9Q=; b=A/wMYCs8eyjHCaiSy32KLHfAJC
	zZfAuGRuPJ1Mlhe/9aRoqpb+dxAsomzIaLROOJiJ2bxvPnGt5mHgZCVgqEDne7qrGuH36y9xedMYi
	LvsA3+3s9Cypo8qvh9RKuFg0jTb0Chb+bG672K8Vog69U7ufhkbYhCbV9LD8E2gNZMmCvcKBozv6X
	pZQ0BUVR9gDr/kbRXmj18XrbelTEsivBclnpP+/Mm6YHX83BEAdOL25Igu/+199E4YBPeYPnE9Cjt
	QWqSJG0B1PPF6+jH1BJGBLrknKVJQlEr4NH3zlAWjNfswzzwvG8v0lOWdI2Zc7/hfh0u4aD7+F1ZG
	J9U3zByw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWpcI-0000000BKGl-0Si8;
	Sat, 20 Dec 2025 05:34:58 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWpcE-0000000BKCm-3jIS;
	Sat, 20 Dec 2025 05:34:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d784TByfNwH4kmTUjthWbW1xE/ZUk3DBONLMNlbb3ZmV5i4xTmW32IdyXW+OSE7GMUum3DNvzBImZ2a7+Io2H1hJFAcd5peGzJvuBMI949mduRw1OQMHyr5vRlnB/xp03iId01MLwPldOwGItRg65kYugCZUsmMBGuOT0FXewe+1YuvJsRjYeIcIyQYpyJCRtsK5iIvzqUi9YhgQsVd76Ejhs5Mt5XXxG4YwyGwdlb2mC7IOhEDjDY40b6AK64JQJdvwblaPUS069q4QrEGypf6/1Eh51cMwVxF8CAOEVtoMfs9drq4qw/pgyGlJsMa4fRsR1dfLJTi3EUR08bBCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADTHSpRp+uv+dVOZtQkY5yAvdQXOfCFG4kzF4oSxP9Q=;
 b=wZg4MwxESPP2ONBmxscyUg7+JYfvsUsNfQJ3h++ddPrCN4suReKv74L61bQOONcQbdLfHdcGMphV1wsyAEzI6YZQ9h9+E1H95xqT93nHhW3RHKwvKDvO54Rsp+WCVlNcRXqhkL9uWba0rt6abrhlGQAloTx5wam9gRgJYKxj0V5SC+e0vd5CtGxPHHVaVQF75lCK51/JyTWtFvQzM+90+0cR7kDHAQDk66gdX5ABaYYKiNYe9g5EDugTYBYE+nlgQN9QZ3OOPhv/j/HIdh90AFvABAkkcOEy56VbcWww7ksHgt7olJRJZ5vL+ICU0W5PU0Fg0nRKhkEvwa1F8lXNJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADTHSpRp+uv+dVOZtQkY5yAvdQXOfCFG4kzF4oSxP9Q=;
 b=f98oswgvOxF6T2m1xoyCysueCKE22Gc2yXlOUJZPVPrUfFtdcsfR3WE/L3kxD5pUlQGLP/3zCeRg2xDJ7PK1qijq/nA+5BRjYb1Mxy4p3f223pjnpG8ANxO3g2iPVa8DIySJ9YyF0NG9vbtlp99x8FZ9Z+Z1tKaYop4yPV0iIDkij3GMO6JLrAjlzc3raTuleNMhQW5wWSJ3z6XIxCsKHPf8JDjgOah6TSbwJpLnBubNO+iCRXP/xjQCCUaANuFEQWxXJ5Tv6WITr5WSOZ6849QkFGDUoW/iCx8XqEpYavOdoaie/CPvCL9P1mGd93f1Gage1qGaADMKaz1fWaqktw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GV2PR08MB11795.eurprd08.prod.outlook.com (2603:10a6:150:303::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sat, 20 Dec
 2025 05:34:46 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9434.009; Sat, 20 Dec 2025
 05:34:46 +0000
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
Subject: [PATCH RESEND v2 2/2] ARM: dts: airoha: en7523: add reset-controller support
Date: Sat, 20 Dec 2025 08:34:30 +0300
Message-ID: <20251220053431.288158-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251220053431.288158-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251220053431.288158-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI0P293CA0007.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::10) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|GV2PR08MB11795:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c69a54-ff0a-401e-28e9-08de3f897c4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bReiv2KZGPeQ2LPnv7Vq6kAafoENboDO0AD562lSMV+8uibS/IhRH1o3rcH6?=
 =?us-ascii?Q?3wRyhqg8QRM3yWsj5P4wOLYF5o4paKus2wj1n9i5uv5joeK/jscYdbP9Hk4R?=
 =?us-ascii?Q?WfYA9aCLGRPTauw28ZSybhdzaVyYLFixjFluML+ebuYYqxJ7MWowIwkfc900?=
 =?us-ascii?Q?GQpU4OBBKlc34yFmwL51AhVpflFc8jGhN1vEJoX4gUqn6xhPnNr9f6t2S44P?=
 =?us-ascii?Q?3WTcOJFyXGyqKiYZdxd42uqDNKNguhLKG1PQpxMAWdheBMpWtddFeDKiShu0?=
 =?us-ascii?Q?G9rIqb/q8uq1l1ZtikYq5R8eFwJCHZfEeEdoywfuraB09xVzfy6XYQNjhQ1t?=
 =?us-ascii?Q?BdWmD+Z9ZYoQFh1URaKsQ6dAk6dqmXB8kuQWCYE0MPF1dVQsjZaEJV8mqi5q?=
 =?us-ascii?Q?OEbCkGaonQ5ylM6GRvSrldvgxnHR7k4Ak6nzIy8LEdHItvHiBSLpCjnDhjZB?=
 =?us-ascii?Q?jXcpGsgDXUrC1UM4fTABm8G0ggmhTj3xoMef498c4ev/6iWbtH2zvg76gu6J?=
 =?us-ascii?Q?52JOgVZ/RpAsa8fGKuo8ZixyPwWdbUSEpCxFjilrETTWij0FCecM1dXhznLd?=
 =?us-ascii?Q?lujskOhA3RuUWOgCpfAg4wjihQyg7QaJm7J5n2Sankc0gA+MT1PDtHz4IOoF?=
 =?us-ascii?Q?QUs8RM6Oz4QbxD6M8N7tN0SQvaQPHjslixl0mIHgWHGfs+KrhapOMcv1H12c?=
 =?us-ascii?Q?hfOEprY0ZgMLJ2aMSNeIMery9Lu8Hlac3LREEd/ZaeAe5UwLKcFrmMlDpr2P?=
 =?us-ascii?Q?3LK1NrDmJU7LQq/tF5pv6ZGe6+5KEJREfwHsYuhA1szfW3S+xTIpa+nnBbZ1?=
 =?us-ascii?Q?vydvtFtsXN1DgrAC8Z0g7qJo/qnBj5BXkxiFSReO5dw2xKddEGzJ2QSiPnxZ?=
 =?us-ascii?Q?HMnNCoZQPmWBfy4vRFp0EhYehzam+RsL6tLWYCr+IoZOJSKcTHQKPhSyO/Yk?=
 =?us-ascii?Q?tY9kb2p/geQThohy8H9Fa1wnCAqsa8XwFV+62jjYs4n0LTTZoEHE6RFYGe1i?=
 =?us-ascii?Q?ZYOFGMWLteLOr8BpsVSmJmLJGQekBrirzkxRDxphjdUX7fGELl6P7qnMZoHW?=
 =?us-ascii?Q?kSvB8DuYd+lZuD+d6POY24OQ6iFMiVY5XTrfBLT1ad+j9C+Ai8DieF+hRvWO?=
 =?us-ascii?Q?7wuyADOpBrZFetH3U1Sr+7EZnlGTEefrFByT+iacBqmPatyum7J85/+MEee6?=
 =?us-ascii?Q?13U40jHVFj6NIskCcpbzhkZXKUREhm/PmMvpdj+z24r+5neeb+/RJhDQRCuF?=
 =?us-ascii?Q?W0P0zDu9T5X5mX0qvUkQzM35+4QNt4wFCKLUgbEqsni72BDvm2l8CrDe4VVq?=
 =?us-ascii?Q?/El3BzfDp3c8UgFvTgbGsagnSXCCCXmVUBb95b2b7Ta8wJLhkwYDUuofHADf?=
 =?us-ascii?Q?88Qgs4rKnFhEsnf9Tb4EFW1phhcNSC75QRdLSDgO02tV/S56OagRmjyVSHv5?=
 =?us-ascii?Q?S8FkbV6shF31/6dNE1vsmr/Tioh7oqG/wv4Dg4cxK2wW+rvxtuz5Vuc0HwpB?=
 =?us-ascii?Q?2ahzCwl8aYoWLsi+EtWlnN6Zh96eikSFc+VP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b8A3RXrEfJc2zH6XlebPubJ4T53h8q0UDxBxvxPDRLutH3jg1lYxMiTjq8WK?=
 =?us-ascii?Q?cezPTXv4RD4rgQib2tkzp3JK7908eZxw03Uore2XY8vo+5rXARZsIv1KT8Xu?=
 =?us-ascii?Q?jSLNC+5KaKZLhBYLwhJZlqVez+451PdvtFWaNNkqOsDAlpRhWZzkjkO/22Zh?=
 =?us-ascii?Q?uYvpb4In9nR7HxrtW4O5mARPCxkDQIZ6E64QIP3DfEk/83o7IletWSUXBsQf?=
 =?us-ascii?Q?bvuYth1owBpQFzBCJ4sp8VmKesF34riPan1O8G/FYqNYiMsSL7GSjSox2Atz?=
 =?us-ascii?Q?h+nrTr0a3QUR+kmS3mDT+EQcZKYveQ/oII91RrVD6qMLcMSBPGpY1xxWy+vI?=
 =?us-ascii?Q?u+8DZeiNS+nME3sIBZv+wUOjuafdFN5582CxFTbsB0+S31RMYL8KasXndNiL?=
 =?us-ascii?Q?tQBGrpCOpUtJArtz2giarlq3lf/BAzMnDJRLk+csemVrfKCnE6KqaMxuL0s+?=
 =?us-ascii?Q?FSXfdVDb/vdLNzEzWkbyeFB3X9aQz1/u9HDZMP9p8aErKhVluM/YS6gvR6AT?=
 =?us-ascii?Q?6mr59YjCDwN4RPF+euxn24RC8ROmedhXWE+v/uwzaXFi2RG4ctt+ifjYUP7Y?=
 =?us-ascii?Q?xjUCd+8VLHTR6VNuxHhZu4tYH29creRKDxWV5OpAgUk5WcJK2/sq74qsySsd?=
 =?us-ascii?Q?I+5h5CzsD5haqF9v0rCTbV08cEpOszu6wGdh4Gx/wc8S5tT/CHiw9LhNk808?=
 =?us-ascii?Q?nO76kg+bQhG8nScs/QC/DG6qZsHX5Pcb70vpBSBa1BtSV8cRzrYhmyzw+/KE?=
 =?us-ascii?Q?gU4GLAtXLYvMYd6hKAwaM3cpM/LUCe3B4egT1PIEBj17hYey7mbpsJXMjMu0?=
 =?us-ascii?Q?CO7AevWP4hHbR9zUBj9OtcsojGumdzooaigP2gEPnckmwfEUzIFJB9bN2P3k?=
 =?us-ascii?Q?MGj1ZpJYzHFsp8JJ7aCrdkiPT0JcZ8b9w40VvQftYJVRlLfOVEynzSPvlOXM?=
 =?us-ascii?Q?zENuIaDB56JqQ4KyfduHYVsppi9f+tB9Tbd7KYWPV+1BePgYkN68/i0rDGQs?=
 =?us-ascii?Q?u58vBukRIrclMcv4oMdj75esNozJDhUlA4lxh32TzS9H5Sm2KIFpXxGXFkzV?=
 =?us-ascii?Q?m58FgaHy4RS3nZosQYIpbSxDqCR3n8g38H1s510Y+VQ80Q2EY1HOMdtZEIBT?=
 =?us-ascii?Q?L98MOvSgmVoDPbAFDNItrOUWWUT7uDX6vsSl8XJkildTiE89ZYnqKiK/oe9R?=
 =?us-ascii?Q?n5IvrBOMV6J7T8NkfK8cx47L2BYw6mbyOUfCkXOnArmFar9EWxpU9dKQ6E7P?=
 =?us-ascii?Q?3vPFAIBBmCbzLzQpFNZWvvCPMwOH2p0dEADVBW777xwb2blCbleHLNj+uGfO?=
 =?us-ascii?Q?GBu9u8TLs8LIDUR/J4kWw1xW7YyCZcMVf4iKDIcmufUjUPAPeWE+uBFvuhkQ?=
 =?us-ascii?Q?dxm1NyU8kDv0pPHJosT83tAuwfyLJwPzXnbBu1qPE67/c++isL05Zd/HV4TR?=
 =?us-ascii?Q?ndFGoWSES+OEZcTdf28UQpt8sMdPOfTUxyLFCVINsA7ZOGy61PtuCaZU+iOz?=
 =?us-ascii?Q?T2qp4Z8GiyuBEbZBmw87/uz8D3vxPBj++ln95q/nYHTt0waEZoZXemcEtXAb?=
 =?us-ascii?Q?a9SgewxIGCpdi7kFVdgtoKH76vy1Hoz74VbDbET+3M+M5E36YTNvJfLXE8vF?=
 =?us-ascii?Q?ahoZkcbO9Xk7Ad2XRWaS/icLJAUkZ9h3aw50f+MxKomwWHs+qPPmXtrlHK17?=
 =?us-ascii?Q?GBawdWgo6NJhQfMq3fBXrbJB16rLMK3SfefV4WupmiVCPVK5gBRtUea3l2LK?=
 =?us-ascii?Q?OMBKtCeicnKDse4QdgGEYdH5t47OQRU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c69a54-ff0a-401e-28e9-08de3f897c4e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2025 05:34:46.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SK8qEgVAozhx6TEAdVnNjDua9mNdE/g1KrZKb3dQeEAaxkc+VsQjiCF+Ds/7OYmc34Q0rG7mSZCPLX/98t24NqpfLAVvmbsNOJiF7jwjh6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11795
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_213454_934822_FBFB3025 
X-CRM114-Status: UNSURE (   9.41  )
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

This patch updates EN7523 dtsi to reflect the reset-controller
support for EN7523 SoC.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm/boot/dts/airoha/en7523.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
index 31191b8d1430..115cc44093ab 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/en7523-clk.h>
+#include <dt-bindings/reset/airoha,en7523-reset.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -91,6 +92,7 @@ scu: system-controller@1fa20000 {
 		reg = <0x1fa20000 0x400>,
 		      <0x1fb00000 0x1000>;
 		#clock-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 	gic: interrupt-controller@9000000 {
-- 
2.51.0


