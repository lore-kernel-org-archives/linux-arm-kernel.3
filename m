Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEB1D58E7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 07:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OnxIemEz11r57VK8e1dRtNVvYPaNfCx6ZWPmiTflAbo=; b=ZwfanfZ5A1by5nHuylXaKi7R79
	cz9xm4T2ObubjEqxMTdTFdC7X65SPrSmZ9KwiRR2xVvqRcXdh1mRKOkxoS1jkeeTg/8LIi3e3wZwG
	ZGKxt7hWlyyq5JYlbGGrkaAEtYKijX3o2ucBfrCdet9ekNLioF99uQmxVG5sS/zBEARaxYA4S7GEw
	ic6axayNIj1IfqDEDseV3dWJw+0vVK05D1Zoq30TKDhSMNcj0OLoT6VhRRxWwpJzIAkBDQtjUCZ2q
	midEXLFQwvePLuoaNP/Sk8R1R2CyMuQoK4owoA9/5ajtsUXy150HTAoZbcE3McPCk0bYDNGjQ1TtE
	LIpj/SwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyBT-0000000CRvM-476p;
	Mon, 02 Mar 2026 07:59:20 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyBR-0000000CRtn-3RTB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 07:59:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJHIJu5zbetLsmk57pnkAruYbfJAykKVeBZ/PK1y0SuTN5r3Jctpn2r0d3MoY8rugCb38bCQrQrXxlpxhjIMjmrf6vT3RcDeocrUIQKFOPrvD6yMNLkWvAEPcda4gTCcuLIO1WpH7WXOSiCs9yE/7jIN2AfMT0tci1a24hfIeNRKxEl969wfjFOP1zyG9YvMQEQzoIrMv61QNe5ZLnaQmFyJ5NmuQTYWRnNnEutjPS8cxsmgpT0A81sWyNSfNtByf6Fo605xpWrZdGeKexABfbw+TmNG3JcGhpoVJKL4BDpqI5swn+imvtZ6ON2tirBacNaC4QnN0edTwUP6d8qjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnxIemEz11r57VK8e1dRtNVvYPaNfCx6ZWPmiTflAbo=;
 b=fBkiJP729bU4EyFdxg19s9dqvVOzSPqECxgxYoeQu/HZlT44ITtPINaevsmrfm2PVh+mQ+cBh0r2N+PL1xgfXDTjgyY7RsgRpGxlIqcYoBlhlU7PRms+8ExcaqROSSyT0+FhQ/fvCiDu2ifUAtSOm9lR/0IV1sIp1bXnV76HUXxVUgCMybRBTsydp/q7WlrnD5MlM08a1K5vhDntOJQU7Rqn6M6T7k6v7WaNDTLMPbCJWeyKZVrn3fgH0gQuf53+4nfRJ3DquhtCT+xQdcGh3SiUuS+CI35nGsE1tc5C9DtM4iTcGgFLOsTKvySGvPrbCrbVhhBHuMGznft50qB2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnxIemEz11r57VK8e1dRtNVvYPaNfCx6ZWPmiTflAbo=;
 b=lSZtzUkhsyH2IPPOa599R8NCa7jR0zNhgT6glrzwvKBxhJI0HzqFB9sgqc4UaHERHO3NUaXFI7dzs9+Cy9EtnsZOX0iAR86P+JwsozFBDK0ID2sULnRqNadTj7r2WeIM3rjsIovhbtMYYfv8WgHm8+PTDgN6fnKCohQpGMiaud5Z0Jltcm5zyuogGad489ufwUTv8cqmv8+/9Lz+O9FBQnNuVpD28rroMrXPqbUBZwHmDFRrnvz19daqJlQFFkkqLe1NeSNr4Ejyfxbbk1290LNtf1nAZiKnum8M5Ov5VDRvd2+l4wZ9YIxmMEjhF77Ns1HP8PrJFrraL81UJmXbmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by VI2PR04MB11218.eurprd04.prod.outlook.com (2603:10a6:800:29a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 07:59:08 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754%6]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 07:59:08 +0000
