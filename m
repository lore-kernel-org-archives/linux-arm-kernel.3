Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A8BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5kxP57gvCSyKlnuJbGbgrfo1NK2Clbbav2Sn6ncZKM=; b=46Ft7QgvKVB1P1UPhABz0HYuaA
	na77Hau/e3RD71zAFe6hD5N6aEbp+a3G8LuifyEp+ONeYHFS4BO9Je6C5EKJeGOs1Z+DLN9iqoIn2
	TxkQbnkvmm77rdU1H18F7BA8/pgHwJ7FiDOzuCmXEtyqLpSS3O4bUoz1omOpBmDi4cScLHY4qeaPB
	IuPx0LFOaTXymKOq/3wJQdlI9r3nB/wfrO4zozNUeHJL5IxsDoSCtEfRnzqDLU6tdGN52NrEhOCNO
	RP8aID9PjmSKy1p9uI6S42OlVbzhId/psBM0/GrzbjNK43rGk76Rxg/Ie6HBlUcjtiFuhzc4LgiAI
	UYY+MLVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJch-00000007Qxp-3lvg;
	Tue, 18 Feb 2025 09:10:35 +0000
Received: from mail-db8eur05on20630.outbound.protection.outlook.com ([2a01:111:f403:2614::630] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJQf-00000007OJj-1yH1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 08:58:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhPD/NPVYbFewSeX9X1J+hDv0FqldK7kuNbmsrt17bGgEjFv16y80fg7N6TKc18dDJVgQuUu0oDO50Ihoi7hodxKEYpx3WzaymiJ8FMZ7bXWNzLGIn2O6sBPB/YqwlsMv/VD/nHagJ+ABW9v38OpwZ29Zw99FZUrwOk9fm6AaOVkQohon67A0HXkOjUlnXOnP9BIDENfz6VDedgNzEZL1YD8gW5AnBmSsR7NwtGv++/B8//4NvZdt8cIHs0SMI47ycIvCSlPPb8VrprZtF5zT5LXd5mKYs7HGCZ3Cmqmn2OXF1d8zrhUY3HSc5c4bxlHSqCDZxUvUJbyWxEoGqhZRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5kxP57gvCSyKlnuJbGbgrfo1NK2Clbbav2Sn6ncZKM=;
 b=WmHwtSlfRW33ZIg+rEIAsN1jCRV8jajK0jd2RQng3KoH7/2rngZu0Lv6NYZ5IMNoVxfv0VIQiIyeqDKhe8C6XWQbOZgf99ttdyMMdN5bSJYSUlgRQXgjVy/EXI/+AE95ZYyzFLsMlcwmb8R3iWQ5ZGZSnAwrQzXnWXSRrFc4zbD65gw5mRp+Kmcrq8zKZ07p92NSV7LaW2ZVsfYAI1uLF35aaRzEr2+JRe1m+YzVicLx2zZ7RKIyX026HWM50IBtAsRdiHT16TgCJ1CLTo1/9hHZw5l/RT4er0PZq5M+LBUEknKozHodjqgX5bTogf+z61l6NBzHkwdAWCSu6h2Btw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5kxP57gvCSyKlnuJbGbgrfo1NK2Clbbav2Sn6ncZKM=;
 b=fJHE5y4EEqK1IsgN8BgihfH0GNuSGOl3rnsq4DN+s7Pmlc5jcddRr1Ru5z5nROsOA9J3Xoxk12oItPlYwXkBtWCWdtJBUN+YDPsOi5SP+EjevVF+fvA/Y+mKpae0TGnU4Vsepvso07Yp1q767nwpEt5a4Xv0XmNViYxcybh2hibIJzOCBYNyHdshoAiPQIBwJfQPJoYJixtchuR2MMF7EYOi7TRYZqajGfHekgjYV1TNl1zmCmWa+xJnA2kbOGWFnCDUcjLKpNbgb4GzKLfoOp0S7m1rShZTduBvYF6hJZIyLET3YkTSiOhcLy1wZl6GU1TjH8KlYFH4UXnt3WLJfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS5PR04MB10057.eurprd04.prod.outlook.com (2603:10a6:20b:67d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 08:58:02 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 08:58:02 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	linux-remoteproc@vger.kernel.org,
	iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	Frank.Li@nxp.com,
	krzk@kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 4/5] reset: imx8mp-audiomix: Add support for DSP run/stall
Date: Tue, 18 Feb 2025 10:57:11 +0200
Message-Id: <20250218085712.66690-5-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250218085712.66690-1-daniel.baluta@nxp.com>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0286.eurprd07.prod.outlook.com
 (2603:10a6:800:130::14) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS5PR04MB10057:EE_
X-MS-Office365-Filtering-Correlation-Id: 400a47e9-8a19-4d6e-f75f-08dd4ffa5989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O3DlmufOQnVJLfau8e5W9NBy0Dy00KPHp9hoePdakVRJoIUZl+Ni/KUEIGY3?=
 =?us-ascii?Q?/iKCkazVKnDDo5/ZjktmSLmuhBOZ01GAYNHjS1WpwCbQ2NN7BufbRjUAjmh3?=
 =?us-ascii?Q?wdL3gKP7CDtcBcMhKT0k/5ABK5cYteQTfQke4ZXkmPaFIZTWaUP8/Wvwndqh?=
 =?us-ascii?Q?wVllaJP43NsPmhh7nfTxFdwOSWY0qANyya2EryzM8cxKdaAj8rZy8CP5W1df?=
 =?us-ascii?Q?EWvAVwxHf3+Vf7uo206G5hUZUj+cu/ipL3YvgO/c1owLvIlfyix2BhaNuEaV?=
 =?us-ascii?Q?u9vwArZli0hGqSbEzjoWdZFwPwMdtZfb9QakZS4gcwKR1OQQjCHqmTZVXajc?=
 =?us-ascii?Q?J1E2jldccOxe+FfY6HHPgKNidrFt5MTxNsJvpkgskkLmZJKClSElLJ+puCGl?=
 =?us-ascii?Q?8oGntWp18v15XEUF5O3YuhsE6k3Edg4fBcZByhF1vpqC18CmXcnsifN5XHLU?=
 =?us-ascii?Q?tfbmpZiqueI0UwmaUZ7bbWna7mkPT+AXqCwdTLsLkUIDquYHEpLWU5pr0rdC?=
 =?us-ascii?Q?KTbHFk0MiX9q60s+9ij7vOyXXYIjZ0l1vvvlxmgKmAoGHTMeKMQ5Ofwaat89?=
 =?us-ascii?Q?5oBUOBeeYPcJ4LQhmDsYX1feIb9uB0Plj+9V4Ht0liQfmfHDW+dCbWZu4r0S?=
 =?us-ascii?Q?O24gU9ybNY1x9edt0KHpm6RNK1G213laQ7LLK1iYE4elU7gmv8z86gU9dg4n?=
 =?us-ascii?Q?h3BYnhCjF8CrJmxHyvXrVWVJK1Fq3dY6WzPdL/t1hZQvuwp9Jg1+JunAqidQ?=
 =?us-ascii?Q?WMtbdowauUjQqjQuz23OY33Ga0haZEFWIzhPyQMeOetsOmntOJ42ChIu6eGu?=
 =?us-ascii?Q?bC80cY4QIov10fEIj9QJK1ixB7LkqnOT4FF6HpEgPvkKJprFgEEZrvPLnBhQ?=
 =?us-ascii?Q?a6SbukcHAq7OlCYfnWvA8yEKnm/OJAypRfA1PJWU5uVTQbrEkwamIdxn4zGL?=
 =?us-ascii?Q?YG6CKCWY82ga7MJZrfFo5JB7oJXtQ4H0vghG6y7FnAPhIP9/g+JaYngtF/Dh?=
 =?us-ascii?Q?Qhfo1NUjb5qQerLeNZk4aPAItpmOQ2mFbziqVWIIiVHGh52gtjtlaN9YaTWD?=
 =?us-ascii?Q?LgwjaZ5m0GJwsZbt0eblgv0xQzM5yFcDpaOXTyp7v6yG/eczD3fJonD2gYdo?=
 =?us-ascii?Q?pYleY9qMSlMicgrB02pksHxqnMDio2xMScHnLnpW2EqGsW1GMIdyNMTs3Wpi?=
 =?us-ascii?Q?cIExTFa0ne3RstKioyzFWd8/tCgydJt8LXrbN6/j6pK0nZuqC7EB6Cmh1xc5?=
 =?us-ascii?Q?Fi7juuQfAk9HRFjPYeGwLptAn/u+9eJd7sMSHrA5fRJ1/EaOZJwWUWrE25s9?=
 =?us-ascii?Q?BPWocjrbOgFxgmlMxp3ezB/dnteLYbBd1FSQu/i8TjDasi09+TpIK43waHb8?=
 =?us-ascii?Q?bfWHhA6/VResVKun65Zk7pd9FIRz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mKAJaG8H6NvSuR+Qb1GvfI0SFurKRFr3beR9D7ZMfL+Yqy3NzwOLXkoIr3d8?=
 =?us-ascii?Q?l1gEe9dgGR52ues6Qfj75CbToWuzdtmp8sUNtERaO9vJ1sohYg4ymQGq93QY?=
 =?us-ascii?Q?uFRDfjuNP1Fm3t/cwhPAq1/bM5womx4OIvwYFhlOZhvVNPlOXyHBENv7ybxV?=
 =?us-ascii?Q?EgZGthknPJEOt85T0BNnOc/t5iNekQB61TcUQTY4lYDofltvY3PiNAKmYjSF?=
 =?us-ascii?Q?1Yk81ZRteSVBtUMTDOool7tFd/pH+gqo4xm+wTIoKMqFyaOcd3MqaMarIbj4?=
 =?us-ascii?Q?hARMzMeRsz1YOurPH6h/Xaf7Nf8DhzEuFi8IPpZdaVJ0uGOdTb3FShKg4ofF?=
 =?us-ascii?Q?TiN0EnB3S7ReOkHEFrVmw3LIls+y4o4j8daHampsl5mDoWETI4a3KdpzKcxP?=
 =?us-ascii?Q?XeJf4jqdzhxotwcbbBYndw4OxZT6PQ6eR23gL3AJZFak4keiWDteLCCwy970?=
 =?us-ascii?Q?UGi1DHuLPQBXAekX2q8rQwOqk4T0qqitGBvmOtEb4lzmEPF84drLvaSZdtET?=
 =?us-ascii?Q?rNlWsVReuDMXDbJ7hlo/OTWzF/Ar/USK3QUDHN1YXoETilb+ET6oCphv7NS7?=
 =?us-ascii?Q?QdOZRMm3yfEzPzl7C7dfLklfVaSPHytzVtLyD4Vxhpo74zryV4XAK8MpIXmE?=
 =?us-ascii?Q?JHSIIR7/SmNrngD3yEXD2ibefdWVLhodsget2NtZGxveXVRh7Trhm8SxSA8G?=
 =?us-ascii?Q?JhjGWycc+NpsQ1Ri+YaMP/bgH2Oep3Dr/+BNyk6aec9n0oeUSFlkkGBKsOrV?=
 =?us-ascii?Q?GQA9mwOFlRso15atSiCNIirTolYMeV1GqARp6AaQCjNKvOdxmjCxDfD4daSo?=
 =?us-ascii?Q?ZOPvymHSDJB5/CYo5iqXyqWajowYRUUeLYUweg1SBV2aFZaYY1gQ9/vIV1YF?=
 =?us-ascii?Q?PO4NjkWZeTgztt4iAs8B3jrS6zs0G+tooI0z4XCY08hCtOlDmfToDyqaSnxz?=
 =?us-ascii?Q?Jlsw6IRaEPIAe3YPJR1oE1oCLTfhtrKG42zxzQ4eky7y0o9Yv+0xRB0pwmJ6?=
 =?us-ascii?Q?/sOCxNgLYlUaU2moqHY3h48HaIfysmftz29x5F6/y9RhLoESf8fBVG+y/rz6?=
 =?us-ascii?Q?XE9jOvCYmjBHP2Rhvc00IiNnDRa8rNuBHSae+VPa3bV7qC3OruRWQNL6t7XO?=
 =?us-ascii?Q?CQjrjUBAd5VYhLfE35lVYflYXOCnU1HPIrrUykQjp0v6IL0tMLHxq0NhJ3fu?=
 =?us-ascii?Q?njo94XACFoWhfZOrh8ana7zXqC3enx1Y7KH81O0+iriix7FFBveZpMicZhNG?=
 =?us-ascii?Q?mfCs8xwf4ZxHRdnJlxH/zIx2qiy8p3sqcYrd9w562hz6SfhGKdLsY/MFUyHC?=
 =?us-ascii?Q?qPggR1y7y71vYLHHNCrWXj/9UVdTNJXBXgbqt2M2d6X+hURkbewOKp2HgFsr?=
 =?us-ascii?Q?8j55tmdJLIA3+l4yv+JeApE+VlNxXxEEPmT95lY+wEo/D3NaErd5KFrJh6U8?=
 =?us-ascii?Q?6T/AKFV9T/OPg3jzc6hnz8pWl9zBSVcBuNbg5ea9zs9CRTqIEEMT8FTIS6oJ?=
 =?us-ascii?Q?0zaGUHAT9GU0TD4qaOJHBBnGZ8sS3TPg84rnw78tNy4zxQtA/bx8aZVPMRxs?=
 =?us-ascii?Q?Avw4qqhi3c+icn80kOe3Vv89oY3rhiUxVdIYFLnvomMu4DU1tabi+3ahrE4j?=
 =?us-ascii?Q?kDK4529eddJBOaI0Ji3dnI84+a6VjHRnVIgNDgmWJXejJSwo06jsnNlhPd/h?=
 =?us-ascii?Q?3W4kAg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400a47e9-8a19-4d6e-f75f-08dd4ffa5989
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 08:58:02.1006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpKjQHHSCif1frWpYGy5qe+EFhMEI7FWl9ddXFAiM18AW7yzU7iGdoHEPiq8Hi93WMotXLnkmG3VHqoJSpddNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_005809_509189_EABFC37A 
X-CRM114-Status: GOOD (  12.86  )
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

We can Run/Stall the DSP via audio block control bits found in audiomix.
Implement this functionality using the reset controller and use assert
for Stall and deassert for Run.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 8cc0a6b58cbc..ee56d52a7278 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -15,10 +15,14 @@
 #define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x1
 #define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	0x2
 
+#define IMX8MP_AUDIOMIX_DSP_OFFSET		0x108
+#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	0x20
+
 #define IMX8MP_AUDIOMIX_EARC		0
 #define IMX8MP_AUDIOMIX_EARC_PHY	1
+#define IMX8MP_AUDIOMIX_DSP		2
 
-#define IMX8MP_AUDIOMIX_RESET_NUM	2
+#define IMX8MP_AUDIOMIX_RESET_NUM	3
 
 struct imx8mp_reset_map {
 	unsigned int offset;
@@ -37,7 +41,11 @@ static const struct imx8mp_reset_map reset_map[IMX8MP_AUDIOMIX_RESET_NUM] = {
 		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
 		.active_low = true,
 	},
-
+	[IMX8MP_AUDIOMIX_DSP] = {
+		.offset	= IMX8MP_AUDIOMIX_DSP_OFFSET,
+		.mask	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK,
+		.active_low = false,
+	},
 };
 
 struct imx8mp_audiomix_reset {
-- 
2.25.1


