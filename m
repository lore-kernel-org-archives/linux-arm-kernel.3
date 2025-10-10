Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8306FCCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 03:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cF/M/By3EPWNwNhEHScIoq78l7NIEP24XnN8g2S56vI=; b=oXIAlhwVbzUt7aZrStzRxbcnWA
	/hWh6hRbBdNSvtBPfBFp7V7EUxIKjLQeqLG9fZnh1BbhcGxbeFmwTxcI4CIZ/AzhwAW7icMVTgSM6
	euMyBNMpdECc3CCVO/Ly3m947T61Tsc0n8xc60Dmz+GxCb3dBXJDinQ3eoniUc1yBo5vH/TN8z560
	C4XwUHVZzZY8D9HuJEPQm4R8dPpdqXaO0U1p6JJ0YzC5K4oIF2Nmvuc4//L1KLJJgqaNTuQmpXIOB
	zi3iUSz+hoX91iuo71gL85Y3T8QIDJ7PZBE1wJJI/WkPSmeiAClWz8hrTnS5Fg+XQ8FbHDG6yXZCN
	zBPur7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73sG-00000007aIQ-3ufa;
	Fri, 10 Oct 2025 03:32:56 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73rd-00000007ZE4-204C;
	Fri, 10 Oct 2025 03:32:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vN8Fssq8Y6o5MfXZAwKl1yiemOhS6X03BtUfhlB17aGFAOTVO+GCqhbq3AkzzfTh9pI4VxqvGiEJVvzgxgxC436FiAuPmG0cmUtKgF9AF7qNQ8hzyWGoyKar2t84HkYn5UGXAe3IIf9shbnBPOQPjistT6ASOrCMJ3lPCmHLmBeGVQfbXXdTosaHFktyYSx6VEDJ8j8emoB+wwzvteJIlpkk17PzW1j7OSkhPQ+cY+XwucqC8STvHEl4WOy+E5V6gX9IXUX3RO1V5kKAMIwEF+vhT259CR2F/q0KnB7KGzoi5UFeThS6mD9Oj1L7mQ4eICC/J5mmkRh0rPWl4yAPqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cF/M/By3EPWNwNhEHScIoq78l7NIEP24XnN8g2S56vI=;
 b=XO9hsih2EP0WmoMu3hBASdIm548sk25dKtGQMDup96efFVoRvFV0A5EhG5lPc+uw27TwYSjB+cf6WofuDpfA50rE7CDj6JhLeGguaWaWMGLaueI5HcqaFYFUWyqGW2h9w/ktFTVxR67kmTUSpuVvg6IanVlePJAWfurWH3pZdzrTeg7RJac8+W5GacATsKbCxc4q1IJC5Ja/EQ/GxnIvrUFRt0Nlan6YaJrD5f7lh6T8KGRQ8nYvdB+ZI6ewo19rivfH/L8MG+flYmsy7Zh4IUnGt8hwyyqWElrsqv7h6GcxYrW4AFmHXnrCopQ04BrYf51fM/Kct0kj606s3+rKqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cF/M/By3EPWNwNhEHScIoq78l7NIEP24XnN8g2S56vI=;
 b=bxhqfX+kFOpBCjVVgInfF8+XB58NCfHLq2a86tdmhXwaOafvWCiQwkiiEh+L56oMUgbISdVZyiOJfSHC3k996EXmy4bEaLw4uXdS3YGByw5TrfnoQuN+3AuEG/laK8814CWo9ufR4imfsiA6iJghVmQHStg3kzVDg0OTz2M19iNowX/iBbCgZhpJRBWQAQSDrWdJvJc2eckdf2SyQpWMlQHrpohdT6ODYeWB0uGao0GCtpODDyp/poCpXZVMO5V0Qx9q3yScCqRJ8wlP+ApgSAAqV5+LXBP2E2MFbTfpnrG+bEfuapgtTmFTemyhGLYxelvJYNS31M4CRnZQOMZ/6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DB9PR08MB8359.eurprd08.prod.outlook.com (2603:10a6:10:3d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 03:32:09 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 03:32:08 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v7 15/17] spi: airoha-snfi: en7523: workaround flash damaging if UART_TXD was short to GND
