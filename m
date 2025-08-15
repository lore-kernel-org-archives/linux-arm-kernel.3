Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98358CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 13:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KiIrW1vV1ajvXX3X2HFmfts1RfITbD0K83yjwiR39c=; b=kGFcov7N266l/96+A4qtI6Tbb6
	PjE+H8VFE7+P166nEjr6kSoV0OjedxnF6+IV7SQ1S8dFIFaplcfF2Tuoj3h5uMFPqGLXFyY3FAg1H
	AaTxkMmJ6b6l2CsQa1onTWBY79qE/wcMaxa/tjZv/Mhg4ObANKwexMulLRijHVLa257G/K7A8/Xp9
	YId5x9+iK7OPXmPW8Swq6YHlQxUQZDQpzud09Pq+gEWRiky7R8DrcZqq1P7fVVOchTAZpOe894Kd9
	RWZtx1/JF0luU9/og60FGUS0U8QCxxPEAgW2UyRsdlo/tDIcD96P3BY3Vl4RREs5blNLeIyxt/2eL
	pDytkuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuk7-00000002bzF-2ikj;
	Fri, 15 Aug 2025 13:45:15 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsQK-00000002JHO-3NTw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:16:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuhrG7u71P8cUjk7m/lHmBnBNqP1ZPTnFiap9OmdLuOlBfNkRTs9sX5CvU0PnBjm1PoRRjhftyIK/RS3AEWsJYP2kRhJCETiKwHFPuyk26kyPxPBkRPJhqiatinoBY0oCmYQkN+Q6ruCpJoUNSBLYjqFnhlVgFhcNW8JYfSgeMBr+juORaDW1e3HaRFjNCgP89eTZra7sxKD7N/vqznkVKEyOBdWm1tGqkyguCWFEiGlGbs9Qy+DBw0p3OtuIy+B+FEh1YvCq4XHOmHALWay5Nnx/o8tReh8XHWFq/ZMQHIbKqTpDiyesXyCtIF/zN8CmJgh7rJcKq1ybMtKcI2yZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KiIrW1vV1ajvXX3X2HFmfts1RfITbD0K83yjwiR39c=;
 b=dSXTvxRuQvRp+F0Cefe67bXASZyLYBPnY/HBowzjCkOSZGikJLPsKJKAW3J6yN+o0fyPuSdjJLFohLcIP29UmEIZGIX0GSM6YJGhswZfm5PbwP+/WNn54RIDa9NVxf/071gatd4+ojCj3WPt6iwI3SNmKvyo8jiEVEvyf1CdZCtmr7nuxbkaQgeTIgLGYh8nmJI6xrj8yBZzEUVFmnG/VVcVk7MbLzx7WwkLCtXwsl6nu/idxaxQCkiq3cacB8tp6Vv/8Gz9jyYpb26gVk6KyZTRkaS+1kLMEHUeQkhPoPXFl2S7CWjOEe75spYTG++ArEfvTfs/dlILTqO5HIfOuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KiIrW1vV1ajvXX3X2HFmfts1RfITbD0K83yjwiR39c=;
 b=YtnoFcHMcFdlbuHOQzvoPSZcq3+lGEjss2mL8VQsX4GHlb5YnYcklCe9ZZjT52piq7cIVppX89a958LhSqfdw+9oVYQFw/5sjysuF0Uiupoc8oTQk5eXulmNmBR+YRbhvxBxHBuQZRAyXUEp1q9p4QRrcKAWWurr5JCsZUT9hDZ5Km4D5mHvtyAO45Uo90RrQnqQjPwuEp2Ils/ID1ZugxJEYKqLD089lNzd+Zamrjz+oIKGXDxdzLyhZzgUmNr/A6XiqCwISCtORtsLXcSLRp2R4n3dD/sGS959hhEwUxFapZwIuWj0qnKg/0/eOAYNSjuGHQFmdgbUoSIcRoRcEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DBBPR08MB6268.eurprd08.prod.outlook.com (2603:10a6:10:202::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 11:16:32 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8989.018; Fri, 15 Aug 2025
 11:16:32 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v2 05/13] spi: airoha: switch back to non-dma mode in the case of error
