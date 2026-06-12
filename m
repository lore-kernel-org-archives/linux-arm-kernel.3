Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D015ACD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 21:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDAb84mvwzzdH4QlbWfj/UPGvGpj+bM76a5W0SC0Otw=; b=uGkNGYCORMrUtw+hM0JbTycy7w
	DDyj9GeGYLTGsPLon1B8oj7agBMxrc1LTxKC50zDdF8kkFOaqc/ZaHWybp6WgmgsszUwt8x1OwAx8
	YCkVdwnYbWSkzKMexcJZKjA1XsKUW1Re1wqkRxSqACEyiBH4/0gmgDwEE3YK1m8DBs6dO1JQfdKJO
	y7dPlme3bQaESVOljSyXgO39j+J/VFH8/nE4D1OCDP8X8vo6g0Nny5n3XZ0Y3/8Na593rslCXoQ6l
	5NJrhzGhGNrDTlENQQYatEb4sOo/9d74cFXRI1SNN0v0KggxHbNNjDqI3RSnfMHEqt7M1KOKGuejs
	V0qM6BLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY97w-0000000Ba9A-3gFg;
	Fri, 12 Jun 2026 21:09:20 +0000
Received: from mail-northeuropeazon11010049.outbound.protection.outlook.com ([52.101.84.49] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY97q-0000000Ba48-2wGt;
	Fri, 12 Jun 2026 21:09:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gP/124kNaDXxQxtQWKgIgalGAyJzoWrhqjyPDNSglfC04nDoVVbz0m5SUEj1tfgKzkgCIjpMrRq9po50tWWB1dh8kI/8UdvClfBwkqsjJK+Sno6n3NdweY8VG/rF1xKpuL3cRsgnWIgDql7EH/ei1LKR+CtJlXcM4LT6+vdbRiDsPrfcs5NeSGqRkiD2sQqcHn1Zunqv1AqycVyhgcxo+sDMabG8FvfbTyi6TWU5yeBHGldOYCqA3jIW/9QMC+AbXO1zqac2C3Muo+IQ/67kskLFuLgE+UW/MYDQ4WJNFY5eZk/+D4Nrw95fezcrG7Zi9p4Dxo1q0OKq1IpfVtuPqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDAb84mvwzzdH4QlbWfj/UPGvGpj+bM76a5W0SC0Otw=;
 b=O8EyKNqPfwsU2K/UpOyGJYOl+Nu/Lv/wJToWSlhRZRZsuOV2fHRXhoyQB9e0S56U3gAoLxrHGUNd1vEr1VlcUr1iuu5APsr4fxXCQCDynoLXK1ZO5qA6X/RqyzwJhe0oouLq/2mY1/xleM8EYzWXMfiSZ6ZaJl73miRBgZeWDSElCMoxLti5ta9cq8Ad+FRuYMpot1FubLWSi1lKqV31PXSP/XT0mTokX9ZQJTB6qMKBRsTdQzTxSkWzVI8/QFzatE5UnrVKsEayTKP7E5LCbhHypdZcgkmNfuO0lPHH9Ptknjf+I47k+CP2qVo7qO+Fq/PhhALpA8Ea2ppmeiT+rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDAb84mvwzzdH4QlbWfj/UPGvGpj+bM76a5W0SC0Otw=;
 b=DLA0RiV889CUTgtDDWmqzcTXNh/xFxPOZH9GCAJikaTrHNcR0rnISSW4ou0AQzau0t5L8k9s7Gcwi2cQ2X92AlbEzs/rkGXbMNmTizqSxTodr/U+qSJNl3Wy4C/BdDCA7aoEkCLCwkKzIvSbhYMTUKZS7smARGDTAfsSYXwPweijfuvDidWA+8m1IZxV6c5ZOipqh/2Bbx4Z2hMULHtr9y5qL8GcGZpZ18tANl7JQ4qYo6I40IvJeIO7ncLbAB7YLN87uXlwo6ozzxOcIRRWhoj61TW6ozM6uWjZeoJSKPNeNB8BrBHyWtDhDAmYiRTmv9WBtDv0hi5GnheMHirG1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by GVXPR04MB10969.eurprd04.prod.outlook.com (2603:10a6:150:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 21:09:06 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 21:09:06 +0000
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
Subject: [PATCH v2 phy-next 2/8] soc: fsl: guts: add a global structure to hold state
Date: Sat, 13 Jun 2026 00:08:53 +0300
Message-Id: <20260612210859.266759-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612210859.266759-1-vladimir.oltean@nxp.com>
References: <20260612210859.266759-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0002.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::9) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|GVXPR04MB10969:EE_
X-MS-Office365-Filtering-Correlation-Id: 446c93e8-a68c-4c55-6448-08dec8c6d6bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|10070799003|1800799024|366016|7416014|376014|56012099006|3023799007|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: BDZIvG8zUJ5AZZwdhF4VwdKq5e+3Tk0Igf+lILf6N0o/EdPiANQ6cjsPr/NIoU1vdkSXu4nTX5QxQpUbooD5iLuXEMfCBkKH0nzFfSPGYbFIDytYzZn3zL8CJDNklvRV4RuzaEQADtp29eGvXkE7RjiUig66nO/MeouqkCi0iUZ/Um5PxugoVaPdvBxn0P/5M3ru07W8+KWpjEpYQwf7vXqmCyDjF4KQVQ0AulJQWw6i5shcWR2lQ3ctGW3pJvw46prbsakXYMJX+5cv3D5O5wVkT1BqSX4HN1ycjknbbQCHQgbNn966g7jOTgrMTwei4Ie7lDJgOeKDZXk7B5N7NoxJpIJ8Gl3JfP3PtHi+ZjL/LXoOV9E3Dkun2imj5WehNAGKwxSiU/b9gHguCVgU6DHIXjs94B6WSFkuGkrVO4wH4esakyd1vlbmvZN6mylWB193MeSAyHOoMDRolZlH0k6HoxYBfzYlAfseProwxlgBAkHFWN5wP3LmA3+tUh7BgFyvRtjxzYoMMZ+UBYUynZ+n7/ev3IAGGHMynz+2PmclKJFf3olazFfXx9+A0Tbtd/hMIJqGW5V9mBgtFMtG+HLZZPrHiyFDB0E1GQNxhDM1PAAB8p5NDC8J2hD0w2nna4ivLQ4P4dfNqVF8KJGV2iQjwM0m4nYpe7vSbXOzLZ4ppYuEfodz32gCpGepp12j
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(10070799003)(1800799024)(366016)(7416014)(376014)(56012099006)(3023799007)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vGZYtuNugtO4vSYUAo+R6bDELrSA6S3culpP1C5wupM9g0F4//VLKO1QsbUq?=
 =?us-ascii?Q?c5UmBiPs8l2LQ0bor/6pm9WAeVLEid6Iyknqj26nofbkh39/R5jDkJZDTVjY?=
 =?us-ascii?Q?A0sAe22lbsJHBr/XApyjZ9KLf3ub7bFDeLbDIYdLM2UGdaqMKyQL3TDyigsa?=
 =?us-ascii?Q?XWileVSUvTUgCdgZzryXvuVR9tFZmobQau7srCCVhfz3tGCRnFZoTIaqRprI?=
 =?us-ascii?Q?p+P0kuaJmmlRByK+9ukAzes7QfOAcRt80YqHc5pFI9mNI6sJXsWElO3oLNZa?=
 =?us-ascii?Q?vXanXlstBd7OgcCgyr6rKr3O43golYABGEmyDN2+0ERNJs+3MA9k6+stVryp?=
 =?us-ascii?Q?HAqgjHw4fbiwwK+Y7Fzk2mZ7jqHBs/mwZTEnfoXoj7rJRkSBj3o2VU4zA7ys?=
 =?us-ascii?Q?Sbx4vj/9QbEvPIZPlq40NVKGNXombne1NDFGSHkrEvft2eXpNQPskkPEISE5?=
 =?us-ascii?Q?is4IHBXQ0Na8VzpRA2Y1vVljXm2M+I8R639PBcdlWGuwSO1G/UvpLL+OfLn8?=
 =?us-ascii?Q?RdxarlsRh+7VOcIoqMzh2Fh4H0384fCOwpsnjFlMqNbvIprr2qsi8HPpJO6I?=
 =?us-ascii?Q?WEPz5awx4Ys9YZd3pBqbMPXAqJQ5JPoG6v9Phg+lFYP782i4meRivnXON1RN?=
 =?us-ascii?Q?Wsh6iy9wL02ZNoJdJLQYghVkCRZ9X2V4mn54detfGWm5wrxFSqRfXBfOWDbE?=
 =?us-ascii?Q?uoDkgGYfpBuDJXGpcp4UCxRyY+8eO0HaZVlT8rCOp7yF0ovcN27V0278Ba7Z?=
 =?us-ascii?Q?y0lPKNS1ogzKc8UWfd03GJnJfd91XHXAO9u6xse6H8CFQJwKLC8+HR4eBrJx?=
 =?us-ascii?Q?cfE7TD1Mc9319xPZvEQj7wUj+vl2wqnqZyJeTW14jPKw2hYwqRtUvr56Zox5?=
 =?us-ascii?Q?aI+jhiPSDAG9eXS1k5rzrt31y//QQdAvTF9qybUSH7ZDqkTJPWC2R5BTFDhq?=
 =?us-ascii?Q?fk+g7vV6Lvl6K3xu+8wvmwQ+u2OgIv0OIVw6jm3eUI1lJSs9jI2T016K/83k?=
 =?us-ascii?Q?FExaUUYGal/ymIHh2hG58s7AWf97QQaO4U0ZiXKR5eDL0eByUDBHT5dAeNEa?=
 =?us-ascii?Q?I/Pu/GrIUJHbhfQyyvRSr1mBAajcJVe/tyDaQYwdWg3hhgLw89OQtmzb+5QP?=
 =?us-ascii?Q?xgR2OrlDm7DlTkbmD8dGwaM1OObEiIgxMecGtCPSq+U8ZM3qtCeTMaEc5dIt?=
 =?us-ascii?Q?X23pHNbRDu5zguw2BPLeVnz7nD2+x5218QTzi1yHMPGVHh7o4I4bBKK+33US?=
 =?us-ascii?Q?pJhczYWCLny07pm/eZi8BlFe7ND34uIURl7CTcu4XesiGfvIsnG7dvITGxHN?=
 =?us-ascii?Q?fbmNaRnOdBU0a9CCEAheVBE1xU8rSH1eKGzNBjXsIGVz3zbtBJA4IjG4YxDi?=
 =?us-ascii?Q?LM4b72MYGUann4Wgu9uYHDGk+haVFaU5OYX0bckhzwFw2A0o7JXYuW5RXfRq?=
 =?us-ascii?Q?UkU3RMz8JRctbernLYcC9xJs5jGVQm3FQa7/cGw7xSBTREwU5FHYM7zNWx3R?=
 =?us-ascii?Q?4rp5ZMhgD7TSxTnrCVf8Minyb8Bm9TARRTP52U0IfEPmhhkFmGUmrRLRRNpD?=
 =?us-ascii?Q?HYlljd158F7qLjeaMW0FbkeR4/eDlk4dSoVl3Ha2PAYcr9XtFJe9T+U2wSQK?=
 =?us-ascii?Q?wnmeWBIgkpLa3aFNMQUr7lzJgiPDhx1gWy6W7vt0E/LHFuVyNxIpATMUCuGC?=
 =?us-ascii?Q?VXgWEtCSh1jEQtaIK/KLZjUapsMdWBE6jxd7HyjzNFhtg8x/GJh0PL3HtxHY?=
 =?us-ascii?Q?eqWAU19cWdCFLWNXTXOPE0Xygm7rPiXJrjHbTvoWUDJFLaqv6zWG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 446c93e8-a68c-4c55-6448-08dec8c6d6bb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 21:09:06.6210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YzZL8HhJIu1HYXBhkyyzo6L50kgvkd9AT/0ZPcWZ/ivxgtN0og9uVDg5J/f/R9MfhgDWXghkDJiFOjo/ZeqRPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_140914_741901_2889FD93 
X-CRM114-Status: GOOD (  14.65  )
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

Add the fsl_soc_guts structure in order to pass information like base
addresses, endianness etc between the init time and the runtime
operations (RCW override) which will get added in future patches.
There is no point in mapping and unmapping the DCFG CCSR space every
time we need to make a read, just map it once and keep its reference in
this new global struture.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v2: none
---
 drivers/soc/fsl/guts.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index f87ee47c1503..a0a52a5603a5 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -106,6 +106,11 @@ static const struct fsl_soc_die_attr fsl_soc_die[] = {
 	{ },
 };
 
+static struct fsl_soc_guts {
+	struct ccsr_guts __iomem *dcfg_ccsr;
+	bool little_endian;
+} soc;
+
 static const struct fsl_soc_die_attr *fsl_soc_die_match(
 	u32 svr, const struct fsl_soc_die_attr *matches)
 {
@@ -187,9 +192,7 @@ static int __init fsl_guts_init(void)
 	const struct fsl_soc_die_attr *soc_die;
 	const struct fsl_soc_data *soc_data;
 	const struct of_device_id *match;
-	struct ccsr_guts __iomem *regs;
 	struct device_node *np;
-	bool little_endian;
 	u64 soc_uid = 0;
 	u32 svr;
 	int ret;
@@ -199,18 +202,17 @@ static int __init fsl_guts_init(void)
 		return 0;
 	soc_data = match->data;
 
-	regs = of_iomap(np, DCFG_CCSR);
-	if (!regs) {
+	soc.dcfg_ccsr = of_iomap(np, DCFG_CCSR);
+	if (!soc.dcfg_ccsr) {
 		of_node_put(np);
 		return -ENOMEM;
 	}
 
-	little_endian = of_property_read_bool(np, "little-endian");
-	if (little_endian)
-		svr = ioread32(&regs->svr);
+	soc.little_endian = of_property_read_bool(np, "little-endian");
+	if (soc.little_endian)
+		svr = ioread32(&soc.dcfg_ccsr->svr);
 	else
-		svr = ioread32be(&regs->svr);
-	iounmap(regs);
+		svr = ioread32be(&soc.dcfg_ccsr->svr);
 	of_node_put(np);
 
 	/* Register soc device */
@@ -263,6 +265,8 @@ static int __init fsl_guts_init(void)
 
 err_nomem:
 	ret = -ENOMEM;
+
+	iounmap(soc.dcfg_ccsr);
 err:
 	kfree(soc_dev_attr->family);
 	kfree(soc_dev_attr->soc_id);
-- 
2.34.1


