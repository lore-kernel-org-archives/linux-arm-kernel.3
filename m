Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE13C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 19:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmF6nrYHFX7Rgwn2QslL7TP67rtDZfY39GsJpgrgs60=; b=t6aXSUSvc4/pEglAG9Mnps6Ryk
	/hvztW+aa2C/6KjN4ifov1BjCInZWo5NV9OOxvVwJNrzvkIYmNpzpfswfVe6mVZsbSIp+9l/yxMgM
	0b1o0zShcMCwz720RR59eDC+YF+EL+vqY/Y66S9C4IDuOxwZaeh3+gGBAsZVeRiEHkO9376VPmVwK
	TuEHtTNcBd/EDxhif3rMWCxs6trZrhcABrkR6u4slmAez5gx8FjCAUggfdMBk0X4rbLioV4Nu/Uuf
	gXb5UUjoMwQq571MJav8yguFqAtaX/k2qU+zAiNLbx7UBPU+pCKsjUoFi3gDa4F2uSHlp0DifCiTB
	1lESzT+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6v4K-0000000A0sm-2COd;
	Wed, 16 Sep 2026 19:13:20 +0000
Received: from mail-westeuropeazon11013059.outbound.protection.outlook.com ([52.101.72.59] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6v4I-0000000A0s6-2wW7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 19:13:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCBRBrunsiedP4XXdZsCAUSYXPT8LG5F8MpjKmirewOgpdrKizscnAnqid9S4bTP7JMPBQixpTpOIacSo8bta+Jk0E4XBTx6vBZpRj34GcX7ovD4zi9031NK1kMkUpceudrCtUea5FIKIkIBZL/VHmfEkzTcbVXy77SKcYre3+UN9FGSNO+P1ZfMNEOfWj8KK3YHcy0aXpI7RiEyzehsh3JRA7DyVzYDJEpvqIf8FkDs8yQ/ywNNFQk0poLXlzPO3QBTxCrN+Xyxh2aK8LcSgMHok79caypxkV2WEwVLfoVs1ekAmlvqYRZ7IdXVUFP90sxhLQ1Rs5lNUM2I8dbANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmF6nrYHFX7Rgwn2QslL7TP67rtDZfY39GsJpgrgs60=;
 b=t/CAe7Z5S5rdnJW4HiRi3k4kwJmsJDpWq2x9s1jU3nC+4t788NbL47rVYrLEJ4JmWvwKspEu79BuMPwzcCxlD1GNcxbmpm6OLsmSKleJzlzkXMbqRYHnzGNYcbX6RWCoSmA6vZyb1yX+qYF78ksKU+19al9xDqOe5Apid2QAOxgWc5w2HOEcVadmH/VwV8m/3aj9+RGK5jE1cfKQq01fv/z2+7L3xB12CaSg8tJ3b9X46+07TRydv4fzUBcCQemWdxffSrW9Qg1pFBK1q9zQxDR6OhEMbzQxA0HkGsiKPhl+F/QHCFbFpgrzuntArfYDoUJtF0IrfAJkZmlktx3SOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmF6nrYHFX7Rgwn2QslL7TP67rtDZfY39GsJpgrgs60=;
 b=aaceHL+AjaLnyBIFOXDY8pLSAveKiQUYQHqTAIjd+lex0lRPtq9JbkG9wskWw7XqOgmb8J69lZPpX+IPKfS9+YghrXwbt1zsDMSWpCRqmesIQQka6AZutxZN5uBS8HYfRlWPa7ecvfrfTR1exfjQp+OP7wcLLkvWy9ZtB0Izp8vFQhNduMSnX5vZmi4nXpwwwu0Kiom0A/GM7EfXuJUVaiozKqenqayH8D3gJ77biHNv5Cww193N9ioefMXgbrOINsLExy/bmrCi7gj6DJHXwQXLgFKqX/RmRf1jezSuh/vAQbG4lulmHSD74SbMa9Gh2gsy5wYAqLnZ2tTuWzrEBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10046.eurprd04.prod.outlook.com (2603:10a6:150:112::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 19:13:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 19:13:13 +0000
Date: Wed, 16 Sep 2026 14:13:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 4/4] dmaengine: xgene-dma: use named initializers for
 acpi_device_id
Message-ID: <aqrqP9aHervoFsWy@SMW015318>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
 <20260916-acpi-dma-v3-4-0dac05654967@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-acpi-dma-v3-4-0dac05654967@thegoodpenguin.co.uk>
X-ClientProxiedBy: CY8PR19CA0018.namprd19.prod.outlook.com
 (2603:10b6:930:44::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10046:EE_
X-MS-Office365-Filtering-Correlation-Id: dd58aa17-be2d-4055-754f-08df14268e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|19092799006|376014|366016|23010399003|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: DruDrgUHclukT3h3fu80aJBkNm1ikfIb245h226Z256TYAuocmlLXSuLpySVB5qobjs3zuU8nb+CnaIsF11kzr7Wbogp6sTA+wxhzHfD49B5p9g9MD+ox+2QkPihPIJFMSuuJ9L9v/neG3MXcS3TLs44qOZmXpaHlHJmPJOwShaCBj2CBx176edaKj7TgIbaP/Xn3ppNwNsR5cCF47XjOxPP8O17F/dYo8LJ+h1HcnIrKLoqG1kCexd4MkXur4aaGONH03eGf+AHddWAIiW3BWhvBST8XryMY+7Qkym7qcsGX/AsmxRt/ZhEtDR88f8pHBs4zirU/Tsw/cJFsCFkqjCESysG3edMP3e9iL+I88OiG8rlHQ/cdJuuv94LOb/k+u6MoI1j5ifiQ6WaHp/7mJYg74wxyMBLFfncEUP7qWSzpQRYxqJDWhU9n6LKcBovUdB+WNmJZsMQ+hMnjDC6y/Wk8C6LNkE88g0gnImiRWChcJbKTZWMYmPBqLzsPZpnykDepuIS9XRTrqLTVvYbi2jBNDNRfBH7srcyGlw5r1DaK3Qa3YTvEfxRE9X4fT8r9FggjVtkly029/aMgV7UyuB8+Ubd0X9u0Y3qZan2VIXbWrxrjQr4M2WNY82NUHDkFOZ7eSyS8R4wiUd6VICoxwzbd0/w2nW7HKIjcIvSLTs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(376014)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5u4DMkg/7w9aecDa7BLKug4HOkantOLhUgb8ruWwFBRR7de8Kc3Ih7dou9O2?=
 =?us-ascii?Q?HQIIMHRMtKzjmPF6JivEL8VYEVrkwBfkAU6G9RmKjF/7h6X16da7cUrj26Pp?=
 =?us-ascii?Q?IM/2gcj4rh8V9K+optg6pGeJvr55099DK6fdw/HfaMwTi8US2IzEsCl6LtSc?=
 =?us-ascii?Q?5X3S/2DIPAI88tlaZwd5dVkkiYGdqqtJK3SGNVn9l6MWLnvJ4JY2GuIjHojP?=
 =?us-ascii?Q?IxvjwNhbzM+fFW0n5/h6YkW/0t0Z0q3CniViLDSS84oFx0r6Dhwz9H2lQuRk?=
 =?us-ascii?Q?Vey7PkGtdfcC6i0bwgExtdKI3dSnAp8YzQNsz6cax4JEEK88tAzNj5zzwzrJ?=
 =?us-ascii?Q?IN615lA4UZM/0nSHse2wwI/vnnlhnD8Y6qeac4ZzXLACgzZxkc0xKJ2Vq/WY?=
 =?us-ascii?Q?x1cUYyjo0ByPYYtm7F0x/3G22nwKEI6e7fWdz1sDbYhwh/NWpfF/VoGvt1kF?=
 =?us-ascii?Q?jU2J3/2FS9dCoYXjX7AZ9ds8TpKu+OJsr0konVNXcOXIC8HQK9LTVjkt7PPg?=
 =?us-ascii?Q?ZbpAaOibp28uRCm+kMk81Hdl47nZ4sxW0tyUHKhBNioVZpNk5UoY2VB2EU+A?=
 =?us-ascii?Q?wI3zwClgZG3p3xmubWboMiEZaG0V3dlUcY7I8Ttk0wE2x739HdxTgI02Qhn5?=
 =?us-ascii?Q?x//4HNhgXXXXgm9BwA2bQt1KAHmey0c5JK9zp4v45n5qO0eLQdRz9ryNjF8b?=
 =?us-ascii?Q?RgZBAKLI/75G82JCJekkAWuS1mjlSC/9BTex7zVg/JR90QiY8U6rSPwEB0wA?=
 =?us-ascii?Q?21cg31yGL1rxBf34vWEHZJ1A+RESn1zfMeTgQZkejiUTufodwvdKSpAOuxLY?=
 =?us-ascii?Q?P3IUz5G6DABY+EYA0V4xTcjFUtk0xjEIeNKiHhf4SlOXK3MP66lOTpQyDf9u?=
 =?us-ascii?Q?SKUcJ2ukWjHNT792b9e6wXoMU0Uy+8Yc/r5NLXEPPz4if1SC0nswLnJCTAEv?=
 =?us-ascii?Q?RQ9W3x+/J3tJhVO+3ZqR5Vff/27++I0rohNIiYK6n7r+/ZyBArgOSRoxljRp?=
 =?us-ascii?Q?93JdtwRxkItGM3GkC53skrWE6FkpqRuyuF0Z2y/jFRgTnfv0g3WQNLIhj6gF?=
 =?us-ascii?Q?RDFYLCiNyFoX4CWVXmzlHuWCGKPuLPCqbJhSHIh6yEPk2pWb+5jrZpbshAjW?=
 =?us-ascii?Q?aYMLPESnex8wmM/OXOlIEuk6VkdTg/cAtV4+AjtaPOT7RNYuhEQiMC+7A+vh?=
 =?us-ascii?Q?slbjvicQtibIcBE+kgUYL81vjxqqpsG4fQTKhNXy4Hj5jfZUAAZ6bKHeR/r7?=
 =?us-ascii?Q?y023z7h4HUU7a8iBOqJ4XMLyR51xrZdGdhEpvadcNeo7XUj310pERITgc6Tc?=
 =?us-ascii?Q?LfLm2PX2GqalhXKQwhaeC3J5UWcKpnHMrTW2qs8RpVv0zQ8MbmEWvrju0wIu?=
 =?us-ascii?Q?sDTavXmLgYuqM7DbkSEvrejV+OUb2ng8kBF+FvrlXlFwnMfkIiydPYei0cPZ?=
 =?us-ascii?Q?14VZh6JBIw2KFZZJffr4eOH1KXJ2w3MjCKd9KXl0tUc1DsV6/c5J8dxx8QbU?=
 =?us-ascii?Q?HBQdzCCbQltyIRurvZS7qZmhAlNe9utGNuoKadcS6uN0a4nj/0MOx9g1wpdy?=
 =?us-ascii?Q?7pI1AtIQarYw1f3fWFVN/nUk26yjf7RMyNYNiUof2RHbxSHWwAm75TGqqpsc?=
 =?us-ascii?Q?1FzpadTWHc6QzAG5jqNKVh2H/tR95lQ43XT6B2tTCqoaJyoh9E6QTb4e3Hzo?=
 =?us-ascii?Q?TrW+nBwPcmJdiu//WBKBIhzl7Ju53+E5XD8n/t7HwjqsevkxVzPlH/+e2tnC?=
 =?us-ascii?Q?gHv5yfuOve4nz/UBZFqntbMptTP6eMEtm0WGWxgvaLDvwEy3cO6D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd58aa17-be2d-4055-754f-08df14268e1f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 19:13:13.8609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NL4IBgv81Y6f8e5dn3mJYISHx7+bLjZ2KmV0mh6tpzJ+hORKVUR5KHuZaUe1FKM6bPMYQzVau3oEEmwowTmSmstbCLv9EoBJrTiMfawBz/nH5TMPMJV7DqauWfHIW2A/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_121318_740649_2D41E227 
X-CRM114-Status: GOOD (  19.61  )
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

On Wed, Sep 16, 2026 at 04:27:57PM +0100, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
>
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/xgene-dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
> index fa1173e49900..8d1c58ca0d48 100644
> --- a/drivers/dma/xgene-dma.c
> +++ b/drivers/dma/xgene-dma.c
> @@ -1800,8 +1800,8 @@ static void xgene_dma_remove(struct platform_device *pdev)
>
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id xgene_dma_acpi_match_ptr[] = {
> -	{"APMC0D43", 0},
> -	{},
> +	{ .id = "APMC0D43" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, xgene_dma_acpi_match_ptr);
>  #endif
>
> --
> 2.43.0
>

