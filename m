Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7EEE909D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 16:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2487R+RbmxZdErw3R7NPOt87Msf/QiHrO9wc6XOdkKQ=; b=OjxjYkxzHlf3GeuLxSUYc5b28x
	dta+2pZbIDzpbli6shiMsCgR0iRbFfq57LWXjhVQaL3qS0kQAICa4bw63nkwn5+kWKkbFQXPG9yqB
	DPEdxsosEY999xpppcwMD89FXsk2Ea9cbiG2IrP+Qv+GITV3K5732204DUtvH51zi9r0nJPhCO1jl
	Gc1YLE4gvFlrgjcwaxhVClLdbAs7bKQwIsQBCX1rGJuIJYWnp+NE8dfgnNHQu4FwJFclRY9eesoBH
	V2I8uASG+nkgTrh6XMNnKcBQ4IjACJ9B5ODEpSktIz+FPhog66SPMVq69SXnILohYGCfScCG7sXqq
	kzZ06ySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsO8y-00000008aMF-0doL;
	Tue, 17 Feb 2026 16:41:48 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsO8n-00000008aKP-1Qb1;
	Tue, 17 Feb 2026 16:41:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdwqzde1w5L6e1ilKhyDlqfN0dLYYYt6pR2PWmP14doCk1hbfdcs1ASy2kJNo/XHp4AJnTyWLcpblCp4xW3M1HdsOPuTYQwyl7UH0U+SG/AxSOGVYqCrJODcqsqkW23NK6b1XCtKSLrGwH4i+5tI19HJSeVnpK0s8CSY777ab3IDoJfGSc/+8+TVTnPlHCQWZAtArfr30s/ctXagGb/b7Os/1ShGGjH6RjbyBakOM9hHbHQgVyBhK29XYYWDnVZHfo3qvgIoPQZlF99RUL7+d29DTJubE6D2Y3ZGW87I1O9qc57lBf7D5qUM+vijQTvqteIcG9btbfNV/j8hEzZMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2487R+RbmxZdErw3R7NPOt87Msf/QiHrO9wc6XOdkKQ=;
 b=uynmm5BMX2dvaDsbeGVp0fG3H+BuZjE++0U5Ya55pfrYQWtNfnnclydZB6+8Mkelbw0e1zfN1k49NngMFi8ekVqCjH4eJR/VUvSSnke84GDYf76g1DUYvIG7qTNOe9o/hI+nhDfJnMl1a5gjNey1x3T91dDYE1cOZBBSA1aTBXNh8foh5xIdde6Bb/TH0BwDcGS6DKdKZyLXo4abKkak85qZoJzZNTCRM1WnaWmOgiL92Wvf9kikV4yhGryLWkexpgsPfXZ2VooYIriKo53XKI6mS9p31dRu9VzLWYEfMWXf6he/QWYFsUQQ5D6eZltIVEcudIhwn0y8a4R/G7ZN6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2487R+RbmxZdErw3R7NPOt87Msf/QiHrO9wc6XOdkKQ=;
 b=Juf9l+Zlx1EpbtFYamEcWY1WUE1lJXtpKp8Qu8A/KYywCsMZIm/cD3/ZsGtO5f0r8Pbdjv1KKcO+qWjfhwFiTqPYS3RTmPzbJK8xx5gYjynHYizvjEgjCfaElNe4sGDhJaJ6MP9aiz2aQezvskYJjh24L+TgAyXYupemTZzX0HE4XhkoepvBiJnvhmLBWgnmvCsItvbre1obPGoJp49P0xZdUr9k0xjar/j2aVm6zGo/AJwA1cfciRc+94JimkQpLD9bCJyuw1nSqmhcDHQSiUxfwqwsQDJUUtcLoqyDnAMkUu1hgvMWPSEgJNVryPRGFGrPwycq3llziUfwpCCtFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB11628.eurprd04.prod.outlook.com (2603:10a6:10:608::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:41:31 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 16:41:31 +0000
Date: Tue, 17 Feb 2026 11:41:22 -0500
From: Frank Li <Frank.li@nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	heiko@sntech.de, kishon@kernel.org, jdmason@kudzu.us,
	dave.jiang@intel.com, allenbh@gmail.com, cassel@kernel.org,
	shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, ntb@lists.linux.dev
Subject: Re: [PATCH v8 3/9] PCI: endpoint: Add auxiliary resource query API
Message-ID: <aZSaMl-m1hWGchZD@lizhi-Precision-Tower-5810>
References: <20260217080601.3808847-1-den@valinux.co.jp>
 <20260217080601.3808847-4-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217080601.3808847-4-den@valinux.co.jp>
X-ClientProxiedBy: PH8PR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB11628:EE_
X-MS-Office365-Filtering-Correlation-Id: ddb578fe-929f-4b85-a187-08de6e436753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j+rk5IR2CinHgfZ0AFT2lOd1WdCA/jqaFfZnE3nez0vE6QSQ4VfeZAVcr3hA?=
 =?us-ascii?Q?RjhTrEsgUySspYGzgQ1/I/hHkxdOhFWvmfH9qebNYxlS9FUb4z2PtSvbyo/5?=
 =?us-ascii?Q?8hd5a2vKTWQqfXBj49ImOygbnqHR++LizQmGjk32EdgJ1ZdnJiCv7/UJK9f9?=
 =?us-ascii?Q?xTsidbwhj8pq2DYlI8bS71uh/3y1JlX8yeKSW0EJ5jiBRvqqVPCv8Tfuo496?=
 =?us-ascii?Q?1yjL6hwshQ+XarxtdUPqaK3dnKTePfb1KzDcqEHYg7+0vPMgYWiqx4QQZBH0?=
 =?us-ascii?Q?N0Dm2knalSCDbpAxy1x8yBzR1EAtQwjzPFouZBn/D/UGo/i8fXUgbQqg095b?=
 =?us-ascii?Q?fmJYqU3nomrQ4hJ0eOgYLeFYLrJ6aIVm+kHJJVM271I0TZh/PnAQ26/a2e9d?=
 =?us-ascii?Q?OWqfevapv52yy0BbX+lCQVt0UCq1X+K2zfX0Gjn9R46e5KV64Ow9lNZmF9ZX?=
 =?us-ascii?Q?ZCBzA4RsbWuB6I6e4VviYSHath2ScyjDGup/pVqtNrzwEAp/ojJppAXy2cEu?=
 =?us-ascii?Q?c3hN+VwvWsauqy/XicLB0/GmKsKDf97Lka8vF+wm8WbLXaoDpnQbvhnJFcmf?=
 =?us-ascii?Q?2EKRYZ69EcjD8RhfvCzRnqBQ5VDxPXmLpiBJ0lDRwacLfeyfnKtfZl2cNZVX?=
 =?us-ascii?Q?vHDTwLTWoC+4+OvNByKpiWBcn/jkJbv12uXBgeSjWGLJR5Oj0qte8h5UcXtH?=
 =?us-ascii?Q?6xdKWysX16u1QaNpDW7MM8rgIkaZDyNmXxWb8pOoC0P4Dlo0WRoyRFymTbGq?=
 =?us-ascii?Q?mP4UcQuuBCHByFAQXWO8QnLJl5Coo8iwDMM9gzDKem/Yk70c/1St7rEK+u2i?=
 =?us-ascii?Q?LzXSMtF/lHP3VJ9AJnSOTEAUcbQ/SFLGugUQeOvR0FqlH9rJa39WRQ2inav4?=
 =?us-ascii?Q?intL0cDbzfaslf0Xeip+sVA1BzS/oHhjvbwV3D5mYOhQl4hZms3uo0S2DWQW?=
 =?us-ascii?Q?dpgWiQo7Kx31gMPJuZO49FXk6+2WGtRreNg19ybv6D6poPN0Jebmh4LBUYtP?=
 =?us-ascii?Q?fkSYeP5EpAc/CgZSVMTNftFrleAQtIHM9tEQtcy+ZiRC+uI1Ek/3B8UVez54?=
 =?us-ascii?Q?e/oM8I2JGLFtL9ahQEzjC54tmtqpVnWNHmMdSCJLQwFXCxyQO5C70LFXqaFp?=
 =?us-ascii?Q?6H2VcOobVta937xsDVkvlk6P5dytSa1WCMyXclOjxfOUBYnJFj4oat4NTYV+?=
 =?us-ascii?Q?kPb8LnoLawzbr6TZvLdN30xRSrl3lEP7TWeGzKSG9i5HARlro0f18w70oKnW?=
 =?us-ascii?Q?TlcqsX9eIf3I4G/BDAkXQlgvUo/STMgjV0+xstf/idrM/8kBmvwzB9THylyC?=
 =?us-ascii?Q?lSMqFOicBIL5SzjkvfmS5k8y7TanXDBQiWbley5NHsCx5y7K4kEGwM5NcrZ/?=
 =?us-ascii?Q?wS+zOmfxZ9H1NfityqHCpm93Bq4nRiIRaWTGAr8SmvRZtJXa2do41TrVglGu?=
 =?us-ascii?Q?unBxBDq9Zf8ruasTXEQMkTq9dAsYCi899ybtAqDheZ6ZAC/4Cg2oZas3jsn8?=
 =?us-ascii?Q?VA/e97NpHzkhseO8Wbke68CH+PEU/Dd9A59g+kCG8wPaZ36UoasZerF4kidx?=
 =?us-ascii?Q?nk7h9UY2YiKGLsDpkStgYq6NIbrI9GdY8tu1fr+vJLDjRlb0Ia4mlbxRCvqs?=
 =?us-ascii?Q?aNNVoEvjpr5mmpXNC2X4H+c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2ZUnTkcCTTRvG2V+uYaUghQfNecuY4yj93uroN/fJRLQ1yK6Fm/f0XtG8772?=
 =?us-ascii?Q?hMN9tcgi1z+kLOs6fGDygxgq5YDYmsyH5BoQJdq4VTKLfRGKrOk5WJT3PBs3?=
 =?us-ascii?Q?I7VQm6p1rQoNjpLJJdhT0RWGQ9gvunMH4MJpb9l1s8xZ4b+xCydDDs3J/B0G?=
 =?us-ascii?Q?muABowPeL4rAbROp4svuufLq83RBbuTwm7NLPJHGmRc0KavQR5TE2zipxmvH?=
 =?us-ascii?Q?2iZkSAjhLiamnuzKFZZ4UTWq3Z8mnp5mkQZLXiO+cZYiy4gZ4Mj2Vbg/Nvkl?=
 =?us-ascii?Q?z9PbZ5y8xaVjarELbaScwSYRHf/dd5tDDOnbQMR7twM5MTrywnPRIvZEVvMB?=
 =?us-ascii?Q?GAiJzKHdEG6XAQL3jS48I+bAeRoxqToIeNjvQ9T03p7/kr6l7NM5zD+bd474?=
 =?us-ascii?Q?yhTEb8z/BGf4Y8+9/gNG3taxllGtdWYmDtZ1SqIR3Ua8DT5dCUXfcT+vmfZ5?=
 =?us-ascii?Q?bXC0l+KJ4oS0HYfldN97PtwxPTwiQuLFDRoUI/ZIrNcgHNTmMV7wfoS3uYYP?=
 =?us-ascii?Q?30ji2TKsNv4V5+MS5t/rIUJz/zTysLuiQxkUZE7z2dBioeojsDufgJPieaDq?=
 =?us-ascii?Q?HPu0NYckDtDVfe3TS8EBtY/yKzt/x9WKPAc12OiMXC+YH0GiUoVXh0y3Rsw3?=
 =?us-ascii?Q?USv9tedg8QiVRA80UfkRj+gHKrGfLIoIA/ovy/Y+07kVucY3OeM328mitLzs?=
 =?us-ascii?Q?qFGZQiSkHJJQCtYPQsdG5yfzqXn71XBVP8Yzk7Jwn5tthX2wEpJoiq6d1tAW?=
 =?us-ascii?Q?WuhKEeG+gdlYo4GfcM19dzuMAYakHTgJZQhN/8PagYjRDKWaKf2XHI34ajZ/?=
 =?us-ascii?Q?0fLG2jyuCSiZ0tto0vDYSO1Ik6Uxpz92rruNFUe0zbo8mgLB8gWc+dAAHO7v?=
 =?us-ascii?Q?mmgy+0Bpj/iq90c77Ms5yZ3sNgccLI/nTDUaS4DQZsADHfM3vO9PEhwDCSXS?=
 =?us-ascii?Q?fwY2LxMBp6tuJJ+WtXdcuiB+cWIzwTR4hyt28DblIFnjcAERUPM08qDttk2w?=
 =?us-ascii?Q?UG1vfYH0vvDQ1oLqNb3/Uh0R6LIqbTNCHmi7z2Mj8wZ71u/YxFVj1ccwRYv3?=
 =?us-ascii?Q?Cbq3pfa3suE8kBcZmX4MpDY9TSukXdzB8Cg3232mlHnpKh47zQ8JPZXs0Niz?=
 =?us-ascii?Q?qyXYy42SISjGNDz0GLlUQxi1KxZxcVc6F6tqBVAKEj2QsmuiZcpK9X8md5fE?=
 =?us-ascii?Q?A1B/Tkey9GZgLGP3gJVNBmZzhjrpnFa9u2G0TWBw1yQ0HD8/hg7sRomvW7Wi?=
 =?us-ascii?Q?sAIDzMkKtiMxsSceCmA0AWhAb7Tp+q7mQ9bsWdLFwIogFjjnwJlfLfsv1AdD?=
 =?us-ascii?Q?EBZuQRpTSC7mA3CW9SdZHuzi45ADhU4SAKzg0DmE8xAVc+qotG6OYdPAYXPn?=
 =?us-ascii?Q?uRXOGp1mdbXJSkQnA4asgig0s0iWdgZgydYaKzXSP5ncxrBP5w/nYLCjDcAd?=
 =?us-ascii?Q?mPfnYFuvU7asCg0ZXS+Pv8d56VYJ8HoXMIjWzBrPszO+aNL095LXN8Vnjt3V?=
 =?us-ascii?Q?cGlZCPRby0B/4BZjMh7z6twoQgMpUzDetdbwQw6Q7nzIdIv1turkmUW/vypv?=
 =?us-ascii?Q?xvEupYiMBgfJOTT7C950mtG4IGM+FvAPrxMUaD4pKUkoVhS568eMbFC/kL9A?=
 =?us-ascii?Q?rqi6yfLpsH1ZRlk0kpr73SM9TVe3iUdqCmMbrJz0Jwg0O0jbcqx0AqfgZzWS?=
 =?us-ascii?Q?UH3+aiRPYWMymj6aJuO8FrUls6RRgZFjq+KKl9vq/VEsehYzBbSsMJey4pXe?=
 =?us-ascii?Q?D1Y7iv1wdQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb578fe-929f-4b85-a187-08de6e436753
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:41:31.0428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRqVeBtf5Ji8V72sqX9Az6cLpS/TBzOdqNYGkFlGcOnFvYtlWUcP5mASg2UyG1xCbcirQfR2eAroZuQnutirNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11628
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_084137_537608_FB2D6852 
X-CRM114-Status: GOOD (  28.71  )
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

On Tue, Feb 17, 2026 at 05:05:55PM +0900, Koichiro Den wrote:
> Endpoint controller drivers may integrate auxiliary blocks (e.g. DMA
> engines) whose register windows and descriptor memories metadata need to
> be exposed to a remote peer. Endpoint function drivers need a generic
> way to discover such resources without hard-coding controller-specific
> helpers.
>
> Add pci_epc_get_aux_resources() and the corresponding pci_epc_ops
> get_aux_resources() callback. The API returns a list of resources
> described by type, physical address and size, plus type-specific
> metadata.
>
> Passing resources == NULL (or num_resources == 0) returns the required
> number of entries.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Changes since v7:
>   - Add a 'data' field in pci_epc_aux_resource.u.db_mmio.
>   - Add comments describing the type-specific metadata fields.
>
>  drivers/pci/endpoint/pci-epc-core.c | 41 +++++++++++++++++++++++
>  include/linux/pci-epc.h             | 52 +++++++++++++++++++++++++++++
>  2 files changed, 93 insertions(+)
>
> diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
> index 068155819c57..01de4bd5047a 100644
> --- a/drivers/pci/endpoint/pci-epc-core.c
> +++ b/drivers/pci/endpoint/pci-epc-core.c
> @@ -155,6 +155,47 @@ const struct pci_epc_features *pci_epc_get_features(struct pci_epc *epc,
>  }
>  EXPORT_SYMBOL_GPL(pci_epc_get_features);
>
> +/**
> + * pci_epc_get_aux_resources() - query EPC-provided auxiliary resources
> + * @epc: EPC device
> + * @func_no: function number
> + * @vfunc_no: virtual function number
> + * @resources: output array (may be NULL to query required count)
> + * @num_resources: size of @resources array in entries (0 when querying count)
> + *
> + * Some EPC backends integrate auxiliary blocks (e.g. DMA engines) whose control
> + * registers and/or descriptor memories can be exposed to the host by mapping
> + * them into BAR space. This helper queries the backend for such resources.
> + *
> + * Return:
> + *   * >= 0: number of resources returned (or required, if @resources is NULL)
> + *   * -EOPNOTSUPP: backend does not support auxiliary resource queries
> + *   * other -errno on failure
> + */
> +int pci_epc_get_aux_resources(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
> +			      struct pci_epc_aux_resource *resources,
> +			      int num_resources)
> +{
> +	int ret;
> +
> +	if (!epc || !epc->ops)
> +		return -EINVAL;
> +
> +	if (func_no >= epc->max_functions)
> +		return -EINVAL;
> +
> +	if (!epc->ops->get_aux_resources)
> +		return -EOPNOTSUPP;
> +
> +	mutex_lock(&epc->lock);
> +	ret = epc->ops->get_aux_resources(epc, func_no, vfunc_no, resources,
> +					  num_resources);
> +	mutex_unlock(&epc->lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(pci_epc_get_aux_resources);
> +
>  /**
>   * pci_epc_stop() - stop the PCI link
>   * @epc: the link of the EPC device that has to be stopped
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index 7a87f5962dd0..c68aaaf3542a 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -61,6 +61,51 @@ struct pci_epc_map {
>  	void __iomem	*virt_addr;
>  };
>
> +/**
> + * enum pci_epc_aux_resource_type - auxiliary resource type identifiers
> + * @PCI_EPC_AUX_DMA_CTRL_MMIO: Integrated DMA controller register window (MMIO)
> + * @PCI_EPC_AUX_DMA_CHAN_DESC: Per-channel DMA descriptor
> + * @PCI_EPC_AUX_DOORBELL_MMIO: Doorbell MMIO, that might be outside the DMA
> + *                             controller register window
> + *
> + * EPC backends may expose auxiliary blocks (e.g. DMA engines) by mapping their
> + * register windows and descriptor memories into BAR space. This enum
> + * identifies the type of each exposable resource.
> + */
> +enum pci_epc_aux_resource_type {
> +	PCI_EPC_AUX_DMA_CTRL_MMIO,
> +	PCI_EPC_AUX_DMA_CHAN_DESC,
> +	PCI_EPC_AUX_DOORBELL_MMIO,
> +};
> +
> +/**
> + * struct pci_epc_aux_resource - a physical auxiliary resource that may be
> + *                               exposed for peer use
> + * @type:       resource type, see enum pci_epc_aux_resource_type
> + * @phys_addr:  physical base address of the resource
> + * @size:       size of the resource in bytes
> + * @bar:        BAR number where this resource is already exposed to the RC
> + *              (NO_BAR if not)
> + * @bar_offset: offset within @bar where the resource starts (valid iff
> + *              @bar != NO_BAR)
> + * @u:          type-specific metadata
> + */
> +struct pci_epc_aux_resource {
> +	enum pci_epc_aux_resource_type type;
> +	phys_addr_t phys_addr;
> +	resource_size_t size;
> +	enum pci_barno bar;
> +	resource_size_t bar_offset;
> +
> +	union {
> +		/* PCI_EPC_AUX_DOORBELL_MMIO */
> +		struct {
> +			int irq; /* IRQ number for the doorbell handler */
> +			u32 data; /* write value to ring the doorbell */
> +		} db_mmio;
> +	} u;
> +};
> +
>  /**
>   * struct pci_epc_ops - set of function pointers for performing EPC operations
>   * @write_header: ops to populate configuration space header
> @@ -84,6 +129,7 @@ struct pci_epc_map {
>   * @start: ops to start the PCI link
>   * @stop: ops to stop the PCI link
>   * @get_features: ops to get the features supported by the EPC
> + * @get_aux_resources: ops to retrieve controller-owned auxiliary resources
>   * @owner: the module owner containing the ops
>   */
>  struct pci_epc_ops {
> @@ -115,6 +161,9 @@ struct pci_epc_ops {
>  	void	(*stop)(struct pci_epc *epc);
>  	const struct pci_epc_features* (*get_features)(struct pci_epc *epc,
>  						       u8 func_no, u8 vfunc_no);
> +	int	(*get_aux_resources)(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
> +				     struct pci_epc_aux_resource *resources,
> +				     int num_resources);
>  	struct module *owner;
>  };
>
> @@ -337,6 +386,9 @@ int pci_epc_start(struct pci_epc *epc);
>  void pci_epc_stop(struct pci_epc *epc);
>  const struct pci_epc_features *pci_epc_get_features(struct pci_epc *epc,
>  						    u8 func_no, u8 vfunc_no);
> +int pci_epc_get_aux_resources(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
> +			      struct pci_epc_aux_resource *resources,
> +			      int num_resources);
>  enum pci_barno
>  pci_epc_get_first_free_bar(const struct pci_epc_features *epc_features);
>  enum pci_barno pci_epc_get_next_free_bar(const struct pci_epc_features
> --
> 2.51.0
>

