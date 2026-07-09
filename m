Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B9AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 06:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7E/NYsy/97xclc9Huf472GFyXqYMEw2RuYMD4DvT0A=; b=ovWm3s/Y1wZR3oCGmFMgtuHAaw
	x8u6+HES3oPY38CLEGr9B6qwvQRQieEjI7TrnfkcAe0nYtTZvmL80edxqgDikdR+1cst4ok3QljdA
	yqOMIuNiIEMm//2mXwTTAoA5o5a/HDJtsSvlFHOFmm+qIEzo2Ts2MkX4NVRYJpPSKqy9aqjvXnAtU
	OIv5j67pHo7/Er7uVcKtTJV5Rcpjy+NhBG7hfEMhVZ91iMFOgFI0QPskqSDiGwkH/y4ek9rJzLyJL
	hXid7EoYrKJs0SLwslt0wH1abSyanFNLZH3pJL4M2YNqeHc25beeX4kmR0QaamxLIb6fMA9tOHVk2
	uiaddEFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiJZ-00000001B9Z-2ZvC;
	Thu, 09 Jul 2026 06:32:53 +0000
Received: from mail-francesouthazon11011045.outbound.protection.outlook.com ([40.107.130.45] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiJX-00000001B87-2RgI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 06:32:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEyCAlmaMpXC4gzsSskpXcm/0KZc/V5y64aC5RDq9bcEch5g4VxWD3T2Z6hXSmTwAldNAQkcbp45wKS92O8gvjlz0eQ/y7QMjqUsHHdUQlg79JjwxuAQzcmSfUtyO+CIy5qPXqgpSXzEoyi5XMewpyLj2A6HV/oluheszIDMGDOPoeZJfeCrwS0CdHkZ5CGsmSMMor9kIkjuUwFM5QCz33+JtmnY+ZL+JSb/+rJXzWaNy/5bsSuhFbTsOrKyfb5hF4pia+FJgbd29k48ekNbfxcMbpFEvViUClBmISc/yzlMOJNVF6Or0dUOHvbUwaoZquaHe2vwcVuBhkQB4EFhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7E/NYsy/97xclc9Huf472GFyXqYMEw2RuYMD4DvT0A=;
 b=lUFHwBCgHerIYhRfT2K1oLX2Ne4EWw61eaHjdDyyE5dTaxEiqQD+SBFZec6mrH/cKR2RZD0vHCBiNoNOgiqXKrSEu2t4wnDEr002guEjnBsIfU4MV24nzmbzxlker0d1Ktl4ntWaVKCcVwBm+EuWWaVd19dKrIJY/crJp2juUOz2SRC9mCaP2SRcMx1n7mYy1XCHbWse2TJD4pEeaOhdLUuQNjoHGu3kxruzEN0IzDoB2oV3388al+QSv0sFpd12xMYdOjTRBTmEc1PiMTjBP9HxFZrFfCMY3+S5/injoVp9SXC7xGZ9l0nP2oO2YN0jXhK7JeeEmkVrZxLCp4cpIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7E/NYsy/97xclc9Huf472GFyXqYMEw2RuYMD4DvT0A=;
 b=WheJrsrLd/XyNl/AHOI5RPtNy5Mz9ZM902z+UdxFCh7ONxe7Cci7G5G7//7HYkAaixIPTZ1P/7k10ix3NNm5YdpxAP30ZLccYeFkI5PZEOP1nxlQBNYjmZciTrTBFXvkYcwabue9CT83trbaM2GImIYTQkEju9icARD1PU75zfGcQYj6d6Mn6DimTmWfc4LbsC2A0dBKm+N6abTpYf20w66zsvTXeDLlC3t9nWq0yOeuaCWrn48uRWMmM9y9HqcDHTI5SO1sl/167qwS8TOOlmWJ+0ELsdHe6Kcmc1rn6ZcI+M/uQh5SPCp+rrufLyJQyZBkwieYE16P6kAIDJojBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by VE1PR04MB7344.eurprd04.prod.outlook.com (2603:10a6:800:1a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 06:32:44 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 06:32:43 +0000
Date: Thu, 9 Jul 2026 14:34:15 +0800
From: Liu Ying <victor.liu@nxp.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] drm/imx: include dc-drv.h to avoid sparse warning
Message-ID: <ak9A56_w1KjFM8aW@raspi>
References: <20260708095645.385291-1-jirislaby@kernel.org>
 <20260708095645.385291-2-jirislaby@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708095645.385291-2-jirislaby@kernel.org>