Date: Fri, 15 Aug 2025 14:16:11 +0300
Message-ID: <20250815111619.45001-6-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815111619.45001-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250815111619.45001-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::33)
 To GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DBBPR08MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d69b758-8028-4e66-3231-08dddbed308c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KRWf1jd8jCIyJ4018ZOt8VkKjTlIgSQYR3L/lcnOLVOoiBaTckbyuQ9Qo+IF?=
 =?us-ascii?Q?DHc0WZ3rWGEIKNIh9MqOa+c52hB+uGjn8zW8dfsO6nn/mKFAa2N8lm9ocpui?=
 =?us-ascii?Q?K3m5y287Y3zM8Bw45d3AMPsFxjS24Gii2RT2QlB1+LSXEu8O8llSV5PwbCAo?=
 =?us-ascii?Q?mrAoTMU/uStYrwcDcm7KdULkyEb7WerGo58VbE0An4L6JnCGpcq1QDA/xnen?=
 =?us-ascii?Q?fAwLOrubjf1Ei3YeEj8Y7E3Cnsyy5l9TdSCSJoyp34oRzqM8vw2uQnMlo8it?=
 =?us-ascii?Q?FQm91oVkXDBdxC2+HsX6EIgksHSh+ZzXKBYw+L0XzPo6xceZ+numuVACqV86?=
 =?us-ascii?Q?std0XTTUl0T1FyYFJMtNmUbP+7R6quAqcU6Dl57Q1NZk8kxEHHSw+/g+hLvw?=
 =?us-ascii?Q?UEXhce3ka2giIHB7twZichiz4hUMODP0CgQbDryq2Hq4vT7NKO3Vt83iNd4A?=
 =?us-ascii?Q?2tJullOxe+3nFkYk/Qcijkwj/Ke1vIqUOhGfwOsQ6AU5Je49KHDq51TKRtZO?=
 =?us-ascii?Q?Zd3H8U5CJ9YQiE7DCyRafwq0G4bDUAIvh+Rm02vrOh070ZYCM5dyxuhsLb3j?=
 =?us-ascii?Q?plbrD3oZdzdXayy7il2NU7Ldoc1p/leF7MROwjIHNkmRCDU1WlEgeH28tvLp?=
 =?us-ascii?Q?iguFTPS9cAPTqTvtNfLwQtQlreFgJwYUs+AADMhltdg/xwu1ZWwWrPYAsvIh?=
 =?us-ascii?Q?Vlie/xu0bGqpnM/7403Cblhzg0FFYoiTABh8ppozI+JjgdVp421l4wF4QXYy?=
 =?us-ascii?Q?5wN8lIoLt7yBkqYqM+dXYfkm6cOzVc3fShpwjgXGbc2cKXYqJE+319eL5rJt?=
 =?us-ascii?Q?r8KvYGxEO80NHDP/jdFXlP7f5RK6hC+91qfvkV9yH2lr4EAVvUcJFYgLhSM+?=
 =?us-ascii?Q?GAZnIGU4Iav37aXANW+mS5d35+R7DR/uLKXO5TBr8k+agifOtOy7dPcSCF7Y?=
 =?us-ascii?Q?/OcLD+2BjOapUowvTtg7zrYqaZ8zef11b/bJZkiGW6wiJEqqptb/ESdnTPVG?=
 =?us-ascii?Q?0SD1x6jVL0GxMbjvLrktl0/+4JVpVqX2SpveOGLl15H+N0by9d2MigHl+vuQ?=
 =?us-ascii?Q?YDHAo8gYHHqyj4qGVg3cezaFEZgb7ttgdE/kEJ0wmtjYxj/yqJkNJmnoUvMN?=
 =?us-ascii?Q?z1eEX4RPJmyo85VI/Q/dXh6NsRrOHFr3AFJntPd1KA02Z3n3ZJFU2vxYrJp+?=
 =?us-ascii?Q?rrrl+NF50atMQbCuNrbvL3TWWkg2s44o0MyBZhTHaSinKYqwhETA45gZdbyl?=
 =?us-ascii?Q?YKWE8jylpcUqNds75g4pMcuaL8gRPQtnON047vps0QFdqTEuAUcicilDuwME?=
 =?us-ascii?Q?CA5wJFzI7gzIoVQm6/5roYBhcKw0pFDmKEzjrO9Hzs0Jsphsm5HarRNaUIqw?=
 =?us-ascii?Q?ngRAh6yKJPoCSc2PeRoR6zsybpL1niENC+WHdKc+XQIsF5ItrMLS2xeunWXu?=
 =?us-ascii?Q?u0xfiMQIE0MiZDFNEOgX3/9A7OkE1JhEDPtqdjMlqRH/z2XHPi4X2g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DpbR6AhZugDYNcFBjTAqMNrbqhH576WUtcOkPnkLDMEvaD51cp0Ah0IRYuLv?=
 =?us-ascii?Q?jWkEQfvS2zl1zwcGxKipgCdYSzeORdK2OAdfvUORTFSLDafFpvoFNJfGKfzK?=
 =?us-ascii?Q?EtGG6ag90A2SxosVhrOoueZHNdXPooiMLahitkYZhNby4gzqmMmpGwQFhf1X?=
 =?us-ascii?Q?FwLo5GbvQkyD/YcAi/n7P+hR5kyPPp/zCCZQqfHxgJ/fICzYdWJXyQ9uVscQ?=
 =?us-ascii?Q?O1Eh8Pph47iFkyuZjePIKqTKqK7kWeQcXeEBct/FfHvZ66NA0rZ37Dhq2s/Y?=
 =?us-ascii?Q?ltB0MygFV3tcndgw1zUgreHcRZZ9jAJcORO9/1grOMM5VAK5+DDLfD0RNL03?=
 =?us-ascii?Q?lile/0h0wk3j1OhO904hE8Ih/mzfkVWpW2jF3ZXDq0srSaqZ/Bjt8NJVj8Gb?=
 =?us-ascii?Q?7J7HzNY/a125bCQVFLFZjKitokfQEyuDWZ3Lgu9pl+5q9ISLMhFKv1ORYsdb?=
 =?us-ascii?Q?tdKC8AJyCzOjdR2hQWIbi1+VU7pFDDpB4sfGnB34fmQFLzaDLQA8Q4O0d3QR?=
 =?us-ascii?Q?Cx8IYtKeIJY4ZPbMxgJbk6ASNjmn0WkDc6pEvJoa2Ry8RxTMs1qhTtjQsVC6?=
 =?us-ascii?Q?W8+8rEVnxrpjaAG+cPEuBLz4mXEg4KC4YK/MeG+QrXUD7M/WsUrhLAxKGOoq?=
 =?us-ascii?Q?uzeyg4JoOqg2IB2jPpog9r6LTHO5lYRczChSbwwQu8rH5KKMgzTaaHjVDqjN?=
 =?us-ascii?Q?j5t6vMh7dZBuDIFhiGoT0ia3w3eTEfqt2aAqKRmejWY39sSsdMorzX9Dma4O?=
 =?us-ascii?Q?1ewFNr9TWCH58AnnREH+YMxfeuYxfkDKYeUDMuH8X9JbmjHzNYCBaDrSYvad?=
 =?us-ascii?Q?6jfIRapoM8rAeoMYcZvon457VKYhQbQ/rga82YEhaZyWKbnQGjz0n3cnmozw?=
 =?us-ascii?Q?egp2PhY17tDvNT2+RKGAnjs03dNbvnJ0mNAif/a6+vt7NCFD2CLxEQPqKwaa?=
 =?us-ascii?Q?y52s7nlcrx2zvPMNCJS1LZGDb1CzkfRDyDulzrXaibt0+431r5pMUWD9JU3G?=
 =?us-ascii?Q?KF6kqwCYZHLYOnAMxZD8sKPpsoBdnVqDGxb+lYL6IhR+iJ3E1hr7AB0U9BDX?=
 =?us-ascii?Q?8kdT/42D6R2JZUjfNwsouWZMJTQYEc5/l/uVMtPPPGfjfgqF5VRylUhL6rr5?=
 =?us-ascii?Q?akkHfopGD8CNenNyQyYWfGVeFyWPBs5HEjbbQfcx5GbYIwO7/u1bdufBY6fo?=
 =?us-ascii?Q?UE3SE8BgR8yQggX9dNLkQEhYHpJ2JKGXFywlw9TFXbxGKuR5iTHp4cQXSVcr?=
 =?us-ascii?Q?RhYM7Un+zY633Bnfg+DB57DL00uFzKW3mACMpCBFNTE+Atnu+0J3oUFGdMfA?=
 =?us-ascii?Q?3QvHf3Muq34DRj/daBQ9B64WJYGa0cAqI0kFGbaA7IamLyTsGud9KtUXvUmK?=
 =?us-ascii?Q?Y5ftwyCSPxFuNvs/Rjo/2ohB4DheiOif0fFFZww9va+hMDwq8ew51QtUPH76?=
 =?us-ascii?Q?HX95S8AhsC01Fb1grYW55eR48gxmvXRQMd9jx29H7b7hAb6Zml6lyXC/qZMM?=
 =?us-ascii?Q?Deaet5KDXyP5P+fVVWtIencz4h7KmFVcPAIjAM1i+neSwhKDjO9v00K5Ou1h?=
 =?us-ascii?Q?iZqurohmqyPv4nXKKqSoyuxqzFALWdGK8q0xwHlPHUgaHezycnYBX4tp0DY0?=
 =?us-ascii?Q?cA=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d69b758-8028-4e66-3231-08dddbed308c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 11:16:32.6437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0XMkwXg+akpD17z/1CBV/1pjzJ2SLkJuFVLRo78dX0jlnbS6pDKdCtKN1YX/F9GiWU1twRC4pdmrkdbFeoE6pksTXlyT9UOjmoZQJF/7hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_041640_845373_B843797D 
