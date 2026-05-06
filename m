Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81FDCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:To:From:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkSep8oJ65JDKthOg0d2EabP0oliBhi1XvnopKG75ew=; b=bmsG/H0dPndYjXonR2cgz2HcFC
	Ri7K9fW42CB2P25SuGwbFDcM+6SGDQeJXlNnfW3jg1u+1MFab3PU+kOgInfAbSx9sZI6QRwCxSGyf
	PO+d9cQHTzVl89nl3tFewBoqY4NYifUePevHOUr1Se6G+pgJCO6Er514JmXJvIcQSC29+wo5HKuV1
	prqEde00ZsvFfo0CNipfB3JBMHSWQOb1qOZttrsd32ZRY+BORLpActjAF9yQG09e7kz4w2MKsjK2M
	JiQCMkC727RUsm6Ei8DoD5T2wI/N3TEzo5PCi/i5/56h9xLlpZuC9zldpg31zBDBj4l4iDZfusEwH
	WwPpiq7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdpF-00000001Ecu-0IPC;
	Wed, 06 May 2026 15:06:13 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdpD-00000001Ec3-2Qip
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:06:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4JXAr6y+2roSkS6g6XhChy1P5jstNBRnmIaciOISzAOVZ+UjE13xhQLxwh2dnhHvkq9d0VGOIoGLZ9QPqzWJ/zJokOjgHDxBXDQiR3OhB6R8AdrgKNNv0wIxXq+okdHMR4+TzO5PZZN6NOxxxtQuFypYzOlU5IZA3/gupnAVarbZ5NNwOBzQEhKkvpNgk1QhHgTUB6YxH5sMxHQT/3pzhoOS+FMmGHfI3hIpaJWdtLNxLZiN5y/LtJ9odH4Ho8qolKak7KGPNDFu59A6A68rMG/dufp977mUnNMZm/9o3NYouVbqBIZW5JJ5MuVfU7B71qwRXyazCh+fcGbXzQqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EU3Aywg5ok19lv5R/2i9As7o+nL23GP/gaPpeTA2SDg=;
 b=ZDl1cpn7ZutBYNfbK3GgyewJ1AZCb6vHmsZL8tV1cUPWFzgANKPzqq2b3A/YkqkLXIpuKTfrQQ+xFsRlumxTTSrx5lGthiWsT/fZpmq1vRrnn5gXXUsnCtljDO2p4uDRCh1kBgmQovMUEgejNskO1qXA4/u5qvfZd0wdUtFaP44fbJfPxosaesHJD7jRe32MdGJtbuiI+qdUEfLoT9QGDkSvzzhLE8luRhRzSxkJ8a5R6uvxqepBTUz+Z68hWBhw4LlJZnxWTd9ET+KCAxmoYwCX9IeDMquB4XXcemUoeGtzgYopyVruoM3TEg9V1mJYdKeS4rk/EVSbPkvpW1W/8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EU3Aywg5ok19lv5R/2i9As7o+nL23GP/gaPpeTA2SDg=;
 b=LMpge8MWzA8wbFKiDnjMAcn7GZo2tsKGbAL4KRZ5cf+cXjnEcE/qEMJNnvRlBVHgJPTgh1UojCyNxnBtvgdkw40tvedGGQkU7KekAMq/MocNOtL592iqm7Ofa9s8HHbiV8E2MlGfeI7oU1re3l5SECos8Pd9jCEw7/Gyc1nccsZqpKxXCIHJahNpGXYNHio/pqsBPfdp9K7JwBagkgXMXd1Xdh4TrDPY/3z/2je4bg1c0MVK/fbQTeiUJKZmquYrKEF1pc3CkigPlahr4I7Y+kHgmlQXq5+S1vBOMizgcnQNqj17NrXJOYOFPZZvcgol57SbNjfHYLFoi22HHmVYLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7981.eurprd04.prod.outlook.com (2603:10a6:102:c0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 15:06:05 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 15:06:05 +0000
Date: Wed, 6 May 2026 11:05:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] pinctrl: imx1: Allow parsing DT without function
 nodes
