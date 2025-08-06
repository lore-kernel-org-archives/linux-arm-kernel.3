Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE89C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 15:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OoNPXiUWEc9YDX3xBYhSSHrR2QpUr1TnqTtYA69HNmc=; b=dvi/tvXEkP2UsOb71GYIYQz8U/
	ArW0EuIINorZXYQqIwPLwuRYZZLiODTuWxIij5mze3PR0YHI5YPxug5cB2140+dX5xrpc0U4uY1SM
	bpnmxRZqd2/mcRzWCs4mxTZFjVuVgOm9RDWs0H5jS0yg24NGAyLV3Cx7k2qlxHOuCmM+c+aA/8kry
	J9iEi1xmAAo6aJSAOgYghhfxVzbHXmG4njsTuRgxyspeNez1qqekbRP83LxQleLcdH4bJkdhd9yWX
	t2GG+phdULhHB1ZcXC+LqiKRivDNY+kNutCaeh7tt1GJreFQCDeFePNwf2AURa6ULrxpVydlAs5zt
	T0XMTpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujg0T-0000000FbAx-0bxO;
	Wed, 06 Aug 2025 15:24:45 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfiO-0000000FXdD-2TVy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:06:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fonRtmd0DGYAr9mcf9FLWRaL2AIbeg+EvZh0fjlR0TyB+ZD2SJGyWg14Q08W+W06Z+zkqCSB9Cgz7SCcCfy21tIAdaTS+gE9CE70j2bJPOVjykL1XvGRYu3UWor0Z6sy6roeCItzjS4otznuGRv2x390hoPgRSbvgm4LKNWGk0KM38fMr4H2gGQsv6dF3fjU70T1oK6/ILuoDfIS4GS1zmZcPNHPCseK0d4lbM6oWPvI71mxe5p941ZxdLd0yJW691AhuSXIhC1GStHKEIHNPvuVJXJN2DfJy9Y8xSayuhV70vfaJXQxoh5bk+fD89iO3WFdwFhayZbBtJXoOh5USg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoNPXiUWEc9YDX3xBYhSSHrR2QpUr1TnqTtYA69HNmc=;
 b=tltkSDn9cxv9uCU23LD6Xonxp05IlCRgMJCamNITZJLkJLOHvL6E8KNusAYH4NfiC6aA3ouB1rkOzCQvwQYH8YvVXInQM/he3eZAPiHVor+pzt+hDkONGJemrLrpOi7+mzXrdM7c5a421Fs04IpE2WirBcqfQ21zhDOqcYnQsS76+hrxlD4cbHwDDBjCSRdQR3EnrMn4sTTZlvQjGjLeH/xiEMX1IjFGJgRXWzeYDT3dPul/rYytYMCe4u0orqIsHLiBC7AaI99w/Jt2P30jBLA8j8EVHtjKNvPoi+3U+Y5pS+IkWGxgnwMlMvk5uJta4SLhs1fN1X6NRoYR1Vk2dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoNPXiUWEc9YDX3xBYhSSHrR2QpUr1TnqTtYA69HNmc=;
 b=Y+mozDAFWC6MvQPAQGj3hwF7sGhgsl+WNsEDws3fztGBtQxwb7lkea0O/GaARO0x5VMRsTjYxfpywNMZfd8HEWrNER2MsuAqt4hQT8LbT+sNGGtQ6sqPzHy8gJW5D3q5HP7IcMxa5UesZ2k42vF5g2qRz9McOgPaDJWk3GAhWNMblEL2Bzfpkbse2qQCr9/Agn652MjCEVqIs0oy/RFjBke9KJIbfhmiRkl4/G7SuYKmsuoqziT0pVC47pJJUtFqz+SjJFFuiYR6QKiqYUaPWhf5FuCz5CSGEoGaZLkIxAOYZjB2JKgB0gbXhbZGuseXeUrmOsjNoYJlwRJeSoN7eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by AS1PR04MB9429.eurprd04.prod.outlook.com (2603:10a6:20b:4db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 15:05:58 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 15:05:58 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <frank.li@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] arm64: dts: imx943: Add display pipeline nodes
