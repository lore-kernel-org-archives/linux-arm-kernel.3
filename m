Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D45C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74gBwZL7DF0M/TvABg8TfNFmZYHeI5B5QodgGa85ut8=; b=PpESoIe0wRiOTXgJ0FOOOjPjRj
	I6msGSGFw4+aSaQxMUtDVwRWhA8Br+qxN3zZTcGm10KiipbW6WJWSW1ndASI0lga+HDS6tQl40wMH
	dI7mwR7onQMDZVvv44RuWf8Dyoo8tdCTHWa6MyzsdmWDN2k4CnPtNfYK0InFAGJt9AuNjPBUtHUwW
	lZHcMhgriWTPlGV85qey/NIvxQWMXWYF3TYH3jnGXGxVwR3JMoCJfiMjTnxervBnQLyc7aswAuht5
	17YMxAaafoF+bwXihu9TVd4LsZNST24Z95B/IRrBYr1CR4IrDvC1Fo0PFw/blAuYj9lBOBHmeTKMl
	Ix8mwjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8Zu-00000006hL5-3WNO;
	Wed, 12 Feb 2025 08:58:42 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8TH-00000006g7s-3B7Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 08:51:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+grq+ygPxdTNE/4PhMkGYO4wTOTsQQeEkMLxBBMFOjv3MEWfx0m+/Ph0uMX4q/2CviVANbr1sIrDIOYb/l8vFG9Ps+34JrnQ5o6rTVrIB41kYmze/g2l34XfOc9i7gSDuXFwFwzRiIEh2PPzLdyIOUBpOkLhp5CuGxHUbIB4TDaFZ6irenDDIJZJt+RjD3pxVThMZBwY9IktwGvTZKcZC8q6iVs8x8qdJ6vQwFx+ARK9RXuRJM06xlRhAfCrdpI120MAfbcV8jK3KHiwvSnjF1jM7k6CWeE6gVlbZGYqDhNt2GThbBjBAqPp/FwYJbnCMNBVGwbtraVzFbsjv3lEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74gBwZL7DF0M/TvABg8TfNFmZYHeI5B5QodgGa85ut8=;
 b=hiMNEqxsSZNPvxqkayYBggT6AXVGOYfkWwdCc0iRjYTBnHRAgANW+b+EJ7JGqOH+yhcFOdmTXI7jp/jpDNXC72gD0St9ZDRNdqFPEybnIHPoE44Ka68CIKv4/OcapjnYY1yJGalWj05gwqam19ddqep+eYftge+UPftKD7vhTjTQnPEwvFGC/Cry5jFA9MR8fJpHxA0hYerwmS6WznYV38NeRU6BMTGMfzOQdLqtAWkODJfqwEau6G/ZF75g40ffF87zCtlPimLUA1WNeRs+E2KEj1gRJZWGkyw7q7QzshY0vyRUD7NxNqKj+QXbyqLVh05nikYFTjr+QCLwjbT0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74gBwZL7DF0M/TvABg8TfNFmZYHeI5B5QodgGa85ut8=;
 b=nFUOfvQaL1O3EkK3vVtbE6aS9kEQc2TS04PJyKvN+wdk2flgmGsr1DwCQDkKEHhGbdTTxy7DgLpKOAEN4L+WaGdkuaEry3izlET+OsaDs5DNCbwXt/rH4froxzS/6/HRzigRy+FjoP15qDu/zN6JGGGmq3im1ZaTnqFxEWZ2JXziQk90utz1FdncxytkGZwyBKbq0NsE9GpEnYH5KjkxFTgfX5qLOzakoarb7L5yTiFPJckXlSscIlbhH04pL4Ozcc/xjWRneCOc9zEoy4E+vFkMR69k9bdfOh5gUAvyxQILBGJGyFSaqJqpYMgKSEYeyALTNQuI6BwgG9jU54yOWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Wed, 12 Feb
 2025 08:51:47 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 08:51:47 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	robh@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	a.fatoum@pengutronix.de,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 4/6] dt-bindings: clock: imx8mp: Add syscon compatible
