Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E13C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 08:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JBDPD8cO/t5MY+dAjmcu21b7vIf2V1aBM6xFio7mzpo=; b=BbUHjxENnZn9990iKRHedx3VtB
	FpmZ11ZN9aKCwRW7F+Di4I2UiyLssucX+05w4nJb/62McsnNJRNlu7pTM1ZUMCls7rI3+7ltimyA8
	wtZyZPYMx2v3MoHa5Q2y5A53rKAJrkWnv1ayf7T3Cderr933N15Yh4gShpDXw/Nb1vU5f8YQ9GC0K
	OA+5Jh9rOxdeovqeyWaJuUTFRv1vvwezW9sgsI8zUJutaQAEC2XIOCrRcqvhN9xjolKnUi+Omn6Jj
	yb/PRSWlusK+sFT5zh72vXinpVtPVFcaxw9/ZA8DJsJ/xagiuzUiKrhubmz/TrpPH7FMup4YkHw0p
	oQFp9bMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRo6Z-00000009PD6-1Xi6;
	Wed, 18 Jun 2025 08:25:11 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRo4G-00000009Owl-1UWO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 08:22:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ka+hx4dOj1zgXrJG5ujrMLpwGI3QGQxyPeu/bmYeSCcxjMkv6b1kR/y8+IHihnX2o9wvTKx3dJbci+aX4nW97UfyycMKHvJrp1kMkgu8P6OeJnzjU3yE7aBLs7BPYbdZMlN51DV1xHcP8xy0F+Rh7Rlzu7xUQpSCy2rBUYHdhHvKZCgKttw/NjQlDkjmuZWGQorAaHI35YGVo4Ht0LcGOQ1ko2rb5a1st9PBaBBmPeOrFwZxIi0ZH5CTdzh8Gr5+AzW3YsZFO1IPffI60hWEd1DXek3jHSYuRTChb9lnkpDkqlglHKfmBkaJV/PjWJgkVAqHzKghd5aG+bqPx7T9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBDPD8cO/t5MY+dAjmcu21b7vIf2V1aBM6xFio7mzpo=;
 b=rWcbA7ijFa9E5o3WwO2tr2CPSI3d7Whxip9n/ALJVfwHQt6NcVBPW/M2XxtzV+TD3MwW+bhpGH+wsh4mFbssGgnYq6uzD6yYsnAhMaoKVb8prpY46GRwExmKJ6eymQAcOPWwL5o7NN3iLoblsOiVKt2uxZtyg99OFVhvLDs9+dW1sytF+4lNlwP/0w9ezvP2Jl4pCGkzp6EwEaEE70cTIvoF8MBzBTJq+I/m61QLiQKvN84wUAyX1+mULjRfQdHUQCZMZZGSWABZXF+JMq8y+3Da/63p1XHXTZph56fykTvFJ3H92F1GbORF0ozK/09HCFDDStORPjC9RTS6/ngsIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBDPD8cO/t5MY+dAjmcu21b7vIf2V1aBM6xFio7mzpo=;
 b=CT311g8hSrDgWoiikFDvPoRRVCjEFr4mgLeCgGPmAGd+F89Fhb3N6NRqaCFaQG5461I56WxihpxDyuXUiXoPt5jIKreWMH7N5beoXqKqnTWYHCmqSoKTrFxw/MjwALQ2aqZD9779RVtuH5QhbKQITs9JP+hdcpnKY/JpUUklWVUbNR5Ldu/1HVrp+gqsrMS9XdFBmgRas1t3CKRQn5zz7D7T1/CV4LMibkTjNPJmCvc/SW9bL+p/Ckx/bazTHVS8b1sRpVdhbTOCwe6RNVLitJbZ8aDl/p4/pzG65lazrBuEshxS9HYrxTlSG/4VUTSHAh4vr/xT6c4RlK0enAeqUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by DB9PR04MB8347.eurprd04.prod.outlook.com (2603:10a6:10:245::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 08:22:37 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 08:22:37 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
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
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1] PCI: imx6: Enable the vpcie regulator when fetch it
Date: Wed, 18 Jun 2025 16:20:42 +0800
Message-Id: <20250618082042.3900021-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0137.apcprd02.prod.outlook.com
 (2603:1096:4:188::17) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|DB9PR04MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: baa56a8c-793e-4e46-df8f-08ddae41487f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zvMkYmAB+YbHL/GASzX5hkZfRvKsSTJvCFAPxI/jJSHVrmetdn560xqfICPn?=
 =?us-ascii?Q?i0fwmWcnCiJh9rROwjQif2wBVuIlz9Gve+6g5z14CbfMSdrIE1rmQDkgxg+M?=
 =?us-ascii?Q?POLAZ45Bqrn7pyraEUig9jqgSu5RnZzwSXxK6nV3VViQOs2sau3OM8VniHBE?=
 =?us-ascii?Q?qZ2xvT/s2CPC7KKI0dPNkbX6+41Lpu+GxT88sdSy4StueUn9xRT7R5ZuU05q?=
 =?us-ascii?Q?SH+OgiTmndB10vDrnojxv8NunEACUOgWfszA8Rgx7n9Lt4Oz7Avh8QYyDO5L?=
 =?us-ascii?Q?kiTi0YzY1XscIfX1F+IShqWj1k0ZgwHHPYo9tgJcZmt8tOMgL4yeRHzE5BAO?=
 =?us-ascii?Q?FIkOxSbY+xSnU5aS46+C8Fv/JeqQ6H1+skYAjwOKnTBjNXv28Hnzi4xFCej5?=
 =?us-ascii?Q?muwvaUjk2lkb89avT4j2rODGzDcz2HxlnCk01aP+iY4+cXXgJQtj23NlISAd?=
 =?us-ascii?Q?bQzeF3lY6Da9Fd9ISlvNb1lJ5A3UH6PsjYrkxOxltFn47MV/49TY+9T07sHe?=
 =?us-ascii?Q?TRJHdK1u7r4kz8KN5cjRfr34Ld07356MzU9s4wwdy8GUfcLgpfUJlfSmu5RL?=
 =?us-ascii?Q?6w41Q4CiT0q1AVj2NmHjzy1VK39eu362FWMhoomkyGhbOxOlJ2Ok3VdOcx4n?=
 =?us-ascii?Q?t8k+a19FRKvfvn5cwxJ7mWTo1YWhVeLpoMH3SuOm0e578MWK0yR66Eb5Jvv1?=
 =?us-ascii?Q?D4lLIJe5bgpDIAWWQJnB3NBpIPmBAWgR4NGG8oA0Wk1NY49Jwa8JswQw4VaY?=
 =?us-ascii?Q?G5uLq3JuJn1T/nMcjt+BUPFV2pA9r1FNSmnZkX4y7/p7V67V4rn6SttGYksF?=
 =?us-ascii?Q?WQC5RfH8y3wJLvFI0q9nbWQKJu6i0MzHbQFyBtkAlV2FQgIHHQ3Yxj0gZJ5o?=
 =?us-ascii?Q?gwKOStjI7xsy5WvgPgO+R6bARE+Y+d75nzZK8DBCDNdeW4Skx6PQmcJJhnUf?=
 =?us-ascii?Q?hsx7yqw180VE/yRqQ9i1m4oqdt6UMM/icqTkA7HNG4VacLVRSz5znqa+Ljmc?=
 =?us-ascii?Q?jLRdoSLGzyAab8/2y9Lgompsimk0IOm4xUr1AN8ovr+Jl3st+kKawK5UAXxw?=
 =?us-ascii?Q?khQGEXclCKFTlBkzK/2nD1MviJ5dj+U9WwKo6gokccVi2Q7A6GhE+a6bb0te?=
 =?us-ascii?Q?qPI8U1Zvmkj3+WYkQS7DzZptbJzDT4rMPy6bNAFBj6rpu92+9K97VY/S2+uV?=
 =?us-ascii?Q?fqmuewhSBLI7K+3JZ4BxVE26UPEgTmxOTSUTp2LNfZ8H4n7/pC4wIQh00cKk?=
 =?us-ascii?Q?+6m1/h8CcDfAynJDm9B+BW4rF6KfQW9qBV3YYvrl98OxKsPpX8l3QkcppwRi?=
 =?us-ascii?Q?V57LS2tnVIfN0/79xlm3OvJj45ihh3SAKvl+/yPNIFGHpduezwr1Ox6cS6fl?=
 =?us-ascii?Q?mMDlWRT9cZaGRaAOmBh+s3/Z0IoeFtl9U+suo3+SFRD6uQDLlmacXIHwZuub?=
 =?us-ascii?Q?pqogV8m5f1QcuHHws2S1vIJg9t6eJEOha4YuJNj4R2qhpz420gjeIkg2A8Up?=
 =?us-ascii?Q?mkirmgUXFwguJbQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iw95Z3RWEsTCOa5+tbe8E0VZArs49MiZJoCzH0T4Da8gu3bewBDgabrp69S2?=
 =?us-ascii?Q?pNhpiFOPkz0TOXiu4kmmDTjC9R2hXsjkvrFaO6JQ7w8CUyIr74bFzrNYEAzF?=
 =?us-ascii?Q?bpWcko9ucZ42Z8x7Ywt7tg0RYityi0kuTwuqcswruqyks1UEzEtp5dZLOCF1?=
 =?us-ascii?Q?Ny27nPLbzlu9PBpStMq4y0yvq9cuso1MF6Yuer3wO52AB/DsGAICynAo2Xay?=
 =?us-ascii?Q?BHg+WGgcIykNLpV9xqfwaxnpbQBhcKbSuiNrkRc/1MjWHQwXCCtXHwv4XW/j?=
 =?us-ascii?Q?61NBOdkoPhOQQvHCazQPJbg+2Grr0fKm3LWLBa6Ct+BchSTqoMnEWQGfJxwN?=
 =?us-ascii?Q?FNgSxBZTtu8PPfTikKW/lRX75oFmAmunbx1kirFHoibSfjYyAEkUIexGDZPO?=
 =?us-ascii?Q?pNdJ7AT8A9h5GKPUhhmVU+F8i8eHKcU2DbQP/sgqL/dyJbDrcs94n7gV2y1b?=
 =?us-ascii?Q?lE0laqMEpyxYHO7wzGyNJe5xv3LfuLbxWpR0Z30T9HYaTjdrxJ0U/a37hFhR?=
 =?us-ascii?Q?O3XF5c664wb5pkRatz02RUekVWXGeARe7zPyGemPMGNlhF9w3nTQpuhuZkOd?=
 =?us-ascii?Q?9arA6MB3lG2kJQoO9A6XxdP/619SnfcjEssJjPZarTAlaB8tQpS/Dy9GPeb/?=
 =?us-ascii?Q?vded4wVGnCZ5W9Qa2rq68m055AxBuxC2KWfd1TsbAG7Q88CvXwrnI2gL6lNR?=
 =?us-ascii?Q?7+phL386JMlp/cMp1xzs1bRjoPn7Ly3ihHWyQNhDRrITutr9+ymftyuoqLqd?=
 =?us-ascii?Q?JueU8bsMVss3E4h+nWwtq/7iqrx4Hme9r9EQG27hhoY43dg0agrgXpROYoR1?=
 =?us-ascii?Q?Dbn1FqNMtKawWOK8lg5kdrja4izIUzMV9g5V7Z6BSLR5FfqstFcRqUxBO8kf?=
 =?us-ascii?Q?A4z4q5mH9nq48XmLcoaYZRou2rqVfAx3ByMp4FDUW8K289ZxL6ZCm18PfISf?=
 =?us-ascii?Q?eiU056gL4BeHCRiY1Wb4lfMakpYF68KTrfBCmeQuOK9EHIaskzHbt0YQCTy+?=
 =?us-ascii?Q?7+5l9GkgAtim5HFDYgHQE0L/CXVJPkMc7rOgrpM9zHPImg6eWOdOU/Ugrdvg?=
 =?us-ascii?Q?JlqFTXtQpWbp8hHccbe6hKuAldzi5OUk/segb8Ss1QUSH95qQuoKiQ9pL6Qv?=
 =?us-ascii?Q?fkM648OuhhN3AnmnXKtioqbXIJxUJR+QAEoFaHXTCs8cZ65qu9tJpT+VnV07?=
 =?us-ascii?Q?MFzePGTzYLj7xvNwQL/CHJqvr0naAJcOmSSOcToz/1BslEKNIExj5pO/SOgz?=
 =?us-ascii?Q?x7mSFUs9H+jyLH24izWkVu3EFEX3HroCbiHDOIiaSbJEpF+EWb2oNec/W2kE?=
 =?us-ascii?Q?0YFFgF41VOKi6Isv5UmGYtUZ4wZNdZ6QwVYn4WDWksswy9qTqO8KTsxzI4rI?=
 =?us-ascii?Q?klDwzeHtnFCoM6poFwM6l7/PyRTRXDie66/zH//d5PZ/LsP+Zi4X20fcvrQy?=
 =?us-ascii?Q?kwSdjZ6jYnpSbJ2K8H8T6FmJHUiOs8tHgRON1x4EfnYProDB2zdmqEgmgpiq?=
 =?us-ascii?Q?ic0SKWv8oRp7mSKmrJ7gkKVGDOH74mbpJvcchJ8iI1QojMbQGDeJEkY235i7?=
 =?us-ascii?Q?CAG+LP/oI5ZMZSpOIe3c2eySDwETOoD70c66NrxF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa56a8c-793e-4e46-df8f-08ddae41487f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 08:22:37.1286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 397j6z6OxT0gj/MxqhRARTWrgTO21JIMyEMFtKLpEyXyxu3WC4N5brx55Hs8PNM8++DP78NhsQnm9U2JWUJxdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_012248_395404_12DA68CA 