X-ClientProxiedBy: MA5P287CA0259.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::18) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|VE1PR04MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d55920c-24e5-4d22-7425-08dedd83e229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|19092799006|366016|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: xupIHgF3L4RoY7UUbHO4nLrcxxPKD/8r7OHfXJF5Y3RX5GnJCneaxJec790iqKBns4XYBRerj7BRCpU2BtpxZqlBjHHEfQQMKJC+jqYLV8YAadlSjmVe075wGoLST7+yUVi4jwI1eAvz4ocXHN8RfEgWYfkT/lm3DkqR/jekUPNCUjdfk1PGEVIbbJ6sgjN1Z1KQvs7VU6dayXKTrxLKqLLpXAIlZ2fpgR9neQUL0lFc3BclsZUVHcgEovPj9vSwM+9+Ldvh6bS76BxvNDgGY+ATu8UEK7XBCGEm/h8udCJe+18Nct9lYrbi8jzN0EG657t39iM5Wnm78fAtkym3LEJ+6ToV3DfFviOp+vraTy5uPsKMbIEb0ShRwH0KiRpEVoXtC3JWV1Wfg3jkEKC+4tVjlWljvX9rtivGakV6Rc0F47rlsmUgzYoOPQIT5amf8Oa1EayzMZ4FZQGjmfklu7nDWtjNkFGXobAukcVM+nDwTx4+8HcveaWvMcV3tXZiwrtByGOMZlJ1/PUACtgxTuqK6g3rdc3gpuNvp3mQbhhQg/tlt8Fz20YPoH4kgxRnrJd8p0bBPxfw28fRIbKynkc7f+dT0ulWuZKFRnnYxXdDAetJiiWJRvJpiWh3gmPE69tI7FQHsmtkyv3YqfQTq6np6yoT8SCPzfxcQrJI9fw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(19092799006)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s4qXwdGT1uQR3+idcyy6QSqWe5N3Ph6XGs01R48u8+yYQBmuofaAciUFju22?=
 =?us-ascii?Q?Qz0BsDwjgwfxoOImfzS63xBHc5L9dBNoTYFRvo6m4rIqwQ5WfpXL8rInhV7Y?=
 =?us-ascii?Q?ulraPlCQUytgFldHSKlan1g9NhO5Zwh0+SXrXo9zzVEn35DtWCrV3YoHg75E?=
 =?us-ascii?Q?B03PZrHYZVzY79D2SUAzE5MlPCPr4JRsx9DMphWLX39h8LPcuY5MxIs6DxK9?=
 =?us-ascii?Q?BdWahgm89HwqJVrZUruOzgPckw60sN11LBcTlhS0ZF2aGhYBt3+apf9DjI/q?=
 =?us-ascii?Q?i0d+RgbirtESVzPYUkzMzx79bFpBKOjj1eCsFlXSST5TICHg/tXr0bvdgV39?=
 =?us-ascii?Q?4m7s9IabqQMde2zjotr8T1SColN89/uld2bMGUVkOb5OTY4bVDYYLp2sSzwz?=
 =?us-ascii?Q?ksTBdG6zum817/j7pvObE0UsjICtogUpCcxz9mWbT8EOF/LeoaYEoqknATiR?=
 =?us-ascii?Q?mhzPCU9CGepVYF0NFK5s05QNXJUbrqmbvX5Xl+beXuFB62b7qQWMb/6qocWy?=
 =?us-ascii?Q?QKLD/bA+qxrLpOPZYt3odydd2bBkFelVB5b3bedYzNbIVmcEfVxOe42FykHm?=
 =?us-ascii?Q?rL1d5nugakUJozcB6RCauqg6vQsx3nbhHzIbkoZ/GEV/zdxdNMl44gfmTPnG?=
 =?us-ascii?Q?0c3tK5ZD5efZuPp+h3Go5fPS/rqj+EJmI/yeK0nTYAruyLS4elxFrZqwSXt3?=
 =?us-ascii?Q?P5f7ZlcRp4lYLb0W5zPoXLst3HdDj/HH+KFcgTr/fVb+3wQ2agUyNQaq7Mtb?=
 =?us-ascii?Q?HCpRWXG6Cs52Zog3J4eccmTYKqhL2z7wXX9vXS+80dZXpr17I0ykhvP7n5yk?=
 =?us-ascii?Q?rLQ5hLimR5UWgQjwzvjA4PzUQlFWqGl+NX7oPZoI2w9tYM+zlW2dUtp4+83r?=
 =?us-ascii?Q?8WfE2BfMATofLwFDiEh+Rcgy+Y+AQK6riC7UHHPRrcqqimSjTYd5PpWQNBCB?=
 =?us-ascii?Q?ZNG2dnzbLXmvmoO9rYzNtQz7Tr4EZWl0NqOpnlqfKCtQcJZt/wbuPR/EFIOW?=
 =?us-ascii?Q?InHh+Bd65Ik4VGjozSxgMvSBXzTR4g/cm83MnatycZwwFPlBAp4Un+njPnGn?=
 =?us-ascii?Q?/2kV3HeaPeJXbZsoepwmE9eddkDZPBhAfLOnTIwQaOuT+/RqK/7DHLgifFjQ?=
 =?us-ascii?Q?G/TWU4urGS1lozwD43ee7cQFE9ggPJxNnn4S8fpQpvQwMcGmHjJYG9nsxvXU?=
 =?us-ascii?Q?vLrZFkzHjwyI/Mz/j+994VMPk8xXlu+DlHKhVNUXrRF2cTjGS/LxqN45+kvU?=
 =?us-ascii?Q?ahTXuKUdzG/d241CRWlNvZXeFcv70og6wi+7tKKOwfsagIp4A1aiLTH00zME?=
 =?us-ascii?Q?hJYMKtm3u+WgSLpmCQkn3tf+DmlmZH5zIk+tV6QDq88osvBHEWu6MJMd/26B?=
 =?us-ascii?Q?ic2pQ19Tf55XaTvBNSYLwkLCWTCj1diMqelUqjrTn/qhzG+kVO48nhGBh7N9?=
 =?us-ascii?Q?0ofS4SdpvcBqZuZXMuflq8MCc7m+BVR7p/y8e3cDDw5hWMJAGZ5A2Tn69Nkn?=
 =?us-ascii?Q?faJ+QgFQuqyZzE53RB12DP+mIvekNqhBbqsH81f35o0BU2fXpQ1XiCHhFZmh?=
 =?us-ascii?Q?rcKz2eHWPMNiz/j4YdnxgvTvvhebUsYlTVe6HNdyC0bbGJwZarFcrb9cdAAo?=
 =?us-ascii?Q?VzQ0H2eH2XBWAMCygTXooLRZz0oJ1Jb+fKsjGTyQXssgZOEoSBN/+ANCzo54?=
 =?us-ascii?Q?kOynbiaLAJNVOwcOOekeyzV9yam+FPVmNHdVZkzg+px6fjWu2aaMih8/nWAA?=
 =?us-ascii?Q?Eu9yVQU0TQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d55920c-24e5-4d22-7425-08dedd83e229
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 06:32:43.9120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Sx/BUao1L4bqtmM2hqSPfM3fWw+hlRqJuUQ5Ah9aTh1jU/+iWGffvHt5MliC+AAU+yIviz8rfKadphUD/+HWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7344
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_233251_622834_BF7BA19A 
X-CRM114-Status: GOOD (  13.11  )
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

On Wed, Jul 08, 2026 at 11:56:45AM +0200, Jiri Slaby (SUSE) wrote:
> sparse (build with C=1) warns:
> drivers/gpu/drm/imx/dc/dc-ic.c:273:24: warning: symbol 'dc_ic_driver' was not declared. Should it be static?
> 
> And it is right. Include dc-drv.h which declares the struct. This
> ensures the types of both match.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Liu Ying <victor.liu@nxp.com>
> ---
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/imx/dc/dc-ic.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Liu Ying <victor.liu@nxp.com>

Thanks.

