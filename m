Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19621061B04
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLMsKydgQXFC4hLYtxi/0uunsFK65vz43bRlLifDYAc=; b=0E0xKBw3gBL3xrMcUwMdSYMR/D
	QDADUxdZhTrzGJhvAACqIF06oLdtZiPxtN3l760ktaJXgaHgx/fy/ill7xNjLmxDZOYKEuKDD1A5H
	6DpmZVmPlCZV3XPkpbmo/VJfJpEI/HdWcAwG6n6loYnpclF5coDNhwzi8qCV95B2UyXpButq4Zy+r
	2iy/skOP9xN7u+zkZDxz3CynMQcZ1wBRIL5Y48RlVD0f0liMBgu1gEtCLDQldwHPTkBjGu16qP+jK
	TNa5+T91cJhx2Th50nNXqWdA3bPA0mPoqzPoel4HfMUYjWH0GTf9eowqJ+fWD/YiDgW9dgpnswqZz
	ej68RJAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dgs-0000000BQzM-3LiI;
	Mon, 30 Mar 2026 14:34:06 +0000
Received: from mail-northeuropeazon11012026.outbound.protection.outlook.com ([52.101.66.26] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dgp-0000000BQxd-3j8b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:34:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txETxtiGZeB7JQ8QYagufjc5Y94QBgguSzMXjlcW/YmauWkJHeT+WsiZBBXyRlixvBC5Miriow64x2Cxdnc6y2EDfFJ10uUj1s36/n+02QtkhxCqwApNZ/GsgjMrKVpLApcgVR39ZyBjh9CMNZa6SGp9axFjCwlgSffc0KFwzOQ4i/kc9/Uv2S+OYc1xPeq00dS/b4drui1pTrGEuWP/SrIvpsemRYQGZ82evDjOH6Qp/nWBqVglH95CFyEsp88Z0aLC36f7KGCOrh+uUvHfRS9I+81m0H0BGRCKb2W8kPbeMnfhGxywSS2sWR/s8oOpMT3+K8ykNgLFy1lfp91+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLMsKydgQXFC4hLYtxi/0uunsFK65vz43bRlLifDYAc=;
 b=bPI0fl76Su6Cb9Nt+/utt2A48D13665mLDAbUAT2huhs9tInJWFnHLo/UXyJGW11iMlY22U61C0EJsltHAmwBNYohSmSF9u+3v1X3Rin8RLzgTz1z+u9aCA+fsxWdFvQJZqk3WeBE14xHfcdjEJ9OTcsSBakDVC1/DHyuIsGhIYxPH5LAX39HmrXM6MfvY4QHyAjtMGusWhKuj3Z9VF8kts+fuxS31nPXVCt1wGn2E9vRDZxdQ1R+p6+jFiL7FoT9IRL7OZLPUGDFtAPJ1cXTJYZbxDp/deOHKyio5HsEZS3Dlza6mfjBwNZ66qKKXRJGFvRA/e5DohvIfaW4TIUTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLMsKydgQXFC4hLYtxi/0uunsFK65vz43bRlLifDYAc=;
 b=bTzd7KYKYY8/YpwDro03SOsTZEBPnQC+i+OCL+jmKdBazQvDAbU+elg33J8gdG+JRoH/ddNEWP/kXRAdk+PBIu7J19eT+y4Sqo1dqba7VQmsOWpHFlo5yx6a6aI1ASeagnwfOdB09CF6xoYTAe5ccDHw/CyXlOfABpRL0xiHxaDtyr6y+Izd25jrcNkQ4jxdvi6GJlN/MZc3OEJZnDZNx5a6Ify2l2wD76ledc7QI/RqAajdTlzFmzTAF2C9UFwIbh4VXedDLn2641M9BLKnaCf0g45KaZ1mRmAxIBqai2A8fyFcfFnfo+wsDdLhUwQM94yoB2t9sdBUDRKWV1Zp8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS5PR04MB10059.eurprd04.prod.outlook.com (2603:10a6:20b:680::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 14:34:00 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 14:33:59 +0000
Date: Mon, 30 Mar 2026 10:33:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: phy: mxs: manually reset phy regs after a warm reset
Message-ID: <acqJ0Q_Ux8PvGT7s@lizhi-Precision-Tower-5810>
References: <20260330093133.973785-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330093133.973785-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SN1PR12CA0093.namprd12.prod.outlook.com
 (2603:10b6:802:21::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS5PR04MB10059:EE_
X-MS-Office365-Filtering-Correlation-Id: ec87bc86-ccb8-4a01-b9d7-08de8e6961d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|19092799006|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: deUBSWKcyERfDlkx4/0DS1qKELE0g87AafwOTQlFRVubQ/5xrj3bhw7AcfGabFO3gjP6mMosqFXZbWT3jNodwQJh3hpRtBfgbacOUesDsBF4rhp/XZ7wf6CIgRlVsjsAo5EaPZ6Nj8NQDMYyBDU4cWITKVEWxcCGHm5KowwBQ1+dkvznJRCMBHkoXXl2hrNsabamRjSPM9C5kZktTo1AmPKFYo+d0XV1fkqh0FBceQqom861Gk2VLT0Q7une9uJHCGT/fovd0tp1HLESsKRVc0b6rAn9Q3YKsJ96HFDAn80pgwh0aPRxFiS1/BZ6Yp18lUIDsyRcFWbiZIVAf41yl6DNtSpzn7q81jS1YN8xmIv8Si4jtsuV473bppoDOp6kzeu7uwI+CM2OQXjDO9G7+Y7/91X09870+nQFIoSUltv+OfttulwejbL6JsxNV1UXNGef8Aun2l0OM75/4E3PbvKe+aH6obKbFGK1S1P+zTq5hub+RNfbJJs6u52GB4vhn6PWgeqVb2qYjc/RM9t3P1hdTOfkacVCj9tPtNkOzpQYTS4W71nkSWL6orUChKphF8mtKEY2DxL79YzxERCcBGXY3pbIL5mGa9VPo0UcQtzFsv77KKbJYHwDt+QvaUxS9Sm84iyDxxh1bYiWO99ugBdtDEYgzczFJ24k4WoInJVUzzJBtMFjL7+2fPNiu0EKNk+BNXUMCFZsrTux3B2nMZ8kJBzGzetS/gq/FPIE8PeFq83ruiV6EdP2XHyErTlGqxvGwxUzqY81roMtWORiBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(19092799006)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x22K0O24qeaOteEU6rR/dxlQFxCp+tS5SrjlY2oGRIbJUxT03JvAxTYI3ecs?=
 =?us-ascii?Q?23sio+BwZ42sBOZhbkKFldSymxyGhBxNa4Xjhin5uZclDvDSFDZ0glCRANRv?=
 =?us-ascii?Q?ZdtBQ1WSgtCCxV9ir38OstHSxdn18X/3/4w+aF0XZkLxoilyW8Pluekrhd6M?=
 =?us-ascii?Q?o2c+A5mOHueYougTHKe+I7nEYQZmW9JHb7sHRbURyIDdra8rrEbQtMn53F27?=
 =?us-ascii?Q?fYP9dFrTJgTsAmnc0G+ApFi2Q6UwtH4tGitvGjXUugwRWuldXOJIhDicbTSy?=
 =?us-ascii?Q?opsfnUNXop3dCSUtHp7VO7J92ABute8W5fdaHjoM/MkVHErZrzBIfMGMgKWb?=
 =?us-ascii?Q?FS5WvbpzYpNwCbu8QtC0g1QEYNiROHPQMnrIWJbG3F3oaJBy8c3fb1r5RIzd?=
 =?us-ascii?Q?VHI3XOL1OwwKoWgeiBu03eUdzyZp6XjvJylscpfoRMt629tmlJwkmX8FKq4S?=
 =?us-ascii?Q?z8Uuc9Ip7rxwDOYrnGsLXw8wjjkiQI5shQvvasT2ZIVHBQQ3CV8KmLvrygC6?=
 =?us-ascii?Q?cyKOAd222hM2nqYIW3OIoABB/BXxUzhJMtKl/ZZUdzPR+zTfZ6D96yqUPgNF?=
 =?us-ascii?Q?G+5zpoMyaP0Y0R7cP9jwmqZbw0FLJAvIrtfRVNTXeSta1UFxIJzwsmbyUJqg?=
 =?us-ascii?Q?OyCPDFRwP31N5vWrj8Fea5ujWa4HH/VcNJ5sNhfZtpLk3E4UgTLlpcLt+ITR?=
 =?us-ascii?Q?rhESbUeHIoaYC1LyC8aUUgPdp1uuPfaEja4vtPdnSSzD9d7FH7wDupNxfMyQ?=
 =?us-ascii?Q?ko8gqtN14dqJA8V9BICwJp6wFeRSXHpnJpY5PNdsQzpTVZusem1MH1kSZ0mc?=
 =?us-ascii?Q?l6XzyE4bqd1ogJU5HiSOP6mtMhL7jfRvgKs+fjKwAmbKlnwY0e/ZHVYuySjr?=
 =?us-ascii?Q?+MjTouPE59RgenBJMDAQFqLi1KEa6gOhp1P153dgQps13dXVQNdrvii1hhSn?=
 =?us-ascii?Q?PNF8oh5Qy9l/KPmel1WJt2MmsvpsyPggr9NL8tZEF3AzndeAryy2LEmf9xRw?=
 =?us-ascii?Q?yyGleM+W5RvlqXBnPxs3TykXD22EM+mSw/J4NcV18S/QdRpmjo9P341pd85n?=
 =?us-ascii?Q?MCGUq415BypB2VJ2aaOV8drKqA26JK2EVP55TDaCR7wU6TxmwQgG6o7HYzrf?=
 =?us-ascii?Q?ojarEdVQHor6APv9KxvYTsqb19B3XL1m4LSvK1L9+DMT9EdEXZ1ysHBR3EzR?=
 =?us-ascii?Q?/qigbm0GDIbo1MarzGJlA54VKRTLgI3uH1UoNARsPaFXGvbQ2mB9OX2yxB4x?=
 =?us-ascii?Q?Gr0XwYaOtXrsV81GXY9PGWFj3PIuYgnQkETDGfeZP5GwdX63o4inOXDfcXUH?=
 =?us-ascii?Q?lxmNvi12SlSng03yh8/jmCSznRF4vowH9PiDB2NEX4T+ZDrjbHCO+6OlwwkU?=
 =?us-ascii?Q?y+CATr0h+ijJGfe0W7Qk82Vzm+lEmrrO4X/+EQrRrbFyMAC3qean4vHqmOSn?=
 =?us-ascii?Q?sFGp9+yrZqhJ6MbMFA9IEbXNLlQfbatG8JUO5ak1ZLnFHYmzclfejI8Rkx6J?=
 =?us-ascii?Q?VpHZyNGoZEyCpMVFJKHgufBy02THIDyjbIdfJe13nobLp4mXwHwtw8QZJ65A?=
 =?us-ascii?Q?t9yEsS+5Cc+YRkIJDgEwkKpAGIdy7uwfgwnTIVNXAuWCwV5tsLDpy6hNMagO?=
 =?us-ascii?Q?FnDjUxaZXBAJsnBRr8UBq1a2clisH234aE6eDcHsQGb+3vHiWqzVF8Wvb+3z?=
 =?us-ascii?Q?kW42a2J7ZDbHXWMg7/Y1RXgQBw/x0/GAKW1Txa2PpYCNSD55?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec87bc86-ccb8-4a01-b9d7-08de8e6961d1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 14:33:59.8419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: al/D9ltQrYrGY8y7gV5LDQstHsccGbfAfZu+PL76OGRjHhYElJc+Gug6H3c01nLCTk1Xf87vDHB60Hiop8xN6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_073403_977072_C418D5A2 
X-CRM114-Status: GOOD (  24.85  )
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

On Mon, Mar 30, 2026 at 05:31:33PM +0800, Xu Yang wrote:
> The usb phy registers are not fully reset on warm reset under stress
> conditions. We need to manually reset those (CTRL, PWD, DEBUG, PLL_SIC)

Avoid the words "we ..."

So need manually reset CTRL, PWD, DEBUG, PLL_SIC ...

> regs after a warm reset. This will reset DEBUG and PLL_SIC registers.
> CTRL and PWD register are handled by "SFT" bit in stmp_reset_block().
>
> ERR051269: USB PHY registers not fully resetting on warm reset under
>            stress conditions
>
> The following USB PHY registers must be written by SW to restore the reset
> value after a warm reset:
>
> Reg: ctrl Addr: 0x29910030 Data: 0xc000_0000
> Reg: pwd Addr: 0x29910000 Data: 0x001e_1c00
> Reg: debug0 Addr: 0x29910050 Data: 0x7f18_0000
> Reg: pll_sic Addr: 0x299100a0 Data: 0x00d1_2000
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 7069dd3f4d0d..dd42db8a0829 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -209,6 +209,9 @@ static const struct mxs_phy_data imx6ul_phy_data = {
>  static const struct mxs_phy_data imx7ulp_phy_data = {
>  };
>
> +static const struct mxs_phy_data imx8ulp_phy_data = {
> +};
> +
>  static const struct of_device_id mxs_phy_dt_ids[] = {
>  	{ .compatible = "fsl,imx6sx-usbphy", .data = &imx6sx_phy_data, },
>  	{ .compatible = "fsl,imx6sl-usbphy", .data = &imx6sl_phy_data, },
> @@ -217,6 +220,7 @@ static const struct of_device_id mxs_phy_dt_ids[] = {
>  	{ .compatible = "fsl,vf610-usbphy", .data = &vf610_phy_data, },
>  	{ .compatible = "fsl,imx6ul-usbphy", .data = &imx6ul_phy_data, },
>  	{ .compatible = "fsl,imx7ulp-usbphy", .data = &imx7ulp_phy_data, },
> +	{ .compatible = "fsl,imx8ulp-usbphy", .data = &imx8ulp_phy_data, },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mxs_phy_dt_ids);
> @@ -248,6 +252,11 @@ static inline bool is_imx7ulp_phy(struct mxs_phy *mxs_phy)
>  	return mxs_phy->data == &imx7ulp_phy_data;
>  }
>
> +static inline bool is_imx8ulp_phy(struct mxs_phy *mxs_phy)
> +{
> +	return mxs_phy->data == &imx8ulp_phy_data;

don't use this kind check.

Add field 'need_reset_reg' in mxs_phy_data

imx8ulp_phy_data = {
	.need_reset_reg = true;
}

if (mxs->data->need_reset_reg)
	...

The same logic for
	if (is_imx7ulp_phy(mxs_phy) || is_imx8ulp_phy(mxs_phy))
		mxs_phy_pll_enable(phy->io_priv, false);

add 'need_phy_pull_enable' in mxs_phy_data. (new patch for it)
    set it true at both imx7ulp_phy_data and imx8ulp_phy_data.

Frank

> +}
> +
>  static inline bool is_imx6ul_phy(struct mxs_phy *mxs_phy)
>  {
>  	return mxs_phy->data == &imx6ul_phy_data;
> @@ -305,12 +314,29 @@ static int mxs_phy_pll_enable(void __iomem *base, bool enable)
>  	return ret;
>  }
>
> +/*
> + * The imx8ulp phy registers are not properly reset after a warm
> + * reset (ERR051269). Using the following steps to reset DEBUG and
> + * PLL_SIC regs. CTRL and PWD regs are reset by "SFT" bit in
> + * stmp_reset_block().
> + */
> +static void mxs_phy_regs_reset(void __iomem *base)
> +{
> +	writel(0x7f180000, base + HW_USBPHY_DEBUG_SET);
> +	writel(~0x7f180000, base + HW_USBPHY_DEBUG_CLR);
> +	writel(0x00d12000, base + HW_USBPHY_PLL_SIC_SET);
> +	writel(~0x00d12000, base + HW_USBPHY_PLL_SIC_CLR);
> +}
> +
>  static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
>  {
>  	int ret;
>  	void __iomem *base = mxs_phy->phy.io_priv;
>
> -	if (is_imx7ulp_phy(mxs_phy)) {
> +	if (is_imx8ulp_phy(mxs_phy))
> +		mxs_phy_regs_reset(base);
> +
> +	if (is_imx7ulp_phy(mxs_phy) || is_imx8ulp_phy(mxs_phy)) {
>  		ret = mxs_phy_pll_enable(base, true);
>  		if (ret)
>  			return ret;
> @@ -368,7 +394,7 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
>  	return 0;
>
>  disable_pll:
> -	if (is_imx7ulp_phy(mxs_phy))
> +	if (is_imx7ulp_phy(mxs_phy) || is_imx8ulp_phy(mxs_phy))
>  		mxs_phy_pll_enable(base, false);
>  	return ret;
>  }
> @@ -487,7 +513,7 @@ static void mxs_phy_shutdown(struct usb_phy *phy)
>  	writel(BM_USBPHY_CTRL_CLKGATE,
>  	       phy->io_priv + HW_USBPHY_CTRL_SET);
>
> -	if (is_imx7ulp_phy(mxs_phy))
> +	if (is_imx7ulp_phy(mxs_phy) || is_imx8ulp_phy(mxs_phy))
>  		mxs_phy_pll_enable(phy->io_priv, false);
>
>  	if (mxs_phy->phy_3p0)
> --
> 2.34.1
>