Date: Wed,  6 Aug 2025 18:05:14 +0300
Message-Id: <20250806150521.2174797-8-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
References: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0222.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::29) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|AS1PR04MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: aa9aab35-9e62-428d-4976-08ddd4fabf88
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KSg5l86Dju+4UHAnr84oTLkvIdExcHNug5EefOCHt3nvja5z2PtgoOtNOKrD?=
 =?us-ascii?Q?rqFaKzGRItQkCTgMn+N0nj+1CItgdj+lOqLWJWuOn3viIuXPB29EyeJyrCki?=
 =?us-ascii?Q?g+mwsfJxKwekoqxVndVSSvkdZssCNA54lm7onhLLPRcj06JC+rfUELLVEW3v?=
 =?us-ascii?Q?Gq7GcB+UBWj0mv3PsZRRdQ64mk9RoZmArmtcVRbV9mKDN+s7p8h3aIliFTjV?=
 =?us-ascii?Q?l92lZ7kI6MgJIs0Nk1N3pBQ4iZDaMMt5NLrOE8m9ptQkNUBWIKJEqAVPr0e0?=
 =?us-ascii?Q?cVN1WaayQCjn6McfrAAwfdEWX+jwO8V/eH/vQcH2LG0QA1iEA/7y0ZEIi48u?=
 =?us-ascii?Q?3/0s0G430seZN/PrjnVr2NS30I/rvgyb8NOVhIIQo36JHlhlO1o0aDu8z02X?=
 =?us-ascii?Q?8eg27+1BITaGZeT4K/Z0GElXpXW1Bbyay+zGs+f6GychjdKAlP62jcAoK+ET?=
 =?us-ascii?Q?iRxMKHZJDuGLBNuAFr8l0sNpEKyWpFLs3rmQgrjUII3Ven3oeVnUTzdpggrG?=
 =?us-ascii?Q?mIxAW35WyxcbBkBVXwKK+UdD/nmMM53XGPUF+8ZP4ZdPlfLfx0Cvj778eh1l?=
 =?us-ascii?Q?HGJ2J1YwQC32T3W+sfwnQ1zgpM5AeriG5aQGvmagV4jsM1CPKesQVkGyxow9?=
 =?us-ascii?Q?L3Wqe3JdJd7wdl94v6Oo1ndXb6inVOaiITaHG5JxzUwrdEDYoKFPJq4Attio?=
 =?us-ascii?Q?K3u/ovfzsq4adq020opGbS77bC0Oo4VtXXYhIwIigMzrb7mXxxAONWfw8U5i?=
 =?us-ascii?Q?iM+GMEeF+YcHCVvWODrGS6u7aE6fFPlVUXnwTWus3zirasNIrhJCfnkdWsto?=
 =?us-ascii?Q?OQSMSz56Q1pCkMha8Gs9f7ZdBHDKTZlPj8ijW31NFXKNB2eJpfAk6luE3QFI?=
 =?us-ascii?Q?2gCMqN9QvNcWVOlvsYl7YIH6TA2MCQNslSY780DO5IEfet3Q67jaPFUWWv+9?=
 =?us-ascii?Q?i3CkP24nkODkiHFsvgkZgPs8CEpGGCdlnSgBU2dHgbqAwFoquLHBHS7DeL+H?=
 =?us-ascii?Q?0AD5/mmwOeaJKxa4iNipSLDTEx5rKmsFy1yradcqUgTJwT0hwPqVBZ+xvVMA?=
 =?us-ascii?Q?qoNVggTnS7Wook5t0E1dSKIg8DyL6L9waXfZjYYhy5hRk7Cy1U3K4PizC1bd?=
 =?us-ascii?Q?gOmvn/oLexnzkXi08WPHFnTymrqCI0VqqwJw+rKqcSOyhikXSasWaRMHENE9?=
 =?us-ascii?Q?VEzBp9bV0jPtDMzPfQnfzGHbWG2V509NXuyH3/GBY3PhVn5NqgRQ8zMoW4yg?=
 =?us-ascii?Q?BGrTyYgWnM2CxhwHCoDMwRjClDXyLg4mSgtahGC2e4dxaB+ReT94Mks1WK/W?=
 =?us-ascii?Q?K2u/UY/mq5HUNZEURx45mJpMF2fCcV9c76A89KuxpaAqst3x2TNUi1jDmkQz?=
 =?us-ascii?Q?YlCZojoVXHyeBAoFlqxwQWfo1etgNzCd09bssP3AEF7KIy7q9NrLMY4a+oee?=
 =?us-ascii?Q?IxzgA2a1uSM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lnS1cf6m5U+maumKKRTEPjZl1sLklhkuIj3hgLmKJ+Jmve5RJdQJMxJYl6Yd?=
 =?us-ascii?Q?ZKxhDwu0WQJZxhrgRTtts1aZI3XEOTLxEGXjOSon7cMu9qQR7hCowfaWdczY?=
 =?us-ascii?Q?rjrLvQ/HF5UZDGZe2bV/V6be18HHkEjXP46FGzi2nwO9JHlIo5h3gfSjsw0z?=
 =?us-ascii?Q?XmyK1hIVVRa4wfKIXwbz2bZsztGUlmR7DPr4JZtIR/1m7S0jwU4C5wShRQPA?=
 =?us-ascii?Q?JP3pLRDxzgy/nbUeEsav2qOpWJ7EyY8r8Mz8fbe9QNj+Cy4VaEqw/CrTWqPk?=
 =?us-ascii?Q?6TNZzBftUFfMWId5oJQZ/PyCLSukkij1qkpJeaEOFdjEW4RcfRADtzVC93wm?=
 =?us-ascii?Q?5P1644QCxAFO4OECQkKFV6Hlmx7Ox3O97BaZ1CsxQby6dBcc0uS2DndO7uzD?=
 =?us-ascii?Q?JlVEqp9qaZHxxkF/rwYXM2Eene90WsH1HhtvTqquNfqhChkypWRvBti/vrgZ?=
 =?us-ascii?Q?XVyi8TceTU3HIItsBJw5zcytTLOeNLze3SEkMrlWAhnP7Txu/uVhmUVjPV2E?=
 =?us-ascii?Q?pzDFtzAzlrCdWYRDQWFeL6kmLk2DuaGGKC+zpRNiK7htXh5oSIHpH2Vot3dI?=
 =?us-ascii?Q?3SaReT4gozLI3pdculcdulgCjCGLm9KUSTWVjNE7reMQ1+V1/vHhi6K4uZgE?=
 =?us-ascii?Q?mlCJ+jnqqtlJDOwW2LpKk0nMxfE6Vxqn+8tpcZcA3C5wBG6QhJyZpQHx1FqA?=
 =?us-ascii?Q?ZG4HcgW96lsweDfbUCeZPc2otPSupajpkSvuXt0RnkbZDyduoqC18OUtHkl7?=
 =?us-ascii?Q?KQBeg8qEDgbwzm4csaxx2BclixioCUdHRV7SJIQ3h/nDXjqHcrXDYhGU48yj?=
 =?us-ascii?Q?vQgzq0HWDmSt5KPFBNGgvrdk+ymk49uDUOt58CDaE4LGfBKpHPioseWmfhjP?=
 =?us-ascii?Q?MfP/rTMK3MfuE2EGr3vLRkeZVAeP7c2ZIDsL00XJePmOSdVFj5zeOBPgrY0G?=
 =?us-ascii?Q?miSgkLL8gdf9wEHRC9xmZF8nraDT7thgGhwMHTAjBAreZvGyELQsJ8AoBOnX?=
 =?us-ascii?Q?+QadUew05EQsT/vZVZ/zVEW7Aq9tgfc6TAxhQA3YY8ILFbxCyhza1Ig1j+17?=
 =?us-ascii?Q?aRAuCg3cyL7yCxN3lit+mzWAuuYGowa5oqi+M5ejoj2CH7ocITURwqjvh0qy?=
 =?us-ascii?Q?kY/UwQMb1nfBBqZcIks+cY1eAua2Vxkw1qiOzkpYUCL3JB+LWFbNUW5WpfRS?=
 =?us-ascii?Q?H25nom4tbAot2Qk104zXS/yXTk1AJrY8Re2Glpcdf+Pk/YeP6UasBRTPEZ/v?=
 =?us-ascii?Q?Ri+9hLznjsGX29bcDtltv3dpkFbW3eqOIUY786mcdA5VDwqxI5u3EceKjiPU?=
 =?us-ascii?Q?15cm1BrSkg1muocxn0PrxxDqpKvqUHaUir5dTB0zuO50zoHWot+SdDaq3RQ0?=
 =?us-ascii?Q?RV69WlXDABoGQpcvlY9y1Fa1sx+YL3ZXD4md1uRaFb2/H6P7RxQyrYHXSjX0?=
 =?us-ascii?Q?SG2o7QZ3ZaK0I6QCBNBVWD/xR3OSgB2mLCir9N3YSvi6QIwrJd4NIFjjJmFm?=
 =?us-ascii?Q?/zV0WDzelhlMPO3EkHieYzXsO3mtGBybjIhA1kEN3ooNgTCm87O04xqku1tp?=
 =?us-ascii?Q?xZo3CpV5ZV12Ck+49uMLZL6JgKnaO/4tIV/AJA9gyOT/9p0QlczF6+D6Ego/?=
 =?us-ascii?Q?hQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9aab35-9e62-428d-4976-08ddd4fabf88
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 15:05:58.0055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpKP0HV1TBu5sLQX7hYU6kUrYFS8JkO41uqUCRJa4rMTw5Rah7D/DEsiciIDp2umfN+HNk2DcjDN9jfwuuuXvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_080604_631061_8561F65A 
X-CRM114-Status: GOOD (  10.61  )
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

