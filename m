Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBF7CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 17:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pylh3AIQv7CnZZnLCL9zO7QTjtGibxLoBWcIYdA5hZs=; b=u2IAOE9peAhLhPQSwGgWBcp6Xa
	GPwjBMQbPruWUWjhkZm878+BN4Q+BTllU4C5BAkLMyzNXTXlsFX5XZ583/5gbTnq3CmfJnJGe29Yc
	dF9+IHp6H7h1VuY2QHF+kRLwHh/T+zXwxmiExbZi/7eKNEsT+G01qgDY2xeCwEZFivKYsQWammxXY
	hC3bdkZiw3kTtmq64THwC5B2HAmONfditRyXHjcO5WQ0Eg0+dlpSu7ynY4psA17AOHjH+0DpkHVyg
	gGtoOy7DY527Tt0RdcAEC1bRhbOyehoMogGzXsKfK8R/jW0hfv5X03fRXtHe3p2/PDL5RnlnrCvs4
	ZfgvXD2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upsMv-000000058rU-1W2D;
	Sat, 23 Aug 2025 17:49:33 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqgV-00000004xj4-1FtI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 16:01:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VecE5QJNr6q5Y5T56pSKz/AGI1uRoKXNf0EEtZJU0/vMjDNhYcaZX8p5h0BrC7PhDUBCYe9IrUotR3q6YYM6uWuD2u9l9wz+iZ7XmyMq0o48qyO7/5Ex6j0d6lR8XJ9neWfkd/PO3r2myahLbHpbSrCRosUGRDvVzgw+PIAek1FTkTtSFBvAPIg2Ys0KLcJpH9MiqfBo/3XIfpaYbNJVry0wSArmR0dnNx9BIosq2ciFCC5Gx4hqQ07W3eiro47NlH1qFPxfhwKbraWJ1j1ZVhg/0rwuWGcUsfaCMZ76vsUVPrKVT1ei45gTsARXlR+ai38XWMTVaL9eeejRvuHGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pylh3AIQv7CnZZnLCL9zO7QTjtGibxLoBWcIYdA5hZs=;
 b=vogll/+eaOaJNgBo0kSMjK0bKJ9fOixnWKn1UZFbgLK8XOs8aiQrqKjPclr9J06KEaazmD3LPfJZRGZBRZJM8RZXkpS0w1uMKsO0QXaW3BxpHaYfn6ntvmeFSQcxTMYQP7xWaGdIs22G4b1aV0PAuBqffOX7Kom+5OANdo0ijwzoWVgaUdJCa2YCkfsS9keXZlKBdLILMAAO3uEstTVnlvcEXNcfhs0xZ+fpsne9DPKlsC3/97fhd+gzuGF+j6rxTm/YVCbC2b44leDpeVrBdjJ5g+KbPbMbn1SB5P1bEiY/Ue7xR+Cuge4MmrvScZJNuUNyNRI1qGQom7G8tqZvhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pylh3AIQv7CnZZnLCL9zO7QTjtGibxLoBWcIYdA5hZs=;
 b=vzplariiGCdPNdQhD7p/8aOWqXLgdPrYKxyBKD7+ekUSCsulx0dDDMaVkkY2z/CwGwFIRgxIrYhKLokMs+DblMPV2jxthfT9/TaAEJg/lNdTOdEJ6cLZNep/U5RV/xb+R4P6arTfMmB4n66OUPYGjUy5TWMaWu8WntN4ebefVPq9SJw9hcQoDxv6iF6x+KMNnJvXMR2vVQOnQM0qPTs3CG8gw1+yPe02pBrHWA48PuIuAwlkOdmHcOLs7b57d/7jlMB0ESg1SQYeseQW+E+o1dGmwFb+dJmoxUHH976jsTw9LvWw126j/mzyPxOl1utxXcGIxXYlM8p+Rr1ykB+zZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DU0PR08MB7519.eurprd08.prod.outlook.com (2603:10a6:10:321::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Sat, 23 Aug
 2025 16:01:28 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9031.018; Sat, 23 Aug 2025
 16:01:28 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v5 04/13] spi: airoha: remove unnecessary switch to non-dma mode
