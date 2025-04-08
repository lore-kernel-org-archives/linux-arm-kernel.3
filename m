Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071D1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 03:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1Ac+L/I0BFd1HFvzVe1qKU/ZoRPc7kB+7Wuw9Q2kJY=; b=Oe6bbjVt1135tIGGt3AG/vx2/H
	ZivcsQM06OSHYGp0qn2YtxofK0cCGmC2k7SWncsO4y8GEakKXQgNz71VF2KaitJX9M6aG/oeaOibv
	IN30ZrmB0/dH2fpWIw8RmXe9Beu//4CAKHz5iaCHZ7JmFotBsg2twem4kiEvVIR26xGmEcZj4sdXe
	IyaAV43YfTRD+yb8oZx18qM3DGPQvjOFv9Z7HVSWr4ELCnvOq2UFOb1SATUYeXqkqfgfD6SSsnvX2
	D2UB9HXoVsYg0cY0CzISlO4pixHF015n/sfQey/+uFxbgOd77n46x7v/2YIiM2+DFW5XD7cr60Eko
	M4Uifbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1zFT-00000002aDV-23cS;
	Tue, 08 Apr 2025 03:03:39 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1zAR-00000002Z56-3Gqd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 02:58:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AISxqdZiBIOpVSKk1865AEhRw6KDQ7T2XkX9x0TVAiGOurf3uRPyT2hG9I+I8GHQS7noMZdId3MSjA8XHED3TAhvfDo1h2DIyMsEsOEv5m3HqiLKcjSPxMRvuc/zsmOoklllFjRfv1Hhl29PUPaYYBWlFVEO13PgTPpd9ONmXC+nsXG7GbYfL3EPnE1V/I8mw7c9INfprFetgSkKByeajqMfVRwLk8b7yqMukddTsk3fDrh+Lu5hDw/i+rW9I2DEXkliICZ3k0nPNAxMbn88E4qEkj7/CZ+b8/vwxeObX7acTd4LSIADwe9pb/uJuQvlj0zxyQCBGpiFXqIn8NBdmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1Ac+L/I0BFd1HFvzVe1qKU/ZoRPc7kB+7Wuw9Q2kJY=;
 b=hgJVlIFUWKXKoRRvg/F3xehT6qpSzXOUJsNPEcdA5IwUZwuC6H7JmcbtSdkL54qGLPgugdnB1E3UL5QymjDuIrFHu8Dp4oZcMNHgHKnUEZTK2C01ine0unKVmv+IbTRuz7F+MORnOWisJXLvX89BNbNJOwA09V1d3PZDjISwNgBLyUNCtSBYFI7jYDZk3hMxef+QYPp7nbsafRLafq77s89i44KW3HHro8ZNFSHNJIKB9v+ywDQLobMmeW9A2X0SXTEBZemg27TQHcI3iR5HCC1ZaAzXontM1pYTVwzegU7bIawXp1EljsJcwdd+HQlqBJVfRuyraPYX0ul0/EfJzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1Ac+L/I0BFd1HFvzVe1qKU/ZoRPc7kB+7Wuw9Q2kJY=;
 b=tMM+bzTDOngGm1pfE6ral+Dt4nJLtl1gxs1EcTd4+rNZ0wy1hv2Ra93U2VuO0WWp6pInm/cBcTHsrRJ1JYT/RpSAgzKy7ExQJdbblIX1W5n1UfhcKLjhbBpqlsBRgxaevcldqQ7d7fP3VFKwpo0g4jRQJtAQEgMPRsz0M+EgObu+/8AdM9icBXZrZkaEscCwGfEhhcDyTNvrW0fgM/Pm6XLP23g9NEzJhClDO7UCouxVWM8lyL+dB+PNrUGAVDq2HQOaEP5SBnflIlvAFm9OIa59tWMeFzXKY0MJLcZD5g4rO5mUpFDFdNr/gG+RVRbQ587p6MWz7wJtIwuikntDHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI1PR04MB6944.eurprd04.prod.outlook.com (2603:10a6:803:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 02:58:22 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 02:58:22 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/4] media: imx-jpeg: Cleanup after an allocation error