Message-ID: <aftY1fPLH6s-kHEy@lizhi-Precision-Tower-5810>
References: <20260505160902.1425532-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505160902.1425532-1-Frank.Li@nxp.com>
X-ClientProxiedBy: PH8P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd143cb-91b6-4610-6bf4-08deab80fed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|1800799024|366016|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: aR8EV2JjUnvxOFLCAiuQNq7wYkTtAKTGHwPw1MOvz59fD/spVSnH9xijqJBdeInwdzfOzeJT4KlLRqovCzB5bLbp2/bOFBNADS+uW6KI7Tj3sCeF5LvUNcCoue28uh6zZNnOjTYqJj5xBc6DjXqsXy+Pc5YgHGPSKzZnhbfDpWCg48AbZPudBsHhjzejPSWfC5xJWyxXZKuZndgY2b56Usekyyvj+OqsVxBp63tjHjSdG3DHPLRj+Zt2UrxZ+jCEKpPzOxcL8xkIJp7hrMaHSkxMq6WoXpycWMZbuoT9SWD1NOdd5txcI+mTI9KYN5QgfLHUj8UPCVEJUsSSoJHSoK6Olj9nrOlYzC4LMynKfNMMvAOqrwYSWMXE37Muf5azjI6qjmV6Knz/qJA5Sb0JpZktY4Qu+wvQB8zVw3oJDCnXY4/rVObRZT7hXGxdZJ8sVGRsc5zc+anlDQD1x4JmF5s7IFRIseQM2q/Yt0/ao7Bnq2UdYnG/bL8KrzAvspT1JRzIwNlVwZm/fbJBdsdgMolG9iKzP0sWH3+nVfCTu6tF4ubUUxtGCXWa0arUU2W+OID7k3aasGib3v41PpV02P3DCIh8n+sDb59FxeHgGvrC8buf2p02yOz0MSvOsv/wgQg94LKm7Z395sLR6cNPeJYLy7ZzArSSeOiEO1shhvM0skoIeMUyp4EAxKc8S9xzsJnlvl1MDccGqCVXrEe7mesIVgRQBSWK3VrvYwfeL8+T26a3vTPTaYVWsqgAfM9KERoFrJkXtJLzyR4E7S/qmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(1800799024)(366016)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DNQ8eJM0r4AUG+3B26Dwa0PZKwql+wuov2oppLkUcuqqQ7qL2aSQSAsgqf?=
 =?iso-8859-1?Q?W7qWF1gFQVtOOkmv0b9Y7Zv3ZbnbD+pU0B/wcUWf43DW5XfV/ZMUTN8RrF?=
 =?iso-8859-1?Q?gOx5kOqBJTrV4HOfDP9glSVBOmWzBhaq/EQYHwFxvg8d4/AY8d1E1qUE9C?=
 =?iso-8859-1?Q?psr2ABHXEpWBOKgeyU58Pnc656OCDzCj2XBVv+ZwDHix0Oj0ErM7k5F+gT?=
 =?iso-8859-1?Q?Vcaop1e0zn+zcrxwAXQ2G1QbA3VQOT4E09CilDUw2AbJWVcuBfJWPKb8PO?=
 =?iso-8859-1?Q?q+Dhp9ABTLg3lmTu0lI2kr1CCTdmmxujhluMGJQ7zb9m8C7lajc9LJhAVW?=
 =?iso-8859-1?Q?jP0YI81KQBP99P7TgcYm7omt1Xjz37dWz4cYcHi8iTNf2XFGzCpQEFg1PW?=
 =?iso-8859-1?Q?FKrvsHO6x1hS7duIQkPDMp7o0VvmaCEtzBOBeZjPWnHIYPx9h1hI7yOweg?=
 =?iso-8859-1?Q?j9R86lZp+5NivdN3Z73PI95tmoIwiYqqj64/ekF3fwl/9mUsv3F99KJ7pd?=
 =?iso-8859-1?Q?dRXjp3TdzeARRUyLgtGGcQAJb7yxovOdiJI8gvMBIKrr71QpLP37ZXJcpc?=
 =?iso-8859-1?Q?vD3Kjk+T4d+30iupSXddFr2tv75Dw2MJ7j/4Z/3XBfDMR9kP8TYXv30rxD?=
 =?iso-8859-1?Q?uuuLI1ULZUplr3QX0ClHgRVH2iu+NB3BIWrMKJIY4nME1pPpNb/HBOdTyd?=
 =?iso-8859-1?Q?IArTRT6nnoYYCN55V0M8TfbDonpDy+bS/9W1Tuu2ISMnXwoS2p16NOoTn4?=
 =?iso-8859-1?Q?kt8obY3einSO0C87+NxJidyS1RakM6e9rUV7npfysW8KhWRIUoSfpXYBSB?=
 =?iso-8859-1?Q?VuFhZv392EuoqJB+2s/EX3ujhFTvHvFzcmGn8Q0FUvv9jbC989OrZAL5ti?=
 =?iso-8859-1?Q?FVMzLfQYDT/JG8TPDta49mZGjbsOT/XJNq6KX/QarQpCqHKyOKi46NktgC?=
 =?iso-8859-1?Q?730t+6K+yKBuBdYuqnyuC4Kp1Hsvm77P4iFEdxVbqUvJDhnhLeZvFvOvqd?=
 =?iso-8859-1?Q?uxIY/NDyqEWZ/hY4JFvBlkriEesBHjUXxw6NwmnLa17mCjPX4sif04+HnN?=
 =?iso-8859-1?Q?l8hscuG4zX4oE401ZqMDEbqIX9LLDCb9nlWTVDGL8pIvDISw1kHo6/SxfV?=
 =?iso-8859-1?Q?R4O1VLDqawc4h4Urz/BQje9huwmVcGz8vwDRys22pp/LsZOoh2dm9sybdm?=
 =?iso-8859-1?Q?662hh5Yj4xT9K4sEAmQhg6btSWM6YFb1acHq2+p0NCb810ZWP1/okeUgv9?=
 =?iso-8859-1?Q?lhtr9wgS8svDB1V2SoZPW5QP25vlge7a2GkbluqPe7cQn1QA9shEO9zufn?=
 =?iso-8859-1?Q?SJzqzQmM4+amo31xfaJptLwWPoV47dvg5yjTPtMKuql0XPiRYGCfEHwATM?=
 =?iso-8859-1?Q?L7fLUeCgGRVwAU++QMItGt9YYPxLzXA+cL5L7nIfUSo9YlXrDhzNZBfBLP?=
 =?iso-8859-1?Q?TDKJw1FdYnoQPu4OpLuL2eqJwOGlHKMM79j9EU9Rk8+RKfBd9VD/mZ4v8p?=
 =?iso-8859-1?Q?emU1N71TPiCcbn13QZXWTp7T8IOzwQ3PWrvW6CAc3U928FJpFoxkxyIv7s?=
 =?iso-8859-1?Q?I6S5aKMFaKTe1HZEA7BKa73yPzNAy4zAMQC0NqfkEZoU2XNwXnm+An+OXx?=
 =?iso-8859-1?Q?G0ydKlmoAi5UR80bByIyRzW/m/66jq6H8MTcuqIg9D4JQDRiLDGYKFMF1X?=
 =?iso-8859-1?Q?5S6wO6jZpszlFMBmFnvJrI5GEM2bR92mUoKql6B2IWalNjPrfEoZmiU0vg?=
 =?iso-8859-1?Q?MBYhG23z4iA7+0mouwe2NvbSQOELrOcHnREMzVtUHCsHOp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd143cb-91b6-4610-6bf4-08deab80fed0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 15:06:05.4130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t++0z32CYZT1fHDUxIlhbt9UAWRq6laeVTq/J5bPIJZEqmnkvAHya4140Gp1Nvb1DDnlpwyb/TbJ6ORJ1Be4RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7981
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_080611_622990_02116E47 
X-CRM114-Status: GOOD (  28.02  )
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

