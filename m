Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768A9C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 05:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHHhT+ciB7YF4hAxeA1QyW37V/98objNry8u1LOuxvw=; b=JqQeSjv8/ezVQx1JVS59yZbNHE
	CYV0AslAJ+LVa5yrDL6rXkPpYrhFUx+K65chFVSWZqIdXugsMT2yXNZohCgE+hnRPiOso8LxiWIjj
	kOHkLGXATrqFOK8+haGqDe40PJdSp3v2gBAZ2hzwoIkKDHmJLTCnxrZ3t62rdidM5u+PdV5dmOuB6
	Ut4Jz0ZOYhfMr/gV36saAQJHybVsKTUQft4lYBiD9ElYzuVHTgrH3+ShtCf+l6yvmf6xtatGj9MpZ
	Fp9ojKO47snNhtl2PiTzNEN16L+3Hqex7m+GapQEfIo20wayUNbl5vF7b165oB8FauLOnzLjSw0dz
	EcnMwe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS89X-0000000C5yP-10i4;
	Thu, 19 Jun 2025 05:49:35 +0000
Received: from mail-japanwestazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d406::] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS7wf-0000000C3um-38o8;
	Thu, 19 Jun 2025 05:36:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmoQjyIA7qPXIPgHi9xw2q5nlGuDAoOiTmLp96u9Qzn3GkXLNHeXZyItZ7Zo6BJ3OIhtqI8ypRqMV9qXpq+CHRAGUmnCZoz+8IkRkUFy3HPiiCFtw1Pf2BIQWycLRdFIU65KpRkOO28hmsOrdtSOZ/PprClHwFsEWX6c00dJTJCFdzw5rMg6XV4YADMT32u2nJ8RxOzMIaMqly5R87D2Uids6On9xORDhjYmDKQ0qhiKdt0AzbCzc+xR8OwQWtBHJZz8Us2s7vahXvFzOHnP8mGjd23MCU7FC7Mrk8SLus+MPyT066nDm6k9qp52L6hMWyB2tE3F1mG14YebnYYQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHHhT+ciB7YF4hAxeA1QyW37V/98objNry8u1LOuxvw=;
 b=Ghx6QsYZVQuY/3tX6zwDWEgA5q0fLJaOnLncgqVqvuBJS4AwrOElmmRtCYGp6flLgtIfNoFplsLlpAIAa7NpVSDU/YcsiPrAg37XFOGOl468o/wVNTv+TuJtQq9CAqyAN3q5/TGhQtOAwJl8B8FrGvnb+/08NNSwOTg5VijMuE1AjsorhZMwp2BT6Hvm4cV/YlcqcHGnvzvlJktGlbT0Ai2qNxx2xJsMBCpANBgP7jWQimZgRi8nj8eEKkgnpJqbgKKDx3GMCHSOr5Ivz+aL/XARzggMlIGUfan+bNoRj8x4tOyhsqKsLdr/yedQL5Z8y3lNyvaFDqpmZCpptQqCQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHHhT+ciB7YF4hAxeA1QyW37V/98objNry8u1LOuxvw=;
 b=PGbDWEVIffmmSEWoYVAoRyk1H93NiB04RDFX6PyXVNKQlXwLDEOJToS3BpVaVPtxo2d6/6EciHZhKNw+2w9PO7L4Jlot0EtZhJVaMdAwFEcQItSpW/yvKLiAsz1+yK+qYquNjUFa2u/mEty8hWGCSfscGglbfuInD7xYY4zn7fc03nYZYE01+84ncf5XzIHCCnIwu7Tykbr8etmpoULmhSvhZBKe0ra3Xz5tIulg+PFfVjo67SGNytDlRCdC1Ki2Uf3TMpRGRW6gZrCVSmmCMuF0piThFQ4gcs4UWepr9O/99yNnteZBNgb5cHBc4efERAzBej0imSCJGNodnd9Lrw==
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com (2603:1096:603:2::18)
 by OS9PR01MB16295.jpnprd01.prod.outlook.com (2603:1096:604:3f3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 05:36:13 +0000
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f]) by OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f%7]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 05:36:13 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-mmc@vger.kernel.org
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH 4/4] mmc: mtk-sd: use default PATCH_BIT register values for mt7620
Date: Thu, 19 Jun 2025 13:35:12 +0800
Message-ID: <OSBPR01MB1670CE92711CE9EF6601122EBC7DA@OSBPR01MB1670.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <OSBPR01MB16708176FE57F691359D0943BC7DA@OSBPR01MB1670.jpnprd01.prod.outlook.com>
References: <OSBPR01MB16708176FE57F691359D0943BC7DA@OSBPR01MB1670.jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To OSBPR01MB1670.jpnprd01.prod.outlook.com
 (2603:1096:603:2::18)
