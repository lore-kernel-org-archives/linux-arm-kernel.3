Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19847D3CCA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 03:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oudExAwDsHpH6I2KweEzn5lkrqFRVJLGh/+BJdaKNmo=; b=Zkg1e9MjTzKCbo3i5zFDjZcZ9B
	NZGZsjXx5GqNxm5kJ0geLB6bBPD/EHaT6RHMbEQf2sPVBRCjpQocKKBntk4GmU6XG/5PgK32g8owP
	Oo8A7hGg0SfVyyNeU7bDPie2LFtcavt2U5CvcYNvy2FvpaC1B/A238JV+vFwR7OkQlV2i576g7xHs
	2VCH7mdAWusd1kCLJQ5tfe16Pn8dwhbRYVouUtS7S4WMv3FagfS3hVPxq/OEndHpZJB5hSyCXW8be
	DKRw1IMHPnl7MhRCtnb2pjTDiDz5VUvc9InVG1plZxVG11KD+YlwWF7YhD7UBGqF32vT0w5JlnDp3
	15+9EjHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDcF-0000000BcUH-3CwE;
	Thu, 15 Jan 2026 03:01:43 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDcA-0000000BcNA-0xWJ;
	Thu, 15 Jan 2026 03:01:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9TWBijQju07fdCNMr2TbFVZmhGL6K2D5D6EyJstMLlZIZmax9GWiZfPFbzsv2WyxLVs+ipPemnOGc+OLdC5VpIFkZO3RIVAU0SeWcJDcEzw/ppaVTdN5YbLRNJJpH0FWBc7S1xuEEhRNnmvVdJkFLyQQD8UH/Yq4qV+ig8t0MiQQqzZMreHyseCN7iZAbggHhjOMoNM7pyR8VE6liqP8gNPvIccWvif028riQbiYkjIyQE24L7RozlvskN6uBi3WZnGnlHQJiAR18xx1RUW2y7jYy3oBBV1cy5awKd6XThgwgIKFSJh9lcDgX6IjwcgT//EXV7VCDfiu3xr8NpusQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oudExAwDsHpH6I2KweEzn5lkrqFRVJLGh/+BJdaKNmo=;
 b=gOfs1ykLHQ/LJL2hU81iRAkabgduHv4XNtPiEgY4i2Us/et15u3WnhplKFG00N9hONwEK2k6OI6jBwBPS+C3QAoxjxe5eh3eYvkGVtoU2b9WrTH14dmZc+50xH0EVtJkpOx/Eetrq1nd2ndewMVkKs4wcJDUI3F3wrs3VsFuJf/3Pv3aWfdEU61sAaBFIjwGSWIucR1l9PBrnoRXh+lyCtf/6yaLQhgqIu+tzvn2tSUmpKQh0b78f5r+UbPSHAw/5qbF3E/TpFxXbd3Pe0zUWz+s5RAGakjB9t9lJaMp4YaVmi6/f0Cg9XiHatwGzR8SBN3LVNM/EILsErqbevXViA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by TYZPR03MB8614.apcprd03.prod.outlook.com (2603:1096:405:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 03:01:25 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 03:01:25 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: xianwei.zhao@amlogic.com,
	christianshewitt@gmail.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	nick@xieqinick.com,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v3 3/3] arm64: dts: meson-s4-s905y4-khadas-vim1s: add initial device tree
