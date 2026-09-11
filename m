Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211EFC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dm0ZxWVlBf00DtwLWUFPm318jdQuDR4BkBJKFUw4IUI=; b=TrbWCnWQQYG5Jda9xbV1BJ6Vo8
	jtAt/f8gf3bI3FlChK7bK8ybaXUfYBoDrAAmKcwGA8+q5mL39iHVVHtg2srmCIB5z89nWcptO6xId
	ieMH3bFQM6dDFqlnGY+E6K/uzw06Q3fuTFO3iP2ob4VaGtpESqNdosMgJ0YCrjy3O/2VRGvgjPPlK
	I87VKtPUnogiTMzxjetJATzwI1P0+ljJCv1Crb2aWXmo1uVlMt2OBQNvLhj75PfW5KmM78exkp/cb
	YEJd5OM18yR8FiRBFk586YQUdDNzvTC5BOMVDgZ+t9mAEDDZTrPv6uY+qE0GIVTIYAfeFul/2HXNx
	5dVCWmxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52ki-0000000GzOe-40wT;
	Fri, 11 Sep 2026 15:01:20 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52kf-0000000GzNv-3iK3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:01:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnSG4WdEIZ2Ad8TKSbLEb1CVULtsGUd5bGn3dpOg6pn/z1+a+WPTzPrLO6vJczZdn1dLc6JLL1UhYcEr3md/vpuhauIsAPpyvcACrPCqkWh2Pp4lztAeTJjIVMq3k8FiRgcq6SKqxgMIb3ImWKLdjjcMUzF33MKGeG/tZgD7sWsmmr3lBuupuTtgvCMOimSs7PzKmVKz4MoauQxdYFpSL2v1ZJZSXpSysBtOKyYCkqKXNj+qgr+jKRZ5y+CJdZ5ybAO/vBl5MYRCEucl3PIGqDgFwxXItDs5ArcL1JkN1PjQndGbmtuzhix8ECFMZdpzl1SbxH/M4XK3rZnX+FG5Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dm0ZxWVlBf00DtwLWUFPm318jdQuDR4BkBJKFUw4IUI=;
 b=uxEzESuxQLvDWo884No0SEs5fFb1R3316ZUarwxOmzXXbAd2/nt37rjrPRpeghqWyjGV27Iu4/7qC9MvOalYYcYOfqj0RIcAzyoTtFWHwQCy1mtPt+/sSWyWUpsc4r+pCm7CeavUKjFtcLW/vAg9abMCZNOIhfdqXlsYlB2/kPwamih1e+pZfabSXEpvmfqXPNIKzfHVJ6s1ualjkKrzC6EzqA7equAUwRzBbN4wXmC8ApkC+F2P7fB3QSxzp4mzpnNEDXv0G41eTKYTNM+LlXFxfaxd1RF/v+xXmJw0ecK7b7lAbsNWCtjB0PNiu8r0a8+YyNEkZRl+2ZbtBlX1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dm0ZxWVlBf00DtwLWUFPm318jdQuDR4BkBJKFUw4IUI=;
 b=vaWN9tmZnygjniVWe4OLNxy9J0nUl3RbtrtLwpyyS0OySwfh8rIuIdk5Y8LjPmknC43DFiKYNI52RbDBO+/YS+HhmhRfTWTIiWIlEBn6UM8yM9goB1gIQvjRCijPw4UNmcS/dLZD/ny9D3z4Pd2FKaL90hgAh3p+TdKMjrsRp8FOxhjA6S4+R4Ar/GVTM7bdamAkkDQnT7miSa6FTf2dCuGDO85C/8rNSt2P7p5gATFCUSbsabevwtYaKUBIXy693eBl3XUlChFVXaUzEU3ryzB7fmD2jkgwNGNX0RrrGihyAvm7HqhJbojP2CYfpGKL09nQ1FAQTi9rGFoGbMbuPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS4PR04MB9714.eurprd04.prod.outlook.com (2603:10a6:20b:4f8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 15:01:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:01:12 +0000
Date: Fri, 11 Sep 2026 10:01:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: ulfh@kernel.org, frank.li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] pmdomain: imx: reject a missing bus power domain
Message-ID: <aqQXrwU3nD-uo6FT@SMW015318>
References: <20260911060929.94481-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911060929.94481-1-bolin.liu@seu.edu.cn>
X-ClientProxiedBy: CYZPR14CA0033.namprd14.prod.outlook.com
 (2603:10b6:930:a0::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS4PR04MB9714:EE_
X-MS-Office365-Filtering-Correlation-Id: 0923ecb0-73f9-4df9-c6b7-08df101584e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|23010399003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: WOqiYbk4TRjcCn8An+3snis5yj49lun/3IbRBV1DnhsBwvIJzqg8LmPT1cQEMYf3EGVzsL9LwBuz2sHZQDWI/KtJWT7iVDNf0Q85N8om98XoK2eCu4Bh6ZldvX0qMPvRBWMSdeMD9/KnfnXqaNuKRVNnxEiycCEjN/cazJJkKrhGHoEbCwm1EsjlfBqVr4GmBDFHS2q2XSndDTuQ4bOLNgeDJ5KanRW3Vpy1VgmL0MQcd9UEJ2rKgWQdfvKHgLQNoMNDc/LKGR6mybH+t2pa9dFCU7wF9R77KInBU8NCuK8TwGbanLPJyFtZgbcEqxC8HD1j9FpsVFJezorG6IAWNYcBaHhB9ZtLc3RPsXF+rk0HiYsv74q3gY0LPZhgv0llR1guV1NPk3R1CyjbccSgK/PmL9c9rJQJBHisyWHaDi3At5sqG9FUsngjMRJ2R7R5FYqz9O8/lQxDyqv/S9x7ljeIWz1svQfzF2SoxsB3/Sw340I4NJp+xQ3MF/Nm4tFxF/ODLNjB7BdXWTIePXGhDIDcSH31a9XurYXyHxaECbXyhG++ckbKHwtn9k+vWyvOweVbZCAPDB1S8MmpdzoayS4Kun0zJW/ehdMV3pp1rizUMbGSnylAj3bTXWpQgzPOb6ZkpjlHtgZTo0++oZCq2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(23010399003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HpGlQTnlPYJGzWLuvCiQ+Aj/xED1GsHc75s/hMdlEXgDQIO/iUWGAz3yMgvn?=
 =?us-ascii?Q?z8x+EzaRbDz+MDuoAcE7lfRqdzmXh6Y2EdGpXeQIg649DYKTe1jVqxWIChxI?=
 =?us-ascii?Q?n/VBhzxruTKKAwnZVJa/vs5qs3IQK5/Cszpa9f/O+WK3zl+kjeeDs00SZcQL?=
 =?us-ascii?Q?gJrZUgMQdM443dhE0SM+m/pfPPNxNfP7gaBiCTVQa/QSY4vEp6VJQMzBYN2Z?=
 =?us-ascii?Q?Hyun2QBMld4oQ/TgNkHofcf3t/siz9/oA4LQHHYxuJxMAzrPJ9a2SK5wVNek?=
 =?us-ascii?Q?xXOmRd9kc2SxUR06beLcGC45hj3gW5CIapO1xdwR5YWYPWKPPGyB+zXOzm6F?=
 =?us-ascii?Q?ZPDc/GbeXADiy/mCICmzX/Nt3FExjptnSZ+74D+kBdH7AXRaZ7qoCYkZUbIP?=
 =?us-ascii?Q?u/i16uwqSE/z8ymD/1pLR7kap9EujxiG7XsNyg1WYQH+HN7itK8kDRSDxXsx?=
 =?us-ascii?Q?SC3e/3NKmDmVC6o8KpOCYEYReeZ75xp4C7FVaW4I1QRa9OQBOkt0ZZzCjVv4?=
 =?us-ascii?Q?vSIs+8bZxH7U2dmsJETjqrnvxHEOlEq1g5LE/h1xFkzpERBomu8Fg1l+I7f+?=
 =?us-ascii?Q?zn+RyGrtXe7Upe1XJ/W2+6akZQnlozKDftbvzY51GbhKeCy9oqfJUbH+mKWN?=
 =?us-ascii?Q?0cGVVrbn+9tw00cSlim0+5CcNq11Qukmfz4hm8PVRsc/sFAt7EoIw3v2Ftt8?=
 =?us-ascii?Q?5Wb3HSvNwiKuyapm40MZdxhWK6JYxU6AXaHGrRurNN5FfLnzVCknlV4PFmTs?=
 =?us-ascii?Q?b7Degl4rS0x7NQchVNKGNom/FMjhFafE8Gmd4ni9gSbw9BXh6rq54nR6QkMR?=
 =?us-ascii?Q?BOe/RcmpsP6VZuVAuoCS3dh+J8Ky8LJ/RJtzp9Q162v51nhmdsaqPfzMTECH?=
 =?us-ascii?Q?HoSxDla4E2skgJivxH21F2egE1mQAQXN0vLmVrGx8Zivw+LNB+Z5uDeCmQHN?=
 =?us-ascii?Q?Ia9tBF2VZw8xvFHjYbrKxWfbuZG1vKrpdkk/jmdx2oOb9SXhvO4Gnke1cZKt?=
 =?us-ascii?Q?eKqW99BCWVPSGxtJqEkVn4lSMceU2To2UVJazGwpJEca1KiNEIhKFxPtwisy?=
 =?us-ascii?Q?Xxg2eOjyhg9AIZ5p1QrrS+iI1AYozEXVhVo+V3x2/qdpqIX5nyppbYMQ8Aif?=
 =?us-ascii?Q?Y+tvqUcvo5z8DxOBzzB8sc4VD4C8Tsu3LKAl2ulgFVPsdIMOeiF0fybgge8A?=
 =?us-ascii?Q?l+vQMRS14K9FQogH1Vo/JYlItnKS+pmvGaGwDRmXQuDu/dAGcn0HmzuEhN+M?=
 =?us-ascii?Q?cq3YXJ56ac4cIdKPV3iPuHHid01S3J6ec5EOOqHCWR2Np5Tji4q38+HQqxZt?=
 =?us-ascii?Q?96vDibe/m6l1MI/R5UNjKlPMmvUPg72qFkII2uVgpivoPZCiADOmhMOV8m3d?=
 =?us-ascii?Q?1cwhCUDRgVQNMEPfetJaU9eJCYJInbHmt1npOB7/HJ6LZk3zqkWdPlGayqJB?=
 =?us-ascii?Q?odV3DCZnTCh07gGpvNp51CxKn5HRwzLdyP9BARNFmYHV+1Gw14Vuz7Rh0zi+?=
 =?us-ascii?Q?6tyw+HvIZGHu2Ijty/Rp0viFSJEyCnVh+7RqTSbqzsorHYunM19nOd+t4pyY?=
 =?us-ascii?Q?UfC19VwifWqE5ox4GQRiDbWmWfISGCQygTFCvu8pKdl7kTipcR41GI1mhrMZ?=
 =?us-ascii?Q?cASZZRAYfiwxX7k/Iy1WRySR9AtjxLCqrY7Ax9QnzyDTOMEnfRZHG0HjEMK+?=
 =?us-ascii?Q?1rnwOypDlU5YMY4TPgWvaEslZNYixD1TV0cn75cuyNSzH4auUJ4Kzl6fDoUe?=
 =?us-ascii?Q?K3Ju0L5D56plPzKH+CYjqXyxz/XGD7Y0s+buPvZwWDtdVmkwH9b4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0923ecb0-73f9-4df9-c6b7-08df101584e5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:01:12.3004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FV3vm63r02WtcNAZNSWwd/wOkfqH2aCP6/nbuPg6uQs01SmG2Q7YukGAWKc3rV0JGXYUxACLQvH62eAh/2yJSBvehVLCOV5ao6YgLUKCAHhIp5c0v8vezjRoWKyPFc04
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9714
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_080118_504258_989291E4 
X-CRM114-Status: GOOD (  16.44  )
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

On Fri, Sep 11, 2026 at 02:09:29PM +0800, Slavin Liu wrote:

Please remove RFC for this kind fix patches.

>
> The named-domain attach API may return NULL for an absent name.
> Treat that as -ENODEV before publishing bus_power_dev to later unwind
> paths, without changing the handling of existing error pointers.
>
> Detected by static analysis and reviewed with AI-assisted source auditing.
>
> Fixes: 2684ac05a8c4 ("soc: imx: add i.MX8M blk-ctrl driver")
> Fixes: 556f5cf9568a ("soc: imx: add i.MX8MP HSIO blk-ctrl")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c  | 2 ++
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> index 479789009c7f..9653a8ac9a6e 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -228,6 +228,8 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         bc->bus_power_dev = dev_pm_domain_attach_by_name(dev, "bus");
> +       if (!bc->bus_power_dev)
> +               return dev_err_probe(dev, -ENODEV, "missing bus power domain\n");
>         if (IS_ERR(bc->bus_power_dev)) {
>                 if (PTR_ERR(bc->bus_power_dev) == -ENODEV)
>                         return dev_err_probe(dev, -EPROBE_DEFER,
> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> index d255c20f58e2..e952b4ee75c0 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -655,6 +655,8 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         bc->bus_power_dev = dev_pm_domain_attach_by_name(dev, "bus");
> +       if (!bc->bus_power_dev)
> +               return dev_err_probe(dev, -ENODEV, "missing bus power domain\n");
>         if (IS_ERR(bc->bus_power_dev))
>                 return dev_err_probe(dev, PTR_ERR(bc->bus_power_dev),
>                                      "failed to attach bus power domain\n");
>

