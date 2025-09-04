Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF93CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmqk6nuuKvzdPF/l6IJlcU0ymhTCFF7IF14geICk288=; b=4AHNYwuKNzf28M6n6twMAbvIrY
	HBTFhkBQ5OfljyNtxooNu5k8VtIO4ATeyxpmX3ap89nOjq9+ZxO0vT+VqJxSDEnCM+XXTbC3VBirI
	8dCYKYF10XpvwP04ms+ASONtW/PciP+UXBESaZhgW8+867pCZtgPWMHVWpNTsUmMskMvHQrMmEYqZ
	quriKfO/MoususQK4qQB4Oj3bFmkhxVzwkMnwnVASSa1+LYmvxRX8JTs9y+J31qAz4zHcgRY+q9r7
	NxvtQkulVYB/WomFCctBCK2VvuQbfGuW3VFwPUlKpxtoK9yEJNxHTwD7Sa/KDNrZOWNXItuiSO1Hg
	GgqhJmHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFzL-0000000E12w-3MWd;
	Thu, 04 Sep 2025 19:51:19 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAsa-0000000CBdZ-3s7J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:24:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJO1FDoMyejJsG47P8XBsUXrFCmD1yGyjrF6M/xDcc+9uC+WpiQbmaGxOBC+RubahiR+XHrSKaIErEf5LL9cLRGHqQXrc8c+dzRWexA6loouA4FpRIXLWHtJs3Ca1l0ds1n8oL8A7/GaM29PQeg5Tk6y+5J+rNXY8fbyMqXn66644UCSx5tE00ixDDMj9AmJVqUfHEzpJFujMSgN7j0SdpyUcwSGAIIErgQWJ3WvVpys8dIBtsbP9YIsmntZQjdNWQm5ZZoBYw3DfaThF7grRbiw5G8opdCGNIOvAGlcfzfM3iLaeRsSr1n+ZkBli95TEcB4s0X2IVdO3iIx8PlW1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmqk6nuuKvzdPF/l6IJlcU0ymhTCFF7IF14geICk288=;
 b=O7MP7dmlgzwjbPl+B5gZylKrtG49YM+LrBL4DcjNarABY9h5MwhAroaAhE50DkTixliTTHpugKsiul6hnrDG/Ylgt/iVroL/dN1/+jeF2YManlNTkVjYh0tZUhQQslEyOwZFTXHYhw2UXnudthWkdQ8exVaLiuFBh6CxllIxKwh2v8BFGLCAGHs3PwTJU87T0Z18nwi9Ph5/zCOSV444wsicljW9WMZKNujQpmWFm9ZAKRWOo2g4Zlb3OSQtLgladat9uKRXdzltPF8vu5puEVf7SeL7/QI5Qg7PW/fZrFJhNZ+NF7AEojFhxjGb9sCsBHVJYi7eOVQ259VU2zNMAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmqk6nuuKvzdPF/l6IJlcU0ymhTCFF7IF14geICk288=;
 b=mOB/BIrIB5u7h0ZnWAQdeLzmJ2meA+DylzpR8SV/4jw8M7ZnkhYzmHUgGjDtJHYQEjxphGzQTgndUEg9CUWw1YlTBnSMSOuJoQ/kMEcMC0FALReHcwNtq4/ZM9do/7cGmKYvYwvqXHGE9fCbHPy+9BrPSaTEGt7kjkawTMeqWDsrITVqBEETD8gqYpuJp79DzAJ0cf3Si1w2g6uRVcn4lCoq6T3dQOnzQd8N24IG9SSIO7Q/uMRK6hqmgENDkajbZWkG+oYgi6QGIm16zNUlazKXdvgzqZDbyrvxUomNdS6k8UoaAa/q+s+aIEl+kf3arsojUxokf8jJuFhEHYPTJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PAVPR08MB8992.eurprd08.prod.outlook.com (2603:10a6:102:325::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 14:23:54 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 14:23:54 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH RESEND v5 05/13] spi: airoha: switch back to non-dma mode in the case of error
