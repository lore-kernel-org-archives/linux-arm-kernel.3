Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48451E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 14:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S+jChTCJwPGrCPdeerhQwgeECj5WLd9F0Oc1kEcrKfY=; b=J4ofbek8V/9qowddFxlDr/6YG2
	23DVL/oG5V3NX+pdj1auNITipeMP8R0TMmutBVQ2XHy4AZJ13mL26oCYAnbWgU7ZpKzMsiFCV/jBm
	KrlR4fE6LWgw2tI2EET3RdON0/m2y5eFmXbzcAMhrCszNMdMp2GbLyVHldl8eJ7GdJ8ElS7kNQuIR
	OLxNy+RTQ+4AAffcKQmdrl+MtfkpY+3FZozdUhiocTSNuigWPcAVB17d8n0QmfBIwjnNTyRDplLNV
	1ZZM6dsTKGRvOfWVmST27fn9X1XOIV06U1MEikaYnrTlpVPowESqOfXVDlBmOvZM1wgCc16T76IsY
	QiW/CSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHt5-00000002631-3nwV;
	Thu, 19 Dec 2024 14:52:27 +0000
Received: from mail-vi1eur05on2062f.outbound.protection.outlook.com ([2a01:111:f403:2613::62f] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHrz-000000025yT-0LAo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 14:51:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPn7pWOh4qLqtx894o+OZm+Z/O91l6M6LTV48zRnia/oW4A/9CbMq95vG3Ftf3ufugijMF5DFsRNLe6tyZ2rNjkQF21Wj3OzffqaDhnlDfE1mttRBkL5v64p4BA8UHU4kMpe1+eRfAkV1lT1HK+PcXKLE5k2mhq/Y/LdiVeZdR6MiqzN4ypPsrC7XJ8oEsKe6GTMSJD3l52j0PWm7Z80wjbAmX/hpmNMp38QZf8pWHCsSiIP28hivRw/rIXvfNeqeW/gjrCt7dkR36b5Z7Sq9aTsDo7ajnne+tlwLPsWdWDByGFwq2Y18tP88egFnKMAEJ1f5u7HUqGjZuZvp6y1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+jChTCJwPGrCPdeerhQwgeECj5WLd9F0Oc1kEcrKfY=;
 b=PBVYAxLXg+XSRDFHDGG8RSqxrfq94PQg7R3DuYeCpebc47HGg0E4/Rd3TBDcD3BvcETzzqGTzaov+QWQgTGSYgDSErd88G3tTXYJeGz+9nsShdWM5CxZIDAjjplU3t4AUimfwqZ/yJyiOy2xUDAVUGfiTf8gixSjAmY8xNu1IKM0HAAPENRx3KjTqzLTcNedOy9CrKCDSa1qSDX1t3JAqNALJqXWneI/TWmisoFcacvyjCNS7FK0ZATd5ZIYIGPCH+j1EEiRFZ54Rb3JooI1lG1ljSgLSJdJximYiIm8I97YG3Adxy2lrhxROZOHcJiVcsl2yoyW1/o3FMR8sxL0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+jChTCJwPGrCPdeerhQwgeECj5WLd9F0Oc1kEcrKfY=;
 b=fQbheqpr63HyrCB7o129AIhe5ZzcsQGegvff7wlByAVfT7Ou+mBCyawY6irt+6OSm+FIpP3j2hAklVV9KL8wuQotHZSRIYkbsK7IZj7kJDLug8SU8C+1IyLTLm/hZZTHAtOtyWHxucB/ZBjQaiufV/mpTZ+aoVPU9Q+1eTXiZ6WxnnBQXHcsYxYVUv7DSBiSu1fEd9039Najog66NGngdGmG+07ewRUkiAjfLTaH7oWWAMKbalXhzl8nkqvWSyl/vQ377isg9+e8hyYzCx8GX59c86xBgVrBLDrleB0MI0hH3OPg/335388f9tA/3uAwtjJ3mlYAS/HKXnr6+B81uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 14:51:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 14:51:12 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	marex@denx.de,
	Peng Fan <peng.fan@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH V3] soc: imx8m: Unregister cpufreq and soc dev in cleanup path
