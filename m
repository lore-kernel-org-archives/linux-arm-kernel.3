Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB255CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSHI9l9Nn9JPAal2F5/+RMfYX0DO6eCbjcUmfGnLxW0=; b=LvluHZpO5+X5xem/buXMloru55
	v9qRmaPZxoWrmTp1ZE7hwrtdYVJloSNI1vLfo0Vh09LtJLfQOoOv9wIflIouJe4+9htFBGbiQ4+sN
	Ak5f0wRE8y1L4yGZnS9VvymfhJSmhO+J2D46ZPwoNCySlGKfJt/nmtGKYCtqGUGAyGRzK0XTh7nIE
	1OsWUBuPvalumVp4OhZb4jFIBPFCSz0hLiTXGFdKP7+GiuYmEjYdEbmKhYUZDfGZ8vjgkmrJMax6B
	Jlb4EpJKZRfSROgZwud3v8pqxsWkxGaCu1IjDkMvhsUiQi0dIu+fL4yuA82o0ab1ppdTgwZoPCt1w
	sfrXyi3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuu7-0000000D6bo-4Bx4;
	Wed, 17 Sep 2025 16:21:12 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuu5-0000000D6aq-2XaJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:21:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NeBhxybuhK8kw/o8M9b9glQxHB1cYqEZoQdHnzZimkOFCpQr99v7MVTyG6KfvP56f/b0ft92dgTo5hFHJGNCE6+OWXjAkgDiITaLgRLoDKOy5tALBqovJr31ei7Gti+ojuip9wQf6/BE0wQXioH3NvwF8mEq6oPROCvahapl3CSXEY75jOXIMqy5+QztFtuwjkDdwo+A0ngqFSUwN23Z3GvOXY2D0YR3t++cyoC6XTM54EY2YqR2icqzPeIZpKKeI2EcjbJjmRdA0fWJwhQw9aHbK/43QNdddDYj9M9TeRLXgV2SFiYIkRpy+ApDjn0VpO5hmVvuW14ziIcQ/3OxNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSHI9l9Nn9JPAal2F5/+RMfYX0DO6eCbjcUmfGnLxW0=;
 b=NauiaTk9/hig7rrNRBepflXIxFQ/tovDyOWaDdVvjl9G7BWodQFYxBII6XTekdNTxnqWoA+4PYke07YalU8dESikiAA0A9V0Sdg3nxmf4/vrquehCtBr18qvWlS6Df1+7ja0yqFqZUA031OYYAwtNuwdCt9qxMEEN/31gz8T7isu2Y3crv084NzDeQ8B8w0CXBve/JkhixEBt9CJ9dyDrPg7m9vyyJc/3Sx/mNqt7ZqXgtS1iDiSR9esICaMBAjt+t4CpEejdhzYldulCXFygE75hQFrAGk6+Joy+lw5T4qzQflz4lMrRtitwwakzB/CjerKCfhnYXK3FLB0Q3qNGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSHI9l9Nn9JPAal2F5/+RMfYX0DO6eCbjcUmfGnLxW0=;
 b=RENMd7IMH1sQnmU7D8IuHZErlz12ouWQMPAKa5gQ38uzQgpeYBFi4n+w3aHLEalzxBkAoR6URtV30AQPZgpXlIO4SudDDgUGK6dLIrmfEUGnsicwUrF/KEObCUJONgTr1ctMg/oOd3mUrAfXA6br2EXN3bmsLlXSxFwvdVllQvQyU+VdmTjhfev29mFTl3JWVobvI0mfi6AX5Eilgf0QjVqD3RN50zopWTjzzWWFXMYeE76/oLPrB3RVY4PMOyb88+u0brcsjnBASyePT4fCcP6W1hw0x0M0oz/gpEN230+rlA+WppM5ue0+0awOdc6a+nFvuV5yXSP4J6flu3ShhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI1PR04MB9859.eurprd04.prod.outlook.com (2603:10a6:800:1d9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 16:21:03 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 16:21:03 +0000
Date: Wed, 17 Sep 2025 12:20:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 6/6] Input: imx6ul_tsc - set glitch threshold by DTS
 property
