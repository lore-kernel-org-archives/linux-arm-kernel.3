Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFECE668B1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 05:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=; b=e/amb4rU1qIxa9s3Z+Oduipxym
	++gao5WsbLfyy1YjmbybrxNuGiaaO7B723YrLT6rTRYBEj49mehNb/RgF5F6BAVXrobkx03QAySFh
	zJiH33qAJnpvAtpjAX4mxqAZU4/lRFLirbq+xKIqJtbFUEpXqBFVzfH2+M2P0aemY+dL67iN5ccKp
	O9ebpIqi/gB8/ANKLP07NtJo2G7x10pqOXK0KXh125nvhUty8hYXFde/0upQ71zRSxRX9Mn1FNN1X
	b8dDXLtbvhCwhVJxFeE6nFUn+XNw8gSkh0qMpo4ViftTgrKrR8vXcVJ+Nazsbtywf4Vb77YnA/9zh
	pdFyfJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWpcD-0000000BKDC-0h9X;
	Sat, 20 Dec 2025 05:34:53 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWpcA-0000000BKCm-1Azc;
	Sat, 20 Dec 2025 05:34:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZF+229dqbuq+J3a44Din9N8P6xaH6KM6RLvycFMC/ptHTl58/ep0Piw+paGoHjLc3jGiklzrnw4IO5PUsWaBesAj+wCCc4PM6d1vq1F64muOYk46/0maar5YETQRfXZito9rZWxjjSfpXpgDx26uSB+ikWRqoEEB+MY9rpPAMRjKGwIMH6A0NRA5VgKcJ2RNDsJzXo22oOUe1gcIjDrQdZsg2y3IxNa/ko2tP3v45e0KzSbXi+VZQ0nborUsJlRYjszJyjMD9Zxl/tNzvrHOJ7lt8sIzkr33Hv2oUEY65HOJ2MUJFM8fjAsy8D+kd7ccIzeH2dorIhU5Unm9ojNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=jS8KCjas6ZyVzr4T97ZF952g+Djqoavwouxr+ADI8zvtM3U9C0myHJTBL757gaEQaA9XaP9y3M5yWI3J1rbiYnXjlzKmjqfcgD5YO6E8KZ8xz3M/KofONS1hn555dptv/0PNgSRJRNEYCwWsbu57C7dzXjnS9v8MEMcOKKJAdWerlCYZU2mWB0w0If72prDu9Jdt6SJ2El5FKwQPAx7xD8wjQ38wNTVA+VKfK4YM8+IcnaDOm7ydS0bHXiWhQDpFLpWRJmHXaT0YaoDs2fFCsiFnAbMXywlLKYlxBbDQSJhjqh611MEqeGaIta0gzf+CV9suBpIXUq9jsXkTSWiZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=Wvp5l7td52TXa8P3Gmj8JZWhkSw2JFl4EYgnzZhuGw04DC5LOdgYVRbiGOJQW0gukeH67y5AJ34/tSAXQqkcloPRLzt32q2W4uLXER/DDVGXkaZJsUIsPbsRULpfeVm5McWoxENjIStbAZJVT0KpQstmSVPkR3q8Rq9n1FCdx5d0aItSRRUNvI9qfnZBqr4YlzakG8IwvIZwQbPhGe/b/PHnDugezHkLXWEE2oJkeRZ1UrAmvNTkl5R9v94MFi5EnXqELMduPYMkqoCzqVRDIU5XjwnSXqdqXUdHFSciYp/GCAI4P3YImoZ+sB6Yubj3eShJXd0NvFIs0nxD5KpGHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GV2PR08MB11795.eurprd08.prod.outlook.com (2603:10a6:150:303::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sat, 20 Dec
 2025 05:34:44 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9434.009; Sat, 20 Dec 2025
 05:34:44 +0000
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
Subject: [PATCH RESEND v2 1/2] ARM: dts: airoha: en7523: add node to support spinand flashes
Date: Sat, 20 Dec 2025 08:34:29 +0300
Message-ID: <20251220053431.288158-2-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 365807a3-6b2c-40a0-2fe8-08de3f897af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JkXoQGX1SLnSLLFEBo4/IvDiZR95wciOL4jTFMskRDKov2oD714ivtPTt5vD?=
 =?us-ascii?Q?yGoaoRr0a58UiZz3dXEhyEp++bBxr+11TYm6gS4DJqHrE4BeJfg+w2cEeOtZ?=
 =?us-ascii?Q?LE30RQBbrgiqvH/+w0gyeIL+zDHouNypo1ae+z9WSWe/pJpnAAn+HdlTIiHV?=
 =?us-ascii?Q?tJ2hf1zH74d0YJBuSBbw2/hq7U7WTRj3ez7raCcIdBdxZHFQO9y4V+5BYGhB?=
 =?us-ascii?Q?fM3AZV/zdeBh9jSUtdfRU+IAbHKDcxTD0/Wy05XPJkfR/Ow33UBjdNsSh+oa?=
 =?us-ascii?Q?3oHK6raio7Zx2d526g4/czIJjBRscncOSQIdo0oxnpDmoisoC342eY9x+FuR?=
 =?us-ascii?Q?s8SEQW+0ENNDYI2hi3uFih1/YwV+C8qaYD3ru6ibJ4wYQXDMglUYiQupPbhv?=
 =?us-ascii?Q?3BQ9ZgEXom1ucB6/ZM7n3MIurYqQ5B/5kI18RLOqh48C6qTUwVpL0Ltt3mv2?=
 =?us-ascii?Q?d4BHJyV+Ix2Q7XYTpXArkb9rbMaWLBCi4PYCxep4tHwpNX78q4+7HnIpHnQh?=
 =?us-ascii?Q?u9TzUCg55M0Xmm/8hVyQEQoSCVCd1oft/xIAiAy2RXHt38mUb59DOMLi3klD?=
 =?us-ascii?Q?gYQzNyADPgiQmiMLyZlZtpUZBks0VgAUKhfIlk0EY5pKEnK5r1WLO7TgWdl0?=
 =?us-ascii?Q?UTC3mUqcVdsij+PFZUwoO5XmBEr5nrCN19rEl47D3j3KhJyTE+lYprJ8gwIL?=
 =?us-ascii?Q?uFXOaiH2N5LvuAJ8OQvFb+KCMoyIRHdlVqDi+UFir0FzJNeaQUYCEKQgiF03?=
 =?us-ascii?Q?6c6Of9g6IAx0bjuyzKahi9T7oHhMU/xif9PkMM6FyyyjDb5045zpL9j01ZPL?=
 =?us-ascii?Q?cS44AYnDeAGotfSvJ5WHlNDl3U1A3BGZk7tffaX63AIkX09r1p4zoV2j/IGe?=
 =?us-ascii?Q?E2xLIagWYPqfnsXc8AfCX23/3xpM41K1miIivYBV5g2BS/Q5MWSBB31ziLmL?=
 =?us-ascii?Q?C5EIgNwKnfHeci0//qYWaSu2SnQIxIPBAwtPVkdXGD0CePKzD/CuRDuWpZU9?=
 =?us-ascii?Q?bZfgnCPNWbTB9yC+F8r4ozliaa5D5Q02SfgA/dDaBtV4RYfCKrw6Whc7dcfw?=
 =?us-ascii?Q?rTS2nmzfUSV9lz+M4WdzznPRmqDfaYlKMyNTjj/K+L6bEgh+xvk/pJuLBVMR?=
 =?us-ascii?Q?W130GapAzYJ+VJIyV+8BhUYMIis/OBmdP3CrhyTLe0ox30aOaAKOUFR25I+d?=
 =?us-ascii?Q?YqAI6nlOOrSi3QSIl6koTF3UX+R1NesyhpHAqT3VCD3h0T37zysdKwMxhGdT?=
 =?us-ascii?Q?lhTNrIgSzxx/BmC7OaW9rJxf6Nqo9I0e4mQ4bLahsVxoQN4pQQdN8qEYMOTB?=
 =?us-ascii?Q?7TghYel/HaozqMm6saV9SzZ47Gt7CudCyZnSmTaSPmK2o+SLEd6KSfOLJpm7?=
 =?us-ascii?Q?XgOz/f55+gYxra0pKo0n3AxKpgGjO7lexNfbsLNdT2VTXOPbJsTIt6bk/7Gq?=
 =?us-ascii?Q?lkpRuoTio8EfhcdPbVbvBLqmeXIm5ZjTZA3C6t5F1eNZJ1p4fOHZh/uZ7sUu?=
 =?us-ascii?Q?Pb8oYPgnUzGedijcqqVBg0YUN6XvgdntfPuR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LBd/PTxGMCFTBzHuWp1AKz+hyAIcRBAYU3wjobc3RVvWdc0ljoCu/w7IgMb4?=
 =?us-ascii?Q?ZzF90g3aZ+UuDCspydKEVMz/kdaqFFINJ/ZKc/+GJ0ijie7BBUuwswVsCyAG?=
 =?us-ascii?Q?V0/IVuxyeLC4u/8npLoZemf0N3Gb5ojy4xiY2GqufWhkQm94aMKLTIcSJ7SA?=
 =?us-ascii?Q?6OXt8qFzzJbelI9l/i/Ny/ZeSF691i7KnI/4/LOUDzYvQ/sJ1GevcOnZqZwV?=
 =?us-ascii?Q?kFb1fZIm2yIMbBfQCKQ16DJ0Vy99p93vm2ysYr9thS/6wyFdKieF9NjwBFhG?=
 =?us-ascii?Q?+48vsLCiSVyWh1cZ8nKF+O+CiJ4G3a0DT1HNoFEspn4E0QIngcp+1oSwn0Zj?=
 =?us-ascii?Q?W8ulyQyLDQa2KBmBv2SkP8Xnyn0znKE82OzjytEI88nGfPOsnevF15QU1bPD?=
 =?us-ascii?Q?p9eH597upC0FM+3ysP6YRKo7loNjITiDTGWQgxB6YXqmsQEMSHvKWG2Pkoso?=
 =?us-ascii?Q?vTOqaustdcg+yNfHcFh5dX1+8QMU1DboapiL3cLo8LZV5B9DWsZr755ypES2?=
 =?us-ascii?Q?oo0ci3hOdjFAunTYA5YcWDiECST3NBnbBLc5avhDVUYMikMSEjqLGN1KLVOe?=
 =?us-ascii?Q?zU+TlE3nLPfaNPfAH+eZlx44paF94kObbJdN6zVk0C2A7zMXqAELnriTb3h8?=
 =?us-ascii?Q?Ste9a6r2UKRmCaEBmq8cluYjyN5lwq+vIqtwQ62tLvsH7ijpna0AGwGiWzVJ?=
 =?us-ascii?Q?uzlRyO3zYEDkltbGUVndHFw4pJRDPnrBbZ5kOHh8RSGrJSXocx7MQyCsdwV1?=
 =?us-ascii?Q?M/baTHGgV2l8F1euJ2c3DpIUZrR7DJL/YH5YA0gD4C8P+F90OGkRuDOEdJxk?=
 =?us-ascii?Q?Iv+aSOLgaRXTtkb/wEfSXUwgZLHDLOLDi2Emdiu/efyC+MDt+dM1qLyUITvm?=
 =?us-ascii?Q?j6dUKtGR0+yGFy2wUFHgeDh1XqBfylKMrA0LLOpNfMGLQbDpVMABzO8CtJrG?=
 =?us-ascii?Q?xPhUzHpWjLi1E5Xs0AdSZfphZkxPswzcxv3qH5NqY5F/SnhIUyRFRvPG67kU?=
 =?us-ascii?Q?AEVfeTgwI2KuC3JWk+6oWC5A0+AttUD6AZTSZNYsX33KDq28TUpchy9VWhiy?=
 =?us-ascii?Q?G5AG7h7ZrDCN28wSoM0KckW29FEhGuRt4tsFBvqQtZ6L23jkxSNtupp+39XO?=
 =?us-ascii?Q?VB20Z5B+7zb6zMhswbIQh8NNOStHTCZ0Xsgw0P3bRsQ6US2mhTeTAP6QsmHS?=
 =?us-ascii?Q?ufQxlqQ4+Qn3zHb9DXpu92oGjPcTqbmNrH/f0PZ5AzlN2VODYqjHWuRo+yj0?=
 =?us-ascii?Q?By+xPfccQQOIxeN2ipcqkk/KAT9pqiYhJ0TN0i2wusceJ93EDmjrVOrakzpo?=
 =?us-ascii?Q?Pi2S5qIjwJhxEUi6ZkkwRzQp7qSJoFI0OGxOo8tEE0qy86mDJhx2BmKqyXeg?=
 =?us-ascii?Q?z3jPwt+c0CUTyGlF8JFqEI594ShrBQpchuJ6TJ4p1wh4IkW+J5GyI7jkh0Vm?=
 =?us-ascii?Q?hiM60d9LhWDDo3m13bR55Cg0viANkm+HqQThvFFbBSGPZSotxY98GzWT7C1t?=
 =?us-ascii?Q?F59e7fXzikIHiISv1vwx467M6kxOABfV+mooiyXh6R9DxRVvlUq7H0Xuq3vF?=
 =?us-ascii?Q?3Q2cAihpHFVHLb43HKKqTkUx8oI40oRpnNBmrsQJeEqQ3sVbnY+xG0XCwJcj?=
 =?us-ascii?Q?GM1LgiXCxZsNT17w966SIClyzpt7VU8qxdrys0S8QPFib4NM0Tzmk3z8ej+F?=
 =?us-ascii?Q?Zl9AQZlG/209TIRC9AJfZ6HAAHTrCz2NLo9ibSbt3XFQ2BH/y1Vkof/GNmjB?=
 =?us-ascii?Q?QrHjUIIfqDVRR34rpqy2sxlXGMl6/NU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 365807a3-6b2c-40a0-2fe8-08de3f897af2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2025 05:34:44.1202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JjWMf29m2Uxya7h5em+W55RrISHg2ICzooVJ+t2vFhvBkPeBmfHeCHXXRuTJi5kx/KdwahT08CU207B/53mm+oCYw6uNwWYJNEJ3KmZSsZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11795
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_213451_265732_D3052487 
X-CRM114-Status: UNSURE (   8.33  )
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
index b523a868c4ad..31191b8d1430 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -203,4 +203,24 @@ pcie_intc1: interrupt-controller {
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


