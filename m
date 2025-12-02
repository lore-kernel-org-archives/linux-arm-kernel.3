Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D9CCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 07:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBl7SPpwDmJwl3W407WH9B6rJ2WP4FW7gw9m2ThH9F4=; b=kMqJ2ZUssp59pHAlhLdWKWVbTA
	bCAV7xdd2NqxNmrMSMe3KXtOwC3Iv/ZzngboYGQpedddVJm/SXtpnnwJtXPS8B4ZvD43TJNucioct
	BP3IDcXYlxTumtd1Fd21++qG4gfo1OEitiH0F4fQNPnfvU2ApYFk1Dsldo9f7cjHgX9oJvDyFKabN
	SFd/SxRJHK8XJfSmWFib1YahOGM2aZkz26jpVZEhU703T2RyYlp6vyPcAWYH2C7kB1HHQcIDMMuUy
	JLeLgsj715uMT1jhA0sVwztE5klWht83LOoCaGClDb6XsO+volqobaL5RCWQJApdzpWtJQv1Ah3/t
	HDvI94rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLEk-000000050Om-1Z6h;
	Tue, 02 Dec 2025 07:55:50 +0000
Received: from mail-francesouthazon11011008.outbound.protection.outlook.com ([40.107.130.8] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLEh-000000050Nu-1hP6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 07:55:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WoMChEMOq4pypZSxeBT9yFeavPyc2/4NP3wxzqvW6nnr3PIHZYZ9r1J+tvA88VVnsDVHRRFwKfrKg6ApvtvverPSJiCdD0XQfsqAogSEnVDBzQG9dMEFFCe7AvQ6Z2WbI174q02P66mnSgpz9+DYwXwYpnj4HKep0yYjBhwI2PxMOhLxpJf7hswXzYKQ5RFjeHxyPy4f0BPMCrqVnHyS5ZwmJa7zOMuO70EaOb42yQWrJhzrIPz4GasPT6mGjpwIfB79qVB24pVWGBiL3OCZ3frJPGV8IVp1mo6xWJlE9Po9XnODf4QbyoA3Ew5k8wx1g2j2wIk/APT+z0RkJ3Jo+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBl7SPpwDmJwl3W407WH9B6rJ2WP4FW7gw9m2ThH9F4=;
 b=upR+hDA+DEo7fNclIuiQHoke4QiWpeWopUrbpHhj/KQjsslsd23A0DII/jpkhywrB9+t1huSqLTiS1WbxCDVRcegjns4qVxbREY77sD+WzbbuAxPD1pbqOvv8PI0Pl1BZPSq5R3DPJHCtIAvF+d0f8mo3fl27ANOYqcrlC8xaMzf/gN12IEcX7fCg+hxIRw6FUQL+0zjGo/ZgkQ5+Q/ueLYurxqwgxgI9NzCetzj6rmVQI1YwSKxkyEKum7B8XdxR0qkzw2C249a0wt50BdgI0eSNRmiBwo/QICEw61AZHY8A1vCL9N/soF9OD0H+ggxFh52PZCeVh15J68qahDHbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBl7SPpwDmJwl3W407WH9B6rJ2WP4FW7gw9m2ThH9F4=;
 b=NltqXrXOYBjQJOLmrwhUf7IExxB64d2IoSrWESqeaq9NCbvQQfVD0hFW7h52fv8xHjybfJABaOL/50zethHmUs1Ltf0cPrg0MRBDF12EWhbhlSYkTDLkGEWmaOdRETckbNkD+hSzd7I1ODAl8BS2VuXKiannrUefh9I5G8qulK+FcIKbUEGrfHVbZ8oLrV/ZSeWp+xY8B9uJvZ5gYOTM712sBAGpL/pOlK8NyvMxjvewQbAKzrbhz2an09NaReIE/njoW9AOAW0gacGrOb/aIs3pmL7RalYh3tpNFdmSmBH1Ck2uPX2ugU+sVTJEZf/DiI9Shr/87WiaybApdrZlnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by VI2PR04MB11171.eurprd04.prod.outlook.com
 (2603:10a6:800:29a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 07:55:41 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 07:55:41 +0000
From: Carlos Song <carlos.song@nxp.com>
To: frank.li@nxp.com,
	mkl@pengutronix.de,
	broonie@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	kees@kernel.org,
	gustavoars@kernel.org
Cc: linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/6] spi: imx: group spi_imx_dma_configure() with spi_imx_dma_transfer()
Date: Tue,  2 Dec 2025 15:54:58 +0800
Message-Id: <20251202075503.2448339-2-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251202075503.2448339-1-carlos.song@nxp.com>
References: <20251202075503.2448339-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0052.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::21) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|VI2PR04MB11171:EE_
X-MS-Office365-Filtering-Correlation-Id: 308616ca-f35b-4210-070a-08de31783035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xqy8orz4zBTEg9N5HaXBlX/ZSEgMMxf1TnyD0v5o3mG3ltUuZyx9USh5y6u8?=
 =?us-ascii?Q?dZuGhjxO2kHAz9HMjsC8NwHGtNvKngzYNJUFKbNcPWXNw1gKydUcORN/35sN?=
 =?us-ascii?Q?PRGGdTtlLqzVjcAnxnPwhfhUl0D4njVJts6uC1CVIMbmmmXeE1JE/BqbJpVK?=
 =?us-ascii?Q?jjX99kIpKTaCWz6iSnVgCImTNpu/MOhGxwthw2zcCcT6QlvVM81jtaDUFSN9?=
 =?us-ascii?Q?jkEpxlM6inR9sLTy5RRTdx27MG8E2q0NtYSm+l7b7ExzX15NoL83mBXOHWQM?=
 =?us-ascii?Q?Wsih0vgY7wPgfsTFlWBaHLt9fiXY6lF4PJzrSF7aOo8spsurg0v0Id8wEoh6?=
 =?us-ascii?Q?lWvBNyZNixtKLAgMEHTD3XYfoY8eQKhzOr0EZLIWCOA1IpbaoofWp1LbhYns?=
 =?us-ascii?Q?rICQw31ZlZHuHpaeamU2tOcDQxDvmJGu/HVz0ZkNW0kvffutLL93Lh3doTsQ?=
 =?us-ascii?Q?i94jPjTFxJaLrGzeNDw/snYuVwdRCPeWqIMM6vIYsAiYzJpUMFkLrIV0qFy7?=
 =?us-ascii?Q?Sc9rZ1xLrHECU6PxfSG/JSYzJYP03M8N/VvaswLn9dC5BVJRPT98TAguypXc?=
 =?us-ascii?Q?mZmyANnXGryHMFIQppuaYvSmp+eYMmh9wXN33SEXGK4YuaGO/Nt1yGTAn03l?=
 =?us-ascii?Q?fke56tawwN17HXg8r4JnKylYYOT3c4JwW7sRp67WfHNy7wi5zmUTvmZdWxmJ?=
 =?us-ascii?Q?TiUyUbKl+/pfY3K2h1V0jw8jJWus4DLD7kVwNpalqiiVptyZKbWS0P2n9Kjk?=
 =?us-ascii?Q?sNvDM53nhsiS9sDUe8h9MzD8mkUBfV0kGDdQuGAUZ9AKsDJuWsSonL6VaiA7?=
 =?us-ascii?Q?/UrMltrmv3mJ4+XqO5I1sfug1g4/iddhqT1vS3c+Ny4tNLyeD5AvlJPujXl+?=
 =?us-ascii?Q?NxjbIrIS44UB3WBuLzNTCky4+mTv50vZVpWsQOz2ScGrdjnBl8LsR0xbm0Km?=
 =?us-ascii?Q?nmGxI9pXJHTKOcUwS313bxgJB0BpRIPIWHsx//Q9Mz0dfuF3XQZw7w+Mabph?=
 =?us-ascii?Q?TjafsSlZFCRraZ9VVMTIjg0F2mbIGHhuBeBB5XkkE0RsehzVp+M+MEFP+vHN?=
 =?us-ascii?Q?jXTGyWdCq3atbcyCBV+rp2wTWO2cEhsTbQxO/xO6nB5t3OoH8P6vCX6LFTM1?=
 =?us-ascii?Q?NkOGqjbX7K7aYw/0/B3I4K+I5unwZIjS92eT3P+jUxWUmG9w7k4FhswQ0vwY?=
 =?us-ascii?Q?5HkqH6qmzE0nzuRAUS15edId8Cky+yyaxmng07k+GWgQXYqk7ciD/5ytXSBH?=
 =?us-ascii?Q?UqYcz53j2S+lhHmAghV24pM5oqdHIuv+AVtd6ozPUN9xQrq/rNFGv3prrTdT?=
 =?us-ascii?Q?6VqNs3ZZzO35A6gLP6Fz6L/xz7O7Y/FmMoQXUBU0/LL9DzaCNYECR3YLkXJE?=
 =?us-ascii?Q?ecjiO22vmkt/rwruyck3EJyQ0sZzUaPeoW0C1IHfj7sRyTCJ3YOVYULwdkpT?=
 =?us-ascii?Q?+v/+mNDjkt/2x5hWllCEU1S9AtmQxt2jmudKrvh960/CKGEv3qk+OZM7jjbj?=
 =?us-ascii?Q?Xv0Wj+uQ2ySljr7DVtMNhb6DS2hHkXdVymu6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/8Y8+7by0ODVqvwPRnMa+SxsDDiffk7LuVLVg7GZQEHZb4VWfanYiGbfyXBs?=
 =?us-ascii?Q?rpEZGgfNYiZe1qO4BzJMtOiGJziAXreurpPbNwkBxl7Mc/hbu9RoPm3PPGbQ?=
 =?us-ascii?Q?qkhhehln5x1lDCF0Rcd0czQbV5xOXG2XZcANZm08iwIUjhkmOUuWP7ezWIcl?=
 =?us-ascii?Q?aHEkuUv9OSeq8bauIm1BcgNy2kEROglLokL/14UyEEhiuwACZBcOdoxE5nrV?=
 =?us-ascii?Q?Ht6loh6eRIDwIMPhvEo0k4ZveGPHmzessJbgCkeuz6xcdJ1NbVntZP++aHK7?=
 =?us-ascii?Q?oAakcHfSEODA/OsNNJPRit54W5V5WVUV6oj/s/tlF9fAU9TSpz5XC0JCiKxM?=
 =?us-ascii?Q?x2KVCZnm8av88e+DGuEdEs18ogVMW2px+AcIgDxeSzOX1fJxCN6Q32gbUkny?=
 =?us-ascii?Q?Cbs92d4d7BPU06PugQR8f9U+nNfOTock2axiUmdjLeFpFS29G6NOMyGmXXLz?=
 =?us-ascii?Q?ZcsgVMfy9n97dATzSc1RWiFBRj0WcsQcy6LIXzt30EACTpRR+/wPc7+YkRRS?=
 =?us-ascii?Q?MP6vKUBZ6rgALwo9dWCLlgjVpICjxkM4u+nhrMCQV/h8LjAoGBsIstJaB1Rj?=
 =?us-ascii?Q?EasWwCDsJXwGzZDTgzgUtU1zcPP+C+wasaaO66ByQQ/6OdXL/5vFk3bl2lnb?=
 =?us-ascii?Q?M5HhlfnQXwwkBflOFFXZqecCphGTRkHZha2gSmjDicbfKpoXa5vgayf9s45+?=
 =?us-ascii?Q?j28Dg4iK56QTCmav0mXdY1Mz/3YAVr7iayy8qb9Wf9pSRxaiFOo4zU01V1+C?=
 =?us-ascii?Q?s5UzNSW4nB1YrEEu7YhLUHHyRcJhYGgYWhnnOgOdAJojRjVsmP8BRmA9qAj5?=
 =?us-ascii?Q?jiacKsR0qs9x8SM+CElZBj+i6o5Kf1Ct2P0YppyAioG+hvu9LzEJhI3nvyL1?=
 =?us-ascii?Q?zZbqeJlPaLgPB3DNMQpAxA8LoXi2+dl6hbazMyv55QBps9MuaT0FvL3p/SsP?=
 =?us-ascii?Q?e6+X+jkmo32YYb+gBxy1GssAuQ4LZPo72vlg9xXJWRsJFLHDa4OsqDDTxBjc?=
 =?us-ascii?Q?/Bczh1S/uUKs9UAu/HNjssGgLhhVkqOlaWBw1dJPvHfgw0Ni2f7KWP17Iu/K?=
 =?us-ascii?Q?25UAEyZjvLyllOVBD1BkPs0WFrEFBNAoCv/bnHBSMxSXWcGEmf1BJjLHixRp?=
 =?us-ascii?Q?A+v803ej7glkOVogkzS6hQDSqkDhjnBEydlLO2baLYN6JyftC7Uwc76EPWqN?=
 =?us-ascii?Q?k04vwrkaVVLsNlrbJi8x6KK7s00L1rXJq99d2V5caLIaDp3O4DQlZ0KqkHMK?=
 =?us-ascii?Q?NJLHTJAthXBIEyRSZb/epCJ7L2onXDv/Ml9TaeDu8ggRxUitziJud2PBGjnB?=
 =?us-ascii?Q?adm/RiF+Y8uK+I3cLZuXIXzQEMBWH4JDSoRmER+yvFoi4VRaOjKev+rZkKA5?=
 =?us-ascii?Q?ozSmCivSLL0Lo8wI816ZE72vR9AlraLpzz7Y7tF1lCpZRr3OOd3q9QEuu+aX?=
 =?us-ascii?Q?gtsrt0mB13o7imCLZYZx2CGTDMAulLkzxLsmSMaXEbIiVX7Yrl3p+Ak69jq4?=
 =?us-ascii?Q?3bEzipxzuq4qmouGegaH/EHugfkxW6GIF+5SwIRbi6HBjRyGhCvJ5aaFMYOU?=
 =?us-ascii?Q?ju8LjG0NVV2GCppYbWcpHad8764dcpKwG1U3J9fK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308616ca-f35b-4210-070a-08de31783035
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 07:55:41.2049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2oOvPfKJhmesK6pOeBJkKsl8a360pJSFN0ZnNvzCEIc5DYNdFBUnds7aiPAnf36p24/+o8QUlqJIYzAPx2wag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_235547_447613_893AAC63 
X-CRM114-Status: GOOD (  11.97  )
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

