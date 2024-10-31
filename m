Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B92E68944
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 08:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/foMJLXbrz0qbnxNQ57gS/EpLf9dk983dskH5fpV0w=; b=oO/FT2OXA9q0WTrcmo87FuYBZ8
	lR75HtT5erknzrE1btl1C/eIAgMVpbme8c1lY0mmYjqK8IhPvoScBXLMSXDiZxpDglMilBObGT8+d
	Da8zT/+wEAAL2jdnJFta/EDR6l6qFJGsWPWztPdK551OjQ666NMyMdvHzR9znHI0TeLQ95DBwVkZr
	gRi9J7mVeriPB8yoSV6oJCBa82WiPtGQ7maOFbifQaeObr+GjUmhDgKQgpNhtslmVWTBIOVgmLX0J
	/wZX1hNXGvhDPKuLWNOpg6l0blYmjKVVjl7y9iXzHphYtn4lSNoAVUStJlp/9CVeBYPKTlyg5mjZD
	QF4uTkEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6QFI-00000002tfV-3XAL;
	Thu, 31 Oct 2024 08:09:32 +0000
Received: from mail-db5eur02on20614.outbound.protection.outlook.com ([2a01:111:f403:2608::614] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Q3V-00000002rqd-0uhI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:57:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNr9qi1Pkfz7uJpM1bS71dqcUjkJNUJmssEJ0Po/7/BFRdhc1l2uo+tp/6IXMpPAVjAEeTGQqlUXzPg6yjMw4yg0j5+yTfbfFmovOSQMiNZEh5KlJppXW6QXs4RfOw7wwUArBUxOCUWg2rs4h0BmEj5yaLzCfNASu+wjyStXWcvH6XjXoUNrD+C+7YU2BQeuGyX7cEXsF3TyMy8pN8n1F8YDbYYfTD1IbN09iRLfG5vukzfBBqSmJAcX+/NzIHFhfE4DuMU3dMefw9tprCa6EwZBTHjgqoom11EFZc+Fc0mKemUfBjzhQDV7DZG3Vc+XB7ptQ/TDgQBBPT3SVgxWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/foMJLXbrz0qbnxNQ57gS/EpLf9dk983dskH5fpV0w=;
 b=hYk3BCpz/QycFgaXKbWe4a+XDTVxeagaS+RWIXHECN0gkTRwa+xq+ejpAH/an5e8Duti/Q04LeKGLQ6yyplvtQL4ghvG9RSJNcrDS2huIsI/F7bYKWpfD1tOjHOoI4TWdmnXLFSR9ouYazRNsI7WVIwjPaIjgolRpl22nWdm79lcjEOTNxAn08eKAPiFcM745tv8OON1fbWcLV49iNJGAoWawQA7gkHyv2EM50LCpg3c1ZLETuLJAIIwdKarfz0zSHzUxMRjkVLkqEYVx3yPbWlVpSp5f4y3sC81X0qLJIQhXlIPja4+ZIL6oyZ13JoNeqTGoFyDS2meWWHK+02PCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/foMJLXbrz0qbnxNQ57gS/EpLf9dk983dskH5fpV0w=;
 b=gPTM4lE33rv7qriY0jiI/4w1BKgXtV8UdiBFPghTJ63U8utzNd5lEVnSTSSrpgqUMfEG9Wn3AfNFzEEAZ2xISAdxwazBEcZM8OorFXiUevbpozvmlJ3SH5Rq2otBqkh4IZXPcEInI6lDWZZ2Gi90CDfUriDyaS0A1tbBbsNGDJWpjTjl8kV0QWgtWOfvUC1CmwS+ilyLDR1NDK4AldnIoj9Z+6I2X4nx8EcV7bVhGa3vg1KeE/pbPYJWlodhnsTV3cCI25mdpZL2s3JtTWY2vkc/HvJiJm31UpPLtvvIrvGPEUZgFxoXulKHywutA7z+VN6iqJIkvrNTxXTvL2tYnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by DB9PR04MB8139.eurprd04.prod.outlook.com (2603:10a6:10:248::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 07:57:17 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%6]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 07:57:17 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: l.stach@pengutronix.de,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 04/10] PCI: imx6: Correct controller_id generation logic for i.MX7D
