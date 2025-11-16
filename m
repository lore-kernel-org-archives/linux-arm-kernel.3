Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1152CEBF96
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 12:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zWpQd5s/ZsvCqP+r5mzSxhSAV/DTk7bTDgNglrJcE7o=; b=tHyOziN4P515H9X3GWREZp6KJd
	K7QzAzAFoFcqxihqBckkB91mKfoGZTSKp+VpkDJAnJ3oTy7px/ReV0+aFKzsx+YwYqVmDsyW/Pz7y
	qmyd1wXNJyNcRDCu+Y08jJtadDBn3Kqkse20wGjAWuLIwHBOyBUPN9Mh7rJtXyHv1kXY2ysQTNvBw
	TlJErmuQPkuyyQyHMWG+q/W4VZWIe7OOUHxn/Syq7wlZawreYYXnPkYafeJ9M3Xar4fL2H1YEy7be
	IW7hB66/+KnAMGZafLV9dlHZ15nd6Lr38AFaQPyi+i2ey8ev6fRp32AfQuZ9BFV/uMdtQE5niO/LB
	4cLqv+9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbRC-0000000Eb5m-0kMp;
	Sun, 16 Nov 2025 12:00:58 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbR8-0000000Eb44-3XZ6;
	Sun, 16 Nov 2025 12:00:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=js0uu2WUOQLAxm9SV1UmXApUhbbgkops5ICIfAb2GjQ/JKUKMWrQI87/IuhNDwV8G14sk67Y1cDbbOfnU/4EkqvgGvxtzM1qhq2QPMPYxsJ88Qh1hksyRw4YPVdQfsoykeMqYuIkbZwzSkW1ttssjU6NMjOSe/T64I2uuY4eAoR9ctxHArdBdA5ZQ3jrSPMOhZlC696toSJC/+cRYxWa4PWMbS+XlaaA61ht6CnlHPc3EZo7zYjSAbg4JJS5BX/aOLafY+dxLnmndfZXdY91K9BYVV8WzOPkkOi45u5G53eSb6YSnAOgFaHc7AnqXj2/gUxYptNSQl3j9dWj9Q/eGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWpQd5s/ZsvCqP+r5mzSxhSAV/DTk7bTDgNglrJcE7o=;
 b=qYE86CjGzQqYsW5/o4puAm/oayunST13MnZpYKxSq4MuXpUXXGZlillR6YQnbrIi00QM23oxWuE2rRgsxZe9J+cfcp1+8CgQWoxOCr98vwocfYDUBkWsWFuWtYUnIfh73aAKSetqt2xziPifEc9S58olWivzrgApF6QGEg69cK2B03Ah8e8JVRWQuLrwi+FKvEm1FE/guQHt7z4+QTO9/C2c6LaYaDkLRoUer0IDAWaYlzLTo2RRlRlFLSChv8QstwxA0B74Wpu1HsnKH54n8FvFAckXCmSOJkwadzE0bWqSZcYFtUESYJcz+2VGmT1mB8l5NaeePZmD+1xvk046Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWpQd5s/ZsvCqP+r5mzSxhSAV/DTk7bTDgNglrJcE7o=;
 b=BYjKIoH5w9Fs0Oq6Hjp+JUN/jnOtGSZ7XaZaXORiEgDq2DVs+FtHFMoUUnuyoaibVDoqvw6HAoQQid1Ut9EAkmzP8MmWs2wfUrdJfpie2N9kfuINMKMeVv0uWQ4Vg+fiZv8tfqn5BHAYq1MYJRfD+deiNI2Er23MjTlUmGuCaso85CNb44k/SqstG5I/hS2zFqCX5KvUu/0eZFXBMakapIvS2mlpj5s8sarwr9pMrePHSnyseYT+MiJyYLzz59Dvmec501mNfmAHrisXp4kM39iScTJCeBiBqWVXrH1SogQl/NUmnli9Pj3G1gE/mCMEreQTv/F8qznQ/kgyZmZm0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PR3PR08MB5563.eurprd08.prod.outlook.com (2603:10a6:102:89::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Sun, 16 Nov
 2025 12:00:48 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9320.018; Sun, 16 Nov 2025
 12:00:48 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v2 0/3] spi: airoha: add support of en7523 SoC (for 6.19)