Relocate spi_imx_dma_configure() next to spi_imx_dma_transfer() so that
all DMA-related functions are grouped together for better readability.
No functional changes.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/spi/spi-imx.c | 88 +++++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index b8b79bb7fec3..e78e02a84b50 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1282,50 +1282,6 @@ static irqreturn_t spi_imx_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int spi_imx_dma_configure(struct spi_controller *controller)
-{
-	int ret;
-	enum dma_slave_buswidth buswidth;
-	struct dma_slave_config rx = {}, tx = {};
-	struct spi_imx_data *spi_imx = spi_controller_get_devdata(controller);
-
-	switch (spi_imx_bytes_per_word(spi_imx->bits_per_word)) {
-	case 4:
-		buswidth = DMA_SLAVE_BUSWIDTH_4_BYTES;
-		break;
-	case 2:
-		buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
-		break;
-	case 1:
-		buswidth = DMA_SLAVE_BUSWIDTH_1_BYTE;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	tx.direction = DMA_MEM_TO_DEV;
-	tx.dst_addr = spi_imx->base_phys + MXC_CSPITXDATA;
-	tx.dst_addr_width = buswidth;
-	tx.dst_maxburst = spi_imx->wml;
-	ret = dmaengine_slave_config(controller->dma_tx, &tx);
-	if (ret) {
-		dev_err(spi_imx->dev, "TX dma configuration failed with %d\n", ret);
-		return ret;
-	}
-
-	rx.direction = DMA_DEV_TO_MEM;
-	rx.src_addr = spi_imx->base_phys + MXC_CSPIRXDATA;
-	rx.src_addr_width = buswidth;
-	rx.src_maxburst = spi_imx->wml;
-	ret = dmaengine_slave_config(controller->dma_rx, &rx);
-	if (ret) {
-		dev_err(spi_imx->dev, "RX dma configuration failed with %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 static int spi_imx_setupxfer(struct spi_device *spi,
 				 struct spi_transfer *t)
 {
@@ -1481,6 +1437,50 @@ static int spi_imx_calculate_timeout(struct spi_imx_data *spi_imx, int size)
 	return secs_to_jiffies(2 * timeout);
 }
 
+static int spi_imx_dma_configure(struct spi_controller *controller)
+{
+	int ret;
+	enum dma_slave_buswidth buswidth;
+	struct dma_slave_config rx = {}, tx = {};
+	struct spi_imx_data *spi_imx = spi_controller_get_devdata(controller);
+
+	switch (spi_imx_bytes_per_word(spi_imx->bits_per_word)) {
+	case 4:
+		buswidth = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
+	case 2:
+		buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
+		break;
+	case 1:
+		buswidth = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	tx.direction = DMA_MEM_TO_DEV;
+	tx.dst_addr = spi_imx->base_phys + MXC_CSPITXDATA;
+	tx.dst_addr_width = buswidth;
+	tx.dst_maxburst = spi_imx->wml;
+	ret = dmaengine_slave_config(controller->dma_tx, &tx);
+	if (ret) {
+		dev_err(spi_imx->dev, "TX dma configuration failed with %d\n", ret);
+		return ret;
+	}
+
+	rx.direction = DMA_DEV_TO_MEM;
+	rx.src_addr = spi_imx->base_phys + MXC_CSPIRXDATA;
+	rx.src_addr_width = buswidth;
+	rx.src_maxburst = spi_imx->wml;
+	ret = dmaengine_slave_config(controller->dma_rx, &rx);
+	if (ret) {
+		dev_err(spi_imx->dev, "RX dma configuration failed with %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int spi_imx_dma_transfer(struct spi_imx_data *spi_imx,
 				struct spi_transfer *transfer)
 {
-- 
2.34.1