X-CRM114-Status: GOOD (  14.91  )
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

vpcie regulator is used to provide power to the PCIe port include WAKE#
signal on i.MX. To support outbound wake up mechanism, enable the vpcie
regulator when fetch it, and keep it on during PCIe port life cycle.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 5a38cfaf989b..7cab4bcfae56 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -159,7 +159,6 @@ struct imx_pcie {
 	u32			tx_deemph_gen2_6db;
 	u32			tx_swing_full;
 	u32			tx_swing_low;
-	struct regulator	*vpcie;
 	struct regulator	*vph;
 	void __iomem		*phy_base;
 
@@ -1198,15 +1197,6 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 	struct imx_pcie *imx_pcie = to_imx_pcie(pci);
 	int ret;
 
-	if (imx_pcie->vpcie) {
-		ret = regulator_enable(imx_pcie->vpcie);
-		if (ret) {
-			dev_err(dev, "failed to enable vpcie regulator: %d\n",
-				ret);
-			return ret;
-		}
-	}
-
 	if (pp->bridge && imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_LUT)) {
 		pp->bridge->enable_device = imx_pcie_enable_device;
 		pp->bridge->disable_device = imx_pcie_disable_device;
@@ -1222,7 +1212,7 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 	ret = imx_pcie_clk_enable(imx_pcie);
 	if (ret) {
 		dev_err(dev, "unable to enable pcie clocks: %d\n", ret);
-		goto err_reg_disable;
+		return ret;
 	}
 
 	if (imx_pcie->phy) {
@@ -1269,9 +1259,6 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 	phy_exit(imx_pcie->phy);
 err_clk_disable:
 	imx_pcie_clk_disable(imx_pcie);
-err_reg_disable:
-	if (imx_pcie->vpcie)
-		regulator_disable(imx_pcie->vpcie);
 	return ret;
 }
 
@@ -1286,9 +1273,6 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
 		phy_exit(imx_pcie->phy);
 	}
 	imx_pcie_clk_disable(imx_pcie);
-
-	if (imx_pcie->vpcie)
-		regulator_disable(imx_pcie->vpcie);
 }
 
 static void imx_pcie_host_post_init(struct dw_pcie_rp *pp)
@@ -1739,12 +1723,9 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	pci->max_link_speed = 1;
 	of_property_read_u32(node, "fsl,max-link-speed", &pci->max_link_speed);
 
-	imx_pcie->vpcie = devm_regulator_get_optional(&pdev->dev, "vpcie");
-	if (IS_ERR(imx_pcie->vpcie)) {
-		if (PTR_ERR(imx_pcie->vpcie) != -ENODEV)
-			return PTR_ERR(imx_pcie->vpcie);
-		imx_pcie->vpcie = NULL;
-	}
+	ret = devm_regulator_get_enable_optional(&pdev->dev, "vpcie");
+	if (ret < 0 && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to enable vpcie");
 
 	imx_pcie->vph = devm_regulator_get_optional(&pdev->dev, "vph");
 	if (IS_ERR(imx_pcie->vph)) {
-- 
2.37.1


