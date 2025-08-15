Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FA9CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 13:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aYbAmqbDFMCslzpGuvhRVs/O0usqdH6VTA8gc0YME0=; b=iWSs4BKQjDrkW4JMkV+vitBwaB
	qCHX/N2VeOSLHcB78KcRKL1EMR7iBKhL32HOvn2O/TPW/KNqSIwzLeqafyZ3/HZ22th/dIv3eufmD
	rpKBFInBBIuOVLXdcO9Xppude8lDyzOTDVeElRkKXvr748251D7XbjggcSrYqGmKQZL1W5QLV4M7Z
	Xdb6JL8gAU0SRSfOBVxDjieKt0odHXSyS417P6cDA3I1YmoFNWEH7f7pcqVBo1LuXMlRsP/pXX6Tu
	HJM2CeSD8TExOGpi1d+72TXyAlRlk3fftEC3odB8ZigUXI1TYPr5BCAax7oRA4NvAPhNK1SQ37zle
	FRqmzE5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuuP-00000002dHZ-3gKV;
	Fri, 15 Aug 2025 13:55:53 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsQQ-00000002JHO-2HvF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:16:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdwGEC/Utr69FEOW8LAxr8gpnCTJJo8P0qXTkyVGjgyJNMLSdfrheVn0qTIj23hO5Dh5yFMWgO1YLae/iTpI/E44UGFWNSI7Sryf7bhwKa0w0+DWpJNSsSbJxal+vGB7pVVfSshSbKY7+iObIUU6F4aBdchwRrZAPL5V0uAotRsa8Al8ysZK1rk7W//t7vb0ZrEQi2ZpVxCSQy9GItAf1otJrPjqgvSPofw2J4FWCuloIl1XgnqCYixjeXgj/koa5pD+u9Rr44vxpjZIn4JQ5A4p+Y0lactS2+YoIdAsdqjo+l4RWf61nDZ9xIy1i2ELwEclZbGLpBEQpRlA9fDhYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aYbAmqbDFMCslzpGuvhRVs/O0usqdH6VTA8gc0YME0=;
 b=AClK1eQOG5UXeHEW/fIfEIqAwTFPTFPjhMEeaLZwTNIyr0vqIvf9ykxHTKk4jx0Q8xlzaX1j2eRKd8Oh/dTN1ff3C8MfusFd927xM8hdirUthrCrdxI/aoEeax0DRmVmm6LQDR8ClPn703I0NLwZuHSNGINYUQIFm1W9nS/+8B1ylnJ3ziIZ1eBKLAbQ0VnQ2K3xn5ZiPaWsHjO9unkX6bzpT+a7slU6E2BfUhRHLLpFHg+lt31ZYW9ovboEhvVnRWKJbK8boJzVcE23Gn5whF1v7ryVkXgHfqZgACY/FEEcE7J3e/XdV0xlIlc15+Aubo/m40BdO6tn51pOJy15PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aYbAmqbDFMCslzpGuvhRVs/O0usqdH6VTA8gc0YME0=;
 b=yJNf+F08oQAv6GoBkiPNWdOQsVwHhvwIimaIbfVZERzk8z5A1+8/71Oe0cn33agrm4qVPI/4Vzvf0eTuK75xaEvzc8uxbnIZu4pLJGtBRmfxejT23bE69iTMN1fxCIylFZzd1aAkqu3Y7QvfarcYCGjYtLbIEUCB4fDWcQxQ6a0s86EfY1DdM+mbEU9h0S+ViKmVWKCBoQN0NJD7rzIDNzH8P42XwfnYsb4KYjxD75hA5/TLWnU/4TcdVHY+vSVJ+FUGO3pn7zzFBW+f6OLpYiS4+0Fa1MzVr5iuFCNcCUjnZKJ8nC0F5b8iDELjJUkogY0QFYl9lnV4Z9PWy8IvJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DBBPR08MB6268.eurprd08.prod.outlook.com (2603:10a6:10:202::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 11:16:36 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8989.018; Fri, 15 Aug 2025
 11:16:36 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v2 09/13] spi: airoha: buffer must be 0xff-ed before writing
