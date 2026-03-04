Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F7BEFCE4B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 21:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RC93O/9B2LylJvMbACxtTRweB3sixPckboUTpa+OTAc=; b=qYFxMAFfg+44K6pEZfbWXJWDcR
	YvSq+kjG9xwnxym2nDxbHm9TzykODx0Q9ORm39OYdziGizwKmg/iznqHVrOqV1JGN1k+tzVR5Q/Jb
	XZNitKFj4b4al8h8cRsUeXivgSHJ0zkkwPmVjhBTHrsyLhUB2CVYjF9taBu0b+d7cgsJY0mKKRBqi
	99AsF6h21G+ENqgQVow0YhW5IhTOvCF4VUz4tWUTwb6mpKVSHaFzBDUWaNyr2BvWCAcWHvNmG8MJb
	3UCDg4+tXdDmCKjY7VJB52b9q+rR2ZFe+Lc2swPVbkOpY+yMavrFtm6XLPKVghMoDwY/BwzupKnRQ
	ARrpx2xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxtcj-00000000VNd-1hGB;
	Wed, 04 Mar 2026 21:19:17 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxtcg-00000000VJ1-2qCm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 21:19:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYXF1dMPtaDz37X6BxaY+UDoA36ZKyGNpkJkRXRNemkuXMjyZ0Wy+gOkZcFXX7SGwEvqMVeRnTZJ7yU/6UOziwuzRIpzs/BbD2CYh8+qvFQx57JEN3D0DrchYTWC2qr/QKd/BVCYGyEAWPxIi2pGnJ7RKxACuRGc/4D3arEnrfq3YfBiGaWxoocvvCtjjUpAXAXbeTo0QAfodLcWF5m3JXKGCU5rYgX8pGxnvrHMR6unNoKKAlTL7BUrFjVSBdAC3BEuhkv0HzYRZ163ktb9gmdfhJFcTAdwVKI25xYlg/ikphBF1TLBJZznNTmBc6u1Otsdxjy8goEzmXRiBr05AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RC93O/9B2LylJvMbACxtTRweB3sixPckboUTpa+OTAc=;
 b=jB+Tnpuh8aC7yLgFC3NmPN9PRtUF64lr96zYOEk2B9REDeaUo4gUIBXiNdQoE14t1hpI5wvBr1SZeBeXtw/pEWFHEgAJtwS/slJKekp3Uw5A8MIlRsdutxRAoNPwMRYSKuLNlYTbNzXOsx34pj8UU9n7/euZ9m7ac7ZelHlWzHLH0DghvwMPnRUWiri0FwT1QdL0vykopSBR9nJlRSPC0viaciDvK+9sDQXuT/DeypA5BH8YV1Q/qfrEbvysrexwgqwBZdOe+i0zXgAFO/4ja63XfnIUbKEqS5r/R40ZD8kQgxDF+xt4BGfvflmr3KPDVqdrlsnpHZayTPCgrz0a6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RC93O/9B2LylJvMbACxtTRweB3sixPckboUTpa+OTAc=;
 b=AoXTQAD5FVfAEVahPlsynbvB+nB8uIP466OLD8w0SKTPsOpEsRQsoW0kZSEh3C9cYTZnxAm2NWKgsCVnqZtDlnCsdXhX+51OWlR+QAvrwmJHPIWGUERvck2EWiTjO3qUzV0DezsIrMXhbuUQ9fFv0WB0n5+ZmjyBsPGT0ltIhuto6TRqsJrYnqmRtr67Xh5ky81M0BVx88TkybwUqcdG5aS9odlB4hPQQJY4KsJ+bxdeLPF0z4hbLUGwI/3pmiCsN0uUBcACMtWwfQgrv6iqJmZ6Ruj2wQcYj416zG8ruVSC4HsYB6gMNGS53ZKvGXx7tbK2u5WYkflZsNw3RZbxCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB8206.eurprd04.prod.outlook.com (2603:10a6:102:1cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 21:19:11 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 21:19:11 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: [PATCH v9 5/5] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Wed,  4 Mar 2026 15:18:08 -0600
Message-ID: <20260304211808.1437846-6-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304211808.1437846-1-shenwei.wang@nxp.com>
References: <20260304211808.1437846-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::26) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PAXPR04MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a4bce0-978c-4076-b1f0-08de7a33ad90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: +58f8Cg0zMZGgix53VUSY9kQ6wOzbdb/mj5ykYj4vlGYaUh/NWEVguqFEulKKrJbOKYgyBqj2App1occk/+xjOdver83/nwnBKn5K6jaVudq9Y9tRzIrP/k18QtRVfp9STeJcTrwmm1nekDt7CyS1oRxlC0GTCPM2yRZcoR/AUjTOIvg3sNVxSZmQ+AmEi4qWidCHXn9EnrfxC3O/GNhS9YakQ5u/4qccpMlNz5psuoQUo1Hf0bxL3a7k05/NK8CRP+Vl0F8IXCjYHMPlMyYOV9hVHQA1qGNNx3baKuS/UoxoiXaYrP7VzXq0q8YDVBQqTZHnmlBcxBNsBFE84bH58vCEcE1/9Vopba0TYvI4pVUllPPQdjtTdKiDKAiEd1DD06B1sv7mpwBiubhq6L2vf6r7hK+VeAelV/Lv+TOloBEzXXpiNJR28MgsQ6lP0KBHTxiHTu7YXRidiSEoMVHBakWP8DlVxC2Jtr9ftyBCz08/1cM9dq1PFu2ZTqVrzRL5YIIKmtWDVwm45TRW+somFsGVmMBjIE6w/uWiKfxq3xKer03I7Qgmp8Jl9zg8LpJ7CuGUQ8IDrx0O89mvO4mBHxa8BkWFcfD6EdBw+CbSVtRONpOtrE1NZOckEYsAjTSkSebeZIKv+tAgz2rU5J+Q2vNwXzkCcCHGgXUkDBsCoqiO8xc6dT9fO3Rttjja8dIlX72aZMhaROQ+PTAtOaITA67KfdYrulN0KDcGG+oPEj1lCMdvuK7pI9hib7pwR88djsoER7H/YEYupIc0FRcSrYjfxv1/H01qAPLk3KqaXNrnBJSbseW1aKv9kK1gOps
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ePHz9CVBdUyzCKfbByPXfXJfzzpZv3df94Fxm4nANpyxFBXjn/Puu7AFrHzP?=
 =?us-ascii?Q?t9ReUdMhKgUIbVxHXropyr95QJ8YgwgVMc9vSmokEy0SNcWznrshyIqt3i1j?=
 =?us-ascii?Q?G6N9zwxMmGL/EmpGw0TwXFChxTTVy3SQZ+3ouDwhk3YcEqTAdsbPaVH1dFmb?=
 =?us-ascii?Q?aO7z8LmlA5e1MSrbw9ZJOK5V91VV00lTmWaznp4Wl3Qx9JHmMdClOdn9hGkB?=
 =?us-ascii?Q?c0YBDfZgIjpJ1hbrKh94cM2/z4laoc8cr7KecrcyxeoExA6qp9jHDdcamejf?=
 =?us-ascii?Q?5UFkxOuOXOBLFfwejIRr2AKlUFTOGMNo2dPRK/xf4wQI21IZNxZnykdCp22j?=
 =?us-ascii?Q?fquIG3osbUuEPjFXu6MBW+NY2m6N9ypNIEnRDEOW2yuZT43/myKYBIu19IWf?=
 =?us-ascii?Q?gihdl+Zn4R/XmUPUu21mPShQOmS8IhH2On67XMCcLxnyEm3UG7l50rubN0CR?=
 =?us-ascii?Q?8p1cIKNZsjUc0OeAZ6jzunYyMSoriG6vnI63Ir+HxRElss9SV7Prc2xpsSAB?=
 =?us-ascii?Q?CaVgMSJjWNv59DiO9BcsD4Wkbccr+6AhmcD9h38rehNLRFyROdPrZVhPh01G?=
 =?us-ascii?Q?PTadzFaFfiOeJG9/XBBIaZdXjHLPBrp+v7pmYfqFaVNckYpyqqXb5iYAea5P?=
 =?us-ascii?Q?t9eOMjJDaKy/svtJm5lcMTkaRLuK6fKW3c6xfFJE2Y/ZMOeGD5FUlNaMoVca?=
 =?us-ascii?Q?0TUpoB90YDOxuKDgj+XEnhd8zj5oEkjX0luXdB9yO7mZb3La3xqy0E2QtoLe?=
 =?us-ascii?Q?H060OONft9SQrYsrZo3lLRA0WswF4iklYslGoobHwEp18PKUXqsy7vCWfKFm?=
 =?us-ascii?Q?IP0MycWlhDP+B2GqfMRGPtSNyRIsKArpFAmzbs0v5V9q/igD5OhSY8u7Yr3f?=
 =?us-ascii?Q?nUAy4RKLAaErF/cmU0cyi0uyJ6GwD3Ojso3bu1QGmKIneEKJLYVUtkTb3eu1?=
 =?us-ascii?Q?rxjOQcob0IjiNzLqtisFJwhd1HtFYCKB178F5lQBcB6QycaWrNazzu4P1Arb?=
 =?us-ascii?Q?Ak1GJ//p5WCNbYvQ20q7M/PGM+inxoh3WR5tljXjjwZvmyKMwRuSOWXHKN6+?=
 =?us-ascii?Q?eH77gLGw04EL4IhmFsLPLy+fL3GSXkpmI+vy+KlyqCKSs3RwwJi2oznzd0Jg?=
 =?us-ascii?Q?yBC5vJf3+lhrDVnJ56I8WG+u8FRg/RgHBmfiRqLodnVrFqLBfTnirw4P++DK?=
 =?us-ascii?Q?cw0EIS55Oo+8iP/zAT3ro+wEy74kxc1zOx5LaWmlvJHwdK68Eb8lqWYwCC8h?=
 =?us-ascii?Q?BD876v4VVytwOg8cnm2015cearEth+qAuBtqt+GekS7A+EJr1maUpWqvZJwu?=
 =?us-ascii?Q?htwXKujvRKXxFK3pPJ7y4+LmeaAHxfw3iFOqEjKDkcU/dpjYRd1oA6TjCmSx?=
 =?us-ascii?Q?LDuk8Lxn26HAGDq9fYbyC/t5070OXlP3YfUmiElnGj5rn4UgU6EwmptqY9ka?=
 =?us-ascii?Q?ujcPzHxggSEsAmqcuFfKgptPOYJ5iPm5aHa9x3BvUgNYUIct2seLpvhs75/B?=
 =?us-ascii?Q?0AOrNZ7mASQghj+D6krmg/nEc44Ip2hpNxp0JnoOnNqsYomdlJPFFdLn5LM9?=
 =?us-ascii?Q?z52ZstbG5VQ/xXoTD3m8708lGM5jXsKSpqW+/yCTtL/03riS+Ot8XML2tWJn?=
 =?us-ascii?Q?RaWyTdl3Qp7X2kWNbkISHmxVw6cVFsi3jHr89sKdvaDsHuNAAqePwqpvKwuk?=
 =?us-ascii?Q?6hC31idL+/FdLZtTOANg66FwXF2F+o5ttjklbP63kzqUptxKmrsNmUFJ+85P?=
 =?us-ascii?Q?bq3H/oxslg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a4bce0-978c-4076-b1f0-08de7a33ad90
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 21:19:10.9289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPOYTwpfwadB9+YcFKiVOP9pNbwrjxgxJHBvobWGsqPoClXF3zrfYjq5kZ+xAqjyPgCNLXjrsb7iQhsgZNlLmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_131914_724035_A175905B 
X-CRM114-Status: GOOD (  11.94  )
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

Add the RPMSG bus node along with its GPIO subnodes to the device
tree.

Enable remote device communication and GPIO control via RPMSG on
the i.MX platform.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 9b5d98766512..ad1ef00a1e3d 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -191,6 +191,31 @@ scmi_sensor: protocol@15 {
 	cm33: remoteproc-cm33 {
 		compatible = "fsl,imx8ulp-cm33";
 		status = "disabled";
+
+		rpmsg {
+			rpmsg-io-channel {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rpmsg_gpioa: gpio@0 {
+					compatible = "rpmsg-gpio";
+					reg = <0>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+				};
+
+				rpmsg_gpiob: gpio@1 {
+					compatible = "rpmsg-gpio";
+					reg = <1>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+				};
+			};
+		};
 	};
 
 	soc: soc@0 {
-- 
2.43.0


