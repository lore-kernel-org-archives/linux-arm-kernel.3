Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA12CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 05:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VC/oy63vpaYnE8sTVOkp5DYlBmaXUes8ah5NRksbV+s=; b=RvJnJr0m21WBKKeDcKWImI2ouC
	ndw+l/Y/64sXWOeiWedVlyjWB4TkBzOichg3gVhPAXYGqxIFhRc03SaOP1njf1oaqmR1p1ZgX7WzR
	DbDOdbbWG+XNwBbzzBWM/PWylkigUchn70Qx/IdOQ5PQ7d1l6VQY2kbXotVdBze5jZFQ+VMvtIq9A
	0p82iNzq/GVlVos9hOVOQQ6sg4+DiNeDmv1hVioCdtEPoRHtJZXHKdGlFr2pMgUkYk963r7hVIntp
	kIv5UHSDIQ4aNKXfnXGJTbtXLhN86Z431gJVUENJ+m6dA/2qzmryOWdrDW7R78xjFDFAXO/h9SEPT
	O0Hjkopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0vcF-0000000CS2R-1zfW;
	Tue, 23 Sep 2025 05:31:03 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0vcC-0000000CS0S-3fDH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 05:31:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMpUQg54wrc63Xxv6h4vSXGB/4yzRib4npOnwsftpHWN1bjo8JL3QPrrT8crwDSnK28nUZEFg9mIbH3g9s+OQcil5XZtDfQUbnr98iGEkyTGqWJKliTat9mirg5MoIFB1d3wWwVEuThVLBkLIHofBiq2cZG4WfNU9YwVhtCxCKGXl0iKZhA7yH6ikRBIegDi3mXfRavRr4rKcvHpDRFADp076x2M5Hiazkp6mgJ+gkKiNb3bUjjsp3ANQKIlvUAlNuqRKQtredFMHvEG7WKCQ6Wx8/xWwtB/PIuzg7SeKhHmiCCU9EjMzev03g2bRtUz8MBBwJPLsweeWugmcUMfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VC/oy63vpaYnE8sTVOkp5DYlBmaXUes8ah5NRksbV+s=;
 b=syi3+n7vxY7gc0NYOdMjAkCxb+JDDkOmZCLgqaK+Aq4BunyL5Fv/nyE6X8+sY/EZ1mMI/96NEnHoRbt42K8tY50JSIkpxbuo/NtVp8NNZjKWlXFPnuTDp0sVnNfcGCnkr5BN1uAZ+cyygcRFvc3Bu9C1Nw3rmLuRpfyCdzbFLkgOskwvCDM5ncfuwPSCLIn/p4fIMF+6lVDpmpTaml8M/i3ulN8pkiJ1GdzlaDNflMX2qTp4KNBcMlzRx29GNT3mc+THAREFJrY19yIDxwIIXeRb+OGYUhlaFk6Gj7OCHqjb9hlj7HnkiXQBkYe2nmdyNvBKt6CAVZkeA+97BlXWAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VC/oy63vpaYnE8sTVOkp5DYlBmaXUes8ah5NRksbV+s=;
 b=ekZuPl1EaSUBhwUBDs5aCDK3D/ggRb7qTZRrFY8yvXFcat1DWFcYktyJT4i8CtIz14s2X+no9nXzSoZWMIGpusA0TS3HF7SEG+gVHqanob5adKZEg2ElhNiEDve59Tg5vFYZqeAKOY0oDlQs5ZTEEKmL4CMj3Ja2Vo/aYy4p2RAN27stZWzWmCWvMABM06v1sgmRDexB3eV1satKzA7Np8qxA7pvrCuwLXAjZlNOrtqOk9AqTujdAOF6L7O2JJjUZ+8uFxHNrovIqs39nhIvlt6NaGDGq0nFVLu4Jg01rQNjvvrRqpohTPq9iUREk6Bv+JjpLubNcX90VdtuYmP8Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB7920.eurprd04.prod.outlook.com (2603:10a6:102:c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 05:30:49 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 05:30:49 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	lumag@kernel.org,
	dianders@chromium.org,
	cristian.ciocaltea@collabora.com,
	luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	victor.liu@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	l.stach@pengutronix.de,
	shengjiu.wang@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: [PATCH v7 2/7] ALSA: Add definitions for the bits in IEC958 subframe
Date: Tue, 23 Sep 2025 13:29:56 +0800
Message-Id: <20250923053001.2678596-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: f7cd4e94-8311-4975-b8df-08ddfa625a96
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S7qGXyUHd1DptKjai9BX5GwEqhMp8PRzoPMANl33QpG3dgZwy1Z0pE179P5V?=
 =?us-ascii?Q?AR7mNPwN8bDnETyakgSQi9pchAjXJfjJeL54i1boJzS7ABxqhUl3p+BGhaBT?=
 =?us-ascii?Q?zUhti4B2YlkmdCJbprwE3HqjN1asZ58r1qn530C2Hk9PBy4nrzvSwNfPkE3y?=
 =?us-ascii?Q?kNq0TompesPGU5F8r5bCq/B4zObw9WIerEQnxhd8Z2cfCcPNlImTlH4+nBMH?=
 =?us-ascii?Q?IQwmhICYonuVekYH7QbK8Us6d9d8zzCiK2rEZVgtUiSDzh8QVILfaqzPABuk?=
 =?us-ascii?Q?K9D7McMJe0AVsKbRqMIBPhIHHtiua2s8a8akDYuMaIv1p5ABaK6v9sBlyYQ4?=
 =?us-ascii?Q?RZFewvNcmkvnmSOU/yyMDmAjccyZEJ8EZ4JT4IPgydjuu9S2lh+x7k8PXnDe?=
 =?us-ascii?Q?0+OKX/6J3KzcP2s7TT2IyzKp+CxPrcgw3hOKFQYaHdp1N58FFcMrf64azU/O?=
 =?us-ascii?Q?QIOxrbYIP6bgGcGyfP54VyQUkQoXIuxbejwa6SEQzuutIHigf75eN9dYyBag?=
 =?us-ascii?Q?TlNtDwJJSEwC0RXRPhHq047KSLw2SNtri8B19omJhUXLruFYTelwF01NHO28?=
 =?us-ascii?Q?D+fUL56w0oFG8P0q+3wT5UoknLbLZgTqmv/I0yElOC1VhRrsZ+rGtSjJv8TO?=
 =?us-ascii?Q?dliabiUVmWOE9J530JljuEyKvsgXZMoMXYYsamX61a+IueoM+TqLQ6ktTo79?=
 =?us-ascii?Q?V0obynNuroj/DIBHsPvDsy6ZBjQ3D10ca2pAetQLLbZvoUGbu5tufC8Mfzec?=
 =?us-ascii?Q?H57xJVhS3hGF5QcJquCbHihuKiKjjNnlP0206zQfVv82L0yGO7nldxRsQtWV?=
 =?us-ascii?Q?pbr3Upi494CRcry998ETP3IRTBcG5PT5xdkMgXzhs1quiNiB62d2MD/6wnTo?=
 =?us-ascii?Q?sKeuuckhyCQyul8/iLzP9a2ouYCMo3u0zcy4czlJk+7P49iW4u1dgOrK33vE?=
 =?us-ascii?Q?GWnr0O6vraOb7CoPParMcN5GUElGusmfL2FqADk/nF7UaTadiWPA1j7HYUIw?=
 =?us-ascii?Q?wl/oO2+0ulMqbKHZTV2Qn20aCUdSV4w9itmPmGZemJ48xr5Gk+0Z9VOuHzIP?=
 =?us-ascii?Q?QzY8FE3F75yArBsNYo6mRq8CNb4veRQ/8YI/6Jcv4MoOGqkxRCgD/uy9p9LT?=
 =?us-ascii?Q?Ov+elsegEoJrZSgM+jH6ZKRgH3YUdd2N5HTUY5i9A28SoYPSo9ink38LdCye?=
 =?us-ascii?Q?f+a50mpbBeDDWgDWs6oSa7HcdBDuNNacmsAdnDeMecXy8FqDFKf7WFhHsy79?=
 =?us-ascii?Q?0bZL8RRzX76OvWVt5gmObPrs1ypDS/nZpPtj9SYwiU4pSdxbB06IQQgHvyD4?=
 =?us-ascii?Q?4Fv0xr7yicZh1WT6fTbbMQ6B9LizVsJ0aZzjfVbM2EtWk8ZwdT+coQA0dZLb?=
 =?us-ascii?Q?+JpknO1Mvz3h14djlA6a4+6l9umXI5YDQ4PEsvIPofPbMC3XA+7xLcKPy59q?=
 =?us-ascii?Q?f6StSj05xbl/sSbwhGN2vMBBVK1C95kMvyJhrnDJ+tgRmVJNxW509xqTwKeC?=
 =?us-ascii?Q?P1HxfKWgKpIsui0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8j3389r7anISCH2YrWo2BDFnrrf1yGPzPGh6ukNFfmRLRzx0Fd7MahmVatwP?=
 =?us-ascii?Q?7dGn8Y1bZCdEDGO1gECgkq9zEz5qhiel0bvEzEj69vkQ9Q9fPm9E0QKuZfiU?=
 =?us-ascii?Q?rJHrVnPYKyUiH/uFEKGew8j/pnHhDsAOY7J6dGPzCpHX+YeB85hE/3RMm5GW?=
 =?us-ascii?Q?l2/el2B1Rqx7PDJAZvmIVknuzUQxqYzib/3fIDC6SityQ3wG+/kj0YF31uoM?=
 =?us-ascii?Q?0iJYz1vZrgBY3S5V+i7DBebz5bGKpt5fF6b/QfanmoYecLFMaKMsFVPWwTEb?=
 =?us-ascii?Q?VC0Q7IzyeojNrTHxoeHY8mNXiUvM2wTyoyOwQHybbVF2VAcCjO2iGYvr9e1o?=
 =?us-ascii?Q?NdF0VgDNvqu1e7cGrhBtz4V32jUd8iXARrGGFMC2ayYzK4QuQSaQio2JluRb?=
 =?us-ascii?Q?8DafgcJXs3L1zHYROiqQNc3WUdQi/c0VnZjypb7JB8d5QkDgAmRoX7Ph1laA?=
 =?us-ascii?Q?CTAnycDewdJOOgiUrIlI+iFea7SA4Y5UG5sydJA/L1mFM1lkcGiW4df1317z?=
 =?us-ascii?Q?xAG3H1PqdcRlWQwupadbwxxl1AI60j73fHb1YiTlanUiFFfOlobMjAxDB2pM?=
 =?us-ascii?Q?Dovp66byzV//OKgDsAhPv9Yllo7FUKlxyyKIqKLsstI9gpB7FyXiHFnCayuC?=
 =?us-ascii?Q?Ky9LoguPIgpD4x106cH8dY2zbO/+seVYWXgDhLZhXDeUutIaRMfBgVqC0BJb?=
 =?us-ascii?Q?gQ+1vVVVN6EMlFQYsa5R3AqVhaY4w0mHKwFYQDCdnNYWVGjkSxW005uVUkna?=
 =?us-ascii?Q?+eDAknWHMkfhoSOYfoRQVRZLIP36ZvjSULhZ8yEjZjJkK8E2qdH3VEVwnaxD?=
 =?us-ascii?Q?3P0ibieYhGs1ceoykiOvKWy0rZyZZGp8Gx1PthJj3fYtTSXkI+R796AZhtIA?=
 =?us-ascii?Q?H75ThfUN18w0q2YFBiLehf1N4obB0wrm9GYnCdHzrwKOFZoCVOOM3HfyaDkF?=
 =?us-ascii?Q?TEGS7PstY9yHxuaPtgDUJbUvT+XHciN42EM7bSm/RBEOtlhucZ/cJC8oDsSw?=
 =?us-ascii?Q?LAzGpYNK4QRbYc2W3UgFPFuThDwd+sVyhNOZNgFxtH3XT8qzweQCAx3eqWrq?=
 =?us-ascii?Q?m0kWAIWwqAg/XuIPh5cpzAg0fm2MLJeuXEmKdhQ5CCu7dnKmMzo2FXP6XYPK?=
 =?us-ascii?Q?gBwmpTlms+iMRQ08iI5FRwT8qFjc5tEQUWz4KtSAdF9YIhNGkuq4lx9VMxS5?=
 =?us-ascii?Q?GW+w2ee8fvgwXx65xublydqfCaQ1eBgqKmvE5apvnmHF0YoGkAXQCNFCjUw3?=
 =?us-ascii?Q?L1RxJ19VdGuVZAFpkGv/RUk/AJs6OFfYjLg+htJwfGC9C/mSHQ0HhXwOlvHq?=
 =?us-ascii?Q?j7mamqGNNqaG5clVWt18cVe9vZW14OxU9Ll4D8ahy7+XAK7nWJA3JPtYPt/U?=
 =?us-ascii?Q?uOiiDa+ACZAiqOOfQ1IhYwvaoktdJZRJt5dZhSzP17Fr7VWPwlMoqNM6a6Ox?=
 =?us-ascii?Q?yKbp98rgvreBEI2SjEnQOn7qtIuchZ2MX5TRM0Zq8fE42muV65qGez0+NESZ?=
 =?us-ascii?Q?OTwNe38yPyuyONKgEdjkj7s529DQwh7VfQ0VV9f2ND5nczTdmGr8lYysa2Kx?=
 =?us-ascii?Q?iIoKJcPeilQ350/6wQl1EjZx9/QrqE9DzsLOBfEd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7cd4e94-8311-4975-b8df-08ddfa625a96
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:30:49.1991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OpS7DVamKPOlmWwQgr2FgL/Zzxuhz503G1gdMxXKfyMUZXFKnYlSuT5o5wn1cpxZkJEfwK6Br/T665xOEjUkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7920
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_223100_909563_F37E421F 
X-CRM114-Status: UNSURE (   9.77  )
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

The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
in HDMI and DisplayPort to describe the audio stream, but hardware device
may need to reorder the IEC958 bits for internal transmission, so need
these standard bits definitions for IEC958 subframe format.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 include/sound/asoundef.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
index 09b2c3dffb30..c4a929d4fd51 100644
--- a/include/sound/asoundef.h
+++ b/include/sound/asoundef.h
@@ -12,6 +12,15 @@
  *        Digital audio interface					    *
  *                                                                          *
  ****************************************************************************/
+/* IEC958 subframe format */
+#define IEC958_SUBFRAME_PREAMBLE_MASK	(0xfU)
+#define IEC958_SUBFRAME_AUXILIARY_MASK	(0xfU << 4)
+#define IEC958_SUBFRAME_SAMPLE_24_MASK	(0xffffffU << 4)
+#define IEC958_SUBFRAME_SAMPLE_20_MASK	(0xfffffU << 8)
+#define IEC958_SUBFRAME_VALIDITY	(0x1U << 28)
+#define IEC958_SUBFRAME_USER_DATA	(0x1U << 29)
+#define IEC958_SUBFRAME_CHANNEL_STATUS	(0x1U << 30)
+#define IEC958_SUBFRAME_PARITY		(0x1U << 31)
 
 /* AES/IEC958 channel status bits */
 #define IEC958_AES0_PROFESSIONAL	(1<<0)	/* 0 = consumer, 1 = professional */
-- 
2.34.1