X-Microsoft-Original-Message-ID: <20250619053512.14507-5-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSBPR01MB1670:EE_|OS9PR01MB16295:EE_
X-MS-Office365-Filtering-Correlation-Id: d8453e70-299e-4cfd-a8f2-08ddaef333db
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|19110799006|7092599006|15080799009|8060799009|5072599009|40105399003|51005399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VkzodgXEcE2f8K66yVQ/UAsstE5xaPPGmcg7NvsjzcCgASFLxTFZo2GPZVvq?=
 =?us-ascii?Q?pjOMvigi7vlimlGoRSAngelxhs9/AodSWhEPCb8YG8SUVQGVo5HzNtOV/yFk?=
 =?us-ascii?Q?PXV3EN2tSyAzpF6QoKTsjsf7jEKVpRpDnsMMD2tNTgtfudzzidIU4PRkadBF?=
 =?us-ascii?Q?oHOAN6s12WcTAjZaMIi2G4ffZJKM8FXy3QQb5Py0pRnR2NE2jcETXYZ1yDRP?=
 =?us-ascii?Q?0oMLeuAvBbz8yoWWXxsWG7XhMdsHfqEz1U3I9wMKb0uy6IXubUDNdUs89weq?=
 =?us-ascii?Q?n7rT1OuJ4qxJqYPSmn2NNaNK21ac3qVXg+DUcqqLDGByXFgjutJEKHl3eOtn?=
 =?us-ascii?Q?Q+MmhpCwIg3UXimZGsIau2vWlfA9qtVGb0ny0mpNpgSwsj9P+DMHqg87VssO?=
 =?us-ascii?Q?14awkWX4KxNp9rMrJSMw0IOma3rrutFhZr5YJnr4x3qSPkUt9CtCcD9mDx/r?=
 =?us-ascii?Q?3Fiy2xHqQKib1K+upQ7F+RK7kMUXYJHrkr5S10eRvtaJJyKK/80dWnETSAlr?=
 =?us-ascii?Q?P7X+jZ5YuOh+O7vAFTj/OVEEv3thUHiFlKeUQ2jhSxHGV6aj59iqEYt9N+Vx?=
 =?us-ascii?Q?hWHk/FrsnbEqW5rtn9NeEvgKmKItq3Ka0vxa8VPOjeWor8yfOlZ0u69VH6mT?=
 =?us-ascii?Q?e0aVm/TVAKRWkOtMlwHLFHqRpTzsspo3O7Ew9o6nrgeN4ZnT7wBgDwSB+v27?=
 =?us-ascii?Q?U0+cWemechsdG+aN5/ZGX/yIKKbBWvzZhU1gzEMZOqHF/H6DoFodJGuVzj8E?=
 =?us-ascii?Q?ZzFnNfNOnZ0uD0qsJiYJw+hbqEY3nFoYhFqlhUzhw8hb22Sm+EWFYW8adm5z?=
 =?us-ascii?Q?2HTgw2/MrELZad3ONB59fS7e4DgoqAVSL0DTmYj4DRtJGVPyWjl6pDAD5Bl3?=
 =?us-ascii?Q?5qfWUaXquVt4nTsgWIcZ6xKSC+WngzuNZQgDxF3heScXgtrn3CgY5s4hPXa0?=
 =?us-ascii?Q?uVE/6e5fzm8ofC1dlKnkhgvyzKZ3ejDx9uhxARgjpI4vSslYcw2sM+VJP2vj?=
 =?us-ascii?Q?nrTmFV8K302tnro31ua5yNT8AqFjyZFuXRLjjTPBV791aXM4NOjq7iKexWyd?=
 =?us-ascii?Q?va0pJwg2Q11rbYsrzB019xXA3pbOkUdAn+2egPctr+EqIUj/4OHAFHq9P3uL?=
 =?us-ascii?Q?a4nc9/eXS2tzW2siumkajYQMOTrZFk9H499SRDxXLclq8PVdWb3cnQa3NoiK?=
 =?us-ascii?Q?vLhK61MPABc5JO7YRWLZCtlFUIeThf1nbF20Vw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nfYmaOdMQPpFcZbV1PQpZvhyc407bX57XnGm6JJ/EEYqcSC5QXJWqpIUNFZL?=
 =?us-ascii?Q?uhnIQxbN3EzSMzHeLxbf7n4/7H3+PMlFlITyu7O3l02vFIK7CP8x3aK4eRbj?=
 =?us-ascii?Q?NhklHAy3BSgxtATizOeoRRIec3kz4Lq0XJYt42tsDJArkiikaANiwKDNQP/D?=
 =?us-ascii?Q?iNIhwoQNo1P4bROmZauyhsnHK1kaK7G9sAjryB+NrnN/dEHSnRFBJqhF42pG?=
 =?us-ascii?Q?9YiNq7QMXEYcJFp/XdjfHcy+3XatimV6Hr0fTLeC+MqpUEOEZ0vg41SFWpq5?=
 =?us-ascii?Q?cqN755RHbtG3Af9xK8T21ZeqWpuNsjL+CyZZ0vgk6Nxyrr/z1+ybbhOPP8TT?=
 =?us-ascii?Q?f5JP2SzVeOVx77ccC27yTC2nbxCHk7yJApL4foePzYLzyftEV7nUy2+EftpX?=
 =?us-ascii?Q?aY6ebK2+GNRmTqAJO9oyXdKnlsgSEUwiwzaCj5pVWObuJy3TojRm77z2vrYR?=
 =?us-ascii?Q?NxRZxTonW5PgGBjxZzlkDSBkLK4NGnAj8FZDe4Xt2ahbntmZviZequ0DMalH?=
 =?us-ascii?Q?Xpt6mrF2iq2YTIntjaI/rEaQVA2H5fYO4+5CiPkrwTv/MI/JuQSPOu4C2Ovp?=
 =?us-ascii?Q?4Mg9kbgFF1NLwU6SzE0Tca+soeFufZriWPBm8BDEEbVtYiVEdEcvMo17z29A?=
 =?us-ascii?Q?pSnVkkk9/smcq4YC4+yyx1pLqb5e9oYhn/ORpuTZ878/QKgVMABXiZU9pQXw?=
 =?us-ascii?Q?IlEf/SaC/rUuqEAtumxmBe4BGo69lUgxgmipsPXulrhoboYNa/wyNAwM++r3?=
 =?us-ascii?Q?sAB/OLJQnS9crCpbg6TvONi7Dscxon8jVC1B+fbkW+RjVP+KZVh8YQsZbnau?=
 =?us-ascii?Q?XoWJloPLZymv28+UZi52BEPlAkOKms9Bh7PL98Y3hVvPYUNlmfeL2iCcOWYf?=
 =?us-ascii?Q?CAccqet6UsNQQuEaajaGDMw0bqxqmhYVEkXuafyoR1aQFy9Ptpr5Ypc/6AWj?=
 =?us-ascii?Q?0kEwUieO7CYVpcMooHZ/Qi24Q77htr5ofRqT0+DkPM2ZS/1VccC3cei+k9Gv?=
 =?us-ascii?Q?cEafcrm2H61qn0ruJgcuS87UHOu4rhUsHTldJeKAGlgQTP6EmpvJ9DKJZNDf?=
 =?us-ascii?Q?cVn/muC+Hb4B7Imyu2fDU3X56bMNWGsinLvzBmhdqCEz4u9N+WwJ+wl82H3c?=
 =?us-ascii?Q?fQP85v0RbYLN6qdBKERKc9tDblpPDn0OWuoNxoSV6J19MqQ8Wv5xHKCrSEh8?=
 =?us-ascii?Q?VUdX+vsm7oXpktOBKLIlMTNohQ5SAYMIq0i6o5lsdoJP4J5xarCP6qhnzIlc?=
 =?us-ascii?Q?oY0ZJlOPjC47cv0K9FEK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8453e70-299e-4cfd-a8f2-08ddaef333db
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1670.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 05:36:13.1452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16295
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_223617_788255_7EFEE162 
X-CRM114-Status: UNSURE (   9.47  )
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

