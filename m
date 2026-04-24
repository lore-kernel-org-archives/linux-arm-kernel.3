Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB76FAD41C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 03:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kL8qOHTr3hJYOZy0dnmNbnvOfeSAwlG9sPg5uAF6XQc=; b=uPZJ4nSD3orPEQmkCSyn2Z+WNb
	4Qm2sZniqwGBs/qNSJJP/jdmnT8dYycI66TLuwfahphg2LbCgPZGysbdEl1sLp7NWrjAUuJGmO9fM
	E6Owq9TdWxiRhuEIxbx96MR0Zr7dQQ/WHr1A53DozcUY2uKjZB856zY1Q1RJDGejZ9b4DBNsbo7ZP
	ZeFV3xO5Bl5qc8n4hrtuRxNkfotdV88KlsFa6k4/OE67kLNXteJRDLGZwvVlYHxPqkRMmr6EgZYqz
	BPQoBD7WIMUIH98zFY6wAZNRCE9RlCk3gYP+Pumsnm5a3b0cOsC2CHXSRUzIso55bYqrDtC2SdJeh
	EnP0L8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG7fR-0000000CbeV-23kC;
	Fri, 24 Apr 2026 03:57:25 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG7fP-0000000Cbe0-1V94;
	Fri, 24 Apr 2026 03:57:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIGjONNzZOndn6AMdXG3ZRgs3N+l91wfMmkU49nqxOkpKRM1dI/kkr8VqisNXYNu5CM5KvOxqbc5gz7FpZ6SetJCpsDYCZ8INHjxInmvmDOscdPDUrgB7Ps81vNI7X8QKQaZiNpyf9ZKFeLpzdZmGPtP5GYndyvJTBdeJTEwTFUSRgChqPSZSreAozQN8KzEy1OpWnZqzeSzJVqmKhUlWaIVEI6aBtAD6WE6ATgkSFzzXWEhLjEEYnV8NUJ//Bg7FmODKl0bmKMREOcnXV4k4mGXM9b0sChOqIy+zKO3fAib/YMFq+7BbyXOG7FXw2gnhSLSumSP8zBv4zRMZyyCww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kL8qOHTr3hJYOZy0dnmNbnvOfeSAwlG9sPg5uAF6XQc=;
 b=vIMAC72qTmelgEExcj5+tlYraJniIGRQLjCXZea8IbRQm8hMClugpJItD5MdAl6ECsCXOD6oU7OC9VVexqbuL0QBPhD69StM/efde0tzDhwJxl5ov+XQ4zAx/8+zoxd4hX35i/40taSRXV1zBhMWVGXqyKJGRhtLZ0L8PLwwYjN/oEIwuPzOn7fZRqryIkedxJ/C26b4iGcC6URf8lpzZVCwYQ5lyTvhh9A5NwmhNh574USZh00koUBUbNpcGdHWus9rlReb66D5eO28/MM+js+mSWo1baJIBAgy/WwMTA16B0FVS8R44p6gCxeUKceSbpzm0BAopKkOh3h+JLdj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL8qOHTr3hJYOZy0dnmNbnvOfeSAwlG9sPg5uAF6XQc=;
 b=aMSlEKqHQUzKZc0DDgx7K3mlVAtDctxS29DDpEx4W3CmDhD1vRPP+xnJgKdy0lRpiaOvJllIrb55fSexOl38SmbRBYIBzRuF9zVf8BXLvLIZraPTiwZVOYOSg48J0llDhBDlQltshvOGn79WkXo0imoa8FaNuG2UOipVNpIMtu6LnrWIP4wBvdZW4csPlTjfI4gQUMmOpXLWvieM7uHU3XBJnCnJenW/4ykvnU9fwe6BjhtdFnNutUdiSMG0BuvPtk85Jy11gBCePYKxksYo0WG2L3CWclLxu+gC308D10SivswiI5XjSm1ybbTBSJIcaFJ/rnuNS/I4JiBwWpXj3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 03:57:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 03:57:18 +0000
Date: Thu, 23 Apr 2026 23:57:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/7] media: synopsys: Fix out-of-bounds check in
 enum_mbus_code
Message-ID: <aerqFnwDrn7AXSJh@lizhi-Precision-Tower-5810>
References: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
 <20260423-csi2_imx95-v2-1-934c02f3422a@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-csi2_imx95-v2-1-934c02f3422a@oss.nxp.com>
