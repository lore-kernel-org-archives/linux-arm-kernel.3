Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809FECA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4hoICXspjbXDFVNZutQtThFTnDitRvTpECHxitzqcs=; b=kLz/hhWhOLHrv/az1/DWJrHPm8
	Bc0AjkzEvzUl5ueR36QouTn+IdOBRYnUoEQIvKObGGkkKmEE0itpNMj+O/4NdxQInEKo+a+BHsXiB
	+XnLC11qbnY5AdWj1L84MFUpKb2Sy4hlNrCaRWOP30i5IK+Y5XUendL2lpbQXzgB9sNS0IOyEDFaP
	AdLotmD0RzjfGePgIANQuLv1yQ1kP1/RlHJhG/LzCTcj8yOSv9B6Yh3G19wvzlaprGZVtbpKYj/4Y
	d83CfHzlRkv9Mqk6Drtaa81Ig1xYw3UI7EBK9mHaVQgEKY3ZGNmIJTn0l4wtJbLzT0gw67FET5cOE
	qenVdLJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhf7-00000001vu2-2lAN;
	Mon, 08 Sep 2025 19:36:25 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvdPS-00000000IIJ-4BPO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 15:04:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxvzjiSt8qeetfbSBEVW9L6bWSzqwJqKLFWHC7UIOsV++59CDW5paxlBqFVamsyG4/dbCUviOPRihw8CgLZfCmFQVbZ7SrVBsBNfLeS/ruzlJ3dYWBp5/jG5Tq0XByWV+7b3igkTxO7GQgNI5u82lXNlK3FOXda0GhxEwJH2ZNjf6NwELF9yHgk+zMcdzcRURQI11KBm5fj3IBgorOZua50Vharyp3z/vPPdU2ZV5Ki2gq3PXEDQntrrI1emSqxsoAUdi7DOxaygvWHIMhJneyKL+U9kM3/8CXU3oR3V1gel52lJmNVNXB+7riI/msY71H00LfUTWWYJhAbcXuf/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4hoICXspjbXDFVNZutQtThFTnDitRvTpECHxitzqcs=;
 b=YrPKAPih4obyTjlk+iPK95BGOy3AjG2ajw7CDq2THOJLVaqdss7EP1Jyw/RlInldvnscI6K89Kq/kdhK9TYBtKYBYvpKUqF3rkC38stej75tf8NCFjNwHhCW+z+QfyBBKK9Thbx8I633JQ9vYFpks/yoSttm54pAAD3x22ChXTNJJZwoejPfTd48VrgEqZpCMAORE/t1sUXg9YfrzMsRLVOlQ9c7OBJwcNvQLAeLVAacd6VmoD2YiXS4EYnxLPxw8t2oU2gAOfLhdntCqDDJcbG/wXP2WS135sOJ5FefwCF5AIFpq7I+TK4KUpiMe0iAzjg0/NoEyNJbe9A8Xu/PYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4hoICXspjbXDFVNZutQtThFTnDitRvTpECHxitzqcs=;
 b=VAES+e36vtIqQuLGpwlfz82YT06EvcITeV5bQoPmpEhKNhdpcPPE68Al2p/mBpmZUnqw68rIkbPGaAuG1AkG2pWIkA474ReN7yCvpTz4zzB6r5CK3MhwbaTUBSPSYwAxWs7zBroYJbqoBERvYsCe69ElmZIjYM8KpJIuTeNTPlb5Edl5a1A1SsbfGEBzVrbRu+CugAFqMgWHatxrR07T89MWDmy4iSEO4GqV3J519VJEa0CM5HRZg2V0PPI+9uWYC/J7AXcdpHi5vERRuGq2f6j9zrvgVZ7KtcIIKa45zBxOp0sfJoE0kUaG/3wiAh9QbUYKxUVyJY5F7GHbLxw2Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS1PR04MB9238.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Mon, 8 Sep
 2025 15:03:54 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 15:03:54 +0000
Date: Mon, 8 Sep 2025 11:03:46 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] remoteproc: imx_rproc: Clean up after ops
 introduction