Date: Sun, 16 Nov 2025 15:00:35 +0300
Message-ID: <20251116120038.672178-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0118.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::31) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PR3PR08MB5563:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f75de20-918e-4257-fa05-08de2507c74f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?evk2on8tCOSdCRjxSyyBmZfLAqai8uhYi2p93o9OVsnYpMv6TyxnuZKDzbai?=
 =?us-ascii?Q?kapMwP9NoBqAkMwEiYUA1cOu1wzJBkAkkQTl50siDgXYZdkdgNgmTire9RHZ?=
 =?us-ascii?Q?A5Yp6IuV1JYJ4ziZug0lgvZnFzb70AitK5f0gswuRHAjY3PBrHTdzxdiTrfk?=
 =?us-ascii?Q?ZTktsye1hi80ixR645cRjxQ16Bbt+8ajCkX1P+c8MLfWUyVqWaJ40HtWJFwG?=
 =?us-ascii?Q?0fxawdkPNUJFYm/KFOadEqwv0KshVV+vySYa/MsMNlWF1H/aDWxUopOnlOsv?=
 =?us-ascii?Q?hteM5tHI9ZmSdaj4D3We7Mu1cf9jun9vtLuJoa6Bwu5DDfDUA/m5S0XE8kn9?=
 =?us-ascii?Q?CSh/bu+0mDsDNlhUMjJTiOLiC+iwUAUE4x3aJTAj4Nn3Tql8t3cpiQJ5R7qb?=
 =?us-ascii?Q?gcnTX1KAVw2q7MYAmk0mFm0oc23AMECOr4uvC4LNt/2bR71Wjlg43CJUzeTD?=
 =?us-ascii?Q?iw94MpEpPabk85hYzltbMOkkJdVhzmf979Q5WQX+jGto9lx0PwmqebuBoCMK?=
 =?us-ascii?Q?zXM9/9Svcmq6w2TDFLvwdNp9VXYC4tDHSd9lLWxrkQ2bzrgPP5aO5cG6AeBi?=
 =?us-ascii?Q?cXVzzMHYa6bhyKiNxI7Bhnap9/AE/IZbhjlot1syWaK+k7VQLk5vGWEc/NO4?=
 =?us-ascii?Q?ttC+qX0rDcborS81Zr/cfMWiByFOc75PKERZdfgaCO+R7sTmNYq7n7p0imlf?=
 =?us-ascii?Q?ud2rrok9Vavhug2OdMPjWyUrnyaT6q5z82KOdMzGKksOiU3YV5PJK84LGy8h?=
 =?us-ascii?Q?pJY7eWUXiZoliBw0f4t1Xlwo4b/8VU3CO1xgwLnH1cboTcpXDqBTTlVuJHO6?=
 =?us-ascii?Q?H+/bG7dtVFTS9jmBjyq0bU9eNh+O56fmrKjz8qomgWTaRxEBkIqIizDYoO5i?=
 =?us-ascii?Q?Ehz5GGdWBr1BOhptQT8IsXKCRWolgEAjRlY7qm2ngJXMbxcWSNUxNod/LZut?=
 =?us-ascii?Q?GmBORj5s692vskBl2jrjQZC6LRvDBJmzoTglaWK+WO0eQWv5hIUGGZvyermZ?=
 =?us-ascii?Q?Ye954TNywZ/eusUr+07Rb5Fs1TPYPJ4W/Dq4LS7U/tUpRB4NySUkny1fONPR?=
 =?us-ascii?Q?/tgFi/hFeKiYcEaGyHggo4IASPcTabC6ryUkj2LPN9s7SUmn7YgL4l5mkYwj?=
 =?us-ascii?Q?NWOpewdgyQIW/VzKw9C0+5Sd4WJva7rJI836nPVj7NE1RGz+63uvYB0af5o2?=
 =?us-ascii?Q?wyTZRi4i2JuySe8Xk6R7ttjjwEM7rNBr16I1OG6qKrZaYoO71wVIVldtHWoF?=
 =?us-ascii?Q?4x0OgodkTHffquZbThc/+kCcPvF3MLyHT2gPqgc8Hg2brmByE7FuJ6HrCXUm?=
 =?us-ascii?Q?QkLyBqR2mvFztSfGwN1zCSzb+hBZjLlAPXc0C8URXFJStOT/btjhfB/VmWTL?=
 =?us-ascii?Q?gerojkitlAUtOTusrQLz/Mfkqwfs+ciBnFFuDp89Nf/fz/YVNURvXOgmVBo/?=
 =?us-ascii?Q?YUuJSPalbsVJD509MOCpooMAHaVuV91T5zPS5w97Wr+HxZs8y9rPR39EdHHO?=
 =?us-ascii?Q?0DVsnIacOHchgk5bKAr8u0jMmlt+EnHGQcG/JG896XjjYQOoliXxkz7gFA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ObKCyO564GOkDqyl2mYePI1DbhxeNaxcUX5nb9rT6Ott+zVOTzyyikea8RVE?=
 =?us-ascii?Q?hrHnNfJp4kBZdN62FfjM3C2idLsJrFHLxFxuy23bZCIJyv5hXt/5M+6pD8Yo?=
 =?us-ascii?Q?ShnJUJiikqfyf+93L4xX3Hlwfrt2Aq82WmvkJGRDM2gG3mcstsErnwk2er/s?=
 =?us-ascii?Q?j0T2H7xtCCnmDdn839UH1ZJDm9q4wUkhvGHCAaBOGi7L5GnQxuzcnZ166t5f?=
 =?us-ascii?Q?j9MrFl9lLCjcFYprV2ynsGmnTe9dg8tC9ELIPbqwMymum/eXJF3VO58BaeJ7?=
 =?us-ascii?Q?NwAMCtIhnNbYMDi9l4JB6ipbPyfc39GKEJqPut49YxPmiqSmuyB498HNLpL6?=
 =?us-ascii?Q?+XSTYp17aixLTlXbKadJSy8uB8eUvZTUUL/KW2UvmMSQ6DpAyMSpLZj8ilzO?=
 =?us-ascii?Q?qxsnmsZi0GoNttH4JKHIeA40FlAzIrrIPtjzIOYW3owV9Yk/u39bHwR9qyrh?=
 =?us-ascii?Q?JNeD0zvTUsJoH7HVWtob+3Wf5p4pXiUUXhXfgsKhU+qtL9w7xtTW+pK6SI9C?=
 =?us-ascii?Q?IoMWyG1L/4d9WgKVpZhvBBFKZNCUIWT+Nyd0BnYsi/MsIEuaPoml1rCGzBAq?=
 =?us-ascii?Q?oRMaj1PhPOdSk4g83AbmMYrUE397rdEviyAxL/imEJg3JZXLrXSLtuTxPovN?=
 =?us-ascii?Q?oThvL2raPVQGj89JgJWYG7TcMHHv8N85DEC6wzP68uTJZcR0mUfprMuqPw4g?=
 =?us-ascii?Q?9GgeSUIaZED/hjtCDIHalcwupcBSNL0kn/UJsCEXMkFx26HQVDu8rQPXfehc?=
 =?us-ascii?Q?zpQTFsJtHFFunEODLyueEiCaJLAFfMzU+s1I5RUq+OZjc+JSe6cbygVodg7P?=
 =?us-ascii?Q?MybJO0um6+y0dAnww4NhbKQj0jeS+KLbQn3BZqeAV40vrdPbPkCpHF1AA2nk?=
 =?us-ascii?Q?tV7U/bpl5rDxAjseSO5H+i1q+uSlI2Z/2ybFNYiD1MTZIftZwhVlBLwLok8E?=
 =?us-ascii?Q?Kj8VxZMHOcXGJ+TLdfbTGRKQbSOz4JeEIJW3263kD6PLY6Q1Aak1F3QlRx/h?=
 =?us-ascii?Q?aMMsSkJmje5uUSepoj7mDKKlYOwKra8Lm5WZFCmVmP99wPHLqXJo1dnABSi9?=
 =?us-ascii?Q?QS2y2jltiTm/udliWQ4iQ3NqUQPUaSLA36Ajg2IAcP94dh0RJE1eXBBu5BiU?=
 =?us-ascii?Q?JZYf4vwX84miRyflZGyni+vzSfV8ikudNF1VAIza4WsGCRFMbU366h9EbwNs?=
 =?us-ascii?Q?fNFJJhPOM3OmDYuKyNfM93u4GpYGogClQt7uxGahLJJ/l4witreVtPOyxjSN?=
 =?us-ascii?Q?iSifP4l8vG8/eHBxtPlRD31UErszHLE4L/+DCo9r44ggIy3IjOhm8o9zXVA6?=
 =?us-ascii?Q?pzLqtvw6tagG/dm0ZWInFRvb7/DZbEKv1KLsZBTDbvq5FZax16BVIEn1sRXo?=
 =?us-ascii?Q?9EmRqfHueWU8sjmK71TTkDwIY/M2j5uuLS2GUF6D18qP/26wrKmw+x1qrmeq?=
 =?us-ascii?Q?XWE41W0q8jAS32YRAIoYplvTgJHS6YONgAhNdIvkCnIC3+I9Fetv9k6kiCd1?=
 =?us-ascii?Q?BKPsCV6FtKHrY7Liny9xsEVH1OVuLXNacmKbuW38tHNOkTxKZtYES0e6jaDD?=
 =?us-ascii?Q?6h+E6gePf4OF5tkk8N6RniA1SkkUd8mkmTaqr0XaxOY9pOvuQWfnFKp84rN9?=
 =?us-ascii?Q?MJA8VYyrgOanfTAWAZw1lrQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f75de20-918e-4257-fa05-08de2507c74f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2025 12:00:47.9336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8aM+9xbWlcHvc3rCVP+VeqZrT+ZW4cwNrEXZVniPuUCo1R+PSJfDbcj7lKsB3yJw75Oiz5nwqwXV54rQmP4xFvpQvLQ2UKolitOi5yWZM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5563
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_040055_435649_101D17A2 
X-CRM114-Status: GOOD (  11.07  )
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

