Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91999CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 16:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CLbV4lI6DHwCsnQcpIJmR5CMx8s6/l5kkWIl1KNxsU=; b=gI+iMLq+XJRWzJ7qyb5spLfcuv
	8UQRX5PSXyDNgmsiYOWHXrVc+vATXso5v1FUK9OoHyCw4HbrqD/JpIcvpKPxJW2IqRyNsSqJlgON3
	HwVn6xCOnFJ2veWas5oP5cyvX/BUT1DmEWZTBj1m2IZqxxV5z7Q9FAQN1GrxHO/FiCyGSt0MNIEXv
	2FI/Oe/sW6tFz5ySYIFiCj8HS2ivmukEKro6SnTf8qQqMU42gPEwktCphsZ68nrlpbvLUV74EO9q6
	NHCMf+ua/KvNVBh43fAA52rAZcubp9bBTEmbrZImr6z7hu/HE/S/WjQpcJW7fp1gaMca3ELQzypje
	cnc5xKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJLt-0000000GDg3-0r2N;
	Wed, 27 Aug 2025 16:50:25 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHJk-0000000FmlX-3pC9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 14:40:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kv2chv/CuG7Q0iMgNYoMZkUS/2KUtuSC7pY08GxKPxygB8LbStlndLEKdtGT5Cqv6Lke+OKEjJIZGrAgKarCFz7we9hRiosMzbuXTFL9xpcakQnjcbMXAqXWZwyjkcqGJyVUNfTRFuUhQx2TmSoqzw80LK4SFU9dldF5l1nB71d/cOLjHTzAoKSw8otRZUUgAb1RugqUHloh3EEipHv235ZSvLbdgccnOrvgF4m2svmKixg80Tkve32JRwEwERQqj0d/U5Hx4Fb8Tkq74a9YEjuGLY9GnLGLpe7F7gfiU0cg8bE9Z4235AjQTdJCJWlQX0wWzgUC62wN75Rd2efj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CLbV4lI6DHwCsnQcpIJmR5CMx8s6/l5kkWIl1KNxsU=;
 b=qTxJGx9z6q5vCiq+iTPUwEoQQ3poDf0i1HX3vrlPY9E5HsBy38fiKKAO5i+jZQdlPeSwcgDtoRE56X+u5uO/u7LlQFCa6NNF48Svolgo6rwebSupf7ZdJe2T8PFIudMaYU4AmdswoLjCcDb/4GYlV2Xoh4HiHW+D8kkdjKiNxgZYH+jKpwRltr7erRBoPhBTMAPZ0wesB29Py86cRBKXf+bUg8G+w/TrX8CK0phjjSwtRXcr0+AHWxJn9HyCDYpSqa45axZBfRi5n5OOv6SI4ki7aLnbZNt1ZQJT1+qwlBM6maooubx7jY6NuBkEEztLNrY6z4tstK0dLh+2TB8Qmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CLbV4lI6DHwCsnQcpIJmR5CMx8s6/l5kkWIl1KNxsU=;
 b=H84XFmfs+CkoMMvZVnMCnD0T0AOpte09qW1u4RHZyUq3PuLqqgTMXH58vXLStAqUVhyW28nR3bNBHzvCw8h5GoVGNI0fwxxf/br0kQOp9mddX4hMgPdkVlALp48q+zbTCoJ+0BXpBABER/GRrwkEf7fPmhKsrHtVWkdduMQBAmymGQUsjcxiycbpW5gz5EOaZSpJbVyyVB3ZITg6GKAKM6VdSF7/UtLifgBRhmppJXB2O+3qwkFm5mgmfktSPrZuucaPR+DlN0xoS5DeveO+XwzRq3yKTdh/CgBqneEM+3WNSL/6q27tTALY+mX1EyojVaDe1K0s0WSV7RxH+87xVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DUZPR04MB9847.eurprd04.prod.outlook.com (2603:10a6:10:4d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Wed, 27 Aug
 2025 14:39:52 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 14:39:52 +0000
Date: Wed, 27 Aug 2025 10:39:43 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] media: nxp: imx8-isi: Add ISI support for i.MX91
Message-ID: <aK8Yr8BtF8vDA2BJ@lizhi-Precision-Tower-5810>
References: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
 <20250827-isi_imx93-v1-5-83e6b4b50c4d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-isi_imx93-v1-5-83e6b4b50c4d@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0101.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::16) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DUZPR04MB9847:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d0fdb4-07f7-460e-6864-08dde57794f7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sZsmcLl2/KchBsXSaD6fUsnDa8Q/2iCCyD0upUd+4AQA9NDplG39dh1ETIOy?=
 =?us-ascii?Q?ZGmiXe2mDrnMnJSqozZDSJzM/NztksHodgM8Bvdn6wEKXw1Thz3ZuLCpgsLp?=
 =?us-ascii?Q?paPjBFQWfmIiAV/G5L3tOP6yEkfRHa1e5UzHXobixgz6bn/MbBM1frx9sX9b?=
 =?us-ascii?Q?Hfdcd0AdKWqkldB1pEetDKRFaRtgWnj0QghvJqzKHXFL9lJZE4k001eAhzKp?=
 =?us-ascii?Q?lwf4x0T/9HuKXDFyt8JNRyQfvVtoxLCYrBoBLDtf2FpHjb/SkRfThWxi1IW7?=
 =?us-ascii?Q?91QcKinmzYLX9vjEXX3WHpw0oyhRvqjIz6OSuYlPBc30wpL2xJx1cbMjs2Le?=
 =?us-ascii?Q?DdTbY+IGwRTPwNknZzZ4vBNR8rtRqE31CfJZLBmr3CIY14YsPxu3HvlJ8/eh?=
 =?us-ascii?Q?cDJRS+wf5b3N8JHrDje1cw/6D8kSYQkaZdM6jUtjuEHN4LSJLCbK1RkHijZ1?=
 =?us-ascii?Q?rRCBeJ4DTShWj1PVVadN4QUysEqzwdcCmI//C/BiKN5TSJITh2nBaM4VtI2O?=
 =?us-ascii?Q?9JwSWstFNCYoEu3zQHHHLPXUHqzDD4sDFbbnaQUe1sGzqveWa/26nYaSLmjw?=
 =?us-ascii?Q?cXiu6ooQNnWTRC7U9bwAuEQaJjQIjXkcoWu22QI7sHizaMIxunAVKVupCqj/?=
 =?us-ascii?Q?Ukq/19yP1QRPdyvo75dOMOf5QwrlLjp4MA4865zw4fnM51HysOOGg1V755VY?=
 =?us-ascii?Q?e/dhDo/vDDJ85j6QnysPH6ZJEjvrjocQZyT5zyLpTK5+NYCd+VQgANDQwT49?=
 =?us-ascii?Q?joYpLLPrXb7BzYhE+RVW5SBOT3VcMb23gtzfTbl1D0mANGHDmd4caGJpNFJ3?=
 =?us-ascii?Q?4D93+FBAzrahBpIKFcTCNm6j//lSCAFxV9OFON82ano3mQGbY8Ae2zioJqeZ?=
 =?us-ascii?Q?KWaxDNz2nephxkTNLIHUnX1ZcDOeZBhBIPZTOq7X7xqxH4x9Ya+OOYX4Z8ko?=
 =?us-ascii?Q?d9LwcdcMj8ylgjszTtvq5c1Qaq57R0RUhjkoIuF+XT1ShAU+66/OpCVYMBqw?=
 =?us-ascii?Q?RF9QPd8NXJSEmPQmXW0A1BKz+LqDuYH9JNiOSqRlMpRo6gH295CAP4fOU7Qo?=
 =?us-ascii?Q?Ii1cF3d2EwGn1oRvyHIFcIuJgDjrisCQNeLYEXKIXYxybSTDgdnjoVUC2H5E?=
 =?us-ascii?Q?LIFF+Yvr1ZA8I2tMjHJ/43Op4sZLOEpA59Om3xFBaNL+ZMvqE9GbQnUCv1NG?=
 =?us-ascii?Q?+3tFt0RNd5wCwGETwNXGxSr9N02Gmzup9kJ7iczHAwCDNl+0PfgeCzQUYw25?=
 =?us-ascii?Q?GG4QFpJT9qFJCxnLj1qAOZal4UMZh7F5WiwkPF+3Pxyr7VWU1GQgLNfFasCo?=
 =?us-ascii?Q?gRcLtdLq696bsC4MVeFlPxPYm28BfTyxXX+5cGN5RIBW2j3OdrF9om1DIieV?=
 =?us-ascii?Q?7smYzsmsBpqdViuUzzo68LbNPdsvTMJBh2O1TjBv0riSexsefMPhnjuea4hK?=
 =?us-ascii?Q?IZUv2X25GBW8dFLDbspR1DXpX9rGlWgGRxvffswmF1iFO6Un0vZgfA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hmFkzBf0zSebOMdRs3reut+q2fb1SePA27M5/CXPPus9WpRwPKZhzXRtHUe1?=
 =?us-ascii?Q?b97eKhRiPUOwWobL6gCmWllOB8p1nXZFEQ8WgysCbf4iGMcrySnUUB+bY7Nb?=
 =?us-ascii?Q?2oNtf5o2preB7Dn5GVpgOm1XsvvIBYAdo4vOi3otoOVqOcw2ToyBqncmZnEM?=
 =?us-ascii?Q?QJQogA2L5MYcF5wbPDVm9jJ7UB/uAeAUs8tOo21VfYhC2w2c4dNJMZYfhPVJ?=
 =?us-ascii?Q?+euczaZxoc4UG90+6/+CLecdVhbqgwzhcQwj1CKaGIoFQOEvjGIp3Iu8IzEE?=
 =?us-ascii?Q?eO3+z1PJ9TBnHor/cQO0m0ObauK/x4xY5f2lYZNLHrFPeOIYhQy5ISAePwL4?=
 =?us-ascii?Q?rBM7K67u07piEzwEblFQ5X0JePCE4R5F5Fnt9Lrl671SiucmMRYmwz8HP740?=
 =?us-ascii?Q?Ek0L2bhlsmaE5wNU5x85BmQlvNH6WKFmYlkpY80MNSmQDdycu1NqGNtGIqHk?=
 =?us-ascii?Q?uORScQmuHd4qEzerlKBRxvvIgsVvwDF+ZfViOzoTqoZKHbADICd9+T4d2jey?=
 =?us-ascii?Q?OTulDjutnuMLWlY2MK5l51Lb3MgiVMuZLu8aF0DKfDpVKqbdweI6ZpB34HQR?=
 =?us-ascii?Q?I+x5fdtAPSFRVaX/M3Z1XCzQDxlPuH+CjVKuSqPm1a9bRsf+BQDmkj0lm/h/?=
 =?us-ascii?Q?SYAl4/JEUpEj0WrRotsm8ysS8RdhPtkToq0Zc+zTxMjrQIhX+fIv5+rsLR0E?=
 =?us-ascii?Q?Y04EfaxSYoX0ql+00afRiEkxrBaMGPuVYB3ER0W7cPYeApbK4pBb4I4kwcpy?=
 =?us-ascii?Q?hpEuGUnQ4rd5vzjE7G01sJ4L2ER9JEDezUyXiK7FjgJBnJmDPlURvvI38Nmj?=
 =?us-ascii?Q?qrJsnINu2HqUOX54c7BDrQ41gfmlDvfR5XnUrhlqN6W4bmcgyBlqA5DhnQrC?=
 =?us-ascii?Q?35fa/amgARgYZZ5p9VjcRmib+eYYmQB07/9eBQ2nZxMfQpqWGnzFxYF75mCu?=
 =?us-ascii?Q?cbkizum/x2DvC2foRTISDOCd5jTcBM86xC3rV+7oxkMy9zZoRQSoGPEpvgZH?=
 =?us-ascii?Q?JVj8w9J0nSJ30mph9Jigb5cWAuwpjjsh5bt7aosRrfjl6DLj8iw/ABfzkRQC?=
 =?us-ascii?Q?fGT5s5V8B/dHi8rZZX3S2TUl0NX0U3Vlle0l72U+/mJOFFtpuEC6Zcy4eOGC?=
 =?us-ascii?Q?yutxLfOu7+u9Yf2PNZgsPI4nAzo/kXzKox3xjN2ESKL2HwxJD/cFuK4fbeKx?=
 =?us-ascii?Q?05zewc+GCLLxtUN/LtjEAccH25AQBwSm/+13/m7JEvn2fN+zqbIl6YKZAWty?=
 =?us-ascii?Q?BeT/wjPXFOLyphnpKH3uDQwQygg5K+RHt2D2RRof8hAXAPS5/l/k/Ahmhbfk?=
 =?us-ascii?Q?xh18Z+FqUv4e5HE7clARQjUDBGVnzQKubRybwQH84ZKAaoTZq3+W1ICB0ih+?=
 =?us-ascii?Q?Wpd29fU9lVPJdGTkL9uVsE6R9C6iwnYlyQcCr78boD7izvlFImdDBlTeufTD?=
 =?us-ascii?Q?BEEbilZjEM+DhLr9b7+MTVodzoDgw57+adIXsLyNwqdyL6KWQ0l8SK0oHN/t?=
 =?us-ascii?Q?iaZSfIK3CGNqPYDh13u1K+X63xtgRT6sCAvtqtD7svw9nLKdTIacf9BWPd6D?=
 =?us-ascii?Q?9YLpr9yfAh6R9OREaHtBl/00yfK8Yyv0G1JVEd4b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d0fdb4-07f7-460e-6864-08dde57794f7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 14:39:52.1354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRH5JVSBo4ZprmhWJ/2MrgCnggdd/FSGQapOoMC30+wDnewre1Wce5UfMRvS0gFoWjtN4RbDit6TcX9i/3YbCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_074004_954554_FFC7B0D9 
