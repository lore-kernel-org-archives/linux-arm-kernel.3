Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3FFC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dkrbWloS8RMmWVILI8F3h2be6/ahN/ZcgIoAQ6eQIA=; b=HJcuo55/uSlFi/HuRT1D+K7iGI
	PN3NDWqZhkda7K8RG/xNjCEqSQhxTOa1BsaiP4rW5/PhZDT4XNOyRZuXstEin2osIMNSw6wF94Ddg
	G2dHNq432cek48nFijGrIE4dN+pfSbp3clVhJsEstwfFl11ENYBfvf9GLGO4MBOJcI0Uqwn9tDEsK
	DW8lzmy8QqIpRevIspRiFPWbv60Qu4INQWcVyLXptgTWwGIGwWNMx24xiWqKXN48F+Lzf9BK7/PJJ
	8I3vWxlPdZqQxMzCAXlyu3UqiEPwU7vDGtXotel3rGcY+gksfgiudCOOeKwgCwLEs4rN84MN3b1df
	zpu97J4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJe8-00000007RLE-2Gle;
	Tue, 18 Feb 2025 09:12:04 +0000
Received: from mail-db8eur05on20630.outbound.protection.outlook.com ([2a01:111:f403:2614::630] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJQg-00000007OJj-3eXc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 08:58:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqKfUkrYtwFbiEbFNR00JE5ssaSDonBNqV75i2hI5Df0hLcvtTniRO3Lnbo2j6zZUpUbyrhr23/MJybGtxtJYDFTtli5flHrYeIPCdY6w3vByqiCV7gxrrvc9gX5i/49Bzpn4/KOZxt6KxI4ac5BdYm5OlxZaDu/BWTorp1Q3dujSxp5I1vujoL1P4U6fSL3hfhqsqcSaURWln6t/naEREEkQfCCe24C4DrLfptJv06NMLZYIv4RYnF1UatAACJ3Y31rE7njb3P6zGjxIVlY3L/Pm1JVYdxoFxto3+15wGy1MJyZd7SDC8cONDL9FDq+C3IM26vcjUWi77DEVxCWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dkrbWloS8RMmWVILI8F3h2be6/ahN/ZcgIoAQ6eQIA=;
 b=A41tMjD+G5BBJNx6HF5/AXXlSSji9/ay1WDGrG4ThVlRm03d4Pa11b5cp/xGGCmuoMAQBQXd21l2Wdr5l8G+vXGvTQnzwDnOKXsz31HiaW/3xpeI1+Wel2sEGoDVm82RkyBdtQ4qYyl0pLHA5vgQfeTM0G/vGxETGsrRFpbJHPW5WFVdpDOzF0eKn3QuFTYDMEZiUa9+y4eCB/ReIMcPa6onQenhD17OHFIlCTSYhoSOjN6laDtVFsOMQi6C7EjIiitngF2rKpPANySdbxIhPDLvOr+3ZlXyySy0Q1kEjOCLNF3Wc3z3U0VDZ/RfIuv4jd86RfluK343g/yUOkYbEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dkrbWloS8RMmWVILI8F3h2be6/ahN/ZcgIoAQ6eQIA=;
 b=Nnb4LWb7oTUVgAvnc2Q5w4cPhqa/QLFvGbNn+faTwtWifCAqLHzCKoGwoqUF2j4vkBw7gA2OGIpxV8JiFWajFkIl3QZ7GLHfENzLlSWEN1vSRDzLNbaLpErNhBphE8Cza1j+RJooZLx5u5V3kHdlDWySfu5Gicy7QbOZUETgB5QpQS3dHBysHDrCcW6ZKvT4rZlYA2gG2OK2BaT8RES7SprEGCTvwX8K62VaSMx9hHjJOZ1xzsY+ZNSPH+0CF0pyCPWy0XwQmQ9CbiIbg2LcLExy33v+xGpoMiffwXAHztcNS5qs4XUu5FZp66oq6vC+LUTahKF7pWzfDXErdtd1nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS5PR04MB10057.eurprd04.prod.outlook.com (2603:10a6:20b:67d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 08:58:03 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 08:58:03 +0000
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
Subject: [PATCH 5/5] imx_dsp_rproc: Use reset controller API to control the DSP
Date: Tue, 18 Feb 2025 10:57:12 +0200
Message-Id: <20250218085712.66690-6-daniel.baluta@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4c9e5be6-268a-4736-8bec-08dd4ffa5a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DVl9lh+RIgONxPbrz29y+I5CCUy7QlKDGWCzjepjOyW1TcbcL5T2KIzvEyJK?=
 =?us-ascii?Q?aq5/EyZ0zIobaLfpDnS31LCvUtU+jhoLbG5S9HNIG1lZZH6avjR1xBOi3kDJ?=
 =?us-ascii?Q?MaJdxxptD8OvrmgSjOGomB51WabjUuLwvN2rfzcYVwKHlKKIQLd/M9dFIdyU?=
 =?us-ascii?Q?XGF9B/A0rXzleo7fcYsvL0VxBW+E62P5e8JJahpoKz+b1/tx/AQEVUhNS6BY?=
 =?us-ascii?Q?R/NC/jGRR6bFDEX2sJcuwbECVGdXu/3J19UoZemB2p9BjqieUh6uR3frYAgv?=
 =?us-ascii?Q?SKUm6+3ZfRbTBFbj6UjkSNeSI5bDKURRHiOYSST0gNprgS75+NB1rz9gi+oZ?=
 =?us-ascii?Q?tDjja8wNaKBEfiuHzkc03khoQpw5S0J/cPVFNwZD1SEyXEo8pgfVLry1dHFt?=
 =?us-ascii?Q?7Zf+utiEXBYrRNbFNf+hRszk5bamU77cczF0fd0VNauEnyznp4BxUmllmVvP?=
 =?us-ascii?Q?u2pxUFroX33/QYcXabnz3VnA3Qcs0qN2SQYJW3FjaqK1mwXdYIx3RvvBUKOC?=
 =?us-ascii?Q?xSoEKvdnFdBE4lf7HE+NoMmo2PV9IT3EZqUHsGep7rlhNQJ5EgpvcrEdKhpV?=
 =?us-ascii?Q?nUfk6ApHkiGHAkb3qLIoOZrWzhsNd5l2YmTSOgug6Ngk1GUG/v6IAUh6qAfU?=
 =?us-ascii?Q?q9xrIUAuq0Qq5LXkiQiK6DD4oQHOqz7BnQuMwL7QTLAF1cZCJZzSbALeRr1g?=
 =?us-ascii?Q?VVvKySaGeqHXGkv9kXiATD915ZjvyvvtgVj6lQZm2giVBCcir/Gkf/cRb+16?=
 =?us-ascii?Q?7HIZPf91zpGtJE/Ni4IqLnuvq9DEn8JEpM+hR+Um5OrigMsTAjSvP1rdmNxh?=
 =?us-ascii?Q?Csxv3dP+/rQEt+RGwdAKb9Yb5aOl4CrxPfmm7PbaTHo3lt4OnMp4+dSO5oLp?=
 =?us-ascii?Q?4I5D1kj/qSLtKlHrj2kcFEph1QhQAnTWleWAxvleXqcpokPU58HZptqBFNuv?=
 =?us-ascii?Q?hKThBqvp0fmt2S38TzBnk57pflVyabgdBMzZ6kcDtG5Xuj/pg08FJUObGBlr?=
 =?us-ascii?Q?R8ckyd0aNdM9rIpTlV+3/wQ7ymqJBoMxSiMLmK4J8L5cp6jXfg+t3Xg7dsDs?=
 =?us-ascii?Q?yGtfGgebQA1jj95UepACKAqaL2Hn+yt/AoPCx2jVexYOvtBOlYWQBLlscNIH?=
 =?us-ascii?Q?tCJVZwS9LU8FB1qFh+KWajUxf2x310tYWdfqZ0qMB0uiph2VKCJznI1Albp2?=
 =?us-ascii?Q?WZaCg1kNcBOG6ZgPKEAOL/lD368KLLAwzf3AebRUtZNOMXmVCvcbdrlYROtA?=
 =?us-ascii?Q?33BK7/AZx4LJQbc3pyKoMENqKpESwkVG9KMFXczPptNx9wng2A3kth2Jn1yr?=
 =?us-ascii?Q?AmSioLpNC2Hez1XGA04gxwn/TWwOL7liLVCDc4mAch7UOzBcUyWTrGbEnfHA?=
 =?us-ascii?Q?e8hRdoizUyD3IGThiR1JRIezllHY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v3ucxzkkH6bbncnzitI3ZtYn1QEXbxJn5+g32u5OZOj5EKBCFRj7Wk17fPdk?=
 =?us-ascii?Q?/kj2QtFP1YkrJ+rcqRrYaIKjK8Sqt6CqsE/ancOwUjrpkwM89Wl8f4vayZli?=
 =?us-ascii?Q?gZIyHUf0h+O0nuqa56oy4HIfs1HiT3SCrHO63ZOE/4RrMsE78QneN+qon7i3?=
 =?us-ascii?Q?uQVxt8v7vOLDTxgzgjux9V0lplSCFiAzC8fSjdGzyPaA6TnL8sK75jjStOm5?=
 =?us-ascii?Q?qoOLQz/OmTN7assXXMynQ6fP1C3gXTFezu37mYFenhEI6KNAqR2WsvZPT1fP?=
 =?us-ascii?Q?WaSNghudOg69JtKRVgTWDb0FqSsuAoy6RCthgLaUeMwC3btPeasho0LsZejb?=
 =?us-ascii?Q?oWiZ/wL6tllrP8krFuc+OhReTnQ+wH5IuL0gQneBfJkjAX9R8EUcJD9jeznd?=
 =?us-ascii?Q?b0D5d5eYA/+MPV+1RbIo5ChZlyiOVij25Fcm0H5IFiUu7DlhwS7m3b+Covtr?=
 =?us-ascii?Q?HNsI6eYu29FBdwYO7E5pODpuD6k/1ZSx0G8LWiaDK8BLAYQsgLtwTbF9mxcN?=
 =?us-ascii?Q?6Ler0fcUJs2505WAboDgFP9jdrMa6GYgMYiMn15qlut0CKUwjDVIXk1GWx6I?=
 =?us-ascii?Q?vCdal/zqkSjYxC4FlxfN4MgX7uxfYTIpjQ4qX2GB6h1mCi9EZurXQoULDkXN?=
 =?us-ascii?Q?BLyIwuobyDLQ00HGDts+SpGHVMtnbLHJU4X+RFI0KA7QcqwIo9xk9x5u1LGw?=
 =?us-ascii?Q?W038NGg0rSk0pRDUF4kNL3Sp6xmOcl9pR/DOmrPrS6dduwRgIOEwUS0t64wX?=
 =?us-ascii?Q?QWq53JiDCvZqS9B8xuLvWmFChSeTIwWDRRXHILt4DJVe+HR6a8h33GzaAGMb?=
 =?us-ascii?Q?KvEYkD5JsOck7bYXt0HJRV9/YWzX5R+f/vbpb1I2DYWtAhbXkTZTwBSjnOwJ?=
 =?us-ascii?Q?hSCvsaWSn8QrIlo+Wu9WZcGGvHLDCiD4Acc4k9K/wcuLf0weaTTtH9IQgZ9o?=
 =?us-ascii?Q?Em1yGUXXwpqwex89DZdWEA0b7VsJrmYD0F8tAjW7a8yVkf8lXQeDhochTIFh?=
 =?us-ascii?Q?mZsQM1YJBPqSXvxCQEo4/fIRK90rzALwWLNseyM9UqMwmlG2DpPjkAy+NWuz?=
 =?us-ascii?Q?Lb7wSjXADKd0VDhxa0pR0kdjcWRlZMV0YKqi5O/Ygafo7fXk5AvqwUItwY6M?=
 =?us-ascii?Q?Et+EqEIn875qBWyFTUTtd5WSTqXPqH3BXmF6CYpk1cbmgAdRrDe+P0B72fH8?=
 =?us-ascii?Q?u06tZbJJF1/zJKnlNKJBXmJznkrbVQH4bKun4XZLRyORJbRGghBX5W4+//2k?=
 =?us-ascii?Q?KXsBYLeb7fJg902ZEcrXp2R7vbEy5JVeAg0X7i9z5HtiRKs3uiXJXENDCOmi?=
 =?us-ascii?Q?1JblUqG5SQb/E9FToDlYEN4BYIsBP4g3NB3iG6lGbmIRipPiS8FSlwzEXsvj?=
 =?us-ascii?Q?UMPBQKBINFH83jxC63tXluqP9FOSQUP1kdyz0vfHol9X707SH3hEDxeaQKxB?=
 =?us-ascii?Q?zKXw0sWAzTkUD/bJO9iXPXAlL6Year9oz823tRkGl8vryrCoNbEPKLqeQ5Sm?=
 =?us-ascii?Q?txEUt60R2GZHWIOxUa2nXSvffvARt9qDrqJ19MS+DnumZsIpp8S/yuT2qo3s?=
 =?us-ascii?Q?KNVGnnYnc3j0LhklJlvWmm3rtGbHuauVWhPoakJZ1Pa/IP3evn0aJNoJhs7V?=
 =?us-ascii?Q?2oe24T0jF8vHWwnpp/7Cx28zT8zeeDW+JwjaR7Hnmc49goQsf1H8n+SPqw5X?=
 =?us-ascii?Q?t5ybxw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9e5be6-268a-4736-8bec-08dd4ffa5a62
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 08:58:03.5392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OecrcZTE7eFk3GW8d6/0yR6yFWo4GlPhuN7UklS2ahsbhrMZmCSEBMPH02yp9W1JgO2YXxWesSy90GW4uV9z3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_005810_912437_52C057B1 
X-CRM114-Status: GOOD (  17.32  )
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

Use the reset controller API to control the DSP on i.MX8MP. This way
we can have a better control of the resources and avoid using a syscon
to access the audiomix bits.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 25 +++++++++++++++++--------
 drivers/remoteproc/imx_rproc.h     |  2 ++
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index ea5024919c2f..2b97e4d0bb9e 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -19,6 +19,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 
 #include "imx_rproc.h"
@@ -111,6 +112,7 @@ enum imx_dsp_rp_mbox_messages {
  */
 struct imx_dsp_rproc {
 	struct regmap				*regmap;
+	struct reset_control			*reset;
 	struct rproc				*rproc;
 	const struct imx_dsp_rproc_dcfg		*dsp_dcfg;
 	struct clk_bulk_data			clks[DSP_RPROC_CLK_MAX];
@@ -192,9 +194,7 @@ static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
 	/* Keep reset asserted for 10 cycles */
 	usleep_range(1, 2);
 
-	regmap_update_bits(priv->regmap, IMX8M_AudioDSP_REG2,
-			   IMX8M_AudioDSP_REG2_RUNSTALL,
-			   IMX8M_AudioDSP_REG2_RUNSTALL);
+	reset_control_assert(priv->reset);
 
 	/* Take the DSP out of reset and keep stalled for FW loading */
 	pwrctl = readl(dap + IMX8M_DAP_PWRCTL);
@@ -231,13 +231,9 @@ static int imx8ulp_dsp_reset(struct imx_dsp_rproc *priv)
 
 /* Specific configuration for i.MX8MP */
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
-	.src_reg	= IMX8M_AudioDSP_REG2,
-	.src_mask	= IMX8M_AudioDSP_REG2_RUNSTALL,
-	.src_start	= 0,
-	.src_stop	= IMX8M_AudioDSP_REG2_RUNSTALL,
 	.att		= imx_dsp_rproc_att_imx8mp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
-	.method		= IMX_RPROC_MMIO,
+	.method		= IMX_RPROC_RESET_CONTROLLER,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
@@ -329,6 +325,9 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 					  true,
 					  rproc->bootaddr);
 		break;
+	case IMX_RPROC_RESET_CONTROLLER:
+		ret = reset_control_deassert(priv->reset);
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -369,6 +368,9 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 					  false,
 					  rproc->bootaddr);
 		break;
+	case IMX_RPROC_RESET_CONTROLLER:
+		ret = reset_control_assert(priv->reset);
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -995,6 +997,13 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 
 		priv->regmap = regmap;
 		break;
+	case IMX_RPROC_RESET_CONTROLLER:
+		priv->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
+		if (IS_ERR(priv->reset)) {
+			dev_err(dev, "Failed to get DSP reset control\n");
+			return PTR_ERR(priv->reset);
+		}
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 17a7d051c531..cfd38d37e146 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -24,6 +24,8 @@ enum imx_rproc_method {
 	IMX_RPROC_SMC,
 	/* Through System Control Unit API */
 	IMX_RPROC_SCU_API,
+	/* Through Reset Controller API */
+	IMX_RPROC_RESET_CONTROLLER,
 };
 
 /* dcfg flags */
-- 
2.25.1