X-CRM114-Status: GOOD (  10.13  )
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

Current dirmap code does not switch back to non-dma mode in the case of
error. This is wrong.

This patch fixes dirmap read/write error path.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 565fe3b95c2b..dbcd9d437077 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -686,13 +686,13 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 
 	err = airoha_snand_nfi_config(as_ctrl);
 	if (err)
-		return err;
+		goto error_dma_mode_off;
 
 	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
 				  DMA_FROM_DEVICE);
 	err = dma_mapping_error(as_ctrl->dev, dma_addr);
 	if (err)
-		return err;
+		goto error_dma_mode_off;
 
 	/* set dma addr */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_STRADDR,
@@ -792,6 +792,8 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_FROM_DEVICE);
+error_dma_mode_off:
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
@@ -830,13 +832,13 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 
 	err = airoha_snand_nfi_config(as_ctrl);
 	if (err)
-		return err;
+		goto error_dma_mode_off;
 
 	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
 				  DMA_TO_DEVICE);
 	err = dma_mapping_error(as_ctrl->dev, dma_addr);
 	if (err)
-		return err;
+		goto error_dma_mode_off;
 
 	/* set dma addr */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_STRADDR,
@@ -933,6 +935,8 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_TO_DEVICE);
+error_dma_mode_off:
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
-- 
2.50.1


