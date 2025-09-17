Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D80FCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K88grx0y09J3/wf47GVoGuVjwFlXUQKbW57enA2smmw=; b=Vg/EVtV4ipW/8jVij/jvwyrfFK
	WVEn5I1Wsuuk3i4R7BxmSWZSYNWQ2Z28J27s+h6XaCN0F7irujfGj6s8Bz4DFjPZEDhVjOshBBGil
	NNEq1XFUR8i8ozGWSezTsiGRDmaMLdJ2fCqawLX4C7p1R08KkZOyqX4BmTw5ziBG2v15SNSwzd9Xb
	O/teKm5o3yh8MZdPj6iNe/nSeEbvxWd6ZvD9FxUU3Te/TYkU74g9B6Ry56GkzwPFCdpmyFYJG4NsF
	0ozDI0qHYrZWK6NMObh/U+R7yaE4VeZhQoAyaocUp/THvCy6aDxln7ozoNykNK1dLWNn9CIGHJS/r
	1rJYzBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0BJ-0000000F55W-1dhT;
	Wed, 17 Sep 2025 21:59:17 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0B5-0000000F4tM-2Xa8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:59:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBHs05/Uj/8zrSDjLpGkBzm9df8qC9XYoZLidV+4SC8jzFc0CiYf/pGxuNarF6ZU/3bNl5w3YGN9PqG+wvNiKVMMzvcG64mrI/yqXLc61aFd3DCZjDQmxN8p0zVdAwdD4UYWjide65sle8G0P9Sj6wOupzK+LPU9byABL9aFVyujW+KsUvVVa9osJRvnLva5tBRWjhmbMRz9cy/FG8JcNvac4x2c9BCNt1nfuviLhpSaoNOUfmEFlAGZJZPFAf7hOxouZ8vVGdPffXFvtOWjbs0n9op9DLuRB5urv4UL2Fcj1YMnN5MfPf8EOE/FmEdW6cKy86+DNdJ267/mYeFQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K88grx0y09J3/wf47GVoGuVjwFlXUQKbW57enA2smmw=;
 b=rFy+6Lg2zFJsCtIyVwzaUyLBSrCk6YEa45QHCvaU4xRTrqZ4NNbCevzW/ykRX+qiaa0zA03m9KoohrEdF1O6tbfMXuuwzG0XBBKUdR+OwBk8JywUXdp9JlAYhJMrUM7CiZLhz0Bx0ju1qHyYmz61xGCVAk5Grdu9KKg+Cguy58kQ15r7ZjNUmBkkrJbsb9v4X02JbTuqAIhv5rnJcHmmMiO3L2BjEtPGNld9uscBU5SO03kPj1GHjnBDu3nkqZt3mbt993f6LBE5oOvq575eWkCRuHVJ6r5HVmUaqEs9+isDjJptpeY8h5gouS5xSBjkweb7ChY2Mcia/Sl1yCtsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K88grx0y09J3/wf47GVoGuVjwFlXUQKbW57enA2smmw=;
 b=ipQOuSYNkoTgk+MoMaoDKYHNJNQSKmqXZi1ULIrJAVP+DJKRfTmOpQ/0yiHytQKtR05eU1HDfXyYe2wxWuWXg1bnGhq2rWz7FkYePVYK7aO+GQXF6B6lsHztOElg72VmZHG6wrHecfADd0yah/JsiuwoikMlAJOgof3+QFzyhR9ag+bkuSiX83h0hg26BmLEffnYu8vDr5Ok9hOtdNcNjo5ecv3AGSJ2AfeRI1hufS+vrm98HDtSM/IRrBlFCckMcJbqcaktbU2tKosItI+FEonhHekJu0FTV7a6p0+3XfbC3ZqYUr5lDlmRCkBv557aw0U9iyq+osGPznuYjDeYXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AM8PR08MB6322.eurprd08.prod.outlook.com (2603:10a6:20b:361::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 21:59:00 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9094.021; Wed, 17 Sep 2025
 21:59:00 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [PATCH RESEND v5 01/13] spi: airoha: return an error for continuous mode dirmap creation cases
Date: Thu, 18 Sep 2025 00:58:37 +0300
Message-ID: <20250917215849.19720-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917215849.19720-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250917215849.19720-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0640.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::21) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AM8PR08MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: 3689d7b2-1142-4118-a6f3-08ddf635683b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/TpD0XF2mw5DS6TL/jgX8Ag1/ycHT7T1fWdmQaq2WW3yZg9dQwr241WnVJAZ?=
 =?us-ascii?Q?tk22TPcNNb1tEN8DBIo0a7Q5E7J0VwxkKeETp+ynH2/hpcNTS6Srf0FIhGm0?=
 =?us-ascii?Q?mX5+pJhxtQxNcpTpWCBT9y0pG7saLQ1ZXSPYP3KHoYh7WXe47UOuKuRE8P2Q?=
 =?us-ascii?Q?9+thG98b3qKMIDMTpy8C1DJ4vfA2ONXViUaPRbhxTVDUK4UT9seYF7KpuybU?=
 =?us-ascii?Q?Nxe6aC3elYMBxqRT15Z+8HZOejLbjEyQIVn2Fd/w/re0rHX25RRI1cmZMV3K?=
 =?us-ascii?Q?MIr591DIdEOIS7g6Ptka4upk3Zam44ST8xMvgwFomu6KapKOZbQLFREZ7kwP?=
 =?us-ascii?Q?g+rKHn7Lh0Z+NQr6KlhDKHEz+E6/pX3ma0r9aDk7J1iLSzktrI3ou1JJ+YbQ?=
 =?us-ascii?Q?JhyX7kr+yDJAS/RrxsLG0BV+pJhdFBdRT7JFJYVGj7E7JvVri1D9tAtuIHIN?=
 =?us-ascii?Q?c3ExC0VnhcyCJbpY6qrrwm/3ymaS0eDgmaYAvH/Sgj6CbQBGRN1jlWUAPwez?=
 =?us-ascii?Q?m9KRdFJhTejiBtL4t0mk4FNCaL3q5ybBAudKW+k39yy9DMzab24lOEFB+Di5?=
 =?us-ascii?Q?s90EPws/imBK8uOp0koGeJKnk0kqZO82FLxPwqE+RF1cZaLlgUaCnvX63gRA?=
 =?us-ascii?Q?BZdI7jgbm6Erkea8KlDRCvbf1nv2JqAhMf1PIenvkPbrx0kPmrVzFbVyHq+q?=
 =?us-ascii?Q?PhZ78CSpqkQ+Z7FgjfyV4nk88Io1Qu54VysTe7LvYAGUnxqUE5GZoHBkbol3?=
 =?us-ascii?Q?vioU4xG7wut0PQwwgINWrLoiTjuvpj94B60ldTSTkPCgZCAvb4vbvmbA6R/j?=
 =?us-ascii?Q?aZNt3k3s0akWo+3XoRYbe2C7dhkZywpKzYIlvNOZncpwUpq2+fAZV/szTVuW?=
 =?us-ascii?Q?lhWrBcTX1arPpstgxEqGAWLZRwaWhsnDh8BYD3opAekYWA8YNX32vutI/jmN?=
 =?us-ascii?Q?sTXC0VULRepzwJ9iAXIVljAttZoYj0Pi9a17i+H8lKIDLNMCgmH47sPRf6M/?=
 =?us-ascii?Q?SmxXoAqM0Y4umfHzsIIVRLPBZiOE3II2SGi1f2wFrWXLuSWjAf+tFvcYL1IP?=
 =?us-ascii?Q?OX3pbiB4rAfk+7hQ0+H4dPLOEKnq9c3kOoBfkc7fZIa8Yf7g3iKO6Vr4gOdb?=
 =?us-ascii?Q?4oq8O/++nDx2KlNgg3CC+LHEq8SCH6Km77SP+sGY3odAyLeOT7/YndApuPJx?=
 =?us-ascii?Q?8GoXawAYhbSNU34I1FSP4jYlLu1l5GeY0/Gum36gUAv1HDUWL9s3sJgM/Nv1?=
 =?us-ascii?Q?OhWyscAcTiZ9d7xi6m1cWpiMo4MhRsv+liAyhaoCBrbgUElpXrl5NCPuXgiL?=
 =?us-ascii?Q?gj2MaEpv/Oo5XoPpSnsVs6oSL/TKBcoLFxxHs6gksr55dflYPaGlTnsuiYdp?=
 =?us-ascii?Q?ABurb/d+TchqiaVrC7j3lt69Gj5KiBdB/RL7i2mehbyAcm/YkL+4oGhIImww?=
 =?us-ascii?Q?fr7c5p4ZKGpmimvaOi+7/QM9gVxLzxbcxEjAgoDhGDRAAE5q63sLtQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U42atqvEAYL7Nc0YMOOnM04nrS0Ah6ZSnhlKfTgZaFlhI73DFw4DFOiFeU0k?=
 =?us-ascii?Q?5M08HPNqbhKwcjTffEV//dJrxv+adg17y3TSwEAf5JaEJHJmlEuES6fm6EjI?=
 =?us-ascii?Q?B06wD+WRifuUDq/T74Xs5IjO6DFFFbtjb6RNaLpsOfyDFfH2IpUnYHBEtOJS?=
 =?us-ascii?Q?0gy7dyKhMk2g9226xJKSCIL2pjd17guL9kNE+s5SAdD/RnLSDI+lCLsrjIn1?=
 =?us-ascii?Q?l01DQp0a217uTEaVleTZcbnIb6/eQzvM9Bt+04CLsa2A33+fjJEtrz3KaQUz?=
 =?us-ascii?Q?1RhBf5Xlp2GOFYurZLwB340EUUUbb5vnMRo5jJiUX8CsZ4bE9brO8OS6PHal?=
 =?us-ascii?Q?CQ8MFfrg9g30HyeKjbi2UBsavxCuYleyEa71ZTPX9tDyOMwSM7xqiQLr1aZi?=
 =?us-ascii?Q?/H6bUUFZsFnkd/YueqUU3EJ/eli8Fls0FVaEL9vwYKGWsA0Fj4uQ7qhxwD7R?=
 =?us-ascii?Q?taA0ggwyYaMxKkF0ir3hQE1AXw38ys7o5yoxlq72obK+9tHOpQv8fSRZnasN?=
 =?us-ascii?Q?zyqDO5GByFRUa+7RJqyoMiUbcr7EHJrAXCU3i57V0oiI8Y8eQIIM3mwceOMG?=
 =?us-ascii?Q?6XWaa4jPHvba8Zcw66mUlPg4vPoqybE4NUFelF/QlATPO2ukds32nuRRY7O4?=
 =?us-ascii?Q?TXUU4PMq67V7cgePjXk1E60/TkaiWS7lg9RgyUD3VkVz1KeYMErt/730Dzw2?=
 =?us-ascii?Q?m+LbLn+4/U9Zsd1wYH4md8XnUHXyXMG6ORmn85Lj1vfj4VVXXyLAmITgu6xB?=
 =?us-ascii?Q?uDrRv6ZEQNlC/FIlweVKtUbfTCpZ7zGLyHb6dpW+bo3bo0jHf/j3YStuIMsK?=
 =?us-ascii?Q?QgJFPGk1m0S8gs8Y+HbbLjzx1A4M9X1DsZJknQsVeyFLGTebY7QDGI8dnecL?=
 =?us-ascii?Q?R0/9Q8R+Cz11QVah1gjnyTvEZG2nzbO2ie9ZeBwtRF/Kc+hgW2ae6EIo/IhH?=
 =?us-ascii?Q?+Sie5ilDPIa0sQEuGB+GbSsgbM4POZVuF3bdQ2c0eswHIRwJ8weQXtCHnc/G?=
 =?us-ascii?Q?Ml4FchBXJ5J8zLH+bwIHnixa3OTLbRKVrBRWtsHlr7JqqH915T9/8CwdkuYX?=
 =?us-ascii?Q?vKZuBBiLi+uspgU7y5BjUzVMcBRBSecyVygufNspUxNCMpJPapE86Q04SsRb?=
 =?us-ascii?Q?B2LBRYiag+hrysSccnRaAA8BUjKWX/ufP4jrITDc65C/ffx0V7D2MVp7pMs4?=
 =?us-ascii?Q?w19QTD3VZP91tAS5q7MuMIEhV8SRF3iSStnEbG/vaidOQWZ+5sytBubR795C?=
 =?us-ascii?Q?3RKQkVidB7CduMTXPx0rOrAtxIAsk/IPwhZwiEtP7dR+n8nNnTLKmPRR1XXo?=
 =?us-ascii?Q?FtzTZyBSWtLLfJ15C1JI/c+Phg4mgkkiHqySlCjtgfMTNb7c7ARLf5DC/hnK?=
 =?us-ascii?Q?PEW8sfZy3j/PEezwfbYCGBWniKnUpousBkHX6q2mm7PEi913qqR1Evbxd7zy?=
 =?us-ascii?Q?WuRj4Pgf05K8O/7iMEzq/Ui4fBheGtiGg9jrp2HY/HsCYa95I5KImsWKeZdi?=
 =?us-ascii?Q?GWztctwxEcciCFHx7g/aNt6Xx1GZXa8Jr/k01CUcHNI86nT8G4oAFQiI/SVJ?=
 =?us-ascii?Q?QxkoMmZgq8JFESoJYbYInSycSXRb0SytI1c5fi5qnH4xt3dzmSV8/H9lQOqL?=
 =?us-ascii?Q?TgrnzwpOf8NKVX9VY0NaPlc=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3689d7b2-1142-4118-a6f3-08ddf635683b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 21:59:00.1090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o96rX7lf3mfDS7Se5VxaMl8NVc8Jks+zv9Rk4IW8Ms0dI6QhA8eJFx6eOHbZta6Dbggq1pjK9++SGsnAoBQQ8ZbPZHnlrksEjUzz1fLdPqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_145903_647213_82CF3D69 
X-CRM114-Status: GOOD (  11.82  )
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

This driver can accelerate single page operations only, thus
continuous reading mode should not be used.

Continuous reading will use sizes up to the size of one erase block.
This size is much larger than the size of single flash page. Use this
difference to identify continuous reading and return an error.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/spi/spi-airoha-snfi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index dbe640986825..043a03cd90a1 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -618,6 +618,10 @@ static int airoha_snand_dirmap_create(struct spi_mem_dirmap_desc *desc)
 	if (desc->info.offset + desc->info.length > U32_MAX)
 		return -EINVAL;
 
+	/* continuous reading is not supported */
+	if (desc->info.length > SPI_NAND_CACHE_SIZE)
+		return -E2BIG;
+
 	if (!airoha_snand_supports_op(desc->mem, &desc->info.op_tmpl))
 		return -EOPNOTSUPP;
 
-- 
2.51.0


