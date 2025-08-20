Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40096CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 12:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dpihme5mzGLcLLMNadXpFzHnxAv2SpPQgzsKExxfH70=; b=rhJxCyBQ2RHAgLPMtZh7hd8jJ9
	R56Pbe87W9KX1Pp0j+ZraRTxYJ5Eh4u2Il7CKZ/goA6krqJkqDC+DXWktMCMxdHnqdI2Nq32W7zTb
	hyQ2BrLS54rCbET5PX6Oh5Y5N1/a33pGQJRcOhZPLEy2hgpLqbcI/QfNGhvmnAwM8+IuLpARtUXY4
	GXnTFFvMSRvs0nHCiZ11GNA7g26oVHCzXp13sSmS8zKUXHXMHRTEoWv6asUfZT3OznC4LSRhSyGRr
	vByMlg6U0dDXiNo8oDGGzJxJ2FfxFVTXnZWYfx1K/VY78Ub47Cqwd99L8q+m2EWqeqZlln1dV0xG4
	41AjvSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiIs-0000000DfHl-34sS;
	Wed, 20 Aug 2025 12:52:34 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoi0Z-0000000Da0E-0qoR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 12:33:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vS8glANghkJEi9NMUCBbQ3RwVnpTd3F6O9byFmDLNVcIHYM8652/lHRGE9qrX+FeusfV8JVD7MX/ShStKoNdqDY+Zb+NvdpOC8+JOY4b4p/HuepM+t10t/uTycoYO/Ur+m5vWbzNaHluwpnmgz1HVWUdG+sNZ6E/XBONk4X/H1b6QWd1VNC6/qxETKGe2U4C4EAXPQEtO5gPw47VrS89c0l8wPKIfuBqhxXUT8/rRiHacOdN4oAIeTSKHa9lUUVD3To6qeD9LpYBl8+zL7J3AAqoIm0GUHTEzuBq7qEjQHi0iEcOhTd5nws/Uz1X6aC5SPcbbu4V7C2f+mTUxSlAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dpihme5mzGLcLLMNadXpFzHnxAv2SpPQgzsKExxfH70=;
 b=BhzNt1jLP7Bv92mnFU6lXLkA+YnA1hyZXWEoG4ZHWQwR7JgO1cfzNMpEhEUqCoUD/1Zd2xXFqUtcAP+AtTnibiC1EPAB0a2lVh46yy+kc4n0rOTPcWu3BHpq0fAlRFzX/ksPG+9+mrOr3XQspg5Oisp9FzxYHOqkrYwaE1yTFrSszaM9KNjN5RfMylrQPhc+8vgFTGoyba9eFvgjKSKSVUItiZBJHmwm8SAkuIhWqgCrLhmunClLn6tJDb3MMEm8plEIKLEpnh8d/aKV6wsADON2bkctvpzl2ZTzbPYAxHgg06HFUxWzoR/1ws6iVYXeKH9X8uF8r9psRmFJA7IaLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dpihme5mzGLcLLMNadXpFzHnxAv2SpPQgzsKExxfH70=;
 b=GxQ0D80bpxsKdDWojVIgq0MYLiLiSTv6B0NUK8EsTuw39F9hGNmxGMuc7I26ljpIhrTb/Khll8P+hGG3Vdj62c+4ZBI1tHYtuhQtTwO1xM0gdoaHFJ5/bsPzhuRPu1ERb2+vD0hA6HOE3C+DsnH7QfmXb6KH2pnT5fv6vj8vs1RoOtF4C9CS9SjWaaALMrtEh8WdPEO21k8ToiRycymtC3mXKNXs2jZqqglEu9+ob0V+bH/tSO59b/QvDoQtoj2OO074H6Pb7kRcusSJNY7tF+WGf15530PQgdCBeSj2qR/9PhRaIxkGCfjJiTj9B6QdrszrFfNRhGPzFz5y0mPIKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DU0PR08MB7788.eurprd08.prod.outlook.com (2603:10a6:10:3b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 12:33:30 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9031.018; Wed, 20 Aug 2025
 12:33:29 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v3 06/14] spi: airoha: switch back to non-dma mode in the case of error
