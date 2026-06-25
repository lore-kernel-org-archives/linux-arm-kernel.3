Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BC6CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 16:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sjDvy8Ddgipyg8134j1EwCgaq56hPhSuHu4ig6YAnY=; b=aXXF2b1x4CPNdZI/vBwVueqklQ
	Ne1VkHzYA/mvvndHYi6pg6fBMj4L/RojENfWiT9fo958s2mbXhFhuOLzl5wsA88NBfVJ6zoAAhsT5
	YydoX0yGJMHz2GvwgvftksKcZQal3doQ3GcJ5MqhGeVYn/jO7ZHGy2bNkpD5QGVfHZ/YelNrFkLui
	MPdu3m7Bkb7ru1TwoLju6ANDfHLuKn92al+/eojtMz1i4tiIBzOQRNJN/2foCGz3MmPUM0to2HDRA
	NqrS9fsYEHju1fhHqQR98kTl2bNTjSLqlY03O9w9RhCSUykHsSB+VNHOmtlAqgIYksyT8ivzKUdbF
	sXuklCyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcn3R-00000009UVZ-3RmK;
	Thu, 25 Jun 2026 16:35:53 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcn3P-00000009UUw-0mIB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 16:35:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eq3jaNXejYF5KOIENNjD7FXcNvtW6IimH+K9ynrpdxepxP8P4noxYVy1cqrCdC9fuhau0KPPsqiWCf4JFjggV5c5ioaQgCiEDoS8Qtae3cxncKaLHzsj7kqtggSeQbG0NR86BVOsQnEqv4tesQsy7lWBq8ZInoybazQnDDPKPq8uKRfPO1cu5zyGRmDGDWIk+i1IRIbfR+MLSpVEzMjBxzb+1ST3mtRDXbhxha0euayfQozufLiZa38a9pxp3eh6wnw+ThKayzw1y0hJYHBAd4wkUYX43WZ3LUKfcuJBdK51tCoyP6xICh7pl97FnWJ4qsaK7t7rX/zp+Q7LyrreMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sjDvy8Ddgipyg8134j1EwCgaq56hPhSuHu4ig6YAnY=;
 b=ysUPZ8SXy9zkOKku9QQzc50FW6R/dIh1hZvKlxPUj02uCtHyM0jphA8RLxc8K0jNkH7imHTH8Aw8pjIPTI3qrOO60134CNjFI9z+w/R/5M1Sc/5BHgWNwes0T32my9Eh61pZ8QmlK/lPFFg77Et7mjxxWiVev0jm8GBW7uocbCZZ0dqae62rIjUwZdQnRkfdCMAtCjvwJa+zbI6AyKgy020OZji9cMf3Yu66vtRyIj1slci+vVUbaXRvXrcctpqps39bpSOX6R3mt/IDfDH/jvjMduhYvfedPlLIcreJfNG198bvg81y+I/+YyS6gRMWtev5yAy9nK0KPhjYvy78jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sjDvy8Ddgipyg8134j1EwCgaq56hPhSuHu4ig6YAnY=;
 b=hUJ1Y1aLcIqWaBYsdqUI6U44tVxZrguzesXHJWzeFfXPcZ7ZJPavOCKI1z9z8k9rZeXOzN/326FPthE4+hpQNt2pG7/D+EXRZ2DO9xNrVLfEuj+03I94HUx1jKx4yut6xtAz+osHc5H9E7Xj2/PY38aGu6KWvmkKEdqf0pegAtLSoTzVZvzese8oyPY+wP4irCWIUvaDUtCteY9vYX/Mz4redH7cc7CtcuNdVbp0DCt3TvU1VeRWWud3Alfrog6FAnWA7xtfJ0F/KzElcBlMBMJ3EJr688EtnU7IcQFsrZLUUZeN7a0j195CXkNvTV/fcYtY8ARzgwrcuyU5oIeYkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB9811.eurprd04.prod.outlook.com (2603:10a6:800:1d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 16:35:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 25 Jun 2026
 16:35:44 +0000
Date: Thu, 25 Jun 2026 11:35:35 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: ziniu.wang_1@oss.nxp.com
Cc: adrian.hunter@intel.com, ulfh@kernel.org, haibo.chen@nxp.com,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev, linux-mmc@vger.kernel.org,
	s32@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] mmc: sdhci-esdhc-imx: restore pinctrl before
 restoring ios timing on resume
Message-ID: <aj1Y1zLgZMzEihZw@SMW015318>
References: <20260625105934.2890635-1-ziniu.wang_1@oss.nxp.com>
 <20260625105934.2890635-4-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625105934.2890635-4-ziniu.wang_1@oss.nxp.com>
