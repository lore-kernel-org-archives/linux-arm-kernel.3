Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681E0EDEC02
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 02:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23anFRbA3wX7nx7vMDPlpUxuZvY2BLJ7nqAYOoNc8fg=; b=eBS2HhKJdTGOlCLLISOwi5u/XJ
	+Cv0L70XgJOnjx1Ek8bUED80wgVdhJs+0hFvZ3Bq682jnwghJqI5QlYCbyqzGW72VWHjtqNg4xGri
	530EhuponvDOC7IVHu4HcCqoN1HF+uLVuVjxFGGJJTpjAT8GMKQU5VklNqZVv/eXnIvCsUR0T5AE4
	sHjRgG85ATGwqniba4fKf10p0YnMpERn7iU0RP3Jekp+2TZqTldKiKLCF6MqaI5jGvEVsxPkD+9gA
	Xzr0uIDwQ+nsseAnb9ku9ufhTdeQ5j+QCZMvuVdXknqn3Pf5QLEo1z1eMD8HJz41WSn/+nfBP2lo1
	uktH6OBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcRb-0000000GLGk-2EI1;
	Wed, 04 Mar 2026 02:58:39 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcRW-0000000GLFT-2B3I;
	Wed, 04 Mar 2026 02:58:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4i1WC3O04DJwWf6rcJWqYoElHRfHFD0gFd45nVvo8l1bgdwpMR2blWlHX2a8Zl7eNyJMWthHWNsgrXrwfWps6MTrdEG92fjnMeX2OXT6YZw5uAkZN6T8Px6PrO9Dj4cjM3FC+JLuaJaSipbKcngiXksYyGsrpRX9QH7EK+WrGwpDNLp1RdMrs5gb/nfAX/mw0nOQCTCv3Y2s2q1E05Ljq+BSrJFp/4F7JMwpeiquU3HAy0/QR/iF4IYqAIsd9datJxb0Y3YIxRYecGlo5B/oXViVtaLIt1j6mTTzFNW2qDPmhZE1bdmeZX33pYd6UGkVCu1NzxZDZjCpYlhfca1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23anFRbA3wX7nx7vMDPlpUxuZvY2BLJ7nqAYOoNc8fg=;
 b=f+aWNFAxiJ/8mB02bfAB0Yu3n7VCOay1wguFj/G2gSf4E38ZAGBbAT7PPIS055/Iue7fek25m12UilvVq0oX0uLIrCvrcEHlT5xeL32Z/ct3i+yas6JAcIMluHoMIoTASQ5Qa0HUz6LxWy2fVaHXYixoim2ueozMMc2Oxoy6NG1nJUjYyP4Vw7YiFRpZ1I/XJW7sNaFEuX3o3DfHZ6+JoY+MPjzZbHDnNZzC2EP4NyrgOeKHz5ANRaJF6mBsbudhjjG+LNJxET5F64esxqJjkX0wAGUWb5S7eMWkfY281bjQHrskZq0RToJPudc8oUzJnug8Hn+jqHeGbzIP9Vsx9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23anFRbA3wX7nx7vMDPlpUxuZvY2BLJ7nqAYOoNc8fg=;
 b=le9xyeY2Wk7+JqEpsiWSEVIYbMEsKJZr3oMzpwPlJxJnpNfM7mmnro/75Ys6qXusVpD85UV87XtBgqDUBfqp3b10sEFcYmQIkLAZiJvIcQ6Af0t34lUE39/6YQzRR/+kjifxIA+/ir3uIhau22lEhs5kXmTcLEPzYnE/6esUCwnQ/OdN3HrAe/aEmpbXw5GHpoxQLNgWZbmkJPKApIpV2hFfHzqCzTp4iJvYdElWzVeZ8h/rXxQ8KGHD4HDuewlnBC2i+9f3zJL6pZS50UnhRsa+kOY3egAukzsU/EbERG40GWMcUx4YbAmmpYDtx5f/PWu3GSfBfAQqyw8vIzhfMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by GV2PR04MB11936.eurprd04.prod.outlook.com (2603:10a6:150:2f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 02:58:27 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 02:58:27 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: [PATCH v3 1/4] clocksource/drivers/mmio: Export clocksource_mmio_init()
Date: Wed,  4 Mar 2026 11:57:17 +0900
Message-Id: <20260304025720.2583655-2-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
References: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|GV2PR04MB11936:EE_
X-MS-Office365-Filtering-Correlation-Id: bbfd5b6f-57fe-445d-a8af-08de7999e887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: 6nXBi8Hi6twqZxroGNx8EwNubjuypOhAKQL/WEoUc1tGGjP6sHJ1flCO0AVwL8ETu+rSLSZtFw1s++QAHVDtm9V3P1SvRwBswnnTN8l3WLKUe9eHPgVZDhGQQCCJbLAwHLIP4fq52loNMDC1ZczRqIaEHlHAi9FAOHl4q352DAnd91PLNou+yWz2LaY+RhixWN4T9In5viYnn0IXVAiLssvMndIM23Ot0LgQfIVRuVakLFsweRYWlWqLZF1T+lFw4jYHInXdB9r926adK7mE6x+nK5NVSZeRuCcyNY1R23fN0q+fQVn4MhW2w4NX0ovWyx2hgFl0H2I2f3bPIxPIkuH3KOM06IgorOQP3K1QPaRnXyXeinOzIcj9virvFxYE6g+1Ub/z+o3huFJJMjjIKOWaxnG9cV/x6ZJ52N91mhAvPIuPX4cL6EDrqRuOr14tGFHWco1cqbrx9OnF5toueJYfUD5hAn3Xy6VcW51IK3my8GuJPxM+8Y6cMSX+F214XaNDbrsIw7ICpo9VGBWILzFotAjAAzfmi7h82Up/7tuWrhUHf/IW+UIq75xQbKLspcdWuhEKhJQIZQuFTqoZNxKIG8Ybofixb3vcpXOm+XmJUTopc36Rrit8JnvOplGBCcLXv4WdWHq2XG2k9FEGHeL6SL5cKdnuudQDAqBeJ9g6s9jkF4jaqBb5CSl4h2Y42WT5ICpCRFZAzpIdZZb4chFEQ9+zwCelU4mJNNT/h4Pbuxg9Wy9E04S0hGfG79bzJXo4e2wTPcBAw/7cnVL0wA7BHghEj0V1aZEbyCDOpS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CIRijI7sLWpBTsevurWXfKAmn/LrW/2xM1GPIVI9ulba4Koc3PJgZXCHnFn6?=
 =?us-ascii?Q?QV/60oJymjHoDx3/XonZ3WxIgaKxq0DxLEB9ZkRNum5e+tEh60IjZdAQ1LHj?=
 =?us-ascii?Q?KMZHM8/BTDCXW9fRH4SfVX/mVm0JQ8RQlmAX/hq2Gc/C7wQ7VgRNdVAGZgO9?=
 =?us-ascii?Q?DJV5PKgbapKzSrELis1chTx1Ay2fDQnxCv5s5VVD1PGFoKaUbBQ7nq4/5jZO?=
 =?us-ascii?Q?ktcVULT2NYgr0Qhh6RTzcOTQg12hiA65wPQ03CGaK5y+/mna5i0CO2AjV0x+?=
 =?us-ascii?Q?qRgs8VyhHryhW85ZlKK2XwphiaqtsmU8xsPJiAaJAdbdXZ6EOpLW01ngELha?=
 =?us-ascii?Q?GZZ1+3BiQ4Djh5E+NttOvdcSXqMOeT+Sbu7YNRX1vHNQiNGSoa/G1caInM6I?=
 =?us-ascii?Q?P5UD/id43SY1S+OtPDWy7IXy9xqdwZxlh3xcm7/lp2UiytQGt6fLK4hy8mxS?=
 =?us-ascii?Q?OOJB3y0OiKNgESJRAXM2mb6R7lQEq9lOOuiVlNq5W3eH5amGo+VmS00Lrbgu?=
 =?us-ascii?Q?/rebHu+5TOR1uRkcQX29lfQoQsNSJ2LaYG5rA43UiS3LgJiXAeMKdGiJM5SJ?=
 =?us-ascii?Q?PWOgyxxuvlnMNqeGczFfWo3KdiiM6A3XO3Nppv7s+rlaPfrgQVZ3hy3JRAmT?=
 =?us-ascii?Q?acTlSHXP+si7SPKSyL0q97jXp6Wl9ClALX1qZoTzGDfwIJul7UG5GzF6yYSO?=
 =?us-ascii?Q?TkMvVn/9TXLlTupazF0P9YVdzZf/KnfLM6s6cvolXgKp22wyL2mE2AxrrJQq?=
 =?us-ascii?Q?Lsj+TriSAOG2yMBiiwnXvLGDVPzixLwEd0oZ5Yik1RkveX5MV39+lmVzPm3h?=
 =?us-ascii?Q?uwvjUQKosL1Fsw9pbWC9TbtR7/JMj3K4LIPIWOv1h9BlidgyaqeDXWcegNjU?=
 =?us-ascii?Q?pHPt4mY8F4Z0LXfllXfAobFNCSioYpB4DXVu8tVNgIqXYw6cPTkKH8KXtdBs?=
 =?us-ascii?Q?6RpjkN8U+9IIpuwbmjiSmeMGsZt3LiCZKA9Wam5/C8A3Pfa5uDBSB0Zo4+ph?=
 =?us-ascii?Q?AhEEaVDJQE4TVmNrKw0PrF4JEHYeTZeITK70O+o0s++sVZfWCFGn+ncReUJs?=
 =?us-ascii?Q?Njn+9TOc5LL3bXkyme8+g3Y4bwM8RlTKVOF6GMrtpFnk5tJgK55jNKvS8QDL?=
 =?us-ascii?Q?WI9/tS2qj54SiCwEgViirM2PEUuShGn7aFF4fXZa1HEv2dfYlXDctspazsRl?=
 =?us-ascii?Q?kJ9vO8a1G2hJWFqwI3IwO4q/bo9wbGcMyva8uobCabPpatdGE9yF8stJbS3t?=
 =?us-ascii?Q?udfIvNEKicnUo6PBvhRhaR+aRCNeD5adWS0po/5CBGeKqf+1qS5tuhWzqP3z?=
 =?us-ascii?Q?1qcWdVNs6eSogY1daefgLDD7xp2b9eu2QnGlAmKMX4RPq3+8RJ1wtwsTABpJ?=
 =?us-ascii?Q?zdpr05GI2Dn1CSQ/CRMtiblo1JkH/WwKzHGDz2nmRAlYk0goFU9fL7Mka1m/?=
 =?us-ascii?Q?7Sx1S0hoby4EPHhoRP99qELETlSmNZTpjlgrF3gm6VqX8bhATT5BmyKF4A+Y?=
 =?us-ascii?Q?bxmabelv8JDrulGfStQ6xhwiWw/qGmPRscCbD3/ZGlpJL7OpRocV1GeYhL4g?=
 =?us-ascii?Q?yi3zuCgJVAwstNCN0QRm/5FgkkiE02OQg74X6tmmUPRR0lGmqT2A2QUunfVy?=
 =?us-ascii?Q?YoH7n72qFw9Uzp0zCqHSB5pt09DabqdZlwh047n/hKcnj6Ymn3oJV9H5I0B9?=
 =?us-ascii?Q?g+3hPwBy3U5pKoROHPwVZ3fh8SH0Lgj952TJHqMfBkGN7x/pP3M49WKMRbN0?=
 =?us-ascii?Q?3HUuTWzJYg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfd5b6f-57fe-445d-a8af-08de7999e887
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:58:27.4930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbD/DbTfsh7/+onqVc1pGq7LTXqbrgTUGF7ZeqFaiXOEw6AFjGyCtFpkcpIeup2xjaHTPvWb1ITuYZzfegaLEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_185837_134370_820B099E 
X-CRM114-Status: GOOD (  11.24  )
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

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Export clocksource_mmio_init() and clocksource_mmio_readl_up()
to support building clocksource driver as module,
such as timer-mediatek.c.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Signed-off-by: Walter Chang <walter.chang@mediatek.com>
Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/clocksource/mmio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/mmio.c b/drivers/clocksource/mmio.c
index cd5fbf49ac29..238bf29db6f7 100644
--- a/drivers/clocksource/mmio.c
+++ b/drivers/clocksource/mmio.c
@@ -21,6 +21,7 @@ u64 clocksource_mmio_readl_up(struct clocksource *c)
 {
 	return (u64)readl_relaxed(to_mmio_clksrc(c)->reg);
 }
+EXPORT_SYMBOL_GPL(clocksource_mmio_readl_up);
 
 u64 clocksource_mmio_readl_down(struct clocksource *c)
 {
@@ -46,9 +47,9 @@ u64 clocksource_mmio_readw_down(struct clocksource *c)
  * @bits:	Number of valid bits
  * @read:	One of clocksource_mmio_read*() above
  */
-int __init clocksource_mmio_init(void __iomem *base, const char *name,
-	unsigned long hz, int rating, unsigned bits,
-	u64 (*read)(struct clocksource *))
+int clocksource_mmio_init(void __iomem *base, const char *name,
+			  unsigned long hz, int rating, unsigned int bits,
+			  u64 (*read)(struct clocksource *))
 {
 	struct clocksource_mmio *cs;
 
@@ -68,3 +69,4 @@ int __init clocksource_mmio_init(void __iomem *base, const char *name,
 
 	return clocksource_register_hz(&cs->clksrc, hz);
 }
+EXPORT_SYMBOL_GPL(clocksource_mmio_init);
-- 
2.34.1


