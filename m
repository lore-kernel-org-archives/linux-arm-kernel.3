Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E28CCDB466
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 22:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqIDM7eNMGf/sbZQigp/QdCXOuqojD+pqn2BS3MF40s=; b=nBzixdoT4vusH/XplUIscJDX1i
	z4tPUAQPerbJrJq51LJ8trm0xAaIl5Z/g+PhsudQl6FC13p0W3bCjE8wTQ0WYSUtsU81Z/i6mHabX
	2syqY+3IJuW2nXXyoJkHNM7j6bnfOHKp9yiKbPo1ndb/Y9puERYBBv6l5Z6IEHgc6qONoQxSn47f0
	MUvC29mwYrjHy5FHqMq4fPMbHDRxknSHQXUbGOdaOgc85cGi5Kl9xckjzV+jfb4U2F1MDoTI8MDfN
	NxiSMt40x8tucR9uwYfBq4L+O+Nz7YEjI6SvhD4bOc3iWUaIrXEMmcnxui7R4NwXFOtdFoPNuktq8
	qnqlQwGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbQhz-00000004DI4-1dQ6;
	Sun, 21 Jun 2026 22:32:07 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbQhw-00000004DHi-3jM1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 22:32:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9WNMcvJtWtll9Ci8ww3YqVnn8/zBsKvtTol3yABBYDg0gMq5z5hVEYs1O+vMy9BFu+a9V/TRmz9D7fiSgbmE+fOUpIzKgZDZ8uh2mffiTNw7rUxegw5Sl8TNQ7S6ul7g0mb1oQWlCx7PcTJ9H0bk3Hy61t02EuZMKvdxvRtj430lBZyLgkk1uJ4Ba705APMlBbaW3Wkt1CvKFYJu0LfEAbpJGOWWG7GiUM9/b0qEsrJ9mBjE8BfkpSv/+F+jRzWBgMTnKHvkn+LKTq5I1JmP4wAJkKqSlNcd6MoRriuk/RJdYNKRck9USMYayX8JAJM6rvoXre3XWJOEfNcVxz1nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqIDM7eNMGf/sbZQigp/QdCXOuqojD+pqn2BS3MF40s=;
 b=xiLttUZZwkEWVVLD2icbA7WIZM+FQJkMftJkNiKfMxwslU+NoFjqxzu7yWHvomQROLN6RdY9M5+hpGL18K/sx1pgqMzRcEt5R/48WvkrlTDlL/gBqNqezLyZVbPE7WBO7SYBMU5UBIVefJUVVKsglALQoyyWdyJNFrvEcqseF3TlF7lN8WTNHkJ7U3IoDZZvBzIp72q3WYqovlsY50YAwu9RtT6kEMCZHSvy6T0wzbV6QePaCGTOg07mBKaIBuctj1QGjwVaM5+wSb+wipwpqaFDvxX6l165+yc6KBtBwptsTbhRGzBhKNH2BfJQ0WQ1MUgzUgHAuJBmtL9ziKtNSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqIDM7eNMGf/sbZQigp/QdCXOuqojD+pqn2BS3MF40s=;
 b=RsSclkQyoxbRYKQyZd18U2tK19wQG/mqICbQJIuN0IEnw7UP2RuBjW+M1ARk9O6Az2JnQ6rU4xDSprd/4dhhQPAANd+TePxlnE/oQ8RynzIVbytOI3Ca14DSCmga05EYPTaqY8YPXUDITsGOAVlSs4Svu8ag4kjbfMTkGn/rWyvz5d52qhuNEgrkT48v/rPqjCZ6dtcu9nnHCPX35XkDdMPITR1+fMCKeL1i/HE05FDIlZ5dZCYLzaTHjh8oBYkqv40EKGSFZJeSmVblDYLA/r960C02C4IyicJ1X6xeouuDbYn5tfLyJs/3Ax7uLvB5pcqFspuzFoR5O4UII0mmUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8530.eurprd04.prod.outlook.com (2603:10a6:20b:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Sun, 21 Jun
 2026 22:32:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0139.018; Sun, 21 Jun 2026
 22:32:00 +0000
Date: Sun, 21 Jun 2026 17:31:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
	stable@vger.kernel.org, linux-crypto@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: mxs-dcp - fix source scatterlist length access
Message-ID: <ajhmVvEz6n-eRuGN@SMW015318>
References: <20260621192615.277957-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621192615.277957-2-thorsten.blum@linux.dev>
X-ClientProxiedBy: SN7PR04CA0105.namprd04.prod.outlook.com
 (2603:10b6:806:122::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: b941d7c2-6b80-4464-440b-08decfe4e8b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|19092799006|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: snQ7T6iQWuyio4gGjDkhr1DXDfAJQB6G71TYVHQK/IAT3DXFEwGTs2Xp+gqRAi5QcLQ1da1/ZmFuY2bh7JxXgmd7gQWmwYu2oWZZsvY6f4SaHFn844PqfnSppYJ734vfbob8S+fRUAN6AT1IZQFl1Hz6ic0MlWHmazviqK/UX0L13sCZdiXFXQ1XfwAnHWB5cH6GaqlOftrdSiafeYYMaPp5iQrWAQyP4Q/xH0g5M+EB3hrw06OjGLILKck1CRW8NY9qtSk73XapfCpPS8+yfLNhKkOenByehBr3QTl7d1OehNKCcSomI1ng0jBFmvUgIxBtVxiB57N7nDay6xfj4hAq+JYM5mulBrH+idLsWukJ3sXCw6QPyxpvqC7Cu5o4ZW4cTf+JQUsSeVkC73FCsFwqwkXFVkjV1qV0IPlZN7cElC4Vz32PfU9dm2BCHCYHz0B1zKjtXiTPcgZVqelFsxBjhpJFPk6bJWXqRZOBU3S+EM8D0pXjDL/nUOuDrXpvdHha/NrGtND9AEJxEp9jPhFiZbb7J/Mtoe5ZvBndSSisXkErlpjdyq552XVnqMEmrN7WQhxcOxC8b3RzRvAX7qX+Tsx3ISoLAWGwM04lmlZmy1Vv7V6UZCl5EUnW+zboRKgIYUZu4JdHPlukrWsNWWNFbX3bqvWKqIQY7KWU9X0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(19092799006)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EQKIhbDdqjCOQ01OKhIdOWxwcyz2NFwR6EcQERYNs+vFmy4Xeyb8FJ7w1fTW?=
 =?us-ascii?Q?vhjtK/0VBjWLjf9R/5wMJsa8aimHSymBhksVPD9JiTthP4N0wX5ZyZYHwvfT?=
 =?us-ascii?Q?l9acRKflom8MXGzt+G1NHkAqv3E3KoekEdDhBlpob3rilgS4DcqIKPKA1UBj?=
 =?us-ascii?Q?YvLePJGD1duVDr/ACulDM+OX8jPpVFKRKEx+3t5DzBZ5l2T9k40EPKSOOdTn?=
 =?us-ascii?Q?sbsCLJcYpFUi/hH14yCR/yRrWb9+EW0agn7i/pWF5RV/mP44NmYQ9R7+aR83?=
 =?us-ascii?Q?A6YIPzflXAsjI+oDuQF0XvdjSNVumgHHxiPuurb8O95lZadQwIPgYTVkIxqK?=
 =?us-ascii?Q?Uh6i0UHRAl0z89sqYJtNyZka9W6ZL4rMh1+xDYm1fzzIX/ChYnE3L3jVmJem?=
 =?us-ascii?Q?kTVSFI8S0Hne+L/EAyn2bhVjVyAqHhdgqu+ODHKFKSaWr/a37wZ70X9mM6oZ?=
 =?us-ascii?Q?1HQcFYUJ1LKtA9P2nr1C6IlKN9sj1xKwYvnW5cFCcD/USBtT9e+88JUf3/EB?=
 =?us-ascii?Q?dvX5RR05D3NUN5jRaLc0cNuUQH4kNubzigoCKcqdLZuOuwSReSGU75GgqIvt?=
 =?us-ascii?Q?jMA1/ozGLkbaQXVYkf4feZsVZwrKHQ9C9w3HvwCTrBnaHld2Xo8YTesxTWKz?=
 =?us-ascii?Q?Tm6KGoYEdBTGA4ll1y2Nj+auQBkFmuNImi/1IvYSee485mhdoBzaUSS3x5sM?=
 =?us-ascii?Q?4cqVqSgoxwMfJ39luek6y8h9JBTyT9mphtZcwJ9aje8EmGf2fUK5U9D/V9cB?=
 =?us-ascii?Q?GLlDYr5YsIRYiuZZk6CHpqt+cTTfiImsfbznqsQiSvWhRUCiYUE5JaJvCE8w?=
 =?us-ascii?Q?W+w/K58XNQMyfQ/7yrVFgbRBsn6ADf6cQWLFBkolSmA/2QPpvf/pupdtnmNe?=
 =?us-ascii?Q?UFuY0DamcivuYLsRW9D1ka2hdrtMCx5OQBWKNHw+BSFTbOExphm+wgoHeO7K?=
 =?us-ascii?Q?zQIqH6sbw2aooS+T3AhV2gxEMb/7EtPZWwo+39dEcFaKu29awnl0iDTnOwQ1?=
 =?us-ascii?Q?1aWZhY9Z/xA/cg/6j1sl3tjzrrUPJE3br4+LHywLTBaZf6WtyFb2a842P2qH?=
 =?us-ascii?Q?Y4JZSQYa4yTAukx9ht0ggw8SYlVVH+iulAB7iHcR8/qF5RSBDsauUyvBxcB2?=
 =?us-ascii?Q?JQd4Ih8DYsfcEOT7673dRA036v1P+umXNOE9lr3ToLbvVd2EYQTxyWZKUGvX?=
 =?us-ascii?Q?97spmUvlKOPd4NGszizeCTqysrhC4jP1quzkOSrlzffPLWW6Brm7q0UMsMgV?=
 =?us-ascii?Q?qy1JQyyfAeZUEZcMdfspOcz3/A+FWwqYP/fg34a9p+Eh6E8MXbtsXo3N9Ny+?=
 =?us-ascii?Q?zoRaHbQKyR8662Ta5eYtu3mBnzKvsC4mn0xLK6sg2xAb9ryzHF73hePDLV9a?=
 =?us-ascii?Q?k+0GF1tKHZBKz4mma66lnSwLMS8MwQ4M9KDicyPyfNyTo1fLBPquvduN7Izx?=
 =?us-ascii?Q?eIEU6/AxbwlVplVlPyqvN7zxWyHiweW6r+UMQPa8YWaXeDgS8w6ptNl+kOV9?=
 =?us-ascii?Q?Tsqw5vyiXkyFJqBzB4RwBM3slSXxlxgNUmsB9C87JD4REWKMXl1JdLSBTvfP?=
 =?us-ascii?Q?k+tYRT4x6fQm44+Z7pg2XK7vvA24J8Tf84szXUcqwB/h6kjtTGMsEiimEbqU?=
 =?us-ascii?Q?nOwGQ+eST84EY+HzKYSNTUSXFWsOMJ/HDvuthKm2r7H9yYEhJDtLFbOVw81P?=
 =?us-ascii?Q?0BUtqt/7jjoVi8UdU+GPIQHs+0CLyeAh8Vc/e5qjFO4AWEy1YEFqcUlNt6rL?=
 =?us-ascii?Q?l2DsaJyWOPyVdnp4iMh+abI4Cyx/EJ9xyrJ1NQYLjoQUbZ8x7HYf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b941d7c2-6b80-4464-440b-08decfe4e8b6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2026 22:31:59.9799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3z9AxOeCz1e/7xBCsvXZyGv/nqS1XJVIBA0IM1uC2HQelaN5Sgf8+2x5qbV7a1faL42defpxKvKhRD8og5QGCbntH8uSvQrdqUOrUpOYPOmgWM3ftjcqG30MPgCyJoqa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8530
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_153204_954846_2F2CF595 
X-CRM114-Status: GOOD (  15.62  )
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

>
> mxs_dcp_aes_block_crypt() uses sg_dma_len() without mapping the source
> scatterlist with dma_map_sg() first. Therefore, sg_dma_len() is invalid
> and could return zero or a stale DMA length, causing encryption and
> decryption to process the wrong number of bytes when
> CONFIG_NEED_SG_DMA_LENGTH=y.
>
> Use the original scatterlist length instead.

It'd beter add some description about copy sg to a bounce buffer to do
descrytpion, needn't map sg firstly and direct use the original
scatterlist length.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Fixes: 15b59e7c3733 ("crypto: mxs - Add Freescale MXS DCP driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/mxs-dcp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
> index 133ebc998236..595b2fd84667 100644
> --- a/drivers/crypto/mxs-dcp.c
> +++ b/drivers/crypto/mxs-dcp.c
> @@ -353,7 +353,7 @@ static int mxs_dcp_aes_block_crypt(struct crypto_async_request *arq)
>
>         for_each_sg(req->src, src, sg_nents(req->src), i) {
>                 src_buf = sg_virt(src);
> -               len = sg_dma_len(src);
> +               len = src->length;
>                 tlen += len;
>                 limit_hit = tlen > req->cryptlen;
>
>

