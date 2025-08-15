Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFDDCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 13:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40Df0gRbPQ4N0fs+i+aMEb/JkAoZwD0KI2Cf0m1UIFc=; b=PmT7dPs1vDAB+Y2XyOOGTjaSLm
	WWlQOUBb7IzNl8YFnGBcEwF41cHMyd56YDfMjRup7Ia2srGj0zWcroQipjXbfll9XqLidg4RZFhR8
	pDpVvEGI175Av/un8dltvUVzJPZr0mgxpsxSkVZI+GM+UlFHgFubNkxKiT4DwyTRklimOn4nQsYwL
	Rru6EsgBawz33I9WlHR7Cp8ulkk2+Kb2Tml4474qjEVp2/82Ck/Tk5K1X9GK0UQCHOHP7DlfT4nyH
	bgrFKBZv8UlUPzq4X9gLNNhLSsxXLpPTYG9zMuxg7bqv6O+Ybq/1gZLh5bw7FQgcKfNOnA3C7NKmn
	JiCfPBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuwx-00000002dnU-2wuL;
	Fri, 15 Aug 2025 13:58:31 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsQQ-00000002JKm-3hBN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:16:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvKm+v9oZtJu4TFC65mbCPacmEfO7JLAAJSYLJ+55hfM1/fhySjaEmH6a1SUVwaphCl9GVc123Sh68S/yD26qL8HaFpu1zdS5cdIl3cgz7jK9XFKSAMEbQ/fnKbRHSYg9g+APrnqUjJf6SIi17wX46iYMI4YWwI0lOlG7qORYjSkhb/UyEC0TSV6tDpojzpLgDnL/9Gx2LaBueDH4b82l2r6x1Ori3gK17kIgY2XZkXU2XmQVY/w3194KmeSePi8YaCXnRgfNqfDiib+SiDhGhO2mLKlqZUiO0FH0EtG6LhX7oSWhnGee8ugFjCyTO1PcIR4ALNiQw034Xk/8sNOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40Df0gRbPQ4N0fs+i+aMEb/JkAoZwD0KI2Cf0m1UIFc=;
 b=QyxYCoNjm9awJtcoTYvU1r4/9cfqoCyd5yAjM2XYJYCxnjswv8abaACkSLnp03rTjIPp4UKEX3cLxG8Zv8ScOJnI+vGzqS7a3UgZmIBVFJbL7o0y8DF5zHhCKMerL5oCVrq+dw4I9O1dxmEn/ySh1LKn6yZJsgEpOVGv2hUAgWgpwRvBoE2WGN/gvUmauQYsDnhjc2HVcpjO5rqZk2H2MOa1Pz8CjadLNuy4ehKtMJ9gbnzKVEhy0x0nK2lGg2/ahgvSqltQXSlWSmMwOMME8ghNVb4Rv2DavYisM2PUkWua6mMKBeuuD24ahCAhRcdMjypyi1YTuZjn5nBUXx1Usg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40Df0gRbPQ4N0fs+i+aMEb/JkAoZwD0KI2Cf0m1UIFc=;
 b=hARBNA4jRYsZYq88EBVIAOSlNB1ZjErduL+W2gd7iNA+ceOWXTTlzGBqTxv6TiL6KW87tvAby5FHUpjcWoG1uWOc9NIKFf7IYda5TqVBNvhPndRFborYoayXsQZEK9ahny15C9TlL6ZGMhLPBmzWpAk2NKLWgmECXO9HwIRiB7EDBY36kAQIJ8wgE9CSgFsuQMBa75QTMBuMyUuIlVHaiXP5osH3WEnmAM7vVNGVA6qi8FnPbVC+p+i3Tmz+koQ/wmDBsqYnX9a9YFxQWX9orYwTe+OI3o/N91FItM//reeV6W6VCEc1uXCXJEIvO0H+ygsPsskjFgyi4hpmug4sSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DBBPR08MB6268.eurprd08.prod.outlook.com (2603:10a6:10:202::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 11:16:31 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8989.018; Fri, 15 Aug 2025
 11:16:31 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v2 04/13] spi: airoha: unify dirmap read/write code
