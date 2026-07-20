Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35765C4452E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKbNWjlj0GZzffPL+87mG9kIpzvyW6qUxqyRKw0NRAk=; b=axrvvDdUhnK0nqLuToUYLxu4c+
	7y3juXrPAleQi+s6Bb+qw0FOcJnsFMMXzMDVxQEufWc2gBQtvcaoSRGirK3Wq5h1KGIHXyS8LWoYj
	51cFRZpsjOV/hUxxTpnX5wiVwFJeRTEG/Cvsxh+BydwH2IWf993KNdWPsEcjDqm22ODu9PPUKwyXL
	xIBehEYisS2nN0pylDkdhOU7cWFsmKR2MahINI9LZfQ3eLoIgAzE+gBvp1cypPLQh5KT8E7FBLhJi
	X/pgG0TT6kC0yGKZHJvQTVVH4jPtm7LJB/hzBe+Mg/IEYeTr8gjtDTo0k+JuerkaBb/8LBB0Y4Aav
	9xfmlwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloBG-00000006qPY-3WYv;
	Mon, 20 Jul 2026 13:37:14 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloB7-00000006qHF-3x5Y;
	Mon, 20 Jul 2026 13:37:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecgJUNqWTlJyD43YhH2yvxLGZAP71RZ37BCWk7jEAXoOEQ3FX8IP8Lp5A7ct1KHg04+fpmKi0BT/SNplKc10t+HDdIc72Ju0MRMsGHuxV44NJXaLEKNaLCSPfhU3Dc/hNot8MxVriE4d1DTBfMHX7EyRVDoz8hr0VpzDw7epudQ58cor3dTfRL0DM3CaYfEYvE/WAVh1f8/6tMPrwbvY6xzZXWhrOO3n19Nuhr+h9D/v7Xgju0O5+opkcQHosPsq9Ak4IC/7r3+NczV+vI6UPdewnhUeE6s9i6uzrLe+TfgWSGdJbd74r2T1/DllS5Bj+NlKYAypHUJ8zJSF2Cq9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKbNWjlj0GZzffPL+87mG9kIpzvyW6qUxqyRKw0NRAk=;
 b=lL0o9vUWSRoq0Fns/m9K2zImYnYz+nuaxvoV5m6cOOvpdXJ8lJi+WUJgkOTtUQi3H7TqIuPJkHxwb7A2He0tg6FrC4FCixFBNnIbOI5VvyhrWpm26Lkg876RxlF5XdNAhcube5FDJOz6R1ffJeJ4EC8fC+SaIFr70AfN/JevYJK0mouNfHHl7qJnjLRKMeoSXei/h2pGPQuNyarKNAPAceCsz2R7pMNnps4aZOCYuSx6BRo6WI7wZAazF1FxKS7gUY8j2bAV4uR+AGZUnXxE4zfreM6yryIM1Q39qD5bQmkWNPpOsJMd7B0fWGLw0KR7359Gy/uiNxEfc3NL2tMkSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKbNWjlj0GZzffPL+87mG9kIpzvyW6qUxqyRKw0NRAk=;
 b=ec8c2gNSaUzegKfY3rE8aeFHaMHqkZb5fwQKFV0RiqeBBxvnEDXcwgpG1zMjkf3O6qPQekwNkJ7+jpioz2CEXjhbVH5VWiyOWCuQk8/5xCU0/9P7GndxamwkzV3XaPNvXhbz1zf+3miqvkxhVXcaLyqr7liLWFfY6Q6wFKeidDwTGoXa/M6VJd6BeIu4uMAI4M4zrnbqWxMi3rVD0mIvl8yg+8Nnle5CuplLSy5hIUtzVYaF5DOsYj+DuefAG+QIj3Q/gQqc9lCtSOVLpEwDRJVQNbfkOMwVGw//UW1JZkBmANTP1LjtX9c9hkKbRlzE0w8IrxDlEdeVbiJee9FM0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by PR3PR04MB7259.eurprd04.prod.outlook.com (2603:10a6:102:8a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 13:37:01 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 13:37:01 +0000
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
Subject: [PATCH v3 phy-next 5/8] soc: fsl: guts: make fsl_soc_data available after fsl_guts_init()
Date: Mon, 20 Jul 2026 16:36:39 +0300
Message-Id: <20260720133642.136324-6-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720133642.136324-1-vladimir.oltean@nxp.com>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0003.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::16) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|PR3PR04MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f6ef24-b753-438b-c4e7-08dee663fa4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|3023799007|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: tQ8bXbql6OcbaRQXdxxRfXgRmLjV6a1VCo4dNeSb5mYGTqxAO9AHSrJ1H8jKWjMTBskvUXNd9rUErC+T21yC7AyzQST4e7QvveQOU/t5XKXlVcXfO6hj6oXp288qI+48I/Pk+4iJQSxOmmyESAktfflNsBq+giPPtkHOlVZX+4MzyaJ7dPHsRw5YJGiwRbss3VF4wb30GN/6zbRQ5VXyP57KZ/DBpWsOL3hnlq7fCM32hjoy6bJbOeZoBVV1IkN1PSYMbY9uSq+SLDUsbLCRSGElxaz2obL5cQwT5UW6agiyRYKlAOV1gw8qhVUDfSkVKqnOgKra4gt2FaBtGgZzuSnxbTer3Zk0/gakT4F5hzNMnW2eVpfam7/0xFVxcsu9POdhXw2Fsh782qTnc3b8Q1sDXYdgp1vLIV5B07lx//dcbFixXpZ4XTZZpvV2Vlam69wOiLQqIRadHd0IsMKHQAqtMy5fuBAhqQBJSGeftqBfMvLRNu3bbCqbGCde6Tm3R6qUAyLxsMYyrDsY9xdL5+YQmcjIX5SajT4TfvgLpzT/MpR3JrlcczxlTjCAGyatBO/E4c1p/eHEmjD+PDof3VDoI4qXsbnzQCQctq/t9qfAwXGvaWCSsXDvnACSlye1/Hitb1aKI9oNqiydYJxZXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(3023799007)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xgqWjPRGaYYC3GVEBCPbtjtgDImnJH/+mHEzAc7UFc88UNN22ARgLzqwAk2x?=
 =?us-ascii?Q?s2QDVlg+GPMtEBhvbmYXE41xyiNjH7G6HBzFLviRcJOAd2RSMGpsXeEvEklb?=
 =?us-ascii?Q?ASt/kAOHnzh/fKv0xiQhiVorg02aFsbEvnXICL04Hx0Wywz2tWeXTOvJ+5sa?=
 =?us-ascii?Q?PUPPMhdcXrqCa7eI2uzTUA/YOpl4FGxj+xQsDMbD0kR3Kf7c4swtt6QNGlQ0?=
 =?us-ascii?Q?PszUCn9zZR3DKWGulNsLeqmAEfshUfSRki13mQafchBESzNOSe6sRKgnKi8N?=
 =?us-ascii?Q?8lzZLuWU+KWRboSDjWzc2LArNp8N/qM/qkCBhdwbtbewmuw0eLxa7CZkxihJ?=
 =?us-ascii?Q?VrqpCRjHi4PLLMXy0kHfZkbym+krbzUEnZXKFt83n2avoDYTvacGVxUCRl9E?=
 =?us-ascii?Q?cjqi5rMWaMP3qcG++VfIi0/TPYoNi87azxuNbDVtDElO6vIG31Pun4SyaHYj?=
 =?us-ascii?Q?M1XlkR3/6L8FC4zmyPORVEa9S4qrfd1U4YDnExdoyWPuUpA+HDgrQq/k63/G?=
 =?us-ascii?Q?BiHzQvo19Rl1oCxunQHbrMWkRWkWOkYdln0hmxF7MioN4jZe7BEw2Pcbr1Ei?=
 =?us-ascii?Q?h5dCFEZxOcLgz2k/8z0LTGfaOqlEa0kXgEn7Pfv+6d0EHSyc9WJiMG0lAG5e?=
 =?us-ascii?Q?UeRAYSTJE8Uhq2q7LuNDbi2AV7N1Q+Y5kufNFP0LU1sSCu3BIWoDiQbusuLp?=
 =?us-ascii?Q?ojI1xtI8m1HplBD2DFjMoMhsYuOpGo/3sDspYnoM4SMMhatiDhh9rcB/Vd8i?=
 =?us-ascii?Q?O0+H/TFqVzL1GoxIyFXv+RESA8lBkbUtAJzjzCiL3zqtQeuNdq9MDNeFKmMb?=
 =?us-ascii?Q?m/hHsJKj1xUFiQAm9wqCXw2L6EHSLr4OKS+GPsHCTARPFO7YJU6xzyLZ6PBq?=
 =?us-ascii?Q?33e5M53SEkkr5ErMz/eMuchhzRfhEAKyNv1sSi9cHLS18926IyxLrWDw90d8?=
 =?us-ascii?Q?gImcsgUHu149s1GhpmzjUJrfHssPsagloY3DQNj4TaUGAMQyH3gCdWYOuv05?=
 =?us-ascii?Q?TeWSY9pomDYkRxzQR+0pTvrF/huCFzbsd7Ekt7NRucy4rVKoz2W8E/OjRPd/?=
 =?us-ascii?Q?BOZmWKm21oBVYU8dsFiu/msdG6ZMmf4QYNjdGWvT+Lm7gvAd3/PxRiGT/B1p?=
 =?us-ascii?Q?rALjc7JavPBGr3gI7p20s3kpoSeoIyVqpKCNq6ZhIXAy3rw7chlHr5UTIU6U?=
 =?us-ascii?Q?fulMB2qnuuCphBIYQ1wzZNQKzOsW8oqUE/CfUb1bblaVeBDIjM3Mbj+mmxpL?=
 =?us-ascii?Q?7yrXDNCHO0Qfu5aJlkeid/k9h0tCz5ohNldmTmrG23xu1aU5paqFtotjcYdA?=
 =?us-ascii?Q?fF0KiYA4BstBnYA1uoPQMNKWPNN7Z2eIjySY2f/Z+rvDwtvQ2PhyB6JCZioS?=
 =?us-ascii?Q?srm62Wh1GQlddfV0uUgnxHa0PHxqxnTlBudKLCDbBAq1vL/iE6o1qDc8gX9H?=
 =?us-ascii?Q?9yn1EPW8fDwOiCtiD23TxA0QjMRyhNTeBJLt37eJKz1Ly4lh52fnZtuu5m8K?=
 =?us-ascii?Q?Y3H71fHEWESiE7kMAAD+xYFO6ShdNX9nHy1lI8eiyvRjFJSGO+pXBcED3hCr?=
 =?us-ascii?Q?4O+E81Ho6nPHD0X61jJcvpweviQ57lqiAbIfX91QwQsWTwDhW1eS9TqFAJS6?=
 =?us-ascii?Q?f9nztFV8hLJweJA/noqs4Sk+IFYM1SYJP1FW6yECgHtd1cGiAhFttFX4LXI/?=
 =?us-ascii?Q?DPvKXAbAlHniBBZ6NRTsct6gHf8QqP/+9avEYHDC5toiRJ+inrbKAluwqBNV?=
 =?us-ascii?Q?fO/Jlrzhpw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f6ef24-b753-438b-c4e7-08dee663fa4b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 13:37:00.9723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6atRRUPvaR3mCiU1GCMNxc5qFqk1XZ8MsKm1YljHZNW1S7KB8+YKRwvSanlKXTmsFK7osYQAxYLD7gI3Ie82w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7259
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_063705_988503_F191519D 
X-CRM114-Status: GOOD (  15.94  )
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

