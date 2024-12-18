Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FE2E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 21:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZqydgnDsPHLqXNTNcQ661Z7fvz62wHkGKPvd5HsgfY=; b=U/jVfNgJuYd7pYeErj9S1RHg4A
	sWtYSToyUOpzZGWfTxRMxJSTuzIjFXQD8J6YxgPe+AU2ZhasNcw/fp8xVvCOousEowUNzUjWnZlyt
	UY753VTBqWBoEyAJdUD/dB4JnQetE7NZiOqSZdyxRF9T0xFVAeom17Mz9oJRaV5nxV6Vwm2QQYKpL
	RidNrGEra/dw7IcUDAZjtX+D44WMh/rU93v68tPyKBerXK4w4A1fOiSiK0fYq+3tsG18O+X0RddyP
	K2T6A2jafAMeGRDSFBtuWYfk5bH7nZHh/arXjnDYXoz8j5iTyGImQYElicswlblnQvBuQwea9Inr+
	X3caIrSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO1Zj-000000008El-3NgY;
	Wed, 18 Dec 2024 21:27:23 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO1YS-0000000084O-2pzK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 21:26:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDoB96anQOtUBcFE0YTVd4MV5YZGhj7u687xXHIsGstoZUQIMtRR66ZCSsDBJd8kyvLH9AE+M3dPX178AVE18GvFQB606rPw2XTLi52I7EnfSQ+hxhwcpw3x97DFNkqkYKwiAtTxSlOu8dLET1Z347ufF9Mzd6j+lMo7JuYyoJ0HtQpo7EZyVsnzk12FAWgvtJAOkE/RXp+t/Ki+wAHMMv2CevLa8KxMop1WutL6lON7vqEsGbjdNWAfMYiq0ETvDMlRF16dV7xv3rYw58Yj5Lqocc8P4wAVthpI2+N5rRvWhvtANIcQ3sCz7BIsVVMuxI/pbkyhaFSLBC8YioVN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZqydgnDsPHLqXNTNcQ661Z7fvz62wHkGKPvd5HsgfY=;
 b=StcFjqJ4LxA92Tqku0K/lXjho5IcKVlssr+sYQ0+qGRiOuhOdHM/uKmFuf+KdGdLOc7Sa/QB49Ioqk+vYf2oW9h3VTr926X0Q8wOWZS8dOgzQV4aJCTW+MKAnzEO/+30Wra5UuYIUfl5f4jXqiqDijlBtYMPFEh9mdSnwo+BnpUCeeV70QaGL0gqLkrYaqz9KevrjVrFcgwur6SCh9/kPMXlc+tjCJAO8XObvlx2ZwxiXX54xVDgbb0gjPpal5aWgCmD9FxU+L8WabmP057MubnkvF1xaLY4HYZQvu9pFtmy9wkuK97foNFhTdbPcHyNsEpCDAjjT8CMayvitFdzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZqydgnDsPHLqXNTNcQ661Z7fvz62wHkGKPvd5HsgfY=;
 b=mct7R2NJwf0zNxVd5w3jT+HY8GeMcVF864ICHOLl/kBzw/ypahJOQOE3z7lTjJ0qqKYOA/MFdHSsbUfCQ+ateIaXCggkCmJ8acCl3HjN0A/8moj0Gvsijysgays4DlvuWnlRF1M/EXF9K7EdOqKlCYkJ/jlryfYQi+P7QRzdUGOkXHb3pNW71De2hv50uyY3cQNc76Q4j2TGvlUelhzM7a2qTpn9YoiTnr/BnnGGU4EeL9uIXgOUNMiKRlFPhXYANZbg8iR76TYDL99gja5OaORQbMJkWQJa1DlMjvgEdV2OyVhISUPMI+M4T+StT9bcv6AXNrqzsqJIsO2/LNlQaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7362.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 21:25:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 21:25:59 +0000
Date: Wed, 18 Dec 2024 16:25:51 -0500
From: Frank Li <Frank.li@nxp.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: andi.shyti@kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx: switch different pinctrl state in different
 system power status
