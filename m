Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A89C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Awgl5G9Y68ZJ2RLQ1AjEN37aeyuPIriVPakCRj/svwI=; b=Y4HsPBi+giW20O6fNu9eblP9zZ
	QCX3zoqT5gl+hZDblomIvV7XD0XOy6MDGeA7LBuI329Iv9QmQG7aVFqDF4V6UBRFZyQcgzPTd6Ny0
	Omb1Q7jCtyqQhHllq7bQpR/owJ3Pg3y3TvJbZ7TlNrZCcvlqOYKslATLdvKgPgmVuXelaFzo3mkEQ
	jvbGKhcaowg5mzxoPhy0JV+QXTgaBbI2ZHpm7Qr9Ih51dsoFKYuMhNDGMgppZjFNhsLge+o/VRnYN
	zWYtCJbHvragG56Ho8gaBZbCYkAJX4dZ2bnL6XubC8tS5j7t6QP1DLqJ/248HjSnIDy1g6h4P9PXQ
	BveT/WjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtFV-0000000H3Ym-0aX9;
	Tue, 25 Feb 2025 11:37:17 +0000
Received: from mail-dbaeur03on20626.outbound.protection.outlook.com ([2a01:111:f403:260d::626] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tms21-0000000GnKY-08wd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:19:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJPnoBRFxn8gBvo6Gxx++6YWkw6gFzMpXEnRHXYLQb3AUf2I81wMQ30by9+pIkK4oVS/mbL1du9tGb0mLH+i3HfwklSAIMU2OCCVskMhJ+V9LPTPyxS/VLSXH7AwRit/jJ8RQkxzvrmaUtj12jnGddASncsTMjRYdsa1coiHFEwLdADRPRDmj5HEXwka7xJ5JDQk8xw+SE54ON2wEuDfVkvBQO515kZp0amOyTYJ/5NUYhQkZhNXWwfa/tmhSeuNMsApEvEKKfB69HQ9Vzaqcn+wTh/0tmFCsCD1P+527W+BXXE2kjRECmM6JHa7oXo1i0MsmnT2eisWESk9IV+6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Awgl5G9Y68ZJ2RLQ1AjEN37aeyuPIriVPakCRj/svwI=;
 b=aGiSro0OqYCtJ5XknFfUi5gZ3lHmP3aV6gRJ74rg909VMdUADKiBsoRDCjP/FwQZCbcT2U+Z28BQVp/9s5y4VhwZxG17hBhG+kiY57ugUZQD6DhQP3TiXoSwU/Niz5LFr3eq3Z3p/8ol0q68c3EvNcFiqevI+hNmBCybJykW+pSJzLJ+MM7K0TM8+nLiwvoQjGDkvajOe/WyMUGDERHxBLcbcUkOsyStFsYi/aRDaiRSddwZL9x3UahAiHxDDtB02iSyCYYBzW2AMa1HNBbIzz5U0622R/XJh5Z9NoujvKcBUYE+6H0lSE+AYDJthzZRSa4y8T/YEpm3a0F6I1lEBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Awgl5G9Y68ZJ2RLQ1AjEN37aeyuPIriVPakCRj/svwI=;
 b=ghokOW+2sdYFCKoEZb7g4k/eQdtf3s6Wq8WG2MwsffOeq1NNVMO/WLI16S5zRRNneKvP0wAUkq+s9E7zySx8E5khdWhFpYfwX0XhvpLR9PDi8mx8vTKDXzNc9dkAhRS1eGN7ViWkG2reymSn8AzBmuCwrY6su6CzGEx0xzCIFCr5E2SLeYVsEQ0GWRhWQFw0FBFCLYrNkcLsjASZZZpCfDmFZoYwCdkp4f+6PIo+Fo5k4MH18Kq3PwZXOjpUbtrHDAJXMbzFMyjy+6/V2yhEMwAVJoBwRCyRpzWpgeIFblswqnVkPe1pzFFdnWdjiRVw4aX5p8f49/aZ/RkyC+dplg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DU0PR04MB9393.eurprd04.prod.outlook.com (2603:10a6:10:358::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 10:19:13 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:19:13 +0000
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
Subject: [PATCH v3 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
Date: Tue, 25 Feb 2025 12:19:59 +0200
Message-ID: <20250225102005.408773-3-daniel.baluta@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DU0PR04MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: 3095c9aa-278a-4a83-9c9b-08dd5585d9ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bFn3dBraNPUP5iaNyrFfr9NGexZ/BBCsoFAD+JSQuJZEdZGAgVP9MB2U+763?=
 =?us-ascii?Q?gGDTlSqmBiOzKCHyuBwcgp0zh8k/m3bG3N/0H6L5c/uQ0ldoHbYD2RRRWPrb?=
 =?us-ascii?Q?XDs8LT/ExyPmM9bcQO7hq4EBqYKXidHeMXESR3S8KTKIGR7ed61QtQMD3pcW?=
 =?us-ascii?Q?oVzBuB/Xpq0GcInmgd9zc9a8nAGAbs3r7crXucaPNO1qIHhe2ifciT5boTIL?=
 =?us-ascii?Q?JeLMmnlnNhB0afmNaSgSanjT6dAv0B4rfkP5He0sUrGJDLvaf9lk8gU1AXkV?=
 =?us-ascii?Q?sxlfVZqtQtOuXTcCaSCU5ERU311ftBhITzrjRgVaye+zZdOemMx+Anqx432D?=
 =?us-ascii?Q?Gz1YDGUPhzjMQeCWuXDne0JpczaZ+1eaQFM0JpO5K5xKW/MQJHaJYcWaJAOZ?=
 =?us-ascii?Q?SYubegMwB/oCHC5PWuWXfsRwLWmUFo2SfDOImKYRmwoq6UFNnS/1vhPAkvq6?=
 =?us-ascii?Q?2aximA4shX1/sXOiOVeaMBwvG53kAMtZfJiVBoWOEunwUc8fJy72MImf5PAJ?=
 =?us-ascii?Q?sTSll0sGTkrQE216/byYWGqdEWnyWP/Xs7D6QVv32j3AXqfhMSdz69HV9u6F?=
 =?us-ascii?Q?lVWI2Sj680+ma1XYhLUPUyU35JbDo84Qbc52AHVaimw5kdnU1zN2B7cvfF2x?=
 =?us-ascii?Q?fCnqqSr+4NA7ZsJoM6dbg/E0pobBdxs9NWpurXL8Egz9sgItWxOGt/FE+vAe?=
 =?us-ascii?Q?koZN0Xh/7Tb6jZ3NwUtC/7im4HbVfkk+Y23LOgc5ivXu/WLvBrZ0rjYcHs2v?=
 =?us-ascii?Q?9cNU0MYMPn+Pww0RhKoe9A0MHo5Ecj8l61xoUTEE9twvOO1aQOtcgZYdrbh6?=
 =?us-ascii?Q?RyhA90yBL7DW85Zg+xyRjUAi66bb19KAFEH9Xdys8/Q+DVKTclVm1PidYxv4?=
 =?us-ascii?Q?eHJIE9/Co6usZDxF4av3/f/9hEP1KOprLQ2KeAqqVlI54uPppPU+SUHcO5k3?=
 =?us-ascii?Q?NcCFpEH4lfN9o8/TvUQpWohZVwyZMa3p7nZbUBCAuuMbwncvYGHuZwoC3RwY?=
 =?us-ascii?Q?c4V71xpuRry2G2xyM7N00nVlgU4GvIyJS4zYnUDaGzjT8SAFcr1SgHrM//Xq?=
 =?us-ascii?Q?FhyoVPb3pIwAd0/nq6lggYNMrUhxjy3TsgUK51ygtinLr3GkEiatpsgjcMJX?=
 =?us-ascii?Q?0R7C6tZguM4iGIDa3CrzmqB8QZIIAQDFUcoXdBMps6AEGIHBejo05Mrnj64Q?=
 =?us-ascii?Q?LZqIwQCF1zbKuFHrSn5sHBU/371fEtFYOKpcipOdivCsdxvOVHH6fsrEg5gd?=
 =?us-ascii?Q?biXa7GwGl/TbPNhmKukk0XHJZWBApQlZyInAXx2mZiupmQdZWR1l90uvIlbx?=
 =?us-ascii?Q?czVf6wFkUWp9qXL+tGJWIfEE2lqJ+lPqfbbz4uF6pi37tgBiLRPpuDbzzf1e?=
 =?us-ascii?Q?Z+BgSKnBunNhPQ78V5hnJM6kLI9dklkIf752a8RyqVIsv1H0mzbD3PG8J6Jh?=
 =?us-ascii?Q?rf8FD8unQFuKr3Fq1GV70X0Xe/3WRs70?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s0BhClkwCryXg9e6SBbQKoFdhEdVhlOHHVqbGQtt0/Y1DX78pPFDfbdihK67?=
 =?us-ascii?Q?lrvhDal2vuy8q7FdbInSAQtTvzcFBagLJFvc7Pg8sXoz8/nT4Cvt94o00P2a?=
 =?us-ascii?Q?fZ1VsS0sOqCNMm6NMlWFLt2ryN7g9K2NapcibyGAF8ZpfYI/qaNYJRQ030eh?=
 =?us-ascii?Q?h0t+XZg73da/mBboLJrfqU2YmVP1KioNfMg+8kw7e2ifpv5YKgKkkpxIJ6ye?=
 =?us-ascii?Q?QF0d4CIU9JdjAbvE+w6b65EQg5ARdXhbc9vlRKYcMRq+AxcusiJYnL/fAvJq?=
 =?us-ascii?Q?5+zgHcljVnRb40IvayfviwtBHKU1cJy/tKCpDphkHgqkBFXIuWBgSTzFDmOm?=
 =?us-ascii?Q?qEDvS53S1sm3HYHzvur3INyP8w4sqmz7roAe5wtsgHhqap9d7fvEb4nBKEY4?=
 =?us-ascii?Q?VQxIFRDThouHGJc8fJ+4ndc8Rh1Zbm/ejTW322oc6OI9LIkmLodOMBr+HWwL?=
 =?us-ascii?Q?5DD5GrC1ZMPn9LD4EfqIFgkOAcyfD19xTMB86V/MXkVCKCvZDS7cKHoZ+rYr?=
 =?us-ascii?Q?JKgEu/rrNHlHW2oopdx6bTq1QUsKB/Msg+Lt6rkli3uEqCmVf1EZZFbVBCeh?=
 =?us-ascii?Q?gKRbamhrbSHS7SunAyy4w81WPu45o7sTZjJ6FFS7eAEbOwmcrm7NYEh+umN9?=
 =?us-ascii?Q?5OZhNQvnmbQS17j9zFVekx6TaGQrlP5nOOBSQaO+hXii0D2FieBEDG7gDMUO?=
 =?us-ascii?Q?pNiF3Yj/tys9e49wJeqkzx93VpfCs4NH5QZcfeg226D6+VNfgPXwxJX5zLqK?=
 =?us-ascii?Q?pILN81H/WncnOFHNIV7NyIogLMGQKm6awgpV8kB3B0+PBfBexzDlupwIc3em?=
 =?us-ascii?Q?vUCokZEhmmlCKnrzSMQwb0OGdq6w7ZVLiQhyJbp1B4q+p5fgBfhJRqW29gRu?=
 =?us-ascii?Q?H6MeaHbIvQWOpAuwstdo+BUsEHTs5LPiMd1LP/pbf1ZB2AphvX4CSqLgrCKV?=
 =?us-ascii?Q?94/Ci2Ttt2si5GWwgA6Tjq4sheinAlAJddOd1BaoC+WerTytjePIvZLS4UXY?=
 =?us-ascii?Q?0CF1QgB+uGFdTGBt9jftlH4UKAC/C41Ay8l4svKJrxKPoGwQ60U1zd6HGOpY?=
 =?us-ascii?Q?P68GBexioOX7dVlCAhNsNvme3SZBPnAD2tomoYXPijhNnIRs+UjU6W7GLP2C?=
 =?us-ascii?Q?5AJLCx5FG/Ldx0B5utOfnnSbBBaqxSHT8yUeS6SBCHAhYKXoZqaTQwF0ya/e?=
 =?us-ascii?Q?hmrYlM7X4P7N+R7qxX5HI103iwIS+s4KHU1Zrr5NP0cOfU3yRUWGPMVyjpkJ?=
 =?us-ascii?Q?ccWe52vo/xXyYI6tYCkMgLhLRm1F6dMSS3q3qLSkYD0nDle8IZVD9vJRuExh?=
 =?us-ascii?Q?UT2TNtvwgcFeonyWbqU50QoYtDDtBGc1s9wXiYePJlr2Yb3zH9rcg/Q7pgQE?=
 =?us-ascii?Q?3+fQKE/8jS+ULtlIDq54yRMohoJmZjq0zxUU+/QLQFuorGlI21znmTM+JPti?=
 =?us-ascii?Q?14sLpHHpqMltmNt/Fs7saod/Nyg69UzM9mVJNvGfRkY9rppLGz8sROczGX/f?=
 =?us-ascii?Q?sR9LvPcZqAj2PA++L1LewRmkvoSzEJZDTvjl3XVxCt03wTsLRySf3Sv4xwF/?=
 =?us-ascii?Q?VHC5jmE7/zwG/RK3BgBdpsNr3MRJVaRAy2XRq2L8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3095c9aa-278a-4a83-9c9b-08dd5585d9ad
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 10:19:13.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nt2jnl8aI+LXUTsy7ge01oTsT8GUT+7JjgJ3xFI3mQXrLKA+mpMKvxI+8nmtGvpA4GhAsCYs8G1C3up9S46F0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9393
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_021917_075058_487167C4 
X-CRM114-Status: GOOD (  11.95  )
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

Assert and deassert functionality of the DSP found on i.MX8MP is
realized by combining control bits from two modules: Audio Block
Control and Debug Access Port.

Audio block control bits are used to for Run/Stall the DSP core
while the DAP bits are used for software reset the core.

The original plan was to use fsl,dsp-ctrl property and to refer the
audiomix bits via syscon interface. This proposal received NACK from
community we shouldn't abuse the syscon interface [1].

So remove fsl,dsp-ctrl property for i.MX8MP and use reset control
interface instead.

[1] https://patchwork.kernel.org/project/imx/patch/20250212085222.107102-6-daniel.baluta@nxp.com/

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/dsp/fsl,dsp.yaml         | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index ab93ffd3d2e5..b3550c9d12e7 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -82,6 +82,9 @@ properties:
     description:
       Phandle to syscon block which provide access for processor enablement
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -164,6 +167,16 @@ allOf:
             - const: txdb1
             - const: rxdb0
             - const: rxdb1
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8mp-dsp
+              - fsl,imx8mp-hifi4
+    then:
+      required:
+        - resets
 
 additionalProperties: false
 
@@ -186,6 +199,7 @@ examples:
     };
   - |
     #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
     dsp_reserved: dsp@92400000 {
       reg = <0x92400000 0x1000000>;
       no-map;
@@ -220,5 +234,5 @@ examples:
                <&mu2 3 0>;
       memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
                       <&dsp_vdev0vring1>, <&dsp_reserved>;
-      fsl,dsp-ctrl = <&audio_blk_ctrl>;
+      resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP>;
     };
-- 
2.43.0


