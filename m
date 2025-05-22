Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366A6C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15xagGFsClb1JpWH3ksSyXQus3/deBKjt6Nms7URPVA=; b=SBqJu1qthC8/TyttEj+rCYM1N6
	ZCOQT4QLryYUJyfT2pQ8uymjJAum+j5PSrWHxG2Jm3OLSdJ7NBLAps2w2inovtihIhN9IXU4ncgeL
	BF3nqtadD6TX+70/hK/hjEvoQu1ArFu83k22nsTJW5LMa59en3MezA2oBhtmk4hEiva3jDB4XBWV9
	RgtVn4NiBSORoUxs6QTdRYSsYOEWOjbBHkDREoj7xnqZ/YGUgX+fol/9NpibBQ/qbd7zGauN06vcT
	w8rcK8AL7wO9JU+h79pwj7bbMVpQJBZoZcZzIE1/Q6CHixsY+I8/+M4A4IU6EuknQniQ/sM6+U9m6
	5qy7GPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBrs-000000023BC-0PuQ;
	Thu, 22 May 2025 19:46:16 +0000
Received: from mail-am6eur05on2062d.outbound.protection.outlook.com ([2a01:111:f403:2612::62d] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBpo-000000022xW-2jsw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 19:44:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jx4IOmVJUYZIHoT50pT/3mouBfxfh31Eoe/ZwL8moMHY3MgyRe6mWIiFcHiqSNnmXp82NfZye1FkOcA5elrjraxcc4IRJMpBzSURP5nnLzeThJDbnYD1UoQpMWS8u80srvKzcmiHxCLitfH8xMpkjwS5a+wz29lX40ZUDOCeH4lKy1FDtTlPjxOwK+BjxJ9BfQWl+Y2x4bLnLOoqR5KJ16JFor85pc2AANfNNb8LBfESyMWJwIIPty8kkVYCyKPk2oHEpbm5vQre3M1oQ1t04Oj4keVWSgp5HbBArQrQiMwpyfV+5WZO8Fe8Eh+H/XvDYGkQSXPnTHS9wulZppao1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15xagGFsClb1JpWH3ksSyXQus3/deBKjt6Nms7URPVA=;
 b=OP9UJvCNRyNNWqWTsf64omRRZGkOY1Qsm9nXSBi7bcBZxmzVdQRSPtYVw5sqMtc0WoW7sb1xvSVL9PtndDf5OiGG7SeM+Xn+9e6hg3JkkBnO8Kmhny3+py6wGpimh79oTWj3kmRyR+vb+Jbk1eFuKwtM5K9MQVf3HNmwOAsTdSwgsv+Fogux4pSn+LVKTbOFVoLgv/yr5KCBUGt0vEl74xrqdKsvoBVwoNYOVCdP27Ef1vFIOyHB9UcDA87OK8XRG1pOqO1UumoFQNBqUtEskPOWU39XTQxSG9qddQcJYdeKX99sUgcrSffNSZOeN8+TIcISKhMfYQE8C8drPmkTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15xagGFsClb1JpWH3ksSyXQus3/deBKjt6Nms7URPVA=;
 b=Sack7/r2GYliWwgrHWLonGTMbiWPZdhPsjjXeO8E5YGBEyiGNDE352LjlMasuSMrEoFfYTJ5pHdq+pcTV8fLrbnx+PHNJwXDDR6i+/FyT4dt0iJzFP+qbdemmgKrX8cd0zfr3ITHaqTjg2P+UQFP+sbdQ0VKww9IBSoqH7xLOGZBBug5Trf1mrEqTEodlpYC3sTgrA7qTQ02fYuCbwnIaS/CrF7L43LjsEWpN27JXyreTI7LNCJB3RNGBNnF0WlIGxUZ8uC5KCLDCPZvfmAJ5DZQSkiIpwBwPO+WKwf5b2333jYTB4vjwwrt4Iqu5Is5ObFJCvJgtiosUritQIAdKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8675.eurprd04.prod.outlook.com (2603:10a6:20b:42a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 19:29:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 19:29:42 +0000
Date: Thu, 22 May 2025 15:29:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: s-vadapalli@ti.com
Cc: bhelgaas@google.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, kw@linux.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
	robh@kernel.org, tony@atomide.com, vigneshr@ti.com
Subject: Re: [PATCH v2 1/1] Revert "ARM: dts: Update pcie ranges for dra7"
Message-ID: <aC97HguxSt56BkHa@lizhi-Precision-Tower-5810>
References: <20250411153454.3258098-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411153454.3258098-1-Frank.Li@nxp.com>
X-ClientProxiedBy: PH7P221CA0069.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8675:EE_
X-MS-Office365-Filtering-Correlation-Id: 163ed006-4b17-40e6-63f1-08dd99670068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P5s1FurvnWCWydECSt9sXaHNZFQ3SWoqiHccFVWo9LKZ0QZK90vieC1/57Og?=
 =?us-ascii?Q?TnzybrP3Do9yOSpRrYqR2UJBbaFsXol0l1CCwMjYCv7RBxBd7q9znvV6Ri81?=
 =?us-ascii?Q?vkxPs3U3YbQpYspS/MPOAQ7zuA6det1od/cBiZ2B7XteZyGk4+L9u9LgzD/g?=
 =?us-ascii?Q?Kb62iyXGi+vjsz3bUVF64Jkpgctz9WezIpm0sz8N+MaipxFIzpXJngp9xE7E?=
 =?us-ascii?Q?fEkMDKA+iSMY6/tZBdtv8Ai6HQBIBAU+0JXUjIMG0TsrqQpSQLOheNuG1F4b?=
 =?us-ascii?Q?NqSaBnt1Y3ncGRVzXU+Erp7ljhlAiaohnUBeeg/Ttowh82fWScOp82gqGQeM?=
 =?us-ascii?Q?00Upk1Vo3F2iVGuNjR4NMxmm6Mjp5ffH1zdzGlI+N3JKR+8znGceiWj9jbzJ?=
 =?us-ascii?Q?l6OajHbd+RdQDCfaCikU5lwwb+dnX6z5Did6pz5DnIOb30hW2lVaJBFqD3DE?=
 =?us-ascii?Q?JyCSlWzU+Efz4Gwo7xdoyrTBoaRF/+LUcTK6/7dM2RoumN4KXCslo09OY9iF?=
 =?us-ascii?Q?Vg/G6OYvcSUDC28/UYyy1H1oenC7QRQag12IFqLGCKjUDWTz6tqtLHvNs4US?=
 =?us-ascii?Q?DypTbkMYzsKlCN/tZxCSTauhldsN3t5wJRafhl7BiTGbfobznBqymA4HvhUs?=
 =?us-ascii?Q?qnyyaFhIgy2H1vpYs5FMeA/E2L95LZoq65xt4vQ0uLXq0QlGgk0wGo/pI2Xb?=
 =?us-ascii?Q?pRHpyR7Wo+3mWecn94dBYZohTNx6gXR3wx0pirYj4OmvRjQrtvOOXlZQKDvO?=
 =?us-ascii?Q?gv6JOgi9sdYFVvzWtrbHbYS7TII5FasNXO1Fm8/PZwQ3UsZe1hH/RR6Kf+1v?=
 =?us-ascii?Q?pSYwRNGDPfiuRTg12nnk3K70p4Oo4r1p0mD4PjV8gqtOdunQfRTGmxQQfjIc?=
 =?us-ascii?Q?riiMTLyXGSKCcE83UK4JF01+6CQHMvX/LwuV484knQmhtzo32xy2QhKw2gjm?=
 =?us-ascii?Q?uBm3PWb6M9MEgPTkMyk/X0jPLw8Tdw57xkaTz9PUxMpm5iB4HzBeucS5/clw?=
 =?us-ascii?Q?a7/0bY0d41BU/QObXNFsmIkztdt/wmx92bc3wMc1pbY2IZQ3QCb01yBWScLo?=
 =?us-ascii?Q?w6lrKGHQ0b2v7dpYwV2+EZMFsDUu4Uq3rrXAf2xeRXGCItsKjS7Groupy19w?=
 =?us-ascii?Q?pbm2aygd1ju/zZyooYgq4Yq44ItlU6Lv9wlxsex25fXzRSmTay9LphNei4G9?=
 =?us-ascii?Q?gW2hr56zjvDrNGeRB4vD88G16c4DdyuIjlm4Lf5yDH5zKmxcp07FtaRmgtqr?=
 =?us-ascii?Q?jyHVmoGb4Uv1w5nJIJMHmqYEKeVN3/YM7WMfIs6tc7ycwlQKdJZQoV7xEm94?=
 =?us-ascii?Q?2vdjWPLMDCQVyNh9jGOIA3dGa+a69BfJ9cmSI5+Rr8h7nqsW3tAlM6ZgwAFi?=
 =?us-ascii?Q?QBqCVqNy3h1nc6FXL8usYsi4vyGkGOzo8envvHHqCn7igU1Mk8ri5+b41PQB?=
 =?us-ascii?Q?S3U5JotI1mU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ggH0g/goxN0cou6xvUZkShzmVWzB4bM0hMWFUFFzp3ZMaKSNrEl4Hxgi8x5a?=
 =?us-ascii?Q?lJ9OIk7MHobsvSuNGP4joQ0+n97jKSmZ68c3EcpLGJENJvfAyiQpiUeETJAQ?=
 =?us-ascii?Q?YIuRb0QX8Llx4XlH1kC/Gbk7ZutFF6PjE4qPO45DAxk6XctbWPbA2O4n9rv3?=
 =?us-ascii?Q?RcsLIXDNxNBiE3iYu9jblE6BNwYZJtbkHF7X7Hv721NRFsdCiFW1qcczv5vY?=
 =?us-ascii?Q?RcEp8zt0r6b6VSFImCL7vUH5IJmUNA1p6ab4krjtUtyPreFL/LdkYHpR1xsN?=
 =?us-ascii?Q?NPKKiqKUzRQ5I6gmWOhJUHV808IRfVvKMxo9sbaMLjVTQ8CCddR+RxtHNtAp?=
 =?us-ascii?Q?sgxKzO3egn4lsMgCYVzZcljuaKT96NTzNz0RU3aIKzVKAANKRADvRM+p69YK?=
 =?us-ascii?Q?fkjZNgH3IEPVS7G940b0gDBidPlGKkasKSXv1lAdGmD8QP9RcghokUA2k4CV?=
 =?us-ascii?Q?3vmL3aO3U55jzp3Bnmtjl87xPLFLxsr+ZP0Xr/93Lvv0YtomrdNEf1PlrLNV?=
 =?us-ascii?Q?Z1s3VERlqo6jxTLaLCnaLISb00W6FoMCIhmgn+blKpx8aAP3jGqy/MBBNRKm?=
 =?us-ascii?Q?MMabuv44M0IDN55DqQn38i2pIo/258eMAsTHFBLsyZXf9bED16lEdr62E5U0?=
 =?us-ascii?Q?hzdcjIi/LIGhmkvRLzMJ6jok3YUt+7x024EBggFtE1O+wAoUdE6YDt0P3C3v?=
 =?us-ascii?Q?7kkkwG1fCS47VZJOwFN3XZF8FxxsgSd1XCoHnRRSncY4uTpYoEKzzrLGgqn1?=
 =?us-ascii?Q?+CFpI/d4zpc6GOBxqpvKy1fT5uhyznqTIKVsYGjLiwxGSp1H7a6Q/LhHMJLr?=
 =?us-ascii?Q?qWagi3i7kUJr8J7zp1IR7x7Gr3GRtXZ3ogqKFODlb2C/Ca/MSHVS/uFJ/cRl?=
 =?us-ascii?Q?Knc7K+rTalQQh/pkOSHKTGKw11g6cCqj3TxbA6J2YBOx65ws6dpZYQklfSL+?=
 =?us-ascii?Q?M+DWMsWsb/1GcdLe2UEzTGa7eEMw7rqmu56vR/R0AsCyKLDSGPxC+Fw9SvoR?=
 =?us-ascii?Q?/CjiPSWTUu97y/g1qJbTZpvmceC3MqVDXkUGP8LPnGdU9OSrn5jVY59n0YgH?=
 =?us-ascii?Q?mm1IRy5WU4zGTBCQNUYaJq19QQLxmzQ6/Kb9No5hh7s9cHWw+CNUa8tnt6Gv?=
 =?us-ascii?Q?UWBGmWL8nLWS9oGCzfENahoXY6htvx0A3Aa4TxPQp/nAorlY/iv7jPK/GZmN?=
 =?us-ascii?Q?v0awxQxtNXaXnsE8ixlls68KWwS6OpKPEnIWwO94MS8bl6jOkaGpqRQWTVQW?=
 =?us-ascii?Q?4rw+5GsGiCNWsW87tekzg3FNipUTtS03xGVWC9AmApjmn+b7NThDu9hgIbFw?=
 =?us-ascii?Q?7d0S2nTAof8o+WsmL4vsGknLInTfGTj828A08z69HmbG7cR3ZgXjZyC5OoZW?=
 =?us-ascii?Q?jGXfngRZ9olIabknupRGjCa+6g1fKVyBPHdXA5+umRo8NH8v4by+xmMBD/ie?=
 =?us-ascii?Q?THlcOLxvAj4qBoLITPbIbaxTFG46by9fTAnWt2WHsJRTY1eVHPWsLDGlybxe?=
 =?us-ascii?Q?nJXQ+kIICVCmYzQuetIJqRwunRBeHIvAshlLXMbUthiO5hudT6QCADMltCch?=
 =?us-ascii?Q?oissLwv+y/RCH41LnSA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 163ed006-4b17-40e6-63f1-08dd99670068
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:29:42.6589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjkHlO/VZ55Jhl99Mb+7anG6M1homjyrARDzyTtiqY8G+UBqNDh2DhsuISHOKEVd0J1F0/wMwJIUmsYU4CGYeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_124408_694062_6A4BF7F7 
X-CRM114-Status: GOOD (  20.71  )
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

On Fri, Apr 11, 2025 at 11:34:54AM -0400, Frank Li wrote:
> This reverts commit c761028ef5e27f477fe14d2b134164c584fc21ee.
>
> The commit being reverted updated the "ranges" property for the sake of
> readability. However, this change is no longer appropriate due to the
> following reasons:
>
> - On many SoCs, the PCIe parent bus translates CPU addresses to different
> values before passing them to the PCIe controller.
> - The reverted commit introduced a fake address translation, which violates
> the fundamental DTS principle: the device tree should reflect actual
> hardware behavior.
>
> Reverting this change prepares for the cleanup of the driver's
> cpu_addr_fixup() hook.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

s-vadapalli:

	Any update about this patch? it prepare to remove cpu_addr_fixes()!

Frank


> Change from v1 to v2:
> - update commit message to add more detail.
>
> Previous disscusion at
> https://lore.kernel.org/linux-pci/20250314064642.fyf3jqylmc6meft7@uda0492258/
> ---
>  arch/arm/boot/dts/ti/omap/dra7.dtsi | 29 +++++++++++------------------
>  1 file changed, 11 insertions(+), 18 deletions(-)
>
> diff --git a/arch/arm/boot/dts/ti/omap/dra7.dtsi b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> index b709703f6c0d4..711ce4c31bb1f 100644
> --- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> @@ -195,24 +195,22 @@ axi0: target-module@51000000 {
>  			clock-names = "fck", "phy-clk", "phy-clk-div";
>  			#size-cells = <1>;
>  			#address-cells = <1>;
> -			ranges = <0x51000000 0x51000000 0x3000>,
> -				 <0x20000000 0x20000000 0x10000000>;
> +			ranges = <0x51000000 0x51000000 0x3000
> +				  0x0	     0x20000000 0x10000000>;
>  			dma-ranges;
>  			/**
>  			 * To enable PCI endpoint mode, disable the pcie1_rc
>  			 * node and enable pcie1_ep mode.
>  			 */
>  			pcie1_rc: pcie@51000000 {
> -				reg = <0x51000000 0x2000>,
> -				      <0x51002000 0x14c>,
> -				      <0x20001000 0x2000>;
> +				reg = <0x51000000 0x2000>, <0x51002000 0x14c>, <0x1000 0x2000>;
>  				reg-names = "rc_dbics", "ti_conf", "config";
>  				interrupts = <0 232 0x4>, <0 233 0x4>;
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				device_type = "pci";
> -				ranges = <0x81000000 0 0x00000000 0x20003000 0 0x00010000>,
> -					 <0x82000000 0 0x20013000 0x20013000 0 0x0ffed000>;
> +				ranges = <0x81000000 0 0          0x03000 0 0x00010000
> +					  0x82000000 0 0x20013000 0x13000 0 0xffed000>;
>  				bus-range = <0x00 0xff>;
>  				#interrupt-cells = <1>;
>  				num-lanes = <1>;
> @@ -235,10 +233,7 @@ pcie1_intc: interrupt-controller {
>  			};
>
>  			pcie1_ep: pcie_ep@51000000 {
> -				reg = <0x51000000 0x28>,
> -				      <0x51002000 0x14c>,
> -				      <0x51001000 0x28>,
> -				      <0x20001000 0x10000000>;
> +				reg = <0x51000000 0x28>, <0x51002000 0x14c>, <0x51001000 0x28>, <0x1000 0x10000000>;
>  				reg-names = "ep_dbics", "ti_conf", "ep_dbics2", "addr_space";
>  				interrupts = <0 232 0x4>;
>  				num-lanes = <1>;
> @@ -269,21 +264,19 @@ axi1: target-module@51800000 {
>  			reset-names = "rstctrl";
>  			#size-cells = <1>;
>  			#address-cells = <1>;
> -			ranges = <0x51800000 0x51800000 0x3000>,
> -				 <0x30000000 0x30000000 0x10000000>;
> +			ranges = <0x51800000 0x51800000 0x3000
> +				  0x0	     0x30000000 0x10000000>;
>  			dma-ranges;
>  			status = "disabled";
>  			pcie2_rc: pcie@51800000 {
> -				reg = <0x51800000 0x2000>,
> -				      <0x51802000 0x14c>,
> -				      <0x30001000 0x2000>;
> +				reg = <0x51800000 0x2000>, <0x51802000 0x14c>, <0x1000 0x2000>;
>  				reg-names = "rc_dbics", "ti_conf", "config";
>  				interrupts = <0 355 0x4>, <0 356 0x4>;
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				device_type = "pci";
> -				ranges = <0x81000000 0 0x00000000 0x30003000 0 0x00010000>,
> -					 <0x82000000 0 0x30013000 0x30013000 0 0x0ffed000>;
> +				ranges = <0x81000000 0 0          0x03000 0 0x00010000
> +					  0x82000000 0 0x30013000 0x13000 0 0xffed000>;
>  				bus-range = <0x00 0xff>;
>  				#interrupt-cells = <1>;
>  				num-lanes = <1>;
> --
> 2.34.1
>

