Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4906F513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 03:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mfcHGj+yuIMpwFt7OBsOIn28TIPZZfNs/lEWos5XC+4=; b=XfYobLWHoWsoSd5c5TeP2Y66tE
	3UyO5tZI2X1icBh71qy/SGXVdWaE1sWA5RyW9rgyqUOO6YaRuGbrmH3efYiZ7xDAljk3gCeMFSgwi
	zedM1kwTJrUDiEDnQDjWCs1CKyb0JJ903qKDs+OhuovPnjo8pVt6yIMyxpTC2dgY1KmYmos/8tOUu
	AnT8oWAGM9MxZwRfkWN6F9dU1eeNAqR0lGdJ3xWPUsnYOUIs4HmQfToqihOh7dSa0AG/6EAGRgICj
	qSMkTJc6fCAw6utoYR/WTQC9X51PAEVKc+MAeZ4z2YAiBFvWq0ro5xYSy0Ow/PDjnpn9oN/0ogUL5
	i2/CxtRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLbq-00000002wLN-3Utz;
	Fri, 06 Mar 2026 03:12:14 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLbo-00000002wKb-1y42
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 03:12:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxAR4QaPyMDru7iJFDWlbUiNsw6w7kd8Eq5R24qaxrP5rVfGR5V2f+h5vq9S1rjCgpeBsHO4flrTD8qNGANVNSyvMTdKBLslPIhGDAUkBffNyWQn0B6Uy0veRVapwnVPGe2CmmQm+r9ewUjQjzwXkxhdkpVN0GJDyAK33KNmhKt8UxVqhnRFpyf5/aB3cFWcTmwYeihRjxDRmeeOFkAm73N4JGAlC/jHkSGkaUhR9OOHXGtcaNqQrdf/UDmGfWJf43ebNATU+E+Yc5MbqIQ1+9A6LESC5WaHenaMn/r+N09I4IGjn6H3/lQMmfewyscFShTP+x/j/NI93j+P+6u9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfcHGj+yuIMpwFt7OBsOIn28TIPZZfNs/lEWos5XC+4=;
 b=jL3rb5v73lFY3iUq2FPBvfAYOZtoibf8qT3NJNpzdDui8m+H/cU4ravUl5ecEtvwZImAQzLgNOmXQ68wDfkR5p8eAQp5QZOJWFXA2m6/sbxmzYeiiF2XTEZfYnr4P8DcAHfQCdbj1sc4LSYLQfirSU5LQ6i9MW+J1r/rz/eg5v0SmfHwulln1xqg0U2yieNl8PnKK0KMuH57yngz6JytgOdDoilFSCbC+P/lMqT2XW87G+86O+j1/TB1rt4Cec1sjlrO5cfWpNN3sjcVQCsma/wQlLlpWGU4lFvAWwi8FGSJIGFfPmbzAevQ80lg1IeeF2TN9cgb7ZcHbSHw6t7fyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfcHGj+yuIMpwFt7OBsOIn28TIPZZfNs/lEWos5XC+4=;
 b=hAk7Ra8zb/cEcqCNu01J5kJ1m9NhdqxnYlXKlWd7/dDRAjcAq/dQzdbbJjgUgvdKnKRmox0hz0IRFeaV5FnD021iwgckN4hb0iRzeUr0HcVRgSSa/NoffxImm0VrZyUW8lub2cpueFD0twFDQ6KTJd6CBrvTCcWTGv0mPNeGH0EzQrVCp64aj7cwn1Va+x5Is2Npy6Y0BfqtwDUnJIgojBLYsLK9LWfJLcnbwlj9iyCfrwgpW7ktt/tXZ6pMvVZGtLaVndv19SPj1Dk+zpR4HG9jbCgdAOkP6UmYT+I496nVprj1D/Bb7zwCV2/7170vHgjzzgr67vOf34h3r56AdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM6PR04MB11265.eurprd04.prod.outlook.com (2603:10a6:20b:6d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 03:12:05 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 03:12:05 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	benjamin.gaignard@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	ulf.hansson@linaro.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	m.felsch@pengutronix.de,
	fra.schnyder@gmail.com,
	linux-imx@nxp.com,
	l.stach@pengutronix.de,
	Frank.li@nxp.com,
	peng.fan@nxp.com,
	eagle.zhou@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4] media: verisilicon: Fix kernel panic due to __initconst misuse
