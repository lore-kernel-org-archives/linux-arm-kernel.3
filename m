Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB96C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 11:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNnisqkA3exY4ecM58jKECvP62GOtqJ8MCb7q8oxCfQ=; b=If/IsBtEVTZnl2S2pjf9RB6xt1
	XNTIKJW0iZUieA4jmd7QFNdsGfqbQKFU6wx8Gg2TWwqVF1/dY577YwvrGPnlPM4sb4BZ1bPw3s0YH
	c3r2cLoqpkhcoKGEX8mcdADLkf68lR3tJNll8Nv9lynBgqe/1evzTLHm49YBTGlMMlAhipOtsumZ/
	+0TgpUPOrAuVB7fAvaK1mZN7ZNs8Nd8+6E4GU+f7sfZ1y9T3KJ/QFIMKdYN72OMtB7pG6yDYwGvVR
	1de8zAIC3PEdwyghgImzJd681s3mgMsGAW+AnRf+HA/+yn/2H9XaTJ8MDEqiaAjZdfuEz0LTIBOOH
	e9jzRMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujceq-0000000F3wt-3vTL;
	Wed, 06 Aug 2025 11:50:12 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujcXU-0000000F2Ex-23Oh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 11:42:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5nclO/oB7uzJgQKImoBEVTt79pXW3oHDWObM0fj3JkbMhGMG2sCZpx1K0M4pWGhpVdReQ7lpU1Qg9e7BVWnBnMM07y9ZvMOON5FcSTD/0LjVGRIcMmX8uqDgcIN2tmWTat8qaQ+psZyJqCSOEAe/wbodY/KM62UGTqFGCO7vBBiuyJFTROPhEVzf7DkVDasJN5BiUuPdxJzk7p1BeRC+I3VOCGqL/ywRnHf55TAg51VPdXhlfMZi+i5AUKv7UYiY61N8DnY9UMZcr7NQ9k6luEgsdMtPUfI+FL/SSapum1Y1O3ob0/1+GhoDy7ATiXojyImROoOfsf7qLRof5Qs9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNnisqkA3exY4ecM58jKECvP62GOtqJ8MCb7q8oxCfQ=;
 b=Cv0nQ4zCJYMY6mny7VdMmeoo0PHH0K1Z5taBhgmCbmvpSQlZqaPdUS0wDdrG9r2c5P7ZPK8TNByd/a0bMBVNVjBb+0Kqu53O7+V2JFtyh9Y43WQLkpM3yLp1eKQfOiDth0nJgX0Y8DvQG7+HF+YDe4ZarubaZ3LCvkr4gIWv3cyLBUaHd6SAqicmQUjma1JcO92t2ixg0GyvoaIB46VZsktCg+DCoIAPTBkA1zMRANxuhRqlEI8GsmBEEdz5b/GvsbYLIoY2US3UX0SJwLjXyHqUuupUsLQznm60l+N7SZhvPcgfo/b7vpTPrYzQSnRu6lPfJ8cliynt0VcmjmSgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNnisqkA3exY4ecM58jKECvP62GOtqJ8MCb7q8oxCfQ=;
 b=WPlYhv9nJTiTgTwIPpkzuyWYvpGXYAX3GRMb9qsrYLOGD3h5sq7TMsDiGviNVvQv+vtsn1lVnO61UiNTIQayC8enxBuy37HUGnSE+8kl3oMRdZZIKRjsF86DbzebKSIjHdDDba42YsuE4GWyf3249W1e+76XuSEsJZnY0lseMEVYwuvxo3XgR/U73Mq+t4P0outfdPlCNSKmxF9gH7M8mWd41dvpJ2ut4pAE8g8M4mE/RW5EOTX5yltcQMlkQrYNDiaB/ON/7+JlGDPZZKEWVW9gouCIZ8/adCjD4Lt9RVyQq83Lp2fydJqV+2S1HU8i/iRzUM6ZE+p5ufwA54sBAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by AS8PR04MB8312.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 11:42:34 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 11:42:33 +0000