X-CRM114-Status: GOOD (  19.76  )
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

On Wed, Aug 27, 2025 at 05:53:52PM +0800, Guoniu Zhou wrote:
> The ISI module on i.MX91 implements one channel and one camera input
> which only can be connected to parallel camera input, so no need to
> select camera input source in gasket ops.

Nit:

The ISI module on i.MX91 implements only one channel and one parallel
camera input. As no input source selection is required, gasket ops are
unnecessary.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 12 ++++++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  1 +
>  2 files changed, 13 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index cae918792ddbe3e6f458606fbbb7d0ad5738504c..3a675321a256cae885ca2f89a31d64262ccc35f0 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -347,6 +347,17 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
>  	.has_36bit_dma		= false,
>  };
>
> +static const struct mxc_isi_plat_data mxc_imx91_data = {
> +	.model			= MXC_ISI_IMX91,
> +	.num_ports		= 1,
> +	.num_channels		= 1,
> +	.reg_offset		= 0,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= false,
> +};
> +
>  static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.model			= MXC_ISI_IMX93,
>  	.num_ports		= 1,
> @@ -539,6 +550,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx8qm-isi", .data = &mxc_imx8qm_data },
>  	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
>  	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
> +	{ .compatible = "fsl,imx91-isi", .data = &mxc_imx91_data },
>  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ /* sentinel */ },
>  };
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 206995bedca4a4c5d7873f3bc872fbae18b3cb75..6ae023aebba9da809a0baf9a9da08672d31d5cc1 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -160,6 +160,7 @@ enum model {
>  	MXC_ISI_IMX8QM,
>  	MXC_ISI_IMX8QXP,
>  	MXC_ISI_IMX8ULP,
> +	MXC_ISI_IMX91,
>  	MXC_ISI_IMX93,
>  };
>
>
> --
> 2.34.1
>

