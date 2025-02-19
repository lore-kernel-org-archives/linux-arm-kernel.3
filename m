Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D42C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 19:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqZSJpLrcpGZWcw8qdjiFDPLAhhKvA719XjuzQ5VDoU=; b=iXrOo6kmhRivUwzVveBK/jHkkX
	o13rRr9a1zW0O1qI4UN18jaVkgaoRehjXdAt7nWjce8X0RmmlYBjGyHT4L621bSDn0XyyD9TQ5eFn
	r76seJkLG47CZNsfn3BcjB3t1GR6jeGr/8QxXe2rDdmSKSey4XKiaubRAbI6kJ97bteUz1pcTRYfr
	sD08uQqiFDQPLezpgHal/XGyWd44En9Vz+72pVKYOVj/O3DLrrtHpUktsKUOyw0z1X1jYK5W9WmYD
	92mPtwWUQHIyCFj+6y/avKC0UncsSmtsuE2mVpWuMltvWMIANA6NHfvQqsS/LqinQxjpKUZVv42cK
	YMu2a8bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkptI-0000000EgTV-2vgW;
	Wed, 19 Feb 2025 19:37:52 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpdY-0000000Eag6-2Ho7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 19:21:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYGgckFIm58g5YS9H1nvnvyi39mBtsMXopuE8hT/0xPGTRScSR5NqZx6Kz1488V4jo6/SpaGPmelTeNveKTyiJ+yXnfoP0h74QgFU0HCepoVj/dPRzokR6co6AkdH5hQ63I+ZJoUaL+TIl/GgoyyPvno7gPncy3/T6YC0to4K+6kZTbeuDuxB/tXua9LWZA8PQJzQrHsxVWO+lECmSpk+MpzJ1z38chQQByKl/YSKK8XOQWVos5NyI3ZWJFCd4/1T9jikwOwROeggY33SzzPrLP4VEmMN/ODBK++UmvjmijfEi1xzR1+2M2daaTHA5JbY/ndFP8fo2tI5O/hTNASCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqZSJpLrcpGZWcw8qdjiFDPLAhhKvA719XjuzQ5VDoU=;
 b=PExyV5cyQ9WADVtIEdy4m6O/YlXWHxsEc/D4+4IN5wb4kcPve9EcblNi0PeV+oYMJJG39HpHRa87wfctYa1exQA34Tw1FVKLen3dpVtQyWoId/xTVzkhMrDVF+ttQtjNvuwG6sNOp0h4aR57jCbOY6FU7VoN3E767dhTrnuq4CnQg1nCTuxvgIwCpOhAW/HQfB5YFIodM+DuSxOyr7ulLUBrzz+T/kT7oSzroGa1Kd/9mWQ2RA8t9eiSbS37NzWzXiBfZqnDJNTg2kKREIIp0HYDyEyt0nw91jP0PCc0aqiliQTvupgfFI4/MWGUu24tApq7fC8e+Nl+wpkbDMKIJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqZSJpLrcpGZWcw8qdjiFDPLAhhKvA719XjuzQ5VDoU=;
 b=GjmrmTZxGdVpwp087+dPnwCkxWddEu/NN1kOAwkSgkeWsr/BqA9O5/a04y2pYFa/5iE3nu4b/VMbEBWJfFhtb2/og/ev22ilWUzN15P8kFRGYBtbHl6ZwX4CLth3DJqdArvEMvUA1WXqVU/I/lw4MUGhWeOYv7CVbZ6OnJY1tfPlcBm8g1fxcG+5Wn6ozwZZSkey6ocukrX7MSZudzKHAGmYqDH0bjN9FDtsiDREnKST+Qor6t9iZzoD14BJ0/DASW64rE7ovUxsgbJwAldeOPhr6Bs/h/XUd+26xpgkIsMGQPJger0AH8HChqpdgIRy0SU8qBKv2gKyuANkBYQ1xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB10951.eurprd04.prod.outlook.com (2603:10a6:800:25c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 19:21:29 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 19:21:29 +0000
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
Subject: [PATCH v2 6/8] reset: imx8mp-audiomix: Introduce active_low configuration option
Date: Wed, 19 Feb 2025 21:21:00 +0200
Message-Id: <20250219192102.423850-7-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250219192102.423850-1-daniel.baluta@nxp.com>
References: <20250219192102.423850-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0267.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::34) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI0PR04MB10951:EE_
X-MS-Office365-Filtering-Correlation-Id: 37745722-b490-4a3c-48ad-08dd511a9ca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LnuxNfSOksxCRRblr0IPe4UoMxYt7PajIcbahrWYZeqmXLNhfenM42olmO7n?=
 =?us-ascii?Q?mVTY7dQwwA3UrB6pQqJJCaZmkFXCyqWlE2d3UI4sobJIXtDgpHViUKJ1AFvo?=
 =?us-ascii?Q?WjB9y0b/MyLlfm6dELwVgym4VPheJidE4GBciwO4G1GDgzXUgAOGPG4yxDeJ?=
 =?us-ascii?Q?+UHlZYiStvthQOi4oHBarimncz38kjcM5oMJ3oQzLZ07bJdpulJ2b16fwRZt?=
 =?us-ascii?Q?wJUDRs1pi8s1+F+GWpWn//J0L/qiacDYxIC7sQJQKH7KiHXxKScj0MO5m3NS?=
 =?us-ascii?Q?o0sIm+2jvhtOZv0jPeeN1/FGiYIH6mPmKKBwfh85R9XBIYofr5WWKDDR1KbQ?=
 =?us-ascii?Q?UbgQBF8DTSe80d6MgHicutYrHr+53XwfM4PnLQqAwhoIgQ176CtJEqMXo6D3?=
 =?us-ascii?Q?rQcmkqiYOnfGwZUWzaieqC9CFjxGIUABkjecZfssR0XZFzAtBlUw8GPlDaQE?=
 =?us-ascii?Q?dA5i2qRsDZ3zsn7WJMzAAriDGqJHYl3CB22yp4ckMzXFnE16/ssQcVkKuwa7?=
 =?us-ascii?Q?/WYL3TmSvJaqvF6w37Vn3zGeygkW705Ozi/fcmFn7cgG7iUopArSaAYK7rc0?=
 =?us-ascii?Q?zvzktCP3z+VodJSHDHKoGm5rjyXR501FDuD1DfzDCREIlG+aFsZX6dQhWQOC?=
 =?us-ascii?Q?VO+NxuWD0uxI931sxhbyNLInEnbIKn+BtUXQISli6TG8kiU1E17nEwN1+iXX?=
 =?us-ascii?Q?c1hsqd7nSVqm+D5F7jilZzn6u8lee99Gq2zrmFZVzASMAjoLKDRLY6RgnJVX?=
 =?us-ascii?Q?q0RBJgNRu/AS+ICak5eNmeZsaYSz9JlcbY3JqFbEXM/zTAO8TKMH2DlMa4ZF?=
 =?us-ascii?Q?UNAC+TXxjOok9yHq5FQezW9iIOaIfu8STWQ/H9nGPmiwtwkl90K+VhT4chAc?=
 =?us-ascii?Q?m9TOp07D+WtGTbnXACgz+FN+yMpYkdVijnuHQ+VwpheRUC6hoARoiWIaFgSL?=
 =?us-ascii?Q?y1+NdzAE97+hll0a6Fzi53n2rLU289qBkxMLU8nFtkffkVJGQIWxnev8gxJ6?=
 =?us-ascii?Q?bkbhlQPqf8IS8QIxoDQqOWmzwdOdsjXnvae+Cao5mRqJhIfBEDHPx2FWbJKa?=
 =?us-ascii?Q?Z3WDIUYiu/kGGSCcddtY9RwAucHeE1+W4ApXnp9sBoAljKVYKIRVV4MlUJ2q?=
 =?us-ascii?Q?1aHAQKnvnvw0XF5MaR2Qv0nFSRsez3fCzvt1QfUhn5vAy4csheRsOSY4KM5N?=
 =?us-ascii?Q?1+LqLHaU4KOgkAIBNQVKIX6meZkUJOoGiOfY4iZJ7qkhALMgUVZtZN/O7YbX?=
 =?us-ascii?Q?wkL0Z/aKOHo+JVc6Bc8Xu4yZJkZ/bfWILQ0IPkATuw5G8TWaOmeBHvFsIxPn?=
 =?us-ascii?Q?PHS5rrMNIKSvAuZd59EPOYqca6uXnVL1utCCxayLFG872nRQvqrgs7nc70Z/?=
 =?us-ascii?Q?VNUnycBxeyNAR6KT4kKK6q3lIohZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?duaEtgyGNF3I2ojfUnZareWjH0yfMLJarDwqvHK0vA/xh2Hucvc8uK08dvMO?=
 =?us-ascii?Q?1nZgf7PCJb8BntukvtVUODVJ8yiMMHdOPx5WSTEl6breyExahNfNUDzT15bB?=
 =?us-ascii?Q?35KsWfZWwku215zLVMMvqm62Oikn9QM1IiTsXtngDdF4Bsnc+jG8vgDaX5rJ?=
 =?us-ascii?Q?/KerDQzQswHpnWY3AODzUMP4W6bWWZP7hz5/HsDJpTERclbRxgsciugDcY3Q?=
 =?us-ascii?Q?3NdkVcz3jTUhA3DpnJW8SGS9gkfbJIZzcSM0MFhKVz53YuP4PwkR4Ky8Zwcl?=
 =?us-ascii?Q?BTUJY+3gS1IaDBhme2UGJ3cfhKmKRBha/SMARd8Cadu7dFGUxzraBqs5U8On?=
 =?us-ascii?Q?dGEplvGaixinQj15+imPNDEVSQsHpCfUUrvQk0tMW/GobZE3o5PmYkNmU/+4?=
 =?us-ascii?Q?y5PoNNMuczFMb6V59hJUuIp8oTZcLG1bUzqdxyFfd9tb6KdcPDe7WUMMHb56?=
 =?us-ascii?Q?NbtXoplmTEtzxwUjQBbt1yx7PyqX9VPat/x6Nik5b6O7qXI9orPtIIE444Rc?=
 =?us-ascii?Q?gwMyvzyobEG3Y9ud8O575Z1jkym/LgXKNpawpxP1Pd6pF+DMPkQbCz3/Z/DV?=
 =?us-ascii?Q?WloVvEKeFIzCIC4u3d4lpM0HIQ8SLBobs3ABPywRzO5myEZqKu/qiOFzeVRD?=
 =?us-ascii?Q?/bXwkDxxOu7CtsBYswDid3tEUPa215DlfxYQLpVE8dXNdWIrJpgW1CK6Zjd6?=
 =?us-ascii?Q?lVYx+3euicYF3fVOesG1rZhJJtAU1r4tpVqmS0f7BNuqjaQPHsUMP91gWeVH?=
 =?us-ascii?Q?RhOGAuFRVQ3BE2XUDmzO3IfKJSe9rHfT/VbwuI3weHqHwYRKFdPoxbJaDRGh?=
 =?us-ascii?Q?fgi2IojUnB2o11LiWH9fAzYPwpnLQSUTZVLBq+4FRP365PRt/V+TCYtN4PdH?=
 =?us-ascii?Q?QGKDj1aXgPSRvgKF6NqnwUGYNbzeKAM8lcqjA8gY88bSfltkkVa+EgKl1rP0?=
 =?us-ascii?Q?/GRXhZ4B4dUxlSK3SynmBa/xjsuADwSJxw0rAHyCTPy24nXzMsZ+bth6Q+v7?=
 =?us-ascii?Q?w5Q++psUFxvjCI93W+pQymPjOMKxXUGOC5Ls8ht9wOuz4lx7S2WdUz7QaaRh?=
 =?us-ascii?Q?eSSBdu9CV6q2Bz5S5JhnC8xc0yTLpRZnIYRC4xtdRNcUeJX2EIKs1Y9c2qsv?=
 =?us-ascii?Q?M63oua90bu2ja2TegEE7RMb4C6rePGVY+GDNJaH47J2deQKfbn58rUqm7kJI?=
 =?us-ascii?Q?kW3GrVxS83hkCwmNMYKQrBWRvhjT8tyApBwFqVJ6e9pq/sFkEvegXCwLoToA?=
 =?us-ascii?Q?lrJK6Kgv1L/msS0kSQD07DmMzXni7QVl/Aji6L/ljj2Z+TTEyN0lBil8H424?=
 =?us-ascii?Q?acT1o0dWp119Hp1oepN8TbV8ZnFK7SjFkqEhc8rJVIP0BFSMuR+BZXicgCyb?=
 =?us-ascii?Q?GBPvy+hFF35dtkMUW3ihzeIhi+4jZeiJXMHuZMyau7pxyMkkE4F/LteLwCs+?=
 =?us-ascii?Q?qFu5xKdPkSAA6ZVnFzuCk+GYlgrdnWiDHtyoFlwWq+a9tBDBl7V83yuKNJpw?=
 =?us-ascii?Q?8Kmvo9eWzph8KyPBbnZSxIaE03v76rncqAsq+baTbpA6fi8yxSWwwqR5pYsI?=
 =?us-ascii?Q?xooIg6IVcqqTwVDHhKnG86UB+I1EYvPM0caTfdX38hrhuSFxOKYBG21EQVQy?=
 =?us-ascii?Q?IFoTyJh4UsKoobUu1MBjZZredeI/5zMo7tVki+wQbpsEl8IvBpcSrilAe8iu?=
 =?us-ascii?Q?OSMdUg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37745722-b490-4a3c-48ad-08dd511a9ca8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 19:21:29.7365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bahk7JhKAt7koaWr6b+k3zD4n4FfiNz239srAYn+fVGpO+qqBknctQpvPw1hf39CjRDwgs4EVI4jBX8V59PosQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10951
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_112136_582852_C59D22F2 
X-CRM114-Status: GOOD (  14.78  )
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

