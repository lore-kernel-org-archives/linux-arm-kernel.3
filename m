Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC362C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 23:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIDqTYfdqlp5E/uzugEoduQsc5A/FkAiwVoyI5m0dzc=; b=ZlPZhhQWc+0Z8HnqYC8aN7q6O4
	AmPLDkviLXq2CfRXSyabL3v7zNMDJNKcSxNAWQaBWM469QoIJy1jL1tWevdWmq96nXL6U0XVBmd90
	v3ONxr/X98MXVLxx+jHB0WVoP2ajncg5Ady2FHpZ8AeM3wDNuWS+fH95xTQhV0G8j2KJ/NrRwuykv
	e/6C+O25AfJGnebHLw0Gz/mlwT6sIdRZqxa4YOjgOwgBBfdGplBFPbvfVKbTfY76GCddsN0o0PeWv
	4JxHhj1nAz0XsmTmItIPbA7iWhXr0DFxRFhr2qaEMsVLWQEDbUn7XkJ2jjnImMHxjU5jpsj6/Uz7Y
	2KI2U/5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJhi-0000000AYz5-3PLT;
	Tue, 21 Jul 2026 23:16:50 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJhQ-0000000AYkb-0o5L;
	Tue, 21 Jul 2026 23:16:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRwRhqidDG1vxjMz/450xszyJEkha/HT5xbM6jL2C8AjxUJn+3Zln7szZcPo+dmWGWfVKOoEDW9kHSDfYCz74y3neXn5tP1bJlB0n60NAzgEl4QYazguk1ioXzIth1fqC4ltShGLkm9R8Tl4iuHVZyDY92MWu5091qtiULTN8SH5L3ec60n1Pv99nrWgtppvuSdDCRJhU2UjMaijyq6RXiiv4PObOu8XeoIPH2cWkn2Aq6sgvhyRncUIdhk4s/L3A966ZNIZ71jQl9zDnv1qxKSwqN0xmSP2cLxoCbW22XYIJIsxmabJGgSFWE7HK/NXqvi182EgCwwXdoPlFZmMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIDqTYfdqlp5E/uzugEoduQsc5A/FkAiwVoyI5m0dzc=;
 b=W0WUQR6G9cMVxN35/5LwnGRxckAsPPwpKonr/p9UXnrWYjDUzRDisjt02pn87KgAE1sGU8PjI4oV0ieJqWxxk/V3ILmXom1qZ6tTLBJBL/Hp16fswWb/JYzE6SjAvXsle+CkG+qwBP1dq8qn7wFL96E0oX9cqrhS49bR6h7uEhbxsKfuur0+z+RbjlKR4SWgBsdV9T+JXCB907lhc6izOW99v2hePKPhwyMCCSkgSiw3BSpEpDIL7lo2iHYFoq8vjUiIqnrKdxS0OEF2qtq/DX7C3YQeCjijaZO93U2M/XSEN+WtP2BAUh0RllZj9A8eel/VfzC9n2L/KUTc+6E7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIDqTYfdqlp5E/uzugEoduQsc5A/FkAiwVoyI5m0dzc=;
 b=FrtXn3FerZrqZMNtbgE9Ax2aUCsNN0sOtvkJlpIaxpSY9G14RTayJoIEBbpaP/zNXMK9AuwCQqS/ccBrf6uvmUHLDix6ibmn6zjLQAKm9ytmBbIzgJaNIQba3/sYeJjm+PiWrYyGpB1WCW3//vX5mTpFkG1z+LOGV06887wGSAMecbuQiszcBY85UlRKzwkFB4tarFRQf6PhUzlXVRTs3n0of6Qm1IYQyCZ8nhj3yrj0gJCiNvp2fxoFmQ6lX1/9zRVu8LzYz+o4uxkwLu/RTHkNNyo6ucRAhid+20ocSe09Lj/34A5v4BNbn8pTle6E0HU/EafPrL4BKVdu86LmtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by VI0PR04MB11817.eurprd04.prod.outlook.com (2603:10a6:800:2ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 23:16:20 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 23:16:20 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 phy-next 4/9] soc: fsl: guts: add a central fsl_guts_read() function