On Tue, May 05, 2026 at 12:09:02PM -0400, Frank Li wrote:
> The old format to define pinctrl settings for imx in DT has two hierarchy
> levels. The first level are function device nodes. The second level are
> pingroups which contain a property fsl,pins. The original ntention was to
> define all pin functions in a single dtsi file and just reference the
> correct ones in the board files.
>
> The commit ("5fcdf6a7ed95e pinctrl: imx: Allow parsing DT without function
> nodes") already make moden i.MX chip support flatten layout.
>
> Make legacy chipes (more than 15 years) support this flatten layout also.

Linus Walleij:

	Commit message missed an important information.

	This is fix v7.1 i.mx27 boot regression. Although it is old chip,
it'd better to get merged in v7.1 fix cycle.

Frank

>
> Fixes: e948cbdc41d6f ("ARM: dts: imx: remove redundant intermediate node in pinmux hierarchy")
> Tested-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v2
> - Add Tested-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> - Use of_property_present()
> ---
>  drivers/pinctrl/freescale/pinctrl-imx1-core.c | 48 ++++++++++++++++---
>  1 file changed, 41 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> index b36c8a1461b7c..b7bd4ef9c0db5 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> @@ -540,10 +540,34 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
>  	return 0;
>  }
>
> +/*
> + * Check if the DT contains pins in the direct child nodes. This indicates the
> + * newer DT format to store pins. This function returns true if the first found
> + * fsl,pins property is in a child of np. Otherwise false is returned.
> + */
> +static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
> +{
> +	struct device_node *function_np;
> +	struct device_node *pinctrl_np;
> +
> +	for_each_child_of_node(np, function_np) {
> +		if (of_property_present(function_np, "fsl,pins"))
> +			return true;
> +
> +		for_each_child_of_node(function_np, pinctrl_np) {
> +			if (of_property_present(pinctrl_np, "fsl,pins"))
> +				return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>  static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
>  		struct imx1_pinctrl *pctl, struct imx1_pinctrl_soc_info *info)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> +	bool flat_funcs;
>  	int ret;
>  	u32 nfuncs = 0;
>  	u32 ngroups = 0;
> @@ -552,9 +576,15 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
>  	if (!np)
>  		return -ENODEV;
>
> -	for_each_child_of_node_scoped(np, child) {
> -		++nfuncs;
> -		ngroups += of_get_child_count(child);
> +	flat_funcs = imx1_pinctrl_dt_is_flat_functions(np);
> +	if (flat_funcs) {
> +		nfuncs = 1;
> +		ngroups = of_get_child_count(np);
> +	} else {
> +		for_each_child_of_node_scoped(np, child) {
> +			++nfuncs;
> +			ngroups += of_get_child_count(child);
> +		}
>  	}
>
>  	if (!nfuncs) {
> @@ -574,10 +604,14 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
>  	if (!info->functions || !info->groups)
>  		return -ENOMEM;
>
> -	for_each_child_of_node_scoped(np, child) {
> -		ret = imx1_pinctrl_parse_functions(child, info, ifunc++);
> -		if (ret == -ENOMEM)
> -			return -ENOMEM;
> +	if (flat_funcs) {
> +		imx1_pinctrl_parse_functions(np, info, 0);
> +	} else {
> +		for_each_child_of_node_scoped(np, child) {
> +			ret = imx1_pinctrl_parse_functions(child, info, ifunc++);
> +			if (ret == -ENOMEM)
> +				return -ENOMEM;
> +		}
>  	}
>
>  	return 0;
> --
> 2.43.0
>