Date: Sat, 23 Aug 2025 19:01:07 +0300
Message-ID: <20250823160116.3762730-5-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250823160116.3762730-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250823001626.3641935-1-mikhail.kshevetskiy@iopsys.eu>
 <20250823160116.3762730-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00007568.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3e6) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DU0PR08MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: dc46e009-b0ac-4e3a-c89c-08dde25e51c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wf26fg+ALxK12jWcBvjsylTNS4MKrTGwwen2w2D8Dec36gKi8TZM5/Pc217R?=
 =?us-ascii?Q?BAYRj0aGhoPbf29DIZWbyq1q2ooOo7UDW3jjfczUkhP5q78mUppGElISkupH?=
 =?us-ascii?Q?/LfZpnJFwawdJL+To9/Os51pC+dIro/x1BOinke6We0VZhgLHxphqUv+tDEc?=
 =?us-ascii?Q?jUKHdEEeXsQwCwYYRjtD+yD5Folv5YYElncwEAh+HFuFys/LlSMwcrK7ewNv?=
 =?us-ascii?Q?DNi0a1+AGUBM/xgx2G+g3MMtJh5gIxLfTphZHKAH3F1sw4ojnQ/xTGM6crzS?=
 =?us-ascii?Q?EkcdcfEV8sH6EDVlTebfAxHntnsUfVVodPGlDKJV9RW2FoKeiAdnlSLH8mlg?=
 =?us-ascii?Q?q+naExWEkS5d47aCS/6bggIWfwNdGzc0LxokzvS7kE7/5OG2qSWaacOeX5sj?=
 =?us-ascii?Q?bjEkVFzVjV6mu43MtSHAKuO9+d+jx0s9fiVOaPgPd6GNfLn+z0kf950CstVC?=
 =?us-ascii?Q?vePOnTO6GilHnc+SKyxdVbhNPgg2N4wv9kvS/x/GhQriJbqk/IVLkqG+M9FW?=
 =?us-ascii?Q?kMpyAYhCnjEMlBvKA3x1IqEoXRD9ULSzlbYZIJe89sJogMztXxbynys4iBP9?=
 =?us-ascii?Q?co76A5ZIl95EOxtUfZa+dUTAam7RTmm3Cf45qXaLu44VhRWwbMVq6WTgYmPl?=
 =?us-ascii?Q?nQWYRcfyY2g8VwHLXfgE9YGYxWU44xolfnU7Uorqh+6Yl1D9yiEBDqwTpCTC?=
 =?us-ascii?Q?CVKcihEYK/WvvX/Mvg5Hte3O86a6Wr462o0jERHSnvwIDCmxa/1xJ56I6OFk?=
 =?us-ascii?Q?s9WDoB6gVWc5crYPwLCpiLfpSU8wTWDWJen43EjqY1X1oXFWWJuKYzINsCWh?=
 =?us-ascii?Q?JUMBj6/Bv4EmmVnkWI2+ioIYbf8hz5UWCrUDV/xSmjdx8twtIp0j9zR2/dmA?=
 =?us-ascii?Q?WnN+6qXFjbJI46Q8YF8n3Jm/6VpC115UHtaunOK8gwjQdyqkaee5D3AuTal6?=
 =?us-ascii?Q?F5wVqchznF8XppwNgQJCp36y/aJICBbxzdS+4MriYIt66ls8u036CvxkBA6r?=
 =?us-ascii?Q?3hjqpVDmdp4o0an7hriefabvdoTEPXjr8tO7UmzMZ+IR/DwUy9p4F37pFe7W?=
 =?us-ascii?Q?SOm1mN/BUiWjSJHvbVnYat8gLUxSOCKd4dxGUF63k/vvDKaO8GdLTpETJOYG?=
 =?us-ascii?Q?3eNf7x4lVPs5rSz2jAvdX2w7lr4ALcdndYJGdPfZHdI/y+iLrFhXXL1gQi99?=
 =?us-ascii?Q?LHEXXy4lXdAsp62TzQ3s+2sOvUwH5kzeGs8BJWRQJOUhX47iUxgdTjbEuiyL?=
 =?us-ascii?Q?u04fymhYp4TQmiIFQM64hJH6VAUoekN2xdZHKv08FNwhLZh9BcHJgI+m5QNc?=
 =?us-ascii?Q?YqOXCEtY1nNgicHgRHAhQX20mxA9cXeUKSfAHF2P/M0wNZk99ILgVddgLezU?=
 =?us-ascii?Q?cSA0BAEtABu029dJd0sJLVyIvtmZG8CcIdql8+GiN8GANubUp4lRokST7TUh?=
 =?us-ascii?Q?SCxYWgJLIzFHUtK9XxRx/Br9IlRDr8+BE19N73GqFQjsbDBScuJg1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kV3krqY2n5DAsTsPbNhoXDSojVjV6Xy0Komjou2+G1sujnfs8qQiDD7bhgJo?=
 =?us-ascii?Q?1fXSj9F7YlA98HVxdNTsvogrTViHJ9P7klpTyQtao7/MuqdEe+wA5k60ETO+?=
 =?us-ascii?Q?GlgCeddqMneIEuoE8FVC9JoPUyNj+IFTS3Noti14OwX3N8nE+JMjfsfUNQ1X?=
 =?us-ascii?Q?EUlyWCdhPrABcLHoaSXcCP8aVDxu2yfkSZpL83/m0lUMjZkbd3Qgrh56dglF?=
 =?us-ascii?Q?oZ08m3SaX4jrJMRQFZYSDs/TKb2pa2NHRbbeOuUkOK1WuQWoia6z6d5X3LYE?=
 =?us-ascii?Q?HmMMmsiCVAK5deG18XZLAnNVY9b0BPjwjMOAoa+wVjbEGIafhqys1EYj8J06?=
 =?us-ascii?Q?r12dln1UyRX7lkKDGfxOeRAuaQ2PdROmZWdcqKeMiRuIBLqxWn5TqLZ3EGlt?=
 =?us-ascii?Q?7FiQTkHdAzFNlHC8KlswOGRHWduEUyKOAH+r3ud0sk64X3zfN+8aNGybj5If?=
 =?us-ascii?Q?ZJRPISX0cKzl5oWkLq4NeQp+CnjWJK1JClgPbDorrSd17VwEvWd32EpoiojI?=
 =?us-ascii?Q?O6urJXJ8yRrWMtLKzy4tuHERNaDsmb6o+mxrdh/IWivnbgVD+UvkA59MaGBw?=
 =?us-ascii?Q?m6j7C9HcVowoArqQsyktgG1euvfyqGP3Wxdy3atyGO4mNKtlxIwNYxtVr6qb?=
 =?us-ascii?Q?TtJqjW7QTO4+oSz3C4OYda1UDEfKOUxVT2zyFyNYaxfD8iI7jWDQE4Kr5z2m?=
 =?us-ascii?Q?ZwZMZdONkErnAV6ZK9EXCuucjdJimQePcr9SjyLZRao2kY641RObE36bTqUZ?=
 =?us-ascii?Q?+YI5Xqq5G+jyh8UWij3wBSx93gSc+YHhQTyGXy8Mq6r/F0Fy4BHvOYxC/je3?=
 =?us-ascii?Q?2rVHXdJ9bYn6t9cVJmDFPz8WtMjUBtMlUtMuCwpbx1j6Vj6hSvRNxdSF+tNL?=
 =?us-ascii?Q?3Ctd2ac53pW6v2sNwNGCYzoiGvUAfNJfSexCrm0f+1cHnNKI5gtpydSBhOcV?=
 =?us-ascii?Q?+h2Rr/yKIPyhzsA3ERrjcRjBF2iLJpwxat779R/EP0x9MhnvV8JvK1HXXvvR?=
 =?us-ascii?Q?6/fGaXVgTN27Xe+5kzcYxBYFR/WbToryktPwvh0Q/ppq4Peu2HXV9bHdnbhh?=
 =?us-ascii?Q?2miZgn9xeeQkLt1eOArftaAtqQ6Koi75ti7OKuP9xrUy4lJAojGNJ2IUskUC?=
 =?us-ascii?Q?mFtuI/H9lS8eBRPIf1Pf5bXR0l9HRIXBBIltcA1uYnfzbOa4Wcu0tuGBwJ2L?=
 =?us-ascii?Q?c0y1VQsyKzdEU/1t2x93R+K7VNiInSLQt0/NnyvMYUzIoDSNpuNXbaJoLUGi?=
 =?us-ascii?Q?iT5V0NGV9kEBXjUEKVFSAVheul1e5HoTtH91oSnq9pNF9Il5n9jAZvSxhDtD?=
 =?us-ascii?Q?a9H8Fg4/tVQxgjPgdoDPsUyqU3a4NWOwTAuE1ZHiDNad4cYh5aOK1UnoLUsE?=
 =?us-ascii?Q?CwQjpM+ufNbENw+/HVGD5uDXOOhEfXhKNw3A1THlAmL1DYVGcFQ6RtTcd8eO?=
 =?us-ascii?Q?tYiWZfdAAvuq8wHq/5ewb69TCr/T51wbQlaK+zcrQmvCQ5MGSI/DFwpPT6dK?=
 =?us-ascii?Q?iaaUGuZSiCRFqfeWKAu/faFfqB/sf890Lo6kIl8F8jX078NFi7XNjLc4klCt?=
 =?us-ascii?Q?kFzl0kHf1/fR/hhWdqh6oyib0H7o6vJ0HNXvqh7GZcA70lk5wfuRiFkIurOU?=
 =?us-ascii?Q?kunnoe3y0bFAUlbBoQ0wQew=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: dc46e009-b0ac-4e3a-c89c-08dde25e51c2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2025 16:01:28.4678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18P+NI7caabY2SnT/CIpd1Nmgs2VkmR3s+d4YsxrFwxHKAyocDtk66jEzBeysYQgSNypoIukynNbWssfSYJn7pCXPoA1X/54SzhWUU8L2WQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_090139_342628_5086E77D 
X-CRM114-Status: UNSURE (   8.27  )
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

The code switches to dma at the start of dirmap operation and returns
to non-dma at the end of dirmap operation, so an additional switch to
non-dma at the start of dirmap write is not required.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/spi/spi-airoha-snfi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index fffed26ff990..2d86dc62dbde 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -812,9 +812,6 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	int err;
 
 	as_ctrl = spi_controller_get_devdata(spi->controller);
-	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
-	if (err < 0)
-		return err;
 
 	memcpy(txrx_buf + offs, buf, len);
 	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
-- 
2.50.1