From: Joy Zou <joy.zou@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peng.fan@nxp.com,
	richardcochran@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	ulf.hansson@linaro.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	frieder.schrempf@kontron.de,
	primoz.fiser@norik.com,
	othacehe@gnu.org,
	Markus.Niebel@ew.tq-group.com,
	alexander.stein@ew.tq-group.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	netdev@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Frank.Li@nxp.com
Subject: [PATCH v8 02/11] dt-bindings: soc: imx-blk-ctrl: add i.MX91 blk-ctrl compatible
Date: Wed,  6 Aug 2025 19:41:10 +0800
Message-Id: <20250806114119.1948624-3-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250806114119.1948624-1-joy.zou@nxp.com>
References: <20250806114119.1948624-1-joy.zou@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|AS8PR04MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: f29bc692-716b-4803-9e85-08ddd4de5549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|921020|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gz3456cgRrnPuIssM6S3c0P4+3N/Dy9Fleep6xU+m/8x0xHPkYJOV+epZsC3?=
 =?us-ascii?Q?bnis//MEXeoKlNzmXl6vdeXL13pBFTjHd7t8DJXQQb/2FglAOP8PIcDNcJFd?=
 =?us-ascii?Q?IAOsuoc3edc0nueNpGVebZMRArfswFbTW2n0gFd7KLASB5NcI7iuv56trgE7?=
 =?us-ascii?Q?IAVk60Y0/Z6zyukCmkO27+6StWsmFtj6QEY1tNHO/WXp5D1kAXOzK7KZe+xv?=
 =?us-ascii?Q?Zv/aIWgtj4X9caqGFa3SVsi5VPaQGGI6u2cXrspTzMVdp95zu9JVPo1VedUO?=
 =?us-ascii?Q?O2+qu5xY58AMWEmONt2Sat2RCQIcMZYSf2rmb7qR556VjsagpRPgr2aCevvw?=
 =?us-ascii?Q?Q32XE3Ns/ImDWBeybmysvbCvYSJCqMxqczTYqFjHzs8t093JBT1csOJKLHE/?=
 =?us-ascii?Q?GOoRd4PLXbfb1soC1nWw2jKBIXuEjXjXWX2nahdk0WqMXQg/u7hWGm4foSGe?=
 =?us-ascii?Q?oV2a6N19uAmvZlTJluIFdMjcqkDDy4C2/8lpOnIHIKRbUpkb6rn43GmLucI8?=
 =?us-ascii?Q?RaQohNI8T9nNkka1M81NyRPZ1jnELBsXObqHyNRFAAKo1gIdt4IIOvLJk75t?=
 =?us-ascii?Q?uITK97gdekNUPEdn8ScfeMB1LHWylQAQbxPdxPFDolZHixi4vbi9L0LoS/AB?=
 =?us-ascii?Q?ilumFch5sGzWPVBww3Z/F028YWXa8GDCjQL3uNLOi0/YND/mGz+diuxSqhcT?=
 =?us-ascii?Q?sacU/P95jSnJLuhjdsULejYNwXP39MhiqRtOGEKBckML738CgWHqQm2uxRjp?=
 =?us-ascii?Q?nScIDuB+MZ1asPyfhnBzR9vfPNQEaFpsHm23Xm4TMuZn8A23/E6D6yNO/T2n?=
 =?us-ascii?Q?8k8ED3lbYBvgoThC6430Jo2oy6vCafLdQnrQTVEHFm92IaPLz4yJg3Lx5lLZ?=
 =?us-ascii?Q?NIx/ODDgqg8XIsHrmkiGJej5MWjDk7z9KLRB6COx1HizJGgmzgxIi1e4JDIK?=
 =?us-ascii?Q?6bZW8Z+/PN98F05D+h3V7DMQZyqry1R4RJpBERcsYMIS64J9FoHp3m3/atgD?=
 =?us-ascii?Q?DxLDceiKTZog8va6MBbMSUZ2dyz4r9PBabiSORATRvjzHSR3vCikaZsHq0Q0?=
 =?us-ascii?Q?s/JnVf3AMzLkHLZnUZq1h0E/l/17GcScQosY7hu7etuzLcHdy0ZT4J5isxDi?=
 =?us-ascii?Q?ujyJciyax5YY3ytKtE/OXMqb09utfMGGgiI1u2r7cixAFG3dPZQLUX+Ioj00?=
 =?us-ascii?Q?C10SHWxm2u5yIQ2X04lFUXyUIMWSVFZv0E3GcGCwR3McmosPsdCKLZka3NH1?=
 =?us-ascii?Q?XEcfhvPRXBgMJ6ry7G1yxWNZTOIV++XsMcrYDPtEWy+SUwfnykyqtood+Fa3?=
 =?us-ascii?Q?J3/3pjMotExEDObrBPGfNb0ngEQ1pTC+n7n/0OVVDt92/pyUW7C3V1OxQRR8?=
 =?us-ascii?Q?1rxttZrYVcCEvBjmoIPYLYTSqFcwEOH3zWlxacc2ceU9k1QRwuaMz1JPepGh?=
 =?us-ascii?Q?3T/No446e0pBCC6Jj+R8AIwp4kcmVUoT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PB639rjAKxTiw1UUA8HfV9QtP+qpod/AZRCvP8xhybolsFBa/mN5cqUFyJpN?=
 =?us-ascii?Q?kW5IbRiVglGbUoeTuSsqm94aN8/XDGJzaiHHeA1dMTASbYYXCw/Ec+Ua4xY2?=
 =?us-ascii?Q?qNUFFcgcQ4410GWtIpZ9W1ToeruCqeVh504mQnBYcYqH+ltqa9XqY9n72td3?=
 =?us-ascii?Q?nm7GmMBnhpkJjQbsWCI27G+Vag1Hq6mSlDERMHWWXHawbeiv8/4f3qoiL/aK?=
 =?us-ascii?Q?OjiDroiCqovpfVWTEtNAnLwxT955ujAqW9nsAhjSqzeyciWl3hdd2osxFFY6?=
 =?us-ascii?Q?r7Yp2gndPX2Fxy+lrNDOPhzjmfzjgB+bltUFGcyIxj2bQMIR//BPs2m7/j/R?=
 =?us-ascii?Q?ZTOx8e0rG1jS+Q9/ZFKYGB1IfRZ0zyn2eIBsTW9mdU/dSPQ4+JrtxQ5QFGBl?=
 =?us-ascii?Q?c6Oiz66Pvh/sJ6ElShFlsWlsFHiD69SrOjD+6aJV2nm7yqj5Ksghg43lw/gI?=
 =?us-ascii?Q?q+cnT4pGIVd2I864xZkZGZfQcG096yfYpvmfAAJ3W1bp9cWnFSJxjWmBzd8+?=
 =?us-ascii?Q?4IrREpu+GvVwUuQUxVIl7GMzZ1Ee/TabgmszYG0TK+OVL5QyFHBK+oGU41dF?=
 =?us-ascii?Q?zO/6mX7KSLHTR7tYVRC/KuOcoG/XkiLGOeKLFAUPEZ++Mh8kQSOwX1iwIbGk?=
 =?us-ascii?Q?rdrd58T0YpELtU4oQND7k6oIeVLdrP1zdZdSAxucLfO2mJh5aayRyb/BmXOh?=
 =?us-ascii?Q?UFW+PVQqLM575z2ofN3zft5rYkxY/ILMCTDYYhl/SNkyCgzSostn3WvGaA2R?=
 =?us-ascii?Q?Oe5ZXtkLMZyeblHwkTQWnL6tVLYBBdhVEeyoK+94xa8PimLGq1re+8RXanmU?=
 =?us-ascii?Q?SheYoJjCi14UIFSmfc42NBhZ+tXTO5J6avoAgljBSLfZQ4ptNkpRMuv8tIue?=
 =?us-ascii?Q?/+woIXI0UEvuG+yxcS2etgRn2l9QnMqFKvbftu8as40qpmJXzotYsC4wTvwu?=
 =?us-ascii?Q?YroiEJQa1SicbGesnts9QvPfRxaMD8prtTo1EezMl47+JH/wB/W4kRf+gLAH?=
 =?us-ascii?Q?NsVGbGR/GAw26OaLEhBnSzfWQJeOGKB2qxNmWugNOhcPu4pfPvzuW7jaYSsq?=
 =?us-ascii?Q?aZEeMConIdLaxgQBHSyhN4mTr5la9d/2HB5wwwdRtCmqgLQMpWvkDpPKZ+b3?=
 =?us-ascii?Q?Ie8jMX66UpQuQiLDJ5wlY6syxX799fztrq0TLayNMaU76ADFZuiRE5POYsaG?=
 =?us-ascii?Q?NV6Fn26LGM9C6SaKw4OhNN9XH5ktLIJjPcFXu0GKXHh0m6wLoSU0GPxQVcpw?=
 =?us-ascii?Q?rWru9iUA8fcdTv4ukn96L0DjVP0JnCpuMy6SOvtM2TTmk9RrpBJKlicLutEo?=
 =?us-ascii?Q?spvhAKuM7LfdiAnanyS8Y/0PBt4IM8apZ5IBeIwKlRmH04R5taL4cD4e7JAO?=
 =?us-ascii?Q?/lQp8IQfPDLnHe13aOBmyeu3ZJooz/TpWZ6ExFhwvnfYoNqq4XN8m3FzRspy?=
 =?us-ascii?Q?4e/AFOGtKpmiDfBEO8bJ2GA5RDkCQsF4l+mInFY3lgc6LCaXMrDY2DHMAYXU?=
 =?us-ascii?Q?JhgDp6HZAt2ZlGQpqDp+H1uJ8BuKt722eoVWscPG+iIKcQvWqlIStiEGK/tj?=
 =?us-ascii?Q?DWHDk+ScJmumwZZwBcnQOa3667ICQ2XzfRPkJeb5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29bc692-716b-4803-9e85-08ddd4de5549
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 11:42:33.7966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ev14ikP5taPnwwUyeVF+LosbJ8xbzF50HuAvQCvq7UOvuMXI0uz8CCL0SxaysJMU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8312
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_044236_528940_3E861CA5 
X-CRM114-Status: GOOD (  10.08  )
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