Date: Fri,  6 Mar 2026 11:10:57 +0800
Message-ID: <20260306031059.801-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::15) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM6PR04MB11265:EE_
X-MS-Office365-Filtering-Correlation-Id: 506a432e-52ca-48e8-12a8-08de7b2e24da
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: 0Yxxp+K5tckx8+e64dNwZ+m4twNe6xSFo8VyQ7YIzXO9A7KabOZ516ay+XDOlsaz7W69oO2ldekZXwQLxAmJ/vZEyIBa4VnEOuos/kPr3PxA2b7tIY+tXea3pMFkcXRG9FoDwhmLvid7j3UjsdYkTGD3/Zyqar8SZ5sKR+Nt9iYvswP6URwG8397MQi8d0G1Jaqrl5U7AHXGPEQM0gKI52Bep+GUhy57gM6vc4QTD4BEnpUqtBP2YUEpNe2/xvToXWDblPuGzgJ7RbO+yNg+PI84DmAiwhuHzj+Y9MzuEn/r5TSSnkunggRV3u+gYyTMy9qEhmFmOWwkmgJfUt7wtDS4y7Ntk6hw1UsyOgcyLYtE//oB/A10UTKsvuokCsQZNF8JCYab9qIJlTnu9NV+fCeG9MLj5BVGLeXIJyhkTh4y6PFmtZmFa/R7IYCetJjNEvMqWo2l81vBm6MXu63kLU6H23QyQSO27EgG7DUDtw2+s3S2woVgX3ReBX9BW5nJGG8kPuqerF1jlOecP2FAZKodci6ti2kuaqoc/wi39o/PlrQj/MRujYykE5/6BPtVJuacLbmjiwh6jhR8HpgaMhABDBdWQTQplfRG3yXdXwGuI+/Bi+z3AfVaiplOBAUG1JwWxQv2eMLWvP6nsX7V/JA0tdbLsnO2oEYPLOf65teKvYbcZtY7B9JFggEU17F9j1WjdCEunEhjuGRbdQsGSm01NDdyqs02R9nrt5CKOj7ZRy65SSO/JHVHSiHfZV4cdcrMVM56rFWJc4GvP7xgD6MuHmwiAR3XSZz0PZoTFCpJaENSlsnsQ/+AjEnZXTyU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bU3FjKxUE+e6P2R0KVHWOeguk/6DnCS+rf69O6OaABNskvKRs/NawLO4Kzyo?=
 =?us-ascii?Q?m+Fxssp4WL4nesn6v59Vv8+2ebXGjLUd+VHkQzCi5ilLoVfTuoWimyZBVAHL?=
 =?us-ascii?Q?IJ1wl0R7VLXeDHC7/vSj9etLN7NfurH4qRi4VHP5lRA7PY7pMF4ZpjjefWw2?=
 =?us-ascii?Q?zO9EdZq/mfpbZXXdn4WYugopfWrQCcBgHPhr03WqT0MHPDfMpvdPyEf//lzn?=
 =?us-ascii?Q?id5LB+WMyj2llLvI44tn19LvifhzHA4ke4nBqlbtMmR3z9S/fDtIEbjmbktH?=
 =?us-ascii?Q?e4C3DxZIGCWHmTSmsmgrS14LLlb5AnbY4AtARsatHMoM/shf28UIIcSXgXb8?=
 =?us-ascii?Q?CaowS5tDmraRYXGqfrPP4Vn0dwjFMUfHt0Aq3of4WHikzfmXo86Z0Hzf3vmk?=
 =?us-ascii?Q?XCB4oHWoq00i8bjTNwKX8wFRjwdi6a2nY13WX8ElnHNOcZr6g7vFHkmjU3qT?=
 =?us-ascii?Q?kgDPKgLsX0K04Pc15X7CGvlZM/Fiu+zGC+Y7uOdmlJK+eErX+F3zwULnrZPm?=
 =?us-ascii?Q?qbDyRqLM0vMY47eBHkSYaOGJxqwkDNdRv+kpxZWf3afRVp4Drh2CK9i7KoAN?=
 =?us-ascii?Q?fZS6saIk7RJCetmExpq4SahVz7n569fqOdN4EQqtgTLjwkCGWGxl0VS0CwI+?=
 =?us-ascii?Q?1yUHTJwbEmNlfyruhdX8+Yk3OPvRE3WKfx19+IfevaTY66ysbhlRpnmMgvGv?=
 =?us-ascii?Q?/lpaQq2JysGLcOx/+3kfbhWvXJp30glObNpt55lJXZBIFTps1IdPlUyD6fTZ?=
 =?us-ascii?Q?WvdqrL2K1DaY2MRQV23Bi79wa/J+ht2SEM61vD8V3ZwuC1izpODyJ5/9J+qE?=
 =?us-ascii?Q?5AcaPV5Bjko4FjyOfcLDE9UgOyigpB77SayFg1rBT0wZ0or+maZ/Tom1m/WF?=
 =?us-ascii?Q?k9F/3HufPy+o+1Kwab5BYb9a0XcpZC5FQOjKoJ7vCZ/K3SKnYX0oZFG0eKzj?=
 =?us-ascii?Q?wA2Z/Er3ZGNgX9avR9p7h1jyVGFelK8weBDumQ653UVfZrgi1iu782u9A8pA?=
 =?us-ascii?Q?3OexuduhakrnPhScgByJ+LsnavVBt7Pe6VGTh+vuSFC9NjzKlLQJEwd5DBFf?=
 =?us-ascii?Q?Uem8zszWwC0hrvhzErtMuE3TW3/1+vfxkNte2q3kl9tnUYmCb1pQOpG4JmuC?=
 =?us-ascii?Q?q3TAqcMzDy0dF2BPUYjYldildLJdufs8TNTHd8YnaH7cwSxq9lTZE9y/82ng?=
 =?us-ascii?Q?oUx4MWIEFGGIdWOqvWRKTJFxDlC69RTUvz1BOL5kzPBV5HzAzjNFHL0OguQ6?=
 =?us-ascii?Q?z7A9VmNcGcOri+zQtc0Spv0DviXnNBG/t3SI/9cpho8XaclyUO2yQ8WUwS7Y?=
 =?us-ascii?Q?2YcCwjExufjOEYFcrwdZx8gN4K2cIpqNVFXi191Yo+w52ATHXTNpaJiI+NGk?=
 =?us-ascii?Q?LnFk6bIOnSKRZbIUhnH5E5iy8OT+kTsULk4bUuWkEu1IUOaU74CVkJ4EhYOL?=
 =?us-ascii?Q?DinBWYtnPvRllZ3cnHjTFP5+0teR8jMSJ4GQeSzVoDxR0K0R8rG1Epduylih?=
 =?us-ascii?Q?YgZiWg5g6IuRylmdQq3rrCP/qhtK8nuD6kfbfQpNx5nDczBVTarUkBn3Ydvl?=
 =?us-ascii?Q?qpxTjDoHhJYwqE7ZRWi/n8v1OL/Gvf7zdrRJjb7IBhseOLijYU7T7xtLCi1M?=
 =?us-ascii?Q?uVYRq3USpP1IHqS+aeDzddzPnNwICg5Yk/7zVJND1trZN+XUxhvLnxHy5Nib?=
 =?us-ascii?Q?h2ugRvRIyo3EvcEIYAT2kpNKeheyqKqO9+J/0oyzKJgTApuNtVkw3FQPT57H?=
 =?us-ascii?Q?53s3h5cuQA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 506a432e-52ca-48e8-12a8-08de7b2e24da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 03:12:05.2873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZlHLVMt7v+buoOpRJCqZh1877iqh7glU9qSOTruTZ8ZSsR18tyNUi24m+JO91pyq1Zp0XcJ2vvNMvYNE6vgmcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB11265
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_191212_520297_066F1D42 
X-CRM114-Status: GOOD (  13.93  )
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