Date: Thu, 15 Jan 2026 11:00:15 +0800
Message-Id: <20260115030015.1334517-4-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115030015.1334517-1-nick@khadas.com>
References: <20260115030015.1334517-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0002.APCP153.PROD.OUTLOOK.COM (2603:1096::12) To
 PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|TYZPR03MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c7db2dc-0816-4799-5679-08de53e25ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?txPoe1S8/hw0fUQS57czhuXwYTSkSul164UrX9c4cltXnEnP90Yk0wwtM1cF?=
 =?us-ascii?Q?ELnCZD6d54uAxtop9zmgZf/NhroTLh/PISDXnvyuEULoBkmeRROJBZYtgXag?=
 =?us-ascii?Q?KWOHPImLh/B9FguWpEvr5lkpeybTxaBBu126MwIkg9d7hVAA6gO+7L779OzK?=
 =?us-ascii?Q?e8pDxvaVrudGacBlg77yfQm3dRiqGiPZ1wv4gTcoqqkVpPRnQudZeu9Vf6Wv?=
 =?us-ascii?Q?Y37xOvht5TQdzz+MTIx5Ux8Mup+w70Q0T5sueAyFh1Fkk5IW9Of+d88ZXvSv?=
 =?us-ascii?Q?MniCLUnDcfuJnL9sJmY2mARSgC9ZGVBM46vZEonOPsFPSdleiHKFmd47obXM?=
 =?us-ascii?Q?X0UyFSthMjEMhLVAqyZyNqaPjxbsdvVYwx/kVNRMtiUjAZ7fk2HvHQqSguxx?=
 =?us-ascii?Q?aNgbgiA2uacfuu86aVNN71/XgZljl+0pKmv6K2/G+hi9vkcy7SH+soqAL64/?=
 =?us-ascii?Q?/w3nWHYeP5Bx3u4IvleDRhzAZQMrensRAmhkp6eeAJ8Wj4ITyVursxkpglOQ?=
 =?us-ascii?Q?VSJ124x/Ejl8FKrkX0ry6kkodCAWfmM81QT28AfmkSzcMpsk48RUM9H0sOmb?=
 =?us-ascii?Q?/6MQ6uBuh194OU99FViE1BEihqMgxy1nsKg5NV88XeQmhMGqwASjgCJkef6n?=
 =?us-ascii?Q?PaJWwmQ9pCqAwOJUGicsY9UVL//s4pLbc96D7oJL1EgmZCRggGUOYyf583e0?=
 =?us-ascii?Q?GueuQMndIq3wSOBWqAN2U2CLguUEpQaZThvVsVz4/oKLtJo6w1Z1x9MMGMba?=
 =?us-ascii?Q?6LIM+D6IY3YXaBMUxSBjYj2R07bMZDAzsfYssJK8SQx3xqctwktkUxoPNosF?=
 =?us-ascii?Q?CUxdnPm79TKpU5p641Vb4X9IOOAsIDIwehF99yJlIKx1qbr9nloaLY7IjMRi?=
 =?us-ascii?Q?uBGtdpSIGFUVHAB2p1XfYrcBs/3J/MlZ40uUzwzNJHb60zxpF9RZwgcjuAkI?=
 =?us-ascii?Q?YttY72D6EXpBHNKiDiIOg0pFlIQjnqBBRjnn3DSLC4VOugsVV0OjZcvgMEb/?=
 =?us-ascii?Q?L2KAwAMmvLakl8d8BM6UfNTtI7gV6sv0OXMOLdzvS2/ueWAo/t1MYKbaRyGu?=
 =?us-ascii?Q?9uMiz1f9V1A+bFYIVQmOiNyKPewJeQ6G5QyrQSa588Cle1N6LnwvwphE10H7?=
 =?us-ascii?Q?2CXaTuQXze1R2GZk9RvcFf4KyeQ49bzkDNqUHIcN6OYP4ZaycVOKPKM4zBm0?=
 =?us-ascii?Q?bhfUxNeWhpedpUKCUUNrwI5Zo+iqcn5RgxSAolh57TOgFY3ykFed95ytl/iA?=
 =?us-ascii?Q?0g2oSFrCBuB4agpXKJmbNIwK+vYZV7BsPhtptkmLbg2fgl83VNN9+a40TV8b?=
 =?us-ascii?Q?/+d5rBkdWUuwrHLXux8JuDdvh/+GZEGJvfOb7axh2x6z7tXp2oxxCl2qMO4r?=
 =?us-ascii?Q?Tv6YRWjjBUxzVyiiqOj6ZBJ53vhgry7wCwVGvMQ6Y91YnamWw4Q/qF8O3OkG?=
 =?us-ascii?Q?f2fO73XAa3rPcpQHX4lxHePwRbDvIU6svM6N+FcuDDKfw0ZDrMoGQIHEIX3r?=
 =?us-ascii?Q?4ftyhIQQrsurUdWIgy7gQ1HpGwatLp2lBM8SU49tDuVmLbVRAys1wbE5Dpsk?=
 =?us-ascii?Q?JhVh/yBB8zlK1t16a1v2HYvzGG2Xrce9SiKAgJytHRMapUyn8cnlbrDDrgMN?=
 =?us-ascii?Q?AIPBd/hP040EDWbzIXH6UlM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0POJeXe6tdmnPDIYwxnnYIiMco4PzfJqd1HR3HtYakvsmu4nZEj6A4vesTt5?=
 =?us-ascii?Q?uDumMNIvJCAwLXNvxnVMglR4oGTcZOvHZvhXGVbfScIwtsQ4bdZ1sWYFiKpu?=
 =?us-ascii?Q?H4YkhYdER5QdWpEeBCgaxlDgB/1ifTUSB6hYSuWS4+dEsAEE9VvvF/5JMlcT?=
 =?us-ascii?Q?+p+tBdz+oy65pkncoAuWxuZspzeSG3PQRLqMKC/3u4njL7vyF0YbLSs294Va?=
 =?us-ascii?Q?Dq8BEpdVUUJn67oCfvAVTIqPimUxRxerln6x/T2UdwwawmKdWxSmbLunCinj?=
 =?us-ascii?Q?G8YPr5H3anBE60X4GODncEmhV2+swVKfO1UrtqIXCL2o3AMB/8HjIK/HGxb3?=
 =?us-ascii?Q?vsvgOYwBxrfdR05mT3HxwSV5YjQ+ZAgokILhHOZcyoAgOuR+dy3yO3jKzovc?=
 =?us-ascii?Q?heicQSCXJX1fgGsEt1cQ1osU6qmHJeaRhu1FuOifiLaG3ZOux08SUnyGCwnz?=
 =?us-ascii?Q?mjTX2mj1+So1Mb8jdCDcBqQ2Cfp/axSgRzRdEbuge5v1KqH5IfGa65uVC7Bp?=
 =?us-ascii?Q?tRTPvg8c1yPtt1onJ/wVVDRJdTWMaC5wnRiB2omNLGdOa7OEVc5+N3/vFtzQ?=
 =?us-ascii?Q?FdfdYjDJH7G77boZSe/inr0bTqwGquR4WksAwMdMWJCEnQ02IYGoqFQksBie?=
 =?us-ascii?Q?vUqYLgeo2+NdQd4UP8fUhIeVOnZULPaHRI31mtc3/k5tXlSE2Iap/wo8UqGD?=
 =?us-ascii?Q?7jLlZtH2kLW5UB/NX7G5s2+UrU9KjtZ/w6BU77wk9nIOmYPhbxwtXJhawIDq?=
 =?us-ascii?Q?asiNssTk7isaLAHL2qjT9XxjKe0gO7FGRqCxdmfep7cQAH2aKeo/6IuRMgt1?=
 =?us-ascii?Q?GWelP1EzQbEeVXDj7q3kBSPxm16a7HerFinNNjEGAGCo9bZpR6fJ3j01empA?=
 =?us-ascii?Q?p4NJgnKXZzaZmASBjTv0uS9XyUMnVtXFkgl4RU/NoURKZqRBmSP1xUwUmt7v?=
 =?us-ascii?Q?Ttc8M5nU9P58bm8G57orTrlIZPbLX1Y4n/YEhantams7SyE3V5O7r3RDLIPd?=
 =?us-ascii?Q?0HnXx4fe2d/OnN/RI27FwJmz4vAg7ML3xtxl7T6+sG2Hwxc2aGHetmqiLlfA?=
 =?us-ascii?Q?i3l1/XkWMr4G3ilLda586531/uyXbPYzQ2BOaQnZizQJVb6h/gKSkvqSX6bP?=
 =?us-ascii?Q?x9PGLTyv2i9kHPGThTTrrE4Gjdso5OBhgMMnrL7cvGI/3HGGsRo5RWkDY6Tm?=
 =?us-ascii?Q?nL4UeteZV17ref1RIXBlUJWLCPGtMGxsFx/C3B/l82TmKNKbGelyG0LAFQLJ?=
 =?us-ascii?Q?OC01MJWSrDO3tlGTtxGYFWDUNAUN/1rwZXocY2CGmXUa+tLk2i/wkL4Vb8qf?=
 =?us-ascii?Q?q4d/wi4vtCKf5idBnOhI5cGEZBBFoEXZC3Y/l9eGaLzWh3Myx4Qd0Vpgjr/Q?=
 =?us-ascii?Q?Tvq2i3cDQcvCthQHK79AmiHdzGgBIrUlAXFsdst3k8ymg2X8fdDGyCoNqw7R?=
 =?us-ascii?Q?68ANMux/ddNXTJpKyAx2//GJc4O621zIwT7ZNQSn1ijfz9VzY37MZhrKgWHY?=
 =?us-ascii?Q?Mb5bCdYl2ZUNsM9RYMQhBCM4DUv2qR1B7+78tjZUgc869jZ8RlChv9Tjhmm4?=
 =?us-ascii?Q?+nCzFbhppYKgWoNASKZz6OoL1zNSd3V0nHVKc+WGc73XPZKNskoFMyj0CIJA?=
 =?us-ascii?Q?uWKdVAEJO5U29KGciA6P1ZZcSktZIxXDEzbISRmS8yvls8CjjPdngQ54Ikiv?=
 =?us-ascii?Q?wW1N3I/4nF+UTvtezz2eaGRONAn744wp8gSUpnMuTd1tAxLj?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7db2dc-0816-4799-5679-08de53e25ed2
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 03:01:25.3103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nl1C5EdBEhzxL7uqyXF8Jz+n22BD7fDLJgE1AscuLYXLBXwp/vdrXsx8KmPX2AVM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_190138_277332_CAC7B8CD 
X-CRM114-Status: GOOD (  13.10  )
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

