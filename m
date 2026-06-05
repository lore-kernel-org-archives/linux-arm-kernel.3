Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B78CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 11:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQpf7iyjqt2wePQde6bl6iTckT2POFL+oaEgHD0Yov8=; b=hBy/WnBuZ6rsl87qK9zjbUD++E
	tRB7XtOtkv25cYdYXRoeDZf5EMd0q+oP8LmwgVrCmDmfjTcUDEPXXgOUIeghhZOa+H9L2TzI4yhaV
	zTtXLx70chDQpcp1dqZPOZG86pT5nBbYXcpN+iCc2pXcSSZkjnQTEi++xQYV3tc/Wa5fTY5z/RnHh
	6Xt5Fq9yY8JFdap0mf5V9MsTu5LPQF8bj0sT7IQJuD4ltmOXHt6kUW2vNv7mq2zxCEvQMif/1T3/y
	oRKu5aVrF/ncbEbOfayLyaspGWTvykYFEmxye5Sz99GauPWo8GR2vBMnrF+f/C6TLxZjj+pGGzGd+
	S9XREl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSRX-00000000WI6-1zcm;
	Fri, 05 Jun 2026 11:10:27 +0000
Received: from mail-francesouthazon11011018.outbound.protection.outlook.com ([40.107.130.18] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSRU-00000000WDg-3NVR;
	Fri, 05 Jun 2026 11:10:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Job+hZ8dXRwx151SeAp8JPZCMSAot5dC9pAqVR50yC94BfqYCu5Ixb49+RAABJaCBLf9w+3WhRawlxcVlKG9WOw2+D7Lc91nFNOPJObOPtyFGUPl+VbjRa9vNqE0jviaQLAxTFFgNNB04DC1qpmo9xdZ5ttODUp2JfKoWZgs5CsTNcDye2nZkmxKoh6CW9fwWnl9rfOjaDCM60ghfvWrFEAGPSHqGZ/26wJGQ0ewgvKYmMShJSygNM2MYTykaqmc9S9ZCKIsjhM0z0AfUntGB8zDnEZIz9MYWBKIv13c7IdudlOJb5owSEL+qQVWYoGvSQdLQlS4lqWsFO84NjJcXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQpf7iyjqt2wePQde6bl6iTckT2POFL+oaEgHD0Yov8=;
 b=rjdEQg3cpOzANx3ScNHKhxdrLmdpbbkaSojUZO18E78lW2D2ffwSOXootX2jBlyjcUFzuiPe7TT1hAkS4YEQOoWCk2hpZVq/O53e+D6Mga0d5ve8cFeYwt3SpcQG7Pg2otzAseRJFF/9reICFccb5hSj2kEHan2wyyzDbpoHaoe2RV2XdrBRZOdkLX0s9RRfbgshVf5SQi5+Sf0Jl7JNa86ib0rq/eu550m0g/oP905a0WLI8hg/ppPToELTIY2Xrph/z7qkr2cdFZA+WE5g2LMdfKo2nvx7DVJezth0SRAJivKN4040MY5venPGTC17knQ9uBf/LK9mcT6n+Y7HEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQpf7iyjqt2wePQde6bl6iTckT2POFL+oaEgHD0Yov8=;
 b=HZJ1AbFmbkuQaiHCcWTL1/4jaf9TJKe0gXlXX+Iz0lb5r4UlKYq+/i18IFcRBxx1C4Be877lZvLVERobLUDwTzCtuAhwmV5fkzYV00ea0z7dlAdmg83Ha+vXmK+ABPcNQW8YeO+niiG1UABWAFNEGEH1Myu0wEQA4PTuPYArMR8rKPr30yvv32rPkJrZemQGsDowNgMQriK2I2sSK/hxrIJGu5HTtDpdAJYCg3vkbagzLq5ObjvPgRdqRDKAkkcmm4usX/Ay1snQjIFd4V0/jcB5RP/CcA1zumYJXdUkm7wDBYveNZRd+7CjhHozqKkcS6CjVQrdTdjxpF78EK0k0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DUYPR04MB12689.eurprd04.prod.outlook.com (2603:10a6:10:661::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 11:10:22 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 11:10:22 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Fri, 05 Jun 2026 19:13:05 +0800
Subject: [PATCH v4 4/5] phy: fsl-imx8mq-usb: add control register regmap
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-imx8mp-usb-phy-improvement-v4-4-b2ddf2f3862c@nxp.com>
References: <20260605-imx8mp-usb-phy-improvement-v4-0-b2ddf2f3862c@nxp.com>
In-Reply-To: <20260605-imx8mp-usb-phy-improvement-v4-0-b2ddf2f3862c@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780657990; l=3168;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=KlXGVKyWOEMvNOggMMdl/AKEMbfiijxvjn/gd+BQ98E=;
 b=x6lZfi4bDAtpwMox2ulC9wbZ4726yZFAL7JpC8E2/6UsnywdhoaOUPcAGU3U4tnEle/VnhGOB
 ZiP71xYtNwzAYNFP1THc5Lt4t3mSOfjD5B6L4/IbdK7f/nXlHkrP3Bp
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DUYPR04MB12689:EE_
X-MS-Office365-Filtering-Correlation-Id: 797133ec-a80a-4b56-f64e-08dec2f3091d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6eA5N/9bC/J7RXXNDiWugMtL5u5PZB9JNi6TKBu4nyiZRBChje7rOduo9LisNj2+/+jySYVExVJBgx6bQjrQGpO7N/GqnjB4kSBeqbH0KnRFpzRn1LXPgu4lcXV/bl4EXMq+zWJTA9R/P834iAIhnyIN0FRujuKjiQnhhu7svMaLpIA9P+71PNv24hg/kmUdmsHCiSv/ss83cna8NEhz0HaCx9Hm2IXS8PU7JWcYTKMWSfeKDQZZI7M5TUkmhgndcXcpFgSFtvXbn78233n5PC2SNj8P0a8EDpo9mkjZ+yebzBdhoHb+LYojiKUTK9r4ZPWRA+iZm+BsNxgqduZRiCDObQ3kCYTP0QaOqTp3hPXtxR6pMsj70wOkBFwHai/v/nWQHX8bDiDIeKh9RX8kf5zO9DaRbNtyB4sq/tUmNgGHysJkHbaOyl4m7dcW37w7ftRSRLwrBj5vgIxT7rahsmku+WemRxgaqKX1pRqR9Ix0YowGhiUSg3fzia26NYxLwyjP3TFNQDMBbWsvgwABV2GXu9aSRblElMCfOgStE6/u4Oc4f3G353p7A5bNZ/XB9q3+a5erKTcleoS81MasuSt4LjAHlKMnnX1Z9HpOVlKmVUV5DK19TDeA+5jrOQazkEhSLiUrOigd+zsm0xv/hacHG2DA/WJQtq/yFx6LtwUcFnB08j8K/3t5nXK1KhAF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUVZcTcwTzZodXZuK2Q5ckRJZmZWR0dWSGYrQU53QW5Nc1Z1RGFuVVN3ejRC?=
 =?utf-8?B?R3cwNEF2cjB0Zngrck82K2hFeGxtS0t3UUpxVUpwWDRVVXpuWnFCdmpYajBE?=
 =?utf-8?B?MnJtRnJ0MUR5V0R1SEFrZkprZnFKUGovNmtybkpvWG02NHJDVzVkS0szZTA3?=
 =?utf-8?B?ZmJkRFV2R3dBOTNRc2F1MW5CVVJPQlVZbkRHK1YrcnB5M3phTUZteHlQZE0w?=
 =?utf-8?B?Rkl4ZUUrOWQyYkFUL0lDc0dVaW1RTjN2US9Sc3BTUUJvVmJBN2JjQ3liTWNH?=
 =?utf-8?B?VE1JOFk0MFQ2M0VuMGRkWTNXZ0RFNm01M3pCZStFcXpPV1BYR2N6emVhOHVJ?=
 =?utf-8?B?MktCWjFDVFZHdkF0N0lLR20wSUp4Q3hueDB6SDRKVXBXZ2FyOHdqNFUweG5J?=
 =?utf-8?B?cXRTV1QxNW9BanhmY2ZibUkxTmlqUUhqL2taZ2Z4Mmw5Z3ZGOGlqZVlwZGZ1?=
 =?utf-8?B?KzA0WTFyclg3OVNpNXFUaVcvbmJYc1czR2lQcndCSFl2emVoajdGak5uRWcw?=
 =?utf-8?B?b0phM3I0c1IyRnhHM08xRHBWczAxMTVlWTdraEF2bXJLc3Qwcjg0TXFrY0xn?=
 =?utf-8?B?TGQ0RGhEN2lmaXNodGg0UEMrZDdNd0VXVzB3QlpCN0pzMkZ2L2trWDl5Rmo1?=
 =?utf-8?B?Z3RqYTJJNyt6dW9xK092K0xDRExXZ3VnQjhJczZwQ3RXeEJRS0k4REdVek9Q?=
 =?utf-8?B?K0c0NnpyaU1mZXJHRWQ3TnVFeWErNFBTZE13YVZBemRnOTNRcGV4MGtvVFI0?=
 =?utf-8?B?eFdCZnhDaEdhNHFqQkZ3Ty9iZ0tkTlprL0F2N1ZXeVh3MHdoQXgzU2FrZmh4?=
 =?utf-8?B?dENNQ0d0SXMxUGtRaHhKaGdXeElLb0tpb2FwN0dwaG9OR0hvNm5INFU1d1Bn?=
 =?utf-8?B?UVhaUDFNWlMwaTBraS8ra0FqeW51VzgzbDBLUWxpd0tBcmphcktWczJiZGIy?=
 =?utf-8?B?eWlPNTRXK2tZWHdzNmR4c01MajFCMzdWZXozU1g1VkxRck9kaG51QjBWaCtF?=
 =?utf-8?B?clV6NHd4QmtTN1BnM01ySEZmMHlZR3hLc3pzMS9sNVlmTE11ZUs0TXV1ZWpJ?=
 =?utf-8?B?T3NQOUFjS1l4V3dYVkJpYUhHSTNqTTk3S01iWDB2ZTRKYWF4L3pPUk1UV3Vr?=
 =?utf-8?B?QWlYekhwaTVtUE9hUmordlo5YURhZGYyTGpVVytVLzd0N1VTYmg2WGtRZDNI?=
 =?utf-8?B?MGVSUG5sdVVYK2FYMGJsMG5PRXdKRlBMZkU5a3lTVmZ4NkR1U1pOc0FtNFRQ?=
 =?utf-8?B?Mnk1V2FWREdPb2tkS0NoU3hocXFjRkRYcjlnbFA2L0YxbEc0ajNxeEJKL2g0?=
 =?utf-8?B?WmU4NGFuaVlBdkJMUndrUzZsZzlOWis4Z1pNR1lscEYyNkNYNWpjazZnVStn?=
 =?utf-8?B?dGYyZENoaWtScFRMRDdlZVhiTzRIM2hFd0YzSVlOaE1lbGNLeGovdjA0UFZO?=
 =?utf-8?B?OS9aVUpUdTJyWXlCTnFnbVJzbjQ5dE1VTm9ETnVVNTBTRm9nOVRxVHU3MmZj?=
 =?utf-8?B?R1RxUWliZXhucWZoazhYNnBUcVI1emtTZi91Tnp3a1hjdUdaTjFVVThGclVJ?=
 =?utf-8?B?YmExWm9rRnVweldyUGVVNHJQMmN5MXBGb1lTUWFJTkNZVW9lYkt4cFJuL2Ja?=
 =?utf-8?B?akpCOGljdXFRTDhid0Y1ckRvWmpGN3h4cHR4dEpSSXpPRUZnOVdPSXBoL1h4?=
 =?utf-8?B?d1J1VFRGTkF0cS94cTUrVjVBT2pxd3BaUmFpckRhU2FNTXZEVmo5c092UUh4?=
 =?utf-8?B?ZnNBTElrVnNUVHpCY01HY0JSajUyVWIzZVNVZG53RFJnQ2RGUG9FTnNxK3l1?=
 =?utf-8?B?VWJiL3M4Sk9vWldQem5CajdRdW9MQkZwUG9TWnpVZEY5QUxaYnh1VUdkWVlV?=
 =?utf-8?B?a3UyUCtRUjdyUFJ5WklkQ3E5c0VEVGsvRm0reWVDZHVRcTg3MTl2RnEwajhj?=
 =?utf-8?B?N2VqSHdjdFEyWmZQUmJjOFUzbUpZbkdqUzd4bmtxN0RmdzUydS9SOUduZ0Zs?=
 =?utf-8?B?SnpxdGtMKzJsVEdqV0xydG84NGx0QW11QXB2WEZxTE5ISTdHTnJsbHhENFls?=
 =?utf-8?B?dWYwZjFiOUIrRnlhcUdEOVZEeEdnWnJwNVhKVWVjTFNjclVpYWJhc3pkVE00?=
 =?utf-8?B?Q0YrSjByVVJQVHQ2U3gwKzVTTVFzWXN0My9Yb2xkVmtzNEx1K0hQWmtZN3V2?=
 =?utf-8?B?bkUza25SdGpUUjRrNko3R0o3UXRqV0UxM215SGRhV0pFWWk0N3ArdlE5K2Vj?=
 =?utf-8?B?MERQTnBHLzQwOGpzcFZPY2tpcGRuYW1UTjNuZHR2Ylp5bTVvZXAxbWl3Qmdr?=
 =?utf-8?B?L0hoTXE3VUV4Q1NXQUZUeWpwRXB2anpvNkdKS2RHcTF4S2R3QnZJUEw5NWRu?=
 =?utf-8?Q?S0gpmVpiGhV3yrjfigCzb2aE7my5la2SGIVfm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 797133ec-a80a-4b56-f64e-08dec2f3091d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 11:10:22.1405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5lp1wyL0zaSYFguk7vc2Ag9J95nlU9Ka4TYwafakIbZCh3kkWsCk//uVa+7eSj7twSTkk9VXsgcgDqcCnVyk+GcrYjNqkE/seN/WWPkh8lhVCtnDwjGRZAUAulrdpxi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR04MB12689
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_041024_860250_CF825C95 
X-CRM114-Status: GOOD (  17.37  )
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

From: Xu Yang <xu.yang_2@nxp.com>

The CR port is a simple 16-bit data/address parallel port that is
accessed through 32-bit MMIO registers for on-chip access to the
control registers inside the USB 3.0 femtoPHY. Add control register
regmap and export these registers by debugfs to help PHY's diagnostic.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - improve commit message as Haibo's suggestion
Changes in v3:
 - drop Frank's tag because it includes other changes
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 27aa696f5dd4..e24f46d7924b 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
-/* Copyright (c) 2017 NXP. */
+/* Copyright 2017-2026 NXP. */
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/regmap.h>
 #include <linux/usb/typec_mux.h>
 
 #define PHY_CTRL0			0x0
@@ -56,6 +57,8 @@
 #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
 #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
 
+#define PHY_CRCTL			0x30
+
 #define PHY_TUNE_DEFAULT		0xffffffff
 
 #define TCA_CLK_RST			0x00
@@ -119,6 +122,7 @@ struct imx8mq_usb_phy {
 	void __iomem *base;
 	struct regulator *vbus;
 	struct tca_blk *tca;
+	struct regmap *cr_regmap;
 	u32 pcs_tx_swing_full;
 	u32 pcs_tx_deemph_3p5db;
 	u32 tx_vref_tune;
@@ -667,6 +671,14 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
 
+static const struct regmap_config imx_cr_regmap_config = {
+	.name = "cr",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x7,
+};
+
 static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
@@ -696,6 +708,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
 
+	imx_phy->cr_regmap = devm_regmap_init_mmio(dev, imx_phy->base + PHY_CRCTL,
+						   &imx_cr_regmap_config);
+	if (IS_ERR(imx_phy->cr_regmap)) {
+		dev_warn(dev, "Fail to init debug register regmap\n");
+		imx_phy->cr_regmap = NULL;
+	}
+
 	ret = devm_pm_runtime_set_active_enabled(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
@@ -731,6 +750,9 @@ static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
 {
 	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
 
+	if (imx_phy->cr_regmap)
+		regcache_cache_only(imx_phy->cr_regmap, true);
+
 	clk_disable_unprepare(imx_phy->alt_clk);
 	clk_disable_unprepare(imx_phy->clk);
 
@@ -752,6 +774,9 @@ static int imx8mq_usb_phy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	if (imx_phy->cr_regmap)
+		regcache_cache_only(imx_phy->cr_regmap, false);
+
 	return 0;
 }
 

-- 
2.34.1