Date: Wed, 20 Aug 2025 15:33:09 +0300
Message-ID: <20250820123317.728148-7-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820123317.728148-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250820123317.728148-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::14) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DU0PR08MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: cabfe00a-4e54-4d68-5b06-08dddfe5c495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jdvEdfc+RXa3kh7vdszXV/ZATE3ed9bShEcmlwGtCe9wDJXjU2VNCrq35d1B?=
 =?us-ascii?Q?JQhqKA2vvcDO5YdBoy0vZcQxyarhfcHiIBIBqTUQTGkpOg9avtLnvoo4IQXj?=
 =?us-ascii?Q?RSPg6Uy2JtVqXBdJjg4QgHb5BfAbNDq5IhzBoyDbxuBK3GllL6HUqXT2cSlH?=
 =?us-ascii?Q?sZ6kyuH/xIOYzUQIfD32jpwr2zWV/kkVr7Em/2zpSVBtTEQWdBwgokfjWLyb?=
 =?us-ascii?Q?xMU/l3y44pzpMewB0bwiQcJ+BbPd8QsQwutYLpHtkGrjEACCVz0NUOI41ECs?=
 =?us-ascii?Q?wH4pYbETgahRFncADooOvRnbH0PxrUTu6pl/VEQlaLQWk1hoke9ftcKGS2uP?=
 =?us-ascii?Q?F1MiO+cVwCt2/YXeaHgkBqBJbPS6iX4YVFwzu8f5XVJXKG78uWBeYhXQnwIk?=
 =?us-ascii?Q?ieEy9tDov39+txunjMw2fzID0+jPfJBJKL4k04xoETXORnsLMVXsrOlppHUD?=
 =?us-ascii?Q?138NTwenG4Ru5zHR3XmgEmcwldG0EWV4z+0VUmKHo0X1lPVL1EQauS946q6I?=
 =?us-ascii?Q?IktbxLtZKLuOB/l3XCLw1pMbGkNzUi0ectXO3vb4HlmRB0liJ1BsqM2AoHD9?=
 =?us-ascii?Q?3P6JBBTXhyX7jwiBYaNe7BB+EjxO6W7g/FNRtOKoFwEDcR6BT+jsmmLu0EdD?=
 =?us-ascii?Q?Jferxma0QTiSQQmpVz10POXmjP+oeM7rBRghgK/bIlGzkXSbjMZRd4Qm7/m4?=
 =?us-ascii?Q?oz/L6D8+zboQCR3NFQLMYh7z1EzKDI950Qg3HfEf6oYdGB4IvmTqhtU2YZeJ?=
 =?us-ascii?Q?TvjIr7D02vGqUcprin/waTZBHLgsdetK+t10hIP5u84olk4bUgReqg5E9Ct3?=
 =?us-ascii?Q?5QEB6yzvWmpKKxZnyozapq4/466DQQ6WobLUz0yi3n0cFKI8h7fDLTY0+Iae?=
 =?us-ascii?Q?Yt4LBvx7gLN5B0GUXIOCKWSi2c+jrycRO2kkqLyJnUYh0G1fX07W6MXhy1vB?=
 =?us-ascii?Q?R+SYMDqko2G3b274/GL286vIB05M71vC3RIfsLUnvyJPz/RJmpL4r6c2EUmU?=
 =?us-ascii?Q?JW52TYhMNzXRpF+Gvnd46vcQBNGv+baBsoUR1FZk/LQeqe1JhXcbkJ+X0PMF?=
 =?us-ascii?Q?ECkf0lNoQ9vX7TdvPS6wXtGV5GIc9VMdrgKxUk5gcrqDjF2OJPs/Q7mD/6LL?=
 =?us-ascii?Q?ZcEuds9F6l3Q8/Ilo6qRdWLMpoyW8ezt4m1L7vidIYu12GGsb13XfW15esR3?=
 =?us-ascii?Q?PlgzYEBzF4TcWjOyjwymIQE95fjeWxw9qRo3uJYzjC746E9/GhX9/h+1n71J?=
 =?us-ascii?Q?Gxw4sz8Ui0+1ZyxrEiBp5FrycQOTy6eLv0SLXLHvfG+kswqH6ABl7WQCPFpl?=
 =?us-ascii?Q?etRJ8PM4/w2yZg7BLNZuFQ8IQ3ZLZn7VGr+tFPgE9ab1/8FR3kXY3bDZWqCX?=
 =?us-ascii?Q?jU785PvhBwG6HSsVSLemca6PqW2X56l7I3zSx4b7X1vn3gnrszzgQVRNZaI+?=
 =?us-ascii?Q?NVNpBePlCyqKyEvAWp9EmhhJHjetr32sTa4vsuh76WHsm8FKs+5ZiA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Y9mkS0vF+d3TOHoirUYlbasrN4/nUHVu9vivUBqG+CTBTvCCunT7thP7WCT?=
 =?us-ascii?Q?nvZGbglsKRwtPxqrAsX2FQE9tDo0ZaNS49FW+ZAwTM603BjrQcMaruwNV1We?=
 =?us-ascii?Q?NWue57qLFE3xtQdrP4f/+qHzISsQicSMvU6bc3JjlBdIB4+VRo4aCogU4fhk?=
 =?us-ascii?Q?p51OPc/tqU8LCa+A459gAMMXngkGaqgrymybsuOd9eN/L/bCOqwUoEjQMxeH?=
 =?us-ascii?Q?eBjj6+QsyR4xdGYsyRPmXWMrdkQuJn+Jwomn4kdtwUi/ETpMQRnuxXprpUBo?=
 =?us-ascii?Q?CLV9rtjRfOqFYSG3cEoiwnBZgSWPOOHwiGw7YKrbfYsnbveYQ/49+CHc8h5w?=
 =?us-ascii?Q?YMnkCpwVeiLzdw3vzTHRZBU2S/DiDCgONxTooEQzyErzRsqqV4foLtZ4OtWf?=
 =?us-ascii?Q?PTkrhWsL/pebzxaX/eawu9Yc21adPqbYzrB/NNxo825D7d3OSIcMB5dBUsXx?=
 =?us-ascii?Q?An4fJJfzJeVUK+HtIjMEl0NlWR26NcV//LrVFPL4cDi2Dv7cAt4wX6DT1weY?=
 =?us-ascii?Q?9zOr1PilG9gvGZRnVYs8CNtBH4/7Uq0l4HVapwYVKDYUw1vYKI67Xmb6/a4F?=
 =?us-ascii?Q?plHk2bc8Xzw/dTB8QQpXiAY2rWwUZQoXxkicMCHaJNXN6gwPEBR63VDVLH9p?=
 =?us-ascii?Q?qXo2ftfC52e0KgQDEKBoRtyG7SwgbF/aCV7MCVIddpYKNpbuZfcuxce5IjWR?=
 =?us-ascii?Q?7NcmHEG6lAA5LBjEFYQpJ8beMBjH0anmfZsfaENn1EOkRJ8rFLSL6NOUjJwm?=
 =?us-ascii?Q?wttCn3OuPaRu5jerC6c2HfPt/zWOuRp+HpwlbtR9RG0Xhgh7AWN+qsgL6e6V?=
 =?us-ascii?Q?yRrYS57OfFuEUkGWKtsz8Kr1gp4xnXTZNVgapLn+N3of1wv4GnmL8xtKRJWJ?=
 =?us-ascii?Q?lUIGGW8dl/jCxQk1iZcQrBQkk4xbfHaTPwmAym+Tk3YDrkisL3fbYOz40WmW?=
 =?us-ascii?Q?VONNLlKowPassikJqKUrzdzGDc3hNjkIs7o8NvqF1RG6FwcfAuX16DUMVg1Y?=
 =?us-ascii?Q?E02VBSOkXxcd+jTP0XM0/WBPuPdyPtIrLuhJz8elMOHNAm7YQeNoZFvTZS6k?=
 =?us-ascii?Q?pADKTsCB5mzrro1YOXNOeZt48GSFqnqfCkaM3RsK6VQzlaHcrZSlHPu0kFMq?=
 =?us-ascii?Q?Wf92BMr0Ojl0OsV+5XLC8TzQXYRhVgiyPmqUYWH9d8dxf9LkNZyyiLiuGx6g?=
 =?us-ascii?Q?l+vaQmfSwLPSJTyeYeHD3iRETmPNqWKYDcMXndgtz//k5V5PRILavBkEtjoR?=
 =?us-ascii?Q?Pl7kxbzxW6PeHBY2PN9aTo7VvslPI6HYZQ21DMZkEJsfsgmNkEBZI5fddOZ6?=
 =?us-ascii?Q?WlwDNxW1csIDmvDdXG50sVuZC8JslhHJUQuXITyv7uZGv7AdowO7ecX1Jjsv?=
 =?us-ascii?Q?WGubi2yiBgGtxzk/RH7ZJxrY4Oft1oC6VA7CNDP6AbrLHwKcp18cAKy/+bUK?=
 =?us-ascii?Q?YdU1gWrlWWDL31PT33+3SkCzhMiQxRLDU6XCHKtZ9zE9Hl+kFnE+0E7XvPJH?=
 =?us-ascii?Q?QA/Au8VyyblB3pfk6u+bNN5oT2jE5g8Zn3fptXmsLLDHs4ogLh2mGyxHPa7z?=
 =?us-ascii?Q?yVcFEZpnsTu+3uqF72siRyw2fHy8K3J6mOIeSpn5jj9WBLkxbcUHSDoGNgWr?=
 =?us-ascii?Q?3Foj0mJzHfkvaDxYvTxRV60=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: cabfe00a-4e54-4d68-5b06-08dddfe5c495
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 12:33:29.6509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSCgnMhUqdBhHNGmc9jwRb7dNXx4D31ZZ26meXYZ2sCLbLYw0J84TyoiGSpcpT0TPcFuU0oXgjKZ4Fl6RIb7tCCsgs828kogY7bKBkjvkeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7788
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_053339_250860_EF7FF127 
X-CRM114-Status: GOOD (  10.17  )
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
index cd0fd5c2bc98..3f15c26a467d 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -690,13 +690,13 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 
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
@@ -796,6 +796,8 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_FROM_DEVICE);
+error_dma_mode_off:
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
@@ -834,13 +836,13 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 
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
@@ -937,6 +939,8 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_TO_DEVICE);
+error_dma_mode_off:
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
-- 
2.50.1