Date: Fri, 15 Aug 2025 14:16:10 +0300
Message-ID: <20250815111619.45001-5-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 45bbddca-f9a4-4c98-cfb6-08dddbed2ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TfbE8gja5wzPirYwUpVhH9IvIzcBcpA2AJQeym24YpjhfaGqWYZffYK3Bl+t?=
 =?us-ascii?Q?xfYkpdHpm0SwqsqGqxlMor6wWbQs8CE9AcFK9mrHjOZmabVNWfhXYATLJXmc?=
 =?us-ascii?Q?TadlVhyUe25GOg6kVRv6OppDwkLGbvROeY1ocB2ZktJgAQT7F3WDUBvVjA1x?=
 =?us-ascii?Q?vb+C1I4yfNIYlqlmMiaKVEEWkjFlDANk27N4Vv/lWOSI9rthgMbIWw3QJmX3?=
 =?us-ascii?Q?Zot1YWtUf2+q39z9whZNvqv/K7C1tBDr4cAsuSmR4qEeaAmN/EX+NH6pCl71?=
 =?us-ascii?Q?zgzwOPmvWAS7OJRE78aPjLjIuBBvsByumUy1qwU0T63duod2VIC+uuE1Z6G4?=
 =?us-ascii?Q?WsYsa1kRk1JQNKuW9YkiX0lCGcf7uGkSsMolAEL8ApYxlvFiGy1wWl+nc05g?=
 =?us-ascii?Q?UKVrj9zL+bjrLK+3cnIYiEMe/smMaRNCdGZKy7V4tb1JDF0rt7yhnmkO+GZI?=
 =?us-ascii?Q?1ePKadU7KDbrV4OVItOTuXZXE+741IYV1nqvIXtORTdI/OXN0fw3W7QwSA/1?=
 =?us-ascii?Q?oDZCPW/zq8DeSjFS2E7OucZCP4bxVcqH86tqLyGSdHzB8aAvXcmYW3qncuNE?=
 =?us-ascii?Q?ElcVTinXLKSdm1lKd4a3NAKEhQzxHtkkIAChmTYo9db3Y3O3LWUMyiZmwuOo?=
 =?us-ascii?Q?J/8pGWKElkMAEXu6yc5VwtuUrf+B+AayxhHueNZYR0GIHla1kVE8UkmGmpbp?=
 =?us-ascii?Q?uLLSGg0uiCdGtwGsNtN38Qi0olFpfB96XmQQOMuZxYNR4d080ds6qM2GfHy0?=
 =?us-ascii?Q?9g2uY5sq5gjpzvsZ19mHSMHmX8MyvIzdVgkruDWsDxRomu7HFxQQbdWGjHzn?=
 =?us-ascii?Q?oX1BhEnWVoyYz7x3V+5VVxqxcetURNrEHVOf/ASeJGqqh2BqM0WD0Gl37/NT?=
 =?us-ascii?Q?SqmK960EvXVliWsZA+Nt/dfnoextM2t1MCXkuMFJXjuUci4isZcZXuDwrevE?=
 =?us-ascii?Q?Z2+j7ei/ffhFooFNgDf8xE60p4TcCpWwyisDHdoetrbEOKBEPsGhkvDeUbD9?=
 =?us-ascii?Q?ZRWTvMnO1kdzUltEjSsX3jlyd7PkGyYk9S7NDvwqAFlcvOc56pcpHaQPcT4k?=
 =?us-ascii?Q?lH61P7r4yK7aacJR7IY8MLfwWsK4PqY55lBYRiUF3HXxRBwiEsB+nNSWMv53?=
 =?us-ascii?Q?zes/VJ9blC6MDaCU9GpJ8OQr65cDgtsUrv1j5S5eEfljchkgfvYMavAcg3Fk?=
 =?us-ascii?Q?RoANlA+VHS4LY692YNESPCXJeounl4dA7JjdKnlx0IGZ10yKX3XaGPWVTCf7?=
 =?us-ascii?Q?O2Al83y14/eKdx233TNLnnxsQgY/b2YmoNIPsZWDKEBsWuLdQM8oXUPe8755?=
 =?us-ascii?Q?W/Drsv/E3gfD+dQNh2t3LBzJA265wlb/KfYDMUcu9afPrvVOFpHiROkSRqwo?=
 =?us-ascii?Q?KLinsFcLDkSrWv3GTLB2zBx5/arVsa4NRkhc6gbfMTIAlf+HwMD3tOSPmjMK?=
 =?us-ascii?Q?o0hgNWfC05xE854Y6pJqbV1pZthJWmITMrfQPBP4IuDP07Sc8UGdtA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JB6AsHHT/ebGo5ILQoxtRoHLDRE5ztxYqiKw6ReMsuAegVwM2Z04ldi0xq35?=
 =?us-ascii?Q?iATzeNj8yVzjWpItoIDiZVMH6fXyhMYxQViSPvJe/Z0lRi1kBsitwMGhpLNp?=
 =?us-ascii?Q?ntwBDo39ZGWxAjxhp04Uez2fu2aqoTbmwuw1lH7p5LpoldLVHEVyzJt8USYo?=
 =?us-ascii?Q?+gQFSsI/sQLK/tHJ/IiAuhg5hadXlNRQmgCsEtz8X7eSUi3uMilAfed25lSl?=
 =?us-ascii?Q?rcRIgT2ItqRzuTXlDZ6z2QFORcklxfK83onJtJjZhqvSDcw/jb1aJkwWubxa?=
 =?us-ascii?Q?8knuLUkym5nM6gIGdWN/2XDXM391T9wmtSGaqgjCkbqzGQC218pDNOodDN6i?=
 =?us-ascii?Q?Dd3IdhtMSuxLdTnAwTxqC0Ho8sCFOp/y4pBoIedT88XTqRLjqTOoP5zL3ktv?=
 =?us-ascii?Q?088bPRB4BvYt6rEDpS4OZyDfJPEmJxFLN2i7/0Nbn4i9VQZc/5sEW1kZWzLP?=
 =?us-ascii?Q?TFgys7p6KBkDvwiVl+n8ib6vIZdhuUrcLQpN8Bc1vxrNkTzvc233NEy9hCQF?=
 =?us-ascii?Q?FTFrFXsOhUc8bOUUDh9iurBFu9TBrAN5afaWTyjKMSVIRfzxrG81aZbLKe27?=
 =?us-ascii?Q?degCDu+YaRFixudXCgdS3Z/1VZzkWyymZR2PUJDlDYmcnXKpk9F3h9HuRBvk?=
 =?us-ascii?Q?p1uqmjvqM/1uDQtYekbriVe5+mEpL8jaGpeq+KMCLXuWz0wL1p5dj53JoztN?=
 =?us-ascii?Q?jO8PwSuSjmmer6j/YVukPNtYMxgGLd34yrv63/9IOg2m6gakNwlEeIow9ZQq?=
 =?us-ascii?Q?XrWejuajF597vIBdyUExiyr1Y/qWk3vf8x1fR1jEqa07A+lUCOvrekpVWPNw?=
 =?us-ascii?Q?fd/ZPwVb1IiJL11r3UgMLaJeD8Z3FtzJpWdb9bBmO3/cWmghYIGn7K/d5Dhy?=
 =?us-ascii?Q?/kQiYgr+cSeBYD7VbsyOww0sRYrBl7k+cOVjn5YZpIoI1uWWeGLFRVomKnb+?=
 =?us-ascii?Q?Mu59c7PcNaTBhfdxTI6VzHkORJDgs5+3+gSn73F0k+4p9iEZbWn2Gdaoyl7T?=
 =?us-ascii?Q?c1pjf8FxfBDQbo4nO0v/xffg4RqFCd0npCvNHIsVlUBQSNd1QOLUUcY+99jQ?=
 =?us-ascii?Q?/v22Aq1GHmI0hccUlmNzCqKRJDBTxnJRGnQO2HpkWDsp7oIw2y8w3QiCxEjG?=
 =?us-ascii?Q?l0Jw5iJh4xjoyYkl/Hu+9Ezni5YhhJEkyNxsgAE4xfjif3whSG0aQ9veqFPI?=
 =?us-ascii?Q?Sli7458Vtbsqpp2mjksaDkrdSke1j2/8Q7gZHfghoHu8Eycnj9xV8LrO1elO?=
 =?us-ascii?Q?+k+H4o/6p7ch3ie5PCqRZ9EER7VqDheKKYxs3ImymwjO0MAK6dRSRasJVHpW?=
 =?us-ascii?Q?c5pd8Kk13/hTbxnMJaGQxgunN1AY9hpNoHq9gOvzAtHFqdtbv9KtqgEN0SEo?=
 =?us-ascii?Q?BuZrPk93Ors9CoxCKEp/Y7xi8V5Y1N5jyjenaNxfQyXuwDSpW5Vhg0DXKkLZ?=
 =?us-ascii?Q?nT1M7eiulQXsrGYJAxbPkRLm+iqbhF9a93Yt6ZRd+HZJITcOb8e+je5821uz?=
 =?us-ascii?Q?e4VfQ/kz/Ciq3AC88Rd4hyw++oqTscR015I0R5NzeM+DNZzLTLVId2+AI1Fu?=
 =?us-ascii?Q?8VNuACLw8qtE+rqaQtK/02//vpctUaYQ0CTLBjdjI+O26FtRGFhY18XT57Th?=
 =?us-ascii?Q?7A=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 45bbddca-f9a4-4c98-cfb6-08dddbed2ff1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 11:16:31.7117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HTJ9rUVvTqTP7VOvIoNBXgXLYufdSC5iAgfadOZif47Top5M+759jhIZhOyZF3OQOBZ8wtaiGnFmgSlR6DtS6lwfQvHGxEk161HnBGIy3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_041646_923698_52108325 
