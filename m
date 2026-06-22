Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58803CDB46C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 02:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ofysx+fsC9tVEMKyLOfEg0zuK/17sjgt+cnP5U+s21E=; b=niRncy4gXr5423t6LU+DVCEWWE
	+KAGPV8kX4J26XrTDXNLGG/9AnYQItpeb4cG7kUY+Gf6IFxd1hDGJv8h0H5xlCTUB4NbYSqai1fFP
	7T86c/Szb8e2hMiGQMnb6Uba2Dpn+49sfNSrCn7827688Vu9k3850gGLG6dC1fXvHxZVjNdWRCHOQ
	cRxRuGmfk763/TgJG20a+wvwART53sFjg4Na6BbAJYTgVRCMxkYMdFTRujZq7hiWHgzFSjz9YLOJj
	LrKy0jhhVEQ/7lnh6xlaRjjzcK96+XROgxDY2Bb/yKHFe7o0aNpnf+Dqo+uE5xKV8hoSBYj0nbGdL
	WeG68eyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUjS-00000004K8w-35mX;
	Mon, 22 Jun 2026 02:49:54 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUjP-00000004K8N-36tm;
	Mon, 22 Jun 2026 02:49:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7TQM9WyuR90m+078EJFP0pG8eAJ4BIZtjIACipDpojYtWfV0Dra5EXDdBwTb4FWhzZ44D0vCGroSMx2hSd4hUdYVdZ2gL9kNDtc6G4TkJUHGj28ZJcW++qNE7gpE46dneZ8zraDM+DJ/hFswgMdYx7+6lxpoBCpL02W0O5/RnYXh0oT4T/yOBVB++iwNJRbpGez/X5AxhUjb+4Qd3Aba60t4McsXTLjO1FbMtMxLZyWOunz3E42lWqNeu1aGrb3sUFwoQAdvg7AP1Uq1RFvg0xYSB1YKlPf1d31vQ32KsfsJu9oj4RY9yLET+BDr92o+YkKjDvGT7ssekB/GP6Zhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ofysx+fsC9tVEMKyLOfEg0zuK/17sjgt+cnP5U+s21E=;
 b=iKLr1G0No90NaVRVGRoNXMcjsz+XGh0qO/G2EoUUWO2dzs/qSyMCpezlmNk7kelHNZue3fbtAFTKWtXiL/pfjCXfihv0UX8EWFiYeoXTYnmbpm20Um/G4y8Pm5GYYnHvNvWjIEYtRSinmurK9GVJR/PZQNyuOmBkvp9GhIexd9rO8PZ/T8N/iZrqZWMM4PAhaR9bAxQANWjQpaY0AbXUxyvQS2ZbmOA5giA8y39QihING4o2bqowlhDWmwFGVqfgUJQlE72bCFoAQR9vnJzETGf+T9WefFYydzkYAFFyNNQzee4Y5elHzFh39wwqV39wjb45BWBNqEx/J4OFsGsZYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofysx+fsC9tVEMKyLOfEg0zuK/17sjgt+cnP5U+s21E=;
 b=LWzc41XPs2k9UJNG0X5lpRGOKWc22RnnNS/o20DflOPunwdKvoG2Ey35Yhhvy/mefrc9dwkDfRqGs8usbEZCVSnqG2lwFsD1o5/F6sKINHohm4gtIduX1k4UHlkg5IZIqMVh1h8A6l3aOX/s94jrvzNybR/YfJ1GiIeRSB3y7DNh7APZlF+kcUlC1RwF0LZJ30OnumfJItGs6zr47oq5DHFylPRiGB1V0UtlkvxJvOaMmLqNjwfhqtydV2bH2FNwAORlpre44YBHNkYC/+k3xKjEb5VM61bcyS2HjhlDhWmS2eKGjPGQ/WIEFfiExvc1BKyQ1G64SvQi718Lylyp9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SA1PR03MB989246.namprd03.prod.outlook.com (2603:10b6:806:4f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 02:49:47 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 02:49:47 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: maz@kernel.org,
	tglx@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH] irqchip/gic-v3-its: Add Altera Agilex5 DMA workaround
