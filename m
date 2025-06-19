Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41880C71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 05:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aBUenQyT+iXeMfC1FKIrpa+VNxwIrV954787HO451MI=; b=Pg2pQJMbGT6izMwIHfjnCBdMJP
	vj+46rOAnnQHc5Mf6l4YO5AamRHA2nwzkO/tevHUinUCC0VQBQe9Aj2D1Xsq4PKfnarwn0FLHv5Qd
	Vrx79Fk0/aDMRqWflNBe4qWuNgs8ryOt285RNKXKJ2/1XfRy3dOfUcrthf+y4Bh06loCCQmtZ5fpN
	8RIeklFsiiFNmoM3ZumvHQ4JyJ/zs8jDeiPnutrcqzI8IA8C0yw0zJi65xYOq/LsBHN2+8mkO1lJA
	jNlu5yemFqWQB7i4Hlmd9jsM+U5KoeC6jTcVpjJXjOO/3qHbudKOILwBP9p750YlWXLCp8CHYAeVL
	lrBgwxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS80l-0000000C4Rq-1ua3;
	Thu, 19 Jun 2025 05:40:31 +0000
Received: from mail-japanwestazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d406::] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS7wa-0000000C3um-0ole;
	Thu, 19 Jun 2025 05:36:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bf+/HuTME2B+WoAhHVfX98ThWlhIcaI4AktxCPLQXP4068rSbidXozNJmuVbCutULOwpFdzhfI/DqeLbwLElJDTe01InnegklBA3B001LGe01TZBpzwgZrxV3Yz9Ch0EK/2o8oGq4lTqruhU+QIx8DCp3/Ey/4/qicnBxnU0ClQx3bJhAcLqqaM7CUUXi1ESMf2QTR4UagIxfiGO+fE6bj8Oqekc/eLHgjLjTBrz3HsxOn0IbL/C+DDFtn9nlfZ1IPbUmH3xiihsBJ9S5KZ4AhdooSpLQfstHSAJyOahD8cc2ViXbyy3O2TufmhzzjLazBJoB7GI7djc5TeXxfgTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBUenQyT+iXeMfC1FKIrpa+VNxwIrV954787HO451MI=;
 b=cjix4WPyoXxDmsZq3axYOMPR0GyD2riP0xPrjxvDYeTeUFYPAHx9EsK0CVD9Gmfx06jlRWWgCanUhyEx2WW4qIjA21SsI6rzP0MzGXKvgD+9Z8Ej+jBDCKudSM+4c8hr0c55ZQ/B7lOLgFj/ZfDRmrMn5ndVGUpvU8r58TBH2PziFkPsQeEk5HFMrsyAg0PNEW8HREf47pfVZiaODUg7rY5RjTol/sEnxuAl9stLYjIbG5YbfadTj8EJmXQrH8zBZjYEoNdooP5LA2me4mVi45SK7mdJgnuYlpHL89J1+AI8ItymyW7wq6+IYqTnv/txHDPF++1iw1h5ETu3vHOlAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBUenQyT+iXeMfC1FKIrpa+VNxwIrV954787HO451MI=;
 b=qoGYSKqqWbbuckupn6irUgSWSIKGiHEEFLQYGM3w+GyzZQijCxkt+5gTwONb0bYv8/30tOApjB1/K3l1dUzvDNoM9cPmhcDchsmW7uP0R2SsJkD9YZoQjabFuIRTEwkyAomI7Sh7RPn4wK2uQQ8OiARnq+IEKHXkCy3iMRULbItYO3CnaTrB2ypGEnFqJDd4SyGlgNqdalywxoys9O2X5BalZvdCX8XYKJvwq1g7vdca0JdYMFj8bPOXNzpNYPKjRqN0S32u55D77xGB06Ebc5b00qbJz+YGXN4Sn33DAIU8YKdcvrs+o8jR+oC10rTbTn7lMcHGt8lbLD2PJIXoEA==
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com (2603:1096:603:2::18)
 by OS9PR01MB16295.jpnprd01.prod.outlook.com (2603:1096:604:3f3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 05:35:57 +0000
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f]) by OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f%7]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 05:35:57 +0000
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
Subject: [PATCH 0/4] mmc: mtk-sd: improve support for mt7620 variant
Date: Thu, 19 Jun 2025 13:35:08 +0800
Message-ID: <OSBPR01MB16708176FE57F691359D0943BC7DA@OSBPR01MB1670.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To OSBPR01MB1670.jpnprd01.prod.outlook.com
 (2603:1096:603:2::18)
