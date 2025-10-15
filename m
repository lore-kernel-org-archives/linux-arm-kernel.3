Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9881ECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 03:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjaJQ1lNK4M8lfwactjKeSBfVRkih8ZMX7pCoLXdP+s=; b=1nBPfIIN6Glt9noXU3IPf2tr3U
	3eSRAhYQWwmJxmZZdLPocXAM0XEJfUHJuSuEkbqQb8nSYWsQgLDausi7MDJNbDba5j+OV/ynuWCLF
	opk31U5G3npjSug+QIoJyzClIocJf/IMPBce6tNLXLRoJ/AuTLD3KcHGebjAYXksxZMVGrN/+huDw
	zP7XTjjUOIdqvddDpkf4oeHUfv7YYBP7a9jPStk78l8PTF3gLEOusz5Ye+pJnsUn66S6tkzh5URVq
	TI6a5SBS+Li6fBj3qEJtVzGN/vK2eew/0NgSxWJ1skW5sMsPnSh0L9c2zRTYiIq6F3UWYqltBYuml
	n5d1Wa7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8rps-00000000ILn-1hzk;
	Wed, 15 Oct 2025 03:05:56 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8rpo-00000000IGu-2x8d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 03:05:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2kjLDuWPbrZW6JVxwiPxoR/zwr9xNXIT6ZW7AyELdawC6xNapQzVZ+a7BPGewuDRg+T5z1Ux01cOLVIBzAD4ZVbIVKyveGkRgCLJUzPiYMXzQbF6MTqNlKArW0BzkovS06JLKDjOWPkQ4l6iHPY1UWdoYUnVKorndcsGQWxUD0f/2ZC8/KRwiwN4sLtTD+WAIjfaMgsT+RRdZjIqdcINLpscbFc5yQDcpVm0UNQpdwh+fqe5aj1M/SIomS8AuYa1xpiGECam3E+uCuHiJkN5hvyBoEN4+h0QD0TWr2inOLOIf22E/4jhWQYzdr4jxicc6wpGPE9OIINpIfBWtRyag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjaJQ1lNK4M8lfwactjKeSBfVRkih8ZMX7pCoLXdP+s=;
 b=cm+zJhuH93dWF7xH29GzkKyIZxQvgMJsUNKXIeTNt/PRwnZnM9NsMVr1ihLzrXT+A0q5B95wTJ/IJ08f/SjaJkKtBZfnEaODBoljV+GnMkK35ZzphaQFbXAEZFUZd8k2SMHwO5XTZRCcYn23RsChCTE6Myt7KfTKBghMkjocMynkoqlehM+nspqDlA15iZnOd02flZKgeEnqJbL4pA/YPUMd1MtgQK5VqditcigHG7hxB6Z0/M6SXizndg+jgwWCSQ/S2zrt1zOJeLvaLwa/V0rj4ztY40WWseC+S9C66xTT/ILeHu7r3GKAmPUs2KzNVB3Yyb56AVIx+XryddrHMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjaJQ1lNK4M8lfwactjKeSBfVRkih8ZMX7pCoLXdP+s=;
 b=aelSZwamVAM8K4BW9gMz4h6WS16pa/8Rb4iBDHLIMDpuXStYqidMNXn7pGwGJJHlz8ekNHO3uM4BxRMCC/wWO05sqcfYn/cwE9vSVHxRl6wYImqdc81hhI9vkbc+5Os1v+p4YMQJwyG351EzYk7mlvs/oZ3l+NSvONk5Sxlat2P3Jo3EhvLALvJU8iNoAORHm4oFUyZ2ULzH7eTOAIVpOiXI0YgXnugWw5O8vhrorOZVmfaiPufq/E54mR0h6TIyPnol1iPhUFQTRekJN2qChQ2JHGH3qAc/wo3Y/nlcXtg/4nKO8O12anEBhSoM8w4tLFd9wCEZY2AWgYhVC4/GjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8840.eurprd04.prod.outlook.com (2603:10a6:10:2e3::6)
 by VI1PR04MB7006.eurprd04.prod.outlook.com (2603:10a6:803:137::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 15 Oct
 2025 03:05:49 +0000
Received: from DU2PR04MB8840.eurprd04.prod.outlook.com
 ([fe80::7c5d:60c1:2432:86a1]) by DU2PR04MB8840.eurprd04.prod.outlook.com
 ([fe80::7c5d:60c1:2432:86a1%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 03:05:49 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v6 08/11] PCI: dwc: Invoke post_init in dw_pcie_resume_noirq()
Date: Wed, 15 Oct 2025 11:04:25 +0800
Message-Id: <20251015030428.2980427-9-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
References: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To DU2PR04MB8840.eurprd04.prod.outlook.com
 (2603:10a6:10:2e3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8840:EE_|VI1PR04MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a3ec415-49e5-42a2-1425-08de0b97be02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kc+CRU6LmMSdSnaXo+OlkiGCL+i3e/aA0wJC20phZ0NyYm97pvvMphvZp46N?=
 =?us-ascii?Q?m0VXwr6+/RHYzoaUaNRgKYB+C/5SJSyYCimRTZzLw/01BtWvYwaG5jDbMZRi?=
 =?us-ascii?Q?xG/Q5xS6P938mXUsxUorcVGQh7tDVkh4WBzhmR3NYGxIC6ZGj+0nG5xZnx1g?=
 =?us-ascii?Q?CR+IaNXeZLp9+iRvfQdD/PW7H2xalxB+vexmhqhfqla1vnfFkZe2oqLHnDS+?=
 =?us-ascii?Q?Xc5bnz9+JP2GdQdC8sicRMdjvF8AVQAQC6XGjPpTlef8zcfK5hy0pFcxPRR7?=
 =?us-ascii?Q?0AkjxjZ4dW+SETaYqlrYK9VTejlkT+B28eUifoBQWQ2KFeTL9fXrVz/y5y3s?=
 =?us-ascii?Q?M83IUDJEy+VF35A9eehh7pOC513Lwm2SiftvM6D63AQCDPUR2Vi6lkXv3FAq?=
 =?us-ascii?Q?uCOSi7O5TlQOArnaob9djq0J7mHLDUImKPYaeneF/oUziDHe25vEtcyIBp5c?=
 =?us-ascii?Q?kE/kbMs3YvgglUysQKFB13t3adVpcAaDU62CROZKgeVaHadBPTbkyMio1k+C?=
 =?us-ascii?Q?3ptNDYoXk/kXQvktErT1dae5TGgopdTwe6Zy5PnwBp/A7EyLepiqZqBadMc5?=
 =?us-ascii?Q?L29K+QYuntd7YnEYHpKwvkhtH5DDDctA3kVvR0yjR0jaYEXLfeCoJz317a2M?=
 =?us-ascii?Q?gbCk5OSR/5ST8QbJAJuexajo2Dbmg79S83X2uqjg2ijqCzsOVFoUS1tclWIz?=
 =?us-ascii?Q?yQAPaiH9lM5s9hDXI4vcSXA9UkAkXHeQ/J6Edp67Ma4cdtiz6mCM3jgkRFzV?=
 =?us-ascii?Q?q5UwuVwc/ybflf6ZQJkokFIjoXtmQHmNBDmqz5ZCphNch6sTdEAPz6KkgO29?=
 =?us-ascii?Q?O5eE3G0rSaylV0xTkS/0f12ySdQsNpmiOby3KfkThT4Jc7YnIEqV0g3Vjp8B?=
 =?us-ascii?Q?m8vxBVeA3owKfpezeFty+f/A4NiRXfCZfhiTwb0/ffEqeMWG0Bxmp4scnONk?=
 =?us-ascii?Q?iaq/pxrRFZxIZSm3dMuMN71oXHLEdMaoB7RhbTfvDFNSv5muDtY8SaggyGBN?=
 =?us-ascii?Q?qsNbGymsdrWoZCgh1W7PnLEfLfqkV5AXIIzlxxkQVT7UHltqtq0LqzB25tv/?=
 =?us-ascii?Q?nm8rHOt+mjvUG8evOlRZrJkub05GA2iCieOs7/s8tgZsAnEJqmzmwKyCmTVf?=
 =?us-ascii?Q?xz0MFPnr/UZXo1X3K53gIZuhMimvsGpDiJkU7zt6fPtezAgYDh0BJFYy1m5D?=
 =?us-ascii?Q?gzShiZ07qwYnJWcMXeRdDj2ogcR/jOY1Ca5zm3MtFRYEef853n6URvFVmJlM?=
 =?us-ascii?Q?3mt23gGE8GE/8catkYFTED8IXOuD/7Yso0XHKcB+nZoXr+Mj9CZ0NsDXeSWi?=
 =?us-ascii?Q?NDKflR2iFDqfKkvMvmo82EdVpmeOjHLQGOL41yNVgVXDDKMLuxFTXcH4YOFT?=
 =?us-ascii?Q?C9i9YefwrV1+xm3IJoe3a6Qg/LZBKKvlstfq32nR1crsQtstD616BeawIv0O?=
 =?us-ascii?Q?JWZ6T0mSDp3UpdroU7RwgRVLK9NGzZ+4XiRp4PU2dbIj0YsELvSz7o2DXQOw?=
 =?us-ascii?Q?a0anQoNopJ440AqaBkeGf4GouKcD2RSO7THQPCVdCS1MSd3tF22cBOLDlw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8840.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?31jefl23MKcPWofZvdYFhLuV9aKmJfy0FMv/j1Ca5pX+efAUVB6lc2cNgnu/?=
 =?us-ascii?Q?m9lpX6p/gG5NZjHThTAHEVTIZYUHfmC9Rtudo6J+s+ehOpk8R8TFO2syvtjq?=
 =?us-ascii?Q?ttj79IM/q7gAT0SlJXYStW7MmkJVQtaDe7xbWRQUJATf53aK277wkuInHRNX?=
 =?us-ascii?Q?m7IKgWtFKYTnZR6eU2lkFzCTcKNwxwpHpa8dP5fz2K4yRKlJtJdD/PUNdhOE?=
 =?us-ascii?Q?3dkIfKn2RqZ3yugAsnwfu3fzL5OrsfIAyynKZ5FZIlfGYFLjiCwV/f9nW39E?=
 =?us-ascii?Q?IWTcYK8iDasuY3HqNHnzOdDpDFbE0brzZwzu3S/ZyNa48t0f83BJIIcbZTka?=
 =?us-ascii?Q?mI+e1SL54aQfgttnBhFQ6ahaKt5loBiIJ9Wcu8FbEot+2Z/uDkeVTjLey4/5?=
 =?us-ascii?Q?ZrgrMh8acZxIIxMj9gTdoqVQcu3Tm2MbCd1D8uSrt/qpCSMeegfdrZvs3Jnv?=
 =?us-ascii?Q?1R0DSV2LWW9hMGvA6PCnYHqp/2+1VpnpZhq1SJm7mcRo/yunAmmvfJA8AMoV?=
 =?us-ascii?Q?BQtZ3z+yoInHIR2DyUgqfjizsYQ6M2PPep8PSYFIFFRjAl/EqsEbuuw58khm?=
 =?us-ascii?Q?VC59rnJinTkyFsTM+kvcXXG22LM7zduovVulvh8TZXQEpiNq2r7wICimJ7+Z?=
 =?us-ascii?Q?v2skggi7XpgLFzS44dwthmzQJvnhIJ1SMZqNKGZv4RC4F09DKHy0bNDKkkII?=
 =?us-ascii?Q?TrhIjAN7zBo8uPXvty1OO+xmGujF/Djul7c9GzyBOK1oraJ953ipcJupJFe7?=
 =?us-ascii?Q?DQ6iDxEfc5KQK87EqIAuoqVTvFDnDVygU14EfzvogatXnCnl3ti6dK+cXKrG?=
 =?us-ascii?Q?7/m4NjpxZ7LW6C2tW2aZU3VfE3s28hButUOhj/lkfxTTdWKF5U+vcyGYxA0C?=
 =?us-ascii?Q?OwRu6TitaoIQs3s5Bt5EARt5+H4nJs72kDq1bJgtDbqkK+To9BMMhOKDGttq?=
 =?us-ascii?Q?ZzDSdHQM1KATVDmAbZfcJyUDmiv7IaQYMbhoNEidgU8ItAMBOok/Xeq+9Dfh?=
 =?us-ascii?Q?FUa34v3XqJhYd/8l7yFp5BAdQxuXyftlBI0nv5plu8tE28zxqzghiKUlnnYG?=
 =?us-ascii?Q?lvnV/13NXpdv1qx+vdKJ1oodI7G4czgJuv75ghZt58zNI+bWAplISA88RIPl?=
 =?us-ascii?Q?eQwzn9xRobKDnROj5SJkQ4sXOEccvcW5P/JEuS0FwPbg7eb4b6kKzj/bqItb?=
 =?us-ascii?Q?BSWHpxuyUMUTt6n77YQDGBmLPXyP1Ci3SzIzltM6AKIb3te25/fnOL7yQVAY?=
 =?us-ascii?Q?SQb9LVk1xQkjnbztdtgqh8Tf9UwhSp8l8GtQdndR6uLGTp0n9vhQqJipj2Fj?=
 =?us-ascii?Q?nBY3jLM7nJyNYQYOUy/8H1D2TPJgFR5/E+9myVHyVaFsOkgJ71ZfNhn5r5fe?=
 =?us-ascii?Q?4sz87BhPSzxiYZou2ONT50RAoBgvINFd1zHLfH4G54LACXjpteNpOflSwsxR?=
 =?us-ascii?Q?CKsuk+YHIjbdialz4/GvuLGNWFpMAHhg1qHwaqM7jTJgTNb8mCnvPkk5uc6f?=
 =?us-ascii?Q?ben7hYk2lpnvBcnd13X8pl8/sJBp66osRhut0kmcwWkuEO8ytWudfkVqB1GW?=
 =?us-ascii?Q?ShLkJE7q4aMD2hgbBtSsIEZ4W/ODigHkOR9NChhl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3ec415-49e5-42a2-1425-08de0b97be02
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8840.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 03:05:49.5443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9MC7bTVZjt3eVXc8uZlCZ2ToGSrwhcfu10OFHgnqAN44lXFhofYlF3MqhFGi96BIKRrgOB6poy6Szm46x4Q8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_200552_746607_6A49844A 
X-CRM114-Status: UNSURE (   9.29  )
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

If the ops has post_init callback, invoke it in dw_pcie_resume_noirq().

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 20c9333bcb1c4..2b59e7d2e6179 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1199,6 +1199,9 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
 	if (ret)
 		return ret;
 
+	if (pci->pp.ops->post_init)
+		pci->pp.ops->post_init(&pci->pp);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_resume_noirq);
-- 
2.37.1


