Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B79DCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 02:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNX4iO0o0uMaRyxU4/UJ53mvcG+yuhoVl4mVMBYOSyU=; b=aXPIWyBtXd0yDbaTPl90GZMded
	1s0R9UcjhkTpk2W0iYZAiDEvg3v/XYpUhqTPWifHPhzFxrd33iRmcubytA3IhyaF8G0wcdzvvIR2P
	NkUkPo4jILR9GBQMKZ73paAg/jDUaFujoJa3uvKMSHeoaX/mPhB4u+ME+OFbuq6fja5l+0NXUdYfM
	uvnxQBcPoeyMX0hoRR5umlAky4lkKXsnTpRySYKNAbgb2cCaCr6AT8KicnOIpceQa9MlnjZkWZ5n0
	jcboVFqViTF0qm2zIjfOSlzdT4/j51ZSDE8KK3CObl03dPhmAcuKpGRvRa28K0CkXddyt/pPiiTYl
	ALgVW87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Q5b-00000003t5h-3lB0;
	Tue, 30 Sep 2025 02:27:39 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Q5M-00000003stv-2bcM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 02:27:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Px/WW0dBVI6u5j/Jl+/oojzEESKdiBPNEc3giB4+CrZHAn2s1pJwQ24qbcf7xJkmoHIrQ2ppR1/1htULwDPX3FgM2EwIDwS/g4UACSf5lap9U3rewkf+ap+E5IXK6e5j/L3Dbdhhk6Skqr0bQPcy7bPjvskeFd6sjuYjpaqgz3PCxBO1ns3zihNa77Fu/WuU1nb8uLz3087xOfFJrH9VMdW0nrXBji6TsIVZWD7EyK4A5tStxhINVqGewmCvY4yQh83AI/WZ2GaKvF9SsEcT7VNy2POMJ+lEpL7jdpzb4Oy3yCMcjH+UVze0diXF8+p8IfZGSA0GjiBxUJW/6GQTNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNX4iO0o0uMaRyxU4/UJ53mvcG+yuhoVl4mVMBYOSyU=;
 b=B3z0GtRvU/oUCrdKA1/TJxqlmzKiY0vcRKkUMUOaSYwmxwBF3tY7K7f4WaI5AVfsEcYJgbO9fLXEACkmCpmGhEFSjmVdh+Ar3FDnfBHnVd6vc66ZTlKMpfJaHYqhXEaPo2b18miFk0bDHmOninQ/cNTRiz2fCgIvfBbN579v4S+RzOlkQxRMRiGv0SakV9HinL9DUKhyeuBk2G1xQir2AuPrNE0waYmLP4STI4E+HsI9t3h7Qz3NAyYdFhLrZCqv28LU8A7n1AK/H3B3f3DuUTLyY4pVlrE6aFzBzoEszXY5XgNm9QI4QbksAmhc1xdHrbrq67JzJ58W3HUwtNfhNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNX4iO0o0uMaRyxU4/UJ53mvcG+yuhoVl4mVMBYOSyU=;
 b=P844+ubR8y6XcUbmqedXFi8oZkWCeaQEITUn+VMOEa+qNgPl2mGKLWPUzz0Bd+JG8fCwmOxbjpBDJjdR4GdTylCx5+SM43J5XXndOk6FYwI8OF+OGQfRO9OII+X6fiP3hNzO9Ae4a0q7sk8N6XYQVPMqSlLm8TNDvAoOd6MgF+XzJFHca+znUpDb1nMucIqgASqxbAeS/GUnrViTuDqWQY/Y8kZRCZ/6A0oxZi32emIckx7X2Bw7hwPSxcAPuino77iF+fieU8kFu1z1d3b1LF+/KFhy5hnAObKcC4RAfHNDHAXTXVoKA4BYXgF7+D0mz9Q36fVaMiRM+EkqZmaeRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GV2PR08MB7929.eurprd08.prod.outlook.com (2603:10a6:150:ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 02:27:13 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 02:27:13 +0000
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
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH RESEND v5 07/13] spi: airoha: unify dirmap read/write code
Date: Tue, 30 Sep 2025 05:26:52 +0300
Message-ID: <20250930022658.1485767-8-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00006627.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3cd) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|GV2PR08MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b23e3f5-6094-4d8b-8da9-08ddffc8dd74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+jiD6u7xP/QenGOy9Qmn2hf7F5scnsogJ+Rm+FH+4sODag8lqJ9vAJmtRJmV?=
 =?us-ascii?Q?4hXaUjmtt/3KfbXJW6PXOOoZAp2SpnhIvu24EYWVDjFMnITrgfg2N+JlP7IA?=
 =?us-ascii?Q?e9CgA2qi57p0NRHt2TKSSdtISzDS0x1Nb0YA4LZ0duonuBP8872lpaHN4dSD?=
 =?us-ascii?Q?AGL6SEhaLl2CpgnZpEc0UWIoDk1tkQ/31FEOOCjxdZk3ncRlUETFsfiRcC+u?=
 =?us-ascii?Q?BKssn55cMINjQcdv6VFInVMu1b7fzaliS+jPhThYP6VRySrgd7LnozHqoe70?=
 =?us-ascii?Q?xdIe7izDVp7/dYQjgGfM9dfMuRLCCE2EZ9vVEMHlPIa2cewtld7u+NVC9axt?=
 =?us-ascii?Q?X+yfOYlnyGt0w7PQ/vE2coKR1Dnwu5bSODnUcTasARWVnAYkHNIzCEEzjBT2?=
 =?us-ascii?Q?IUX+kPi2q/J0BdYMHx41FExwWeNvKpvPn9s0bSS+hl4MEDZni0pVgTz8raL+?=
 =?us-ascii?Q?yfDK5OV87B2i3c0nfnGE91Ue/5geCi4O4L1BkB5QYJ4VBwMetsLSWoCqlymQ?=
 =?us-ascii?Q?68sDH54HsGJLjDsvyvL03hgOEfWPQCSojQvrN9BKirEWymndCm3ACwFP8Tg5?=
 =?us-ascii?Q?CiXKk3iduIOKwO5WK8Zh/tf4ddHbCMe6rtAgPkIy+QwQUM0Iig0nTqRYCCdO?=
 =?us-ascii?Q?P+BtBMB12aNrCN23RPpPUZzrXKwiuEFF7wD3rmt91PM2CFEvr8RsCfne0Fib?=
 =?us-ascii?Q?0NpnW9Xk0xh5Z4Q/+HwK6CBoA7rRmL8SPy9CjE45u7kQujIT/lbi4ie6IBVZ?=
 =?us-ascii?Q?Ldl7T/yQzCzJohG0JCaIcK0d2ZShmOwCgZzcZXYrA+IGexhYGUi0cpTgKhs7?=
 =?us-ascii?Q?LfXa5a1pPDo8YiTchGQ9dtT5D+7AgIta3zHFfOGjFV4FsAMdeyzAhn4fPe4E?=
 =?us-ascii?Q?Avtb7OTi0R/93Yg/H7IJBW15vOQo28AbOF6cvLrEHs/jSvE0WePGhpVEapI4?=
 =?us-ascii?Q?jF5xw8OuRC9hhw0d8pUoWf8fWWIfqUuLXLmf+Kv3dVlN6mFDJBnW0QyU9VLM?=
 =?us-ascii?Q?Svhls3OgHPUFz80dk3pkZC5wrpL2AfuDBtzhXpjwYs14THfe3o2xErGxC3cl?=
 =?us-ascii?Q?BvIX2cWFkUi7MdS2O6LsXTAoJpPdlBY7En5eOTsCBnH+4XvfP2KYKpec9YyK?=
 =?us-ascii?Q?0UaChKUxrbVknNUjslr0NUUOgVxztObSo3MgyMVHrS6xP1+CMGdSNf3ImJAt?=
 =?us-ascii?Q?2gKVyLOlsr812k8YOYK2rfNP9nMlU4GabozVZ/hXPiSzu2IJ+upNJjEr53uz?=
 =?us-ascii?Q?KAcogCDXmIiQRAbb35ARLkmmta3kA2Sl+rlFuB6+zqqdH4YySpiR/56AZDAE?=
 =?us-ascii?Q?zpc1xpHdDy8qI0850+W4Salf+nl7DHvlJHMzPhCx9GiC46qZRW4vnuWe8B0o?=
 =?us-ascii?Q?uDK0+KOmyF22kie/ssRPQa8lMgfSCYexKJY2lVNtILrizFKpyvnHMrdHe5Zz?=
 =?us-ascii?Q?qiuiP+PUd/lJebs5DKvUf8SHne6RHnVd+dMYEpv6mSn43zXLmwRZx8w0UnnU?=
 =?us-ascii?Q?rtK5ypUPa02Mgjq+tw0ScB+yeYXsmeeyfa4B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XqXXeNxBAaqu3+MIr23DIxpWQqjvO8P6ZIN33n+Y2pdkZa8UW3rtX32YQ+82?=
 =?us-ascii?Q?bTQwk9im/W4BUY9hSl/AMzRwWfUCoSBKK5C9/34n32awhoV6nxLXrTFzjCXo?=
 =?us-ascii?Q?gLEXEnYH6BtBDgnHlUv+lrMPXkPet/JtXPh2ObI0GC1RbKNd0R3fyBCfWwXP?=
 =?us-ascii?Q?YPbNzdJ+rU2gyQYfCyAxmiGJ3J02MtVrkqNsBgUIdK1+2+lOWkGLmsAYoWjL?=
 =?us-ascii?Q?bcIRWjrjc2g59W5oxGzekBY0B+OGa/chrY6+flAvl7OnrDG8KEIC/+fqwvPv?=
 =?us-ascii?Q?1BrGtSKGHI0VTPN5xffAiRLJbmO0iODiDUbvMVTCX4I61WIkXTw/8Pq5xLJD?=
 =?us-ascii?Q?rtDxKigulBiPcyidVTeQ6NN6iYyfipwtLHBNxe1j8gmghvCYQAwPKrqYVNR+?=
 =?us-ascii?Q?XVWXedAbDjTmxcX9CkYgB5ethLpMkRSf7/kJ4P5gWdScCJGjAFjCUjboYL39?=
 =?us-ascii?Q?5P9fohMZ0P8TXbeJT0H7cXk+CfPK0XJPYHWXC8RfD7ENxriHF9ih/lG1Ku95?=
 =?us-ascii?Q?4dXKsy9p9anvNXjbpiuSeyMw9aFYW3be+qCY00QE92yYpioE96LwptP3D3j3?=
 =?us-ascii?Q?4uJFAXIwcHdfn1l13U9VdYIfZN2BdIGstZxvBuHabc3bwY28VosvbL6f+5qJ?=
 =?us-ascii?Q?r5JTROiuFvwbFw0WbvXHaBJhLt9S3iBRGJsdRGXMGQNQpKo5/GrARqPRw2Rj?=
 =?us-ascii?Q?V+/LRxfVKLAt7H3/OHh9za4GKNgQzgQ3+azjGTMShh7hJwUDTr5DONlNRxvu?=
 =?us-ascii?Q?6xpdKk4D0BQ/bR1I4yba/TCPEKBJ1IUiiM/J8YVHiBYgDm4fv51zqElNGe60?=
 =?us-ascii?Q?0OfGxoaHgbKJU3wbcHjcgq9NqLq55UEE+OlCLlvw1MjLuWLq3eoDWNYZRWG0?=
 =?us-ascii?Q?Sz9Vjay9V9FaSL5kOcm2cSNgM1MOl7+3GuxrFd0rz0UMNOUPYeV3fhzr/ch3?=
 =?us-ascii?Q?BJ/OpY+wdMxifjItYR5axYdl5xHyNsodYBnGAKRlpH2Bt+YxwlSltBX2C1XJ?=
 =?us-ascii?Q?xivZBHvKT4N5ky7EHxxBCCSnc1NKNby0iV9/8EqCBqO3fi3cN/cCRZ5we7rs?=
 =?us-ascii?Q?jXBxDJA+KrMrTK8iuH6w2SFZJaYRcJSHzwUzL/gSkNC651LkQiD+qKUEDFw/?=
 =?us-ascii?Q?3pUqnTF7ISExDldAh8CjzX1PA30a2HRAdwWZ3NSIjKOeg2HCON1ltWH8qsLp?=
 =?us-ascii?Q?v/KCmW8G1d0fm6C9tRjiqDc03XSODY6gXj2QsFt1ynQMaKyYqVRMvBBb26sK?=
 =?us-ascii?Q?UtFWk4LQA0FniIRSyRVLJ5be5+/VglItfkpsW+2Iu+7FEJqoM+IPGUVHDM6v?=
 =?us-ascii?Q?AoqRH3dPbFA4lSABodI/BgVghy0DCjdw6av1uiuIs8fs/VqDeQpNc63tuJ79?=
 =?us-ascii?Q?GelA5MvuU21AzZMHqUXUva9P0I2U0Ce0GY3fO1I5BBx7qGXxEppSVbyMJ8tB?=
 =?us-ascii?Q?8uzreqr7xdE6PGEH2whXgadSCZRTy3Ypp0NDNN2aUsDbgMhqHxilaOaOIBYW?=
 =?us-ascii?Q?eklz+MSXzAiiP9b+6YrHsLHeV/6KF0R3KEhJXWQjz4R0ctySrgX+wnc5X6GU?=
 =?us-ascii?Q?zZrd3Sb9C66nsA4gFTt4KWUhakDnBZzj0kxDZaBOpkCpsrpZ4l5l29E5KZFn?=
 =?us-ascii?Q?iQH7Wz4SGojuOpc/KdDQp7g=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b23e3f5-6094-4d8b-8da9-08ddffc8dd74
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 02:27:13.1989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZfoaOm7k2IhTNCGzUPYh5IU5KzHtmVfeBXud3J7zUkRDdQc0HlPZHzDVNDyc7p0m7iCgEveqnp5fOTJaiQw7M/1R71IQwX8rf360IDqXG58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7929
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_192724_745726_AEFF2E86 
X-CRM114-Status: GOOD (  13.77  )
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
 drivers/spi/spi-airoha-snfi.c | 50 ++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 5ad3180ac6da..e90fab69d81e 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -672,6 +672,8 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	u32 val, rd_mode;
 	int err;
 
