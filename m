Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF34EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuxreAdMwOwwNMQyOsXiWG/tBsi4dW/BmxlW0++FCOc=; b=tW8NyYjVoaKarsltTB4CjTO5A9
	QDkquZRLhdSpswDYKvgbOhL0yCZq14iYqCyqOLdfKa4ljvD9phVHC/jOhN+3BtoJabF2ve7HUuimh
	r4CwJUs9VMygVXCgiGdmuo23ibJO75ZUwshMayGGp/SmHpULLrVMSdP8mEsAuMk+1USGukOb7BZ2G
	NcvHtOld+ceK79mzYu3xz+xgk7WClPx8KUgvYzadAZDNKgXCHSm3iQRb+iwcF3R088jbNgzZF5b04
	5x16DvoBqXPe05QyWzotjGlbepTPouMNdzwKxG7IazeGyq9ZntbXvvOXKRHERXaRCqa90GdPCV4VH
	cvQLgcLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDaG-00000003Nt8-14Bp;
	Mon, 17 Mar 2025 16:45:00 +0000
Received: from mail-db5eur02on20620.outbound.protection.outlook.com ([2a01:111:f403:2608::620] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDXZ-00000003NHS-1QBd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 16:42:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMUtjKjyOom9yrLAVzekUBCMxgkKdiWaIBe1oY9zXrLN9lVZEFou2zrUSr1larhI2P6pkTfOG9KhNBdLxBJuVrGKt+Glyvc+F1PMvB/JF0qLoP6gr/TSMa20AlBwL9OIU5JDXX9RG7esRuONuQYop9AOCVEoeLpU49/35T64yp784Oz2Ctn6qFMmekP5J93enqL4rcZ3TgTChV7oayUZf1g+aFpWs3y9SnnvV+iHNeyfvDQjnsI+r+/GDPKyNW7RwYZtokm02KNtQXmMJZXdEhiZjuR1onbFIjKp3C2fR96n366jrWFumvyvr3YlOUU+eozj4mzficpagd8UCMewwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuxreAdMwOwwNMQyOsXiWG/tBsi4dW/BmxlW0++FCOc=;
 b=Nt0Bd0EqDl1s48Md5KV9jv5/WZJk5Z0QZAZ/HTJJNg37A+imIFyUFRI7zmylp5oCykm2QzLwg6TCKX8tBXj6kb2OTE73of1ATvhbeGthgixIQUwxEfFIWf7vVshUyRrGYPLWg+MNiQV6iqUCUdsJkcIfzRYNdNeQbfXV0iuQ0GhpZ/jDYApJEOrWcxRGx/BzFS4Z60s0Ks7JIxbRTZ5su5Uhb07aLBQvrqpEcc0xnk2YQf9k6nNlNPgvBRLR4aGNDAdBXQutwixMRi7n023d5d4Qh0vMbHlQbwnuM0JtIstWe9fVRao0Stvwfjhl3+WRruCmPXPwoY98o3DD3uRu/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuxreAdMwOwwNMQyOsXiWG/tBsi4dW/BmxlW0++FCOc=;
 b=XVmcnq+pt7A5YOXSNskSRbH34tb7EMFcNlUFmMjHS9qFOZRwpDXIibrhTwdvSNjIZco0WuCUBIklOQol4GBXFDAz3EXCDdoa48IrzU+IGuhUfHlH33LITCYdfW9Tz/NRPqb5N1ZluaudhOJ7nAKVfdBsu1Dkhtp6dOmJqu499q71Cwla9gb/JGDthX9vafhnlLeiTHuODzl7J52BAlvOgg0iIFAtnGML3QABxoz9GIWRML0YuF90bBEuOMLulOZKYJpIou0oFT/4u0YG5+Yhi9mBcw7YoHeyLyFtOaPhZG2kDd7r1cQKgOKwhMPueen9zBuDnnTTvFeevtMhV1/7aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by VI1PR04MB6976.eurprd04.prod.outlook.com (2603:10a6:803:130::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 16:42:08 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 16:42:08 +0000
Date: Mon, 17 Mar 2025 18:42:05 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 net-next 06/14] net: enetc: add set/get_rss_table() to
 enetc_si_ops
Message-ID: <20250317164205.bp4vcqarggp3fnf4@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-7-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311053830.1516523-7-wei.fang@nxp.com>
X-ClientProxiedBy: VI1PR07CA0280.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::47) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|VI1PR04MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: ea86cc37-e638-4aa6-3dec-08dd6572a836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rghkkGG+uppfCZNYz/FEUIrrs6nWT9xwkFC7p1tMYK8XE6WxwdK+ztEv1VxO?=
 =?us-ascii?Q?gkYSVCiC2uLU6+n+mLgMjGIv1Hwanawy1NSKMwRrcytU37Pq9dxj77Lmshr5?=
 =?us-ascii?Q?dadDUvGytZP/zB3Ac2GEH7cwF35OWCXAWIl7iWSWeLV58GKHp9EKEvcQLcb2?=
 =?us-ascii?Q?f8DlevTyIHHbf4TokxvadclDqXYtOZd4kiWSxqWTT+kyPjja05amDHnb82g0?=
 =?us-ascii?Q?ZPp3RE/oV+Eac02oppC5lySTJ5hzbgn6pSA9drCqnNrEK8bqoqCAkCQe+ht9?=
 =?us-ascii?Q?dczDbZq0KERknwwIFtD+9FQIR96v/PW3H9bpPmN/sb2e0X2+Urzquqq3IPk/?=
 =?us-ascii?Q?tTuCNMXrQQqUYtCZiD9hHm+Maxag9t4hZCGuC7vmkjOl5sG7U3s4S0EXME2U?=
 =?us-ascii?Q?IA8f6xmH9ct8UJIy/1MFlrWMZu+u9vItfhG7Il6QC5d4yKFqGnzRhOq9yRok?=
 =?us-ascii?Q?mkuRMUFJhPhtCnb4VsOi/zRgGyqRZS8+D3hDCRuPE7a95uqMussRj83jVXl2?=
 =?us-ascii?Q?s1dQ2EhRLz/6JIqdzaM6q+ElyMV5/XEKiQua0imFEj4zoCiPqZBG0XegUXSA?=
 =?us-ascii?Q?xs8lr4p+L6fTlC66qikpkc0QFz+BZDsmWALtExxqjCN4C+8uAs9k++323ksw?=
 =?us-ascii?Q?5fnksEXtcwGB38QeYP+OhTTXHTKx3L0kUqsodG4LJwduYTmKLd3QgCbzn20P?=
 =?us-ascii?Q?M0LcF6eJQmUGkkzO1gyskxNcOXrFqpMDnK0ESAHOgP0TYAEq/Qqtm6PZnTo6?=
 =?us-ascii?Q?9CXbv2rgyBoBhCIwu3Z1cYTr2+jIgJKqYuHKqgBDQ2lRWXtcJ4A4xefhOJ7e?=
 =?us-ascii?Q?Bn0DJIw1WwzOjfi0FMZu64jiGd9g/L+WNEDIs11mcnx1N7fRLNERB0Atubob?=
 =?us-ascii?Q?k1fCfhbVVWKYhbRjiva35M7bg9qgFQC3tb62L+HptyxhabIHKK8Af7wbboOn?=
 =?us-ascii?Q?VXKgXwSjkQNF3zjPXMeLe+eYAkCf5F+mmWsbdu2jkd4Mb5lNFpWdmruMHUan?=
 =?us-ascii?Q?NLaDxIGXQvTopWw9OtTW3QghEhYZtqspFbJLcjN/dpWUX2kSsJPgwBhln2VL?=
 =?us-ascii?Q?xoyjNnQwhIswa4UONemFyO94YgcIjf0eIpLDqK637ZZUvguWMUynCGYTiE6V?=
 =?us-ascii?Q?+wUqaYKJljWSGHQGvDBEhV8vkAkynweun8Zn7JMnNhvoFTPI6C8bkE/+dWKc?=
 =?us-ascii?Q?OpzoZzvmtJWYARH23XEYECnpX9n3iq6DBd0eKk/WTlcMJQGBQkU+4YPEoKsJ?=
 =?us-ascii?Q?7JcGoBbyii01DgzBUtfnN+GXrYZ9ThLBEeJfbNIsgOgmrD+qr6C/yk3KXCDl?=
 =?us-ascii?Q?v7fV+hFfZAB7EUt3zMr3enoIPo0UO8Wzs7cXW03fFLkSoWSfWx7fz06ln9FM?=
 =?us-ascii?Q?MZimMm+w+sltMalj02EeAFDTc6O8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uD4ST/cXTfjwqdwwkODCVYIpsbCsN+ZuhKHIypHVAVbOmt0910uDO+TW8RNc?=
 =?us-ascii?Q?RKAveG74LqcvViwWNiwrikG/BMTB+oOq/6CDst51bswqcSCRGh7Vftob2ASk?=
 =?us-ascii?Q?A7cHAW2X84DNR9EatEwFBwc58IgR2D6YTJ2LCjDzsWoZ8+b3vRnVxx2oL8xJ?=
 =?us-ascii?Q?ekmm1tv54KXZTloBv5bd4apxp6Dz/I0jk5ZatF+QrzCJbJUxjyFtcIA+qCKX?=
 =?us-ascii?Q?N3qTesjJ9tBBk9BuqucHpWaEk0cVHoSKYimAT6+ZJocCbnvXffjKbIWijtHN?=
 =?us-ascii?Q?z5OBlnZ+H1+p0ofa2EQVwAi4In2vkY+8DmDhJYv0E9gXLXMl/HYNuu/jnW1Q?=
 =?us-ascii?Q?8dZJKs4GAN5WJ3M/8L6SquVMlqfibiY6IZ0qONQqkvlHLtiahNYmJp/zqz8z?=
 =?us-ascii?Q?6fjbQqs+akdGd1ITcPOaX1R8bCHBxwIamyLPmIImKQhDnot8gVp2OG/nxKIo?=
 =?us-ascii?Q?RfB+YZEdnbg4I+B2nySrLMfKPEtgRHvbqgKXbfdbcjQxZnjNlk8AaJUTPkfA?=
 =?us-ascii?Q?XANFGJwZQibe4Y6v02YWx+8Tcw1ArMLvDjAkgI6+I9TFU8hhmDjsnw7OA5UV?=
 =?us-ascii?Q?4I7IWfyBI6I70QZfBId7VBK8MJdE8RtZqjgsJCtl3ifdFGj/kIIZN1a/N8cP?=
 =?us-ascii?Q?t5iFgZiTzqLJFRDf1zx5jcoCOBpwkNj9zbAa8hPDMkyyYHaJcCgGfc66lpOv?=
 =?us-ascii?Q?LlExf4nSdF2/BbTsWvOSs9p47NL0lgaLkbpOVJxy7JF8TU0qD8KLNmWfSwjU?=
 =?us-ascii?Q?LL8XHv3xg2m3M4HwM+ZLjk+s/iwx7fMXrn+Vw1qatRzWpCJtknwvmJZ+zFe/?=
 =?us-ascii?Q?EAQvV5fSSzMDtbY87AMnCBq+XuE137qAS8h9Uuvf34EKMX2PiMx6yz8MXiyl?=
 =?us-ascii?Q?sAMCYnevXQBeLq02xnePEphxEYKmxuszXWuofG7I962xATsJM7QzJw7oHMA1?=
 =?us-ascii?Q?/VQnq+1RKRZgWoUIspyrBS8HOgAk8+GKhUFuxs/u0A15cpkDl2Nrn2VJBLZ6?=
 =?us-ascii?Q?CrYyCM+yNq3KT1s4yAGzmGY4BfmHVhtsAYAI9OAv+/PAkdQPru3VijzXSaPY?=
 =?us-ascii?Q?n+Cz/lkourUL8Ltp8ZgF7OxmuP1KuG5LlR8rNUOhiPNbWvnztYYa5igown/B?=
 =?us-ascii?Q?8kByqj8gfznTiaAguYMusSaKSFI249xh12BmkZpXw1RSuJx6zSS6zjwEk39c?=
 =?us-ascii?Q?G0pSW73ncUzZDBDQuw7cnk/gOk0RMovUSUHhPwluDPI1IKQ6UNEos8D+fUcJ?=
 =?us-ascii?Q?5rqT7H/YptibFzUh10XUVQ44E08JjVsntF8jOzeITP39byBBShtcFoshc2bo?=
 =?us-ascii?Q?uAwXdtTcrCzaZ49I9XUF7QsY35LL/hL3ZPYLpMY0FB2Y8i7cAiUvIucnqLZx?=
 =?us-ascii?Q?uIfbfjrYGGMX5aa1HvFRox466PBcIpVOq5pSTafkhS6GfZpAdoBWhkVcb1CA?=
 =?us-ascii?Q?38RamkDmUfydQmofDBgEH0hBh8Y5ZSkWg85OWeZKGSEQfugsIdtqdkT4i8kt?=
 =?us-ascii?Q?7Du4k/7Xasd7Mn9hlon7zrGyTsPuGJDReGqUcdx7WZsEdBP8SYjdFNGqfmp6?=
 =?us-ascii?Q?YwYU+Bmk9Z4xHw4UcxdS3hkyksWAClaILdfdsBbCjFjFL+eN9dJstE4wynKi?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea86cc37-e638-4aa6-3dec-08dd6572a836
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 16:42:08.3346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtMZhm+pA3N9NUX2DcGF0gHhAfY98Um5zHWZ5q/zrssmrxOgBkEALGhkIKiMkT81nMUnIuzYFJZNXeAHzBZKbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_094213_379533_0E4EB894 
X-CRM114-Status: GOOD (  11.68  )
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

On Tue, Mar 11, 2025 at 01:38:22PM +0800, Wei Fang wrote:
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> index d7d9a720069b..072e5b40a199 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> @@ -165,6 +165,8 @@ static void enetc_vf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
>  static const struct enetc_si_ops enetc_vsi_ops = {
>  	.setup_cbdr = enetc_setup_cbdr,
>  	.teardown_cbdr = enetc_teardown_cbdr,
> +	.get_rss_table = enetc_get_rss_table,
> +	.set_rss_table = enetc_set_rss_table,
>  };

Are the CBDR-based enetc_get_rss_table() and enetc_set_rss_table()
the correct implementations for NETC v4 VSIs? (I guess not). Does
the driver/hardware fail in a civilized way, or does it crash?