Date: Wed, 22 Jul 2026 02:15:58 +0300
Message-Id: <20260721231603.67865-5-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721231603.67865-1-vladimir.oltean@nxp.com>
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P251CA0007.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::11) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|VI0PR04MB11817:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e5380b-7182-4704-c3d6-08dee77e12f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|1800799024|366016|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3CDBePcqnV8E4BCtSIp9xeQ6ZHJybYIGAYcfuJ3tRNNFOLyecor+ZXhrVkPuGwNL0nXNnt+hualmqtIz+Ytb637ZIEAUZhBHd9ILwF4rjH6I/B9GJsYeyjypjvJd8GM5m3MuuVdVDYQhn4jtk4ILmqdYLoPlMTqZoxt6sjw78H/JnrOP8lx1Zm7zm9A6JNHPcdsDtTxNz06Gz1/w1l3lGWFfZO22Ay6YwHN3Bkk3lJlRIoUwz3FCw+S3kMso2T1WF9L3gLtWnOx8wcMrPq+dczppE+QJDggj2jQOJcV2YASqMVpE8qK+8C1DOagPGQ7iQMqR7ULOFmPeNZIVxQCJo49opuWuETRo8OkC0sgsuysvHvwp3q+z2UclYQKa45QcUw1eJaTYYrbEpNs7//MXj0ivIsgChLFhCzsURO+qH3N6/i6Rfj0WXyZQLaDmbFPVGFrghp3VtXY4uGm+L/ClUNcT6LbpTi8W9lciWiqW40gu77qJp5LwtjmIPAxFqr+YneP6f+CmPIXVKktIKTqE/MnHN8MVs9nq1sA+8MKciQbm//OwGx38Qz3s+W/LP4cJ37gmdnZExRkoM9LcS5d1T5NYRmV2++9nuMLAVGKzgcskANULtKxhh5s7sJp3xeBik0HmnCDYJoTE4UdylhzPHRm12Or4/iBZjBZ2ebeeerk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(1800799024)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M1a7UuZi6aseiALQHej3jJA3CA/YCFquL7p0bdGakgI5BTtG/hGgG7uDPH98?=
 =?us-ascii?Q?zbTaszRUiZ0BX725Sy+n44ogNvkUzZbrM62g8aalH4+kph6D7KN/aa0BFgac?=
 =?us-ascii?Q?V7kqQiVW8SbJR2BE3yllhubeqUdGEYfM3ShjZidDvYNZkMU7lZcwWwc84f5A?=
 =?us-ascii?Q?DY1ktmTZJQsh1X/xQtvzaHJvinQWWO4BYrY71ibwDTUNFY78jD//5V8VaiAI?=
 =?us-ascii?Q?AdpZeYRyOsw1j1Pb+t1xWfOJP1FPv8n4MOs5Ap18iJnbKrMKmLAi4h2t37hs?=
 =?us-ascii?Q?txjae52onkeE3VU/En2aKZwr0y0ofT5lpINVNsTgsaP0Zsq3VhMxttq5Vv8t?=
 =?us-ascii?Q?eTo6JWkJatKzodS9dfGUhld5u+tICKsNsd/M5fkYmMS4ddfo/N19EJzZHLoI?=
 =?us-ascii?Q?q+aZ8HEfklvchfyKIabljDHa3AMzvNHfFhSXbFv4okB5WKxjrbOcYDmWcwZ2?=
 =?us-ascii?Q?e3bZca4etRR4bC7dx6pJiXUMfyhhEeXyyyOo1yGCRavNNfmQRTnmI5TMo+6o?=
 =?us-ascii?Q?72wqlx9N5DOXhEP9NKy/MmFoYID9u00RRb+rPhrDRmbK3KfsfN/C2nRoQIDR?=
 =?us-ascii?Q?u4Bzyjymsnto9DYE6JN+Xq9HcESnomkmJS6MkLzAXC4JtSm4egVdQjaTAY/Z?=
 =?us-ascii?Q?dqhiKra8V0Ha4ELuLzWG8x9TyRUtm6Bp2Jsh70K6tYBwUbZxdjb0LULP3RRf?=
 =?us-ascii?Q?ip1nr73UXYIo8OYdtnU2+OXihidjIZhGu4nrff01PU0cF7DLngQyyN+cPkhY?=
 =?us-ascii?Q?R1nnG1V1OPpmhAix76RI6LC33F7GZLK+HXEjhU4FLhMMzKWpu4dsLmJ7nbe6?=
 =?us-ascii?Q?IIfQi9nVM7gX5GthoICEqQBKt0fhNm7Zuo2boCqzrFsfV1XKF+7T/Pd0X7z8?=
 =?us-ascii?Q?lRJgQsZA+66lVq21zHA6io8Bgp/pQ9nJN991htSuyR3k3GXkFgpjMd2a9JPa?=
 =?us-ascii?Q?ZdeqBMGAK6uh8KDXP8B6qPaD/t83jUE685MIF8Z7UokWTzBsN1pgsPmo5Orq?=
 =?us-ascii?Q?4+RleEXpFpSJzh3jAc+CNB3pxtEt1bckDenySNSUUmZD/XduRyiqwjx6y4+d?=
 =?us-ascii?Q?5ROZRCd7mbY7gLJ4/A8brnGabEfQj2ADGXHhiXzliieEAVNgz/kV79BhWKcZ?=
 =?us-ascii?Q?aVTy8TsCSAZLAAjYuRwSDYVEdqLFpaiMna31ROIsuEZ+sIREp4QLVGoFSjG3?=
 =?us-ascii?Q?MxGR5GQ9hAvyXmLemYgHI24ZF249O9OM46AAhlxYf2Hqp8DklgMsm7pHVk1E?=
 =?us-ascii?Q?22MPBkvZ4dPWWRnv9ZuLtZlw8FOvOoN4+3+lMkrrSjzcycP+B2mB1bAqoE1B?=
 =?us-ascii?Q?F8SVzCzsI2b9tSzNbW04HabCyeNMo+93q8uC/yJ6/716IQml82W88gRiJFam?=
 =?us-ascii?Q?1TOJSlsMlBbBu4HBvVlrzWWYXt0EGnDCwv3ttT9jQHucU7wakzyjPCih2POc?=
 =?us-ascii?Q?49Xd0OTdCjQ/3uklK6FcMDogWTC9WBczX1gRgKv0YHgart2Bow3vYPqP1K5B?=
 =?us-ascii?Q?AME1ltVQQafFtm38mhe4RHTh4vWI8hvmerJUNE1ZQyWumtyKku0vvgOUN0w+?=
 =?us-ascii?Q?nbcJk8mVlBxOngyiyejvkDdebPzvHAfUki4xJjQtGzJX4vM2V5hmATEvyApG?=
 =?us-ascii?Q?ZJNfy3DdV8VXSOi9qM8QeVISV26NjjPsJdSIx0D4sdDlqZ4e1DCKAHhzNITX?=
 =?us-ascii?Q?bgjX8JtF8iOg8Gi1ZMGQzpIsYqUkmPldhksNg+G25BwVhNxrfHpasHY3Cwv8?=
 =?us-ascii?Q?wzc3tAk0vw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e5380b-7182-4704-c3d6-08dee77e12f5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 23:16:20.4086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dh20q1nYq//sKbInIIhx6rlVJc9b7A4jSi5Vdoi2D0r+6phDwwske8PfyFk2k5Qul06aAxAzXE//Rk4jXPv2ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11817
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_161632_341763_BAF34529 
X-CRM114-Status: GOOD (  13.33  )
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