+	as_ctrl = spi_controller_get_devdata(spi->controller);
+
 	switch (op->cmd.opcode) {
 	case SPI_NAND_OP_READ_FROM_CACHE_DUAL:
 		rd_mode = 1;
@@ -684,7 +686,6 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 		break;
 	}
 
-	as_ctrl = spi_controller_get_devdata(spi->controller);
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
 	if (err < 0)
 		return err;
@@ -748,7 +749,7 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	/* trigger dma start read */
+	/* trigger dma reading */
 	err = regmap_clear_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
 				SPI_NFI_RD_TRIG);
 	if (err)
@@ -806,37 +807,47 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
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
+		goto error_dma_mode_off;
 
-	if (op->cmd.opcode == SPI_NAND_OP_PROGRAM_LOAD_QUAD ||
-	    op->cmd.opcode == SPI_NAND_OP_PROGRAM_LOAD_RAMDON_QUAD)
-		wr_mode = BIT(1);
-	else
-		wr_mode = 0;
+	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
+				  DMA_TO_DEVICE);
+	err = dma_mapping_error(as_ctrl->dev, dma_addr);
+	if (err)
+		goto error_dma_mode_off;
 
+	/* set dma addr */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_STRADDR,
 			   dma_addr);
 	if (err)
@@ -850,12 +861,13 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
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
@@ -887,6 +899,7 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
+	/* trigger dma writing */
 	err = regmap_clear_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
 				SPI_NFI_WR_TRIG);
 	if (err)
@@ -931,6 +944,7 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_TO_DEVICE);
+error_dma_mode_off:
 	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
-- 
2.51.0