X-ClientProxiedBy: SA9PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:806:27::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: bea5746b-4063-463a-6628-08dea1b5948d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: lVUk3HCUNy7ThXnwCSNr+ne2bTHkbu1Mk/9IR1FckIV/FxvUcVGVVbKj2wW5dqWjptOi2lQi372bienM5oYU+VBn8hKO3vJL7dOyiLY95/7I8elNZjvxN3BfHNaszu8ZGDN9lH1aQJa7OGw4TASPrwxeZ8Fa71Z4stj7ebN9Xu7bSxNILPdcuwSh9MCrd0OSo283WNwlDL5ckgIc3gBdsKIRbpY5H8c2cYCP2fILxiQKUT/7x4pkVzm1XoPNljh8jAlILLFYVIl0RCPnLUCGegJP8ylFe/kZwuHUfba3d43Wp2FFV4DLVp93M4iXQ/teO6K/cDvlc+i0mEiEP3CZpNuxLVsGIMg5ijkbOZVS6/fjoARtbOwAy/HyULbtyaz+iHP6M3HfvoyXq3brJRrGzEAhpzY13Px/kigyuXUJ75iOH4pYZlMfHQtjE+3/5rknu80b0u5jXVUx5auzCdBzVVe3dq24A4oxE1vplVjvsJdyk6sIk2UrfVaKVXHP8MtDVwdXPOxSD+/AuaIGHshVI4gGoR+MLTSas+V4NsLGmYBHMlDqyR/vRIjbS+FIDyKBEbf1i5LDbSclu56+XkBNjafgN9dNsKTAnACQ8xVRQWZA7aIWurhP6gQkr0bNaf6/PYJFOozXzVDHmBYYdWwK4SC5w4xyjkpqb7T/hRN1v3l29zqw4ahXiyq4tIvmjLaxJDRJKPZ6pcMmLoSgNfwjcDj9WlbUEfZPoEseeBWocqnJKPCKz4aWYC5RQkocVW/4lBm+HgqXXazVyvAmBh1E73m368EyQyZarOrVfAtR2uc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n9x9xhnKD/9Lf9gS07UUjRjVD8ryeUiasIELkBcVsntSNn/2KFS8nwI7Zcrf?=
 =?us-ascii?Q?RouEGqeJKchFqUE0UkHg8ZlXG+ihVQjdj85GWH3WMwduhnmIHFY0Go+orPz6?=
 =?us-ascii?Q?vfcZqFhEbA41DFu2KRvLAnq5yB4II5FFJnh4oI060hnuCTv1Rpt0I2vTbAGc?=
 =?us-ascii?Q?q6OKL+LSQIZvXOpsR5O1AF+Wi6ENawrOO2n6GLAK2bQlQxvhLdqWnMPnafGJ?=
 =?us-ascii?Q?rV4gQmWYVP42YLZMY/r3crASs6ztiLH38x39I4yZtG7+eOaTywCNK/2ibWhm?=
 =?us-ascii?Q?1uBT7O7YwcnpGZoqA/Tr8HQjxkdxHmu7dAUqfiWpcTmjazz9pTAyyncpKNWE?=
 =?us-ascii?Q?Mms1BD7d6nMZn3gC3m4zKbuOGkXqSrKhT1t67PCJIyGv4PYtdWRi1uTDsrwd?=
 =?us-ascii?Q?/I0ZpgDEwS7NlVjJvkz2GcJDkjWbgS5X+JEXugsnfqWORR0PKmzQ/+4yjo7e?=
 =?us-ascii?Q?zz/Zi6fyVVJzGCUPdG8aZxvBaD4D5g+H3Hh4f0aRwkyedj8wxyXvzMBHxjn/?=
 =?us-ascii?Q?FayXhgXpja51p7fjnOwV/h1/K67lUeoQI0+UJS6xaODJgqK3IN767aft6KYn?=
 =?us-ascii?Q?YSOZpf/Bo6LLF30HTM08PJgELvg3rt8vCPaI2T4/nLjZvF4q//FLeXC8OIAf?=
 =?us-ascii?Q?0+a0nB9Tx9g0MFc2HqZTiQfQ4TiaCpLtOud/iw6rGqKWsAefXnn1WDCTtSYW?=
 =?us-ascii?Q?XQS5KLTeM03pFmSZazCBczrrTI9detqdqEw9aeHOlUlk41fL84VblmwI+nV5?=
 =?us-ascii?Q?+cFPywvY1KVltlR4kEFSqpjmP1b5AfSajSGia9aFFQvD5rZyUxeZksWHkIML?=
 =?us-ascii?Q?Sqy+xpLeVa9w6TsP375wHzGZaSmO6jRCEQ141JhDW+LO3yO5bC95Lr6fRdKR?=
 =?us-ascii?Q?I76ZkYalzjRL0PMWplG04AjohcvatGlWDvswpk1GgdW8NZC5XpL76nDeo7Kw?=
 =?us-ascii?Q?/9s6m2KQf3nc1c23U/5lo03Xhv/73rGjGAPv6H0CeB9DUElN0zqcuB32w3s0?=
 =?us-ascii?Q?c1AmzdwmJtQvIYEqjZnpWNVg0tzcgu+SPzw51BTyUQN3odso4xsWMQh5hybt?=
 =?us-ascii?Q?VDXt2CLDI2joJ0oofNEl6P3oUhlTitIwJUgV/kqGD2sJlAGpE1otnYsKlEK6?=
 =?us-ascii?Q?0fcYKLyDF4Sl0cI2d4LrmZwSttB3kl1wWyxNWwQcVo5gbovIvCejP6CML/r7?=
 =?us-ascii?Q?hU23jx6ylQ8CY2BNJ9Kp/r7TTQGD3XRG/2JZoodUShLyvG2bS4pEIi6zavhY?=
 =?us-ascii?Q?IpxgP8bfgMCDiaTB15jbKOsTjX81FFo+jXVTnf2caY/2ZNRZAAuxHlsclnjL?=
 =?us-ascii?Q?m1sOXEzoO1+O+WTQMuZrPG4DPurbi0/P0V1whwZ2ZHjKUD5MMxpDQaU8pEUC?=
 =?us-ascii?Q?W6TCbBPVK5vyzOFB8sVkVN3xcnZWJrl1aOuuQj4GlN9HQ0asicY4V8iyC0sh?=
 =?us-ascii?Q?C9hYhpgppkdd5iGyttoJOCjTZfAHqRE+3+5N+Zn7e5qXnrue6EuYUE0cYqNj?=
 =?us-ascii?Q?F62yNh7BSz2NrwK4tUN9mwXuhDFO+d/M3ceIFM7MsDdoCm2i3PXzRwOtRWf5?=
 =?us-ascii?Q?ewR8lDqyujEjPY8/5qMv2fL5NeJ6ySYmgnhJhph0+CoJFmviN3VVF2vonpOW?=
 =?us-ascii?Q?ikuJ55vWqv7uwbeZGFGfw93l+wQxh+Z6UD398h+QIMEeaVL7/f3TsVE76hzj?=
 =?us-ascii?Q?+aLTeJiNzKT8XAqig1DX/MY35JqUKL9yG/Qa2CU4LqfrtMQDVadYxZp4uwNn?=
 =?us-ascii?Q?Rq9ZyGaLUw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea5746b-4063-463a-6628-08dea1b5948d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 03:57:18.8250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HT7OFmijeU2M2Oqe0Dbma6bWojjCaP7b2mZ+xnsgyKnR2uoYdNo3RBdUSNA4KrZIgg+4RRQNA5ll1nGlka2mIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8906
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_205723_403287_0AA72DB0 
X-CRM114-Status: GOOD (  18.26  )
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

On Thu, Apr 23, 2026 at 04:22:56PM +0800, Guoniu Zhou wrote:
> dw_mipi_csi2rx_enum_mbus_code() contains an off-by-one error in the
> bounds check for code->index, allowing an access past the end of the
> formats array.
>
> Fixes: 355a11004066 ("media: synopsys: add driver for the designware mipi csi-2 receiver")
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - New added in v2
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index ce17f986279e..02eb4a6cafad 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -430,7 +430,7 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
>
>  		return 0;
>  	case DW_MIPI_CSI2RX_PAD_SINK:
> -		if (code->index > csi2->formats_num)
> +		if (code->index >= csi2->formats_num)
>  			return -EINVAL;
>
>  		code->code = csi2->formats[code->index].code;
>
> --
> 2.34.1
>