From: Ioana Ciornei <ioana.ciornei@nxp.com>

Add a central fsl_guts_read() function which will take into account the
endianness that was already determined. No point is duplicating the
if-else statement each time we need to read a DCFG register.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v4: none
---
 drivers/soc/fsl/guts.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index bb65b62ed805..8e5c3cae811e 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -111,6 +111,14 @@ static struct fsl_soc_guts {
 	bool little_endian;
 } soc;
 
+static unsigned int fsl_guts_read(const void __iomem *reg)
+{
+	if (soc.little_endian)
+		return ioread32(reg);
+
+	return ioread32be(reg);
+}
+
 static const struct fsl_soc_die_attr *fsl_soc_die_match(
 	u32 svr, const struct fsl_soc_die_attr *matches)
 {
@@ -209,10 +217,7 @@ static int __init fsl_guts_init(void)
 	}
 
 	soc.little_endian = of_property_read_bool(np, "little-endian");
-	if (soc.little_endian)
-		svr = ioread32(&soc.dcfg_ccsr->svr);
-	else
-		svr = ioread32be(&soc.dcfg_ccsr->svr);
+	svr = fsl_guts_read(&soc.dcfg_ccsr->svr);
 	of_node_put(np);
 
 	/* Register soc device */
-- 
2.34.1


