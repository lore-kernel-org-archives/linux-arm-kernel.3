Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F48C36010
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 14:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJpOKYcPnj3afxuGoPg73ioZY0RwdiZPZVWWj2wi2Ho=; b=ugxUbXV0FCTgUw0Dtsz2gbI2iT
	nV1qm83V4Olh3/5EUJVGDDhbkoZITS2KFJQyD8zfRQ8BMIMVmH9kvRpWkNsI2wMLXSOaTWsrSHve7
	VEIDYx1qB6QMV4eUrOZpUXds5GbEF8LH2+oRQLy2R6oawG0R+emhTbi/F6fTLUfteubathXoj1pB6
	C90N46MJH75xEve+yoFHSrqsabs4lGUN4XZ0KSLagEprx/jhzu093bTzKhcQ0/qmbZo4M7XE1pexl
	rHSWCB90BIqUvazq3q2GGORf36pS7GEoEG0AHlK7ZLpgxffMiksY5+YTiyxt4FxC/wiru6RbVvQC7
	YZjUHVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoMS-0000000BE5g-1EAp;
	Thu, 27 Mar 2025 14:37:36 +0000
Received: from mail-db8eur05on20621.outbound.protection.outlook.com ([2a01:111:f403:2614::621] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoKe-0000000BDlT-3Fq5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:35:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYDpbqeNyKcEMv/c76FpLcvlv35I4s8BwlxkvAbRrxiXQk3KTIJyueaYICbXJzPm9bpaSKwsYFx4LHcpBKiZYgMM6cfaehqQ35fZyy/eKX8/NRAORnhAZEQIq0ikD6QVaJITwnMUz51SRAc3sT5yNxTqkDA/ToZ9kWvj4jWzf1gY0wqRdflrtlJ/9iPq8R4BS1X91tloHbB7D8qOiSVQPPTE9rBLpZvntU5t/Z5/IXRDY2se0Df5eTuv/l65vjJ+HI8vJ3sB4GlN5BHySl2dswIKCwKdvyKkHt786pMIaIKCyfzOeO9QJASbcT/dHYE5dH9LgTVse1EsmnO38dP9gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJpOKYcPnj3afxuGoPg73ioZY0RwdiZPZVWWj2wi2Ho=;
 b=szIQK8L3orEwT9iX+PJ8bvlWc5bvvgxQRlVD4XLOPzyIBugECRqbyUKM3Ejt+0OFwdx7iwnisZ6NoFhy6r+p1ffoJZYEqHL9zPRho36YqO8Z0dzy2mGlErl+wEULN5P7yhGSvASGDEqJKKTsoKoUcDdwnomt4p39hhVRVlc+jdymG5vrBMctUS7NZzbuMKqPqX7T4Qf8N2ArWbfC+BpfdlJL+m1lqxKujtAzj1VS+/5H3uoc/S5b0Ymgl8ENbs70yd5nPNiQq2UcbNHnOTgHigRka8gCwR0bVIdCSym7Kf2DgXAApEwGOVeQ/0Fd+diLXgI6tDLTNgC1MF6hE5SWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJpOKYcPnj3afxuGoPg73ioZY0RwdiZPZVWWj2wi2Ho=;
 b=iqZAIeNXROQvmiNd9bbbZx2c1x+fYRq4GyI12fyHvCwpMrd6uC8BVN8q0dwy7E4OPCvt3F53SpAlXSmXaMr2FjlmPv4uvuc1AI/j6Lvh7eg3rvZSphpcXv2jWNOTejzeoHfATRQr1D7RFzxhzSZELtW6fUbG6A4BjYDvIv+T2lD+YL/wfk1OTulu0ciM6oOSa3W/fd4f7CsEAw9FSqfIuL5qFO1pkgFzS4/La96jwsEHN2G12+7ZAr8e+JGeqICLf10dydm4aDhtg2XVeMx4MNx+NY3uxyl+4DJjQ1tXuZmnntTSBnuwqQh0yPI99K13twhUGkDZw6BgY+34ockbtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6929.eurprd04.prod.outlook.com (2603:10a6:208:181::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 14:35:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 14:35:41 +0000
Date: Thu, 27 Mar 2025 10:35:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] media: imx-jpeg: Enhance error handling in buffer
 allocation
Message-ID: <Z+ViNIB7WqgmouYE@lizhi-Precision-Tower-5810>
References: <20250327023710.549-1-ming.qian@oss.nxp.com>
 <20250327023710.549-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327023710.549-2-ming.qian@oss.nxp.com>
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 44e0efc1-7ce9-4d1f-9552-08dd6d3ca632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yuKEIgrZiIxzw3pxvtPqSzZ1e0PVJVT+DjvG4MGi2ezdHREHKLc8m+oxDmg1?=
 =?us-ascii?Q?bZOzs4ms6V5JkW+HVT3YKlDDUgqe3kXzW27q9R7jp3EyB7ZxF8Z0Mj+hk0yu?=
 =?us-ascii?Q?4M5GHOXY0WdtMh9QToP+hgZNcGZ79uv+8nzRiYbSQtgAfEN6Eo4r24AUPc0+?=
 =?us-ascii?Q?D+BYmGVIfgnzrPmic3CtQFRAJ56Wusu+MjaFQ4nMp4q3qxg1n15Bu8d83+PV?=
 =?us-ascii?Q?N6CBWGNqDcN4ttXym1fZEqVbuRqQDPUkiYqAt3WLTsMowutARbWL3HjTXyyB?=
 =?us-ascii?Q?ce6rKMsU2AHDyJ1Cs/iIxp3pN4js0kxh9kVy0ErSq5PcXQW6wkdhsgO2ZSRZ?=
 =?us-ascii?Q?vrbaWGFF57xlLKi5d9uwg+Y+SocqYsZlF63DwF84TMkzhcFRf0foqMeh72DD?=
 =?us-ascii?Q?1dzWX+VnKaNKMdzvN0EcwJoetabs74Inv8lEdQnjmMXSqkYPWcBI3YCTd6RT?=
 =?us-ascii?Q?lroeOGxEXV661ljjlpaIruiLTdY9zHVRXc+VVRgHAF91USAf8Gz9FiE4YCPl?=
 =?us-ascii?Q?VMG/gazkALgMRXjTmC63L8ZFWPLehfNLnTa7xcUXSR9knPQaBCuluZRYERO0?=
 =?us-ascii?Q?nvCYk/Fu/1F7xkJ8YKuR1izFGLZ68hh7HvOWb4AQkXglcQlz7EtLZjj3zVrt?=
 =?us-ascii?Q?/JP5hjogygGovdWe6rVKfT6muRH/ZGYWsI0gNOZ+Muh6sZ4ZSY4tXuY2t9z0?=
 =?us-ascii?Q?+s6RqNM5yx0bLts9XnsV3gH9kF9bZgRrQvLSqFWX6k8Rj5TWr4faPdmEj6KS?=
 =?us-ascii?Q?+scMMxRrc33hOjHj8eRVnZUUYIMEKO29gQAw9QOnhgESq1u2sZCqhRnCN2ou?=
 =?us-ascii?Q?Jx/FxgPw3G+1g//yzAbvRw97p7SOjwtTbSwQKcORtSUg9DaVvPyU9ljJqYR2?=
 =?us-ascii?Q?GGpnXspNctUE96n9QSeUJ3IutaWVOgmr9x/+ycXbiLuKXzHS7wLgAHxw+Kdm?=
 =?us-ascii?Q?l0IgINrQporSMdJb8GWIydMdPpXuv1wVMTjv9Vb0BwrepweYWJd2UO5d5edh?=
 =?us-ascii?Q?KT9+Epep6pg46jgcfxxUYnlWNJ1LDEy98X8VXVL3laTlVLu1zLNN0tRDcpIL?=
 =?us-ascii?Q?O0dX2e42zW//zkpHBHG7jb4AVajfJSXGw+eVqjAh6x384diPhQwqvQAUb6bH?=
 =?us-ascii?Q?E2hld88mgt9nCSu20jvjtWxBJFYwfdvYVmloX6VQB4jce7pTV3GSaUJ4zt3I?=
 =?us-ascii?Q?ub0cNafK6Eg6iI1qUYaLeFDygrFeLTYuwzJ6qFZCyGgo6PEXqg/6EhE4xGbY?=
 =?us-ascii?Q?RINMwMv94t/MUVRKL3+IjrkXezo4QoXou/FKb3GmZc49EQ7H9f+bku+xsRfP?=
 =?us-ascii?Q?VNVKkWlXzUd4ltqzWBEnobj4AtkE6jkzomjVqtYNdzIQZv8dSvZrI8yyYxs2?=
 =?us-ascii?Q?kXFB4YHLe1x2O+3GUe2weLoL187tR+HuucFH9/AVxB/O+mMFy+u4kzuKmGKU?=
 =?us-ascii?Q?0C4ln+72aC6Cwa3cnKZDPybSL8oR+6k4kQ9OkPjHWK24RbdaC4k0lxRkXru9?=
 =?us-ascii?Q?WkFC59ciAQisPDU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jLWk1OVHS+sR49YdAM1T+AGUUls95kbu2s+8W7sofvGvt7frhZZTnGrm7bYn?=
 =?us-ascii?Q?HSEUnbkJcq6DDHLT57NuV2+qICik/VE5tkYBPdycKbR6qGn+d+ZpjWiQpRUi?=
 =?us-ascii?Q?1YSGloTy39SMLoHA7Z08ioleUZ3LUA0ZjX1oi7jwIayBON7hLlL4lHWKCMHD?=
 =?us-ascii?Q?sRFEjJyfsUwn+MfXjtjM18ZS8Q44OEsHLTV2C4m/or3pZNc1Mdwpp8+m+urV?=
 =?us-ascii?Q?fQXFvZwHoaJSqBCPU7lq6xUWtAYphYrBgN/ylbF9LEv/JWcDp01xP+o1/KcE?=
 =?us-ascii?Q?85sxTLyopcX+bVsz7HKVT09bk59cMOUL/vvKdjS9aWMfqDvd1nBJ3WHnNbH1?=
 =?us-ascii?Q?+t5bvv7CT3pel6SIfyLvgdHI11k8r43uxS4A+X1gIPh+h+e5e7DnyL+Jg6Ri?=
 =?us-ascii?Q?IDDo49LqZ/A4/0Yeo1UcjpKAUBdoetcZTHlOGiNcRACq9B6lL3IHOxOZIY+T?=
 =?us-ascii?Q?/SozLc5RPOC5euWWLVFAQsm2r0yNmy0uk6dBDKYOF3nGppgqkGH3727KItob?=
 =?us-ascii?Q?VbWYrZ9TSgbLvMoBeyAhjKPT32K1ruLYsfYXi5a0Q7JtAY9jLNyyxRtO+XiV?=
 =?us-ascii?Q?DzbVwMKRdVKt95Tgvur+FWum/vJSYCkHZ7zzqKSPs1iFGeeDyiQd8mdH3Pj4?=
 =?us-ascii?Q?IujyCaSsfTgNtwBoKBPqaPPKxS4GvhY5GtBK1aBDSTMuI35TWfxWIlzEXLt1?=
 =?us-ascii?Q?4HA4njiHIaMwNOOXEJTdA7LTKMpdYUP8YGJR+aDMaEiZPAI0cRlTUZYWt3w5?=
 =?us-ascii?Q?txvjLu38J2oofTQx8SDtOvHOwfpj7rPvjUnn5TYR4ByNO1EUtKrdb5boB60M?=
 =?us-ascii?Q?WJE2AU+4KBSfH/9cuuLZoDDA50qdCjItQ2m5/yx+syWnIjRrbJmGBGJKsXrc?=
 =?us-ascii?Q?tmyxPmQePOvLTpz8bLPtYxWEujpi/W0KEAZ3bfztEQrMIB4055JUgKdW5m0h?=
 =?us-ascii?Q?tH2Utkx5Tr7iCm7OZxiwIYrvS537xkUaHmCQ6GGx8emGgYkPpaVOZHY4DDCd?=
 =?us-ascii?Q?dm+Q96KhqYycYMzCsWu4YVIXIke1cUsqb5LXgYxr6NSjudTLZdG7z/+svozE?=
 =?us-ascii?Q?NisPS5ZdNXjx9sIu1l5090YDE+ruQz96av7kFIPPqugFwNB/oI56XcbSE9AZ?=
 =?us-ascii?Q?nAdbw9wcbl7naPTgUlpn0Rw8sb1HnElOnl7ycImpZC4wyFrl8wsUYX4/L1se?=
 =?us-ascii?Q?ubkUidqBUXmUShCPPhL62b6903P2Kn+2o9lmDUAjW921B6qLko4SnmXl6ptz?=
 =?us-ascii?Q?xTpI1mfz+lZPbTaMPvnsUJG5X//yMWkiFsVh+NMqfq/djLFI/Kaqy5BA6aVv?=
 =?us-ascii?Q?yLKGuavwYw6meWv6I4XfRCjr3YoWoMoVwjRPR0mxARmXEZLXVq7hTc0FwjBO?=
 =?us-ascii?Q?Ajwt8cRRzgiW07e0rB829N8Qx/Zptzw6ofoYg51R1BvDYo4Mdd5jAUbhvrwc?=
 =?us-ascii?Q?SXWqfVZjIJmOQnENaGdn5/dcS0lINEPXGETDTE66ecl8RH6+cERjFRRyL6Th?=
 =?us-ascii?Q?Pb5VJXK9NfbBYEVJfWNre2Yh8QsHzZFqd4XmbOf29wN7Myhoy9VuaEXyqj0Y?=
 =?us-ascii?Q?kVGvFkqEB6vgykAJGO/Crm3ypOjjY4DmcnGhbtXE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e0efc1-7ce9-4d1f-9552-08dd6d3ca632
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 14:35:41.4203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kM7DDOFMMFjlkSnc6kLdO9Vb8VqrBdE4NZVDjq18Qz9yoQ1wHeDAfq2VIFxb+Py+3xl1Gr+5bbnItYdcQVPojg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6929
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_073544_822544_338D8F61 
X-CRM114-Status: GOOD (  20.95  )
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

On Thu, Mar 27, 2025 at 10:37:05AM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> In function mxc_jpeg_alloc_slot_data, driver will allocate some dma
> buffer, but only return error if certain allocation failed.
>
> Without cleanup the allocation failure, the next time it will return
> success directly, but let some buffer be uninitialized.
> It may result in accessing a null pointer.
>
> Clean up if error occurs in the allocation.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Look like it is bug fix, add fixes tags

Frank
> ---
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 47 +++++++++++--------
>  1 file changed, 27 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 0e6ee997284b..12661c177f5a 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -752,6 +752,32 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
>  	return -1;
>  }
>
> +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> +{
> +	/* free descriptor for decoding/encoding phase */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data.desc,
> +			  jpeg->slot_data.desc_handle);
> +	jpeg->slot_data.desc = NULL;
> +	jpeg->slot_data.desc_handle = 0;
> +
> +	/* free descriptor for encoder configuration phase / decoder DHT */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data.cfg_desc,
> +			  jpeg->slot_data.cfg_desc_handle);
> +	jpeg->slot_data.cfg_desc_handle = 0;
> +	jpeg->slot_data.cfg_desc = NULL;
> +
> +	/* free configuration stream */
> +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> +			  jpeg->slot_data.cfg_stream_vaddr,
> +			  jpeg->slot_data.cfg_stream_handle);
> +	jpeg->slot_data.cfg_stream_vaddr = NULL;
> +	jpeg->slot_data.cfg_stream_handle = 0;
> +
> +	jpeg->slot_data.used = false;
> +}
> +
>  static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>  {
>  	struct mxc_jpeg_desc *desc;
> @@ -794,30 +820,11 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>  	return true;
>  err:
>  	dev_err(jpeg->dev, "Could not allocate descriptors for slot %d", jpeg->slot_data.slot);
> +	mxc_jpeg_free_slot_data(jpeg);
>
>  	return false;
>  }
>
> -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> -{
> -	/* free descriptor for decoding/encoding phase */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.desc,
> -			  jpeg->slot_data.desc_handle);
> -
> -	/* free descriptor for encoder configuration phase / decoder DHT */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.cfg_desc,
> -			  jpeg->slot_data.cfg_desc_handle);
> -
> -	/* free configuration stream */
> -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> -			  jpeg->slot_data.cfg_stream_vaddr,
> -			  jpeg->slot_data.cfg_stream_handle);
> -
> -	jpeg->slot_data.used = false;
> -}
> -
>  static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx *ctx,
>  					       struct vb2_v4l2_buffer *src_buf,
>  					       struct vb2_v4l2_buffer *dst_buf)
> --
> 2.43.0-rc1
>

