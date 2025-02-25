Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB69DC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssTKjDCIk2+PE1CTW28d/Mu/Djdj4xXuRIPrYsKnIrQ=; b=qk48bdb9e2J96K+TRQViH2FoUg
	4gzHvko5x6uF+pHycOSnx6p75dRj8CRm63AKDFQKuvBlWYuuDZW9uEeIzNxX5RxsULfInScIKy+6U
	7lug5D32oGZwW6Rw6NeNj7Cbdky4sDYAJaPBY84yFUSnOrsZP/v2O6YTNi7s4VbmBLWw0D8nND1mO
	Qwoyy2HBiWDVuZJna3YNO26JlUVpWEThhQ1xxD7ZC4n3bfx/fftTIeGi4rsArMvp3HlMCqxHe7Oat
	k3AfczjMRnW9H2ZNk/QwyqD/TfoZsFVldbQBU9pQ4iNIRvGiMBFYk/7z5LPDsaERgitazbliEgxVy
	nG33f6KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtIX-0000000H42A-3IsU;
	Tue, 25 Feb 2025 11:40:25 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tms26-0000000GnPm-41gb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:19:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeHipfAEzQU/sAupPQ2XJwGZNK5n8YcQHnc/Td2Qp8LaJkH5mEMb2W9v1qUjqNKqFOEob61WQJ8JW643lP/ReoLLhujS+EJDgZsuNCEKxDyW7ePWPtWdxHX4aFz1mlFB13fp2DBnuzyo7nwKy2GP02nO2O7ulxIDFwSPFSjKYi3pDOJAPbuW+nyh++Kc0mC5wG3BQT5FeXTTIQaAiyUcH8hlyPsNkN9cXAkmnmTra+qoEJkETPmnihY14+/qiEEYvMLzLU3ROndyTDjt1nNEHvkpR72ppUFgYOCBVM1P6xuPtsYKxxjT67TmXesBDY9YtJvUSGaIviTUU40U5luVag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssTKjDCIk2+PE1CTW28d/Mu/Djdj4xXuRIPrYsKnIrQ=;
 b=YGjXKbNCpnzvkCQ4+4L+ry+Vrr2fpeyW4hbD46d7qiFh4/XW+/k+CFwWcu06o6hGCldFcSueMNNmjRw9MYvAvz1/xjXlgrzbx+cIGHKs0FB0D8igk9Hh3zio64jTWM1glGVzE/f/6doJebS1B8z0nXtBjSpWK5hs94b0cILxpcaA5b/qIOFrGvjZCg6efu9C3XlwHtIwWqcMEO1OqbrQgI8LhqCEYSYAwPeKnCkJQIrz/l817+fDwrNUCwu5CHARuc7pZFqC941C8xmU6Lui8Dq+KJOq47uDYsaPXCHcBpZkVPrJv3U52/+FxwInkQRKT9nCGfW849B84jd7LQWbuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssTKjDCIk2+PE1CTW28d/Mu/Djdj4xXuRIPrYsKnIrQ=;
 b=CQwW3hXaTDaEn4WmG4jq8tU/6KlQnQkV9EThlmxp5NeRF+S+ZIEs1eHNsI0wSTWkM0iYojcj4vl7dalU32cccOGm5sp4GrevpilJ2dNIQtLvivfqpfg0Hpl30qIjR6DyUIrduTJ3FEOp76a2XNGfHGNnpyN0qIFMYlo1n/bxfVEmghaJUN79V2tm3gMEcFputToC4IDUbv5KfqJKoRA4kccJVAzMQuzRnl+hV7WDhhVZBmo311RENJHKsvxMffgxRSA5t4/UB914SbOq5sr3dGQjSw1EiYsnHXrlaXBIXg66WIxyuwAviOQRldIuegGQ9GHMjcBWku0v/oR/ctL5Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS1PR04MB9504.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 10:19:19 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:19:19 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org