Date: Wed, 12 Feb 2025 10:52:20 +0200
Message-ID: <20250212085222.107102-5-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212085222.107102-1-daniel.baluta@nxp.com>
References: <20250212085222.107102-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0003.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::9) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS4PR04MB9576:EE_
X-MS-Office365-Filtering-Correlation-Id: a05a86ae-13f1-43f5-130c-08dd4b427b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D+P2V3efaF17c4GNQXFTxXl/7KT1WKGLQgQoNXYmhIZbLCqobrxAZ7aNy3yY?=
 =?us-ascii?Q?fKrFDaf66KBS5nZF8h50modwZHSN4Nqf93uynxULv16hQtItmbyGzS/CGgLx?=
 =?us-ascii?Q?sot+IcHMTBFJ5Q8evD5c9u6IESRBsWN0WzJrV8nPK8yuZ+pBS1jrL3T2aOtF?=
 =?us-ascii?Q?BsSZRXoCoQO8Cj+SkcsEiLSJOkgOiYo6dw1hPW7/UGikZC3gMB6a6nawEnQ+?=
 =?us-ascii?Q?1VtYuRskrKbznQIRar1Sgzpulm8EJakc7UxhfGDnrxVD8yH+e6G9VWvBP4Dl?=
 =?us-ascii?Q?oaNNTvDqxz4vqCu27oNeVC18AlRMeSMADtWNUqpODEdf74gPOtSDnVmimUp7?=
 =?us-ascii?Q?eIMvHzREFLDo/vf3/IfScj4PSyow7Pu+QjgIf9nUPmhmg0DHmAoxwG4Y98l8?=
 =?us-ascii?Q?9k/z1t6z53iwPXqiOWLcfxNVfaz6nAr+WFmsFnuRQA1OycPB64RSCZjFCYfp?=
 =?us-ascii?Q?51DxIKzsk5VToHjXuFGr0+IEHF7KlR8MMimC1YcoAWUfbvVKgaUVGUJKMNmq?=
 =?us-ascii?Q?62w4hYwfZP1+nv1dKkdGG/IZGX6nM23zAtbJzi+Gb6tmUL0EYnKepqhwAOhj?=
 =?us-ascii?Q?ecK+7GzJYIdioP1Ys4cSPzT7bjGi8a2YI3QD4idDRNDKyizRyzNhYXjtPmCS?=
 =?us-ascii?Q?mRmW9dvBZjukF7oWIwdtTZyNT1E4cufSaBH2RgU13bST+iCaa9uNi56hpVZC?=
 =?us-ascii?Q?MW2r4YQMrk7m3mzEdEI+oMQ1gYpuTDrChq9+6bS+tcPA1SHqY0noneswtg2T?=
 =?us-ascii?Q?p6r+zdGhId1CknB3wKTA5pbvf+Hl+4ffkCFPu9cK4kgJjQ1iAL4OQXep+WXP?=
 =?us-ascii?Q?cTZH7QQCdrmhRlb3FTeH5qy3C2J4xKkCkRZRV6ISmUB9NCqtIinM/pHmuyra?=
 =?us-ascii?Q?Ujp8tTMKmgPXczJFtzCBagrxd7Y3QSxoEkFLnbS4jeZBxAX1JrMswm7Bs4mQ?=
 =?us-ascii?Q?m444sZczk+rAQHRfeMCIy9nw8t4huse0JSQi/ZgpHnZlFzsEnH12ff9R3vM5?=
 =?us-ascii?Q?KNkJw9yzrQMxBJ/Cuh7pwRKR8qMGM/LIGAstgMlIaSob4V2/eab0TNDz4abm?=
 =?us-ascii?Q?CoAsyjQGL8ePaD9L9V00cWXhqt2CzQXCkH6+YDWIZdkNqg2C3hb1D4Rw46kE?=
 =?us-ascii?Q?K4itLdCiVioXh8AYJP0OpWNYjnP+bgBFxfY+PEUzBV0LTaELTSM1wmaEiW4R?=
 =?us-ascii?Q?DoNDKYJ2x7uisBOmKRUawnEnxcqxPu46JLDInyeetg1cc5eXu+I2NtyM2HbF?=
 =?us-ascii?Q?v+T09QbZB7TgJy9RK8ye0GAjlRjJ7ciCFrqSHK8+25osmCV1sD7wBorM4Ci0?=
 =?us-ascii?Q?c65fT6bIBwijLHQjtVv5l0581N1a1EUYsvhLEs5dX+w2JdPs8XscL7TVYRFU?=
 =?us-ascii?Q?3R4XMTQJnZ7VT9LlMn/xkURg6QKeD6kSV4RSaW5Am6HaN92v9JPriBqeIsYJ?=
 =?us-ascii?Q?/vQvKubQDGyBYseO3PUZlXC1FOMSO61b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iV/FwjxgqyQWGwSmrO2DhyUEr/H3W4m9IG/Bs7eEArMHMDjgxZDVtAvmVaKk?=
 =?us-ascii?Q?17hH6H090iNK6HDxjx/dFc1qK3rg7Wc0U5zExyj3sX42giDKiaAPjHYxrS5+?=
 =?us-ascii?Q?5lPbOSoSt+nZfD7yYtU5aHO/NS63Xv5V6CYZtEV3AtBACQ3r1jnZ2HxzhG9G?=
 =?us-ascii?Q?QX1RPnrfW3Trr1E06Cybbd0XRorQeWQoeWaiqAw1vklnQhRQdmnpWlhlGL7O?=
 =?us-ascii?Q?9Tiv5ta4Zf3fORTt9LUT9+HK4gHIoS7Bnv49J8Se0ejp2ournkG+ZXF5JJlp?=
 =?us-ascii?Q?8qIYoDpUJfnSzsK63wr2zl9eiEeSfOK2Wq5DG2BPrQUHrZUYs5K1kVIjvH8Q?=
 =?us-ascii?Q?4iRXELY0CkxoM+k0lnzMRf6eVPjYQHh7BsE36rWbrx7d2o2uU+DxZ7fA0w7N?=
 =?us-ascii?Q?5wdxRx74RROERRx4kBjdccrcd4Ebu82cRCMDC+m0sEyymLAq+96OpOYYaqtB?=
 =?us-ascii?Q?J5nHMjTjZm+u4Em5zZ5AQWHRD9u02qsuK26At4+Ysb9dtC9dGnoW44scdnXJ?=
 =?us-ascii?Q?qJdHQ+cMsdi4SaeLDyPOGmMRm4BaNj7dRf15PMKgTpT5ZX6DMHvq00sXno1c?=
 =?us-ascii?Q?BBm1we1WipQBnJJUWL5QJanUCYbBM84rE6YwqUpbHVLQbxflUQS8gcVZDM6X?=
 =?us-ascii?Q?D+1Id4DniupxXFNvF+0YFsB3mvd2WSUzotVfoLHiQYKW8BK8UqEv0MaI6iVj?=
 =?us-ascii?Q?MAQy4BIvifujN9nSatmwiRpw/fmxoVfGXmYS+eAJmeiSWKIGic49m7Gq2PrF?=
 =?us-ascii?Q?ElSzzbD6+LEzGGZNtYFKVn5SXoF6JpGtYecxg+uHMLsi8bHuF8CGAK/ez2zv?=
 =?us-ascii?Q?IEet5YjBv3s9Imw6Avb2zeBbzglCXYOL/LoBIu0ShXBs8mr/NRZKYihpZo6G?=
 =?us-ascii?Q?2SUOExz9PixMtHiNx4vJra3QOvR6iqqVpeoA91aRBlSBqUSwplkba++t4J0F?=
 =?us-ascii?Q?vNRes9Ip/4BMLcY1bpLHZrfP0CT5DPPY3/KmJgH69jV5uJ2J0KrncOS3CDdN?=
 =?us-ascii?Q?bpDmXmAXRLxl/HJsensXdh1L/Vt8Tpnl/SMDqsoFdBoBEuorMUJuVQVALjAH?=
 =?us-ascii?Q?cEZqAP4SfEpPqApAReYuN73+SXUmccAvbe8W/KwxWLByMgI+A8IX24KL9OJa?=
 =?us-ascii?Q?/lSe2OYmlvFjmn3SOVInOIDpZzmkhEvyz0ExRe6S1a4KjPtWWp6sWqOculej?=
 =?us-ascii?Q?fX/gSwjZxKJ+nl1xxkmsswNdMI5Oxo73gXIXVP+IuOJJKRrBfIWO5hyirVsT?=
 =?us-ascii?Q?3UXI+Z5rcUniUSYGaWkKaeCggfpw+D5obOBSsMrqMXBne6no+VPMKmMMlsu0?=
 =?us-ascii?Q?24mLVEh+U5hz8c22DzJYv7Pkw5Fs55i5PQ3GhEumm1cuqyr/LsHSTKLCYDLf?=
 =?us-ascii?Q?QeuK3Y0QacaEZK2E53aU/WFPFudk0QpB3taAPMqZqFmlx+FYKPl+Eqv76U1W?=
 =?us-ascii?Q?yWcfLqaps9DC3IEMQRqlmOC5eeCOP0hFs37I/zDlOWBLTHvl3JUsqhcVMdKF?=
 =?us-ascii?Q?s2LIt0Vy7PBw9L1AuMYfxcIXQq5aAabYruVvexE4P41kW2q0DpTtjFDaN/1P?=
 =?us-ascii?Q?2OjXcyNOhpxBeHtYCJwGYRdQyw+mLt3BospA08Wy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a05a86ae-13f1-43f5-130c-08dd4b427b6b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 08:51:47.0347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjPk1nrltEKWLaX1QhTXj3bSBoAEQQi0goHWRoC44ncObIXj7heZ6VhiQhy1q7bt9s8kIKtWM8+EDgpyYWilSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_005151_794918_14160D19 
X-CRM114-Status: GOOD (  10.48  )
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

imx8mp audiomix contains a set of registers used to control
the DSP.

The dsp will use this to acquire o reference to audiomix registers
and handle the registers to control the dsp.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 .../devicetree/bindings/clock/imx8mp-audiomix.yaml          | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
index 6588a17a7d9a..0f870aaadba2 100644
--- a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
@@ -15,7 +15,9 @@ description: |
 
 properties:
   compatible:
-    const: fsl,imx8mp-audio-blk-ctrl
+    items:
+      - const: fsl,imx8mp-audio-blk-ctrl
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -63,7 +65,7 @@ examples:
     #include <dt-bindings/clock/imx8mp-clock.h>
 
     clock-controller@30e20000 {
-        compatible = "fsl,imx8mp-audio-blk-ctrl";
+        compatible = "fsl,imx8mp-audio-blk-ctrl", "syscon";
         reg = <0x30e20000 0x10000>;
         #clock-cells = <1>;
         clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
-- 
2.43.0


