Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2E0C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 19:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0kzrrzx1s0lw8quJt2PdXGz6VbdfRjf40V8Pm/eugYc=; b=CQv3kSoqsAQJdxOTJpuhpdTgCp
	iH9tojaMCrwbQG8+s0SZfaOIJvZJgm3TpPIKr7wvkfkglrtYIxNXN31rsIT0SlF+jV01GrapXRnSG
	JXYCO2DdeaWYqR7NOqeTaszGdT8WGy7qGN+BxCpDvRZGs6xpFqIf14sSs5ui3K4LL3Kx4jbxVKcuz
	fXdr03h6UZitH55l+Cj10JIlcc6Rx55wGgWWFYrAArTRtDrDgRYOHmTBg9HWB3DnOEzUimJ+dfwCj
	WWJqkAdmrq72Ve+GKg21hnCZ/EhdPXpJYETveLClpVX/Gxhx38a2cO/CgAS2vMCi6/hS1o0PQqOr5
	13Fwm2kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpkY-0000000Ed6K-2FSM;
	Wed, 19 Feb 2025 19:28:50 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpdP-0000000Eag6-1gAB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 19:21:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dX6od2gykE4m+ZChq/7Bs0/rcCqN9PWNv7IFrZh4B1CVH3gmrCBe6OkJRgvTvjJtl6ciDRfrfw8DmdmE3zG3reXWEt1VPt8KUYvw0A7rNt14zBA6WWEFQ8GiaTJ9gEjKYsCjQTmzNpJ1tsiRfWf007k5oqK4CZ68PjPfmMfX2Lttlh85d+dc0oocAy7RZy177incoYT+4gUCYgErmQmerYV2ODsO1ekclD8nOTv8wWklCqKbIYaOyjFc5ZdOUqY3LMSkr79k9Kv4GdAgIpsAJkMdq+QjxTUPL9OGFvc0wx1Tlwpbcd5x5lnV3t873/KvnsQjBtG2y1I+VDH02+7txw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kzrrzx1s0lw8quJt2PdXGz6VbdfRjf40V8Pm/eugYc=;
 b=IddTuxHfP97vFdGq6/JTBNbvGFyVNk4bpMhFHoYkjxixxiQpfxQtfNhKgA07Yqt+qIM364ypJWj+Nd9135y2blFXrbxpIVrEWSlY+6dpL6USFXdRm9sPTaQQyUGpkh0PggKPxghpM3irbPN5CvmKbuYR/Kh2wT1kaOi+6xpvqY8mzVkjDsZp7l7+zxJWFN3V2nOXWjBBErllFXbkQsLYmG4bhJynNozu83qKAKchK2/IAqbPJ1izotXx6+gNj8uO3U4AuoFXpKPXDSd1bFuvGinHi7P1n8QxDqncQwqegA1Lo8LORfzJLN1y5VMaqn8TbAQ2T96tfs3JkAs4LQHLJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kzrrzx1s0lw8quJt2PdXGz6VbdfRjf40V8Pm/eugYc=;
 b=CdjODh5ejxOtLTRUIC6TC23vMtHXWxfGZkaEYgiYvyUaSyNSmWzcvbOo3gbIyxRBoJOr4eh5JOpw7WRBV6Flrg8uqeX0w00Th61V1nSnmSdkF45ClayNs5yLw4BaAgPszfSV69F6lx2P8h3h+OUOOp4WdKeCi7gTwbJhiMR5iXtLER1zvHV4HaHjnC6ErCdLgY/VXWuZVvSBoy62LvaX3z/aMtaljDRyfnpABEKy9gAkdHqY0u5SK+qzFPvMo+PiWWZQvcekop45enoEUF1sVo7zl4A3c6Tocyp6t1kIyH4LzbR6q1Hg+0Mz6yBVHw83WW73WTqoGi7J+GOjw4afXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB10951.eurprd04.prod.outlook.com (2603:10a6:800:25c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 19:21:20 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 19:21:20 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	shawnguo@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	mathieu.poirier@linaro.org,
	shengjiu.wang@nxp.com,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2 0/8] imx8mp: Add support to Run/Stall DSP via reset API