Date: Tue,  8 Apr 2025 10:57:18 +0800
Message-ID: <20250408025725.1244-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250408025725.1244-1-ming.qian@oss.nxp.com>
References: <20250408025725.1244-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI1PR04MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: fa06cef8-1310-494d-8c8b-08dd764938cc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uid4VD0cLHtrMLtqrLqZBgpjYPddeievDUfZ/90PiQnnYD/z/D3TqvWf3UIz?=
 =?us-ascii?Q?SyihCXDqgSb9agXNpC+/jZkka94TaEQA89/ExtR/2kWPWp8btyZoD2/0NGWJ?=
 =?us-ascii?Q?IEjgRQpA7xUvy97MaYOFgbSFmC+KFmUYfhdesi1fHDsjAsRYS7dE/xD8P/hL?=
 =?us-ascii?Q?Rw056V/Py1inp8e6Zq1mGiWB0kMv1vrt72GkMTkETi7oqK3P8hfsL9BHiqfz?=
 =?us-ascii?Q?vMD58DRDAKmqpYXXxEI7hj9UgvkvXk/8Jop0MP6lUxZ5rGWetIcHu2vUSR2U?=
 =?us-ascii?Q?2p6GlYY2noHaH/I/txqUyOS17wSTDf5T2iS/HEC4bjI+CJzfcfrLzzaxG80X?=
 =?us-ascii?Q?jnxUuLiwWy/3uQ2IkDxiyD2aWi9LJvar4lmkFmNTJNw993D8RY+NFLPsrKWi?=
 =?us-ascii?Q?4bztrVm7Mkh1fa6NSHFZCJhrrCW56SpRCjyEBzvmhEbEgI8KX96bmO89yoBq?=
 =?us-ascii?Q?JCOMnDZ1IaI4yUef8L8U9PQNSugTPSDkxan+cAY01ayBH98jE1SWTTLn8bAU?=
 =?us-ascii?Q?+govzrPRocYJGvimmdbKBR1NuYsFsL9SA65ieC8YQrAMAbWbTB49RZ3gQbtY?=
 =?us-ascii?Q?9VsiKUMp78OMx8hhLJ+N+VEDMhsEmCDUmuh/J3c3DWgSku0FJwf72nuPIx0/?=
 =?us-ascii?Q?y9Onxly1GCRJOX9sX2uDBiI/x7/rVl4RtHA/M/bS62vxzi4QXzZRut+J2IgV?=
 =?us-ascii?Q?hPN0CBIHzBjwI4uq9u/jh6L8HvnYFGusSU8hFUuplvfGRO76WoNdpqrcz6vn?=
 =?us-ascii?Q?iu8wcmn9puT4vn8ON5IJSi+fvg+e16V5woXKDzRwQxTYq5lWFUKTm10Tyhn+?=
 =?us-ascii?Q?E1+Axs9U/kcskGa08/egOXX9pVYOuWplrJiZzY9cWaXrWTXhIi3Oxd0WmZmU?=
 =?us-ascii?Q?5mKZh39ickXy3lzJWTQh5+hrZAWsR/IznstyYUsYJ/OYhs8P21rAMi+WN5Uf?=
 =?us-ascii?Q?A6Fwa47MPxjI/thNvKaE6fyUeTu4yx8yhkr2Cf2cSZrlYXdR1g66sZBVwAQ7?=
 =?us-ascii?Q?1eJhkAhxtKkUIRY7zMopuDEHpHwg899CNtGOP45ptOVeAGmISY9hG6TdgMwW?=
 =?us-ascii?Q?Luzv6bFOFJuLbSzEV4PZrRt4l1IVc4e5YTiRFlNGUjWKh/Q1J7ZuJTJUl6HW?=
 =?us-ascii?Q?7/lZh+qIIqI7DJsO7z1SyzlE4NzvjCX506gyO+A7mPrKAAeuM3oQEsHua281?=
 =?us-ascii?Q?jJ8sV1A0s34+PAf1AA3624BUp3F34dipshig8EiJLHG1i5L0x6KJPUKaaY/O?=
 =?us-ascii?Q?tNxzCT3B/cLUm5BiNO7zxVbVo7N0zMqUxGe9+QflZ5rXUtkSUKTkEMdhBTDQ?=
 =?us-ascii?Q?m8MsNMC1dPf9P7IBW9Bj8NdSyvsPcNsR65FMQ12N0kztSyTjqI7whLn62OST?=
 =?us-ascii?Q?HqgVYljahLLkHcCYKe2WLHIeo58kpYjpeQ5j0Y/AvJ6JkK7USRRc6+bQhlqC?=
 =?us-ascii?Q?p5dAAShGNSua87RyXWzOABgu7dFdboV/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DtqVAl0jG+mwBgqrhPnRFQAwY3KIdDVG7w7+rnezW3pe0PsKhlWMHtuzSeyl?=
 =?us-ascii?Q?qmuy4DnxtHC+9vbQR5V/v470FD2OMaFbamsDcVrGNDOYDVOT2nw9e4QxleS5?=
 =?us-ascii?Q?b4Rz6pHiXpGYOsOO3DNe2B+d1wc6uZJmWhl0sDV8sXsnK7lnNy/7ynNVVq8D?=
 =?us-ascii?Q?5iuYHdS2ppAwMFDI+GCAkmQutBsiZMB02bC+6y9xh5I3/nWpRQi36aFGQYCo?=
 =?us-ascii?Q?TQDX7VgJZnOX6y8aYOvB/uocp2HRS5sYiAOUk1idJbgf+GHt/hvoDkn10x+z?=
 =?us-ascii?Q?k45Bmn8euAneV7KHgUdB7bZo9kAeo71/NlMttL331LChahs7i5bYhhZIM067?=
 =?us-ascii?Q?3CRMIY5Jt2O/pHzZYFBTycrp0s3bDxyxLEHZmse/WWhvZpaIF9XREZke2WG+?=
 =?us-ascii?Q?eyDk7P4jXOf8mDggcz8YIFUP456Qv8eI5RDGsvsyeREbMpVvuri1hsjGMk1z?=
 =?us-ascii?Q?LndlWAHQwNbPUl6JpqQM2pkkkaDUIp3bh5FajipiscpF7jE8UICAHeeXAPdU?=
 =?us-ascii?Q?HePSsJpHdNzrs6W31VSuNX+aq8ZKKFU7O3uco9MlqFvAdpiROTawunHlzebu?=
 =?us-ascii?Q?CVfTuPUKDltrxMxt8OCeGaBMvXR5glb7LjeSbhHGXaRCF2WBe1IfUaPnVqdB?=
 =?us-ascii?Q?UBHUtDuLy1kzDtMQ12bUEAF9Mnki2wYkERvhPmpUqgeCyPa5k34Yr7xqF4Zr?=
 =?us-ascii?Q?a/h4eqrnps1EnQRfwz6CfbdkfbyZ+P0zQ06cseC9H7ii1GyqeSHJV/GBbo+g?=
 =?us-ascii?Q?b0y4cESfwA3Olql0peE0GTOOKiDy5SoUSxxlJIiB+g7FZ3GFc0Tql1llTwzT?=
 =?us-ascii?Q?NtQsam7KtGmCr5YxyUD8ETt4UefLzXrhdw8yeHVLkbdqfGHax3V5sdMfSkUt?=
 =?us-ascii?Q?e40gvBrUo6/AkDm+EpI3HiENwhgJvLQmOrfJJx9XRg6//vap2tlUXappXL4s?=
 =?us-ascii?Q?QPQiF9zSR1bYeLV+e9Zoqy/2buNxybgD3GTkbnbG9txmop1re5TonYJLbu/c?=
 =?us-ascii?Q?JS1BFYd3NTctGbPotC4lmYmtyhUYQOjGBeScC53ATTyMoxSTIOhRvY3Ke/MP?=
 =?us-ascii?Q?M1g3LMK1U3BFTJ1WwCGVrcfnSre9iJslNZG+cofnn/pNSmPwAREr7hwOe9QY?=
 =?us-ascii?Q?dBIwTr9+DnFpSUJycgdTr5xj7l8RqaEce5ASp7/5dYnGVx6/Gd2J/SRFDf1b?=
 =?us-ascii?Q?DzJUQF0g9UGLV9HREKUtONTve7rX4JulnoCuUfUF/ncVN8tpKuorAT8+Qd2U?=
 =?us-ascii?Q?NnSmg5447tZ7E2773yB0jVyvM7KN+DvanHpnHvMPULeCfQMoD0fZRgE3njjn?=
 =?us-ascii?Q?NZQMJArcm/6whobZS0GrVOy9RHBRhsGkWwPc6R1R2PzxJQ7D2M0mp0Gac9E+?=
 =?us-ascii?Q?vv4MkHXJhlESVPrib7BEak42pOfuyJvQXQ0cmurFHpuKYYWa/oi+XK9JfFK7?=
 =?us-ascii?Q?Ii0e918owHvgMbdVIFDLGFyP6koOyjTvaCK6eA7UZSIR0G8RX+CdwoPwuSb6?=
 =?us-ascii?Q?g1ybajw/Y/ef20IR61IvmGMU3LqykieAAtIbw3Uxpzcq/vKEm2Mp8WWPw+nj?=
 =?us-ascii?Q?4mD0XWHgHNUQZOIXNJZTUgH9nbhLww8mjRBY0kRI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa06cef8-1310-494d-8c8b-08dd764938cc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 02:58:22.1758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCbY0C0e7GEUuxRLQdV+AVE3vI1SZRGTgmJhTajUa21v5Z+owuubS/plljAw9kvWT2KEsyInFRR9RN4v58/eBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6944
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_195827_818673_BFED7EAB 
X-CRM114-Status: UNSURE (   8.98  )
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

From: Ming Qian <ming.qian@oss.nxp.com>

When allocation failures are not cleaned up by the driver, further
allocation errors will be false-positives, which will cause buffers to
remain uninitialized and cause NULL pointer dereferences.
Clean up the errors accordingly.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
v3
- Split the moving of code into a separate patch

v2
- Add the Fixes tag

 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b2f7e9ad1885..12661c177f5a 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -820,6 +820,7 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 	return true;
 err:
 	dev_err(jpeg->dev, "Could not allocate descriptors for slot %d", jpeg->slot_data.slot);
+	mxc_jpeg_free_slot_data(jpeg);
 
 	return false;
 }
-- 
2.43.0-rc1


