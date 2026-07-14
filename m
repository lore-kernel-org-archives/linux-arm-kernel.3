Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96837C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 04:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bwYEe8/KGY9w9pZyLZR6AQSRRzH/RHhktSLiiUMlFGU=; b=FzHJF/AHGIc8CIzRnI+nNQS1KH
	JdjfQlepIbzmqiXOWBefpfdPBFffp9QrMB6lODbhlNCEU+u/PeosgPhxgM4q6/4HJTQEZj0OqYQbb
	fbVgY1YMfhUNaRy8Ho0UK6UZ3m2fxopLWCSDvoWxVpi55WxeQPsVbnz/sGwZ8N4JtbLxJZHaOwjCM
	WkhPXc5U+g3CjHyotVV98gMqMdFlX2ckqN+92JZCUaRjA0lTash6Da8I7Hrq9sxSnArwAHTOLAsGW
	hEVO0mcRlUko0j8GV6O35GrNl6VeW5/92606eC7479mzuLcfz4fgJOEtSEAwiccVuCfxBWvEW+HT9
	RmHIeyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjULJ-0000000AqY9-3YH0;
	Tue, 14 Jul 2026 04:02:01 +0000
Received: from mail-norwayeastazon11013071.outbound.protection.outlook.com ([40.107.159.71] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjULH-0000000AqXg-0Oo8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 04:02:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVeROVWzHx1NkqlRMaXn9XFS17+/ltPMQrtvql7V++A3L0Tnlex3nBkEyFAHcMT9XD7YFufi1S0uSjzoR6mueVDMwK4qYI473zSE6pZhB+pE8plaf0Vp9EZDcHRr+bxU5ik2h/+sb4l9YV9hMZvEl7V9upAyL1RDnyV8zqux3tfTpnro5t/d/yn3+aCFjO4etepTBXRoDPGre2GKb6WcGrDXBeM6GIqf/GGF1yYHARcM/jOjIgtP6rE2tdNgF2fUvqDbpT/432x0HfBj2O9XYBjD1XhApDx+juRqxs5yyRiBIUdH7BMsWEzqjn8Gy84gxvQ2bSXZkBcIgMQSq0Yldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwYEe8/KGY9w9pZyLZR6AQSRRzH/RHhktSLiiUMlFGU=;
 b=Qc81L1kCmyaK/B3cL641AsS3x/Jiph4oUWDVoCuB3k1QJrBBdCgwBkTOVCChX4n1wwBBhwlvuWd0PJ8G/NyA+wn4+S6CQ7MzTdny1h3+9osXEw+A5p/7xMzopMQLXvXz1aU/ZbmG+qGUdvdfZZayeXepfqkUO7agmLAInCVqOpiCYwsmgQaH5JkLrdFaC9iaEsCCnHHug25Q0uhLrVaz81zu1K4L7EEKwnECRZepVW+kqkEIJOedP5zvFeuVmlkbyUVDMzPmV5bemsImT3LQAFcRdO4tjk1C+cEBR9BUoMAkwBYI9qxcXgCkku85bL2RYHcCwpn3oD/0k1Kntd3eEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwYEe8/KGY9w9pZyLZR6AQSRRzH/RHhktSLiiUMlFGU=;
 b=wzvNSdRmA+8BzpC+HAodjb3oOM5JGP/1yg5N3rpWjrpMzpAk4VHS+RcUhbGJNqRN+h4+BD2Og904GSd054rmqfBmOZkmIjK0pcfIIerXyh7OQ3BqREo1XHAph1mDlSm0H7MMC1fV/SAMC7BJrVHMZbFb7UJTrJd+Jv7U4ecP+RnvYX7Y9dqbOKyXoSJZObGvUjhxeGXTdWWmxQ/ZR7XdZiJxFWa4OUrflURdnvro1bMtKpCloAF0LSddU3I9HOHQlkND5j+sUrk9tDydkE789B76v6bIkZf83IRVMa1D3Cx0rLOah2FpymD7ifzkfFTiaBrM+JWrWrgBwXIx6pChnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8083.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::15)
 by DB9PR04MB8090.eurprd04.prod.outlook.com (2603:10a6:10:240::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 04:01:51 +0000
Received: from AM9PR04MB8083.eurprd04.prod.outlook.com
 ([fe80::44f5:bd7a:e05b:9a41]) by AM9PR04MB8083.eurprd04.prod.outlook.com
 ([fe80::44f5:bd7a:e05b:9a41%6]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 04:01:51 +0000
From: hongxing.zhu@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1] arm64: dts: imx943-evk: Remove 'supports-clkreq' from PCIe1
Date: Tue, 14 Jul 2026 12:05:18 +0800
Message-Id: <20260714040518.241871-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0290.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::15) To AM9PR04MB8083.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8083:EE_|DB9PR04MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: e1618e84-37c0-4729-feab-08dee15ca28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|7416014|376014|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: co4eYap/7YSKH/pefjxzY3x8lYS1FU/qbwZqr4vw+PEspFcXi6tefaZa5KSNToANF1IWQ5eChjiJDHGodWKNEGUzR/tl7K2FGXfNVWwF7oexxRSIx3rTkljHjF0TiUJMzVsr0O0qiNSSctFo2RPj7T5S9i5K2VlumzXsXkLOicK+Gu6RBTn3BK31nxTbIpBBYEKW6smDEB3Z14rTWkMQXaWAs2bT/25omH/OdF+Yqg3euHmc8EfKiJE1HevsGRigjUsr91FnGYTnShhPWzNSNWasNPFzZ0NtEZ/lCzNO/HiWdF+DlzOApzdBKQCybQ/Mrw6QCt8q4N2iC5A7dbWqgJ2swis0EmFnGssOal/hZfg/8knCUwxDoc6APxXmD6OCjmpgia7EJVXR5nAH5K+UHLy3WNP8LxiD1/tW1yRBSZb0XvtwYJ1JEJjIQzdvDJElsnwDxNUlN2obmRiEF1AGvtp2Sb8qjR27yrQgGLlLrE4odISJzq084hCz293rjfzGdtvNS+C1S/uFVlbemamDTojrfUmPkfY1kekZadc7bnyaaCbL9+mRI25LZUhzo2+T+XEvOg++VromicZWQsEUMq3atmfLPYG14iuFi7wUCBdUq3kOfORA8Cd3227gkHJMswS30du97hhB3txGh2phBqhw0NLXZ5hi429wXRqkIC0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8083.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(7416014)(376014)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rxv70hVjWHsTYnlzbp1/8zhAFEM74Xbp7DjIcNiId8hRfPfTU72iRLEfzRsa?=
 =?us-ascii?Q?+j3giErAHqwG7FoShKMqDIbtsTpgrYLROhdS6bHFgOw6uQOpTjz2+OwxoaXg?=
 =?us-ascii?Q?ba2Qo1yjoiP9TKG3Va0U7r0afUQsmXGO4Al54Od9KY9/fWwKuyHBpnZO7chV?=
 =?us-ascii?Q?zabk2MoX9QWjegGmGhE2PAEIOcbZMNrzRiGzr59iGoUFwXiODkVi72tIcw4K?=
 =?us-ascii?Q?r8Ky2ZxqYpqyErIdy2suHIBoYBf0aL/a3EGn4zEInFDj/e18Fr+XMkR4dFvh?=
 =?us-ascii?Q?18JqYBXTYBWBCp68K5Twa9SjzgIy/mzE61PTMljPUbGgK38n3goBjXs3fxRq?=
 =?us-ascii?Q?3jNEzoVF/ETTRbMzPVAbUWr0gs+qlFFAnm8hmfNf+9DhQdKKpRXIM/nxHeV7?=
 =?us-ascii?Q?SWBK+tLnxKgByXHnE1QVBf79MO1qvaJzVSsQCYgymcS7iUwndre4rNX2fDM9?=
 =?us-ascii?Q?9zBuDklo9Ej1E4YY+hmgHdfcAOGYKPCXiZtsSoRs59/DmtFxfh9pldVALKaV?=
 =?us-ascii?Q?rjiBmHxe779ZjxhZORYuwYeImqFxphg2bvP0clI5PeioZmxZfW33Z1qKtxhI?=
 =?us-ascii?Q?7O0nq3ldEkqqhpUgvOwbj2JXvsTMO+RWuyAQcdq125ErpriHLaIoT8/vCuYc?=
 =?us-ascii?Q?6JgQ36vQd0C9Roo8oFuEYZ5IOnDPM8jGKuMFsc2PMn+DnM+QIcxQmk37yT6r?=
 =?us-ascii?Q?lE4rvoQlZVhAUrUPcoMEvo4UDlwWDOG2ogbGzM3eNY+xqsAwOLmc0Ki2Wo+h?=
 =?us-ascii?Q?bg239SKwvr3RCcbRYU+EMbSn6kmgxi6YFKx4MpARiwDfA5JTUVKJmOzslM4P?=
 =?us-ascii?Q?9951P9syZMRsh0QbpfrnMaeA20km00D1dYrsYYfbWRdFmYXbfPF0hB1+alY9?=
 =?us-ascii?Q?dXGmekNLkAmX16BIg5Nqrz8V/2a5KA6/YdVmuvNbMFUgnsGSo9hf4AUlFSul?=
 =?us-ascii?Q?yo7rquJsifc2r+dnmIQzfIWUrzVUhyeOjYauFl0N2Qvyv1XYh+1BGJ+WNVHp?=
 =?us-ascii?Q?ubBUqgvJhbQeOrJOnX9Y1Qe1vHRsCOpmA1gZhG2BIUtWTTf/3JfVBckZTDFE?=
 =?us-ascii?Q?vhKPoV9OOnC1fDkhXJZHJEPgjoHadLHboWQcwA0u6ufVQ9rnOOnoU+boRSwi?=
 =?us-ascii?Q?dDJTOrh3X8wkw+6to4aS0qHWmdfO2R3t+62n8DJI7bI2Y+tWSmDBL3KA9FEl?=
 =?us-ascii?Q?Q3W57az+GD2QDP7BALfjpTzInI2qW3GkAMi5OugeDTdPC2VNKKcrDkshzIJC?=
 =?us-ascii?Q?BJEcGMWibLRdmVplQQyhjqG3Saeztg9LtKTf+ZXaJT4V5chYEP6R5D4QcCQz?=
 =?us-ascii?Q?vtp/eBDuLBjklhaSdM3GrKj4TVSqpp2ocxT55Y1dyptRRHwaLCI4rwFok5ou?=
 =?us-ascii?Q?45/NQZU+liKzFVGwRxZs6ndvtXnwYE9UBeXtVDblN2XOF7hDEzGMp4/H1+iW?=
 =?us-ascii?Q?HaJfGC6dN9NNuNYock17NrSqhYGvJkTgWOKd6amANB+4advc9mR1qfr4a3kJ?=
 =?us-ascii?Q?xAKKuQ+HEVkkodtzDa82Xv/4pg2hy2oA2KcTLkLwGBzqvIzD03gz5c/ww2Ko?=
 =?us-ascii?Q?qS9ZAcS87Fow2Xo7n2rbRPH5G3MPUkDy0SX+Cyu/3pBXnHDNI0DIHxGUEOnD?=
 =?us-ascii?Q?vDZuBJYAf2xAUgiJppcitui/pj6234BifkAqHNpK0lT68Gx39fY7kH1zre6L?=
 =?us-ascii?Q?bSYrtcfTozyBzXKhVt1/lPPRSAFYlSkOId/d6wVVT9307+9c/MwLJ0iFujEp?=
 =?us-ascii?Q?I7rUUA7q4Jg87gEhEdZJcOH/TR+D5dnd+OXrGxUbJvMwunQTgx4X?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1618e84-37c0-4729-feab-08dee15ca28c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8083.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 04:01:51.5128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnL8OKwQFdbodQrkVPkTZW3em/4bc3KrC5N4JnM3Q9AGwyaWmFO1Rxoq5ROqu8mMoT5EKoS+3dLJ6+p/DbrgEIjVfr7uHjaPM6BdHSIR4mpmnEz5D46ac+uky3yW2JXW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_210159_166169_8FEDA097 
X-CRM114-Status: UNSURE (   8.78  )
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

From: Richard Zhu <hongxing.zhu@nxp.com>

Remove the 'supports-clkreq' property from PCIe1 as the standard PCIe
slot on i.MX943 EVK may not have CLKREQ# signal wired, causing
compatibility issues with some PCIe cards.

Fixes: 9a8f11f6f786 ("arm64: dts: imx943-evk: Add pcie[0,1] and pcie-ep[0,1] support")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 674410e541cba..49fb1744d992c 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -1061,7 +1061,6 @@ &pcie1 {
 		 <&pcie_ref_clk>;
 	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
 		      "ref", "extref";
-	supports-clkreq;
 	status = "okay";
 };
 
-- 
2.34.1


