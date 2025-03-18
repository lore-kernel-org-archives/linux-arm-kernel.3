Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5B9C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 04:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k5rlZc62dv5AUo5lJyryoZgi/mwGEvOeps4cgdCPUn0=; b=X+avZybeD3iSQhm0pNod5C+mEm
	hXQB8hFFF1gyNOyekjH8rpQ/W9rq5OLTwZWjJAdaBSXBIHUYIX+nbnTxk5ECrx29Bvs/i4kFqViHY
	1UzVuEdSM7TsiojJCWFSBmiZdbKesUkiZqc/+rUZoElmilXQL0tzdWdf+T9JlDWRqowzLdHYKlhiW
	iegeF0tdRGa3cSxPWmCMglT4JVGLK8ZWsm817f0YwuTddVvOJnu3n2R9Vz/p/GG/oT5t5z+Xs+aWA
	VXXanAhxGfBVJyXFHvFJr0hFS5CD0SGafzCsd71/ktBs8xvJmsqijBYsZX8wHicIvvhRm8kQMsxmv
	23XbegFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuP2S-00000004fgC-1LlD;
	Tue, 18 Mar 2025 04:58:52 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuP0j-00000004fYO-2sSe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 04:57:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnbAs54gPNau14t6lRbkfakcJIFRudf5g3gH7iAqQmxBoWk683+TQM8wiMKEa7V3BLjErBsuKXv5fp7U1FfSEClLaG9ZjZl5HyhvxxwPWfe/Qnn71HhzHmboGBaQY7cmeNO9T20KTb7kKHfyauuu1WxFgoLC0+6FaLoelSXDMmvrnj/f8rK3kMc1j0Fe9fra/bhLCWfb4dJdfxELRwg1TxPHxD6pvlpEk3RMA6F5yBSH+OmKrO5VhE4yCtuIYtZdXHToVLgRvq/Oj2ohGJEZvC0lu0rSQGeZuJS9IfzehIiZcgQHPqe3REsowPhpqC6JpaHtUFvDwA80u9Y/B94V5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5rlZc62dv5AUo5lJyryoZgi/mwGEvOeps4cgdCPUn0=;
 b=sx8aGysyUMpD+6Seal7fJjiMCZNnL0ciCmzT4ZTtOgI36xCsR7NOquUzYQZHv0MNptO2tFkyN1yhJioYpRQMuNN+zhEeLSH7ZrltNhUdXQ5PVXXOP7QJ2DexGF5yFyD3ZxscEAIXn0RSD4LzqOtzw9sZEq6TBG8XpIliQKc0E1bgmeTwaZ6JHqA2AI/4Rq5AC1VEsFdVQDQFoZpQipB4B4mPutcEoGr/dveJDXgSXOiOIMThLSbwTpcKyh4FHzsXCT0vCKBqd+95RYVoLS1KbFYZ9N8FGv8ErXVJmzlAfZsVxbJ2tXjwuSogJq2ALuOrFofbpgv1b3QfD/5tl43k5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5rlZc62dv5AUo5lJyryoZgi/mwGEvOeps4cgdCPUn0=;
 b=ukbpa7kDYkwgwXKRDrQ24p7/fyVe5G9Qq8KZPnOO5ndNb93S3pp/ZWq/r6gzq9NLKGSDyQb+eAjbaUx3i1iNl3fDyI0vKsXN8ecqsIpbQZ5wl/5El8EZEIuqPrjtXzyVcGc5RUxmEqRgn/w+o43ixfffKlvO1y+rEShlBM0aok2s5OVImJJlF+9bhxUgAjUVNziCCvsd3GZjM4ZHIXzl6y+qzI6IoXOYKFnPgacco63LZRmCo7/AHTE0B9e4mZwQBLTFLz9U/vxikkqstPYNBRq+g7DFKGyY9De6dI1fCpfNk9Utz1PDkuTlImt6jTFveJkwE13vEgpTIrzm9sYx0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8845.eurprd04.prod.outlook.com (2603:10a6:102:20c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 04:57:00 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 04:57:00 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: broonie@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] spi: stm32-ospi: Include "gpio/consumer.h"
