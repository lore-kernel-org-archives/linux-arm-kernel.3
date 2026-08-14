Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F698C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeoPgYLsJw3VfVRYlqAROVw88WnRFwiml0GEQcwBH2U=; b=BO4Md61o7b9zyoHe1uY892rbKO
	K0sYsj77JCZB5QMZJYApbW8E2UtC85nimwNCOvDGSVc6pohid1GLJ9ZJcQBpTYUHjcdg+dNFbsoG0
	KnErMqr2KhyiEq6LmiRVQHcRwjgdqKS1h+4s61ixIETUnSd7T2WeJnLd+oBgZIL9C3VMuYdCfEtkx
	r7f/q/uoXUDrCTdcb1u5hW9x3UuLHvLaTTNs+H1Z5P350KHzGlg1tiKiAFL7+l5XRWElXTfc9gfWq
	BFcU7GM+TdYkMlPYgJ+PN0mP3J345O/yZ/YXKE8TvmyPJGaEkgSH/N8lkckYXmRq6qOkofBgplaC0
	qXHh5RYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumDc-000000026oA-2IRO;
	Fri, 14 Aug 2026 07:20:44 +0000
Received: from mail-northeuropeazon11010010.outbound.protection.outlook.com ([52.101.84.10] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumDa-000000026n1-15Kg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:20:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmThmHhSTjn/5FtjEZA1xzgi4mBdyqc83GAQaXArybCIq56LqxoFeRKGyAJXo9LDS476KQvwGhanP1EpMll9rew2J/O+q7ZDKa5cLMby3RVASC6NJ7s7i2OEtLGtm9+16f+fZXw+Wd/nK+MB63gdTXycjjsfaeBuqa1ZG3akl2n/k6NU0mwL8l7fIaNfpYJi0fE0ca/URbT6wZglMpD+9eXCeDg2MGpBr0Oj98TQ7hmgbccNbM01BEEgfxxteCXrEERZYlpa9ePFPewLUPoCzp342KrvP/a5VuT9hZt1CDojFLtgARoa+XzuMvmgT6RlE6fqTH2b4jwpREB7t5wiHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeoPgYLsJw3VfVRYlqAROVw88WnRFwiml0GEQcwBH2U=;
 b=ndi0I7D0nn8tNewoCDu96+2uI8b4cYUpbHfM72UaKsN+WLjktnIYAXtxotLGKZ0ghlN6sBGDK4q/ysr+9CQuB8Cli/qU7ItN1lXnLIo/LRT0bo7/uC3lw5CjwpuZAx3jp8G+8X9glLEFlEC2GZDW7Bjfmbq7ZXNNHrznOctwFbTzB6CZb/MPVKidvqUvEG4UDkufG3q0Yn1ss/9gmqc06Vm3OQRqXChbv2t3p5KmRGkAB51xi3IePTNhJl4jco+7LlcZKBXQ5FHGUPW7k09ywh4n2JWCq9bMXZvjZxxTSOi2k60f759ppIpthXN5wz+HwBtLJvbYxGok6rl6WmuBnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeoPgYLsJw3VfVRYlqAROVw88WnRFwiml0GEQcwBH2U=;
 b=jIsctW2isS5UgD3prxFpZMqHwdsTXVhfgaYPpLB1dyPwDp2cqTGi2VF9Z4+lxIv8EetHPQticbqaV5E7u/4jM4/b31G+U93X8EB30v3wV7ccgm33j6bedCjiZT8N0n+mF6i6m37i5BBHeztAhA67ip8GmAk6fttWZQwmDjRSbjF5CkJ3+9nVSRc8F+XSvtdDndjSSjrMEp5gq+oIbSzHbdkTsuN+QDYJMHloW4wpnZcUFi7uEQ7DgIxNYlO5tFmhUxNbAujtqbvbDFGkOwol8aJL+xvIcJ8nqVqmt1qxWYK88YKMKOdKWFBHXEmEBTauv7I5lm+aaAphKFS3tlAvJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:20:37 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:20:37 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/17] arm64: dts: imx91_93_common: Add clock and sound-dai-cells properties for MQS