X-CRM114-Status: GOOD (  13.75  )
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

Makes dirmap writing looks similar to dirmap reading. Just a minor
refactoring, no behavior change is expected.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 49 ++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index a7adced583c4..565fe3b95c2b 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -666,6 +666,8 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	u32 val, rd_mode;
 	int err;
 
+	as_ctrl = spi_controller_get_devdata(spi->controller);
+
 	switch (op->cmd.opcode) {
 	case SPI_NAND_OP_READ_FROM_CACHE_DUAL:
 		rd_mode = 1;
@@ -678,7 +680,6 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 		break;
 	}
 
-	as_ctrl = spi_controller_get_devdata(spi->controller);
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
 	if (err < 0)
 		return err;
@@ -741,7 +742,7 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	/* trigger dma start read */
+	/* trigger dma reading */
 	err = regmap_clear_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
 				SPI_NFI_RD_TRIG);
 	if (err)
@@ -797,37 +798,47 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 					 u64 offs, size_t len, const void *buf)
 {
-	struct spi_mem_op *op = &desc->info.op_tmpl;
 	struct spi_device *spi = desc->mem->spi;
 	u8 *txrx_buf = spi_get_ctldata(spi);
 	struct airoha_snand_ctrl *as_ctrl;
 	dma_addr_t dma_addr;
-	u32 wr_mode, val;
+	u32 wr_mode, val, opcode;
 	int err;
 
 	as_ctrl = spi_controller_get_devdata(spi->controller);
 
+	opcode = desc->info.op_tmpl.cmd.opcode;
+	switch (opcode) {
+	case SPI_NAND_OP_PROGRAM_LOAD_SINGLE:
+	case SPI_NAND_OP_PROGRAM_LOAD_RAMDOM_SINGLE:
+		wr_mode = 0;
+		break;
+	case SPI_NAND_OP_PROGRAM_LOAD_QUAD:
+	case SPI_NAND_OP_PROGRAM_LOAD_RAMDON_QUAD:
+		wr_mode = 2;
+		break;
+	default:
+		/* unknown opcode */
+		return -EOPNOTSUPP;
+	}
+
 	memcpy(txrx_buf + offs, buf, len);
-	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
-				  DMA_TO_DEVICE);
-	err = dma_mapping_error(as_ctrl->dev, dma_addr);
-	if (err)
-		return err;
 
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
 	if (err < 0)