Message-ID: <Z2M938ZSobeYk+1G@lizhi-Precision-Tower-5810>
References: <20241218044114.143358-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218044114.143358-1-carlos.song@nxp.com>
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: a503cc4c-38a5-4d3e-1b87-08dd1faa90c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cPvS4b46lAnu2GH1Hx61UPHCj9QuDiO2Hh9rKAdDtmTiE9NVgNfVWuvjYQcf?=
 =?us-ascii?Q?MhmJZ6zC2KUzBarn55GATwaZQMol2DP9lyXIvT+3I2Qa3WjvhKZfCX6LpcFK?=
 =?us-ascii?Q?Uq1j5oM8K0E986vnVzh5vZgZpDcn2Tf0V/uwLaI/8594hDWFYizuyKLbXLJY?=
 =?us-ascii?Q?X+2PrnlOmINtlsXL2gehHG1FPkVucwLF16O0S2UXq/DoiZgdarMSx9WxO+69?=
 =?us-ascii?Q?6xleAo2uVqMQ8zZkBD2EBCggIu9887JQ84JzmI0bchNbVbthbOIiofHQSZsr?=
 =?us-ascii?Q?2unL25FOLhRLTscARONft/GXc0orcuduQRkvFLNucUoFhfmSFdVz+zCGLc47?=
 =?us-ascii?Q?NzFYYGU3DQSB6hh6KBwBHHu77nf/6WadVCIgWRwEZTL53TdgYJtpmFS+VKsV?=
 =?us-ascii?Q?LkspVJCiGmVeumRmtS3BrpYW84TaJVhi8b/uQBvL5/xcsr9x5djSqGzyNDPt?=
 =?us-ascii?Q?WObI2tHGRdSFBRiiGl3+AbE/gTPuditS8XBJdO45gHbT5hntPGD0gYg1N4rD?=
 =?us-ascii?Q?dd9rNbfXm0KX6kV7/FHYSq/WLpr3B9G473mm7N566cU8tSA0lhKOY9AisTFq?=
 =?us-ascii?Q?wccx7LqKzMMVb3iyNDgm/GdD5kXEZtfyD8u3cNnnOa4+8ijneEYaHoneO9NJ?=
 =?us-ascii?Q?1OhruBhAvAw0FS7039aW9GEvGz88slJ3YFATgNXIWtDlVzUn/PKRkKVxI78t?=
 =?us-ascii?Q?tIb6wYlFTcDjyyJZwoBDzY8Tt+WK0zhd463N8j4prJhs4RemdjH9YL9rsCBl?=
 =?us-ascii?Q?8waaJGFhlk5+X7o1NVEunzYmyGu7c6rBTCHgYGBt8x7DTJO1H6B6JtDR7dBG?=
 =?us-ascii?Q?v0M0xomQSzm2qbZCeH1zqi3jrIYr9+I7+Ept7t+x5wkOzsGL96ZASBGFZ92a?=
 =?us-ascii?Q?Lxt6/XACuYe4aWx+7ow6FmouiK55ev+/2eSTnF8rJVCwU2FS2B28wJL6I901?=
 =?us-ascii?Q?pMVLGVbP5/kRxa8DOwR5pSGR79Q7Kz3bw0mzmET4xaizFB0GzK0H9MYJnhl7?=
 =?us-ascii?Q?Rxw0nXobBMzSV0ocfwGuVouhd5150NfcRbz5JlTomq3tOdLyzjTUN+VJEM/z?=
 =?us-ascii?Q?faZ803qY8V5CxPVZXYisMEHUszfCoi1LunfL5za/3bNf15w4QiObB4p2hPyx?=
 =?us-ascii?Q?e/M3drmrDsJ4GngSZBOEHGs4vjkVVO36zjQw1dEMoXslTwsf9ZaGZfTvmvyv?=
 =?us-ascii?Q?BJBABmY7EkqspMKN6kc3PzLCWTmPqbOTrFsDQajOnYdIjGLc4fFMbDW2yxWk?=
 =?us-ascii?Q?kB41FdMVQt2W4A7RIRKlQO14l1LSVuzh6lgZfMx/I+Mcs7SsWEmnYrF3doX3?=
 =?us-ascii?Q?6V7i25sAtChwSv1e1lnV/XoN3l/qSlJLnm3W4DfN8qAQa0ksEmyVDunfE9Vq?=
 =?us-ascii?Q?PkZhUgG5GD3Du+D7E+swR1FnzJrNONtcBN+oKLeyPfwi7CzlS37tMtsysA3o?=
 =?us-ascii?Q?p3EKyDS9mOAdxo5GSew6dZyvEIdEAi55?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Br5f8q9Jjble7x9/9Q23D51Y2A7EBw77GPe9dAu1CLHTnO9GVQFkP9flndQ?=
 =?us-ascii?Q?6WyignpqH6xHx44B20zQM02gloxt/hK1lV10dJusIUiTJVEks6VfpgXCJlB4?=
 =?us-ascii?Q?kxuO15/K/51ReCExztk6gOe6XJZmf595RMQwKpyl9jajwqv5OjUx7PzfvhnJ?=
 =?us-ascii?Q?LxlLCB5ZskGi3ij3sUpByBkG/xIfAqIAWQV0s99x+zvYhwe3EZT0qdKNhNsw?=
 =?us-ascii?Q?9l7kT4OHYcw7VDgbp0jKV6qcL4i7P+hmzaYm0vvJiUkoNXGuxbVZH8mhCnuP?=
 =?us-ascii?Q?TU50KBr8LBOY+knnJ1uzupDXOsdAu24sNH6AwSQAOCMNQCtzeOcQ1Vf76n1b?=
 =?us-ascii?Q?rrhTcGXpBBuSafHmVIy077erYE9NXRJj0g7hI5JGUVj9H/YNmQ6IjoJXIkcg?=
 =?us-ascii?Q?SXgoA6QDHx/zBYxFY7kzGsQoA6nn6kWLYDMLMc9NuuY9bKZX2rL3tU+hE2+1?=
 =?us-ascii?Q?XL2h6QcNJXbYGrIUxycF6vhhqmzorq4/a6wKFStyPocaMD9SLd5Pb/2gYDBe?=
 =?us-ascii?Q?z2imRYvSp8NHXUVtWcySXpocYUWjywFDzoXK8VnL/bVqX/0q1NTA+4PBXfFb?=
 =?us-ascii?Q?tdJ9cipXqoDPRdBLYGjQCgSvPMn592bREEuPND1puT1CaHnMjhR0kDzq2Yra?=
 =?us-ascii?Q?b/C1ScU0mPZrtr0yjZB9QxMuW7ykvidrVLfDVWZfJfp5KMoJUtcoN4GcxmgQ?=
 =?us-ascii?Q?OwTKF0HtWESWu75kscLz0sVhpCFXjJR3NLCtCipkmTIupU/JtIOlumD9uKQp?=
 =?us-ascii?Q?ZvS/IwYk4EsAKLylW7P+mky/3Zq3YJb7CT5B8h2+hxcwI7tfjhqgJNt0Pku6?=
 =?us-ascii?Q?wqhQ/Yp+ac2tCQx7NZqcx7NkrLi3UeK9lGPAqX/DGJ6vUPxksFLoXuRQ/wTW?=
 =?us-ascii?Q?MPVZaBsjblFh5wZ1elEE+BQIKsz7CSauptTwFEwSK/prwK/urvK3eU9P5wsx?=
 =?us-ascii?Q?F9x72puqjG+H8qfRvJYTA7EGHEGrs9ppROB6XTWKC0JSvcvF2JZ2nObL+wqo?=
 =?us-ascii?Q?pSfiiUMpo+UG44Bd0mXtAq2Bz//r48I7XVpMIs6czBcaLvEwe5adEd20S1Y6?=
 =?us-ascii?Q?kz0qlo3KSKv3WZ6WUcwmOBRM67741hFsC+mVHjeMMkSoN4wAks/gKo61yKcg?=
 =?us-ascii?Q?VZvSpr/rCuffwVfrKFiTT+vua1ct4l28wFLuGL8rz1HZMA1BBE/aekKrc1sg?=
 =?us-ascii?Q?usQpYHwxLc//qpdEv9u/gupFN9i1AYHaLwJ713taVjBDKWm/SDCvRs0HxjpS?=
 =?us-ascii?Q?9khgxu5gtCRbjq2DAHzhq/zNCyESnbOiq0HWTVuY2iEnlSOrMm+mD/Dj8w9B?=
 =?us-ascii?Q?IyBBMu6Ts6GVh2EHuLQZEpsLvE7aIzr6fiQDSUCSMi3IVQQxB9ut9cm/t7ZU?=
 =?us-ascii?Q?jEzt/Bd56vjTtZvWqHvIzvgFrCi/6tiPZJMxYufpabWFo+ua4Z7KQQKVdAGb?=
 =?us-ascii?Q?6Tmae6vNOkwKLu5fJCZ8IjIZcD/pTiJAL080XjivVWKA1mNp/dloL14wj9aC?=
 =?us-ascii?Q?1wTwMHs7b4u5ay2ZhwcEGBwMyKNlIfo55fC4mkATA5wV2F/KQBWPYvSmnEv+?=
 =?us-ascii?Q?xRxNOvq+ix27Ip0nm4I=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a503cc4c-38a5-4d3e-1b87-08dd1faa90c7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 21:25:59.3369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fh2GeJ+Tjm5kYPst3f1BMTDIiBkkqgJ1eYvjaSI5RLWwwG0RZxISBSNBbL/Db99zfMoZzYsjvOwdzD4qoCeEnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7362
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_132604_964100_D8942B65 
X-CRM114-Status: GOOD (  15.53  )
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

On Wed, Dec 18, 2024 at 12:41:14PM +0800, Carlos Song wrote:
> Switch different pinctrl state in different system power status.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change for V2:
> - Add Frank reviewed-by. No code change.

Needn't send v2 if only add review-by tags without any code change.

Frank

> ---
>  drivers/i2c/busses/i2c-imx.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index b6ed270dd04b..350346a7892c 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1871,6 +1871,7 @@ static int i2c_imx_runtime_suspend(struct device *dev)
>  	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
>
>  	clk_disable(i2c_imx->clk);
> +	pinctrl_pm_select_sleep_state(dev);
>
>  	return 0;
>  }
> @@ -1880,6 +1881,7 @@ static int i2c_imx_runtime_resume(struct device *dev)
>  	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
>  	int ret;
>
> +	pinctrl_pm_select_default_state(dev);
>  	ret = clk_enable(i2c_imx->clk);
>  	if (ret)
>  		dev_err(dev, "can't enable I2C clock, ret=%d\n", ret);
> --
> 2.34.1
>