Cc: conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	andersson@kernel.org,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 3/8] arm64: dts: imx8mp: Use resets property
Date: Tue, 25 Feb 2025 12:20:00 +0200
Message-ID: <20250225102005.408773-4-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225102005.408773-1-daniel.baluta@nxp.com>
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS1PR04MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 026800bc-c637-4fdd-f86c-08dd5585dd57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7Ty8dN9DMsXTIYHARJJ5JcaRgI9LYdRie64srWUfGnXlSscNlRlpOzDdszVq?=
 =?us-ascii?Q?dItx+0H4ymxxaPcU675Z7j8IS40ect9N16SSQUICvwiy+VUOr/42V9gjTM8u?=
 =?us-ascii?Q?qU8LbyA467rTxN/+QYHblmBJJVIl/TAZJrakEp8kP+Dj/Y/h2sHplQsnnwzt?=
 =?us-ascii?Q?9mH2zVmB/2lKNoxcWuGPTn1R6yhu/wfZnTX6YuvUfzQXg81o2UrRIXMGJ8gP?=
 =?us-ascii?Q?aBUzalH6ZGTENH7pMbGjzCuWG+eMGDJOGGWr4c+KK+mzotmIjm3Qpg/TLVdL?=
 =?us-ascii?Q?sSS3vbMdlckQ7fP0gTiXlHYz6UvSAfKT2m+Q4HDYmqpxVhTXd7+BM1gqpqx4?=
 =?us-ascii?Q?3bcDJN7/IGc/mKQmqWTRGeCohi8xSGcVnl4eckhqe/RSMXlsS0vCj38/bnE8?=
 =?us-ascii?Q?OhFGYsUrgetx8FAMoHrdUNIZ0zpVzkFuEQFSDW3R0gm7SkJanIAb8X/acoBZ?=
 =?us-ascii?Q?xt+eVMrWC4eaAv/dBhIGnW14VXlzR4mpC3CuCj8XoYWaO6rgPXtratu89Co6?=
 =?us-ascii?Q?P2Pumocb3EHJ9Wy3Nh7LEYT+qXv7nrFw4/gpDDb+MU9AiCx5PaaG8jKgKs9g?=
 =?us-ascii?Q?dmj20U7i1F/GWr6CzF5iSNLO6Uo1p1W+T8Ru/9bCuAjp7ttLXVl81hAENfeM?=
 =?us-ascii?Q?U3Ne2j/UC3UTZdEM4jMhq6bD1twE11KD2gbkfwh/FT1g5SZbT3QBj/uCrM9t?=
 =?us-ascii?Q?6Vd8AtFaAoR4aH/RbAkYqR0qDdrfOWRyhkWiKLdDzqtqAo2IQCJcbwWmZstl?=
 =?us-ascii?Q?80KwItESOB/fDWJyYRostbDiZrD7+McyuZzTXZ6dF5+q995+WlY3irwcQXiz?=
 =?us-ascii?Q?eqqvO2YsqiraubbdKC/wb0ba9K1E9lYiOziszsfBt5Q6kEIX02YHO6OjFJxg?=
 =?us-ascii?Q?ffV+6vKrR1t2zOHYVYmr5P4Wgd08jlZXjuVE+fpJ1Yo1kr0ySaXyj0UMBDom?=
 =?us-ascii?Q?8jr8Caw0rV9xCZqcDLS9QL3e2mwbHZLNEGoOaSO+MX4sE0p5QFSWDAOUHTqC?=
 =?us-ascii?Q?BWG2poL6qRlxRZK34QU+7nTK+CXpex6Zu9zYrfUaPl62oB1T9vwlV3ySUkZi?=
 =?us-ascii?Q?w6kghfWcCp76RBbi61GKKaVEvJlQfkkxDBuJ5G/fFkFvvaOdq31UZve/DaU6?=
 =?us-ascii?Q?5+p0gnK+HB4P+Ty3S8FkxJHbR1vQdhX3UNiLVBTUZgoy7OLZ1eVF1c2tVI9B?=
 =?us-ascii?Q?FbZn+3juI3V9BN7QHd0R14l//EL9+IDJI7N6dAb5pfN8bpteyDsC80boarCx?=
 =?us-ascii?Q?Ke/93PMCaEOE3z1L48D/1lQS1z/SJ+S1vBb0hkMCRSBtCOlC55eL99VhPykr?=
 =?us-ascii?Q?DXutEXh4PrYmpIUp6Db396RT7wKEP70yctUx+EA8SLiVBuyZkKvxYwrkau9d?=
 =?us-ascii?Q?sNkhWNGmlUcS8EAD6xF34adqafdx4AqsBJinxs3cpsJi/PdMQGSYdmGcTE8Q?=
 =?us-ascii?Q?POuq7jP2IUlam1YsK8u8M9aIigOxebk4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dihHZ5csNpInSbRhbnLfCGiQaLWHAFOVTgMjIa3MDnk8Zem4gvDYLcRk2sLR?=
 =?us-ascii?Q?eItAMXEf3OKzHaOs4zzSiT1PL5FfFw9zXmBTgApgX3AmgRZnW1vnfH+Qj/Ev?=
 =?us-ascii?Q?LmJAk9VHu3yOzPHe2eMRAJ8PFf05nnzYm99iZIeq63PkxeSo/xgGnzijP1zF?=
 =?us-ascii?Q?WO67hUcrGjPZEtvY86VgBqt8Q9SdzWGAJJGWEDOla+bCBJy4dKQvGYbKh/hM?=
 =?us-ascii?Q?UcMBW5jQGM23boz6hm34YbCryfaCPLzl+jsf+zSa/xav0p851+7i1Kvc6QTs?=
 =?us-ascii?Q?/mBlxCLvtbVrjxUVXLekqOKgGN0t4nTSnts8Z2S8MiTyvI+q9DCWcVZmj0CT?=
 =?us-ascii?Q?ZPGEFrXLQXqZpU1Tz7WWKB+0igX1JA7pbswt5NmSyrr02zT3qt3VFKm7vUQH?=
 =?us-ascii?Q?g1nyuB9mB0m3Bua2WC1FlQF7548L6KJWJmA9tl+clF2xO87JjYbZ2AR/MFPh?=
 =?us-ascii?Q?1rvrawS3d92T9ShwCeyMsqSrQhdPfiFoXRlmQobrbsl3kJwnXhT+ywtI5YBr?=
 =?us-ascii?Q?g+6U0kIuZUJeNT4a7EJXgzbBFd3DZDhww+/0PVe4ja3mjVxEpOJ214TSwljd?=
 =?us-ascii?Q?7TK09XajJMoTYqHw6unJKcmPMLJQUVyOs72vw7vP7plAGrc8uO3l0roND/DQ?=
 =?us-ascii?Q?kWrjFdNAwId5D8/gEYrbZAooaG0jWPgHxurnGBI7+xPIF1EBegeSOpNjw4qO?=
 =?us-ascii?Q?XBxe9ea+zjYGjn31Vr0Vh3T26+rtLep3n6qL4JYxN7wOxCVb9GeL5jPNl7k+?=
 =?us-ascii?Q?fIgTOUqgW3aHfITg9XJWC/1tm3JAguVuHoKft4pn119ZuwvqkZHn0mh8Ebas?=
 =?us-ascii?Q?ITtMmYgufviV5H3UKp9Nbg1PQnl4JyTFf/QHn+nYpqbZ0IgYnT2y4U9fryaz?=
 =?us-ascii?Q?oGF0bRJYpp6B1bjkrwP0brCf5T5Ra8H5rsAhs3K8q5uwCNOp12j53xQ0qCV/?=
 =?us-ascii?Q?JOmjKuOjBSyg/oZKphtkyiw2S9ZawukEW7opreAGk4nrwH97WeBuZvzxn8zS?=
 =?us-ascii?Q?GZt41obQFwfxntyPIIgqfG+VlX0Zt10j3kpnFdDkKl0sGGlUghX+SjsXZA8d?=
 =?us-ascii?Q?0U+XMsP5PdNDm+i8K1fpo+jlndsKUi1PRJjFdsN/KwEWw0PdIV28sKwu7Eo6?=
 =?us-ascii?Q?gwLegKkYX156wsnkHqEVYq7F5/n1+LNRqdyRsHXs3QmKvI7CGznJ+Dnbzjcb?=
 =?us-ascii?Q?hrm/VGF2WxBii80RlirzEySe42r2EdSQMZ3jrxjGuliaeMSOpgrQvBLzfB6P?=
 =?us-ascii?Q?OCPFCgTnTfRmRkYiN4cw++kq+9hanDDORWdmBpYeaieOohSG7SZyk4TQls2k?=
 =?us-ascii?Q?SaOdcR356fDyDP9fvuOot/xPRhZhrWiP8fhxlrOyovZUWwYIsLdBUmb2YRqG?=
 =?us-ascii?Q?cjtzYevtcHacRJK9DhjBpxrTt+NGZlbNlbmkq7R9LSqpKmEaU7vDTyS6KlRV?=
 =?us-ascii?Q?0WisFcDcMFuOoqfOQHahPofrUcFpS80bJYQqQUPYsNCSZkZ5JYRSj2Tj1aRa?=
 =?us-ascii?Q?A7xm//A9GVbwp9/xEJ3OhBwifW7eO38NgAkH5x82dyN6Yna0FlOgc68Wa/BU?=
 =?us-ascii?Q?R3Vp7GUmoQ2TGif96Ogq0iJn6Xnk13eIBDBE+14q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 026800bc-c637-4fdd-f86c-08dd5585dd57
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 10:19:19.2478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CtIAGx3WUSseDJsNPaPfSTxTdsXiMWnkYuaYEDH0jiME8+Bg1VFdNOojhfpCzZrkOsU1JukljZD2rKS2w8ZhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9504
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_021922_999146_C36619F9 
X-CRM114-Status: GOOD (  11.07  )
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

Add resets property to dsp node in order to be able to control the dsp
run/stall bit from audio block control.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..780245d4ce61 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/imx8mp-clock.h>
 #include <dt-bindings/power/imx8mp-power.h>
 #include <dt-bindings/reset/imx8mp-reset.h>
+#include <dt-bindings/reset/imx8mp-reset-audiomix.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interconnect/fsl,imx8mp.h>
@@ -2421,6 +2422,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP>;
 			status = "disabled";
 		};
 	};
-- 
2.43.0


