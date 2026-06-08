Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53571CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihjvOsOYU4oUPlnC0/UxHWVEwhdUB9GWGUsQpvfAQpE=; b=3oRIbZhnU2kFdbW6PRwnwOPRWU
	AqW8F0cKp9LGoQIu08COPJrpPsh7sFEkwISnJn7jkfM0e3Eze89KDrQzgzmbRG/sixJFhwYN1A4xy
	4wr4ZukX8CEAeFScebUcK15mYdE4mN7oJk5jHCfEw/isbAKFZq2wW6ttZK/tkXk9qxVXxdhLQzI+A
	+PvMEK5myguvD/FKVSB0/Ellj3FuBvkcd9s0mJ+Xr+Vv43D0Dl3hQMLldYxuazFtp1KWo4lRyqfmq
	YVTGQAgvvy74oOYDTQ/onPoCvQwcuNlA0eGnTAXPzElKpE5keHYMN+UvDUH33vpesZH2crOW1hI8K
	EF1C0TdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcou-0000000447U-3GWM;
	Mon, 08 Jun 2026 16:27:24 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcos-0000000446r-2BvF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tej8mEYUKJEZc1+NYxV2dMKjxxnkpIdZVIEe9acw7lE0fY0V4ZHXgtTiDPRQDVqWJla0P2wAhB3h1OPgbXh/IMWyStEm+XyR0iyqRqLaVXX5njJ1wiR8gcgDiLOmROAePyOe5pfJ/FqcQK1SsYnhUZlogVA3k79TiyPqm8r6oPl/zVjFCGcJyY47sXAJxrIQ2mPoRxdeptbtYaQummO5dV8yYyGPQnBtlPsycsksy5XZw72GV8PVG5SPbjuu5ixELhCWpZXp+SnmuQl/zy0DoszOJKd8kafyw4smFWwYdaQOUbblOQTBsxduYsiZH+69FzM5sB0rLJFtIKUFMRVjIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihjvOsOYU4oUPlnC0/UxHWVEwhdUB9GWGUsQpvfAQpE=;
 b=mm9fAXJfh6tIPh+0il8xLZBKgcSjw0WmaCTEFH+USM833+9OWK8g1kQeF8e0d+gxKWdinbaYYJfBl1KROcaYczaIDC8i9Z7BB6scG6hUjmfg+vhnUrLtT5iZ3PWRCchIz44UNToSW0QwnNFPHlI5kfG7pBYZJBDHyXuiMXh+2T5quBgVH2jN1NuQaa5UBYH2WoYoFzGv9mALMSfDvyJ9vdOjqeenxiZawuLmTKyhs5aoH15kqJlhnHThDgTOG+G5eFE4H8wJDs+f9NbCUEJfT3Xhl3mpAPX7RgeeoECevb142S5gnxHUFLN25OfkaacOaUHh27pAV2/PhoHM8Ybypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihjvOsOYU4oUPlnC0/UxHWVEwhdUB9GWGUsQpvfAQpE=;
 b=IdJ7s86zWvyJT3WLTXxMyMDqV9AAMhsWYY4kn4Zja+frP9LTA7CjM5dZ4ghhz+fr/3gO9KL46f7St2KqXBXjawliaU+7xiEbuoERRhe9Pf/AAt3aUsT79f4MHdmTHkB8lOavK5AAot1lXm95NemR+15nTVqCDpuaLmsiJebCcX/Stxv/JH0J2DqlqM9sko9OPWy/SMUscOT0LJy7IU68UJRUTpcAofQNw6Or/potpyQnFUEADok6rPeZ/EPmy8Gp6sCsgSIIkYL/Ha9+45gDizRKPnK6bKv5JVto3oP//gXpl8im03UKPM7hXIrruMDilc+e510CTorqn8MsvgNfGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB12278.eurprd04.prod.outlook.com (2603:10a6:501:88::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 16:27:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 16:27:19 +0000
Date: Mon, 8 Jun 2026 11:27:09 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: okaya@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: qcom: hidma: use sysfs_emit() in sysfs show
 callbacks