Date: Fri, 14 Aug 2026 16:20:05 +0900
Message-ID: <20260814072022.4064009-2-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0069.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::15) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: ae2112f9-af47-4ca8-7ba2-08def9d489dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: O9J1BhFXOs5kgEocN2VjkpYvPdpXgQmR7XVXERJSE35obUPgFRr50juYfTQdETl739KTyXLDiRNworum0mMKM1ESoiebMeav7h0fONc13SkMw1shTR/1oif9Q08Wiykh0zO6MX4kbSdHlEpBX5k3wisofsANRQNTgymJBYS77yeiSyOGH0Tb+WFPHmO75k8Q2zNx6b3JI4jiXWUmsLEMX1nXA7LvfD9PunEs5OWnzzJ0NuLDeMy1nCu6pgqKwf0WiYthvMUN9DgdCOqLhV0QpO6jhLIiLjrunt+BvFTflIGZK4NmJKMfiA9cREBySJEeaYDORBojp6F6pia7vtwkc7B4Se2Kd8e87+tu66bS6JjOioUQ0UztjsRGtJXrkppKPUWTGHxKjj7Pjdf1zU2I0OVVLkvRGZENDofgfrfxE3ISxAjcEZUghiOiZajz7Tgb11i7ykOMYS4SALY7iJGf6AuIsu0BAcxp7I1mHEOSJJ1lFkgM7chkT9a7GSaHuAnsT8FZVe0w520xdQL/1Tkb0u4QyJZLgwC2894KpjvAoRoUFtQo25jRD52/9+oFAqMrpOABwFhzMbQhtmXxWpVw4kHlf6igKFFXYR59PKmBq2FBSIfqrYiDlzxXvw8WVu4RGXqa7TjQUe/rHsWmBosbTiLMxkCrRxEri7RXF3dCGZI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xnmdlq0Cz+wZcl8TLGHFZAS7gwlH0WKixG9my3X2au094KcB+PNWFqLpDeTh?=
 =?us-ascii?Q?x/aZ3SX5Wkie0m9U7oM3jfI+uDPCFqL3TD3Rfo4bkJoZnbmFLv17xYM/jeIS?=
 =?us-ascii?Q?lsMYzO5wqMLQBczNjWhMn7rQIe9nnUiu0KaUEs3I15jFsmShInYHibvw0GIl?=
 =?us-ascii?Q?ycnFsNSQh8qupOKVyN3w2f5m1DtYQz2owfDEV11IUUV+7+dk13rd13RjDBbm?=
 =?us-ascii?Q?Cpn4qpSby8OrG8nMj9Yy6wljCF6RSRY4JHSjcza8Zsq71GnxdpCThyYQBZie?=
 =?us-ascii?Q?whMzXmsIwOFyWoS2KZPZyfyyJQy8iMm08nVepAlE3VSLYv4I+Xz00s3gJyKR?=
 =?us-ascii?Q?J6Qwm/FXF/1LfMjtjUuFI1xKXy4vY9iejezD6Gpn9iEUZB+SqEdmPzATQOna?=
 =?us-ascii?Q?C6zYEVV+zARxhLXxWGrNEuybEp4Nwb3f9rvMEzL1S9lxfXsznJF4h+ZczQ5N?=
 =?us-ascii?Q?a7OElr5bDwXplZtrTIAFbVJPHlkjGTX51dbWUwRHXb1GYAfgov9EgaE2kZAZ?=
 =?us-ascii?Q?n0eR5c6mVdaP7/36O1OeXCcfSOpA5oembrxnNs7nDmyQk9MYkK/fcbqB10pE?=
 =?us-ascii?Q?1QxMwJH7iudWwgcogCzDhbFmyMlDEfV2/T7sQNFuFFE+MHzNX1+j+NDGQU75?=
 =?us-ascii?Q?GMCP3MFXgDa5reR8eC+GvfZ0O5VN3x5xbPQrVk2a7U9ggqdpkwwETSiE+QJv?=
 =?us-ascii?Q?5DEPfzaJOc9rKAPxLCnh8J43kdViNdan+d/AwFaUXlUBTCmeooA0xASXg8gt?=
 =?us-ascii?Q?+4rN83fsLLzqa9Tv0VSUATuTWCpmeuOA4LmrWrn86lZcXlLym1I41ZYxrTIi?=
 =?us-ascii?Q?0AtoA/cLwLGZM719jkjft+kvkb5Jp7hS47Czfjac/sFNZb3OcPyRYR0f16sd?=
 =?us-ascii?Q?tY2kMMGcyF3DYI2Kaw1UeRSxuL+IU9ANtCxlCDr/FWjoSeXhu7nbGoUW9wpv?=
 =?us-ascii?Q?STnUKoaiL7lCl/zOhV9vUPNy+uouGQMb91uw5T14Q+cBDjKF/O7lCujxQmr3?=
 =?us-ascii?Q?yV6ZDG74dAwBWiNRa6CZdeNyPvMqH3soVTAAG8meon1rLL+mK0DGI6UaO7Vw?=
 =?us-ascii?Q?NE6RL2aprY+WJMVMV1uyMQDCunvODXQfYxn2ALcGU4kv01tANyL9eA2qAuyd?=
 =?us-ascii?Q?H8BhEPAq98EGq1TZZm0loba9iD7db/4k8MT1qriOnpA34v38HTJiIZe1H0hx?=
 =?us-ascii?Q?s1Me7TG56yE2ZOLZNRyWGX9yc9NBGebXbMdIor9ySlB5UVSik7lTu8GepJdP?=
 =?us-ascii?Q?crgjgqEtW5na2Dvnl3hV15DmoCp4LN4DQuPtZOIGaQgHwJ/VKpdNlhEnJ51K?=
 =?us-ascii?Q?WB6RP3X6d2sZvnVflDhZ796EDw1/lJ/rx2Bv8xzYw0teRjyrUEIBeIrUXM8C?=
 =?us-ascii?Q?/SIWDCSCEeJW78aJP+KDirr6Bqg+FssY7BhCXFtN1J1dHnrfwcCNeik0q7Ij?=
 =?us-ascii?Q?7akJm9AGSaPWlpQDKSm6XOxwEJxuM0BRJEITP9IX44wZ2AXcYgXzR1O4g7pb?=
 =?us-ascii?Q?U0KTvgWi/jAjQGpCY9l/JJu/MESKeqO5a+TBJCaaqKppfOyclSlCiyWO9J66?=
 =?us-ascii?Q?UTDRRMEnMSlvSn+S9uK+SvMBC3+xWKDqunmt0oKGXb1K1dn2TMyVcloDUq00?=
 =?us-ascii?Q?+cr2szlPbJv0I8KRgqWhc83bD9+nNDPnJfLKAMU6ox5WN+hscOIaWwlVKasJ?=
 =?us-ascii?Q?QSX8QBjexyRWFYf5UOXW9MPlrMDvR3yRPvZMLXtFb3faYs89FecMicDbJT6F?=
 =?us-ascii?Q?aTHogNYuqmniF87eO5emKHsL21qvdQFkzIcfm4CzVaA+bhD3ykgD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2112f9-af47-4ca8-7ba2-08def9d489dc
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:20:37.6344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQEucJDt6+JEb9oywvwIyKS0ySBTmabgrYtvmN8qOop4/sS48GsRZ1BLECTCeLmDcZ1jZ/CtlLpoxhE9FR/bJp7hJj3oCwT6b2IHAFhcep5lxAyPpVT5KXH3HhxdxAm5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_002042_310599_FD220D0D 
X-CRM114-Status: UNSURE (   9.74  )
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

From: Chancel Liu <chancel.liu@nxp.com>

The "mclk" clock provides the MQS oversampling clock, and #sound-dai-cells
describes the node as an ASoC DAI provider. Both are fixed SoC integration
properties rather than board specific, so add them here in the common dtsi
instead of duplicating them in each board dts.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index a1a7e6a0571b..a68ffd04ee08 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -100,13 +100,19 @@ gic: interrupt-controller@48000000 {
 
 	mqs1: mqs1 {
 		compatible = "fsl,imx93-mqs";
+		clocks = <&clk IMX93_CLK_MQS1_GATE>;
+		clock-names = "mclk";
 		gpr = <&aonmix_ns_gpr>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
 	mqs2: mqs2 {
 		compatible = "fsl,imx93-mqs";
+		clocks = <&clk IMX93_CLK_MQS2_GATE>;
+		clock-names = "mclk";
 		gpr = <&wakeupmix_gpr>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
-- 
2.50.1