In a future change, struct fsl_soc_data will be extended with methods
for performing RCW override.

Since this will be performed from a calling context outside
fsl_guts_init(), we need to keep track of the soc_data that we determine
at fsl_guts_init() time, so we can reference it later.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v2->v3: don't leave soc.data a valid pointer if fsl_guts_init() fails
v1->v2: none
---
 drivers/soc/fsl/guts.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 922560d98782..b9973ca3a440 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -138,6 +138,7 @@ static const struct fsl_soc_die_attr fsl_soc_die[] = {
 
 static struct fsl_soc_guts {
 	struct ccsr_guts __iomem *dcfg_ccsr;
+	const struct fsl_soc_data *data;
 	bool little_endian;
 	u32 svr;
 } soc;
@@ -231,10 +232,9 @@ static const struct of_device_id fsl_guts_of_match[] = {
 
 static int __init fsl_guts_init(void)
 {
-	struct soc_device_attribute *soc_dev_attr;
+	struct soc_device_attribute *soc_dev_attr = NULL;
 	static struct soc_device *soc_dev;
 	const struct fsl_soc_die_attr *soc_die;
-	const struct fsl_soc_data *soc_data;
 	const struct of_device_id *match;
 	struct device_node *np;
 	u64 soc_uid = 0;
@@ -243,12 +243,12 @@ static int __init fsl_guts_init(void)
 	np = of_find_matching_node_and_match(NULL, fsl_guts_of_match, &match);
 	if (!np)
 		return 0;
-	soc_data = match->data;
+	soc.data = match->data;
 
 	soc.dcfg_ccsr = of_iomap(np, DCFG_CCSR);
 	if (!soc.dcfg_ccsr) {
 		of_node_put(np);
-		return -ENOMEM;
+		goto err_nomem;
 	}
 
 	soc.little_endian = of_property_read_bool(np, "little-endian");
@@ -283,9 +283,9 @@ static int __init fsl_guts_init(void)
 	if (!soc_dev_attr->revision)
 		goto err_nomem;
 
-	if (soc_data)
-		soc_uid = fsl_guts_get_soc_uid(soc_data->sfp_compat,
-					       soc_data->uid_offset);
+	if (soc.data)
+		soc_uid = fsl_guts_get_soc_uid(soc.data->sfp_compat,
+					       soc.data->uid_offset);
 	if (soc_uid)
 		soc_dev_attr->serial_number = kasprintf(GFP_KERNEL, "%016llX",
 							soc_uid);
@@ -311,8 +311,11 @@ static int __init fsl_guts_init(void)
 	kfree(soc_dev_attr->revision);
 	kfree(soc_dev_attr->serial_number);
 	kfree(soc_dev_attr);
-	iounmap(soc.dcfg_ccsr);
-	soc.dcfg_ccsr = NULL;
+	if (soc.dcfg_ccsr) {
+		iounmap(soc.dcfg_ccsr);
+		soc.dcfg_ccsr = NULL;
+	}
+	soc.data = NULL;
 
 	return ret;
 }
-- 
2.34.1


