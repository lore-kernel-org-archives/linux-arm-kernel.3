Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E68CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 07:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FZzRr63yxYZkVrzwLMlLtLe2ihsfEVVC2hF3Qqaa9c=; b=B3kuClBbbUNlQ5+1D1QtiuHCMr
	pIQ996DTqB8WPxxBV/tvbvqUhrz7qnPEICS1tWzY7jZeooTKwuqaEprr97pU8Lfr5qMkrmm6r+ebM
	yQWwySjMrG8AkESqIVd0lnLMc+KK1M7gkYk1/DT969zDIB1PBB0PxrIOnY613qDoSLYuQ2vst1cim
	QKG1wdkFovVtKCftfUHjioztjgrbDF+135yCRNrA9kwfgqAlEBSf+tqzGCiuSIsYPWIE8c4Yj8lUk
	VZhwNfo3WWeiYOap0KJnyWkBOldkq9wUKWFAHkbz5aa+UxNkXRq4ycg/4ykAAeW1GFUcDtnzOrBmK
	PfBpF4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unufD-00000006qfs-2J8J;
	Mon, 18 Aug 2025 07:52:19 +0000
Received: from mail-francecentralazon11013070.outbound.protection.outlook.com ([40.107.162.70] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuMc-00000006nB2-3gJt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 07:33:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zg/Vkqh61F1uKIbsn4t3tdLU3M7WnuKiWfRWPqG8IXG0A/LTRxnGv6OD2mSUtRk5pNeg3OB1WFuK2PwMiL6jufRhxgUqg543avK4qubTVtRPALGH4xR85stjg/pnqJia5V6KDQnnaZ6pV91LPlfBoqd40F/mdKPVNlH95rG3hT3bYX6dlacNS1NwcJDcKGVS04y2f+6rVxAO71pU8eZ5dmNU4v8UPl5svnuAWOh8SKggF62df98PUva3QdlilZlqPQYdHvvneH5duYIz+iRg2nie8Fa4bQMwF/4JGi/c9w0hOmvXWfHeackp5Mh8RSFCT0BDzegOO566+eXm+VVasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FZzRr63yxYZkVrzwLMlLtLe2ihsfEVVC2hF3Qqaa9c=;
 b=vJQHHKRAYT4fjzbpqKZfrKg1E5RVHJ1zA/6PcfqBC9JdKPCVkCuM/OI8N6I/yOpiNcQMnkII6UcVmiSvm8i5laIZgrU5Huks5qAnLIxp4s3rTKmEDTWcgzvhkpu8WFBneEM2fJi0hdXHG216BRalAQOmdyYeRnRdeddtUcpdqtktui+OwXBarCii4k38/QwjSRRfMbcezmop8Q10Gl6qZM90y6FeBLRTI4WJM0L8ksuCCGsmJTQilRWJR80dAbfB3YO1FGj5mF3yhchHL6rZemMfuYOA4KXHYZTU3q3JEPDSR7KCQ+r7eECmMSyanNHLx+1//ETNJmbg1jSwaSO16A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FZzRr63yxYZkVrzwLMlLtLe2ihsfEVVC2hF3Qqaa9c=;
 b=Xag+lBKfZMa17RNjteIErKk375aSbVJ5sJYLPtqrqmUuRICyod3skfgtmEqjLpf61BXqZ6xoA6Mw8K4Vj3jgYT8ClKpERq+6qg99Ssdz9JtqMlyw+ZFmX7yOzBcHYjIoo8GsT8JTJqwf8LLwCe9LJKOAh9Ml8aV0V8mz+4wRDYz9haG0MbOwJyUhH3D+OKdGHfdshAKOS+OG+GPG/sGvmvYaIJrV7LLKikhC6GbYFfs+sFLLJg95U6P2daMh3zoPUtHls1xOwsuYHLJl9op70rKju8ojrVTqKckviTufGNE7m/1nXq9n4dviSWq2QwPy+Bb8vVIek4p34AeHueOFvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by GVXPR04MB9878.eurprd04.prod.outlook.com (2603:10a6:150:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 07:32:58 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%4]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 07:32:58 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	jingoohan1@gmail.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [RESEND v3 5/5] PCI: dwc: Don't return error when wait for link up
Date: Mon, 18 Aug 2025 15:32:05 +0800
Message-Id: <20250818073205.1412507-6-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250818073205.1412507-1-hongxing.zhu@nxp.com>
References: <20250818073205.1412507-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::22)
 To AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|GVXPR04MB9878:EE_
