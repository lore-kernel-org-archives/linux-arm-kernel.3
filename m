Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F022CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 21:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVyQNRw9ksSrl8J2wEydSxjUoafIll294orIK59SxhU=; b=zoE9Y2zNtlvgkFWNZ00ilsEznC
	zK6NhJTrbmgv9VFeRQisXVc0U/QB5F2BA6OVy/wVxbLbR6ifOz4Agqt+lnZLOEAggZXoAJsneiTO9
	bQiC5v7bqwQ2G9dqxFhr+FVyZVNzi5Sr+DvN3HhKp344JTAf7zg7b1tqahd+2214IyWpIcvoc9x4T
	JQyelxGyMfI+L/wNJ64EoN7/19IX/8uFHFY3RF1qdH3Ijzh9UtigkIPlca73LiuVFU93nOZG4faJW
	3WIh9MuOu8E049VLwPRhf8wWRwsxuedqZWHgQvf1aSbMuS5WrQ/cSUhngeJs+obLrKMkQ3olV6MGr
	4BW6i1xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY97p-0000000Ba4o-1mMu;
	Fri, 12 Jun 2026 21:09:13 +0000
Received: from mail-northeuropeazon11010049.outbound.protection.outlook.com ([52.101.84.49] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY97m-0000000Ba48-33Ua;
	Fri, 12 Jun 2026 21:09:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSfddlFAfQAfKFLUtjTCHP6cNU3WRM2df1qtu4neIo5IVm6KeWNnp5I6SFAiOtvtqmM+vV6I/i3fGErZy/hP2/T/vvwCuTIB4EbI0BVsKyYtemyrtbuleJh297HoegKadbdVtxJmB6RqowoI+vrdGmeINkTBywR9KJVtp8tIQv4Dmn1qGO9hZwAYKk70RlN1kb3uMwZCzpy214/oNskwtfExnU4JNg8XOPpVlBIs6tNTteI4FIAv0NKjMghUrmvnysr5MT5sq1+RU85lKKYGCsR+Es+4ORN9L84q86d2JHPlF0xJspl7eYJN0Fa79WKN3nkuftXHCfALEMrugUspSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVyQNRw9ksSrl8J2wEydSxjUoafIll294orIK59SxhU=;
 b=C4lnLElr6Tj74xUKZBC7mKSWZBhZw9EkYpjMljf0EMJKfeGXNZ9hFWW8Zz8eu8nvZcKc7bbEvuwO7D/z7FlpEo44E7dqQrfWWd4htiaD8OEGAkQqmDQqCruRsaJWdlUNlKrN3J/3GztlIL+DdABUt7XNClBKtMrxGJVlMlLnT73meF1viQSKFaJMxjgOvO3ZIawRv2swNmW/uRIFFBOiB4ArMQpOXPLZo8W4sZ99DiwgOw5JBWLKq1fD7lwjTL4tjiQuPp1q/6tHQfGbz5FcZMVcbztPyGXnDkrvke284iu2Ppda/TVuls4nW3b3k2lrL+lqqMMn7tDu+EqHXe8JLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVyQNRw9ksSrl8J2wEydSxjUoafIll294orIK59SxhU=;
 b=A/uIK27kmNjrlwCcezzPkqXIEnFHTjaGwn5rwuYtm3/eLlV9pz7nD4ERy6E2tw/UnfnNPN2R8xqC87x5Br92un30b6Al7eelb0aBiNMCwfYfwOiQbItdp3/jXdRQ7gys7p1Z9SERYA861z8kIXR7QmvyTOJobEo8yTmxcYqKsouH1knGSG7yDt7L2izDrbSsxIKJ29cPinDSdT86DZSuOl+8NtKQ1GTk0X2GvkBWMMFx9uvTaMVTz2c4+tv08O9W/QQQ5/8CKyY6XKbV13OWt6s9dt5IRgRxKjrnpk1NUcbuoRzO22P5RSFcjbn38BprC/lksOAEIY2qsXOrTjt9Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by GVXPR04MB10969.eurprd04.prod.outlook.com (2603:10a6:150:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 21:09:05 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 21:09:05 +0000
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
Subject: [PATCH v2 phy-next 1/8] soc: fsl: guts: use a macro to encode the DCFG CCSR space
Date: Sat, 13 Jun 2026 00:08:52 +0300
Message-Id: <20260612210859.266759-2-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d6b9d0a8-4f17-417d-8130-08dec8c6d5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|10070799003|1800799024|366016|7416014|376014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 5UKT8ghsLEZmH44rGCgTWwfT/coOIOfG55MDutRGUT3FGl6V1WF/IX9Q33wwyCGNUxVB/vkPZs/uqLZ5IfCiZWFe9BUFNNtJT8Z3IYXyW7cRTPe6spM6k7o2t/4RlWv0ZDNYnL+VV0G+Gwaub0CcxXjbK4CDYGMywXtutuBHJuzrgiB6+vRN5DBseIimJyH2FSsgFfHTFwZoPrUb3PKoZ0eqbxh3CcxwxtP0sLkoir0IYT42JIneccFogGwBRhXZDUJ4KklDLQinTSjSnaruv5H7h8ZGy0IJBpj/9zYjHBMlEO//25IEvhRit8HoxSgpZhuBD2kjbz8DZHN0xxinDeY5G1J3VoOXNAfs0bfMyho/lGCO7TIeWoMCMvso1s9GrVg4+0JRDFmuRmkgyaniubyibgLW4m7P/Qrwzf+cSFSnwTu3n6Btczu3qmqkSUlU7lZP575fDzwlZlGh4tA55Fv6N4se8bjJA+ZJ8c6Gfv5iCaBZcUhJQAjVSQCMkimOKtOwgJE0I10W/9CAVb+sgw36D07/uRvP1GReRqIQSYN9pRUGHzpCWDaKYnUcDJfJo7R1puGw3cAWx+CdKVKfpRw+cGv1Rh93MPzKbXbC3AsNqF9klVwBfVUhMzNMmroJkQZFJVOyZRF54EN/cgagKYZmUMMM3crMjdHhpgQRI+v1UUU94S75SpDTnprFJV5N
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(10070799003)(1800799024)(366016)(7416014)(376014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sdm+FdeLWyAAzh5XENIyRGpGxJOkAYedqtn5wZ5qEQ3c0977Fc6DPh3+zhjw?=
 =?us-ascii?Q?fNeqlkepGgupjBXnmEAIec0zfC5RpXpSG1+QvbYfY/OwyuXruQJ/j4FJBCQ1?=
 =?us-ascii?Q?3yesZeQzQG8+vNFhaP8EeAvg1SoPg/EHjRnukK5RN4d/kMosyHI8F+DGnpVn?=
 =?us-ascii?Q?CmA1MEgoc9lMY7D17YzkuSA/odC1piGTF8Xux9cl1g5Mo3czLfVu7BAH+NcJ?=
 =?us-ascii?Q?5m1nsv5o3WI2awU9qtk608AAne7ec9VmOjO7utLKAeDtSfVbS1jOFMbdAHJ5?=
 =?us-ascii?Q?S93gjmxOkQOnJRMqWoWCwZo9N2WQB8uxoDkeUFtS7LOn2TnJRqP2RAMoLR73?=
 =?us-ascii?Q?ZOzhuqsGNmzXFnVLGoe30fqzxMDx491U8WxSZofNjelPfJuVbAR2uBY/5uRO?=
 =?us-ascii?Q?gHsz3NV/a4SSlex2BGg1a2ABJTAjNW/e/HB6SekU+709Ktm6J5KxXG7EXAjA?=
 =?us-ascii?Q?dc1wVR8MMORqDCAQ4hEtLAlEfZoRniX1KcxOd7Ynllo1U7Ejs00Rcpno0cLJ?=
 =?us-ascii?Q?QQ1PrgqeQBlrPEl8ll/vjmV4wmSSkn0dwkUE5ZA2EDErK0RdShj+Mue5Xsjv?=
 =?us-ascii?Q?5XEK3198SjpVxFHtrIaSMcMCdMayg2NPooxhIzmoabs17e0pqv2z3EfVyQOW?=
 =?us-ascii?Q?44qSvAIR5nhjCj+0Eo7TWTpCUYUijMWkAuqzuY1XBNpoRRPahH21vi5Wmmb0?=
 =?us-ascii?Q?2k1ZDDHW9470fd+mzYijuWATf2gm+OQlmdvc70ocnHguEmt0dPT0paGf1gFg?=
 =?us-ascii?Q?WkC8ByHc0TmQxJrK5AiRVDiExRy7Itjl5+oySw3tvffc/4kWE6p+eIDUKvWi?=
 =?us-ascii?Q?2J3hKCYWTuN8HRIeqn9KN0evQig2fqEAbicEHQA7/uz6kfq1sjvngCtK8G9b?=
 =?us-ascii?Q?7rjGA0fk4n3eLG2wm7X77ogixl7u62p4Ttog8Kj7dugM9AEiHONyL8M/Ohxo?=
 =?us-ascii?Q?4FwCCv9TshAGopuylgYMfIV7aQPy0lrJliJj2M7H2WHx5Z9MNJi2YisIcRxx?=
 =?us-ascii?Q?LDDrXv5ZQziwlmKQ9OS7Smv6hYapsw5bI0E9bsobFO3BiPrnmay0wQrHSWZs?=
 =?us-ascii?Q?akg+q6277wGVpl3HVQQ5OLwdsbQPGjmtX1IQsZzXUg/fDaGv9FlEG7lBY7rC?=
 =?us-ascii?Q?8w3GazkD6l/1u6upqxrhgxKU+sOTj0Tseoi19mb8xVko9UT3NYWhN6GQzCLk?=
 =?us-ascii?Q?C2HPJNoq8Nrns7EUdlT3BSlf7HaiolFTUyKGXCr9l0VwnPTj+z7GxvlKCtQx?=
 =?us-ascii?Q?h/G9zShaftvuPUd0m6ftzFdnVeiQ+8hU1gH5Ihs+mn2ZoJCKlglmWjTJ9T01?=
 =?us-ascii?Q?ndWats9gG/+kUtndekXhTXz9zMsUZnXXAD4KQoK1HAX1MmWRK7iYVInNTz5O?=
 =?us-ascii?Q?y+hy3xKPHAhZihBonorgrqlof5vy5m2NPA9L4B5UH/upA6VbK+eSWqHLaz78?=
 =?us-ascii?Q?y/MqFBRdCnndPftPylPG4H/S+bIGlZeGoZiAt57bnUv0PTyeo6Jpemnmmh5D?=
 =?us-ascii?Q?ePTuOAVZcxAbwZLvQyZuXk7Gy78EqJmqGxihfDJv+Td6kOxKgTDxUBBmx3iM?=
 =?us-ascii?Q?mZJiCZaWddGscjnYyuTLu0Gcu00fOWp3cGHe3UpLdzV219ZsWN+kTqG4+tw8?=
 =?us-ascii?Q?/raB9oQiJfKcs3WLRofFL8O+Ckz5vNP/sw5sItdWQaCfGHVGZRGh8Rk3wpZ5?=
 =?us-ascii?Q?Wcim0kpyxuFtXw3dBUoLjq4N0WbRinx/J3K3q2v8yZknm0q3fm1wxcljnnd8?=
 =?us-ascii?Q?HOA+d0QIdYOFSY/ArL7yGlDqql+qlMgAlQRoYyOT0OVAuD++pjgR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b9d0a8-4f17-417d-8130-08dec8c6d5d2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 21:09:05.0931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lI1lXC2Qvba8cTQg3etSEYe2bz97LR7tkLG5GxgjmPaUVhE+a0NEciO/K0WxRCYs0J7q3RXrxF1MXCNAmkvO/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_140910_772726_F1158E9F 
X-CRM114-Status: GOOD (  13.85  )
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

Instead of using a hardcoded value when iomapping the DCFG CCSR space,
add a new macro for it. The code will be easier to follow this way,
especially when we add support for the DCFG DCSR space as well.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v2: none
---
 drivers/soc/fsl/guts.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 9bee7baec2b9..f87ee47c1503 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -14,6 +14,8 @@
 #include <linux/platform_device.h>
 #include <linux/fsl/guts.h>
 
+#define DCFG_CCSR	0
+
 struct fsl_soc_die_attr {
 	char	*die;
 	u32	svr;
@@ -197,7 +199,7 @@ static int __init fsl_guts_init(void)
 		return 0;
 	soc_data = match->data;
 
-	regs = of_iomap(np, 0);
+	regs = of_iomap(np, DCFG_CCSR);
 	if (!regs) {
 		of_node_put(np);
 		return -ENOMEM;
-- 
2.34.1