X-ClientProxiedBy: SA0PR11CA0041.namprd11.prod.outlook.com
 (2603:10b6:806:d0::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: a532947b-81f6-4a61-68e6-08ded2d7cd6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|6133799003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VNWl4YwbjqG5n4vPW4uqaio8gVgt2VRnkSu+1gtGJCVPuAzCHNLZG+5D+cCmhNBiRcu3eQ/+o7OVm9QYZV+9yVNNcsGKt8L/S9vB3nAtC0Va8nF9+Z1HyueZK4BOnTBMSNhjXhCDDQzDZUmwslifXY5Ab7dpa2HWd+yj19RDSkJ2bFGxboXi+eDQ9EtasW7RiTIF/YjZjtPQeIjJW0OVaEH8/OAMJWlr9LuJPzIdc/HnMVQ/ff4eDPc59r3/I9TyzkG0uurerMqX36KYHdgPyWRTXrlskipKfxQZmbiM20LKf3ZVxdKmnn7CrbvnYsxL2XEIBgYC8nxzfO//+FfD8JLMUfUL9eOWO/fpnXXFq2iL0YRaAvUarnQltA5E1KzzwyCyyPCZ3YS/aSxnYr/ZAlS7nXKc8RTCV2C4HvAHDW7sgri9qFKV3ZfjvxYWJfSjghW1OTo0opxq0GR4hw9Y4MIKOOdprEuN6d350p1CBENqAlxV2sK2SKdsiTaaUCqDrDRdQpHShFUMM3o+Q6Rf3uleT7NvEqW2ny4Lmxr3vGpw0jtm0yssVsSLRT0L+jhIUI+jJLd+Sg4a3pHlXryFIKasmSJduTh9oUXuMlV5wZDDRquvu3SDxtxST8Ec0ckQ7WPzjgrsDel4qum1b5AJyc0xga3QKwHbckesSQCSv84=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(6133799003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jBKBiPGQKlBu8pj4QT6a8T+pv150foL6iJ/oEKps+4jvGzpxkX5FWj35qQwb?=
 =?us-ascii?Q?bo+uWe69eoHB9e9NOMe5gG/vXhx9UAdcxcGVQJwmHwWCNYiOAMEen59EJZXH?=
 =?us-ascii?Q?V2oiEUt1sCbxH3a2nadFDLyz5FxIqtVRHFmgV+IHREPSrqf1r8S5IqLV/cGF?=
 =?us-ascii?Q?u9wOcAIh/k6aoIyvigd14+1mQ44a13fLJsD348THsmQNTXBxluQd7Quf6EuF?=
 =?us-ascii?Q?O5fgzV2cJpbXw3LwygHM0/r73g/5y56UayuGJb7DoNUnD/vmhbtcVXAQlVPV?=
 =?us-ascii?Q?pMKgi0FlT0aTjqzUy1RmUT6KnvCU5TwJlyaqzYpChIDt1BF1y63borfsN3J+?=
 =?us-ascii?Q?1LMgntUtxC4XlRW1c/0+41ZSfUkWoBtz7qB/CZl6q+Iu5Q8luhmoDH2medlE?=
 =?us-ascii?Q?EturRnYEyQQ0O5/MDCzqciyUdAcBn7oXstm11uFdp3XHpqMczO4S2asEl9s0?=
 =?us-ascii?Q?CYHLtgX8LVfcFuCDorSyDZlUywoH5bGkwNU3QP7S5eKx7EbQOn40UX7EOgIZ?=
 =?us-ascii?Q?7SBKp4siYFSf1g4wwTkgkU4EIcgwr490nB9hIeUz8CT3lb37sqWNOn24VFLu?=
 =?us-ascii?Q?P1ISp9BAEQpiEq+2wkpUjoa5A2Hk5oU6m76mMeXVhd7IJFotGtQ3uX7sq/hP?=
 =?us-ascii?Q?AzGyVl4WQUo8JI6A9O+ns3yP6anfK5OxYQHxZQ+yA3MB+QqvePAlVMK2UH7v?=
 =?us-ascii?Q?IIXNHXI0bHqqEUMlQ28DDPVCxCgLxMbJtxXC5f0RhRRBBhQ83oIQcNIEI3J6?=
 =?us-ascii?Q?5FOpthM+Tr1po2bNeCn6hKs54gndWB7u2YQ7rZmTwL8x7abKxx9kIDsz5AM6?=
 =?us-ascii?Q?LCrHZkY2jFPwExdHp9IP9xrXFbngJf/ZQ5iJn+7DSL0wzp5vhk2oS7NwhBzS?=
 =?us-ascii?Q?EUz3+9NdFNXZFys6uJQfJoRZYQgDWB5mvatrAZx+QeCERRsmEKwvir2TY3zk?=
 =?us-ascii?Q?DQiw32ru4VpocqBlFX6aRmMPl823v1Kb4CkVOB9+TcwapjgL33Rnjy9IV+6K?=
 =?us-ascii?Q?KARdDid5GScBEAAc1MqfTw57yMG4CbPbzPiMFN3NgCMFAWKfG8mhJnaAt2Zl?=
 =?us-ascii?Q?RyhmRmyvWNocXO34hlse51StnEmfmT4frukaUrIRmhNAxXq2QoKK5Jn6FXDH?=
 =?us-ascii?Q?6k7YJIqWTogIwT1oijxUVBi10GSAaSTerjowXpMKPpgka3Po+KdeJejM8LxL?=
 =?us-ascii?Q?UHWU9hIyyxyUYPMoordGg8q4fT5TMYEF5o5QqEBO2hRzVnB778bR+nr1WuXv?=
 =?us-ascii?Q?HqBF2BFLkCxJarDBG4qqiV77jUl2UxtiUiYHqoIJ/82+AG6/Br1US49zKdfK?=
 =?us-ascii?Q?bCsfbZiyAEN2pmhOI2mavRIc1CBMlF+6ZH0BLHJzlXkjFfo+JCjJjimU0F9E?=
 =?us-ascii?Q?tx0Od7SX+h/fnQFj6idfiJE4+bANbyt6+kFbYWXhxcq6+8Vxqds1owkaElUu?=
 =?us-ascii?Q?mbBrAunj70py/SI72rNtBmFQ2CK58wrW+55mBY+5oolaKMgPZJBdyRH9dZdK?=
 =?us-ascii?Q?h29igUBLesXsZ41Yf11l58tkL1iNTkY0nGsSrrKhU2YBxnd78oKpQIGlVWNc?=
 =?us-ascii?Q?JccpbdXsI+Ghr7Axo0ujvcZWvYZC6PiJ5Eqgj6oOtipom3WPII/20FDC8ybi?=
 =?us-ascii?Q?2wOiX777UhqDrfukRzIbaTiIj7BwLwgjX8+3y9hwe+bD99qE3zBJFcPexf1x?=
 =?us-ascii?Q?OE4XfQdTmXhJCMzJd0m3YFVrzFGELWKa86NR6rt/ljFnsKhix86Dth1Q4zEX?=
 =?us-ascii?Q?/03UfkAZiAy33UDShNwf5nWR8mDVvegdbn7PYbBWPcplIIwqwX2M?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a532947b-81f6-4a61-68e6-08ded2d7cd6a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:35:44.2253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaKUXvcOBsInX78/IzfNPlR1kCBdil7u3YC1Tp2vblsnNN72/6AvOL2snHUiSZ+o96Up9edHGm6WuTblDRqvNvFbllEeb3Z98qjHqS9btD0q8HBIGW/ERsY9G3jcRhVs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_093551_226123_372937CD 
X-CRM114-Status: GOOD (  22.75  )
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

On Thu, Jun 25, 2026 at 06:59:32PM +0800, ziniu.wang_1@oss.nxp.com wrote:
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> SDIO devices such as WiFi may keep power during suspend, so the MMC
> core skips full card re-initialization on resume and directly restores
> the host controller's ios timing to match the card. For DDR mode,
> pm_runtime_force_resume() sets DDR_EN before the pin configuration is
> restored from sleep state. When DDR_EN is set while the pinctrl is still
> muxed to GPIO or other non-uSDHC function, the loopback clock from the
> external pad is not valid, resulting in an incorrect internal sampling
> point being selected. This causes persistent read CRC errors on subsequent
> data transfers, even after the pinctrl is later configured correctly.
>
> SD/eMMC running in DDR mode are unaffected as they are fully re-initialized
> from legacy timing after resume.
>
> Fix this by restoring the pinctrl state based on current timing mode
> using esdhc_change_pinstate() before pm_runtime_force_resume(). This
> ensures the correct pin configuration (e.g., 100/200MHz for UHS modes)
> is applied. Only restore for non-wakeup devices since wakeup devices
> kept their active pin state during suspend to avoid glitching the SD
> bus pins for powered SDIO cards.

pin state change should only impact driver strength, why cause glitch ?

Frank
>
> Fixes: 676a83855614 ("mmc: host: sdhci-esdhc-imx: refactor the system PM logic")
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index a944351dbcdf..7fcaecdd4ec6 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2114,6 +2114,12 @@ static int sdhci_esdhc_resume(struct device *dev)
>  	struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
>  	int ret;
>
> +	if (!device_may_wakeup(dev)) {
> +		ret = esdhc_change_pinstate(host, host->timing);
> +		if (ret)
> +			dev_warn(dev, "Failed to restore pinctrl state\n");
> +	}
>  	pm_runtime_force_resume(dev);
>
>  	ret = mmc_gpio_set_cd_wake(host->mmc, false);
> --
> 2.34.1
>
>