Date: Tue, 18 Mar 2025 12:55:49 +0800
Message-Id: <20250318045549.1711502-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0095.apcprd03.prod.outlook.com
 (2603:1096:4:7c::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: 92195100-41ee-464a-055e-08dd65d950fb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1yV8li2xr88wNij3tGXU807kqCL2QtF5heTf9OdSgc0P5iUvL3UQ1Wt2ucqc?=
 =?us-ascii?Q?3ftllec7+qQs8TYwHxigb+FlWtzHrRGnQ8LJrotrh6MZn99gVKPMxVDzevcg?=
 =?us-ascii?Q?NO5nw5xZkO723jsOjBODomDAuZ0bY3HFqkSdeAz6P9e7cdJvrv0TIKA1vw9v?=
 =?us-ascii?Q?hlbSqFXRA3LZlGNP98c7eXowuut7AMzeznjDMjSeI2y9y1dapYun+bnkOKEI?=
 =?us-ascii?Q?y+Lk1vypThW6TCvFHZ8dVxhv43dr7ha8T9yvV5NBSSailZQHR9htQSz6mvVi?=
 =?us-ascii?Q?sSGEtZYhe27qxNBAReBHMA7PobrEnNymRVKs+7Vp+QAwd1aV82AyP8gGEEVC?=
 =?us-ascii?Q?1SgFeqoOIeDG1D3IYdX/0zONm2L5KiaHmQWYtM5m8tjLEyoadq3PxbtkXyl8?=
 =?us-ascii?Q?I/U2xZaNeXdvOhlmSXc0kQmtgpYZjfLH/rdQlLP9HtL/BGo3Ap8w2ClQygZs?=
 =?us-ascii?Q?kihive0aw2gvRAjk7F42EyfQTfHAu4XV59hBhcs4yRmdQEAaRUxK/qMY9cnR?=
 =?us-ascii?Q?x5gtVOM3I8MPb8t2Dy/lCDjbtjGAQ7BMgVNvuikRc1fNzWC0J0yyIRTIZI5+?=
 =?us-ascii?Q?CjPcDCIWqKSKxWjaryf0TvZRLPmywCg81nUEjUGqtrs4gdc8d6wnTcA1ieQe?=
 =?us-ascii?Q?U9KSdek34jhwC5JDh1jJmXogcOmkPzkgBd5Kzs0AG2GvVYfHmnTkEBie5sD7?=
 =?us-ascii?Q?xWlslfJN1MWbW3+vwD30BqSg499WKHSFEOnHsclhYmEyeFylr58EIkBgJaCV?=
 =?us-ascii?Q?j9KWc1O9pEkdzWmdzahnqv/5y4059ViqIU1KoBoEucEAEfdzkQPCqZSzgIPW?=
 =?us-ascii?Q?CzArVp79b+NOY8O0OQuzNkEAY5RaaVpCkDshkkrXw2tq0SgRtyJLHWBBZWeH?=
 =?us-ascii?Q?uZklb95PLdKXYo93FL0ZbZ6nkToxzepk3DP9sxTN+TUE3x2gLLuF/Ch6XMxn?=
 =?us-ascii?Q?lDT6/ZxgcYwcDRDwMiD9qaxAneVc7qpnKtPywBRj6FUdtmWZg4BwAqlLZmon?=
 =?us-ascii?Q?rZFK5FoJFdDQeVys+jnLMb7CyulrQwySjCuIjFN+UtqnmoMraT73rABG0iuu?=
 =?us-ascii?Q?aHEuRganYLXbJj+74FEFu4n+yTy82bgbqkwaaZpqSGkS7cEnCdPm2CLUf6Lu?=
 =?us-ascii?Q?GZHJwG+dda6MmDrzPvmjytvvzGYRJBY15XvQA0CSEtMAeCYl5IgM+KD/ZL/j?=
 =?us-ascii?Q?bDVx2W6nrH7L0+tshVOfLua+UvR2cDCOa8Grc91ERM37VaKoeeaFFO7p+gX4?=
 =?us-ascii?Q?c722oLdS4LWJ3l2QStZvWtdwkGJAJZwgWQvl1ZZ/mqo/4hY37jX3XguxpiPz?=
 =?us-ascii?Q?xDffrX4ZcC1CFAGnQA01scleTnMRtYfJfBHzCkM8y5uxJn7VJQdzKvWb3N3z?=
 =?us-ascii?Q?tOppwzPOPx2HdFO551ZsEpVAFv+TTrsqyPqbYiv9ifOrjruUIvI4OJsUs/OS?=
 =?us-ascii?Q?8AjlFYZhMvKgINNyIeVhRpgj4XseIwpI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ePBKUF9KDF/nk5BdqJlpgBfLiz8GAFQZ8PSZR+SW0vfmkvc6YWqAKj6oVJzy?=
 =?us-ascii?Q?MLHhDaXx7piFVR0wyrzIn21ho4OWmYH9Dk2SxdIb2Jk+U2YVCFfFndE0f1X4?=
 =?us-ascii?Q?P3oMkvtl18S0zgzryonrzpw5gElxLRo5piBPpBeLtOctG4wMaSBquPE8mUFU?=
 =?us-ascii?Q?5sHAT4QLlFouxtB9fEy8SwYbLSLjgwuWRvQnrYscmGJihLUthEbFccRnY2px?=
 =?us-ascii?Q?RjjiCUMbX63MRYgcHirVjxMyh4ym03Ijy60Aq+YLxLKkTMmiof7nJeWlaU8J?=
 =?us-ascii?Q?HPBEj6G/KG7f/yq9fPp9WEBFkh94qy9VPUR1QKKkNojGoxjitN3NR1oDTFG5?=
 =?us-ascii?Q?KjrxdR58QBQryblSGH9sAj+r+PtTOcLJeEilfk0O6iHSJ96I/C7JtdwhnJY8?=
 =?us-ascii?Q?qhoM632snm4QR4JKufNjDQFRh4ByYe6tstAaelqm/IcbtIapYnJF/QS54ixa?=
 =?us-ascii?Q?YIM34xhI9HybDyndjYyP0oiZcWGD3WpUXO7xz8QIKKkjyDUbpusU0act0MOw?=
 =?us-ascii?Q?NaADY3h5bf0ZxdIh2v6YDzBAQYaj4L/31EmYSEdtQNiha1mS+cbHi9O+iOON?=
 =?us-ascii?Q?n5GXSliVn1Ke60anW2KX34ufTMkd+k8OeoYYX5PFwbduOCgY8fsPlsUE6qLj?=
 =?us-ascii?Q?n7ybj2ieZnf+F7Oux5Thz2xB8AClMZ9WlohoRkiPn6EKpseNfsNotXfy4Nms?=
 =?us-ascii?Q?7m6AFWWQjJEVVH7UwFjgX1lEdcQ+2CmAKBWBDhjzZqBkcjBZwvgnrbnHQxy/?=
 =?us-ascii?Q?IKbP9ZA+DjBKLIb7BdF/nXoxkj7nW9ZD+BDWwSncv4s7/Gy9Loo0gbU5HEaw?=
 =?us-ascii?Q?2GvPisi6R9/yMzMqe+Zl85W3qOFEHXRsbPGAffT/e/B/wXFW4VO+gyu1/3df?=
 =?us-ascii?Q?NgOsT64OkbLUpgB29U/rxlX2jxBcWnpmJFPCet0MgvhzIAkGwrEbSM4hEVkZ?=
 =?us-ascii?Q?jfGyRNBMDzrXOAFx8BLLjFR0fMdB7ikdX7a6eA+W5mpR5nO3h1fHdYiScmRR?=
 =?us-ascii?Q?FivUG6kJnOjd5LfRzR/GQ28CLcHZWF/Lsw0GlMEXkpOEVCp1PcX6UBFDUUxq?=
 =?us-ascii?Q?S/gwJoSdrVcCH8kPvN2RXl17uecOpHbg52ej04gFWaPvmloNfSFcXFLzSEFA?=
 =?us-ascii?Q?l5oJVjZQYzEoaSF5ESsZ2FwlFWquv0p3aB1VZW1JwFvqI5qUf4R7wUVgn+zM?=
 =?us-ascii?Q?2GD8Pk+pkBUfVZaE+rIpfiHdHBNGIaxCC6kQgZom9SccMwdUxBLVYwZAUY2D?=
 =?us-ascii?Q?BNO5tPKx07i+d9CnYZ+Hd/bvdSNMB6buTbNT5fNvIFFeaM21eL8HxV/7rIS6?=
 =?us-ascii?Q?19MPBvTwaRPOJodHskHwlCcgAVIr93DvPrN3sBhgnY7gFsNlO0W8JYA8zVyh?=
 =?us-ascii?Q?KadGMVNH4bahZ9dtvK5k0TSXDPRSzv3+32edOIq59tTyLx85u6LX7MddAltb?=
 =?us-ascii?Q?ukIxxZ6p6OVsHyvyq7WL+fAUb723nun9qYbG37IEsbnc2u8BetHnLoZ5Smkj?=
 =?us-ascii?Q?6NpdQD+/ayxtFr3hCJfmvE3gGbB2SryAirrHtnIuLjSXMeKVE3oaC+ciVEjV?=
 =?us-ascii?Q?sNKw2Yyl82KvJQSl0JytZiCWWRylycwbwBad4FSP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92195100-41ee-464a-055e-08dd65d950fb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 04:57:00.1117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ay5o6srrh6vDDUcf1IKWw9n1/x7Fy0WqqlMKW+UnsQY05D3nsYqs2DhePM0avw8VpNO3FLDYZyncEidNADJ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8845
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_215705_736574_E2C5CA3A 
X-CRM114-Status: UNSURE (   9.39  )
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

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h should be deprecated, use "gpio/consumer.h".

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/spi/spi-stm32-ospi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index d4f413c8c3ce..668022098b1e 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -10,6 +10,7 @@
 #include <linux/dmaengine.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -19,7 +20,6 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
-- 
2.37.1