From: Ming Qian <ming.qian@oss.nxp.com>

Fix a kernel panic when probing the driver as a module:

  Unable to handle kernel paging request at virtual address
  ffffd9c18eb05000
  of_find_matching_node_and_match+0x5c/0x1a0
  hantro_probe+0x2f4/0x7d0 [hantro_vpu]

The imx8mq_vpu_shared_resources array is referenced by variant
structures through their shared_devices field. When built as a
module, __initconst causes this data to be freed after module
init, but it's later accessed during probe, causing a page fault.

The imx8mq_vpu_shared_resources is referenced from non-init code,
so keeping __initconst or __initconst_or_module here is wrong.

Drop the __initconst annotation and let it live in the normal .rodata
section.

A bug of __initconst called from regular non-init probe code
leading to bugs during probe deferrals or during unbind-bind cycles.

Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Closes: https://lore.kernel.org/all/68ef934f-baa0-4bf6-93d8-834bbc441e66@kernel.org/
Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/
Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v4
- Increase the diff context length to pass the checkpatch.pl.
- Discard irrelevant changes to sentinel

v3
- Add missing Reported-by and Suggested-by tag
- Add commas to pass checkpatch

v2
- Remove __initconst
- Add missing Reported-by tag
- Add missing Suggested-by tag
- Remove comments of sentinel to pass checkpatch.pl

 drivers/media/platform/verisilicon/imx8m_vpu_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
index 6f8e43b7f157..fa4224de4b99 100644
--- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
@@ -342,9 +342,9 @@ const struct hantro_variant imx8mq_vpu_variant = {
 	.reg_names = imx8mq_reg_names,
 	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
 };
 
-static const struct of_device_id imx8mq_vpu_shared_resources[] __initconst = {
+static const struct of_device_id imx8mq_vpu_shared_resources[] = {
 	{ .compatible = "nxp,imx8mq-vpu-g1", },
 	{ .compatible = "nxp,imx8mq-vpu-g2", },
 	{ /* sentinel */ }
 };

base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.52.0


