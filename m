Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31242CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 21:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljymlyVuyzZ5y33dcTJv/IlXjmIzA/jMNS4fdxoSqG4=; b=aRl7TTdMJaQp1QOTa3RseUxmvc
	w/yK+y5g5dQsPTomDdpV/qZMw+pPaGIZ6XXS9mLKLEouyc1/l+A89VrxJjv0bSVt7hYPX3lf0Nnod
	raF08ARmT7V/7vPwBqJmHDH9Wspj92qT/CdCiYrjKKUp973VkwhtlsvE2wyOG3LmB2vcxtZZ6AWI7
	5jElmM+hwJJ5uh/i7TMfM8FozKNHoIkJfgsKtuRK6dX4IfFFJdHCwryPVo8GMlKa+TVW/zQLQhHpG
	lFjlo6BXNe/E8WzmWBlUBLRxSq0bdmv0hiVWuPTeXOvoekOu7figeAC1r3YahMkunpecuX9+o/Tm9
	NorERs4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY980-0000000BaED-3UCl;
	Fri, 12 Jun 2026 21:09:24 +0000
Received: from mail-northeuropeazon11010049.outbound.protection.outlook.com ([52.101.84.49] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY97w-0000000Ba48-1GMs;
	Fri, 12 Jun 2026 21:09:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FghEBZfNoZMyEA8pQ+MxdB+eGYmzPcpgcx667iojcsR/DU0HoYAEBFaf2yA11gsriwHmNqukKJUhkd9I5r/nfsw3yJVQuG+zSfjEsN5+wh3Wt6JD2cGzd7MiF0+WV48ILjgso2g/TYHAD3qVmX6Dziglb5fJy+PgKabpv5uA8arNsGZSqy5LBvuZHtEoNVD0UcNopsBYaJelM0TQZUsJcgS+6mZ+oLwBUnXhVISI7C0tEqCy9n5BM6zHKvWqjdk5eonytlO3GEY3TNB01kDVg/qnxuLf2tfsfr34Z4sobLCRlJFs2F1zB0Adw7rS9CnBMaH0e9GN5o+wot1W2bKyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljymlyVuyzZ5y33dcTJv/IlXjmIzA/jMNS4fdxoSqG4=;
 b=WNZr2uAZT5WcEBK1zTp/TaA+6a7Juvy1hTt4Z33WA2X9ehNk6X0IytOJu3uOoijmfMVVqXhqWxgVgW6JcA5EikkcgrZKZJHpJKgyhHerVRewbhzKUZfHD90clGoRUThsqBz//+j5o3FV5aCvMMXYcteFp2krBRpVU/9WdnTZBwPABdnbzbIfRtFSEInlOZsra0A/GDACgVTM147H9LGl/qC6Yjj/Dbs0bRrI/HFQxna6BQl6Axl2ezqJKyDiD5nCyM5eLugqILTHl2mSbzifanaSFxLwY1le5naN0icXap054qwpAenCg5snfDzdp7+NsCXSvs356U+NWWY08oPF/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljymlyVuyzZ5y33dcTJv/IlXjmIzA/jMNS4fdxoSqG4=;
 b=Ou1ZKzW9IcJauD0wpqyEBVWA7ASeuk5ZYGYYNzvoHXyjtILJUD4f0eyrRphX29EaFmdfGO5XPWNnAJWQM13vyz1MqhxorNh/esFh9ye7JEzoYzNTneYTlBFsEWc/CdSj7+SBaYN+2xQ4Jj4cElMZSErzR3C9D4Fr0znnU2xYQzpSWshS57199R1Vn3C8RNGOZQdvTbVfi3pvW9HbPi0LQxjCOrPxc3FOVdcl/ka9pdp05mNlHvE/vK11cw70HElPzO6FblKtc1WEV7AadCuA2hCUr5Pbtm8BWJHJhhPMKGI14LwBnDrxBaFNCBRdeUeM8hJLC0kRXQ4y1ANmP+Kk/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by GVXPR04MB10969.eurprd04.prod.outlook.com (2603:10a6:150:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 21:09:11 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 21:09:11 +0000
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
Subject: [PATCH v2 phy-next 5/8] soc: fsl: guts: make fsl_soc_data available after fsl_guts_init()
Date: Sat, 13 Jun 2026 00:08:56 +0300
Message-Id: <20260612210859.266759-6-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 66843127-74d1-4ad3-d596-08dec8c6d998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|10070799003|1800799024|366016|7416014|376014|56012099006|3023799007|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: J2vGir8Ywt8JxjfypQXZ9Ms+BjP8J72r0YW0HKULylcUXJkMOUmdnOiq/OqiqH6K9w1JJKECv/bIeai+b3sxrn3w0sS4flkDUoRCvBoFEgJfZG3WiZbIOsyGszNHwPOiFfB91caknMUCKZB7QyL2MKUmAP9xxqoq1J7xubRkBo6EZAfuZaEgYYSR0/dNMc9SRoD5Td53nV/tvQpjootdbJYxPB4FGn0KLlXYdYPIAYCnS3NmGpOmnnWqvgQUfvU+LOe8hM/avNzcogJeU0o+wx6ZBKs0Q/e5PiXC9+R9UvlxKRFS9/ZfZil2pmOgDDSl35eQ9UNrTeV5O0wzzQXI4zWwsui7+TrkDmxeQ/7qNL5heDgup5l0t/7Apba7bMkuNTx1Y/dT2aF7zpIIb278+NIrzb/43Mbnva9vYbmswyIS3Tpl6LbbxXNlItlMx5zRUl2fyReLuNXoOyRKrwk5tijGBEbS9iDzlM1pnAV40lCLjXf3ygF04fL4/3z/qKFX2B5rp6pl/0br7E8g+jPHOpd6fbk/bZfgOypgK40k5vz/UXrduSZdXyfS8jj8Vh/jTzsHM4q0TZcjnXBgaZjkTTxpw3W01AdlIuXZWXgfmysPCxifpai151nzIm4qv2L8Xz9iqFpRS0M0d7vWI+bNz9lona7mErzm4+HbGT79t6NuUObNRjaPQkmS4PQVBUZy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(10070799003)(1800799024)(366016)(7416014)(376014)(56012099006)(3023799007)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XRVaZYrGR6DTf0N+i6RdpOrBc43edR8L5Nx3OWz8yLHlDpp8RHoAe/lXeQ/K?=
 =?us-ascii?Q?tNLWwFI3XRoIpGi5h33lqj2BomjNZOcbOWreETCyNoiMxQGC18aAUXUv2xQ8?=
 =?us-ascii?Q?3+ZaJUY9v9S5SpZ9L4vbE4aQs3s7bNOPzAgP4Cg/ofq8cihQgZeE0NJLtWqu?=
 =?us-ascii?Q?x94QIhPD41yEDSP0Tb8AAyDRMXNkYSpm4QEB3DtDRaSVoj6wmUb0C4z+hYC1?=
 =?us-ascii?Q?6iz7t6/Y9vHl8xk/UsVCP6bPqPU/u8BQYvHvSvWyJGf9dTyfus6upr6uoE1d?=
 =?us-ascii?Q?IxLYbO67+Kc7iTt6W18XCmVnv7Ct28BRyBjBSaJ2ZLbLvyweLynC1shYqZz2?=
 =?us-ascii?Q?I+GyRLswzGaP7jI/rHeKGrpuf8hae+SIuESQrnr1NvX/igO9gpB3fvCXZ7H6?=
 =?us-ascii?Q?r6nWJagLhyXz/SoSyMAQtWlP52jGQ73narKJ8qg7JfKAx3MO+OuOLocFRuyD?=
 =?us-ascii?Q?5T/WUNafQv94lu7sqP4C46q3cQAhQPKIJBAehk9ZKWjf16ay29zWTR0qcUj0?=
 =?us-ascii?Q?mY6CmzKavYJZyJ/JNUCwsc2bAuMMk+e2zB7J+FkAjxKSChu6rq9zaUlilu6c?=
 =?us-ascii?Q?mUy1K8qujlUpDgkZpNVI76U7foz/LLEMb2TrqNRAUKbPCygDOLHdZYRAkdbN?=
 =?us-ascii?Q?D/tLPvu4oCLh5mI9JxLf7Gq6aIaEhluAblKZHXWYX6UNQ5HrFMKiv5LI1EIz?=
 =?us-ascii?Q?3O2xDfI9t/ka+SCJ61E7T/fo59iuHBNnwrXDSB/zTc1GszTcN7LVOqtElGto?=
 =?us-ascii?Q?2jKutIK6/a3njXQNJLP+cfJqX8UlF9Ewk00r3px1Q7ikIp0ToVWtbIhLP73Y?=
 =?us-ascii?Q?fzmT2xXMIIsLp91rsXO6xcU/luXXDJpctr/q87gwv/TjZRG8w2a+t1s2JqcZ?=
 =?us-ascii?Q?QxelQkBQcgbMDN+xjojXB3UBlE+BR5MdrEiEBTnCDaf2LUUOBrfw1bS14ZMK?=
 =?us-ascii?Q?jH5S2lmBjSm7Gnv7m4x7EJHePIFfh43B9wfpFLjBdbDGqAfx1+bWPia1FGLk?=
 =?us-ascii?Q?QxQUF4R0JlS4oaM1JvjdugbrgsjUGGKLaxtMj2MnAJgXw6/5fMumP1TEZs6o?=
 =?us-ascii?Q?/1S3TDCltG0RHuuJdOtOoz6sZb7tK2GBxSE6tsQBe3y1pnMk+Qe/dqZljkIH?=
 =?us-ascii?Q?qQF8vzaIF7uUsINk6CTpl8amE2E1l2qOR1zg6gmOodkGurm8t+SqKZ/wEjJB?=
 =?us-ascii?Q?hbxJlzYzesADXEWLnJI4WyWhRoxZ/EXxnyVDvoiKNlxFeyQ3mMEwL38zO90j?=
 =?us-ascii?Q?YiDTrmjwBuIxC/QF+d1hr2b4tVgL8IA2mkZBHdQNILSlluT28Ro44zh+ZZMM?=
 =?us-ascii?Q?dvlwSyRuvC3M4/d5bwrFTN/DcVduFsro/51Erkoat8sWiH5IsCF9Zw68t3jZ?=
 =?us-ascii?Q?cmZsXirO9fpw5uSD84+D8Fib4ZUzV9iPeWBukbhRn3/6WSlmj8c0RowmzPKL?=
 =?us-ascii?Q?/F5kLrJY7d6smT2VaNYG7Mlz8LeGLb7nCFkxJ49DxJTQzwBSlUv1js/6yuZA?=
 =?us-ascii?Q?+RqOu0Fx9rSgabemaSrgY80UTG0xI1VEnIzAaysINp37BK3krrrB8JOxgSw+?=
 =?us-ascii?Q?lBZaqhmfLxxiYeZZ3ySBmzQ233NemtsahDtK1KY2Y+Md4vrjmmDzMCmGA0aY?=
 =?us-ascii?Q?sAW2cxk+mvCLC8vhX5q8yifSEeawnhemtWw+Yv0Ng4+BtHD0G1IfXk6iGDVb?=
 =?us-ascii?Q?0YWSh0eN+XVo3nqEU+iU0+Px/dkVD7KeebMX3MmVW7miSRFUIXJctzBgP8qv?=
 =?us-ascii?Q?dqC/tLJ+/DZnKvl7RzLeYIoAW7D3Zy9YvqHskVFDVqbm4UcHti3S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66843127-74d1-4ad3-d596-08dec8c6d998
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 21:09:11.4472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rS7IokQLmKajnHqDNv/U2i6uEyViSogVYRXBoPf0Hz88xdjtySeZOarjnqrpHWCZnhfCqOAcdTm0nqaN1GH0ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_140920_344821_39CB1000 
X-CRM114-Status: GOOD (  15.09  )
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
v1->v2: none
---
 drivers/soc/fsl/guts.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 1494b545bbb4..9f2aff07a274 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -138,6 +138,7 @@ static const struct fsl_soc_die_attr fsl_soc_die[] = {
 
 static struct fsl_soc_guts {
 	struct ccsr_guts __iomem *dcfg_ccsr;
+	const struct fsl_soc_data *data;
 	bool little_endian;
 	u32 svr;
 } soc;
@@ -234,7 +235,6 @@ static int __init fsl_guts_init(void)
 	struct soc_device_attribute *soc_dev_attr;
 	static struct soc_device *soc_dev;
 	const struct fsl_soc_die_attr *soc_die;
-	const struct fsl_soc_data *soc_data;
 	const struct of_device_id *match;
 	struct device_node *np;
 	u64 soc_uid = 0;
@@ -243,7 +243,7 @@ static int __init fsl_guts_init(void)
 	np = of_find_matching_node_and_match(NULL, fsl_guts_of_match, &match);
 	if (!np)
 		return 0;
-	soc_data = match->data;
+	soc.data = match->data;
 
 	soc.dcfg_ccsr = of_iomap(np, DCFG_CCSR);
 	if (!soc.dcfg_ccsr) {
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
-- 
2.34.1