Date: Wed, 19 Feb 2025 21:20:54 +0200
Message-Id: <20250219192102.423850-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0267.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::34) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI0PR04MB10951:EE_
X-MS-Office365-Filtering-Correlation-Id: 3982b332-80d3-40a8-8412-08dd511a9720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cNRhnkmFdUIL6oarRBOS8zJGroU56a+hQKZMiC3FGHSpddiWkQemrM7bxyU8?=
 =?us-ascii?Q?kL6wOMGtmzgFFbg12FX/j1CrS27eIFOYSeSlpCvhRE9wQiEsvlC1rbEhCRQ9?=
 =?us-ascii?Q?nC49RDUx4Hkkwp1iYS1NJ7ybh/bSh21krJ5gT0f8eJ3xLIbkXRAhFweqmyrl?=
 =?us-ascii?Q?Dd5qm5RQ3Cc6AaFWtlkvXBB67F4KAOmVzIBfySxwqYyvkZPoqYPm9Hc/YOhx?=
 =?us-ascii?Q?hv9M0eSycrJU9xN2uX0TTMgTHKIMFlqkzSubvYq5n5TEXF/G4y3qb6cqFtxg?=
 =?us-ascii?Q?2YOWPOompcRBH9WJCnym9F30HJFxmuX6XHwg0dswW4AizrFCuSGHTuMoxvdO?=
 =?us-ascii?Q?euM05irSpOIYPgv3TNvp3i9EsUAVXNFAUreGHtQWRFw3erK0BS0+3HZcIsuW?=
 =?us-ascii?Q?fUhdVO8ebZcSKezKGpBzx8FHoDZRz/+iSaxg+5wUcaY+/b43o1rZuT8boi2d?=
 =?us-ascii?Q?lUpYOOQJXy3hLDPEQnBnqyyAyQYSN4ePW74G27senODvLbUp6dy5h980jTJd?=
 =?us-ascii?Q?AGyEUHKoB15eAPS7iJXwjQowNvEZCQqZDJERaJhafRl+S4RnaEEHcA+TqNgF?=
 =?us-ascii?Q?nELmyBIQz0CdkfnaMTh4lF8VvpgNHl04n05jd5tTtsGxwuPiTPJ5socB2/H9?=
 =?us-ascii?Q?uOwayKeMaYFYuc7hPk2xqW9MgK2clFm85mwKRtBlQJhfInQUv5KzGInvd5fH?=
 =?us-ascii?Q?CJEriE2Yu7Tkk5DwA8F987MY1HHf4vJs49z8D3uxB1COdYKS81DpZ1l7WyyD?=
 =?us-ascii?Q?R+xgTB6dULle8CIh4z7kT5JJ0iplV1ruAw2qKWbLNT7nARw6iwWUrL5Pwkut?=
 =?us-ascii?Q?hY5k5ua3btHqLlDWbz/hSrW7vOZMBkMqUFum7rTekrj5eY+zfdGm2zD0X6Py?=
 =?us-ascii?Q?75du+HVsME5WJcig/RnHJ006+Kk6UitiqIpcty/gevRXSVhVeB0VvMDItNke?=
 =?us-ascii?Q?OvzDalOyIZsOxSXJ2DQaB9hF0whjfpeUlk/mFdgb4eIigcjAPh9ePjcFePtE?=
 =?us-ascii?Q?aH4/ByYq3lkSb4W2mA8LM9JfZ54nWiURRGKwXy0umOBqnD/9XxuiHzOU4Fby?=
 =?us-ascii?Q?Wmw8Y9TkrU30G660OY13v/gTCYN7Tnfpt4mB3zf8O2iDJQw6m8HzdyWs0i6g?=
 =?us-ascii?Q?44nnqsWXOs9aUcP7PeIFYv+EI5AR2UavhvquBSZz81r5OUW8zwdl/xdJzyH6?=
 =?us-ascii?Q?ICgRi7THUwKBCLXIetZlEcuV8+qGnKvuI65npd06DyGmefi5mLitsEoqnJcF?=
 =?us-ascii?Q?oM+lTEd9aFksG43OLHBsLpEHUsWr9ghI/OJm1WlAWYswghdRFYhhDTe7Smux?=
 =?us-ascii?Q?GFXExvdPq3H6jzrlH/fHCFNbZu1p7JDn5Ys66jTVEi6lwQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eIo59vQgHC6RksE2UIG/mOlCd5nQ2xNmJaQxlJfGZgzWcDnJDFRpLlSS1POq?=
 =?us-ascii?Q?dAuuIFpFfxIyybYDAZqSR7voCZvfhNGhYCDWNh5h58TGPv+Fq4ROBAnt8rsZ?=
 =?us-ascii?Q?79tIn/9wNBkvQarmt42fxp5Js2UapTRG5x1gGStzP770ewaT6rRqXubRrWyR?=
 =?us-ascii?Q?KgOPMh4SnhDrU3+l9lzzolXhyFgbVGypba3l5xnTCcGyMypP/kKx0ZjmVmrg?=
 =?us-ascii?Q?RK1b0L2mxjwNHj7YhsK0eT+0W8preomZ7tFgAnsCnNQPAu82Ms0PgX+TXYTB?=
 =?us-ascii?Q?z+iudo6k6y72PfnmBxp+RuVloq0mZahaSMcskcOzWq1VmznKjUe6MeRf3m/V?=
 =?us-ascii?Q?mZFQskSuNNffNQYuIRtop49Z/RuLBRigxyd6NRf1CoaFnxyR7EVJ87vQW7cH?=
 =?us-ascii?Q?FNeZ9X4fPxAGK4l+ksz/O8uNP2yOttz+RCLcmW5hKS3ns0G3hsTJ12LSFunS?=
 =?us-ascii?Q?sDjb90mLPh+ZNSL+yg4e96oj4fhzGHlaHJYShpb0sN5gZjivU++woLSTEool?=
 =?us-ascii?Q?6wj1DHJQ/hrm6HJpTnGt2YXs5SDGAmJ/XLym6nAlRJm2d+jAgz2fBpYbQOPS?=
 =?us-ascii?Q?MJRAI5gQABpfzFeyCdHu16ZFPVMlslSuRG2/UbXu0uHdOcUM29yR4IT2nqim?=
 =?us-ascii?Q?DhhfdjmNweOswWOo/vH8Q/qlhEgU25Jkx/5nEZIgOVNlIwK/+aBjLsNYwOUo?=
 =?us-ascii?Q?mSvCsdWzCYFyvsBsTsOPeYclj3NxTpZ7SWrBCxMkokNL5mvZToxD1EoJfwtt?=
 =?us-ascii?Q?jMbslmJkRZBbKj9zRoraQiNTdZCHjC8bUB4p5amadTDV4SHuS4RpgsiY4spV?=
 =?us-ascii?Q?HK1whfgM76b+2cLsgXFYsmodEriZixcrIsljo4ITuBCfUKiYLiY9lFssEyAB?=
 =?us-ascii?Q?qV0Sd70dWO+i3BynIwpgEZZG45hD5b27dOC63Bq9y9chLT+/YNuzaboK1j9n?=
 =?us-ascii?Q?pLcrszX4GQ+3IH+pZ7Yaj9LG+MRA7EEF3qHowPuRdIdes4DcokUdWPOdAGfv?=
 =?us-ascii?Q?uowe3MddQyQaAi4Uicl/AvcBQJ/PIJ6ABVRJoEW9oHIPAhvfRt+lv5X5F6p2?=
 =?us-ascii?Q?+iws3BbEjvQTd5nkXbZMmoBcfjs4DMZ+fkZAlQyaGWcDEKhGJUqSjhtldNJk?=
 =?us-ascii?Q?IQ+ppSIBTCduUUKVVChIQAasjVSkjQB5HfO53eglDu6bR9UxwRo22W3e6rsO?=
 =?us-ascii?Q?cIGN32HdrtSIl+2TCA79cixUOBU0J8z1PRQO0lPEPRJaudIICZtdNWR9ksNw?=
 =?us-ascii?Q?3g01I/LRx8V/WRcFlo4WUpMVTBt5+MlIzINe8YnjyoSI0MQHUqdLfm6/Nb8D?=
 =?us-ascii?Q?f3fuSa5DpMR5zvVaQheTC+btMhxl/Q0gPJ4dGWsTvXB7jAzGExPWgFYH4lnz?=
 =?us-ascii?Q?NQtRc4bzSqy0E0P3bWob2G8Lgnk5bQHFql2nJEuN/ZEpAJTzEQgbWPiLOovw?=
 =?us-ascii?Q?rGIg1vYyCJDq9z4ME/YPG4UEtBjX6B5l0oMa2CI7GGaZcpbWJnvpYR9Q87AW?=
 =?us-ascii?Q?Nrm1Tx9iByvp9HvaLjVg9t23FlXKXN2NQ5IfvL5U6gSA4OkUHtJ4doE1bvhC?=
 =?us-ascii?Q?2fU0EvitvU2RqKvVVYtWdTAPHlAusLTIUFvJ6ECsjewW26uPY4pxOUN5LgJ0?=
 =?us-ascii?Q?zph11WpNxyCD7vIjndUYnqezZ0OO6BMhGK5q/iS5lTMPUKVUwwZfTPJio/K6?=
 =?us-ascii?Q?d246ww=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3982b332-80d3-40a8-8412-08dd511a9720
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 19:21:20.4947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aolr3zHiX77iI/R3OZj1SiiHo5Xt/AJfuNDP6V6Iv5qe2k1zbtsSIvTBB6MUw2lOBZ3lKQjsahWJMdlUmYxfzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10951
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_112127_460692_CDC5BC8E 
X-CRM114-Status: GOOD (  12.69  )
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