Date: Thu, 31 Oct 2024 16:06:49 +0800
Message-Id: <20241031080655.3879139-5-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241031080655.3879139-1-hongxing.zhu@nxp.com>
References: <20241031080655.3879139-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0184.apcprd04.prod.outlook.com
 (2603:1096:4:14::22) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|DB9PR04MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: d9cfbcf3-d6ec-41b8-f257-08dcf981a3d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d4CMnpC6izbMfSo3TsK15okcFcMoq1KOpf2z/zZMdOWPQGoUaQ+JWiTgF3EU?=
 =?us-ascii?Q?1sNfclBR5Xn2I/QDifT5ksJauIXYs9Y0xdlGmebslNI8Bv7x3498FwsZ7QPh?=
 =?us-ascii?Q?3P9KC9xHVTajIk8C8EVtfGBNRCDF0c7ElVroDRAewg0sRZrpWiPvtE72cpK7?=
 =?us-ascii?Q?bcLcbVCzlicqtTSFSl6UMYTjIE37IGDnLWXBpLGNAesQaaXjRENehtgFEpp5?=
 =?us-ascii?Q?XpLZfyIocsO/XXuBOi2pImUq23uc2hErqiyZu0MQOKTSh+5KXEFoYCRc4RL7?=
 =?us-ascii?Q?dV5BNzXGIVJaQ6zQcg87TyqpY13eJseKaciU4ea7V5hX0lJ/NAFnxrtdrfCD?=
 =?us-ascii?Q?ynf7k0u2YVuBrrIRdT3gnwjXivivwhH1VrJxq383570C11LnxiSbutlRdT5T?=
 =?us-ascii?Q?LlxAtSidofsVhByw+ubQg3cwNTgoE6gAysCGJKpI2IDXEdtySoA1+Faa8daA?=
 =?us-ascii?Q?+1ilHDN+mlPciSyRNKLxYBSOjxwOxRtnWqzjYRWoPlhdc3uNey1YUOqLQKqW?=
 =?us-ascii?Q?1UCu8enTuCcYEoHZ0r5JhyUtrxKlqVc1U8yL70TqsC2kadXDhFBlfpCMvmtM?=
 =?us-ascii?Q?/+pPS5DSn1GguIRnJamffTmvK1b++F8zxxDjd683othdM5r/7CtXQtLrit5c?=
 =?us-ascii?Q?JHZNvygUWYM0lBAyjFIx6idtY26CEUB0S/iDMQ7h2Zka0WsmoTSDkCXfWmWx?=
 =?us-ascii?Q?Qix7yR+bK95iTIY9zyU2JLEzUsQ6I9Zz3iwJVMNtdSH9uvukxhGiISJPy7ek?=
 =?us-ascii?Q?zyg3kERCPGu97IPia/3P17HZSD8yeOjqVsZkVhOz0FItj/Ii+Q3OaF8lhYGx?=
 =?us-ascii?Q?6fN9318JT6xE5Ogk4LfCNoLmEFawqEK9rvXSfEcFQHx1LYh8DirVzDgHADjm?=
 =?us-ascii?Q?SGHuQrXETWffyWtlsrpPwbEAQpmYcSdSXaF90cdHwSfORl9GwxW2smk9RslZ?=
 =?us-ascii?Q?nUEiJP0ouQ53XvfZMwkxH4GxwvetcWlY0tQDnpC8hMsBMkrSxlQhnmoCiz/r?=
 =?us-ascii?Q?/AIbDomHjkmx0XwqtnhIMTjtIC6oNUs2mrDIhqOmN5b6dR/OSkf88jF6GKoL?=
 =?us-ascii?Q?tONg+OOUkYVCUuQEawiodymazIbZKIW2bndWSBVJ12i6fjdTphHvu9D4myi1?=
 =?us-ascii?Q?MAIrIrZqXdH1B4xb5hIvI5hMQpJtif36pVORro+38u7ahZJb310lf1qOGqYK?=
 =?us-ascii?Q?FeD+9bvCrSj5XDnvuEOwYlmTL5r+pztcHf/zTyNe3YqCGe0Fs+dVzoBx8dPK?=
 =?us-ascii?Q?qqLD2OQmqQ8EiUHd+njU7tqji9HEMZ/0LW2U6DIeTvfYErnBR/AjZvxwMeA2?=
 =?us-ascii?Q?84BqViuZ3TBaLWbHplBJkp1XK/FO/DMvcC8Xi/WFlj/8hK6M6Rfdqh2YE6ne?=
 =?us-ascii?Q?VSEEEdFUPF0x13nVfoB+2KGQRgAj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mSiEmeNe2fDiwLyXILcwqsBWwSV8/8R9sbekQeMcUZCw5u22nB4ibW6o40jn?=
 =?us-ascii?Q?KL3ci4sk2RlWiKivtcPZZwe63HQEzot8XoSfk3t2+Zr3PaKGYD76VlMTWlEu?=
 =?us-ascii?Q?MeoxG0Fmqiwccjv7MTkg6P7lMuFL5IKHjeK6fGc6aVUGe7DqbH1E2yldJk/t?=
 =?us-ascii?Q?mCxjW3NQOWZBR6eiLabw0peSS2M3wIUzI9IbIGfmhcKYnnDpy7gDYzqQq0kA?=
 =?us-ascii?Q?fhQ+mK5Ov+J4BlDrLcMf/SgsTGUTEdeOJAOmz2+8oyNlAGHj31fa/RsrmD+9?=
 =?us-ascii?Q?dcFT6aBcbQa3ng7W14aqQkz0rYw9h4rPZaA+RQOCV3hTCRcNfBIoZ/cC/Ua3?=
 =?us-ascii?Q?j4Kuo+UUfvAshTzcZvvU/VyLLdCIMNT/U2lnS6z+y8SwgvJquexfX5GbZAtp?=
 =?us-ascii?Q?VJq9gmkwLT06g5ZFyHitszJtfSuMhHC0QwxUYmUcR7yPMk5Np1RkH6+oaREb?=
 =?us-ascii?Q?pfiXgNq16AhnqS6mORyNDxX/mOX0eymrvq/YmefWNauQDJNwSOmR5x7eud8f?=
 =?us-ascii?Q?ank2c4wZuvYT6v3dHyWgH25EcZ/qQ/oojp1lyfD+WqAIVpIQVpJcfoX99gfT?=
 =?us-ascii?Q?lPOJH+ox0UbrtPViGBTow6HVViCTp7xDjoW7IXIGVEp7UOINGiciCtsJboM+?=
 =?us-ascii?Q?/3e28VWBL87/wH8/6DwhIuEkSnb4UUXv3Y7COxGwIY/z7luq3ZdFYJdD35Gz?=
 =?us-ascii?Q?76ZWbe7IzHPfRCoJCM96Wze/JxwQtxeXMBeYAORB6ZuCguSj7g4El/EHdXRd?=
 =?us-ascii?Q?3VZ+/nkGmNAOqSGlnQMBpAy3llXFOmt4berpOitf/Tt3T7JxqMkBIbyqr4m5?=
 =?us-ascii?Q?UBT22yaZt2YzUa/h2WQjZpf/nN0uKrNalK/7LzG7T46mdPx4G2eP/mTynIBm?=
 =?us-ascii?Q?L2MvuOmA84n473HoeVgmnfhJ54EeXVYGhJsqw8EXzXyR5w29cOzD5VSdSwde?=
 =?us-ascii?Q?aMqUy4X6IymBNTVCQvow50yA10TeseWh7pwVcJ9s97QTCv97aZeY5yK5p74x?=
 =?us-ascii?Q?Qj3YAT5swc+PUPFv8WN+Sd3pdBDZjMniniHMz/w/vYRVh+VJtirFgm3mR1Pp?=
 =?us-ascii?Q?cDBQEwF3iEO3HzggEYd9iJ8gpavmmhdETfoS6XNBiL8ftaXA0IiA/tpvQPo6?=
 =?us-ascii?Q?iupK+v2ubzD7OeNTEK0oZCFSIoo1nSDHY7OdWuije2pNKanaf11MRPXZdxCU?=
 =?us-ascii?Q?Dgd+bsU0qmOGF0Q2dUVqShnONg8sDfJS/rgvPAC4DzXai00ELr8DalzmZUdf?=
 =?us-ascii?Q?+uZtFJsOA+bnLE+Y5jDMbPvFEUCr6vtJFbfNFO1IBDvUSVHAQyhGXEeXxcRS?=
 =?us-ascii?Q?/DoFUTDdfGyUe0gIFXbiD20gFS/Aimsn6UsiqKr0/Bu1rn1EKEokvTP38Rmv?=
 =?us-ascii?Q?m7/xn3BbRWdFJ6E3QnWdmnI6KuBWKvEL++qrRKQX7d5WZb/+OAMwQu3BCQdr?=
 =?us-ascii?Q?jlKjWD8i5kMzCcgSIo9GQnih/5uN9StTMZ3ZfEQtJ3FFcLygv95/6DpO9OwZ?=
 =?us-ascii?Q?ygqe/w78eA/Z+sey7gViOdAhij8O/Zvd+BTGmYvQxoIGd8Y2mZB4qb8WAty7?=
 =?us-ascii?Q?q8QW32RA21cmrCL5Xn2rRDXuCvT8wDPzHFcbIn+8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cfbcf3-d6ec-41b8-f257-08dcf981a3d3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 07:57:17.7557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XCQMS2KmhpDXyEt6+5jhee3PuB6/NReMTmvSLjQkHTEzYX6qXa21jIRXeoHeIcgmXqBCRPMSd0q/kDMBFyBvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_005721_278339_3DAA519D 
X-CRM114-Status: GOOD (  11.22  )
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

i.MX7D only has one PCIe controller, so controller_id should always be 0.
The previous code is incorrect although yielding the correct result. Fix by
removing IMX7D from the switch case branch.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index d21f7d2e79dc..7479d3253f20 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1344,7 +1344,6 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	switch (imx_pcie->drvdata->variant) {
 	case IMX8MQ:
 	case IMX8MQ_EP:
-	case IMX7D:
 		if (dbi_base->start == IMX8MQ_PCIE2_BASE_ADDR)
 			imx_pcie->controller_id = 1;
 		break;
-- 
2.37.1