X-Microsoft-Original-Message-ID: <20250619053512.14507-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSBPR01MB1670:EE_|OS9PR01MB16295:EE_
X-MS-Office365-Filtering-Correlation-Id: 051489b0-bdb4-422a-58fe-08ddaef329fc
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|19110799006|7092599006|15080799009|8060799009|5072599009|40105399003|53005399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YxnjE6Q//gc/XhV6XjAW9mL7UINITAxHWXEYwT3e9QR3Bl9LHOFflslEydnA?=
 =?us-ascii?Q?9mbVLWiXQjsdmMFyJGYlRZmwC5y1w4yBxek2IwFoKhjqbFQjzoGHBiogmZpr?=
 =?us-ascii?Q?JUMpTnbTuqavpJqTb8ekUwZr9oqI86uMAinm8UFx2InwCjyVYIgOChCkKV5p?=
 =?us-ascii?Q?PyJ1QxXK17FKcBnAZPAmplwH4iY55Ain24b+VP6qNrn/zQ1iIV28qfMiYNDl?=
 =?us-ascii?Q?2j8i1fnkgkIZorj9tlo+J3Ac9Ub7KS3AoeI9YguS9raOQI4OznbkC0bduywJ?=
 =?us-ascii?Q?ivLMl5pbk1ytg1KfAm4t8WMB0zLwgmE0nX+GH9l6vYs6yoNFvDYPM7kX9tYA?=
 =?us-ascii?Q?DJ0gJpc3KKAzXJJZdS9rrrWq0y0ijSr3/dsxzjPqXQIsN4n9KP+ossXsQZ4K?=
 =?us-ascii?Q?qeXU9h1c5s8yeVPJJ7dt/nVmRYqUMiFHFOwJvzFDYZq8SeGLe1IINsGa8adg?=
 =?us-ascii?Q?uuZlv+j/HyLb+zeuVC1MUyRBAZISLud2k25XlQo2MZoqj23eSBQ0SaGpH5DO?=
 =?us-ascii?Q?6eBWlNkJrdfvQAjMYnFhiOWMGEI9TBU/paZrbG8pJoNOxpFHBjGYaV70Sast?=
 =?us-ascii?Q?a919uZa0+5vCIiLN48CJ4WdS6yR53PgZa5WP2g/KmKkmZzXBp8OF70jTQ/Sy?=
 =?us-ascii?Q?NoqPuLoqFJpyzmJ+cvnI29rKdsP6vDtSEXzZKyo45LC5449u9XGDT1KwFRQs?=
 =?us-ascii?Q?m5OZUYTT9hecl1iG/PDAAV91/+yRnmfRsZP0OsA1vXoMfvoghLZvjYO7Ip4t?=
 =?us-ascii?Q?TRk9eboZymAjgq2WRQ1WyG5ViDDjnaKQlYKU+JE/BDqBg7A+tnYkhXzMp9Y0?=
 =?us-ascii?Q?QiQAvEvezCB3PevCx3NpTKV6U9Hz3WqHVIbm26pzQBSvmMt/kAeTZwFO4e2s?=
 =?us-ascii?Q?aOGEVI9Y58ftjE4MVlFnUpU6/ADuTO7WR3pmcYLdRwt10LjKcV85128Zj1rI?=
 =?us-ascii?Q?fXlDlag5Hq7OsLfNc3hWTGVQDJ9Z+0Yb8bQRDGOh0tX/PRQramI2GnpR6HiO?=
 =?us-ascii?Q?f8PjcZT5PJmGF+nDBcmRY59fh1ekwwdXMESCe6TYrjinQYdwuvNGpPAEnhxD?=
 =?us-ascii?Q?TQ7nHx35oDNsYRlL1I4mzz4j3H81GFU5NNc5vIAvOqfRaGgn4euvVv3m4Vjg?=
 =?us-ascii?Q?CRkboZLm0yxhgVQQ0RFQLZektVFGh4Hu/fxokbkph+7QORqPsxJ6POMNSGg9?=
 =?us-ascii?Q?mlqseiKVuGJMRHG06n21HPVBWZEv1EM0bPG3ow=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dx7s4QexOgbhjKMghjCK93EXItKNl6YKxSbJ5VCecuen5j/vdacAQXTfmnMx?=
 =?us-ascii?Q?TYudzRpEuLZbXk+IBOQ//BjTXdHRtONnVgpzDj2CKQ1qkUVHHbtBJfqPMfAt?=
 =?us-ascii?Q?Aa4b7bJ09uqKbfrJL5ooQ93ohfC3ATEzOVCvkay2CgNmjXb578ndN6h0S9ZK?=
 =?us-ascii?Q?EFLUAAHNPuNuTzbYaIk1CzVPe3dgNkgvo/1ejH8dUrYjp9LvDhYwI8sZa3d/?=
 =?us-ascii?Q?ticZWyhIb2q0E4ugKos4/rWrJwtrUqxhJsE+x0IG8Q8NBrD2ZzYC0BkkXFoU?=
 =?us-ascii?Q?Fqami5mwSl7leTSzKecW14NbhglrOOzPHmsotiGbZg/5K9vgctYWsvBKSwR8?=
 =?us-ascii?Q?7MMBDigeO2hcRnsQouV2Z6O1KAZ2853kCoWeiQgE4v7JFoWhQutLW2YIUJ4W?=
 =?us-ascii?Q?dUnxUlbMQAJoSVzNsH4ZJ+XdQ04gZXNumpQf1g8xGwwCkOiRL+UIji4jDllg?=
 =?us-ascii?Q?lKjeGMDH8/5nVQPJfmeF5jIh28u5mE/S8Rb/5puuXErw3+SWyGKG1023T3Ho?=
 =?us-ascii?Q?HcG1c49jCds1LMVvzfW/+11x4+4XdbHUJJDPpnyaRsHz+iRNtgMxHqMM9zJy?=
 =?us-ascii?Q?bZcfAw0llkWKi21INzYMdGM+6K6zUN4gry1ZPxkDYt65ncCGeHcl/aBrYYWp?=
 =?us-ascii?Q?m4KxmRtK/9Hm5nlwzJSJmdMhtA+CJPukhi9/ONnk96p1xKXBsz479HhL4jca?=
 =?us-ascii?Q?yvKnxC19I2PWFAIEiXWm9fUc3D/A258xWie3C15klaqWElnTH6RjtP6oHCzt?=
 =?us-ascii?Q?2heyiAOeU3neYw30gLa4q0EEC62YuEY0IZJFEnU1rfSqFFmvjV1atbUqzG7j?=
 =?us-ascii?Q?7gDqs1Qy0+YY6VbemtlMWR94ETLNP2IbJuq0Kt020oafBm7DlSXacWTtGI2I?=
 =?us-ascii?Q?WCISwaTvnACQ59xS6TBIPvdeGIHpLYxNjifagHkSXNPnjzClxGwaDJFkZnrl?=
 =?us-ascii?Q?RqqozZieza6oZ805lOo27n53qesWgQ/nIPuh1afpaAzP3DRwNqTzS8ASDYYD?=
 =?us-ascii?Q?M2MWlVR8jwikMQTSt8WBL9kXGUYOibawp7LLps5E38Um3FDK1qVxCDSXGKst?=
 =?us-ascii?Q?kdJVQ+YWPa4wOjyvDLn4XIDeXqK8qlpLYpwUgSfm0WoJmljvuMRiXkhSJbhs?=
 =?us-ascii?Q?yrLFPC20llpvAkKmemHuoUO6tatXYoD8vZ1YS+qhd2koG3B2XEYqmBMn1M6d?=
 =?us-ascii?Q?poWyV+B5Qpd9MTQFYFHOxbRWJxZ6h7liPU5k6GGAxifXw2Z5Bkg41aTfteXL?=
 =?us-ascii?Q?asWiw3/nLoC8+8y9UJpK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 051489b0-bdb4-422a-58fe-08ddaef329fc
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1670.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 05:35:57.7435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16295
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_223612_245696_29E8E9A8 
X-CRM114-Status: UNSURE (   8.15  )
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

This patchset adds some specific initialization parameters to the
legacy MIPS mt7620 variant to improve the driver stability. These
changes have been tested on MT7620, MT7621 and MT7628. I didn't
notice any negative feedback since it was merged into a popular
Linux distribution OpenWrt. So it's time to upstream it.

Shiji Yang (4):
  mmc: mtk-sd: disable auto CMD23 support for mt7620
  mmc: mtk-sd: add default tuning parameters for mt7620
  mmc: mtk-sd: add default PAD control for mt7620
  mmc: mtk-sd: use default PATCH_BIT register values for mt7620

 drivers/mmc/host/mtk-sd.c | 52 +++++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 5 deletions(-)

-- 
2.50.0