Message-ID: <aibtXevTXeJ499Hg@SMW015318>
References: <20260607163119.78717-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607163119.78717-1-dennylin0707@gmail.com>
X-ClientProxiedBy: SA0PR11CA0043.namprd11.prod.outlook.com
 (2603:10b6:806:d0::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB12278:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a9bf30-d70e-4b47-de10-08dec57acf61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|6133799003|22082099003|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Ml/8W9Ixf+mRqaxAtLHg6lD4+5LgaIrdbuyJ/nykXKLlgYq+rLs3Sfhmc7nLhmCn/mq3fmii61qgCwfkVph52tRpUZ+1VOSm9QcVzf3KFLanl4W3huVjaXQiDIn3csseHZxr5fY8Lwm1g9WDQHSEmiP7luPX16/QL/XhreKC6Cdt5/qSywq1Pk2k0t4LEgjHLORJjy1Oyvh4gZ3rnHhWxmBb1bscWGx7BSDjzRFIxdzjoMnmX0Y6cEbi48reXDinLs1bDSPkiY4O04mtfyL0ALssDpY/ZeVf+bJ1nVBI5TC8kiWmYpDTFjScLRtyrB3Qb2eHFIfhUUedYaXku2/Y29In5traW5Pn1dFcrSprEOpaspWBdxkjhMrvCyYhHGnjnmEyy+WvbsbXyz46ab9zCNorxzwvbxxSBlaQqGM2Qp/9Kg0otyGNQ2GMsKdKpHtTfMK6aYQ3e6gZ8DUwqoxwcBHrnIAj36P4JxhFVct8Ywyd24OnyOHT6q6+5l7PhFmWI0t21GxhhyuK4pZdW75L5JN8MdltMkp1BTdjij9VTIb7a6MTHbGgTm2DX5dZyfLmgHHgnkLUhigI1bJwr2NXyCvrNZIujiymh4lSehl8IuBuEZmSaXBJJsawIWKCimmJpyyPffiH8yoGahzqkJPDeZq3lI59bvuHEVzNKNlHMCLkl92vdKs/P1idUXHGn3Z7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YwbMOKd2RfXyBlsfeBqYr3r+Uk324s/mvFymoNkV5+LN41Sq0IoLCEYHTPwB?=
 =?us-ascii?Q?w/auQqTMsUQaMY6fQHJbjsVV1ZNOw8O85cNRik+GZKR8+t8nv7itU4E7cmuf?=
 =?us-ascii?Q?QO+yp0kVcF9sXP3qDeZkkJ7yJV9samQ+0aaPkfB6oW2+bqaO2Wggz7xGGcUZ?=
 =?us-ascii?Q?noMTCkjyr4+6leuKxy4xzqkZycuphsAIK+R+MeDEEBb3F9m0KqQsVX/IF1Yi?=
 =?us-ascii?Q?0HP8pZjWs+MM8o2/k0/OaIae1ABzrJAewfCAaTxrBcYeDfE9UorFaFd5TogN?=
 =?us-ascii?Q?sqJUlcziBpEwXzYh8Dw3ZRIFH2KlYoTLPKUAQft2XN6tNGVR/ACk/Y6Lakpm?=
 =?us-ascii?Q?OmeXRcQK7A90KwEcG88m2udKVbgHcCH2QyxYVj3p6wZxh5k21/RSKnekt3vN?=
 =?us-ascii?Q?jNJP6hpmybrsTyIkqVluLWxDFEVObJxMwTtvEE8TUk3j2/DGMiy0zxVXs+HS?=
 =?us-ascii?Q?8IE1cUn47LB5EXb7243cauq9gK8S42N37saURCl7OveV4DrqW2ii5ZdUVPrO?=
 =?us-ascii?Q?a5meCydGzlK7GxrRY4ncso96k3+KhsBhNckLyytptQbcQdrlOPjtW3l/N9/Y?=
 =?us-ascii?Q?dW8OkTpQimEaznLmUTl20xBJfKebPvy6QQ2ZTXOa9+tW43hJ2wrkm9WjuA13?=
 =?us-ascii?Q?+KxBCVCZu1xv8h7bX4BirNXBkkstze7KUzzWP+Cjn7NmKsGXudW3gid4ozo1?=
 =?us-ascii?Q?i3RS3kC8l8uZvmjkmTwLFyTqTD6coo+NLbu2qutk40RjqZ7QJAukCZVwpwIL?=
 =?us-ascii?Q?63ThKqNG1DvSLkczUNLIKOL8mH+Rg+LepQ2EXyMlGYouO8/uiUTxFPQOOFVH?=
 =?us-ascii?Q?lugXjo7WqDE5TrtSCdpa2IwKExy2k2LgxLbQEtaCuhEi1PNCQ3DMR9CtlLDs?=
 =?us-ascii?Q?xOC7UwZtSq3vrecBJZIYtet0ZPT9axGpvVdqhrfIHVpk+giv6rKrd3PRxvQj?=
 =?us-ascii?Q?LK3z8JnqmSLqOysFrKKEDsYayg+/2N9Y0xL7z0FpxkLZRUYwQCcsFmoFNfmb?=
 =?us-ascii?Q?WIN2Ao0oVdBqh0nQB+SsVuyMygsdnREYnUAPIvPdNNa0VtkAfH1jHlchou95?=
 =?us-ascii?Q?ueAgk5kZOU3Ij6LzTKDNRQnYZ28gGmk3GlkENusFcq0eW9MXa9pZ9ASW+tTd?=
 =?us-ascii?Q?dLeefboVYhKfoPqacYDF7T4p7kpN64o8KlPG6eJPrh+BDlmWL8XW/H6QAru0?=
 =?us-ascii?Q?VqRHEMZIqeqROLqrjcLHexOY3T8nTbo8W2jjH0T3KaJsXl66aEMKVVev+sG4?=
 =?us-ascii?Q?iBeb5OU31xezDwFaz17zZfFrVNL1ru/LGW1aG/liTyvq5Z6Q8gJn+niuDN4E?=
 =?us-ascii?Q?WioItrXWq4MQ76wnLFc7xxYFjFzU88QKgqxtpT2owy/3zPeBeCChtPSU6rLW?=
 =?us-ascii?Q?3I4N5nFfdILMkOAjh1riyhWm1WEzHqm+3cAkOruqmwC3AoTSKpATs2PeEe/X?=
 =?us-ascii?Q?VdTPEMVNazl9jhiDWL6fr5P4SwlRMM3Y8unQktWluB4+ftgy0W+/U71V4FJF?=
 =?us-ascii?Q?fzGNq96yv8d4BlXMcYKhXe5SoQETS1FICImzryBUAMwI+h71bEPbGVp+PyFk?=
 =?us-ascii?Q?v1T/Is8oPvLnDSuiAGIkEYIUuFaQdb/7xXLYtxHElnAqBJA3XZXNZcC51hyQ?=
 =?us-ascii?Q?eu5dDCre2A11o7L42z00uez35hoppt3uE/jyjW91RtZFuVCPiDSAPYppUgX/?=
 =?us-ascii?Q?8DXdKzC3wN8pvQj0cqcb0IE6uaz4OveIG68kFt+PG1zC0PVoG3ceAeHktnfw?=
 =?us-ascii?Q?/RqzJmjL53w5TExu7BvizKsPrsr95ek0bgMgi6celybdFXk3NiGj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a9bf30-d70e-4b47-de10-08dec57acf61
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 16:27:19.2636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHS9+wzg6TQgjtAv8l0iR6MsR2qCUuOw5MqsPrztZMEiacc2576Joq++wJR0pKAkLmsUcSgS1OdB8F5eknK8NseqacQSUdruq9VWLjucsOMPuKiENpp5/yyYOihpXuIQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12278
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_092722_562295_08994BA0 
X-CRM114-Status: GOOD (  19.52  )
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

On Sun, Jun 07, 2026 at 04:31:19PM +0000, Hungyu Lin wrote:
> [You don't often get email from dennylin0707@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Replace sprintf() and strlen() patterns in sysfs show callbacks
> with sysfs_emit().
>
> sysfs_emit() is the preferred helper for formatting sysfs output
> and simplifies the implementation.
>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/qcom/hidma.c          |  6 ++----
>  drivers/dma/qcom/hidma_mgmt_sys.c | 19 ++++++++-----------
>  2 files changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index 5a8dca8db5ce..7a7f302a9699 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -624,12 +624,10 @@ static ssize_t hidma_show_values(struct device *dev,
>  {
>         struct hidma_dev *mdev = dev_get_drvdata(dev);
>
> -       buf[0] = 0;
> -
>         if (strcmp(attr->attr.name, "chid") == 0)
> -               sprintf(buf, "%d\n", mdev->chidx);
> +               return sysfs_emit(buf, "%d\n", mdev->chidx);
>
> -       return strlen(buf);
> +       return 0;
>  }
>
>  static inline void  hidma_sysfs_uninit(struct hidma_dev *dev)
> diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
> index 930eae0a6257..9672ef9ee8fc 100644
> --- a/drivers/dma/qcom/hidma_mgmt_sys.c
> +++ b/drivers/dma/qcom/hidma_mgmt_sys.c
> @@ -102,15 +102,12 @@ static ssize_t show_values(struct device *dev, struct device_attribute *attr,
>         struct hidma_mgmt_dev *mdev = dev_get_drvdata(dev);
>         unsigned int i;
>
> -       buf[0] = 0;
> -
>         for (i = 0; i < ARRAY_SIZE(hidma_mgmt_files); i++) {
> -               if (strcmp(attr->attr.name, hidma_mgmt_files[i].name) == 0) {
> -                       sprintf(buf, "%d\n", hidma_mgmt_files[i].get(mdev));
> -                       break;
> -               }
> +               if (strcmp(attr->attr.name, hidma_mgmt_files[i].name) == 0)
> +                       return sysfs_emit(buf, "%d\n",
> +                                       hidma_mgmt_files[i].get(mdev));
>         }
> -       return strlen(buf);
> +       return 0;
>  }
>
>  static ssize_t set_values(struct device *dev, struct device_attribute *attr,
> @@ -143,15 +140,15 @@ static ssize_t show_values_channel(struct kobject *kobj,
>         struct hidma_chan_attr *chattr;
>         struct hidma_mgmt_dev *mdev;
>
> -       buf[0] = 0;
>         chattr = container_of(attr, struct hidma_chan_attr, attr);
>         mdev = chattr->mdev;
> +
>         if (strcmp(attr->attr.name, "priority") == 0)
> -               sprintf(buf, "%d\n", mdev->priority[chattr->index]);
> +               return sysfs_emit(buf, "%d\n", mdev->priority[chattr->index]);
>         else if (strcmp(attr->attr.name, "weight") == 0)
> -               sprintf(buf, "%d\n", mdev->weight[chattr->index]);
> +               return sysfs_emit(buf, "%d\n", mdev->weight[chattr->index]);
>
> -       return strlen(buf);
> +       return 0;
>  }
>
>  static ssize_t set_values_channel(struct kobject *kobj,
> --
> 2.34.1
>