From: ziniu.wang_1@nxp.com
To: adrian.hunter@intel.com,
	ulf.hansson@linaro.org,
	haibo.chen@nxp.com
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-mmc@vger.kernel.org,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] mmc: sdhci-esdhc-imx: add 1-bit bus width support
Date: Mon,  2 Mar 2026 16:00:53 +0800
Message-Id: <20260302080057.974102-1-ziniu.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0034.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::10) To DU2PR04MB8567.eurprd04.prod.outlook.com
 (2603:10a6:10:2d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8567:EE_|VI2PR04MB11218:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f2369c1-cf3e-4c6e-b863-08de783194ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: lDjQX1Gth84f/6eqPwoCZEsadB1mQqUinX/hBDrCsGDsw+fmP8FZ8SiU09YLLINxUwS3Msnb3fr38hREoSlw0URcrue330mW65gD3K8TUjKRX1mDt7DFsaj/G+dkkh4K3VNQ620FEE3AOBYAhhC5nk8hn/W+q07JCzxggsV6A2CW9UP6LmqC7xI5kM1/UkKuKLiT6FVndInpyWX3mxeebzDlQiWIaUajWwVYlak4H3LoA7CpN+wnsLCGWlqJ4/CAZjeDtgbdx44Tbgmt6Fxkfu5tZSL/mQ467ExDXi/2zZBnRnPY3hBGPsZONctIuPVrsyN4H1b67oAJvJkDTqaAh7PYgAMUr9ZgFcBw13dfoiGfG7J29tkmpk/GGvS6rA0+vGaPp2lzQfVuBuUEkcuLIMAv/qyHRJFCGvMyzd96Jw9rxDIVcM4FxUFwJxnzw7gEehTK/x1/zj4IEvTLK5TAzXK7oIM4a1T4t55tnUBGuCzkn9ol04A0O3cUQnYAx5IgyHiIWtiLUFHe8MpLRF76fkoQ0OgThnJ9jCrtxjGAa1uco/w6mr656VTe56qVEjpDYv043Uq2ZxUCtf5re52iSBuTJgLTjZKOWcrPoVHsz3VbVZMzURX2ALNdjcsLJa4T6MB6FltKMEASztZrUlKsz8qHrT+BRjJhg/EYG83yqesYSFjvst2jZiSmSlbMoG/8zaf+jXAVKijgOcmsQXXbqjx6e8BTOzqYcreQsNfVURynj3qVksJfOqUBUr9RJZbiJ3VfSTccSsbSpWykXO1JxRHRmay1+U1qux+B6NQG+x0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4XpbeCo3dIsMCWsFIitHHEJ1Lli5Cr9b5XCDKWwzGt2aQP/yhphx1S1B5EHr?=
 =?us-ascii?Q?DkK2UiipPDXXjJSHH2I2f0ppAJSihdpHfelsqD4R9mmywC6roBh0rdLxSCEu?=
 =?us-ascii?Q?C1kKesg7mQ2ZWvrTYQOwc+W7RJpX/SdGw9EUmdXDwD4LMKjqrHc++1b2dt97?=
 =?us-ascii?Q?KvAyI4XyO9U8HWyUAMcI7doyLPQY6l5Q+V/k9/f4pBTWDcPwZg/1G3OAkHnV?=
 =?us-ascii?Q?TPrVCBXRQZ6MAoZYwb6NzX4jkKVij/pmcXO3hDaX7YjXxYohQZnKpzpoVQjm?=
 =?us-ascii?Q?Wa9kQmzQVQWajxkDexcFyMRDs06zyhnG0kci2ToEDJhIal7KhWxSyJq1bMfH?=
 =?us-ascii?Q?ZsUavmTcz3po3W7FIfyNuGmodjG6PGhSvUAPTAEoLbIBimqXzob9RjHHyMAd?=
 =?us-ascii?Q?BHBJS2zlOA/YPUetzZ/MUsYctHMtHg7jxzWHrhNC68SPkIot7HLChJZrihs/?=
 =?us-ascii?Q?e3tiN9jjB9dl02TrgOJ+W1tye46mCVKoCPREl0JZTzqTRNSFcSxWuNe3At7G?=
 =?us-ascii?Q?ZmMCehbhFdLmHycygPgVgfp10vJ0LX7vq6Cx80+7NuFBSFdVT2tubSrMaCh1?=
 =?us-ascii?Q?vlI3reFbfEF5zKRsCCZwAqGF2KBcVAFB+kf0bNLylJV7naP9IHVTiJwKxbXg?=
 =?us-ascii?Q?H20zGg4/0Y0CKPpAMfXwjQpWX8Xb/ZJkuYIbYCsXT/AYuiEVmSZOOE5QftLS?=
 =?us-ascii?Q?5RwhFnslin/EUwshthocSQfOt6nGYS4oOKo3wlL993ZYnLRgC/0uMCMldQcO?=
 =?us-ascii?Q?xwo9xAK9JLW84nDXaJmuzXZz95heB2iFFSdEgLiacZ13smFoxwZq8JRwnrcH?=
 =?us-ascii?Q?nc+Bb5KipyjfqXU+m4zqK3+EAHWCSqJtCklo2GdZNH7C5lvfnfwhpqqvihlB?=
 =?us-ascii?Q?wjYzISyYIEMYnB9QeWl7XdOU7yjlSBbr7EkF/cAYAAu7lx2HrrYBAlyKnUCb?=
 =?us-ascii?Q?EGptAz+od4lzAe6XJpnN0ARqcy3gGjBr1WmwTasuh4u+J+0fv3jDBLyfWznq?=
 =?us-ascii?Q?276fUJlq9OXd4AkIOiArImUTsBAQT61s+hMNrnfBw0W6mEa8lyEKtL/NCxZK?=
 =?us-ascii?Q?ESz30x+lVAdHnXCnmTHeTHe3iEdRaAUAuvjpHuDM1kaYhiiSrxufpk6Zyfuu?=
 =?us-ascii?Q?JSdlKN9DNbcuCwuIjS2PQe+g7LB4+dLkgA5eyvAeec2siI6Yo/EVG0TeGGg+?=
 =?us-ascii?Q?7aLBNw6bhgWgqRywbC9hfVyQUfE/+8MtXFOvSN/BEmT4FX59x4m7PIFtTNhf?=
 =?us-ascii?Q?eSagAErw+uma1dEnhvF+TP73fd65MoxjmdDjxxaziZOC83ykp5EtvYYASpVx?=
 =?us-ascii?Q?ufVKCgzwqJPV13vL14tf106X8aglGaKRLo3JLc+Brb+N8+5hdOsh20tHmR5G?=
 =?us-ascii?Q?oJWrhzkbw8SLz7VnXhptTJg9faKCmg/ln1LGJOtvDIwJam4NUKe5WCCZzdLR?=
 =?us-ascii?Q?AaodtzBploJWWC80lXbr218k1yyX5kWIb+2yZg/ckluIC3u4+RCWWJ5TxNPm?=
 =?us-ascii?Q?3Q1YzejHH1sX7czXE4J1JDBXuELIa9CEGJh9EOArXBZ6Z0oMW0fswu9qS7bn?=
 =?us-ascii?Q?YRDULLy2oet12hLGRgGReXbfZGCk0vg28UeDMT/Q9E5+lmcHr+/Or+Klw/Re?=
 =?us-ascii?Q?vAX1lcciUqWhm/fAuqYPqZ0c4JdrwNbYCpKWloSIrPckxxm7Fga4O5lrN+kM?=
 =?us-ascii?Q?90GMewhO0whoUsNclJsWHAnndwMTAjnB7K51GyaA/WAAcK33stZyRgblVLfd?=
 =?us-ascii?Q?WuLSs4J2OA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2369c1-cf3e-4c6e-b863-08de783194ce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 07:59:08.2769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9wF1G2SYefdqSCuLlGT+FZzO6ee3uwuEEt41kFW1ssQamGtPOxm2sAjSHQxax2Pa20lsmHJepj+VUd82wA4uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_235918_027323_BD299ECA 
X-CRM114-Status: UNSURE (   9.05  )
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

From: Luke Wang <ziniu.wang_1@nxp.com>

This series adds 1-bit bus width support for sdhci-esdhc-imx driver.

Currently sdhci-esdhc-imx doesn't support 1-bit width because it
doesn't call sdhci_get_property() to parse "bus-width = <1>" and
set SDHCI_QUIRK_FORCE_1_BIT_DATA quirk.

After adding sdhci_get_property(), another issue is exposed:
mmc_select_hs200() returns 0 without switching when 1-bit bus is
used, causing mmc_select_timing() to skip mmc_select_hs(). This
leaves eMMC in legacy mode (26MHz) instead of High Speed (52MHz).

Fix by dropping incompatible UHS/DDR/HS200/HS400 caps in
mmc_validate_host_caps() for 1-bit width, and clean up duplicate
code now handled by common framework.

Luke Wang (4):
  mmc: core: fix timing selection for 1-bit bus width
  mmc: sdhci-esdhc-imx: add 1-bit bus width support
  mmc: sdhci-esdhc-imx: remove duplicate HS400 bus width validation
  mmc: sdhci-pltfm: remove duplicate DTS property parsing

 drivers/mmc/core/host.c            | 19 ++++++++++++++-----
 drivers/mmc/host/sdhci-esdhc-imx.c |  6 +-----
 drivers/mmc/host/sdhci-pltfm.c     |  7 -------
 3 files changed, 15 insertions(+), 17 deletions(-)

-- 
2.34.1