Date: Fri, 10 Oct 2025 06:31:34 +0300
Message-ID: <20251010033136.1475673-16-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010033136.1475673-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251010033136.1475673-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0035.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::28) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DB9PR08MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6d0c48-9d34-4bd6-d034-08de07ad9792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vZdHIdG28joXecdJZ5qEtfMrhijzjh3XZwYvIhSvrcX2yu9mA9SJnq2QH05S?=
 =?us-ascii?Q?8XvKX2yEc6nBsB3lGhajkJbRRnVngnuFqmgKkkTBbuLtbX4OUu6r1cy3ylDX?=
 =?us-ascii?Q?JKo1eEj8J2v48NKsxkRAhABD7+jLcfeoH7S4Dzj+pyCeZ3pTOZ9bzy2ISGSd?=
 =?us-ascii?Q?BVM00tmDH2Af0qdWGhk4EHtGMfm5dbB9AGGzwmzgOLvBWhuVEl1mB79JKYuO?=
 =?us-ascii?Q?iW+eZA8p8rA9WAA8PmIgx6NCRJBPbG60xInvryC45zXqyHd+j9AL3Vkp0qlD?=
 =?us-ascii?Q?ZdyBbO2AL+On6ObrKEjOt3STB0rPzqQn0Ve4iKUHOJJYTeeIeybCZ4OP1ywm?=
 =?us-ascii?Q?8v2xSRX+XxrDpEiaC7mKscuMs2LX4OzBR/hwVJqGWlvcNoEq2OQcP6xArGJ8?=
 =?us-ascii?Q?gbItK59LL+fo1TvaJgUXTBgjHoGCNJk5xHK5upZEZZYBK4qOzLmCkjlaHCBG?=
 =?us-ascii?Q?5U5hBHoKUQgaB6u02WTNHLozwAFIaC2Q9uF3ukulKpK8U02DLWEPjj1MZDjW?=
 =?us-ascii?Q?mpyxygG670IDF15pbPi5caUuQBXpOl9ucr7yMm40DEWspvU/8jYPIaKJYQq/?=
 =?us-ascii?Q?S/LasgCuLFqTsBSWTynZq9DVGC4thj1yaG9klRn4ZuKdZQtAZMNd6Zvcrb5A?=
 =?us-ascii?Q?sQotQH2wg1ggkWz4Xh90pjRms3YetaX1gHGwgws3Gz/eXzvlBQgkbzTFDwJr?=
 =?us-ascii?Q?EIEfRNcNC7utR8ygl61Bne/E4/JoqqLLRurpWDZr5RjOotX4eccx8etxmc2M?=
 =?us-ascii?Q?+FVXEo8RUFskU0Gtq1zwDwr76Sl9OCTpOhQs2woq8w4i+TgnCTum5o1Gta2F?=
 =?us-ascii?Q?c8HpZ+RlUtwetUOH1oOn2matkfdYuevvw41XYMhQLDwl4SjW0wDzgdFzeCSN?=
 =?us-ascii?Q?a2+xCklBhYLQQF6M9kJ8c7grt2OmyTmx2dF7BuqDbuVUV4N/kAU9jxMp6a5A?=
 =?us-ascii?Q?19XWfHeM686/eYGnz2VNpe1jH1dXMKiCyCgAlCD0b3bKGv8KUu1J0vE68yqb?=
 =?us-ascii?Q?Dgxp7Xa4zza4ncUPsqzo5zCoqyn3zwGNmQt6c/gcf04vQyZm5g0X2OmzfvoC?=
 =?us-ascii?Q?0Pr54q26AQDFi3cRyKa5CBH5jsUJxI3D3h3rUGNCkSMSZgfuka58l+HAdWBG?=
 =?us-ascii?Q?B7o1pRGrPa1oJlSM6CInPS0xdPOj/SvK9xC2d7mMlveCC7Yp8OshP+POWKCE?=
 =?us-ascii?Q?Xkat9LeMp94xsXKb+VHeulVk5QX5YT2Rxp8SfLtIuXWdjYp7H2AZR2gRAizE?=
 =?us-ascii?Q?ssPxAVRnZnTekRQ55xyi5upVaj1585Q7uaEfXbXim3bnIDq57Ck3Hoh699jO?=
 =?us-ascii?Q?tzibBEB3H9AOzZDB+sJLkYz47JaaZqa/Rdy2JFA3DVpAYgieYHnS3pJ2MC3F?=
 =?us-ascii?Q?0gbFavt0clrMrQRkE/LIuhjQCOUNprVnXYSCY0NBODJM+RTHF7kneHQj2OFi?=
 =?us-ascii?Q?CjRCxNjrJuHqSQLYSXkOAKlP1jSajBmH0++JcOz18NSO1629CYrSQV8yhSrB?=
 =?us-ascii?Q?QP23B/dhCAQdy/+cULq7LUdzolfpbggFaGwJ4nlCEdSZuh4znmNlReav8A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SpmlTL+EA1zo4ATTp0h3puV4QcUOslTDPjaMq77pD6xJdy0AammBv/RZojsa?=
 =?us-ascii?Q?s9qytw0lP2kjHKqJsXJOchauotoaL7g0ysx4b0Km49pugLcWmag9PyVPPC3g?=
 =?us-ascii?Q?H7/KDhdT2cs/Kd3WM7AYniQcPo5xJWrMXXlGrHV3f6yQWLC95cUMXrFh3trl?=
 =?us-ascii?Q?Ir6NlV0b3w8AMC5wlQwqN/3FSsW9T0Dtwr89zTNHMtUcdF81fv6U/t7m2noI?=
 =?us-ascii?Q?5O222NtUem+XFvSy6nNWuC3YD3CCME5Lihjgja6jXNEJPn34ReVjXDPGdDY/?=
 =?us-ascii?Q?/lT2rmsv2xnkmaFLcCGoZJW2hSBeAnoZidV7o/zdhHAMFmG3O3+uIpBntArU?=
 =?us-ascii?Q?FH2b+THXxsZbck2un4fGhjIbJTD9E/YYzVVMZYqdRUQRz55V7F4vQ24zBOtO?=
 =?us-ascii?Q?nczwN2RLnogUyLSicMf6urOrqO/9wLVO+ecAW3t9/CYZ4TPM8a9hQ+obb9ti?=
 =?us-ascii?Q?J9LIb1qfngM6TjRrIA3U6IAU4SjYD8Ww6sSb/GMIuiv6eGLKyaMqTEhv7dbr?=
 =?us-ascii?Q?/bNB2FeQrdqXV+qUtxjKCzVZLi40S5ocbYUnVYUkjUTfoImmpV8Z9d+QovOK?=
 =?us-ascii?Q?ag3dXYWkGZxySZ+3gskifXhiCnmaaQJWgVUsg0mJdHt37N19BWF99z8tnn5e?=
 =?us-ascii?Q?+RkN6V+MNYh0UDgmVryOvaXAJmzJ1rR0Cqy2E0As0sUdL9zqqt2c7zrnyiP+?=
 =?us-ascii?Q?6jt5s/f3WsajWWbd3r5iuTnvLzGU+r3UVZNiylfCt+c8zLvOLdr1RjLoFykS?=
 =?us-ascii?Q?UuY/1U0G6igFVIlgg14TYjMyMDfADKLssAS5cV+/0qGTT29c31iJOIxYs7kI?=
 =?us-ascii?Q?2F/DOA8wFx1c+wbwnmz+ew0fJntktViDblsmQufg9JmdxllbWCTP3AmRmLdM?=
 =?us-ascii?Q?eIwoekHcZ/a6okj13qq6N8qJCjdg6OM4BKpQtB8M8hZUoLdz685krOGTpyHs?=
 =?us-ascii?Q?31spNtVpGnA9zEWp6hOmC+3C1iHKGYEj6WPO1WgjPEEyYJ124SjwgdGZaukL?=
 =?us-ascii?Q?oBMpKLOoLUTkys61OyVK3X8kalW1z3V1XpE00Hl8swJaBgnewB8ebByyAdpc?=
 =?us-ascii?Q?Nhy45+zmEA/ppyDZ4kliL/NQv7UQnortYByy1wyjbFvkuuo/qGFtPXocDACW?=
 =?us-ascii?Q?5Onx2wCvUCEsHpx7D4PcUTKLQOv4iwHzsxOqCAIitbgeYIzlKQDNMcNs0/i6?=
 =?us-ascii?Q?QNTZ/Bw/DvlobfhiPFjGOEpyM0BrGeumOSlvl2rADSEuXERIFyEbAafibZ0v?=
 =?us-ascii?Q?My0/n6CNFw1L20gAZ2Eu5FmkEeD0ESgd0pR/WxGsNfHGOZpphrB5Qwg3KFyX?=
 =?us-ascii?Q?ACiBkO32hwEehoczp/LyfDiFWGWFCF9IDkyGmKQy3Ft/GjNzhzbkjQRUBbFG?=
 =?us-ascii?Q?LIAVvaksUaORVD7qZOFMHGaEZJ475z+ZO8eaSoURZZTNKWHyQfd9pXWVuQoJ?=
 =?us-ascii?Q?ibP7TAdO/KF5wVbEPFAsK8Ew0QBV318TX73AQkPko7IzoE+pWLB8Vb5/QwvI?=
 =?us-ascii?Q?jaGbAdjgJr6++GRAc1GUocftxLYzNkWW0sAjCKVFUameYQWrqZa7CHsa4pDW?=
 =?us-ascii?Q?qKepOviG1swkRTcfS97pRBHM6P9qncTZdYvQcxIYTGlJ3q9sOuD6JcZqpFTp?=
 =?us-ascii?Q?UJXmX+NGXV8chBZjdxu1pbg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6d0c48-9d34-4bd6-d034-08de07ad9792
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 03:32:08.8896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pbq/Rf/9rL+/ExA9h49IJEO+g0pT0Co+0zBC3acKUbEopuHyKXzSBXwnIzxJBf2tHIQx4EB7PVi3cx7gX0u3051+5GygTBzA73iGvnEed2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_203217_653753_22B10EEC 
X-CRM114-Status: GOOD (  16.86  )
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