Message-ID: <aL7wUp3lS9E1R/gQ@lizhi-Precision-Tower-5810>
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
 <20250908-imx-rproc-cleanup-v1-6-e838cb14436c@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-imx-rproc-cleanup-v1-6-e838cb14436c@nxp.com>
X-ClientProxiedBy: PH8PR15CA0023.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::22) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS1PR04MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: 8162e767-ee64-4df4-2097-08ddeee8ed45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GFeFRUjlC/vq1RnJj6cmf45PBsmaLn5In4mvGXwOwxc4cvKWnadQP4lcHs6g?=
 =?us-ascii?Q?WVYsYkU17X6967/neGTzJaXgbYHm5+GEHm7Bi5HFdhOYTq4l9y+aIHay89QF?=
 =?us-ascii?Q?eBvsY768k6DA/Klfy1vKEgH/3P4KrLvHn0vVje+2MVlvyj6IaTqt5WS3W06o?=
 =?us-ascii?Q?WfzMOudsBxIvizz89iZWz63yHZB16HoTK3OtTw91Rd4u9KZn8UxKwkZ4ahJv?=
 =?us-ascii?Q?71FGq096FFVlWxsCzSGSE3M4vAZyxGhEEt0zLoG07v7ZKMOj6/sNKMtESzmf?=
 =?us-ascii?Q?KX5HsZ1d2BLQ03QmQzu7PO4YA0vjsfHg57YA3DSBBsjQIXZKWn8UUEzw4IjD?=
 =?us-ascii?Q?RcRJcvNZi3KCr5kdJqjCRT3yBOPdUz/+36qvLHW0Esl7dv6Rr/LnkVIXs+16?=
 =?us-ascii?Q?vdncf+bvoC63lYvvmJsrcUQpFX2LkE8oeCCdK14wn+dEiKIy/vebU737YD8+?=
 =?us-ascii?Q?U+LqX/mrHaRAdaQDSanEL/5NzwSpukwlIgZPPRfCSUQq4HTHiEayq9+lPnTu?=
 =?us-ascii?Q?IXoGARmO0dktVCp2KxRoTk8oGAKhAwgRyIvxq6dHop4vG72GJRVgPLp7spEA?=
 =?us-ascii?Q?SHuLVDRCgoBjnFjiEUZo4K1CDDg2NbFrXaN2HTsKkq4mCh3QfL+FKXTT8Lqg?=
 =?us-ascii?Q?2XcGj7HnQOFkAZOAYs4xDkc0plfm3P5PFPmwUqViK0a3Gfch4EoZpl58jm4D?=
 =?us-ascii?Q?uWvp9kIP3+hVQQAOmgHMZldo5L1aawowPrfiotpGSEDuRhO0VQZlR3XwPfv3?=
 =?us-ascii?Q?cpzz2y9IIpTmhwYCeKoO7sNzgeAg5M8zZj+ZF/Qgg+VGNM0QmcMGCYW1crnh?=
 =?us-ascii?Q?PA+xoqUg2QAMhW4lsQzAWhdj58jc6DgcvGquV77Ag2NXKL3NWuRZ2P0E3nZY?=
 =?us-ascii?Q?x9ExE/Pl5+VNnCkGMwukY+WMawIXfpyGh7Rk761uwiBYSv+JBk9c1f4nhmop?=
 =?us-ascii?Q?SOoHM5wDHvdLuuS5HiWsKIqaRJqCYebNyQ+Em8jbwTcX9yQVNdjTOlEbWjjZ?=
 =?us-ascii?Q?PRrTlvh3XHVbv5oR7OARxvbfp2ybH1M0FlR4PQdidf4Xuh0VcYjaFBhMLObx?=
 =?us-ascii?Q?XWzREygxm8Ksgvm4Brx9QmM0LNe9WUiphjRu2uyTMYfXN0O72MGm3e4KnueR?=
 =?us-ascii?Q?iBAu+2w7A9XzRcluOHbaNCRBAnUZaKy1XuJdNt0TLFCsx3otaKHw+PcY/lUH?=
 =?us-ascii?Q?zGzAPqXnubADV5wHylQLL8X1hdfrjznDgPPa+MkYfh88GwdYja1DJzCsOJ4g?=
 =?us-ascii?Q?IFCwTtyN5HoKg4DXScwjHOHxgi9QeS8nqZO4xhQmEZkiwx2wAsHKvgk3N9lQ?=
 =?us-ascii?Q?GrdheeVgfXvPh6EwypngMHgmh/nvZFHoABHja07XBOI25UuXBpQFDq5iKpoj?=
 =?us-ascii?Q?cqBiYxiWwlB1M13NjE4fVIOK7tJAACKwffIkhQtpFtlFjZ2gfA2X4yGCHECY?=
 =?us-ascii?Q?cZX9Pew7VMNcjDtThfHru9riNB0U7BzBBxjk2JgXmID2XRbLIfj6Ww=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1FVbaqH//p+lo40wVwh9Rz/ATbfo6j9inqYqzy8V0doC4VqwuyPLOuNT11uc?=
 =?us-ascii?Q?5MbTBdr5riIUxyDVFcH18Fr1nJqc3+1nLqRHpO+JKwyI3RCFl0T+kwTIIE8M?=
 =?us-ascii?Q?Uca+ZQKheW6Xxf2wtzJ2VFVPeOxS1Sga7cagvXgMz450rfOrL/LPMaB2qloe?=
 =?us-ascii?Q?sztIxcv5FmHXyest2f4QT0NMgYRYvNMiV5WrjuiUzXrANim0z2qYupwtTNKA?=
 =?us-ascii?Q?+n+1lchLZxk/WZ/Fq6vqZJ64cRddbNV5JqVM72mVG3KFaX31WAHrf4AdjbTE?=
 =?us-ascii?Q?Vg7Py0TtrddCMn5lFB9DVCPrG5P+ACIf1GZPZS2Ij9oo5ceOM6okJl/xm4TZ?=
 =?us-ascii?Q?lOUSXdLlsyufp6AJwj6skeKd4XVIas4P7LWuWtUcoF/ZQgGSn3dKByYgWnCf?=
 =?us-ascii?Q?oIFGM9+3m1AY6/IETPGk7VLgDzkd7iOIaACXAE3Gpd+9FXti5GDISJlcwmcB?=
 =?us-ascii?Q?KeFXOPZHjCDHQ46zzxo9p0yRVI0gQzqL7S38OiFj6SfO8augpmYwmS2BC0/e?=
 =?us-ascii?Q?uuSKDULNKunK8a5QZVcrK86peTysMISCPWsbRgJIhmcw2+YQkfy+1+YxEPfo?=
 =?us-ascii?Q?G74By9+qGK1pKxBhCJ1TZEu4j1g5zhksCm5eYlRVX1mJfpwBTjTBmD+XUp2F?=
 =?us-ascii?Q?PSEoMk26Sxeui7iMrw9frWYkf/C2WT3oABX6EtBcHDsvbjaQ/5s6lI/Y0XQT?=
 =?us-ascii?Q?83fquDds4epBAVZgb6v4CoXUK2CWWrRmF5TI+1e69QaO+FcT09A1MSy9IlEL?=
 =?us-ascii?Q?kCzc8X/i7cCFb9/SVgGvIsJ8+jO36ONyRygm8fanaar5bX6S3vWz8oXtK8g7?=
 =?us-ascii?Q?pRVuykKwwJhF2xNPoy6LFG5Q1uvyqgYMYGPyojChYVaAaO1KzEiqwxbSTEmt?=
 =?us-ascii?Q?q5Gf/bU96iG3xHw19Bb/VN3RhWVsV/qCScAzV1kffs5PdG74WaeOOrGkk+c+?=
 =?us-ascii?Q?HdfRfjrVWLFEA9323pP2XTIwh6Y2wIGpFmrIGQ63ss2si+stCZHFG71CKA+v?=
 =?us-ascii?Q?dKZYNCdn6N6QAbkTGLRCX5WWLCmWeFeTvVqkaYcPUdvO4q21V8hkXLoJ6eHa?=
 =?us-ascii?Q?D+dMvMmJYd0QFdsUo9YlCS5t0BSWpGa8npxMGNUkpH4pyEZfNEAQ0s7/5UnZ?=
 =?us-ascii?Q?Xze6f0ELoosz4HAgKdt72Ug9QiiGkVgQJtPPixcwLjBeuQ3lyN8aiaLBqM+W?=
 =?us-ascii?Q?e4C8sg+kDe4ywlNak8KDcLjJ3qwypwTIaUL5ZO350nip546BAczEZZHi57KL?=
 =?us-ascii?Q?AYKqixxz95aop5dxpwKJ/VUEih6iMT3D2jHagRh59fSct7y/vgrqKvFMlHhH?=
 =?us-ascii?Q?B9uEExO8Gv4IqIC/PtcEy56YzmTh0sAyDC5KhuvD8mS0wz7R/ptL+AueCbxJ?=
 =?us-ascii?Q?tUibY2qgjKgGAR3havfPE+L8mc9mh6lQY1wu/ZU9QDrh+qbHQcbhRbysZEi3?=
 =?us-ascii?Q?YV6mK1xdJ6s3e0ctw/78GRu1XcDO7L7ZLzXTWkJm4iD65PPoUdWPBzKJ0RUM?=
 =?us-ascii?Q?qPCSr7sUE6sMlaLHt8iLsNNI/rDOx1jKvHgGtCtpj8z1BigFnwzT95FfBEmo?=
 =?us-ascii?Q?BWMuxVhbLqEaO6e2Iu5x2Ry2DvgccBuz5aEqBCU6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8162e767-ee64-4df4-2097-08ddeee8ed45
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 15:03:53.9383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPn6O8f5Cjgim5nNXlqisVGDLba582nS89lvsHmz8AoZDusdkTLJP4k/f8gkxfnWxN85yQ9E1zUuQj+MXZjZ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9238
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_080359_036617_23D393FD 
X-CRM114-Status: GOOD (  21.77  )
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