Date: Thu, 19 Dec 2024 22:50:29 +0800
Message-Id: <20241219145029.1776006-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: b077191b-770c-4bec-dd9c-08dd203c94e1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9gh8QtvGD8j+x8LnWrYCDF5OW0oLSdXYVaqDFJ/RscGP66Ph68NwP6tCtWcV?=
 =?us-ascii?Q?mXz7kapiOavczoj5CvIbc+itC4hiIHKllgqZdHfqmhEC4cPmnLnIIvoip+3u?=
 =?us-ascii?Q?V5QGAlZBWEpkIX3MmkgfYoMRHi4KQRp76oGZeBbtvFlLUlaP4CsV4U7BsYNS?=
 =?us-ascii?Q?PdaPJhOleEHbrb4y3q8HlptpPIrLux2v2GavBlB9Cz8civGw3O2G3VagxbbY?=
 =?us-ascii?Q?kqltZH4E3i4k40gIcZqhcYu5UD/lxrNTEu+ioDcp0XKOCcmFxIcFVEDcGkKQ?=
 =?us-ascii?Q?6UEWf7y/7k0g1ySXXojksyYBpjX6SvgUqGWgm4Mf1oTYU3BnYnEpvU3gY1rS?=
 =?us-ascii?Q?YPVR7fDadAc1YsRbK0w3Phv4rWUdP56dgAbRNgjtExN7RPUgSNvcJd5XSmfg?=
 =?us-ascii?Q?34WNWHU0dv/UxivO6XqvVYuI1mlg4q8fLwzOJbze29WVCe+wKKvSOZkMGsfQ?=
 =?us-ascii?Q?4y+7+0Pu6PXpZMLNQNr5I/bvGxV2sXDwtaZHMSQ2MbkdW/fxhKMOaeHuvbKc?=
 =?us-ascii?Q?yMX0Lsm+10aFBDpkTJS30mUbdmHC8CePcerR2BzmDNLo/t07l4cIWYgwTiXE?=
 =?us-ascii?Q?E1dhd9znCOFlFSLwgycxBCTD9PMI2EbfYlVprXMJnSPhQXKCq/Xj5vXqjt9F?=
 =?us-ascii?Q?PuhKzrm70Z6MCTbdh0nvUgHHuEP3S4P5owAXIo6QMGLzQs4i4MbI0JXN3vIP?=
 =?us-ascii?Q?VzABFD+djFEHNa2ZfnkCMFulyMDznLzvGxDU08dsrBjZ57w9H92KHjJ5iqyJ?=
 =?us-ascii?Q?pxKisrMWVqnK2mJ/FSWQEl2JcfRdZWjG4yqFQ5uZRvkxMQwAAoyyfs//ME2C?=
 =?us-ascii?Q?dwmhcT53ufhhU4oWUdbA9w+MswEwIYWBehCexoPp1oIQ3ghtBkCLfkC4uepG?=
 =?us-ascii?Q?zexVlUYUuSGj3g2GtWxllaqKoIZd1L/ZH7D5Y5BDkEabu73eKEYomENpSJYB?=
 =?us-ascii?Q?7V9aY/A9gD4V4LvAIBxLycuZFe3HKJyXE8zn6yaaJ/+DlM80gpXOVyUJkCLj?=
 =?us-ascii?Q?QEXKLLOc0kB/L4oKoQdHrcoDHhtJ/yuH3/85ua2OOaUCbuEwz3iK+KGtneC8?=
 =?us-ascii?Q?H9X0bJoRxijOXscd6PVEM6YUpRG2R1utFf9RNCkaTe2CCKLeomwvk2e4F7xT?=
 =?us-ascii?Q?OJNm0uV94/8J4bQwpM6ddlNE/l9atVucWFMZu2YM5KESwurQfpd1Me8U5T6Q?=
 =?us-ascii?Q?77yRRX+DdD/518uzfOvu9nFlOi3vFXMwAvfOuARwDCNouIpVpGWgHPSXG/2i?=
 =?us-ascii?Q?CsQKgb35B2Lrjc3g0k8dkHhApCiX/B/04N1ImXTGkBnbjBUvNycJy/7RCXeM?=
 =?us-ascii?Q?xLpEMo/EKtRLz08/iGO0QXP3dlv/SDSN9NW9gaDE9B171fCDCY4heDCQw7UC?=
 =?us-ascii?Q?27PfiYnJGCv9tePkWYUgFpcFgUzWUJ579ktvFNXB3L1GHlxW7JjMSVPKOqB+?=
 =?us-ascii?Q?VTv/C66vJfS7KzR07VZE25+Ao3cK+aBr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o1BKRj3n9RvTU+VNYOomBX0EcKQa9fsEUgpIavz5gcJzfYPbVh5K2hJ4RR1e?=
 =?us-ascii?Q?6Dv/IBgaQa2J6VHs7c4I1ofTScYPT0oZCuNlH2MsOJrdtmR1RACFdYKKECIq?=
 =?us-ascii?Q?DB1pEHEEeX00/MiEkqFNRZqoOYDVsRPyZ4cnLQB/Su1eAAze14kQ514wd/Z1?=
 =?us-ascii?Q?DhwJ7R0wxaPLvqRtRIOJ8UNrrUPfNvKkn24eXP09gbnGdovobPiLXaKm5/b/?=
 =?us-ascii?Q?YDVCMLKkcwyXdotx4SfhGpYN+PewEn988dJhahuPCo7OJ8LFai2Ahk7KCgHY?=
 =?us-ascii?Q?g8u5SZOeN6cq+an+1AX6yuQXl5LgQuyXz8yxuwJK0lQJiChcHBNhSwnQyDse?=
 =?us-ascii?Q?71Xb6IkAJaWXgTUD5Ct1rizCNYU7fUJSgmmz7bAHCEcoHKrM7/togSBB+9Tv?=
 =?us-ascii?Q?zInjcLltcOHRJYR7694XEBaK14KPFzHiHHTPUPcu6k01lVSkKrkUh0mJXaWq?=
 =?us-ascii?Q?PDWMYuesgnbeqTWXOlaHzd32I0t6dsL9LQSrtfvJw6QE1FTEvq2gIKCIbCY7?=
 =?us-ascii?Q?IVy/K0f60Qn09drYo3Pr/E9doohFa5UKcaFcon7oPh23w/49anOq9r/J39c/?=
 =?us-ascii?Q?8aJWuRUqbl17jZBt//UdBrizdQuNS1M3vT5l5biH8jdVs4SxRydM/IGHr8/9?=
 =?us-ascii?Q?j3mpvyVfDtdZ3cXtE0EjqB6mkDF48lksqZ6XfjVUKsvG485/j06bmWVydF6j?=
 =?us-ascii?Q?6HVcTlXgY4Wn6SyP8kz+xgxvEE9+s9LTshBHvIk7V8vkjg+qXN2WYSiMdgKm?=
 =?us-ascii?Q?FoXwUWVs1FeIvDvyN9IhfbzkmJw6Ksp01fKjlWPWanTseIl8qbGQfaayRzXk?=
 =?us-ascii?Q?m+O+Sqi0YToze1Tof2hFZoJEEbvJL9RWLS6h99dG8jvf3pl7jlREKz+b39+y?=
 =?us-ascii?Q?wsrc4yTAQ6cOwIzv0AmqASTPF57qZX//pqprz4G9adntn1sLSZHrbAHfkE14?=
 =?us-ascii?Q?mKO0uuaBI4/KEUvNmMD3J/J06gXB2NIprkRMa3jLePfVwOI7pVrreK1Hhi1k?=
 =?us-ascii?Q?g/4Rh54Jh+HVoat7sJWqaogjVnEd83fMi4Xr6FNVYUd6sKZ/K1VuzFDHJBez?=
 =?us-ascii?Q?3VTub2dMup3Md60CkCZBscriOjGlS0X4HTMIZfBWIDx9z62I1W2OwXivJ82l?=
 =?us-ascii?Q?4ZvcERuFRDBFrGTp8v5yapHUC6LumdHW9Hlg9ewpP6hDIyuPYRC8FN/cLaUO?=
 =?us-ascii?Q?q8wURPpWivURVTO8SUW1Tw36TKoKhusrwWICmtXX3qTEs4X3aK/x6dQwqdM6?=
 =?us-ascii?Q?bBsnb1HRzEZNt8+j/4D2ovjyaBaBzc4Ll/XgUqvlI41fyls+M1vuZdWFUW3H?=
 =?us-ascii?Q?s/AEHKBFdResnwiczEOig0uiSc1WHC2Mu1EC+VAz36jziNjC3yfjAWvvjVLT?=
 =?us-ascii?Q?yj1t6q5P4345WkX4iMFtmCiHg7xqZib+6jTmlaVwdB+aVVKESenYD+KlXYnP?=
 =?us-ascii?Q?jwmxa/T5BuDc3Iyrr9V2feel0a2UksWWZRNeFe50Zqom7reWdMYPgrEIxeXS?=
 =?us-ascii?Q?KO3e7iKx5vNnJWTIOuMW4ICsEX983nPWgrpRdTO44ODvf8CmRytLBRloHYTD?=
 =?us-ascii?Q?+4eOWi9/N9vkORF86IcsQEISwDPo0FQI4iCIhUJ6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b077191b-770c-4bec-dd9c-08dd203c94e1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 14:51:12.7409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQ05nSwGF/6cXubUMARjL/PM8fFSvePBMaRgvybB40FO3HL7OQvbZxyIjPh6V4aPFXFlUhJXXxMrlAeKIu5pAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9444
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_065119_126169_D28EFA30 
X-CRM114-Status: GOOD (  13.59  )
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