Add display controller and LDB support in imx943.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 55 ++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 657c81b6016f2..70dec03c5608e 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -148,7 +148,7 @@ l3_cache: l3-cache {
 		};
 	};
 
-	clock-ldb-pll-div7 {
+	clock_ldb_pll_div7: clock-ldb-pll-div7 {
 		compatible = "fixed-factor-clock";
 		#clock-cells = <0>;
 		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
@@ -174,9 +174,62 @@ dispmix_csr: syscon@4b010000 {
 		lvds_csr: syscon@4b0c0000 {
 			compatible = "nxp,imx94-lvds-csr", "syscon";
 			reg = <0x0 0x4b0c0000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
 			#clock-cells = <1>;
 			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+
+			ldb: ldb@4 {
+				compatible = "fsl,imx94-ldb";
+				reg = <0x4 0x4>, <0x8 0x4>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg-names = "ldb", "lvds";
+				clocks = <&lvds_csr IMX94_CLK_DISPMIX_LVDS_CLK_GATE>;
+				clock-names = "ldb";
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						lvds_in: endpoint {
+							remote-endpoint = <&dcif_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+			};
+		};
+
+		dcif: display-controller@4b120000 {
+			compatible = "nxp,imx94-dcif";
+			reg = <0x0 0x4b120000 0x0 0x300000>;
+			interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "common", "bg_layer", "fg_layer";
+			clocks = <&scmi_clk IMX94_CLK_DISPAPB>,
+				 <&scmi_clk IMX94_CLK_DISPAXI>,
+				 <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
+			clock-names = "apb", "axi", "pix";
+			assigned-clocks = <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
+			assigned-clock-parents = <&clock_ldb_pll_div7>;
+			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+			status = "disabled";
+
+			port {
+				dcif_out: endpoint {
+					remote-endpoint = <&lvds_in>;
+				};
+			};
 		};
 	};
 };
-- 
2.49.0