On Mon, Sep 08, 2025 at 09:07:39PM +0800, Peng Fan wrote:
> With the switch-case in imx_rproc_{start,stop}{} removed, simplify
> the code logic by removing 'goto'. The last switch-case in
> imx_rproc_detect_mode() are no longer needed and can be removed.
>
> This cleanup improves code readability and aligns with the new ops-based
> design.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 25 +++++++------------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 5fa729f4286f6ac939357c32fef41d7d97e5f860..ed8395b097d07d02e5323550ff497819f9b95ad6 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -323,14 +323,11 @@ static int imx_rproc_start(struct rproc *rproc)
>  	if (ret)
>  		return ret;
>
> -	if (dcfg->ops && dcfg->ops->start) {
> +	if (dcfg->ops && dcfg->ops->start)
>  		ret = dcfg->ops->start(rproc);
> -		goto start_ret;
> -	}
> -
> -	return -EOPNOTSUPP;
> +	else
> +		return -EOPNOTSUPP;
>
> -start_ret:
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
>
> @@ -380,14 +377,11 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	struct device *dev = priv->dev;
>  	int ret;
>
> -	if (dcfg->ops && dcfg->ops->stop) {
> +	if (dcfg->ops && dcfg->ops->stop)
>  		ret = dcfg->ops->stop(rproc);
> -		goto stop_ret;
> -	}
> -
> -	return -EOPNOTSUPP;
> +	else
> +		return -EOPNOTSUPP;
>
> -stop_ret:
>  	if (ret)
>  		dev_err(dev, "Failed to stop remote core\n");
>  	else
> @@ -1000,13 +994,8 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	if (dcfg->ops && dcfg->ops->detect_mode)
>  		return dcfg->ops->detect_mode(priv->rproc);
>
> -	switch (dcfg->method) {
> -	case IMX_RPROC_NONE:
> +	if (dcfg->method == IMX_RPROC_NONE)

Is it possible remove "method"? Can you check dcfg->ops->dectect_mode NULL
here?

Frank Li
>  		priv->rproc->state = RPROC_DETACHED;
> -		return 0;
> -	default:
> -		break;
> -	}
>
>  	return 0;
>  }
>
> --
> 2.37.1
>