This patch series adds support to Run/Stall DSP found on i.MX8MP via the
reset controller API.

I've addressed all review comments from v1
(https://www.spinics.net/lists/kernel/msg5556023.html)
and because of the review I've introduced 3 new patches (1-3) in order
to support resets ids via dt-bindings from
include/dt-bindings/reset/imx8mp-reset-audiomix.h

Also picked up all R-b from Frank Li, Peng Fan and  Philipp Zabel.

Patches 1,2, 4-7 - should go via reset controller tree.
Patch 8 - should go via remoteproc tree.

Later after all these patches are merged we can also merge patch 3/8
via dts tree (Shawn's tree).

Daniel Baluta (8):
  dt-bindings: reset: audiomix: Add reset ids for EARC and DSP
  dt-bindings: dsp: fsl,dsp: Add resets property
  arm64: dts: imx8mp: Add resets to dsp node
  reset: imx8mp-audiomix: Add prefix for internal macro
  reset: imx8mp-audiomix: Prepare the code for more reset bits
  reset: imx8mp-audiomix: Introduce active_low configuration option
  reset: imx8mp-audiomix: Add support for DSP run/stall
  imx_dsp_rproc: Use reset controller API to control the DSP

 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 19 ++++-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  2 +
 drivers/remoteproc/imx_dsp_rproc.c            | 25 ++++--
 drivers/remoteproc/imx_rproc.h                |  2 +
 drivers/reset/reset-imx8mp-audiomix.c         | 77 +++++++++++++------
 .../dt-bindings/reset/imx8mp-reset-audiomix.h | 13 ++++
 6 files changed, 107 insertions(+), 31 deletions(-)
 create mode 100644 include/dt-bindings/reset/imx8mp-reset-audiomix.h

-- 
2.25.1


