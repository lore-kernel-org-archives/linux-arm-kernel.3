Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3F8FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 02:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJ0nuoIP6+q1zpHqviXArpNnedMN/7Gd1F+BYpJavnw=; b=BRg2JgmtczaZyAHAqzEfOs0x+Y
	+kZ2zAqzxJo4zsFcaZAdN7d/w0wZRRfGnQEzJIpM0UJQBu0NBMRwDoxxgijePC7axtD+qw5SLSCW0
	9yBUsIw1nP74Gq4s66HhRvmkHsn28VVB4v+vPp1Ke8nyXk1n/McDv9Rm9qlkkShQx3gOVyrbKcRiI
	GKDM748PCSoXlCT49Mm5zYZYE8rsyjbt1F1666mi/XMMV45wXkqRP4iUcsixuTmI2dpCPXjD9+i7P
	DbpjRnsG3xrw3pu9rgqG/kv/47h6hYb69uuxrzF7gGJroweOM5J7KP+aqDF0pgqVLY+YGRmtA5IIZ
	nz/Tb+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBsZ-0000000G3lV-2rIC;
	Mon, 27 Apr 2026 02:39:23 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBsV-0000000G3kG-0HZz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 02:39:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPzBYSfkUDCKYPNRvIPp9c1CVAjfUA3lAokp4ILX8x7Rmb3+VNQT1NwSOSQmm9uX7zx4vRoc+pfabNK/sifqMpHDumi+Ir3W4BoLXpgQZ317j4BtPaAjvG9Sd1zZKF3vpXtws9rpLp9N1HbI9c1D+uJJI7mAVDqjXijl6dd7QxBJ9+OPQNDI+kNrUSkqQGilqj5bOuamJoQDP9mp68XbCODvmFcyrLhZ/c6gh/aIQP1LjTXGJ69co1eZzx0TJsXQrm28ZlPkIeGGdZ8jIS99ywTlnJUEDlKfJv+j5uQTTZNcjRIKOxL8WPFxX2+xzEtejjqApmr18AF730HyZSA3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ0nuoIP6+q1zpHqviXArpNnedMN/7Gd1F+BYpJavnw=;
 b=cTUaSYphvpL5lJTbjcn7qo9NK8fke0G8oW43whiKWb09AZE8RVHCLody/j+TmI19XxK27f9138G/xas8I271KQ18i9DeKGnKFqpAhELX85LdZwJ7WdevNRikkYgZVu2NdPap85rdSWGLoAsX/2Lj86WGfeJSdRnQoeEGfeRKEeXoyhLvSdMsvFVdU+LpW6JMIbPvus0fB2rFOoOHxZ3zZqHMvVSEqkIEpoS4uRrC2UyoN1L2Z0Ijl6FZFtx7MrGl7cveD0x1HRj1mglWBGPngxLgd5Msm4eAetByIwTXhYfL0ZhhLYOZToiMo2/7LW5Q9ZFDI/r4TVtKU7iFB/gT2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ0nuoIP6+q1zpHqviXArpNnedMN/7Gd1F+BYpJavnw=;
 b=gXGTMOQChQgY/FDjVQFcRg1qGNKB8FcM9C5gAqcyMJ0Q1GVfPcnfoCX7Dg2bKqrm2RHeM6p4o77UYccwx8+aDfvwxMQlLDkHIxVk8SykI3IsX1kksOzJsTm0hi1bOm3g9TFORAP2FkMwUClHtt6R3BufM+Of/EHZawnGngl+LzSHnpmU5gMZoB37dQuNhqtRtZaZPOWSaiAXzPIngg50lbu5dzgtgybxDmk6GDSj0M4HmgFP8gfMLwOWwe4ioSNreuj680vhfvsPIZdJxK5RooMovZ8cGipD8XxVZ+uZt8bW/yAtY+VkAjR9X8zpIiMWjU6uMAmNo5n4pa3riUdDZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10793.eurprd04.prod.outlook.com (2603:10a6:102:485::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 02:39:17 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 02:39:17 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 27 Apr 2026 10:41:24 +0800
Subject: [PATCH v4 1/3] dt-bindings: remoteproc: imx-rproc: Support i.MX94
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-imx943-rproc-v4-1-68d7c7253acd@nxp.com>
References: <20260427-imx943-rproc-v4-0-68d7c7253acd@nxp.com>
In-Reply-To: <20260427-imx943-rproc-v4-0-68d7c7253acd@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MAXP287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10793:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ed01e4-ebf6-4612-a622-08dea4062d48
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 3D3NuQ6Q6tC93D/xoWjA/gL2Xv5Lluto74fSQmBjetr49eNSotMZo7+RDTn0RvnjNlrol2+4R7oGd1v50YYnmWXr8q82hzMVl/4YkQMaB1EITT5XtQc6KunUwRdyzTqh1PyGiKK0RxY8MhQSXGnPVwOO2CTkL+ryBho2dHeCdzQPYywMw1sm2we5HdGibdebvPpy+aN2LQQdBCO2rLBKnCFzfo/wImBEbv5nfUf6l0Krv057jlAZaOQFmqHVUBzhPEIUYr08vnEHjUgDWFFjYxM6Q8sPtW5wMXXNB4o++z7KeHBqRF4pohLKKIJkMj74JIJ7I5Uuo2jsaZZwpivfl4cY5TnGPRryE+6VOuF8F1Xzf5JAnyPTS0wHkTcGdVTPfDZujLytICKxNW724kWRZntIu6shBkfSo/u60aVUg+mUcOGbP0oqRuWWtGx5mJ4ZawwDL1HTRJsr1yMuAgIC/UOrFyI0cgH7mFdkUU42IMyutCf/cOsVC9CxnGSSFl4E1gLz0C9s9u+7esw0TlnhxLcK6rB/5LA9Dz7VJ4+64P340oG3Baij86OnAt+4EpkBmnxlNTG6Ey8acCZXE6dj0qqy99A9tZUdYwuzQF0gwjllceGfth0ColDhuvRVYe/APKmtPoq+yLjik1IU+H7l3JTYZKblmTZN07BCuxzEBlh4NAZTqjM9X7Wjsnop7/ulUUVPra2kY6nKc9bTMgbUvBQD7+cVLZnL6AS59+QiSk6wr7NTgTYi3KYBj+iawtrOOpOe3x5eejHdQr+05bShC6dmyXx1tdElx0b4uwSw8sboN4FbVRzdw8l/dSGYEBFu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHcxLzNQQk9ZQWNNS0RCQVNVOUJYYkVVVmxheUpJd1FzbTFvS0U5cmNLbGtx?=
 =?utf-8?B?anpoT1g1L0ROOFl5Y1A4d2ZDUFJMRFJpQUtIRldUaVBneGZ3Mml1cHAyRlNk?=
 =?utf-8?B?dUlnbEdGU3I2K1EyYkpwbjY3MU1XU01IK2cyYkNQRnNsS0FxbGk2bFNwdVNa?=
 =?utf-8?B?VjVRNmFaVThXaXl6T0M5UFJmaGxaeDllWDF1REJCcExKNmY2enEwQnRFbGsv?=
 =?utf-8?B?ZGIydjlqbVhxdUhES1d3Z0FFV212cHpzeXllZ05tNG1GRVkwc0xHblZmZ0tR?=
 =?utf-8?B?bnd0cTFuWTFwbkg1d1AxZTNHQ1lXNlJFNWNXLzNmNG9rYVRmNU02NC8xbno4?=
 =?utf-8?B?dEN1aHQxSDR6dVhUdVdmNng3dzloN0RsSThKWHg1TnJCMkVnYm4wdFRMZlB1?=
 =?utf-8?B?VGU3N0luTmRaVkpENlpzSVFTbERKeURzN3A1aFRVaFhwK2VwTzRlZkh0NGUx?=
 =?utf-8?B?UjRtVVFacVErVTBuWDE0M0hZMzNFV3dybXhERWRIVDlJdmVBbURYOGlhOEtR?=
 =?utf-8?B?Y0dVTGREeTRCeWRkNCs1TFRTM1ZkMTNzNkU4bzRqU3IwRmNxS2IvV0VXMUxa?=
 =?utf-8?B?dVZSdzRzYXlVWGtFOFNSOUt4OW9YRVlSMW1MdmxhTUV1SCtJVlBxM3pac1pl?=
 =?utf-8?B?TTdlNVArNUlLcWJOOEhHeEl6WGtFTEJiRVRIbUh6R29ueTNLZ05kbU1jRVR3?=
 =?utf-8?B?OVE3ZmY0aG5yUFVuUlJBY2M2Zlp5Z25tZkpyT3NXUGRZc0FHWEdPU1pMSXk2?=
 =?utf-8?B?Y3VYNjlPaFU1MzNvS3lQU1NBUFZKMmszdmJXMW4yQXN2RmhYbGZuRk9GQmlz?=
 =?utf-8?B?TjI5V054SEo0REYyclY2SXo5Z2dobEZ3ZnhiOStyM0FqV2hmaXJ2ajVYcTJi?=
 =?utf-8?B?eU1HRXAyUGplVzNUOHVpZ213QVpQZnBXQmZLZDF6SWpwcWxISm5TelMvdGM0?=
 =?utf-8?B?cEVsUXU2MFZHNDNKb24zV05MUU56dnZLUlNvUG5FTG9ya25XcVp3OXFOaW9T?=
 =?utf-8?B?NDd6WS9UVFhQT2FZOUVzT2JvM3JjM25ESEtNalkwaVVXV2tDOXpweVJuTVNz?=
 =?utf-8?B?Y2ZrV3cySFRaQVJiN0FmYTI0ODBxcTh2ZGtCQks1T3BhR3BTb09VV256ZXNy?=
 =?utf-8?B?djlLN2Y2bytoSTBMem9aWjRlZisxRnBkdUgxeUZVR0J5bDZBVGNObGFodGZL?=
 =?utf-8?B?VGxrMm15Ry95N1pwdGhIZ0YvTVdjeTNNZDdlQmVDYVJDT25XYjdyRWdxV2Zw?=
 =?utf-8?B?MEViNEoyZUgwM1BQdTJHb2grMlJPeXBQTXJLL3BMWEpiQ0lEalFLVGtwMDVV?=
 =?utf-8?B?YVdLR0VMT1podGlJUnAvdnU5bnZKY1NySzBFT0IwTk1pU210S2lQUy9SaXoy?=
 =?utf-8?B?ZzVHSUZrcFFOMU1YK3JYMXZjb3VYMUw5MGQ1YXRNMDkyL2xremJ4cVBmcTFH?=
 =?utf-8?B?RDE0dnhlLzlGS20xNzdHYmV4V0xwNm9zZ2ZJQ3EvVUREbkhHbDl1ZEpLVHda?=
 =?utf-8?B?Sk5ML3FEdTlWVWpUYlBWK2N4bVp4ckdpZjhIZHVSaVVkM1ZDUTlyN256S2xv?=
 =?utf-8?B?emhEcTZ2OHk2ZDQrZS85VHlMNFVDZ2FHT0FaVXZaQXRvQUZLOUNuUmRoMmpy?=
 =?utf-8?B?WmVQQTJvbm5xamtSZ1hLenJTY29ZSnovYzJCMEZhbDNqTDUxNmpSNXFEWTg5?=
 =?utf-8?B?eDRBaFlWaFVDZDNGckJybjBEM05paytCUzJGekpXaEZzN3FCb3pTMnJNY25q?=
 =?utf-8?B?cThwTkNXcFNOUDFIdXBoeVF6SU5hWkxYd1h3b0NvV1JHMEt1aGtFNFlWRUdE?=
 =?utf-8?B?NzJPSWhTekxXTFo3NkdCMitFbUNTUTZOZVVMOTNyemU5SmxPZTB0VXdDRWsw?=
 =?utf-8?B?WGZieXVHcG03TEVFU3lQUnlMb0toWkJGajBDY3IvSjZDT1I1bkFIS21uRVBN?=
 =?utf-8?B?YTIrck1JU2JLOUF0c3MzU2VBUnMrQVZsNnM5ajBVTWI3NGpJQW1SN1EraThC?=
 =?utf-8?B?WkFkY3JuT3FzOWdUMjhLazJvRU85Q1dmYi9rT3hFZ0txQmJYdVV3RUZhTkc5?=
 =?utf-8?B?cUZrL0lLeUU2RVZnS2NQSWlJWnRobXBuc0VFRlo1bUFrQ1k1ZEdLL1IwTzRC?=
 =?utf-8?B?cEFSMlIvRWxxRlZ0ODlaWnZWYVlyWVVkd2szQUVhUVBxanJXVjBiL0Q3T3BL?=
 =?utf-8?B?anI5dzA4M1o1bE1Udk1JTFpYY3UrM2d1SzFscncwZk5ka2IvUVpqR0dCOWNJ?=
 =?utf-8?B?a3RFOVFnUk8rSFZmQXNQMFJVemQvYnQvT3I0ZzJJaWtBTHRWRDdJNW9VYzJP?=
 =?utf-8?B?OGxpNDdhWHVPNzU3dXI5ODhmWFZTWnNXY2hLTVVqZVYxYUNDcy8rZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ed01e4-ebf6-4612-a622-08dea4062d48
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 02:39:17.1431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KynFons8ty7Gw5OqD+pbUgN7sp2g9Fpocg66obnQB0nPgH4KF+rL3H0mz77vFs1ey5CRv1zFyMei7gTENfLgfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_193919_106409_6F203521 
X-CRM114-Status: UNSURE (   7.62  )
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

From: Peng Fan <peng.fan@nxp.com>

Add compatible string for:
 Cortex-M7 core[0,1] in i.MX94
 Cortex-M33 Sync core in i.MX94

To i.MX94, Cortex-M7 core0 and core1 have different memory view from
Cortex-A55 core, so different compatible string is used.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index ce8ec0119469c8fc0979a192b6e3d3a03108d7d2..c18f71b648890da9c25a2f3309d8dbec5bb8d226 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -28,6 +28,9 @@ properties:
       - fsl,imx8qxp-cm4
       - fsl,imx8ulp-cm33
       - fsl,imx93-cm33
+      - fsl,imx94-cm33s
+      - fsl,imx94-cm70
+      - fsl,imx94-cm71
       - fsl,imx95-cm7
 
   clocks:

-- 
2.37.1