Message-ID: <aMrf6KBp290uzYgD@lizhi-Precision-Tower-5810>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
 <20250917080534.1772202-7-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917080534.1772202-7-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: PH8P221CA0065.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::13) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI1PR04MB9859:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d8e992-59d6-4363-8f67-08ddf6063286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q9+qFpAdxF9NUfkPq7CAOeH44sfm8ZQ0s9/xpmuFaHKRGBY+Kf21iKnnwpVb?=
 =?us-ascii?Q?QyxtfgA2tp8NP5w32yTztNKCszELv6hTeQT44RkYZAwWJnK5f3ahukHz66sJ?=
 =?us-ascii?Q?yr+IvmtZSWNjkaCZkIiCN+Ox0tmZqJzaHFI4sr3IPTO2o+W1qHV9ba6C/hdt?=
 =?us-ascii?Q?HghPagUpM5AdHG7g9EPZ3WtzMRezs3QoDc6GZ4FQa1MLPION4oi+NCWkAPRy?=
 =?us-ascii?Q?dPB0T0rxQYbpWGVjjdMd6YhumQThm0N1H12Oj8YoKOSTHYEbjLMOABdhfK17?=
 =?us-ascii?Q?qsXq8+0YtzRe+NfxaWucBglGO4ZLDv6rKY8d0NyRMumFNNsu8A0ZHBtf+40n?=
 =?us-ascii?Q?Pxzllyt8vZm+Qp+wF8bavZBeAVgIC+vDubXFgk0KTyqj1+tzp7SWzd+8yWFy?=
 =?us-ascii?Q?wqaJyBGq+WwBHF99DNazRE6/X74umhJpDGOnJ2LmO3gYKf5C8qHLSfik4M4O?=
 =?us-ascii?Q?DmLtp3TKPSABZH4WjNf0ljwu6QXT/8sygbQ0gpyIAd42yyLiB2BF24uU6FQ/?=
 =?us-ascii?Q?y6c9+rqXpZKg70KBNcwujNNPbfxWGxCSFeT/CaRASXh+HtbUMMu/NtWcALSz?=
 =?us-ascii?Q?7tXz7JWX+H2jCgSS8cFve+OMNakSQydFa8Uo+X/dkfR9FGW3pjgUMgrb4t+i?=
 =?us-ascii?Q?3l3vA+hY0e0wU4nQpRn0tW6c3nDJZtHWFFgthHileHMe2we5mSorUTCXrIwV?=
 =?us-ascii?Q?A/rmX+VSsj8oCU9qarQTQII6RBn1RnBYf0VZ6S6jWWbjDApQmenUL8Kn0D3c?=
 =?us-ascii?Q?mLAOA3vD4+gaxd631GFYNP8qcM5xvmVWk8h8NVX1RblOjCsRokvux5+D/ZRN?=
 =?us-ascii?Q?2A6d3BoHph7NYtEKSW1SYrIXlmWEqs2EuZN3NYCoP/putd8cky4wwZU0/lBf?=
 =?us-ascii?Q?+6nyvvTo9R4ZdJTmvuK77u92WYS0/xSdcexwZ4vhK5vdJiejZSLR2NkO/2o5?=
 =?us-ascii?Q?veQj6sBm6erwpSZumxfu7tMEo0IpgZnQG9Z8sTVbG55LJX27rFgdKvbGRjYz?=
 =?us-ascii?Q?0nveo+maKYBL7IamluBWkWLgiaNq8dW+o9LiLzh4R16MwCebDFSNNO7P1AAI?=
 =?us-ascii?Q?WpSQFOfaJuJTqRVy5AimE4f8bDM4wfPE9GVw3tqH56TU9vTjZCAhZgFToHX0?=
 =?us-ascii?Q?QJOGPAeNbGwSGf30QRBoDxISoq6KoxtGfuA3X0iSccpaapf90IeRail8flDK?=
 =?us-ascii?Q?99jtyC3G2qwgNBJ6fFZ/Sq+j3KztsQbCOZjdclPUUa6oDeimTDVC7fZFjm6W?=
 =?us-ascii?Q?c2D0v9DC3YRlqSwn0lE6JdorWpLuviTLwfVnUNRqMCQQzUTwuLwN8PAVhlwk?=
 =?us-ascii?Q?1nbr+kgwAgHRYMtIAWV+oLkZcjdax4Lg/jaHnriGEmeOQ9miEwmZUIaMj4+r?=
 =?us-ascii?Q?iwcqyxYAluNekRdsQ98UNb2wKMePHbGMOfPdCPV/Oaow2abheib+Na4znJsN?=
 =?us-ascii?Q?ZTWi0BWy0XYRZn2p8nMIbWV4Hmvwobm9SjOgin8C/PrpFJElO49Vhg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XcPtsNga0ePPo0weQjKyFkY5EKMbTgw+iSrlLMOrwE5/QDLK4mN48jiaR5eP?=
 =?us-ascii?Q?Mr95QCLixPkwCanTZQLLIuHLmOHX7EcxBmhidj4l25Ex8kN/8qcCrnjeu6y7?=
 =?us-ascii?Q?m6sBGArnE+DcZ2DUF9K4T+/p9P9q86VPKd95hQDsM+SbVw2LjxO0Ko+hr17N?=
 =?us-ascii?Q?LdMgw3gpiBxklcMdXwUaKvs9KKKrBrfCVZcPaUNVAxPsshW2Jmixv33BgvEy?=
 =?us-ascii?Q?IH06+QJZ7RhrlgekV/speTvpR5fR5lveJZTfzxntrsxVuVfNLWw+3q9BPvY4?=
 =?us-ascii?Q?njH1ngtIilYk2J7fV2GobhsWDUOJBcwMYSpuVCQ2R+NrI7lZhnjXVeI7bYBZ?=
 =?us-ascii?Q?KFX+iPxNvjtqThyDNiCBUPdCuhxqKminuxrDsE7Jp2Yi6RKyV5ZnbLQ1hHM0?=
 =?us-ascii?Q?RxA5pZB0n24JKINZcru4x+fVjvC2bsHtMt5X+eXLrTEHRR8CV5bTrjfzt7bK?=
 =?us-ascii?Q?axMYXZl502MTSvnERUYAiYMpqQEccfLV4w262CEzTJVW8LzL6mRjjacYOBkE?=
 =?us-ascii?Q?jPpgSHYFZgL3kJPEOxq2fxlJ4StMO+Vl/gyHePNIYluReNE6rfBe/u5Qi1ws?=
 =?us-ascii?Q?nsYcctkvPI+QtUtDwBVNWQ9SG5OBNP4A3ElktPzzOAkkMdAe1rQ3WUaPuhwC?=
 =?us-ascii?Q?POA1cagQnm7FsklORU0SZRBTGhUMxtZJuzxE4tmeV6cenrke1VXbrld5H6gD?=
 =?us-ascii?Q?hTpEGsj6OLZEFNrXP+Yc1Jplk/oga1PH0Bquoln3IAwhnSLBBFRrfaH9rk3w?=
 =?us-ascii?Q?lNhJt2LdIOXZ7WCNQ+iboOHhQT70UFtG9IVCYX8OZHwpstNW4Rrd/YSKrGmU?=
 =?us-ascii?Q?ka8shCmOuibz35GoPM8me4FPdoOgVZJaNGjJ6oCjx0PYykcjfoNKNYWRd23S?=
 =?us-ascii?Q?HGwfME04Qe297Owt7xul7Vks7ZdP5yXUoM+t6kMTZPUhAH3jQgqKlN1o13M0?=
 =?us-ascii?Q?f5WhEFWZs1s6GNZAkdfwqZqu1PkH3w33r6zh8/HDuad1Wf6i0fxMT/2qdS6+?=
 =?us-ascii?Q?xeBmsOMNMR1wiwYHq5RA2rew9STzv7FUOrbKV2qiqFd+3vpiKGdTJqs4agOW?=
 =?us-ascii?Q?uJlVaJBAFS2qG9MIr13gKhSFXZXsXglkmqadqk1zvU5UCUmsIW83sIAxHONQ?=
 =?us-ascii?Q?wy7RqVg2FmwepGpMTuhwumiAFFgoZoTGjIpan1h7SNIm0Efx4ysgd+nUb4+0?=
 =?us-ascii?Q?eVSkXWpp59tS6vd/RVxijteIqffKQOKhyHfNwXJ3gvHvMXw2rews8ZgVjaQD?=
 =?us-ascii?Q?j8IBA5nL6KMUe5zciHGL7WgCeoE49GdNc2egLHymLOFN0AqU7TKmmKsw6I6c?=
 =?us-ascii?Q?yH5qYA3JuCcARH/+Pc43TxF2PqLZrPJfT+D1DiLPmZsKjwcs1PZM/uONFs56?=
 =?us-ascii?Q?USy4ZSOhwSzQ5O+wH4dDaTKB9aQNI9qytuD/eJuoKRSwa2vfLZui7GVxbmed?=
 =?us-ascii?Q?iyTqUJYy0s91ez3+9DxVNrWO2lPnbjddVlDUwMbP97m4LHS9A+XuNLHNWo0Y?=
 =?us-ascii?Q?q9xYJXGpg7MRmvP3McUGxnys/xKUUziPwPgXQCveEvYtemzPO+mDEv0pk6vX?=
 =?us-ascii?Q?ROkq8LoEsQXVZYnfZlgeOOj97lSjmPI8QRyNnDBR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d8e992-59d6-4363-8f67-08ddf6063286
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 16:21:03.6501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pBu6ycnesfKEwZvZ4WF8f2OKPU9GT3CRoBwMrPWWHeUJ8IZJX/U9NJS7dqGGDT4SqM4boHDUhnqxkC4Lt+V8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_092109_659425_E07E020C 
X-CRM114-Status: GOOD (  26.16  )
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