Date: Fri, 15 Aug 2025 14:16:15 +0300
Message-ID: <20250815111619.45001-10-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 1ca7f352-2dbb-4344-f4fa-08dddbed32bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dgenfrVysEqnGI4N1puVm3XHDaq6T/8EWjdmtpbuDKqpDuNTkXFnIqNnVzLB?=
 =?us-ascii?Q?amVYy5po866OYsB6gyqbdseR91+WIr6qvfm+jR5PvTb6/qRhovRptAJPXO2a?=
 =?us-ascii?Q?j3qWDhvYrur6NVBTTH7tJwNwQne+XoglXWYyTgZmv/YIA6J9mFFD8RvOekqI?=
 =?us-ascii?Q?nYybrSE/6Zkdbb4js+V6z3EKA/vObeUbuv9c7H/iC6lRfkSicob5iif4/sHY?=
 =?us-ascii?Q?6NDZ26bTWIKYOILWTMOmrbFliIqcGrW6Kzy4L3p3oKbFaj+bMiAcDIM1wlYt?=
 =?us-ascii?Q?v8WLSVvpleeMGxX48eXkkZh6ULoKF/BIJ2si3KM2vh3JF4qnphFvHkNzl+A5?=
 =?us-ascii?Q?KIdb2V2KgJfG/Pi5OS7+FLuIrRt2eD5riQRRwa/+qY2f8KsTw0kq0TqbOJwR?=
 =?us-ascii?Q?1iy4O77DA42ZHvsRAWpXfIa3IxzXfIIxLwSOUO22vuXmTxI9kgxCul8iDxLT?=
 =?us-ascii?Q?ZLFXHE/PMMgjRkPkeELb+AgzyHMae2HBlEFJqtJ1w7nYgmhGnm/UKEZ6YYVL?=
 =?us-ascii?Q?mRQfVmSsdZp6VTAruV7QL2hEU1CID1/YLPSj0SJUGzvx8OANu0Cde3kDStmm?=
 =?us-ascii?Q?Q7G8Et0dXvEFidLCB2CbtqWxSIrRfTMXZkasuQ5BxEet6a2fB569FvSXjjbF?=
 =?us-ascii?Q?9xNOefZxQ6E528ha6FuwjxQyZn1sS9PpSF13eW91kUCONTsBK6mAYUL0dHus?=
 =?us-ascii?Q?l4IoMNOR8/vzkYG5CfOwUXsUNvwi91ivCjqdwWwEY+BTcBFTpMOtHzmOh7NH?=
 =?us-ascii?Q?NW/HttkDuad8ct0gTPc0BWN4si8kqPK/QVTXgsZluwLIEidVcHilk/WnV3tc?=
 =?us-ascii?Q?YO6AF9pHczIwL7w3lIV7tqRV66FeXlhVUKzqpxSIS+SZldU8EzbEsBi4tzdw?=
 =?us-ascii?Q?rr1gSAcm/Y02t82xF0w3XOrZpbTTSS9tNaa4Y/OGavDbD2Ze1RHIUzC02u0x?=
 =?us-ascii?Q?AA8o8H0DATJ6ROzMJCy22PQbkWRD1/71emccKnOQ/xzptGg0i4PT8fZ8yqYN?=
 =?us-ascii?Q?yKJrhhGWNvBzftMGmw5IaTHyTpx569+j1y8N8DeE94TBJ3wkr3nOgU/CPcxf?=
 =?us-ascii?Q?IYyJ2r+0zk/PSZE4nblE0r5JqMP2NmOkXdLD1JacUmyptSf7rA3C8ED7JO+n?=
 =?us-ascii?Q?wAu4N4SzBiKBnmtCxFfvwHWmPjT6jQCqV1Oq+0M3s9iNmLy75PNTTNynDSob?=
 =?us-ascii?Q?C4ug7I7JUZ7m3h51P7pFHi85tnTcWAgAITm/kMcLP80nfON8Dl1f6tGJq+VM?=
 =?us-ascii?Q?ERoTR3ghlcnbUMW66zAreZz0mabWXUljBplvrHoGn/wkrj/dIFLAeIukAA2E?=
 =?us-ascii?Q?hgNgEMyORxjbDQztle1sMEsrvpwlxTXs/AH3pFlzEt4JNY5AGC6ng+SVpxs3?=
 =?us-ascii?Q?IALO9GrZuj0cxiOZED54UTKiIO62CKhi/0p8OJ0qHMXVXYab0eFO+SVTP7an?=
 =?us-ascii?Q?ar6hB5U42WP8SKEgt9HWW5XOt+5wlph0CNI5U1zD9CZArYX42N6Tyg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QgR9VfkGfguabyXBeOnjKvQhgjSA1UsJso5WjuRkpn6UE5BqESIWj4HUVvzo?=
 =?us-ascii?Q?fLfJULYlg65tMgkVaMF9aALKl64kGQkg8TuURL3mLTYxuBthWuqQFj4gAhoE?=
 =?us-ascii?Q?DqHdJfkpgUZG3N5ij/CwJZd2/q+VUgo8zSFjbOwUGXjoDIzXwI3wB5CgsgBn?=
 =?us-ascii?Q?wggsSrHSTO5g6YbgvtBN9xatoFJB+iH5aUpJkwCnHbPzYPmOvQ6XTtjxWh5E?=
 =?us-ascii?Q?XQ1z0gMGsA5ao1LFT97xhwu0firkqiShVA3o4dUzlFutLgsGipqFECn/HGTx?=
 =?us-ascii?Q?58qEXuDrc8hzISluIW/sL1Y+Tv/NcG55ydFLulhzM8Dnm9XffPbW5fg55xx3?=
 =?us-ascii?Q?9scbUlS2kPluoV0VSsSC/B0uIShPW6JYOnF+kRp2ZJGDDFdZzwXdtjBFMCYZ?=
 =?us-ascii?Q?yg7nD/NBA+Af+NVuYgxLFnRAqW2sre6SpqwyIiYsWr3IukMaKxl7Zpv3Aw7m?=
 =?us-ascii?Q?Sux668h3hCaMSnAvKAMjq8sUAXkgR8Uvn2gp0/rH2dgqaGpt24fjDKdHp9Ot?=
 =?us-ascii?Q?RwcP6R2pOOfdGXv+ZiuxEfd8ID+URBRo2TCNg2dbv6dpM6N0V/XtRkfAtb9z?=
 =?us-ascii?Q?ysECJtAmYZRtR/JQG3eXw5LgcYwMJwJh84f2Pzk5ahvc/0QvdRLKaRPp5X6l?=
 =?us-ascii?Q?dmefYe9G49BPSa+1sYZDMVIxN424Jq9A3FabdWl8+R3FW2raMTvTVYhxI1W9?=
 =?us-ascii?Q?gBaUN/yV050oyclBs9WaB1hBIYC8Gi1eIuZEv86i6LO8ewQKA8SNV5C16znV?=
 =?us-ascii?Q?ICOKaeQ8imwPsYhyQrlYhZL/0kOYBsB3b0TlP32yM+jFV0rXiuMA4vYGqpjE?=
 =?us-ascii?Q?T0p1sL2zM609X+6Xm061eXnCJ8hT6KvubH+zW446zyX7car7OesVd7o4MHT3?=
 =?us-ascii?Q?oeWQM0kL/YISlanU6kI1ECjgck5qxnO9frERksl7g4YoV+5tlzLbSikzISpP?=
 =?us-ascii?Q?InKt2S/lch+X8EXxQwz+32JHvdggzVuk6Q0Hp6K4kBlWeMuZ0FYC0auDyAtq?=
 =?us-ascii?Q?mU5aWX3H1j3tPA7WMB6oO/2aEfAJQkHvq15Y7bzZBD4ZwJO616tdWA62Damg?=
 =?us-ascii?Q?0sHpWCjz6c4HnsDuixYQIawPm6yzUwOxrzkCRtILsn6xg4fySi5GG0a3smC4?=
 =?us-ascii?Q?RDH1fzU5BXxDzgKv4YBt5dU9S8ad6jTJXQsLFNQ0+kVgltDQL39fw+oCphrE?=
 =?us-ascii?Q?OjTdwTDQVQVdSdk7O1l3GlvXK3g1hvSMtigik1XatVt08hENvV0RUlDECShh?=
 =?us-ascii?Q?8nbrP1webiqAQ70uIyE2L5/3QvXvxhVepdUJ7rslfSSHaYJZVfduulHxJDPk?=
 =?us-ascii?Q?RkJNsLmqnAFkxiWYsRfacZ5ptwpd5XL6httzfe+OO7LBDr3D37BQwa8B7RLP?=
 =?us-ascii?Q?HRkdQHSEKvABxQ4gxJ8nfWiAKFANpRuqYn/czIZItP3KrWFZEWGilpzGCkAR?=
 =?us-ascii?Q?js0CJxbTAn9DpnhvWuTRvlRJ5uOTHYX33pVpkXKxW52ZMXffPuWoPfyaIqzc?=
 =?us-ascii?Q?m20PupyYWlzjW7m5bnnpIhUU4AzuzYZPzbYfuWgFeYaVk8OeQ9m6Gief53Wm?=
 =?us-ascii?Q?yhDvfwZSZmbNLQhG8qh0ozBFdaszCNvuUMM2emXq1Xx7DC0j6TWU4xLGxaCF?=
 =?us-ascii?Q?cg=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca7f352-2dbb-4344-f4fa-08dddbed32bd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 11:16:36.3150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDnLRjqEB6t6iaI4fE+7PB4ciuZaKuGuurNKEei4rcLidyZYghPskpCWb4AvdrVOkD2zwZu7rRCTJYqRGh9fCNPnpmczhCO24E1mUxOhDn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_041646_760989_BDCF265A 
X-CRM114-Status: UNSURE (   9.40  )
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

During writing, the entire flash page (including OOB) will be updated
with the values from the temporary buffer, so we need to fill the
untouched areas of the buffer with 0xff value to prevent accidental
data overwriting.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 6b1422ab4240..ed49bca1f9ac 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -844,6 +844,9 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 		return -EOPNOTSUPP;
 	}
 
+	memset(txrx_buf, 0xff,
+	       (as_ctrl->nfi_cfg.sec_size + as_ctrl->nfi_cfg.spare_size) *
+	       as_ctrl->nfi_cfg.sec_num);
 	memcpy(txrx_buf + offs, buf, len);
 
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
-- 
2.50.1