We found that some serial console may pull TX line to GROUND during board
boot time. Airoha uses TX line as one of it's BOOT pins. This will lead
to booting in RESERVED boot mode.

It was found that some flashes operates incorrectly in RESERVED mode.
Micron and Skyhigh flashes are definitely affected by the issue,
Winbond flashes are NOT affected.

Details:
--------
DMA reading of odd pages on affected flashes operates incorrectly. Page
reading offset (start of the page) on hardware level is replaced by 0x10.
Thus results in incorrect data reading. Usage of UBI make things even
worse. Any attempt to access UBI leads to ubi damaging. As result OS loading
becomes impossible.

Non-DMA reading is OK.

This patch detects booting in reserved mode, turn off DMA and print big
fat warning.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 38 ++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 058e08811210..0f4e4779ec35 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -1013,6 +1013,11 @@ static const struct spi_controller_mem_ops airoha_snand_mem_ops = {
 	.dirmap_write = airoha_snand_dirmap_write,
 };
 
+static const struct spi_controller_mem_ops airoha_snand_nodma_mem_ops = {
+	.supports_op = airoha_snand_supports_op,
+	.exec_op = airoha_snand_exec_op,
+};
+
 static int airoha_snand_setup(struct spi_device *spi)
 {
 	struct airoha_snand_ctrl *as_ctrl;
@@ -1059,7 +1064,10 @@ static int airoha_snand_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct spi_controller *ctrl;
 	void __iomem *base;
-	int err;
+	int err, dma_enabled;
+#if defined(CONFIG_ARM)
+	u32 sfc_strap;
+#endif
 
 	ctrl = devm_spi_alloc_host(dev, sizeof(*as_ctrl));
 	if (!ctrl)
@@ -1093,12 +1101,36 @@ static int airoha_snand_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(as_ctrl->spi_clk),
 				     "unable to get spi clk\n");
 