Airoha EN7523 snfi controller almost identical to AN7581 one, so the same
driver can be used. The only known difference appears in the very specific
boot conditions, when attached serial console force EN7523 SoC boots
in undocumented (reserved) mode. In this mode dma reading of the flash
works incorrectly.

This patch series:
 * add support of EN7523 SoC
 * add spinand node to en7523 dts (so spinand flash finally becomes usable)
 * updates dt-bindings to mark driver as compatible with en7523
 * disable dma usage to prevent possible data damage if booting in
   reserved mode was detected.

This patch series was a part of a bigger series:

  https://lore.kernel.org/lkml/20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu/

All patches of the bigger series (except these patches) was already accepted
to linux-next. The was no any activity around remaining patches for a long
time, so it's time to send them again.

Changes v2:
 * small improvement proposed by Lorenzo Bianconi

Mikhail Kshevetskiy (3):
  spi: airoha-snfi: en7523: workaround flash damaging if UART_TXD was
    short to GND
  dt-bindings: spi: airoha: add compatible for EN7523
  arm: dts: airoha: en7523: add SNAND node

 .../bindings/spi/airoha,en7581-snand.yaml     |  7 +++-
 arch/arm/boot/dts/airoha/en7523.dtsi          | 20 ++++++++++
 drivers/spi/spi-airoha-snfi.c                 | 37 +++++++++++++++++--
 3 files changed, 59 insertions(+), 5 deletions(-)

-- 
2.51.0