For EARC and EARC PHY the reset happens when clearing the reset bits.
Refactor assert/deassert function in order to take into account the
active_low configuration option.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 41 ++++++++++++++-------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 17f78ccc7820..42539cafbccc 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -19,16 +19,19 @@
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
+	bool active_low;
 };
 
 static const struct imx8mp_reset_map reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
 		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
+		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_EARC_PHY] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
 		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
+		.active_low = true,
 	},
 };
 
@@ -43,42 +46,42 @@ static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_contr
 	return container_of(rcdev, struct imx8mp_audiomix_reset, rcdev);
 }
 
-static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
-					unsigned long id)
+static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
+				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
 	void __iomem *reg_addr = priv->base;
-	unsigned int mask, offset, reg;
-	unsigned long flags;
+	unsigned int mask, offset, active_low;
+	unsigned long reg, flags;
 
 	mask = reset_map[id].mask;
 	offset = reset_map[id].offset;
+	active_low = reset_map[id].active_low;
 
 	spin_lock_irqsave(&priv->lock, flags);
+
 	reg = readl(reg_addr + offset);
-	writel(reg & ~mask, reg_addr + offset);
+	if (active_low ^ assert)
+		reg |= mask;
+	else
+		reg &= ~mask;
+	writel(reg, reg_addr + offset);
+
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
 }
 
+static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
+					unsigned long id)
+{
+	return imx8mp_audiomix_update(rcdev, id, true);
+}
+
 static int imx8mp_audiomix_reset_deassert(struct reset_controller_dev *rcdev,
 					  unsigned long id)
 {
-	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
-	void __iomem *reg_addr = priv->base;
-	unsigned int mask, offset, reg;
-	unsigned long flags;
-
-	mask = reset_map[id].mask;
-	offset = reset_map[id].offset;
-
-	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + offset);
-	writel(reg | mask, reg_addr + offset);
-	spin_unlock_irqrestore(&priv->lock, flags);
-
-	return 0;
+	return imx8mp_audiomix_update(rcdev, id, false);
 }
 
 static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
-- 
2.25.1


