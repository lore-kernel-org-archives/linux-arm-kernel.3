Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A339109B47A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcOL3Vh4pwkqd9kOphdXO12VUXfppE56TJGlIPr/YKM=; b=xLQecNzlb46M58iaTmWWBIWqCT
	L+ISRaEoOIZw927myhcEhAV+/0jxcAeW8IpTXgHk2tva+rlMt2H8dR6pQB7uk9unFyqsRje3bRfm7
	eH6/KnClXcvDCoYUjTMzmwTbpFpQXpAHjQyF6aVGnUF6WGHsrz4OTl3g5EDkyw0V1x6R+jhr4qCij
	EVv+qpF2yoncUOCUYCjmdURcbCxrIDoEwDixjEPCdSBBeCn6HghlTi/pHL1EEBPjgli+vEbMk6F6u
	oN5Xe/eo+SFN/4+0+WE39R5R+WRjm6HI8HIn9t02XpSoijpf357viALT0e5jkrqVAfstokJsXh+VL
	w6LYEAqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aA6-0000000D6w5-1HSq;
	Tue, 31 Mar 2026 14:33:46 +0000
Received: from mail-francesouthazon11011039.outbound.protection.outlook.com ([40.107.130.39] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aA4-0000000D6vI-0GM0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 14:33:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tH4qxLn/CN8x83/IVxNh6jRlKnPuZfRxQwjxFJa8O2ENH3XmcaqKvA0QZ/KSvJPbw30SH4ZFIUGGVctX5RZbS/S7EXwKcrAlg6iVY9yPlQsPgYuBU+qtUEIgbD3t89xpNVxUhNAm0+AR5b211QliioK3ZPIFOSS47N/3wW/D5TSlr31xrYWj9ebJ/XO/uxv1gC3jqv06q/BJtPb4/aRhfI/22gFSdUMfDYb7pcppbRRTNkCiwRbabVOUspm4lcLIM7s/6VlDKIIetNE7MBv4BVS+7iCkSPloW0K0imwLwiiNyBDvrGQSAv+FALZVYr4EwkYF4WPWumJtiEF5JZABiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcOL3Vh4pwkqd9kOphdXO12VUXfppE56TJGlIPr/YKM=;
 b=j8jvswcaoiupYFktXI8mv7exxkEJ2xpcIhTO/FmwzBpFMajEjYw5QaTLpnZ4IOEb8WGSX0Yag7qrkFEbNfgemZIeLJB/HuJTMuwJ3zze7LYRCrb+3plh9fZA356xeKMuYmglZi/7kEjqOvwIlWou0PILGgMNAPIlkHE5J80ezuSPH4qNcl/l6D4k+eBx0QFJgqdqs/Z7pX6NLmFB7P4wcQ9PnZbPGV8MOQwE1/s3x6AQDu8/zNfuywpM273nqjVDHptkJK1pZ/FhEwv/hQAJi//WEC4nrW4Nlwcm6TKtYKpFbH0y6fS1fwo+AlWVRB4JfwI3YSI+BIcs7kTbXzTBuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcOL3Vh4pwkqd9kOphdXO12VUXfppE56TJGlIPr/YKM=;
 b=J3Gedx2aQN0bBzkfm8vUQoACvbVRHAHwQLxdlGD7rpCapfEHsmIFxFS8AqbozxaaFLq66fj7a/C2RrrlevvOXGuC1JaE7ahM0IPMHLFP9KmxLUPszXPibx0BOZWJggbtoRuv5dSDuvNmX7I7Zedo0vw7Fm/IFpLfR7I2e76urE7CNXkuaU/13WwfE1U1DUk3Ee+UDmE3OlgkX66a6oDbSsjm0phhGx78k3sJpv+t7DmbyYNibBX1NETKorON8xSLZIVk/Bad0rqI1AXU80rD5mWmGh6xgAy6NQJAbNy1kGKz/Yki4cUQe5c/SyCu1p+zlhoBdGVggUgHRCNMY+0ZWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PR3PR04MB7354.eurprd04.prod.outlook.com (2603:10a6:102:8e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 14:33:38 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 14:33:37 +0000
Date: Tue, 31 Mar 2026 10:33:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 1/7] media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE
 control
Message-ID: <acvbOo17tU-s20BS@lizhi-Precision-Tower-5810>
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
 <20260331072347.253-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331072347.253-2-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH7P221CA0055.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PR3PR04MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: dda1fab5-77d3-4c91-3ea4-08de8f327f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MyBr552MXGqCPzK9UUcIkHCq6gZraaT+0E6NIgtuEP/YEgWOlh44ijyazPwRwOmKyUxmKVn6lX86kNBkJYmpNxpJtGohRCsoSiDDaz6ZBqeudLRsvCsxzvG8xL2czmmLRqaSMeiEDx9ZiIO2buuPRgnFlsEfXs2EEUEJmak9BcqEcS/+EBLsTzqMNQNz+Jn9wJ7z0GJ5gpWe6FxWSk904fuH7joDQHVSoPTPVvW+E32SyQUjkTMC/742zNpEAHzG48jMZOLDrD9ehcd2iiM8Q916EicvieE74TsmKlFqwUFjV1txGPZ2psW4vKeLgRQp2NBk3fYNscWSIK3QZyLafUCJpkXO2sI735UmBNGjVn9Hh00LcqtfEY9CwxgvTWjNdCGokkh5SPOZ2uxL15bshbQKfaYs6s6Esy2B9uj3dCYXtRfdzcS9kEtLm5ZoIuhv57RGJd64k5yLLa8qnYD/I/9TTLZM3xVt4c+y+tsSqc/JLZ3fbdydZhESNUEDpmLO1anbSPNfxMttlBzc5Q1eGgtZ53YDQJzyOeRekNbT0maumTvjsEq5ClE35hIPknXDhUwuk2e8OXqBv1kYA3rT36yHpeF7xnZO0Wj5k5gokyFuMhKUmuBYkior+UsiB9tBle1l+O0nvOtHJZPnJ1F1NCEGZkNRDns0CLpxKNXCwAV1IVBSaVK53/i+hi2DTwTLdoH1SPwNrrfx4HW3K3U1szAR2TjYTihgjMpUu9t0ZXuGJ+tcCrEqSO81v0c9Xztitajo+Y1iD6Q5ChX0QKSDwmVPRYM+GMG98SLwXd9BhJU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9t2BHxIuixm8Xo30V7psL8sLvi8SKkpLtGamCwW9pQ4Dl949gnKXF9SJkFjW?=
 =?us-ascii?Q?jHhLMC6sT9qn1aTN/iphM7JiFeCXgmI6PpEK5YqvBvu7DF91ucSO/gEhZ1hA?=
 =?us-ascii?Q?mKGPXlU7g981PIyrTWmhPKFxPpw2Q5gFJp6v7oKF3d5I+GKb087dBQIv3afw?=
 =?us-ascii?Q?UjLMNwUC6f4d0pVfBYdk7nKhyB6XnKH7I2p+irTaz4wx5rkxelO9RePWvKdt?=
 =?us-ascii?Q?R+anC+9kUoCTuPS39eslcEhMirERE9dz6LEBpsbzfpNi2bhcdjmfCaWTbcW9?=
 =?us-ascii?Q?T9QOjUJE+FL1JRxJtGEH8MM5xF48DN9u5WU+2lSr3upa9tWRF9arsn+stGsr?=
 =?us-ascii?Q?iM5/ZnPOmqTf7OvBqLxQK9CnJRymb857YQY0szeCfek/Fh8GlTYp+l1I6M/N?=
 =?us-ascii?Q?6puH0KRfItwCqPYzDCC9gEFG0tRGxmsyTKKcvcEkgka+ANbprq0/e7lP0n3l?=
 =?us-ascii?Q?oUCvYmcM8Bi1FNBBwmk8K+xG4rAqi+WFKZsrtj95rdMG6POgFkSPYFGmFkjs?=
 =?us-ascii?Q?MmWxVjifDyNDRqlyIGLByamZ7LfvlAYHjFWzIlfAqCkM34BGRnrDfmw9SFW/?=
 =?us-ascii?Q?zJAAfLfrDrRrGLH5M39D9yGRKBW+yuG13parcIPcpQihS1aSVOCBme3DF6lf?=
 =?us-ascii?Q?0yDfAD4jZB4kOTUUMl9B8+PwDXLm7X3X9MJnjYxgg8h6u1D2yCc11VmlQy3a?=
 =?us-ascii?Q?o8h3tJOhy9cPxgA91xbBQl+y80HqlP6E7o6gFOIVpupiMFckdQFD4woqHBsv?=
 =?us-ascii?Q?Yh4461p21uXVKPLiXnj7cPoP2thFDYmrSiyV4OTKA9U9x+qhU+akNUeB2/c7?=
 =?us-ascii?Q?9lfE3KCFxwyub9HCeQdn6a5263QX1Suvsw1xjX7xicJD4GMPeF2Iw+rIk/nB?=
 =?us-ascii?Q?U8GfLat+oKD8exQ2ZqEtCgsiAzhHXPpzRknuTHEcwk/7LCiXAR3FlRW38Nlx?=
 =?us-ascii?Q?GmjNb8kre0dQBz+jv5mKbpjmstWXOUoa/JwdPbPvW5I+QHtafq8o+Lie7Q7z?=
 =?us-ascii?Q?GqGdyMvWEoIBRodUrtHRRcPSHKCeobRMjWSYtw8bVgDHYv1D4J/RpXF8AE0K?=
 =?us-ascii?Q?HFEsstvsUq4xEgHvPorEUVLolB6zEil3t+1xvaHaKRUrwTYXWIS40ShlUDgc?=
 =?us-ascii?Q?/Cd16h7/uLAYX18C1L9nWjdMk2TGq3dmbrzG0XAQyls6/eOPGWamDA4C0pLY?=
 =?us-ascii?Q?+GKoTpTTgSDo96Ea4tZPTKqvQUyTaxJ0+MVsElGMdAedxmISac1+ZTFFyI76?=
 =?us-ascii?Q?uxSqCdT8uCvwlLA6QlmUKt22ujzePuDVsF2YmkrqRv9oruvPk7QI4p6szA+K?=
 =?us-ascii?Q?FdZvyCb/ba772Xe+5vwRS3gBOmjFXrhqY7tFvbidqFOF3izIvK/QXOTWwo6F?=
 =?us-ascii?Q?HPD1RCO6POJVy9Gf+urWS6Jyb0bhy+tPiwBghXpkXcZ5DT4LLlfiTjU96do4?=
 =?us-ascii?Q?9gqE45CGJD6AR/Tld71Ts8RBqTNqj1w9P41WHS1cgXdS8JTv9jKVxnb2k2EC?=
 =?us-ascii?Q?HQifwi7w0nWsyQqpHC1OlwJV4FyzvlE9gx7l63Ir7SQAnzalLA4AuhMwd3j+?=
 =?us-ascii?Q?OVNRO1oLWwQ3ytEHvGM1xUGfWpBJGOJhAHaXXrTiSC4n/My68+jw+Ewyndqb?=
 =?us-ascii?Q?uQdnpysecfkmRFpJ6fSoLCjDKe2MFWN6HWeg4OuMmeECCwk3pEprrkue19f2?=
 =?us-ascii?Q?gztfnxqzzsql2SbWxYq6c/nzu35bZct8BuXguF0Un6fFZE60?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda1fab5-77d3-4c91-3ea4-08de8f327f1f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 14:33:37.8367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSG3LuzOEa7XKWy5c8QCQvLPdYR2+I6myV93LoIVHnv/Fuq7BvtlNdXmWrErDx8RFENTRjhal6htpecpgE/eeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_073344_102430_E1DBCF92 
X-CRM114-Status: GOOD (  20.44  )
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

On Tue, Mar 31, 2026 at 03:23:11PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> Add a new read-only control V4L2_CID_MEMORY_USAGE that allows
> applications to query the total amount of memory currently used
> by a device instance.
>
> This control reports the memory consumption in bytes, including
> internal buffers, intermediate processing data, and other
> driver-managed allocations. Applications can use this information
> for debugging, resource monitoring, or making informed decisions
> about buffer allocation strategies.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---

Not sure why not export these information by debugfs, or any benefit vs
debugfs?

Generanlly document should be first patch, then driver change.

Frank

>  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 8 ++++++++
>  include/uapi/linux/v4l2-controls.h        | 4 +++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 551426c4cd01..053db78ff661 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -831,6 +831,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
>  	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
>  	case V4L2_CID_COLORFX_RGB:              return "Color Effects, RGB";
> +	case V4L2_CID_MEMORY_USAGE:		return "Memory Usage";
>
>  	/*
>  	 * Codec controls
> @@ -1476,6 +1477,13 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		*min = 0;
>  		*max = 0xffff;
>  		break;
> +	case V4L2_CID_MEMORY_USAGE:
> +		*type = V4L2_CTRL_TYPE_INTEGER64;
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +		*min = 0;
> +		*max = S64_MAX;
> +		*step = 1;
> +		break;
>  	case V4L2_CID_FLASH_FAULT:
>  	case V4L2_CID_JPEG_ACTIVE_MARKER:
>  	case V4L2_CID_3A_LOCK:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 68dd0c4e47b2..02c6f960d38e 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -110,8 +110,10 @@ enum v4l2_colorfx {
>  #define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
>  #define V4L2_CID_COLORFX_RGB			(V4L2_CID_BASE+43)
>
> +#define V4L2_CID_MEMORY_USAGE			(V4L2_CID_BASE+44)
> +
>  /* last CID + 1 */
> -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
> +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+45)
>
>  /* USER-class private control IDs */
>
> --
> 2.53.0
>

