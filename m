Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD8CCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 19:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l00/Ni3blUNnuL2MDCiWNUWKpErycyhbKogk2N7Vhc4=; b=w5h4wgs46owEaD0ZXqK5Aj+zsR
	+qbmsf7MWnAY/A1d5gQkrJZvoGFW8+ujY7+7evUodh3XkjvbycBBVbAHwAYw+CBrsMwbr5jT8x6z+
	GUdf8MmMVcDgKVSZnf16k7LVUis5QlL+bo43B6J9xceR47nVdMGO+UnkDSxuTbB+luYT/nYTykn8I
	Y7NX2YP9smScVuOBqLh+IsCO1ZwEbJyNg50JecoB7IEajg5us/LJe+vJsB+i5wYp4iar7TB+aJEwF
	h6hxfp62w68AHM5KdZtbIknf35bK93wrOSMT7mS5EDq6e23mLL8rx4QO0/kFUr87lP1UIsF+kgQxs
	ALn03czQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlGd-00000009xOF-3rqo;
	Thu, 11 Jun 2026 19:40:43 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlGU-00000009xCR-2kHw;
	Thu, 11 Jun 2026 19:40:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4Pp1T1mD2cFtvyTp7vyN6E9YTn/wpssI/I1iSTkts5nOTf5eE4Q+X/ACNFIRzlyrUwUV8KvFmwQg3+iVLOQQs1lhTS0speYbhL4HgA/4ufxzU8vJveyVYFshjQBiHRUshLHtOIj9sy3miQYTQiRa+y5w0uPTFhhKJ/c5sKsRlh7bTOnCnwdXcxIwiToq6IA9/ZZyIqdprk7EWP2i19DRUOL7FUsPscRnufn9hX6LSrJ5QBOnd1rOIVjlCbF6+SBt07tjGGZQ6zi2gxZ+lwAsI+UY/P1WLU3RM+93XDpaY5U9m43z6cuV9A442IEvd5KGtfhTrKTX8Pb+BqaGZ4EvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l00/Ni3blUNnuL2MDCiWNUWKpErycyhbKogk2N7Vhc4=;
 b=ntn94COs73/J1HnL/Yl8TK83w8ysX72GUUPH6s8fyGVHF/DH6710tBzokD5HHP4OzT0ldo42ypDk6Q9plxO99QCfGNSTmfte7B+05Gk2WktuzY6iJacrT6BE4reWyb0iJuXe6WbHF1QZGgOY2VnABmc6MaVvJr0wiekwo7SUQxP6zRJUFHRD0+pEq4ygPhQ5utMLsR7Oq2fiVeT8tbNlIaBOs2x1FKlxghroTsWhjSPDzR31Nd1/0T9L1DFOsySVpI1RG29cxAZbnPkAzflZ5mLfc4TGMwvKc0bs/u/x+zWmyCrjvbTGENYVL+1aDcyE50I85OcdqjbOB0RRY5DdoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l00/Ni3blUNnuL2MDCiWNUWKpErycyhbKogk2N7Vhc4=;
 b=hLnU/VpBsEZutP01//GOHDaNBQTOG66eG3CJtHFQfu52wIxMAfDKeLthF+HiIgPIOPmPaWa8HsrSvoemGmsnIBKXIYRBZH/BOEPGh/hDwy0/z1BIBQjyKuVDyxD3y87QV1U/bOlOqHXxYZZhEmd27W4HxOnMUU/nyVEWU+Ix6tZWUCAT6UEwbj7uwY/bTE1Kv0K839WGoxLXE9APX1xeRbH3Q2kwrrI61DO5yqBdBcbWRChbzYoqCeFcP4wjcrpoNgDUN8wPoER0roYktFXeU+JBuEX+GSfTQyzl6xf9R9DGukDWaWQR2fAhRqE71t2jWVu7oxaXmh/MQ47JNssT3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by GVXPR04MB11017.eurprd04.prod.outlook.com (2603:10a6:150:21c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 19:40:26 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 19:40:26 +0000
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
Subject: [PATCH v1 phy-next 5/8] soc: fsl: guts: make fsl_soc_data available after fsl_guts_init()
Date: Thu, 11 Jun 2026 22:39:37 +0300
Message-Id: <20260611193940.44416-6-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611193940.44416-1-vladimir.oltean@nxp.com>
References: <20260611193940.44416-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0122.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::19) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|GVXPR04MB11017:EE_
X-MS-Office365-Filtering-Correlation-Id: 674e52d0-fa45-45ac-be49-08dec7f1493d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|19092799006|366016|7416014|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: QCdNWQh5GYPwGyty3griE7Gg9hJx/SbxjybQ25F4aEOaxktfhfXvhMJ19/CvnrD9h8DkUJ9e6RdSOM2Pr+EtgzxLBsX1yriuOXmDnoVMKIGms9bf2cm1cS60hSlknuobCWTLBd3rJ0H+CSe1r+wtV6wVzhge8gFVHhxgA4Q0loeYTR++NLhLn4KkWMpTE3kCR1PM4BMZGHSqZkjsFFp4Pk81JHwXGEyJMtwn0X8QFA3VHZsMXSv8slLQIsop9iPBQ8u0k5WWM1qYgi7SY34CVrRTi2hirpTM/azVlHodeEnqdK8+WpDw5/jHkLzVQo2yplnGKeOtQhdfQRToa5lS+sn32boRlFrSXk08M8NGK3lH5NaK7qWFD7JuURJaHw6D+mnpSmQtbI5d9L8I7hMbcR8eHJeqVTvVTPrGz6gf4rVHUZar60fNrY3YZTlYyPZzN7VVY8JjL5YfEH3sT4bf/JckBymC4he/Zcg+R8tHnulq1hIio0Q5gX+O+IP6D08ZdmO0NsVRuDPEy7xUzS4++RmGmPXN6FCIeuoyi2M7kQx1hqXk+39MB5RF/iRYkF0CmMCjFofAMPcB3dH6DE0lCl+xuRH5UEH0pn/L5nx6SKVQIWu7BaNsUNurypoi1A8gHXUZ1Bgur/QfOv4HX1kMnXV8Q9YcI9V6O3sJpusIR66zhpx6C5V6dvC35aqhdJ21
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(19092799006)(366016)(7416014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mO6v23WyAf48GXxr4VUv/WV8z8YYrKAy6YW794o8/iiny8aim7OzwXQOQWu0?=
 =?us-ascii?Q?9kJwBBrS0ktTPR0qNB69Nd/Xv+ipsfwacihCBd8DQaqxvorYMU8lwuiGpUbg?=
 =?us-ascii?Q?4SdaJxhtNQQr9YJL4HfwLat/IytpdwDsF0G/sTX56GU9s1daNzAJ5FoJA1dl?=
 =?us-ascii?Q?IMULT9IExzxh0Ze5uqRjnda3ZcWOXEhnhfAw+PxE25Pbje6dFIxTgS5C87DI?=
 =?us-ascii?Q?+yLnY0yROBFgIgr70I/Ydzr9+6O3looULW3y6D33tRh61nVW6nW5Kfoc7CRC?=
 =?us-ascii?Q?k9OSfeKOYbpeVc4jr8FQxysLsDr1vOnSiH8aVBskkwyk2SDfYPFMnPK5YoTU?=
 =?us-ascii?Q?VPntFG36UfCaf5vpZUfdJEGQEBfpK3PaDFNdskEchlm2rR3FinthEk1JgOud?=
 =?us-ascii?Q?zkvn1cv7OlC/nBkqi7qXHlP1qog67Wbdz9tXs2EXzIc116ugdLBXOo3myUfw?=
 =?us-ascii?Q?NRJJiNOkKqOU1ct6uWDXUeolSmkJmDt7R0YAnmIK7jHIL9wDFfqKVlkq4VLS?=
 =?us-ascii?Q?LA8GjyCY+midYzs+SzrhRjGF94x0s2KCfVW+FWPHNj6IlUUnvcYYyKuWiRgG?=
 =?us-ascii?Q?HhxtbhDgsqwqmNn9JQXCsyaL2JUfgnBN98LRpEJK8NeOzawHKCJ8E/1AC9mO?=
 =?us-ascii?Q?sTKxq7q9cErQF4AZBTaK+BBq6S+u6VL6ipr1viZz9cORUrARVAVP/lr8h6wo?=
 =?us-ascii?Q?p2JAm1W7sgdyctzZ8g0IWqwc428Zx6MekDwpZfZgFvh8Bue+itbgLts0aPHj?=
 =?us-ascii?Q?kFuvU1rugd6CUHiCCmiFghgmvvaUzLprpip4QosQ/MmtEp29HOWKKGSCMxbK?=
 =?us-ascii?Q?AE2Q3ut3Ke3H71Ry4C356pJFY+kDBNHx8axcV2eqItUcADpBtag9wkiHtUau?=
 =?us-ascii?Q?z74nyPg3hZhToP60Peiffs7LkiFz378lRi4Ws7SzwyENyghMud0OTCG40Jgi?=
 =?us-ascii?Q?Eg8M8FPeDw7ZgE1yUwlPP5CbyAd7igcgCfuy3KlSxgqFuKFSzv0BI47UwYVN?=
 =?us-ascii?Q?WB0h26AucYpG7dhDkauaBXAhc+mucOwTbwbW0wooLF2EuIMQn7qz0vp3k7pm?=
 =?us-ascii?Q?3BtE0FtJkPZoD4DV2KJngH/4BI+2cKYN+ujdY4GkZoKZW8OLVhWEm5xkRFnQ?=
 =?us-ascii?Q?31nH2v4xDGOkxQXJ1plR7uirox6MYv+Cf8szje2HRGKoUGGTmhNlEDPzeVEm?=
 =?us-ascii?Q?v6ifqvxL2OLp3MtBmSISgdaJHKHc9gXh0dB8fXvasgGk0V2H7iub3B08drkB?=
 =?us-ascii?Q?rKZT4tvpSrHi+Y9DFPlOW6SlqQZIsrX9PYpkLDK0s/bk90sIhdE/cKHdnzpC?=
 =?us-ascii?Q?21h9NuMvjy7zqb2KI6vew6GiL3xkdKTlX1/RF5OXXvwsHF+9eJ5BcIYNaruB?=
 =?us-ascii?Q?oUgDPU2CoM7Afdy5nTFnzPuKBx6xRvdy12++z8+VF0vm+IoERTb/nOWLqSNj?=
 =?us-ascii?Q?zFPzzJczlEiOWLMOPUwFJSbsLsKTrHHT9mJvKlPSJ4EBEJbojB/ebYI0DPHS?=
 =?us-ascii?Q?qoz8qxpc7NGwyc9DvbGiWM/bpHwD30KvB7VBwjfJwhPLM8Sqpqfp5EYk0JJt?=
 =?us-ascii?Q?BRyEknCKxVOwQSPBQLYVsvGW/l62kTgXEmez3qgIeOW5vdlNyzlW2tl8J3gf?=
 =?us-ascii?Q?gLwcf5rmbKN8MEDQQ0rOh2XPUngsKVwJpqvTiNPfw6blAzcoabmLQ4OIi9I9?=
 =?us-ascii?Q?XkJgddkY3iTFpFVozsaEVBnbY2kKnKD8xSCBWgEJlYKO/Ex0x6gZ3YP/CNaG?=
 =?us-ascii?Q?0tqbJt0VwuyKth/B6rmW2U7PAcm2YrvnrIrteS7dhVVgSoyixcGA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674e52d0-fa45-45ac-be49-08dec7f1493d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 19:40:26.4299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIs4i0tkbp8OTzeUKhbyYq+kEf4xOIze1CeVbeBzQOYFs0tNi1wx8COeCNoUexpgmz2I1dT38saINP7IQJzUzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_124034_702826_ADAC9798 
X-CRM114-Status: GOOD (  15.21  )
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