Unregister the cpufreq device and soc device when resource unwinding,
otherwise there will be warning when do removing test:
sysfs: cannot create duplicate filename '/devices/platform/imx-cpufreq-dt'
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc1-next-20241204
Hardware name: NXP i.MX8MPlus EVK board (DT)

Fixes: 9cc832d37799 ("soc: imx8m: Probe the SoC driver as platform driver")
Cc: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V3:
 Per Marco, drop remove function, use devm_add_action and update the patch
 title accordingly.

V2:
 Add err check when create the cpufreq platform device
 https://lore.kernel.org/all/20241217015826.1374497-1-peng.fan@oss.nxp.com/

 drivers/soc/imx/soc-imx8m.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index 8ac7658e3d52..585631b7ae44 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -192,9 +192,20 @@ static __maybe_unused const struct of_device_id imx8_soc_match[] = {
 	devm_kasprintf((dev), GFP_KERNEL, "%d.%d", ((soc_rev) >> 4) & 0xf, (soc_rev) & 0xf) : \
 	"unknown"
 
+static void imx8m_unregister_soc(void *data)
+{
+	soc_device_unregister(data);
+}
+
+static void imx8m_unregister_cpufreq(void *data)
+{
+	platform_device_unregister(data);
+}
+
 static int imx8m_soc_probe(struct platform_device *pdev)
 {
 	struct soc_device_attribute *soc_dev_attr;
+	struct platform_device *cpufreq_dev;
 	const struct imx8_soc_data *data;
 	struct device *dev = &pdev->dev;
 	const struct of_device_id *id;
@@ -239,11 +250,19 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
+	ret = devm_add_action(dev, imx8m_unregister_soc, soc_dev);
+	if (ret)
+		return ret;
+
 	pr_info("SoC: %s revision %s\n", soc_dev_attr->soc_id,
 		soc_dev_attr->revision);
 
-	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT))
-		platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
+	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT)) {
+		cpufreq_dev = platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
+		ret = devm_add_action(dev, imx8m_unregister_cpufreq, cpufreq_dev);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.37.1