The Khadas VIM1S uses the Amlogic S905Y4 SoC, based on the
Amlogic S4 SoC family, on a board with the same form factor as the
VIM/VIM2/VIM3/VIM4 models. Serial debug console, ethernet, SD card
work with this initial device tree.

It features:
 - 2GB LPDDR4 RAM
 - 16GB eMMC 5.1 storage
 - 32MB SPI flash
 - 100M Ethernet
 - AP6256 Wireless (802.11 a/b/g/n/ac, BT5.0)
 - HDMI 2.1 video
 - 2x USB 2.0 ports
 - 1x USB-C (power) with USB 2.0 OTG
 - 2x LED's (1x red, 1x white)
 - 3x buttons (power, function, reset)
 - IR receiver
 - 40pin GPIO Header
 - 1x micro SD card slot

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 190 ++++++++++++++++++
 2 files changed, 191 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 219fb088c704d..15f9c817e5023 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -85,6 +85,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-ugoos-am3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-s4-s905y4-khadas-vim1s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air-gbit.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m2-pro.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
new file mode 100644
index 0000000000000..79ffc703a2e99
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Khadas Technology Co., Ltd.
+ */
+
+/dts-v1/;
+
+#include "meson-s4.dtsi"
+
+/ {
+	model = "Khadas VIM1S";
+	compatible = "khadas,vim1s", "amlogic,s905y4", "amlogic,s4";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		mmc0 = &emmc; /* eMMC */
+		mmc1 = &sd; /* SD card */
+		mmc2 = &sdio; /* SDIO */
+		serial0 = &uart_b;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* 52 MiB reserved for ARM Trusted Firmware */
+		secmon_reserved: secmon@5000000 {
+			reg = <0x0 0x05000000 0x0 0x3400000>;
+			no-map;
+		};
+	};
+
+	sdio_32k: sdio-32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		clocks = <&sdio_32k>;
+		clock-names = "ext_clock";
+	};
+
+	main_5v: regulator-main-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	sd_3v3: regulator-sd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "SD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio GPIOD_4 GPIO_ACTIVE_LOW>;
+		regulator-always-on;
+	};
+
+	vddio_sd: regulator-vddio-sd {
+		compatible = "regulator-gpio";
+		regulator-name = "VDDIO_SD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio GPIOD_9 GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <1800000 1
+				3300000 0>;
+	};
+
+	/* SY8120B1ABC DC/DC Regulator. */
+	vddcpu: regulator-vddcpu {
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU";
+		regulator-min-microvolt = <689000>;
+		regulator-max-microvolt = <1049000>;
+
+		vin-supply = <&main_5v>;
+
+		pwms = <&pwm_ij 1 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+		/* Voltage Duty-Cycle */
+		voltage-table = <1049000 0>,
+				<1039000 3>,
+				<1029000 6>,
+				<1019000 9>,
+				<1009000 12>,
+				<999000 14>,
+				<989000 17>,
+				<979000 20>,
+				<969000 23>,
+				<959000 26>,
+				<949000 29>,
+				<939000 31>,
+				<929000 34>,
+				<919000 37>,
+				<909000 40>,
+				<899000 43>,
+				<889000 45>,
+				<879000 48>,
+				<869000 51>,
+				<859000 54>,
+				<849000 56>,
+				<839000 59>,
+				<829000 62>,
+				<819000 65>,
+				<809000 68>,
+				<799000 70>,
+				<789000 73>,
+				<779000 76>,
+				<769000 79>,
+				<759000 81>,
+				<749000 84>,
+				<739000 87>,
+				<729000 89>,
+				<719000 92>,
+				<709000 95>,
+				<699000 98>,
+				<689000 100>;
+	};
+};
+
+&ethmac {
+	status = "okay";
+	phy-handle = <&internal_ephy>;
+	phy-mode = "rmii";
+};
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins1>;
+	pinctrl-names = "default";
+};
+
+&pwm_ij {
+	status = "okay";
+};
+
+&sd {
+	status = "okay";
+	pinctrl-0 = <&sdcard_pins>;
+	pinctrl-1 = <&sdcard_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	bus-width = <4>;
+	cap-sd-highspeed;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	max-frequency = <200000000>;
+	disable-wp;
+
+	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&sd_3v3>;
+	vqmmc-supply = <&vddio_sd>;
+};
+
+&spicc0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&spicc0_pins_x>;
+	cs-gpios = <&gpio GPIOX_10 GPIO_ACTIVE_LOW>;
+};
+
+&uart_b {
+	status = "okay";
+};
-- 
2.34.1