Date: Thu,  4 Sep 2025 17:23:31 +0300
Message-ID: <20250904142339.656346-6-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904142339.656346-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250904142339.656346-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0047.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::15) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PAVPR08MB8992:EE_
X-MS-Office365-Filtering-Correlation-Id: c037873f-1980-4356-bc8d-08ddebbeacf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZQ5+AD9a8AsSmU4NAqj9urGv23RBXF1S+dk5D+vuJma+5X3eVa8JMWP8fgAl?=
 =?us-ascii?Q?59ijvYo3pB9C6cdSkgRaiTwKkHOtZ7lSAJ7iO1sYHAxKfvr7SKpWkcM6hamt?=
 =?us-ascii?Q?LoG/WCaf9Ne0gbmFOfD/2+/UlKAmhxfDjI89H6g26cHsJ5tLbw5hyV3Cpe5N?=
 =?us-ascii?Q?RxOKLlLim9Ct3mQ+Nbj7GwilttETooDbT9NfOwPL3ukGqTipVxy5sK/baBPi?=
 =?us-ascii?Q?C2xGwM8CNjLs4WPXZaW4KgURSLzDchbgCcLefpbi1QnhTAHvGDP61FIIhf5h?=
 =?us-ascii?Q?02W5gc8uHiQCTKKB3XHJm7qPKNJCmNt6zbc2jc/ELl/2KFsZJQCB+rgquNhn?=
 =?us-ascii?Q?MZTdKV7dOneBQa1FBoH5x0J7d/VkevuMffHgOQITePrD+7io4o6m4gq5QTLU?=
 =?us-ascii?Q?CP4MfcVLJjtEM7HKckUV2F6CoUZIYvHStjRhiR8m33YuDv5XMNViA0bje4U0?=
 =?us-ascii?Q?3+QO5fyPIxo3Rvgmnet8+3jm4DnVffu4KsBG8kJ93NViHw2tFM3KkwxHO/xr?=
 =?us-ascii?Q?2iFdAjUMkUM/IL1PNQqLymj3C9TNiNRhB0RLjEp/z96VQZAlyv14tGXINF6Q?=
 =?us-ascii?Q?jNgWQc56p4VhuZTi+94SMwDb7iSHZxZ8xCnz8LaQIZM7J5DRXnqmbWFX6I4g?=
 =?us-ascii?Q?HHF8FaDqI+F8swg5GRlkaJp27PJrJXPJ5/N5jRYZn8kxC5DmySUaDAhbcw1l?=
 =?us-ascii?Q?F3BcA6efC5ngLZ8mIwtzY4XKrIvT3Fxbe+hf3gzqoK/cwPuae3K7enHBjI0q?=
 =?us-ascii?Q?C9FJEmECZOPbxM6Avjk9gYY84gcIln1tymiPX2Fuq4X3gGnS9xRk3MUHKmiJ?=
 =?us-ascii?Q?kug4lqH/2w70cTjeAp/sPjMn1GzY3xSwL3K/9XjGlr5X7PdJcDXi2OF1eQ/C?=
 =?us-ascii?Q?7iJfUjH2c5n0jkwFx+d9XvVpJI0/c5uVxWAnDhK+Gknu2Px3oPRtzG44XtmP?=
 =?us-ascii?Q?P43eKoRg+HUAyp8HP2o6et5/K5K+SEhbzSRiDJ8qvPji4Ohi7ceu9hdaG4Qb?=
 =?us-ascii?Q?7KawrEjX6sv64U7Ir5iJNmZVeQQGRaSFfwoC5QrsYFjVTpHYG+itefJQ6Vhi?=
 =?us-ascii?Q?2aux8zz0kKNjm56ZlNfEVfgHm8oUTTsBOIvrNV8z0zPTjWBc9N+J+n7ATvj7?=
 =?us-ascii?Q?Fy9H3Vo7ArMFizKoGJ/UKCDJA3PjjhSp0S3H4V1qWsdrW6JumSmAZwj4iMTY?=
 =?us-ascii?Q?KXwFR5p/ZAu5t52Vxpv5ZMFCvuVqeegFl7JCthMLcd/pwcJPze0xCDpodrY6?=
 =?us-ascii?Q?ZX48qUVLgSL27fjh8WQzBtdbPb7vIjtBYEZ+uqF0oqwMEbzx9do7a7dzp+88?=
 =?us-ascii?Q?gXDvQ8dL5sGabvl5vjgdE9bUQ/kblKYgO8+xBRMro9olWKBlowzmsnPWGQkB?=
 =?us-ascii?Q?babZiLPjXEfcLTNglPZNpZGmxCob7h4c8JUPRoQh2apIEFiqCjgO7RIpJ1GD?=
 =?us-ascii?Q?pXyTyo4UuM9Rb7WZXSkyL6RRg/Nzg8O7MHZBoWxfZceA4TF0GaMEDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RPxLFq4H4spUI7+yDK4+sK6IQsmKtie8H403MxSaH8g1ZygXkxojs3CEcRQH?=
 =?us-ascii?Q?CQ/cKGls7UyRESMvQxTYw8Fle/xdlv8jZjLEB2WQ/y8k/KSjNrAAa8rE1NmZ?=
 =?us-ascii?Q?05BLWQ1YKD3PyV7a1oBhpUehiFSTWblJ5s5VJYmFLZ2RaTqd1MU3skKOmXpf?=
 =?us-ascii?Q?qfgMMUPjTvnXQWsoUuWTJcBAgNVE+kjBp+o7byaloGyW4syfs9tNgnbVsU4h?=
 =?us-ascii?Q?nsKYMFeDbIo9HA5aKtkHVnvdKA4f11DuQSQjgCkeM444OQ9CFNNCWwijxHNk?=
 =?us-ascii?Q?yNIP8USLNkW/rUD2OiZfkS6IGxyzn/+DRGo5/OUUqPQL143XVpNRaecw3b+3?=
 =?us-ascii?Q?qwONAKY1jUIad+/qUzzRM8eaHRpXaXy9vnbnFtgnUFGDFwwN/JA9JX9zcGOy?=
 =?us-ascii?Q?8qAZXjiRWkLc9Vs12KXdh0YrE+3lgHp1AFBLKIo8dL/yDBe/zrVY6fiV+kKK?=
 =?us-ascii?Q?CgC+QIcBK2lbOxY0FH8Pwv6BrdJezcAH6hxOlHPX0k9RXXQcIHBo/1vtEvbj?=
 =?us-ascii?Q?ZNRglD9IXnL4VvjImSeTfVzZZRf5rSulBCMz04NYsLXryxfQdeU9KUpXSbKm?=
 =?us-ascii?Q?1zJApduIjJ59wuQnl8wIwN+1Hb9bVbMrTd6UchG+a2roUJwFrsltJBHVQZK9?=
 =?us-ascii?Q?x+442YTyAB8ojgDLYSoyErMxafqzj6Mlmc407FVFrHIUJ1dFDCDuDjhVOP7j?=
 =?us-ascii?Q?ip/oYpiMXl6nEbPhwHkIvE6ZbXuxx2WVipjjPxc30vM+wWdhKikwMY02uRfs?=
 =?us-ascii?Q?kHXXsKNwru9jrjFcnZS21lYaOz+s9gTqJBZqwj/oKQ/QEbT/LztbQX91pK0z?=
 =?us-ascii?Q?xr4t1wnQ+9nO+AWUO2Oi8sa4HJ6U7Dq+L1+MHn7EkHC7yQNE5K8Q49Ztcqnk?=
 =?us-ascii?Q?8lWmbiYiWznCovUntzuBYEb8+67aqxklitz/MI7hPTxqglNKVQcnYUbf/kN0?=
 =?us-ascii?Q?qiQEiM2rdwz+Ey9SkaAWePcakv/OXxcpNQHJh/v9NOAXNeiXxbCOhETmU3o4?=
 =?us-ascii?Q?rE7IGc+21EDePvgTeDkUyUHXYhNaEfgnUArxmKTR2pHNA/NFUe3Jm7D2y0ZO?=
 =?us-ascii?Q?i5RVCrlEpd1UjRVibuUnP0yY5fLSt58a5Kq8q3QO/k2jQjIE4TBEWsdfRjmj?=
 =?us-ascii?Q?ekvLK62zBGvn8eR/Jlyumv/RBuQXsPNhsZcsY23HDnjrdIu/zL4PJYJE3DpO?=
 =?us-ascii?Q?aJB+SWHZSXy8c8tWhzwUQouiNdMVQsrltbeSpQUKCyGtLZu5UB/79gZfPnYD?=
 =?us-ascii?Q?0pCvizHw0AE9wOX1/0ITB7CVJ2AHoQtSR4JDDHyyIhI0md1M++yGYkwsoRiy?=
 =?us-ascii?Q?BT2n3CLtkYe5ZJ1HbU8V+r4nt8VUAWzxwPe5Cn2vWcCJ8eiKZnSNVYB1Ro/p?=
 =?us-ascii?Q?ommlxCe01YyLdQo938kV0TaP8xtJ3nSNjqfOq4+SLyQhntqqhX+EFiw8DQ8X?=
 =?us-ascii?Q?TByKyFk/hmFV9J48G+2TeoUPIqMYyCoOtHPY7BGqU2wfTtuVZfNVXkWyC5dR?=
 =?us-ascii?Q?InPI40+tfd+ch9dvaj5PKjGn8cOsuvkofbo5Y4soJspG4o94z86NWOmJmxSR?=
 =?us-ascii?Q?rs1M3swMYKoD1ljatJwYUrvowvmJ+2CH11Ivkb6Yt0bqKKoWBdxcU00wyYSD?=
 =?us-ascii?Q?bHD4+PRXx0c96+cFpAsiQyo=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c037873f-1980-4356-bc8d-08ddebbeacf1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 14:23:53.9500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qdkPrV5S4YIYe53u3MfyC2GLRiezGUWUjMAPquEror1my0+1BPrbzmOM/yVYwcPb2EFh1cI1Vzf1fL4mtXqxgbdIBlryG0paiqss45jn6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8992
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_072400_961195_BBA9BAD6 
X-CRM114-Status: GOOD (  10.38  )
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

Fixes: a403997c12019 ("spi: airoha: add SPI-NAND Flash controller driver")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/spi/spi-airoha-snfi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 2d86dc62dbde..a39c3ab4af5c 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -691,13 +691,13 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 
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
@@ -797,6 +797,8 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_FROM_DEVICE);
+error_dma_mode_off:
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
@@ -926,6 +928,7 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_TO_DEVICE);
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
-- 
2.50.1