-	err = dma_set_mask(as_ctrl->dev, DMA_BIT_MASK(32));
+	dma_enabled = 1;
+#if defined(CONFIG_ARM)
+	err = regmap_read(as_ctrl->regmap_ctrl,
+			  REG_SPI_CTRL_SFC_STRAP, &sfc_strap);
 	if (err)
 		return err;
 
+	if (!(sfc_strap & 0x04)) {
+		dma_enabled = 0;
+		printk(KERN_WARNING "\n"
+			"=== WARNING ======================================================\n"
+			"Detected booting in RESERVED mode (UART_TXD was short to GND).\n"
+			"This mode is known for incorrect DMA reading of some flashes.\n"
+			"Usage of DMA for flash operations will be disabled to prevent data\n"
+			"damage. Unplug your serial console and power cycle the board\n"
+			"to boot with full performance.\n"
+			"==================================================================\n\n");
+	}
+#endif
+
+	if (dma_enabled) {
+		err = dma_set_mask(as_ctrl->dev, DMA_BIT_MASK(32));
+		if (err)
+			return err;
+	}
+
 	ctrl->num_chipselect = 2;
-	ctrl->mem_ops = &airoha_snand_mem_ops;
+	ctrl->mem_ops = dma_enabled ?
+				&airoha_snand_mem_ops :
+				&airoha_snand_nodma_mem_ops;
 	ctrl->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctrl->mode_bits = SPI_RX_DUAL;
 	ctrl->setup = airoha_snand_setup;
-- 
2.51.0