Date: Sun, 21 Jun 2026 19:49:45 -0700
Message-ID: <20260622024945.21354-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SA1PR03MB989246:EE_
X-MS-Office365-Filtering-Correlation-Id: 62330099-b3d9-413d-911c-08ded008ebbd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|55112099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: e20vdtWzlI6z5aP6Osm0IXIrMAWV4VBAClsf5qEqgdmxiACjqoetug+K7RYmPm4741lWb0ndkVJ4KMBr2Tad1o2MS9Q6KU5uAgziNjo9Af4q57prbdgoWV5LXMIGmQH36ANxb0RPPxc7s/AyliTcUqU96b8ZimRmxXz+qd1Dkn5PJW/64VEB22E3Ax3E5YLujHKGDNMolJq7EAzAuZRcWVSctxlOZKjjLeY5mllQcV+C5+rkAlzn1uXo3zaROPEPzqMfxlY3Fo0F6BSe4yKvAm+uwMzUlwIn7s41ZdZEOd25Htn4qmzimYK7fsb3Zse4Ua8tbVnAbaWirA6eTVqeIzgd6k0StQZHMntpJKnC2FQ8cGNZH8HXmO6d1ey1lkjTfSn737s0FpJID4lrNTtbcSNfS24kHK2Y1ZSpgo1VJ+8Sr3+OA9vV0ZrO0cjgFjN9Pqq6F9L+Itij4DXYyRMco9jV7SqYbaYYR74dXMrMan56lEyx8upM/WX5cv/y1fBAkPmFvaI4Omx6nqzOacojLkdnuq07BEM9bdWe2El+HaI7QCyENBut3Y79n7t/cfPQuczbLFc/gLPtptTRKQ/BME1DBs490e/zaMJyY2/rfQmy319YMZgg5odP8a2I9nJWuBxl7UDtTZ7mej79Z3/Vd3VQd3X3jOCoAvt/8rTkEts=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(55112099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lrag8HYgSTwUsvx4Eo755k5JxbXnWJFy2mL3M94cvW6WAi6D2XV2PYtXtA5s?=
 =?us-ascii?Q?dHh56IYRe/ZWtbhuU1G3IW6UNCS+qEkzubd1KjozudJuf40gqtxu5LvgETko?=
 =?us-ascii?Q?bkDjFEo5vKHt7Sc/O73AqMPVslOHT04c4VxIwS8ip6KFdL/zLI1Eu2Jg84kj?=
 =?us-ascii?Q?h8i5j9CFBZK0imHaCEJslOQJiuRevS7UY9AANhgyPhdNXSGkwOa9ZE3c/Mvy?=
 =?us-ascii?Q?8nrQL2jn6uiCKQAdn15CCI3OVcsWTZeaUC3ddM72gI+J6zPPOetMl+6M8BDV?=
 =?us-ascii?Q?dVYNqXReKjR49frnfHmZWvRJRZh28n2KyfyRm8HnJDgQX2u0znUNmVgrPpe5?=
 =?us-ascii?Q?EzxNZSgTtBgPQpN8YvfLBbGIF85HmRPq5j50duj7U/1gBsP6/NZVpE52QVk3?=
 =?us-ascii?Q?zFAkLMts6Xt+rTViHeVF2dIUxT+KNh+e85t/FOf5tgVdtXTwOUfEooQ3ItUq?=
 =?us-ascii?Q?HFJk/B4A4Uwdx0gKHMUVO2oYvKYLKPnjOQ+0/E/lptMVnjqniOFw2YOP42E2?=
 =?us-ascii?Q?R0z5triBUEW5GpSIX5YjQrY/zszMOha7/miKAZLjdI7lXsmSPO3z0k1oW7Fa?=
 =?us-ascii?Q?TkQwgRI0LsP6tUWMDmugvMRJMEG0sQ7NdP/e3DkOy7d4y7c1sxQnSmgCnkxO?=
 =?us-ascii?Q?f+z8IYF/lezmKY1ex2ZNrLR1E/EQQA4cr5loxUheo3E+njcH/xqZrxgdjMi3?=
 =?us-ascii?Q?yiJ/8LglKIspUdTPZXyIO6q9JHzrr643vn9EMrG78pvBgutaJpaK7WwRFuT9?=
 =?us-ascii?Q?O3LHSYfDcKen86mzMUQL3FrS8HPAUmGHQl71+V+o9CVCpGZ/aDNbCh2ol+lt?=
 =?us-ascii?Q?QBkMCckwXmY0kNTyefsntnQiiFqmqpJzWO7UJgF+Cf8jXbTFDF+FH05mz0wV?=
 =?us-ascii?Q?w/qM9pyQHwwC6sXhP6gpzN07LTLdIoqGZJaqC7fK4WkcCcxuj+SddvSFv3qy?=
 =?us-ascii?Q?wtQsYjKLbGFYFMSyCnhTxc6rWps1CTr7XoRMZ7RJS0k9fdoFu8dyhYcVTVym?=
 =?us-ascii?Q?Zl1jDAb5f3VjJX8qF44+JlHdAlO3LtYxWik/cqHRpQYYbIzRDo7UGYbv02Mh?=
 =?us-ascii?Q?fmrmwhfAEQ0E+QWSz89imRNw9c7YGjRcj0jXTAGRO7+XJWo6Y1c1lU0bf7IM?=
 =?us-ascii?Q?bwVihMV2injmxH57UN0iXCivxg/h5OPSz2lk9jllA+UhD63+TrQKyPs02Mn5?=
 =?us-ascii?Q?WNBcVKy7o2U540Ydf0Vn0oz0BA9U2xKFMp4X0BHAexj4kXl0iUAq5OStOjQX?=
 =?us-ascii?Q?roV+ILDOffpkqabK5ose7MegSXhDldAvbezhL718PqYEeq1kfns81MN4Mv1o?=
 =?us-ascii?Q?pIMFFrQIlnKVGd+iUg9w3NHkSbb0bWtfjiB8AF129n9WbHPjAVAZXaC5gvuf?=
 =?us-ascii?Q?TvkSKNn9N1gf964wRugw7MkohJJIMQ7fd7IEbN+geKqsZMVTAWUgVDHkTQ3s?=
 =?us-ascii?Q?hh5sMQIU+tw1VwtY30mFT8PQWEsxHW9OjDzSPTqJUPtxC1nXDElU7vpULXgG?=
 =?us-ascii?Q?r7gsngyM3iWwlUISbN2TURjCd/mKFzdvraVI7vWeBZhTVtGOi/Vk7CMvZdz6?=
 =?us-ascii?Q?CCjaiEuIArFnJy284SvQVszLQ5x+sQkoBIAG0YHmmiJgMenPoZsHUhPRlN/1?=
 =?us-ascii?Q?90Vg2QcYKxDERLVWH1mq/0UvuVMSSfWH3k069BzZdHGNBHvCC99cUbRbGnUs?=
 =?us-ascii?Q?k69AwRZsU6/MJ6wpRVbMikUb4r0gW3almwGxKXbG9RVpD2NQaM8nLajzVmhx?=
 =?us-ascii?Q?vGbpa/RTNTDwkKvD/BihjwQPpRlO+5MLj7Yk9bov6mNlB61A3ywqYd7c3QPh?=
X-MS-Exchange-AntiSpam-MessageData-1: uSdbXjGVw1DKgA==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62330099-b3d9-413d-911c-08ded008ebbd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 02:49:47.0484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWJSbTvEBkG2DvRsHPMBl/rw3Cx0tZDEIeFeCPNaf2c0KaUKeXnT6Lj5vfXpVI9ZUto+FafFfxIVWGx3IwN/RCWtnSjrsgmhplkytY5TDQ9o1HoiIRnuaaBpxEUahan64lezqPldYU5z6fiW6pcnmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB989246
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_194951_791462_A0D04568 
X-CRM114-Status: GOOD (  11.34  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Altera Agilex5 GIC600 integration has DDR addressing limitation where
only the first 40 bits of physical address can be accessible. Extend
existing dma32 quirk in driver to support Agilex5.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 arch/arm64/Kconfig               | 11 +++++++++++
 drivers/irqchip/irq-gic-v3-its.c | 22 +++++++++++++++-------
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919..5d3216b718fe 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1391,6 +1391,17 @@ config ROCKCHIP_ERRATUM_3568002
 
 	  If unsure, say Y.
 
+config ALTERA_SOCFPGA_AGILEX5_ERRATUM
+	bool "Altera SoCFPGA Agilex5: GIC600 can not access physical addresses higher than 4GB"
+	default y
+	help
+	  On SoCFPGA Agilex5 platforms, the integrated GIC600 is limited to
+	  32-bit AXI addressing and cannot access memory above 4GB. As a
+	  result, any GIC-visible resources placed outside this range may
+	  not be accessible and can lead to incorrect operation.
+
+	  If unsure, say Y.
+
 config ROCKCHIP_ERRATUM_3588001
 	bool "Rockchip 3588001: GIC600 can not support shareability attributes"
 	default y
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index b57d81ad33a0..db69e6ec98d8 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4890,10 +4890,20 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
 	return true;
 }
 
-static bool __maybe_unused its_enable_rk3568002(void *data)
+static bool __maybe_unused its_enable_dma32_quirk(void *data)
 {
-	if (!of_machine_is_compatible("rockchip,rk3566") &&
-	    !of_machine_is_compatible("rockchip,rk3568"))
+	static const char * const compatible[] = {
+#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
+		"rockchip,rk3566",
+		"rockchip,rk3568",
+#endif
+#ifdef CONFIG_ALTERA_SOCFPGA_AGILEX5_ERRATUM
+		"intel,socfpga-agilex5",
+#endif
+		NULL
+	};
+
+	if (!of_machine_compatible_match(compatible))
 		return false;
 
 	gfp_flags_quirk |= GFP_DMA32;
@@ -4968,14 +4978,12 @@ static const struct gic_quirk its_quirks[] = {
 		.property = "dma-noncoherent",
 		.init   = its_set_non_coherent,
 	},
-#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
 	{
-		.desc   = "ITS: Rockchip erratum RK3568002",
+		.desc   = "ITS: GIC600 integration limited to 32bit",
 		.iidr   = 0x0201743b,
 		.mask   = 0xffffffff,
-		.init   = its_enable_rk3568002,
+		.init   = its_enable_dma32_quirk,
 	},
-#endif
 	{
 	}
 };
-- 
2.43.7