X-MS-Office365-Filtering-Correlation-Id: 99676667-bfec-45c4-2963-08ddde297443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JfuzBLrK0Q2gE+JIeXkt5uLyzVeq+iK3tyltEsbp8Jr9SyVn0PhH5z+8/fFT?=
 =?us-ascii?Q?6Bf+9ML1y469jOukncwOf2n1PyVuvFefo1DaVUD4JrrF6hcOXe5cHGoKoYJY?=
 =?us-ascii?Q?rIauiAYm8b7Lp0n/e32qWnfwZVVy/nVV6k8KGlmtRb7lgz+zCvIV0fj5MNNN?=
 =?us-ascii?Q?Vpv0okju5fix3CAwcUPOFsnhK+E/JcgCom5pWHCQDaUhYQpx1L59Z6fjrJGq?=
 =?us-ascii?Q?dFaIqfwEIB77ByFRtYL0f+ui8dCYVTh5LmGL0ztowj/MCqIAdM+W6MhWsG+s?=
 =?us-ascii?Q?DvniEzRoVoEPqbYz+0lET9omgaEnTyN9qpNN8++Qtj1F37C3WDNMKiK07qRb?=
 =?us-ascii?Q?D3oj98lZFDu+FO1EBxb3zDAP80yVNf1LojNhBqLo2S4Gea0CRnCwB7JlrjMs?=
 =?us-ascii?Q?RazDobEWC8SCSm+X5J9RKJJCroezdXslzyLUJHfVzZUxjt0TmF5agOojTbcw?=
 =?us-ascii?Q?qaOdsILNNPEqRa72xhgivg/quNkzk0UY6o5aTaX3Qudq0HnLHNJ0m2bGvmyc?=
 =?us-ascii?Q?KgdFDlZ5mIVJXYaMVehB1oeWULxVda/kJ7Ahn/17q0lJpPtHW03/dWY8Vofc?=
 =?us-ascii?Q?eMrGFFTnL8om9FkxUzCpA/fHmS9yFQJNGru3+WA6t3ue4u8YkFatZFV3C26M?=
 =?us-ascii?Q?ZSYvOI50f94PG2xg4O+r4QO8s+Yi5CUJCRYsBN2UjKf3itkM4sf59egXwU2u?=
 =?us-ascii?Q?rqGAktTFXmUVOq5ScOMgvWEc4V/guaf1c9G5I9LbHt8JizSxcGOgrN2PKyfD?=
 =?us-ascii?Q?TjnX2axDSrKCvovz6DF9LLDK0GEfrnWCARZSgX6J3QavpT15PybMUSCtrSWH?=
 =?us-ascii?Q?gJSnlvDXcGlO+hnAKy6bYpmObE7JREw9M6J9qBBi+Sentz/iEeVZmCrGT2WZ?=
 =?us-ascii?Q?kf6SFTSP3IdxKC7it1zTZlrtDpjXuQUwgjObJmkpe13Z42Deo/yWHXCgvtLJ?=
 =?us-ascii?Q?X5FJzcEdFma7kM2vvnFRfT6QA3zrTAJ9+2Eseqw8BdNW8xl2JpwBR4GY289i?=
 =?us-ascii?Q?DLnKcXpT2jln7xBsPJTTAIfwWSL7/rGgOesh2o9V0/YZtpODeSvHMAzFrxys?=
 =?us-ascii?Q?tG7HCHpFMSwNJkCMFjD7OJTZG8mMUaPZdRahUNrHcmbZpW4Qb9SdvRKhdGNn?=
 =?us-ascii?Q?ri12lEjuqTVwK5R09M1kWUZEPOig60yzzk4QkwOwzIXovvz4FZXL1c73HOBV?=
 =?us-ascii?Q?uwh5AvhWZ0fN1Wm92jJ20zzalnpYet80LWqoJG8gNaI+W1Z4ZqofprcrHVDw?=
 =?us-ascii?Q?aj6lYBrMC8rRWa7+r5kT3Yi0X8uR4mY2rwmDPaE5jaJoyvZJq9H5wa0vVVLl?=
 =?us-ascii?Q?NoG4f3KDKPRER30fr3Y7x5SPZhwNbFg4ckkx7r9Qmdu+OwdExKw5WSOpICa6?=
 =?us-ascii?Q?0c2Ri0NeSPEl3ySzoPhDRxvh6rdZjWy9s/O2488xydGOKYwXF4axGzhB/aCf?=
 =?us-ascii?Q?TFLCyaDYCyRutHddBAilZ4bq8gHpk9LxeAH2pByXlWKuAu+KrWWibb2V4/m5?=
 =?us-ascii?Q?3MPJxrOyWR3U2vw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PcpsGoXelwXaTuGVUwZ79YsnjYo1o+VKaVcWULuSE88il4urcOljU95XbvfI?=
 =?us-ascii?Q?WsoK8DT+yyLUmMgIyJJ4ux+hE2mKkyb9j0i2PWt/OhKEanq5JhThIiyAW165?=
 =?us-ascii?Q?lJoNWqw2aPNlgVSMpgnrFeUAsujB1mhTx8QnY6KAZ13Z1+PvGSZ+NpF48sxM?=
 =?us-ascii?Q?Lwuwua45K387h68ctuZSZMRy1QPToBSEosuKe3761xS3QC0YWPRQd+Idw+OO?=
 =?us-ascii?Q?iMsb6pxeAYyN0ZArnjg7tVTQ62Jep3qNaVavFokhI5yzoUmVST6gFPl60QBL?=
 =?us-ascii?Q?EdMmcfL2rkIQjnGLhSpRQxDZDaW4wLk6+nIrw1qb2Tzg4tM/ajGRTuWHm9+6?=
 =?us-ascii?Q?FUxWJ0wwXwzy2NRYPSCFibp2IZxXgzHOb1wzg8/MbE4Ogd3/HOFuBgOOY5ae?=
 =?us-ascii?Q?QWXdxyKWg/UdjEMbn7SkrVW28LcGfz2Q1ASoqpLWfYst7k1k3sfxn/ugbBqq?=
 =?us-ascii?Q?8JKMHr9I9j3GK6PtKue2pyIxXhaxM7bxMs0vYxe0GTV3IRZps4eU8b93yXwS?=
 =?us-ascii?Q?eOyUAnLi6GQOb6H4NrTM8tBKbnjfhiTbMbNSEMcIIZA68VWx3EtMO78Sp0Hf?=
 =?us-ascii?Q?uOseNvyFB6BTRLdIvz8AUfNADbb6NwhDPEHpaV2g7COfewkL7FIfxVhLPJh9?=
 =?us-ascii?Q?HtD7mErVy+z+zq7M2vv4Ft0R7BqqsafxY4pxB6TjakNvEkf0/da21HoBBPFd?=
 =?us-ascii?Q?wabze8JVDVTuMrWZcPmzAfpNyvX+RAwfsLvTcmA32kA2DE+zDHdr6e1LsUGD?=
 =?us-ascii?Q?G5QUqq3iuX6kM0t7OIeuUqq/pXCiZEthyiAb+ydMQD6AjE3tz2M10MjDaJvn?=
 =?us-ascii?Q?lUh73523h3HSwdH/2pNTs7R4vsnmpbAiz0rGHQ94+o+exAr48fh+wQ1NvDJz?=
 =?us-ascii?Q?xX0I8jelz2d55OQh2zUWay88icDvkgJhjUo8aHPU+PEPuCQSVvitp5UWJvgh?=
 =?us-ascii?Q?qC/m7vazZ4kDCHjMWhfPL65OM68/UhPSDdf7xtRbC9oVIMzkCB9xQPf/TOAs?=
 =?us-ascii?Q?ZcC5dTTt8KFWn0RjTsKKxavEFdXUsgN6HJcR5izyQkRHxgCLA2/luwU4H6Qd?=
 =?us-ascii?Q?rYXfy8/DcuuKkGK0UODFX3WdLwOzQVXH6Yp4zF3fn7KBu0ARrIdPdWkM4uez?=
 =?us-ascii?Q?OTY3b/vsVHY+Oag9DtFqDLXEy7JOI60iIqDdWnZNbtLVQgizB1Z6Kady+FAx?=
 =?us-ascii?Q?kX+jYHvhh9NFGUZvLC4F2cbsAYs6GHp8+qksbNPrFcO3Pd/id49i0JQkxS0N?=
 =?us-ascii?Q?MAibWBx2gj6lb0FrhP58mksl7s20gbOo4Bqh+E57JW4mXuwRl1Jy36YrAEyW?=
 =?us-ascii?Q?7Yy8AgTLZeA6slayNgQ7p9hX+jbQbJJqVgEp3dRTk+SSpXbep6NotK/4Yh/e?=
 =?us-ascii?Q?72Q07pYVyX5Juw8UpOOSHBzMLR5YpmgzI81CSndboRl1l+P/EuiVoOCMsM9P?=
 =?us-ascii?Q?w1WcfhSp9ozGlEeclw9v6zbrKvd9yNv8nnRCALdF5uVxD6AFb79zvd8n0/MU?=
 =?us-ascii?Q?oyYtIGc7C3oCLmZEq/ju8tgb+BZw+FcCpFMts9rgKY031ls3vRpEptEAnj7k?=
 =?us-ascii?Q?gneXRoyRF8SIoxY7OH2vI1n6IRZju4RJZsRSMalR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99676667-bfec-45c4-2963-08ddde297443
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 07:32:58.5736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vpNxwu4pOYi7AeMygTYyCbCBQXJ5xGCtJ3bnscMsHRbQVQEQP1+h60JdCv7k55eUmbMGtN9+BH2DQw9fjrs0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9878
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_003306_915883_B119D729 
X-CRM114-Status: GOOD (  10.76  )
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

When waiting for the PCIe link to come up, both link up and link down
are valid results depending on the device state. Do not return an error,
as the outcome has already been reported in dw_pcie_wait_for_link().

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 868e7db4e3381..e90fd34925702 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1089,9 +1089,7 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
 	if (ret)
 		return ret;
 
-	ret = dw_pcie_wait_for_link(pci);
-	if (ret)
-		return ret;
+	dw_pcie_wait_for_link(pci);
 
 	return ret;
 }
-- 
2.37.1


