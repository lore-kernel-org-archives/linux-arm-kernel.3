Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5648CCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 20:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rAhiViDwHamiGq2jNIxXx3DOSAvrBj71wopMP9CIaCU=; b=dQ8Y+3wcPnYI/f2nKR61thN8mV
	cllqTF18dkCB+btFV7VvQbZOc4PBaACmTl+1Birf533jvQcwnrTLQQWcjP4pl1ppUbPBffNgEAS0/
	SRVgQRmlifv8HGjljkmMqci1rHhdc2Hs8APx7NtUBdf1PlnTwnAUry4P2dnWliceTWFyjhX4sx8SY
	KpEOCClc0PuP6ScQ5fNUWM0/sB7xI3402unNbyGegEDuSZHjjhvGSOwCjC4jxdYST5sMjB1eV9loY
	Vl1KRNWm2B4qa9yrx2ligGjs8ds5nF30GutqZQjgjXjUkCwf3+p4tBewZGZq+FpR0uwE1dscDX9+l
	X6jOqDhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjnW-0000000CTlK-0BDu;
	Fri, 02 Oct 2026 20:24:02 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjnR-0000000CTkY-2WbE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 20:23:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWariJ6KagbObsIdPCb38La5DeXy3hc5sSYOqVo5M13FITcPDDxdelyo75iBSXl9qQPXIHpvEa7oYFFXtR1wZd7ejlawdFO/lqUACGK7YCsIcgOAFVgf/5qH0fzIoZKuNCxUwSIzNpf9ZszjtjuX/4hobb5u0k/hHfyd4SEzGhYNvUf2IjvnToo0mX7WQA5LcHaJ+ONOYkxK6f03zhlqQOAsrn7z/1JEgDROLfA7lfVWmPo43GyBBqNfX6/H4bqClK9krKYgRHWSWC7DgkmM6MbNw9KPnfWmwLWbuzZOWYyraob2hlg0TAqbIzpcmjks2nYXE44m0okR2bpVqOscRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAhiViDwHamiGq2jNIxXx3DOSAvrBj71wopMP9CIaCU=;
 b=UZDEAj1davi6S575ESSrEML4JwAZb/Bwxv40fWqgG90Xm0RLCSbQdXTsNEAJ1uSv9xIx6CRIk6C0wQx7mmO77K84JZQzfnz0jgjFvZ0m0OGigpvAnnytQMOp8NQk7cmQiDxuzvP2DUAgtIR32QWoVcTi20Ctd7+h5NmyjGX3R+EuYd0uhNNtXYZJG7v4btMwi16Yz43GYiBv4IN7m6Y/Tac1H2wDeUqdasyL2zc3jFfRL4Pbt3G2ivgREF84JTmFNu3MsVG/gT71iQtZpxjZEZt+TaIU685p236KexNWjdaxx5YsoQKAZQkxNx/1YB01XPRzuxQH5UU0pNy+gMCOyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAhiViDwHamiGq2jNIxXx3DOSAvrBj71wopMP9CIaCU=;
 b=Ab+ja65L94c1axADCexOfVeVtGjx7i3s+JW5L0FLsetrdWoTpmGSWSfQettuoJfkaPGafXqPprq44RO/Cm3uJVRpVTU9TzVsyK3/eU9kjaG0np6GAOgz/yf4aIa5TY9opnovvH6fGYOKAlkJeLBcorsmlDN9e16h07KKx8HxVhykhE6u73fHuI/EBJzea3bPtTjxbjYp/Hx+g1tyYuwIh8FSbFBubizCnu2oV9CXHCfAY/ElmZR1tQigVZEK/3X/XMoX4F5Qu0RioM1QRpdcuffKsvTpKJzB9tkpDFbEaqqv5kZMnTuEMBgRYxzHOzr6rG8G9YFERzehjPH/F6iOQQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB12214.eurprd04.prod.outlook.com (2603:10a6:150:336::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 20:23:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 20:23:51 +0000
From: Frank.Li@oss.nxp.com
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] dmaengine: add dmaengine_get_provider_device() API
Date: Fri,  2 Oct 2026 16:23:40 -0400
Message-ID: <20261002202341.253152-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8PR12CA0072.namprd12.prod.outlook.com
 (2603:10b6:930:4c::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB12214:EE_
X-MS-Office365-Filtering-Correlation-Id: 68322d0f-0e97-4fba-d2df-08df20c312ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|6133799003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: zNpIqfvDwf+SjcdQklwcKAHS8zA1wUEBCsycIQ85ghnEC2QmOIV7nu4BMzD9rYX/qJPOXhHUiUHmU8BRJimTozmchsGLhwzXTYXCySIrm1Ubc6VKkgTOYouYrPyhblUa9TU9eTe/FoE5PKtqbL8VctXFLXTOTLXnWEotrDy0KpQJE+Jyt1JXWcT5pxlfqa6zpmdRlLL41ccdxTcXzT83i7/cc5W5+RJhCa6+l5YCsrMv9Vfudm1qBpcYPWcZmwJmq+btPm+sWXp0GjqNkcpSquEAZzh/W7hUlGqAiJt4JyOTLNuHINM5fHK1xwHVD0yLpqe1SdMSd2jlhcTXI1GwRnVAwlUi24oMg49sHbZM7k5uWnIq89akvQf6VBnZNR2W9sEmWkcS3v5qd4Uf7oXTTOUm7HHks8S7WJ7sxve1zA8be6qupIBMUQVt2Pv/Ccum1kjZwtWG7DjKd7W0aegKCgRASqR2+TRmTp2nFu3XlG8P092Y1JuJ6oz7fBF9qZ1iATMDzLkMb2BtCbxLXPHd69Cg30HA4UNAJMtBnYuj5LjF0DRDTjbKEAWBJIGXxyUivC90y6Y/3p3Mn5QvRot4W/1yICCSOctd34eMikbSXd/IyTuHAPmujDq9mLJgE0yxV9XPPTD6QRabz1VvedHuEEjO73hsJEP8YtyhgbdE+48=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(6133799003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2d+MQqXMQ0HX6AislgfBDyqwiCu8+7lKpLWQiHdgqeUH04s1UIaB44oOSfhw?=
 =?us-ascii?Q?g48u7i+fLRcR90A7IO7VjpXhgKPLynxC3UqB64LgzI/gkKVjeEkdLw1UEbW4?=
 =?us-ascii?Q?jbe+kGgkFFme2vNTe63KfItBsPTZjHNyZ6s3+YYTLZXsH9t5G9v81STKVkvz?=
 =?us-ascii?Q?kEX99+iN2ZBwPjgKeh79Cy77mtApdk+jugOn75QtpqpkIbPh1dmgRnFLFnQC?=
 =?us-ascii?Q?eWKJtVFNQR2YICA8MfWsGbkJoiUEN1eZKFVQ54KJzXXWqyrgX7VZ10yy7FJQ?=
 =?us-ascii?Q?zmhp/POGywXUzEcg3WnD8tieac5kwAwZG0Jdja+j4GFJXJkPBP9bm6JCXpep?=
 =?us-ascii?Q?Mf2VwBvP/yAOJGkhTaw65NCPp5Jh6rOSl9vg20oszYXOMimxn1rPFUrmfAI7?=
 =?us-ascii?Q?BedG9Uj+GxOsFqF9dBALW102pQbQtqUgnYpvxOs+16Xj9UTx+fGwlTzYqJ5d?=
 =?us-ascii?Q?hTwo+OjPl0g0KUc/JiE14Zerhkw0+n+SLggCwMZfAXLkTd/XyvxNtLb2EYo/?=
 =?us-ascii?Q?HVTMaHQuPCcGpOonCYiAspR22hZ4TwCEbYeLB8PMSsLa6f0xYOuL+FU99SQ4?=
 =?us-ascii?Q?UpbzbTnBpwk5iLmmK7C3WKaNe/OVaUR9x5xVR38RNgum7wVDppjul1z09DBt?=
 =?us-ascii?Q?5G5B+OUqgrVZCgq9P1PbopA18bzoo+eLYONPwDK6zPsLCrL5bC31tQfDiCu9?=
 =?us-ascii?Q?xyi3f+kIEbcHbBHMobs96wkwvBV0eWMvwcGxsXck/nKSOOyduUkgufC8qPgf?=
 =?us-ascii?Q?g8sqi+dzcJD50qk7rPyR/HgT3Az54X0o+axGYgF71e0PGk8+WBH8KRs6/VtN?=
 =?us-ascii?Q?uEG3ZsMPPt5dldQH58WHEum81uit7aTFOvddxkVKuLZbBEyRsn6JeNEDfyCk?=
 =?us-ascii?Q?zj51w1uF3FDpt0653ExrVF8UT+lPdRpUxJmEuwlqS9/zIqmXXYyQYPLgFIjw?=
 =?us-ascii?Q?aE87aowVkiZNYu5x57W5kq6M2wuOF1DxnwFsgERDVAjwMtQ5WY9Czo0xa/wa?=
 =?us-ascii?Q?lj0Npr9fMBgV4amAb/LIIhdgj7vbDVWAOilsE0EBEsrUjc/iohWIqKv+7gyc?=
 =?us-ascii?Q?QiANdeD7FfKSaEHiBtdGmeR7+SOtULMKCWc0pFUuqey+Wlnkl0+1L0eCkMeN?=
 =?us-ascii?Q?Izxgf2dmHf8D9CeYMQHiRHkGZ+VssvHb7/s9UqeDTn4DilbLBOlORH0Ji+Gl?=
 =?us-ascii?Q?V1bV+l/77ZAx6c8YZT6EPDpUCRy9i1Xk2py1Bu+oBhCCfhfldYDO7KVxhx8d?=
 =?us-ascii?Q?tYmNaKUTdK7GNMueP8QrhM7WW9TDiJS2RD+8Zf9gE04KA68JnRE5I+EZS1gP?=
 =?us-ascii?Q?BIUXPz/rtViX0afaATH+OaMPaKCBRopuJ6DU8iFzeR5OjZ63jJpjA2QcKHYK?=
 =?us-ascii?Q?PURlzlwVdW7qW1YuhpmPL4969idgOzJA32xL+LVCE70o2IbJt4/PVQm3nN6Z?=
 =?us-ascii?Q?DXgwg41iilZJFlOyYNkSldl3M1E0MwyXbbCGGUBn9Bb4VwyzZNwyK0ETs4Gd?=
 =?us-ascii?Q?16miwr1ta/WwF2PBC0a/J7OD9jWsKgrt5L8cbrTuWJ2D7lrgRN3UY1p7NLO2?=
 =?us-ascii?Q?Bl/CdFYlIringWU1lvkpfm1nICcdAZclbpiKGR9L45KD1DlZem52FCQFcYkM?=
 =?us-ascii?Q?jf8LfUZINhKQwdl3rercfSh4Rwp5MQ4rhnmfDl+mLWqFdyaKSoqorCMcj4CC?=
 =?us-ascii?Q?2RkaYnKZItxf/8ppqCtQgVvfDDqfkX2dz5fDlHIp88KaGSXEsP0KN/seb6y1?=
 =?us-ascii?Q?GalxN4gQt1Mi8Jqs3qhififPQoPojIfvmWMvxzYgogGbTNVAoRDW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68322d0f-0e97-4fba-d2df-08df20c312ba
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 20:23:51.7944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNu7GzNuC4LhtxU//t/FIcpGxtFQqsMm+gBOZH0Zu4kRhuXQWc6XQcsA6Z9oZdvsMBTZbiyK3Bx+XnenaSIP6l5N8DMDv0YnUCVL+YOb/Vn44hLNA48NZzucPTgAzCYy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_132357_649926_CDD82A58 
X-CRM114-Status: GOOD (  14.67  )
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

From: Frank Li <Frank.Li@nxp.com>

Add dmaengine_get_provider_device() API and kernel doc for
dmaengine_get_dma_device() to describe the difference.

dmaengine_get_dma_device() is used for DMA mapping because some DMA
engines provide per-channel iommu mapping.

dmaengine_get_provider_device() is used to find a DMA engine channel
by a filter function.

In most cases they return the same value, but they have different
semantic meanings.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Prepare make dma_device private after all driver change to use new
APIs.
---
 include/linux/dma/imx-dma.h |  6 ++++--
 include/linux/dmaengine.h   | 21 ++++++++++++++++++++-
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/include/linux/dma/imx-dma.h b/include/linux/dma/imx-dma.h
index 16e491f63883c..7c678316b7578 100644
--- a/include/linux/dma/imx-dma.h
+++ b/include/linux/dma/imx-dma.h
@@ -59,8 +59,10 @@ struct imx_dma_data {
 
 static inline int imx_dma_is_general_purpose(struct dma_chan *chan)
 {
-	return !strcmp(chan->device->dev->driver->name, "imx-sdma") ||
-		!strcmp(chan->device->dev->driver->name, "imx-dma");
+	struct device *dev = dmaengine_get_provider_device(chan);
+
+	return !strcmp(dev->driver->name, "imx-sdma") ||
+		!strcmp(dev->driver->name, "imx-dma");
 }
 
 /**
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 1b57bc4a7e72a..f9918a42473f5 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1807,12 +1807,31 @@ static inline struct device *dmaengine_chan_dev(struct dma_chan *chan)
 	return &chan->chan_dev->device;
 }
 
+/*
+ * dmaengine_get_provider_device() - Get DMA engine provider device. Typical
+ *				     use is to find a DMA channel by filter.
+ * @chan: DMA channel
+ *
+ * Return: Pointer to the DMA engine provider device.
+ */
+static inline struct device *dmaengine_get_provider_device(struct dma_chan *chan)
+{
+	return chan->device->dev;
+}
+
+/*
+ * dmaengine_get_dma_device() - Get DMA device used for DMA mapping. Some
+ *				DMA engines provide per-channel iommu mapping.
+ * @chan: DMA channel
+ *
+ * Return: Pointer to the device used for DMA mapping.
+ */
 static inline struct device *dmaengine_get_dma_device(struct dma_chan *chan)
 {
 	if (chan->chan_dev->chan_dma_dev)
 		return dmaengine_chan_dev(chan);
 
-	return chan->device->dev;
+	return dmaengine_get_provider_device(chan);
 }
 
 #endif /* DMAENGINE_H */
-- 
2.43.0