The register map definitions of these PATCH_BIT registers seem to be
slightly different from other variants. Use their default values to
respect the vendor SDK driver behaviors.

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 drivers/mmc/host/mtk-sd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 276d4e324..8933cd089 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1939,7 +1939,8 @@ static void msdc_init_hw(struct msdc_host *host)
 	val |= FIELD_PREP(MSDC_CKGEN_MSDC_DLY_SEL, 1);
 
 	/* First MSDC_PATCH_BIT setup is done: pull the trigger! */
-	writel(val, host->base + MSDC_PATCH_BIT);
+	if (!host->dev_comp->mips_mt762x)
+		writel(val, host->base + MSDC_PATCH_BIT);
 
 	/* Set wr data, crc status, cmd response turnaround period for UHS104 */
 	pb1_val = FIELD_PREP(MSDC_PB1_WRDAT_CRC_TACNTR, 1);
@@ -2002,8 +2003,10 @@ static void msdc_init_hw(struct msdc_host *host)
 		pb2_val |= MSDC_PB2_SUPPORT_64G;
 
 	/* Patch Bit 1/2 setup is done: pull the trigger! */
-	writel(pb1_val, host->base + MSDC_PATCH_BIT1);
-	writel(pb2_val, host->base + MSDC_PATCH_BIT2);
+	if (!host->dev_comp->mips_mt762x) {
+		writel(pb1_val, host->base + MSDC_PATCH_BIT1);
+		writel(pb2_val, host->base + MSDC_PATCH_BIT2);
+	}
 	sdr_set_bits(host->base + EMMC50_CFG0, EMMC50_CFG_CFCSTS_SEL);
 
 	if (host->dev_comp->data_tune) {
-- 
2.50.0