On Wed, Sep 17, 2025 at 10:05:11AM +0200, Dario Binacchi wrote:
> Set the glitch threshold previously hardcoded in the driver. The change
> is backward compatible.

Set the glitch threshold by DTS property and keep the existing default
behavior if the 'touchscreen-glitch-threshold-ns' not present.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
> Changes in v4:
> - Adjust property description fsl,imx6ul-tsc.yaml following the
>   suggestions of Conor Dooley and Frank Li.
>
> Changes in v3:
> - Remove the final part of the description that refers to
>   implementation details in fsl,imx6ul-tsc.yaml.
>
> Changes in v2:
> - Replace patch ("dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
>   fsl,glitch-threshold") with ("dt-bindings: touchscreen: add
>   touchscreen-glitch-threshold-ns property"), making the previous property
>   general by moving it to touchscreen.yaml.
> - Rework "Input: imx6ul_tsc - set glitch threshold by DTS property" patch
>   to match changes made to the DTS property.
> - Move "Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros"
>   patch right after the patch fixing the typo.
> - Rework to match changes made to the DTS property.
>
>  drivers/input/touchscreen/imx6ul_tsc.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
> index e2c59cc7c82c..0d753aa05fbf 100644
> --- a/drivers/input/touchscreen/imx6ul_tsc.c
> +++ b/drivers/input/touchscreen/imx6ul_tsc.c
> @@ -79,7 +79,7 @@
>  #define MEASURE_SIG_EN		BIT(0)
>  #define VALID_SIG_EN		BIT(8)
>  #define DE_GLITCH_MASK		GENMASK(30, 29)
> -#define DE_GLITCH_2		0x02
> +#define DE_GLITCH_DEF		0x02
>  #define START_SENSE		BIT(12)
>  #define TSC_DISABLE		BIT(16)
>  #define DETECT_MODE		0x2
> @@ -98,6 +98,7 @@ struct imx6ul_tsc {
>  	u32 pre_charge_time;
>  	bool average_enable;
>  	u32 average_select;
> +	u32 de_glitch;
>
>  	struct completion completion;
>  };
> @@ -205,7 +206,7 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
>  	basic_setting |= AUTO_MEASURE;
>  	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
>
> -	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, DE_GLITCH_2);
> +	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, tsc->de_glitch);
>  	writel(debug_mode2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
>
>  	writel(tsc->pre_charge_time, tsc->tsc_regs + REG_TSC_PRE_CHARGE_TIME);
> @@ -391,6 +392,7 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
>  	int tsc_irq;
>  	int adc_irq;
>  	u32 average_samples;
> +	u32 de_glitch;
>
>  	tsc = devm_kzalloc(&pdev->dev, sizeof(*tsc), GFP_KERNEL);
>  	if (!tsc)
> @@ -513,6 +515,26 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>
> +	err = of_property_read_u32(np, "touchscreen-glitch-threshold-ns",
> +				   &de_glitch);
> +	if (err) {
> +		tsc->de_glitch = DE_GLITCH_DEF;
> +	} else {
> +		u64 cycles;
> +		unsigned long rate = clk_get_rate(tsc->tsc_clk);
> +
> +		cycles = DIV64_U64_ROUND_UP((u64)de_glitch * rate, NSEC_PER_SEC);
> +
> +		if (cycles <= 0x3ff)
> +			tsc->de_glitch = 3;
> +		else if (cycles <= 0x7ff)
> +			tsc->de_glitch = 2;
> +		else if (cycles <= 0xfff)
> +			tsc->de_glitch = 1;
> +		else
> +			tsc->de_glitch = 0;
> +	}
> +
>  	err = input_register_device(tsc->input);
>  	if (err) {
>  		dev_err(&pdev->dev,
> --
> 2.43.0
>