Add new compatible string "fsl,imx91-media-blk-ctrl" for i.MX91,
which has different input clocks compared to i.MX93. Update the
clock-names list and handle it in the if-else branch accordingly.

Keep the same restriction for the existed compatible strings.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Changes for v7:
1. add clocks constraints in the if-else branch.
2. reorder the imx93 and imx91 if-else branch.
   These changes come from review comments:
   https://lore.kernel.org/imx/urgfsmkl25woqy5emucfkqs52qu624po6rd532hpusg3fdnyg3@s5iwmhnfsi26/
4. add Reviewed-by tag.

Changes for v5:
1. The i.MX91 has different input clocks compared to i.MX93,
   so add new compatible string for i.MX91.
2. update clock-names list and handle it in the if-else branch.
---
 .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 59 +++++++++++++++----
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
index b3554e7f9e76..34aea58094e5 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
@@ -18,7 +18,9 @@ description:
 properties:
   compatible:
     items:
-      - const: fsl,imx93-media-blk-ctrl
+      - enum:
+          - fsl,imx91-media-blk-ctrl
+          - fsl,imx93-media-blk-ctrl
       - const: syscon
 
   reg:
@@ -31,21 +33,54 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 8
     maxItems: 10
 
   clock-names:
-    items:
-      - const: apb
-      - const: axi
-      - const: nic
-      - const: disp
-      - const: cam
-      - const: pxp
-      - const: lcdif
-      - const: isi
-      - const: csi
-      - const: dsi
+    minItems: 8
+    maxItems: 10
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx91-media-blk-ctrl
+    then:
+      properties:
+        clocks:
+          maxItems: 8
+        clock-names:
+          items:
+            - const: apb
+            - const: axi
+            - const: nic
+            - const: disp
+            - const: cam
+            - const: lcdif
+            - const: isi
+            - const: csi
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx93-media-blk-ctrl
+    then:
+      properties:
+        clocks:
+          minItems: 10
+        clock-names:
+          items:
+            - const: apb
+            - const: axi
+            - const: nic
+            - const: disp
+            - const: cam
+            - const: pxp
+            - const: lcdif
+            - const: isi
+            - const: csi
+            - const: dsi
 required:
   - compatible
   - reg
-- 
2.37.1