-		goto error_dma_unmap;
+		return err;
 
 	err = airoha_snand_nfi_config(as_ctrl);
 	if (err)
-		goto error_dma_unmap;
+		return err;
 
-	if (op->cmd.opcode == SPI_NAND_OP_PROGRAM_LOAD_QUAD ||
-	    op->cmd.opcode == SPI_NAND_OP_PROGRAM_LOAD_RAMDON_QUAD)
-		wr_mode = BIT(1);
-	else
-		wr_mode = 0;
+	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
+				  DMA_TO_DEVICE);
+	err = dma_mapping_error(as_ctrl->dev, dma_addr);
+	if (err)
+		return err;
 
+	/* set dma addr */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_STRADDR,
 			   dma_addr);
 	if (err)
@@ -841,12 +852,13 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
+	/* set write command */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_PG_CTL1,
-			   FIELD_PREP(SPI_NFI_PG_LOAD_CMD,
-				      op->cmd.opcode));
+			   FIELD_PREP(SPI_NFI_PG_LOAD_CMD, opcode));
 	if (err)
 		goto error_dma_unmap;
 
+	/* set write mode */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_SNF_MISC_CTL,
 			   FIELD_PREP(SPI_NFI_DATA_READ_WR_MODE, wr_mode));
 	if (err)
@@ -876,6 +888,7 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
+	/* trigger dma writing */
 	err = regmap_clear_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
 				SPI_NFI_WR_TRIG);
 	if (err)
-- 
2.50.1


