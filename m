Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEFBC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dk/pcAqsQHpLpFz52+IphCga9BYtad8FUEMFdEqU8e4=; b=qSHlqr7jR+2uyXXpQXecU14dkT
	W79870bVQZUUMYXnJHcp584TmKK90fAk4/3fHESlUHi1mr0c1V6DNTSWG67PBBoABrhiIkcv1IFGd
	kUCJ0TgBt9JYZ0qfSymHNCtxZ4ATjA3McIXgBKwO3SgClgrWeEaRDfh6m5Zz4fWGpyA6JysXQoMsG
	x7yTheX+S44pa5cn8pmSsF9DyI9VD8VyQXtEG9XIGmNIcRzVZOMblI9w4DzvG0lT8Yt44LVjpoIVY
	8gPxH3JXPhefNMRRJ22S7VOhzOYcOlwnKFh9pOFRM/S8xSlgHOLrGKgViUeOWWL1qGemlMzGwsP66
	K62RB6zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITlU-000000049Ww-1BUq;
	Fri, 23 May 2025 14:52:52 +0000
Received: from mail-am0eur02on20601.outbound.protection.outlook.com ([2a01:111:f403:2606::601] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISye-000000042LY-0hCw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 14:02:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zg7ILsHr/NfCgfj64o6gZsriwNgO3REfjGjWzWlySI1yYHGPuzarFGz/egc3IsOt5QELF4xZY4eC3FEFwZwsodnq50SVOXFnknYCqG+qSdQbhA+CvcrUSwsaLqHfjTwR3IGk3YqdE56WWT2ckjSmlNu4VeL0bQpUBaOrb8opk68IeSxNTuQvRQZDrT0/TocuPlRvcPZZBk1Ti1w4jid8Ekm7BF76WbLBIm1PZJAHBbWc7zejPDO9C9tJTDu/ktckGhs00gpINA56mnEQ00MH6WcC17Sff1mExEoMh4/gS02s3vXdc/ONGY5k8SkhnuVtQlQLcSAB8Os8suxUC1dHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dk/pcAqsQHpLpFz52+IphCga9BYtad8FUEMFdEqU8e4=;
 b=zStSPT7x7GZUAudWKcgi4yggaORUo6P+zWI1dCDCNXp4gAccyJBH/wc6BF2w7GAZEYx6Z6c8UoNdal/Vu2ciJL5vVITDVfwtpUus6QRG6usNMt+xjy+mFnkad5v1jTB8RRfaTYqkT9Tz4EcTXW6q3Kxq/3k3asiQvo/rQA1E892b56TIAA+Jltutu3b6QaiNNmlJc11T8/BOQjXiAQWAyfThwB5DxRjXB0ZVz/+Hbwt0VBzmukeJolwV3BimR4+vm5uiwhloIwr+AuCwUwiAo78vzfwtSUAgZ2e9EyN31EOeHgqhF2gQVgE9lobcGqcxzkZ1pv9R8t/9f4FqUrjEDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dk/pcAqsQHpLpFz52+IphCga9BYtad8FUEMFdEqU8e4=;
 b=CQH8TcHyBMwGw2JEqM7IOFcmw+zWnFdMaJuwdyHGcp78oVmmNVRep3KlnDmZt7KXHBr07PvJ75yRbuUJhSi5AlNYsDBvzygoZdCjFEw0wkhfMXHgvAW0v4JLk4AFOaenf72cPd2e1fMQyhTUNE6IAko95pVFZvVGvtuWdmqARGoGFqL/LvF1+AzAwGk2xrooNqiDa+0TfAIhmfufLOIEbtjoJt9VDwuqjmn+mP4pzYluCUwapLTlut7FMVfQ1S0ROc0fQRxxvUzfifGfAmVgq4/r5VXrClZ9l5rYO/OsYES0iIVK2dg8FZo5qq2S7cQjVsgLH+bFm/aDNHMMrSUvZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB9589.eurprd04.prod.outlook.com (2603:10a6:102:265::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 14:02:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 14:02:20 +0000
Date: Fri, 23 May 2025 10:02:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: John Ernberg <john.ernberg@actia.se>
Cc: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/4] crypto: caam - Support iMX8QXP and variants thereof
Message-ID: <aDB/5mU0vinYUup8@lizhi-Precision-Tower-5810>
References: <20250523131814.1047662-1-john.ernberg@actia.se>
 <20250523131814.1047662-3-john.ernberg@actia.se>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523131814.1047662-3-john.ernberg@actia.se>
X-ClientProxiedBy: AM0PR02CA0217.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e68764c-04e4-494a-74e1-08dd9a026f14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n30JcNj3zP+hMcRA3iLjYflTQ7GDszB5yOrGqhCdlSxxvP6jt50JY+pMStSZ?=
 =?us-ascii?Q?ym/WQ0OuvroEmbLyhJ0WAltnsRJnYYljsvpepkwbrsPMkg/kW5vDwwrCxFdL?=
 =?us-ascii?Q?vpUn5XmzeqqAFcv8ENPJWRtiNGK4Z4neX9k3gJrB7hS/YgHWtyX+bxd4Zg+R?=
 =?us-ascii?Q?wNn55nJiU83hrOLAHyA8LI4JVgR7aAuthBmRh747xcwKi+4gz2WWUw5/mx0g?=
 =?us-ascii?Q?Nt6M5q3xPImamgPhsm3jJSjhCZmfzfu/m0llsINiKtCIfrPL5S1T1aFMdNFE?=
 =?us-ascii?Q?UylrcVfn1stcwDPf7odX8mahY0eVJy4gVYJTXqM6e6Olbg2ilhfvOkUMmJfZ?=
 =?us-ascii?Q?QZKDd4zoJW60+e+tJJ/DaeGTnuflUSPAWoFyrAi+gnVkz+lc4DL32HuDO0A0?=
 =?us-ascii?Q?cGOnGq8T2tLiYzI8VcVJIZ6U7rxbH8pHxFTAe51Z23WsfBQddWigR1F9YC/O?=
 =?us-ascii?Q?oJzeuF2WsJoHkEunH6YQpLa39p9SIjs4ysPp5J/0nNx19psFWVEoyjdX54vW?=
 =?us-ascii?Q?78zWT9y9eUSRGBzOeo0Ki6zs6p8VYjtpmasBSGo4hoRmhEqDqCnHPCLi6VGN?=
 =?us-ascii?Q?+kqXKmFfwRTv3JK31UrZuo3j+SWzx0Zz1c1VoR2ls1mYTPjc4xretkP6IrDt?=
 =?us-ascii?Q?JtOkaRllumUNlL8dbVaebPhnlzlBKu6B4fH5UagwfsSxuD52aOLfQwwNOlr7?=
 =?us-ascii?Q?9I/cHomW6SuOGZd1odIB0d7aRKIwYzfA+t92bW1NjavlrpkU0d46r1LC6t4t?=
 =?us-ascii?Q?JOnOIqq20xVAsP59ZHkarC+D2c1JaX0OiAdGtUMs3wQg8gibrFygYS0LvdJp?=
 =?us-ascii?Q?HCiHqpRA4E84byjzM0+LMFPULILeAYSFMkLt93Lf2acomIctuBq7qceualh6?=
 =?us-ascii?Q?u7kUCFIigFH1nMExBe2Zggn/2ZG7jId1FntehtOB+z8FoXLeiBcHzpSQazEW?=
 =?us-ascii?Q?2HN/bcWGvCcC5nbbeVKfOfyE6bMn6XLaeKevSk8EJ8tehr5j20DTIzu7Xy4J?=
 =?us-ascii?Q?8grYF1xVCHKayffIZXb0Ja1292KrIZuUf86qCg5wMaoAztrqUvUjL16FRBnO?=
 =?us-ascii?Q?enXkwYtQ0/gfY/AVfeENx8fj4c9o5FKbIdQv/0EjrTGZlQTCtJmXFWKu9PaL?=
 =?us-ascii?Q?MD0L8+xVqXDxFx7nWeLq1QymLynNRtuMAtDdEhwrjsVHMvfpPmuMW0tStFTR?=
 =?us-ascii?Q?iF6xdj1h8hqlJ/oGVAzO/gT+d3bl7Qz1uNHuRBTHVUKCz4tFOO6h6AHI9rC/?=
 =?us-ascii?Q?nBt90iT6CwGksTaXvTIvz7syFHV5LDXXeHFdqQW4pxUdePUZBIPXe8UReZFX?=
 =?us-ascii?Q?V00IU4RLd7QWXcnXyGo4GeB2No0sQiPlEzYgfdSHyrvmVv6l73LVkGLAwFH5?=
 =?us-ascii?Q?//vk3NzjkXDXQy9rFqUy7S4TwECDpd+7es3T2VWE7lQyjkrrjAIP1ICTmpGJ?=
 =?us-ascii?Q?qzthKeHvP1wCUTSCKX5n+yGOZfTIC6VvQA4cttdhvSA/FXdwywhyVw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iBoX18vWh6cbRR+mnAQNTGoWGEtLO9+pwFtJUpskmZ+245rySZotFxKs2k85?=
 =?us-ascii?Q?Sx4iD2NN4rt/XFRjFjIQ5eGBNbuxIVMxInln6tHJ6yjt65WLsDcEPAyH+Xds?=
 =?us-ascii?Q?z87EkCDdX1i/Qht6BZv/itEYtnCrodbLDKeHNW+ufYpYxt7diGocufU3yZ9B?=
 =?us-ascii?Q?d7e4D0uPjlrayeUTcEv2Ijz/01Mbj1Z7f7RaRPx2e/fpe091/XNgqUYNfdvJ?=
 =?us-ascii?Q?IQUHFBtQpr1VccIxP9gPGUXf61HUAQ/yVltpuR4RElASmULOzX3mfzHC09pz?=
 =?us-ascii?Q?ZaQQ3q5FiqAt9JXlRjURYInLULijpc12GeWjAlNo2LrVxBKhp2yEfwTbd3Zp?=
 =?us-ascii?Q?rkwehFcPmjnA0hfHrF25iFXK5E0/XVNbLc+O6eVX86VKuTOhvzJIu9HQhLgY?=
 =?us-ascii?Q?6p+d87/e6CXxSNDtiM2SNiiKO82/fhqdcvUBkydOWxEyepjaQPHNU16/RfAD?=
 =?us-ascii?Q?OrECdcMZZB8n+Sllkb+GOAPawZfSwA3WpcMpf7wkzqgYkVJC9n1oMqQRrJ/Z?=
 =?us-ascii?Q?wsnRQmZUwbzMwUBUIGoslSxVRgOeIfDDzHpeKIkMYHzLpZCnP46PgQH55T/B?=
 =?us-ascii?Q?JoNfLhGloOSqYQkLcebIjeC5aKvKZZVw0pVEIErlD1v7o0B8nIv0Cc8jaBjq?=
 =?us-ascii?Q?t1ybwnPZfmB1RDYP2S6Ffm0A7LbOgm8jIjDxfjmxevu0w2SjPK3aORPBtNpW?=
 =?us-ascii?Q?HQa+ULsBPMucPQfdp1ONLb6AeXcbchI4Trel5TFGlhyzE8SB1M4QXFKSRNtF?=
 =?us-ascii?Q?KjITTNvSv2G6bpYQxE1Wourcg3KdprRpZWez7mCMJ2vU+Gj+rJ88+nSnrtoh?=
 =?us-ascii?Q?Ip/AGxhZ9z074Xp6QeS9cLjnnJ8nQywodu6l5/mQX6yjTIxx+ZDsY9AR8p4H?=
 =?us-ascii?Q?4Ez3LQ3AbG0SjeLj+3j830srBUwFHznqfUVP81AZaNG62w7G/L9mphZ0L5zL?=
 =?us-ascii?Q?bbAVkdg7R6lZxDGYRID7e0vwrWjvaAbPVkubPfixBoMr9+3o4RjlHMGoGLxG?=
 =?us-ascii?Q?VBODfYxpuLMJ7Cd26XIpLFvm9+f2Cq5jmCUc6qCzmolK3416PJY6l52U7rHP?=
 =?us-ascii?Q?OUB9vnbTIsQFy49hbAazMQe0z7X2oEMCrYn54RAANc4TYTVKiXRl4Bc9e3r9?=
 =?us-ascii?Q?oiKVAhu2ERUNtHye0d0sOwnF9AvXhT3ZEeGDiPeXmN3VC1ZxD4dzWHyUOPgh?=
 =?us-ascii?Q?5R38AcizqdjYi1qI6GK0LhFm+W5i26i1DcxI0c4oRcpebRVtsofso+djm4HH?=
 =?us-ascii?Q?v8p0+t0IdfiSVFTtNhLzXjPLbD4SDrZSz17HD9iAWhYob+frS7bKXinAzBLq?=
 =?us-ascii?Q?3pbeoFqYr1WfFGUib7sXl3P2XrsCMbWfZxA6ItCFn9+wY8gKkNPAlumIZtv7?=
 =?us-ascii?Q?M1GeMY/DjXPQu9Ye5vtjjJ9poLt6RG7xQmpweLU+2tbThv2x2AKINC72KWol?=
 =?us-ascii?Q?MFwWWrR65o9JNRsMkPIIr6JQpwlORwzJKd7h88+R2cuo2wDvwcm0MgMMCVwk?=
 =?us-ascii?Q?fK+CcUyBYUYS2n0Vi9uyj3La0A+FZw+nSlA/2oB0KlK2knCOMm+l0KAX0IOC?=
 =?us-ascii?Q?DacwsViUfxq7Fmfe5to=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e68764c-04e4-494a-74e1-08dd9a026f14
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 14:02:20.3297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oR6xsz942EdnfJ0ITAeeSqigcz15vD4YRQ2n+YVUk3jKUPSCpCJ3R83W4Aec//IQL1aZbZhU+hzfAfPRib0LZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9589
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_070224_208978_6698FEF2 
X-CRM114-Status: GOOD (  20.09  )
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

On Fri, May 23, 2025 at 01:18:32PM +0000, John Ernberg wrote:
> The iMX8QXP (and variants such as the QX, DX, DXP) all identify as iMX8QXP.
>
> They have the exact same restrictions as the supported iMX8QM introduced
> at commit 61bb8db6f682 ("crypto: caam - Add support for i.MX8QM")
>
> Loosen the check a little bit with a wildcard to also match the iMX8QXP
> and its variants.
>
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/crypto/caam/ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/crypto/caam/ctrl.c b/drivers/crypto/caam/ctrl.c
> index 766c447c9cfb..ce7b99019537 100644
> --- a/drivers/crypto/caam/ctrl.c
> +++ b/drivers/crypto/caam/ctrl.c
> @@ -573,7 +573,7 @@ static const struct soc_device_attribute caam_imx_soc_table[] = {
>  	{ .soc_id = "i.MX7*",  .data = &caam_imx7_data },
>  	{ .soc_id = "i.MX8M*", .data = &caam_imx7_data },
>  	{ .soc_id = "i.MX8ULP", .data = &caam_imx8ulp_data },
> -	{ .soc_id = "i.MX8QM", .data = &caam_imx8ulp_data },
> +	{ .soc_id = "i.MX8Q*", .data = &caam_imx8ulp_data },
>  	{ .soc_id = "VF*",     .data = &caam_vf610_data },
>  	{ .family = "Freescale i.MX" },
>  	{ /* sentinel */ }
> --
> 2.49.0

