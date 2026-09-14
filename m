Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FED4C88E78
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 14:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0XqH5mnTIMc1ejcPkekCcmTdYVa/8fjkLrJjlt0b5g=; b=4ZWaj8p9NvWgfFjaF1jsaIUgXO
	7874qAPCM7HJy4A/kMRSv8Xjo20lATvM51TmO+TTRO2vokqkhGJHV22mbhNA+1U0t3lN1I+WIO3SX
	dQZjwSzXPfYlR4fPwBvFl8LTRSe/DWZzkHiw7kiY7yIDydGKEmBWRX7VdfdSE/HZn66ktv5AppWuD
	XplgSmwoE2YVwSjazZts9zgZXg9DxG/dT3CvoFXAA4l4N1QbB79vmkqCdwJ5RMig9hO3QlI9zY7Eb
	8bq2EHRo3HWJ2VTFLu2kQq/TtoY8dPiJUhj9o/PQQMGdBio4kRKrECKMGZ+T/MXVfXTGkkf/aovq8
	O7ooOS8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67H4-00000003uQK-4BZe;
	Mon, 14 Sep 2026 14:03:11 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67H1-00000003uPJ-2I1g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 14:03:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gewbdNG4IrLndvhx6+sjrxepKvNa9y67x7dz4pUeihGQ5CQckdZ5enhub7etdgwIsqkApoutlpQAw8bW/tn7cY9JHt50xSxdVIfmwfMt4/qUZu0o6CXZNbJ5YIJqlkifqzKm+82HpolbPdn3vzOZXp5Did9O1p5FHDAoK3hFuPqRnV80hgbJEMBAeA2OxdSQYw42NrLHL5BDP7x2sXBe6B0goIt2OnPo/Wr3wETuD5752bFHygeph5Qz3i2zkCP0WPTsCT6ua7aDSzebpuagHX7KmUMnaK6eAP6UTAesUvfJ0egLMDoYaUQl2emNDHiMaR24vw1ZGx3+xZl71t8vyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0XqH5mnTIMc1ejcPkekCcmTdYVa/8fjkLrJjlt0b5g=;
 b=PYZxhCa1iDorNKIMhOhekbWZAzUT6icVB0fkCt8hhTWBRNiaPyffHQOgUNl1vocIK+AcC9IseV04etLaA9DN2jbKAUtMAhRQjgCO1a4PRFMwhNjdZgDRn1bTR++QZN6owD1TXrl6fuDLpZ18qdw6y9qznTISQQcTbBiH2Imy4uPy/RxFUcJH6Kije3l6+pzeN6C9zp3JPcFefod/oNq0TJRUxzaSkZpOiFAtIwuPFEQlaTk+cgXt73B+j/k89zFXFOjYggugAhXSvQikvG/TekjpzgKYvAqOG5d3H+PmdTRyt2oHkeNpEnTMRqwN9untvZWIu7KvuKBLK3OfVOhSZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0XqH5mnTIMc1ejcPkekCcmTdYVa/8fjkLrJjlt0b5g=;
 b=LgtLVCeOkHsWKhJCIBXzsW6lsJ81EJpYk8IatFe956xxJhKtcuJk6rG16kZyFHiUMYteOq/renDIQFFFHW5j8KPCcDOQ9IacakNok5FlyXqwvvq8fv003l9QPAn9XxhTjajjkQJ+Q5/jz3BSzIyvXFAFQfPrggz1JHgBf5bBVjUzA6uLvPSKeOVBdueqXpfmqKYEDxqh29fAg9fT0lF/vmIx888aQENH/9vdtE38MNdBlt0qabIfds0PnnIomQFym38ZNevvLlXlkII2v6sLnu8hcAm3CxocraXgokwA0TEfjITth12s3vJXJz8mjAOko8M6HBtMqaKNiq0aSVAxAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10486.eurprd04.prod.outlook.com (2603:10a6:150:1d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 14:02:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:02:54 +0000
Date: Mon, 14 Sep 2026 09:02:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Gao Pan <b54642@freescale.com>, Fugang Duan <B38611@freescale.com>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: disable autosuspend on remove
Message-ID: <aqf-g0DtUAkn947r@SMW015318>
References: <20260914091544.1667137-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914091544.1667137-1-lgs201920130244@gmail.com>
X-ClientProxiedBy: CY5PR16CA0016.namprd16.prod.outlook.com
 (2603:10b6:930:10::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10486:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e97a8c-2be2-4a8c-0ef4-08df1268df13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|1800799024|366016|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /la91tcT2Rxi62mlB+o9IgwJbqzkanYqqq+c8dvb/rzeZyNBd/3GnuwUjuW+FGUz6x5ohI9rsgC8ARHw0s5hBjGSVpe3fHgS0e4i905eIHw0ei/LRGJ2qJ2PWa8Y2DJgcUeeKF1GpEJt8uEVeAALNKBUs62z69R1ZyhZzJEuqCjWo/6XN/k3cqCCss1LResx0oAVDxt9BGyDUHjTfybiDIu0tGPhmdBSkY35/ZSXtxcBD+kv2aBwhlKX2YCVY8mN84SGjSiuUtvtpNsXY/DoTBa6miB153mMB/u9hfnZs8QLIllEBLPKAHExGKMS9MDipoXFci2hA61AqH1mhuO5E7sjxFQg3oiuRCAVIILerRFneIGFwC8tCHzYQrGn0HI9YeCR8hCNNORZWNaRNwDkPrSvpU7IhBSS526ec75/O2S8UZMYjxyBvwoFSMHfFMJSzfvpPFIsq971BA725fKSnS4BfutBk8bru9TsbK0c5iaF5kGHmf3gwblVHcn78wdjM4dg+hvtkHxqVyJQWTSPEPc7vAiSRL2SidheaczjCB0oOSizdShxlP+iLBx+mQssB/sjbx2rvZObxmMzbXWpXOnO92Nypo5oUE2WO0vXEjG9ogsajoArcL0mWnBQw80IbFzDEVeuKzZ1RpdPaxyhL+EbQiHz4TNbLVHBwOX0x9E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bsr7uFjykTcxV3F9lNr0k4SgDXQoFjmWnSx9OLo7Zu5/F3UnRTV8g+n3a4bP?=
 =?us-ascii?Q?qYaba28r8C3Srf8SACQMAgV017iF+gOT0jBCE/VyQLjfipMBo9XfsmJ3NnE6?=
 =?us-ascii?Q?Y3p7BDr/l7l5ytenL/mnMuMKXTc1njI4DrOMyR/JRbIKx93ljuT24XDNcBlG?=
 =?us-ascii?Q?4UuAGiJIaVmha0gSfR33OhB9FbSHHCGVt4MWaRRF8wKsBb0i5ed3GGWzNHTq?=
 =?us-ascii?Q?yT1UmxLQJpMzHrv43QgPe1Twgsfyk9qCsX+UdMkp5ZxL2ttITe430z38e6Bg?=
 =?us-ascii?Q?dU/b1vGmjv1pIUy/7vZ+KwkfZxVuT3PYZk/NSmptsJ6sZok0CzJyqojCEKDD?=
 =?us-ascii?Q?tH1MLAxbMsYv/TefJLVKD0IoRKDn5ZGeks+jnBG8ijzsysH8Cu9CBUz1bdXY?=
 =?us-ascii?Q?ZqmhazjgWClw42OetPPvqCPw6F5md9qJU/A+QlAuz8eCWFwqQkd39jULm7aO?=
 =?us-ascii?Q?j/yAD5xdqFEdo/EKED8zm+DeUGZWZIz5YUPtBKsdQcTt+AxjHls2R7f1EkQH?=
 =?us-ascii?Q?Hnzz6RFLX0M+Fw+BecinAZShZQVbBPRfR6Ibx5Q+lk4SpPL6y2qHMAekDAjs?=
 =?us-ascii?Q?TvxCVvaNIYzQZtn/pVYTHboyMIF5J1DV0wQrl8jvoo9RxT4tELqxKA7GhrpY?=
 =?us-ascii?Q?G0MrF2AP90w//j+BQXLtAY/HMsLMk0eEOU+eXRM5RdrujH3NfjVV0b4AWiIW?=
 =?us-ascii?Q?oei3A0yhku/tOU05MwMMTxfP1o+UdE6YgLcXMAFcZXLtdhOzQeNZoKkUFw41?=
 =?us-ascii?Q?aG3qTsDzZ9shiCicY8jN3TpMS3LuhR/IgolCQPFP5GhrcwDgbTK+091PegPC?=
 =?us-ascii?Q?ec6pj4yC0G3Y4w2IAKHD7fOrcxL/vYr3YYSk1CeA17Lel1lalJNy68w6eU6K?=
 =?us-ascii?Q?UGZfmiRmdPfhbkGoS39BGIyzHhO07IHOEkGAc6AvgAkOtkiOnweJYMcIaROC?=
 =?us-ascii?Q?nz0xXbAmMW/zCxhd4kMBj6Q8OOagcRnTHAyAxrf5ZSjHgbXEuN8kVcCmGwdN?=
 =?us-ascii?Q?ZkDNMje51GYNZRtTC/7TIDcqyl9nyF+NJqnQArWXiuIq69IZ2X+2W2ltNyjr?=
 =?us-ascii?Q?jBXC7bgBUNbQr5N6E1OF9ltOr4fM7tZewqUFyULl5C6hY1GzTH9lsq/6Rcyc?=
 =?us-ascii?Q?x/PIRi/MBQUL+9JvfC6P4ZQtqjrUAuNfCRHZeUZ7Nb6RhQkA1G2bYnkZQYce?=
 =?us-ascii?Q?1aL3I0nhoxT4bnLMMueTukNRFFnGzvs+ocXO4Fiwrzz8TilqiENbdzdwPOHO?=
 =?us-ascii?Q?7epH8aWZeL5xSfopPWIKIpK4Wla5qjCnDOV/xVZLxKijVWEORPHuN9Hg9ZYn?=
 =?us-ascii?Q?z7VmxoclmY4448zOT3W/pmNOr2QYVgvh+SciPn7s3Qzeut2aIIF+urBkl+2/?=
 =?us-ascii?Q?Q61cT4m2PoSz9xxOqewaJICx/xN5t9GWwOE6QpCrjzkiw6qd5LuU4z/WuKah?=
 =?us-ascii?Q?zA2GRcAhh4VT1SmqMyfymgKvQju9RLAfUxXNgYY8PvO5DIOkuEyXb32x3R+H?=
 =?us-ascii?Q?YXOUPPHk+Gblc4xW5yYuu6azOrHRGZ9GxMcosCHhd5TiOm+ndBrhedkxKBpr?=
 =?us-ascii?Q?K0T2MWufLnTdJsmRcgeFNV7BYBdKMKwelKtF2o38GSuw25umJ6ARA+le3ASo?=
 =?us-ascii?Q?mfkgaoCrS37PqBPwBqAuJCcaisXuCWIW6KLmIWAYECmhPC5p3/N6QsK/MPvk?=
 =?us-ascii?Q?R+3lxd/SObTWpM9bNZp6j7pQDDoQa2UiAlKNQ7NqbJDZX1WJ35wNkxMkeKIr?=
 =?us-ascii?Q?2vHHJOKO/T410Dy86jh1ZNNGu5YuNSUQwAS75oWiBRSa3koSW/3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e97a8c-2be2-4a8c-0ef4-08df1268df13
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:02:54.1171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZyQjgGJSaj/HTZHtgO4jzNmvT6kiJsbfS62Q98NIRtWOM9mP00CiZVJ95NXmMinysz2soooZo1K1/TKs1G8ecbmX5cY4Y2kOkLgaNxUU8JnTxzvGCGxMjUgRcqPl+Ly
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10486
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_070308_234429_F5B3F425 
X-CRM114-Status: GOOD (  19.10  )
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

On Mon, Sep 14, 2026 at 05:15:44PM +0800, Guangshuo Li wrote:
> i2c_imx_probe() enables runtime PM autosuspend with
> pm_runtime_use_autosuspend(). The probe error path correctly undoes
> this setting with pm_runtime_dont_use_autosuspend(), but the normal
> remove path only disables runtime PM.
>
> The runtime PM API requires pm_runtime_use_autosuspend() to be undone
> with pm_runtime_dont_use_autosuspend() at driver exit unless runtime PM
> was enabled with devm_pm_runtime_enable(). Leaving the autosuspend flag
> set therefore leaves the runtime PM state incompletely cleaned up after
> the driver is unbound.
>
> Add the missing pm_runtime_dont_use_autosuspend() call to the remove
> path.
>
> This issue was found by manual code inspection.
>
> Fixes: 588eb93ea49f ("i2c: imx: add runtime pm support to improve the performance")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i2c/busses/i2c-imx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 19ec056b00af..4dc3df6a41a4 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1920,6 +1920,7 @@ static void i2c_imx_remove(struct platform_device *pdev)
>
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  }
>
>  static int i2c_imx_runtime_suspend(struct device *dev)
> --
> 2.43.0
>
>

