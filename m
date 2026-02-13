Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE20EF48CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 06:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3BXHg6m5DZaC+w1rVHc658atnm9fwSm8DgRSQtpDnQ=; b=RX103HQdIkv7q2luzdZFE4V3MU
	7hn0teGJB6KCPPVnYBGRfwmJOvBr6/ltwbpAdk/g/fzcX4/rbzdC4UYXnizoPi82HNjQGtrud8mh9
	WwhpV8ZoZ67ncMsprLKwDcZtL1I27rltNAgKQpt1Kjg8TaUSnZt/zUb8G/r5aOxhTX+UiQeFnQhzL
	12Mm+WMDqRgg0S012htl5csDhdVq0mJ7exaS6biVrnCI4wZvQlAkmTmcjlJ4SXIYuTkmBfdJRAZ3F
	NX8i3zmunK/DhY4C4EWSE/9P18aQFnesRdpPbcBAxgi5vt6Fa4WNnvmszelGnP035VU5MjExmrRFB
	TAsgBK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqmIT-000000033AT-0fse;
	Fri, 13 Feb 2026 06:04:57 +0000
Received: from mail-northcentralusazon11010041.outbound.protection.outlook.com ([52.101.193.41] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqmIP-0000000339O-4588
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 06:04:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhtPOXPTUDFmlXEskPdu5r/Gmr/vjGM+kHaq5/M8v6gTR5onWyD1Q6yEjvgo9bjwU+fn+f+mGCsDaqnNFwM1Vp9I3OBos2baD2CjXpMC1omUtMDaaNgkhmA5rXniokZ6oMr639EhbI8uXT0OpTP/cEM+va2ABWhajekPMEedChsggFuctSMRl1dTCvxXmIFGJtcYkrRv64r5Ck4UFcxwNYftG8y7dbTqW2yPI4wgD6qslnBMz8uLT+M06F0xs90Qt0fMoCvRmrhQOBnMlqsQF4YjNVu3i0Av7atyifMhWEqpC+z3ihiQm0Mrmg1n0VtD04kMs7MggLaMlHiTm+nneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3BXHg6m5DZaC+w1rVHc658atnm9fwSm8DgRSQtpDnQ=;
 b=uPp9NnJFmjM2uGZRFBnnbvJaxgbiH1zhn4R5f4Ihrw4yOeEh6Bpi6Q4ON8/OZNvQbdXsvP7ZLsHJrkK+bwLofFwRPdhL+ZOUUFOV6363n+l51UotU1d7B4gpdfONq9cr2lWEyBfMfrmsOPSZ+ZZlHm943e8Od6cReLL1vLdlxjhxmBvqn2GnyltlHiIqvKz3I2zva96uBaveT5+ctBoteryfljRTHhHubDO2Md90PzLrjcJ5HXCA9eybkqTapkkUQ8t9Cg+yVMmcftKimUechsYA1nz75tKu4i7WsTeIdJsMgz82qy1AEgjWvl3GAfGncR4yGqc0qXFEQlOw7d3H8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3BXHg6m5DZaC+w1rVHc658atnm9fwSm8DgRSQtpDnQ=;
 b=qBaxm58+Zx2cF2DHdQVWIKEODA87cntx3HXWZdsp6cSGn0mkHN53+Ib0N6c4Vt9dOrLCbftrjpvPw2kmxIKqJWGt3+YbOQw4ducA4cI6VdSDqJrhY2ENZRpOR0+2vhEuyiM/wyWVUBsdGXjL6GrknbKXizKQUeHnvCp5OiUrMmE=
Received: from PH7P221CA0074.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::16)
 by SJ0PR10MB5833.namprd10.prod.outlook.com (2603:10b6:a03:3ed::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 06:04:48 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:328:cafe::bf) by PH7P221CA0074.outlook.office365.com
 (2603:10b6:510:328::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Fri,
 13 Feb 2026 06:04:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Fri, 13 Feb 2026 06:04:47 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 00:04:31 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 00:04:31 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Feb 2026 00:04:31 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61D64TGF655599;
	Fri, 13 Feb 2026 00:04:30 -0600
Date: Fri, 13 Feb 2026 11:34:29 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>, <bb@ti.com>,
	<vishalm@ti.com>, <vigneshr@ti.com>, <sebin.francis@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: pinctrl-single: add ti,am62l-padconf compatible
 string
Message-ID: <20260213060429.upnlpbz4q5pvwp3e@lcpd911>
References: <20260212-am62l-padconf-v1-1-0bb6f066fabd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260212-am62l-padconf-v1-1-0bb6f066fabd@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|SJ0PR10MB5833:EE_
X-MS-Office365-Filtering-Correlation-Id: 08159a5d-eb5d-48a8-9953-08de6ac5ca88
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+uK6VJj3kLNFCbaHMJER1zuoogSXLWVN9udbdSYUf+Mo+/rjX1FRR8SrAwcI?=
 =?us-ascii?Q?XRwtlsX7yUAti/Zl0+q2/sYAUtyPhM0fEi3921bqZf7fmoSQp6rj/H9cR8ft?=
 =?us-ascii?Q?6+sbpAVte63fCefNsCT3geq+BJKkvPQ2itrcn735cS8ALF8Tc9RFJvo1r/Ak?=
 =?us-ascii?Q?n1aujry+H4Hn5TcLWBsQSQPn3gZui+Om/p1lC3Nwe8w2rJXvxQMQ3Sr7dcsE?=
 =?us-ascii?Q?dpBLFITqYMtwBTw72UjDe2WvAMziUcSbNHDaWWPnwFGasEhjqWtrYKbQhFMQ?=
 =?us-ascii?Q?hk23KbDnmiN9OkWSunoHQEqDwaeFQmARPa3PSfFfUa1QGuNJmVGr+kzQhTCO?=
 =?us-ascii?Q?rv5XHA8e+Gt8nTylYcVVdvmoBiPONV32mC9w7WKj0zQQLvsH9SNwsq20IckD?=
 =?us-ascii?Q?eajml2Wp6CmtOL/HIOPA4fG3Htu3kKnRDcVzMwTFJcVKVJA9Zdp5J1gpZDDm?=
 =?us-ascii?Q?W6XpvYGr3cweKegBMahWOyS7ai7ysT1+AngZuNEqqQ/j2B3yPR+lLAff7QVt?=
 =?us-ascii?Q?nc2/WYzgh+8aYJIHjt3QHw5rNghMMCcf21ieG3Y9FOiglFgOUofvxqeNoYNY?=
 =?us-ascii?Q?z/CyHbVN18dBOLjpq+GPDVH7HJzpz+FDZs9rQwS1H8oMLsiqsQ1VUTndWzy1?=
 =?us-ascii?Q?87QkHA6/J6coS1a8vV9Houz+JfY9qH7xcMk8NqbJHPpXTaxF9IzibW8iwV0W?=
 =?us-ascii?Q?IS/jrUSpcWsO6OldGUe6wWZsoyS35EmqWVwxAg8dYIC3rliCETPpVJ7L73uV?=
 =?us-ascii?Q?lqk8/s8Ev9p7FX83duDP/XX6FUtWkAK4GdOWe5jECg1VR89ZqLUANvMMHwbQ?=
 =?us-ascii?Q?VV4/YEsPuV7ZGxayCY6wtyqx8OMgfYgvxIRyIcTxUkM1xDmllfLsXYykIZdc?=
 =?us-ascii?Q?kO/Uo8kPvJxhby83dqppp8j1DOI1kPmL8xwlo7/2j+UNMBUYFgc598Iwuj7a?=
 =?us-ascii?Q?9oPotZUJB1A7ds3vTlCZ9DTQJCFH3F/paAmpCLXV7PhWoGy3MnehTLI5BzeJ?=
 =?us-ascii?Q?UzOzl2wrUhoGMXi/XH38jPepnH4iGTueuAWPGOacb5Ya585EW7eUIe26y+Ky?=
 =?us-ascii?Q?fC9aWuIQHTEpCu1/KlcUd+owXEl1/2KAOVefqSJChZi+5k4bUiMn4dPkgOX6?=
 =?us-ascii?Q?ntfojP3ggRZSVkc+ywUR0vszPYnWvhugn2Jr9CmfaP34f60IZiv5AxXegYFl?=
 =?us-ascii?Q?yrFQVxGndVtV5boftKWFaw3LHE132lInjrXByMmv1s+Uwl+SiVg+oJgJnp7Y?=
 =?us-ascii?Q?xf9AggthMd02wZfw725L5yUR+nKR1eYfyo3mvjkv2XTHx2UWDZW3Du2Naqw8?=
 =?us-ascii?Q?++YTyI9grwOrW8xFpvfAU7ltq0MjscoK5oHwnCpFCu9ET11vUujxRiBHUJxo?=
 =?us-ascii?Q?3B+3q9uFKNVXPlXuYn8IGY6/8ohMSYloeISpBHxQZSy/nwsXMYO5J3PQmPRp?=
 =?us-ascii?Q?vONrsJAMUlYMtEW9Zz/OdoYeEVe4UNO1JZ3bzaEivLo3lqBKzTadTxVFsDVc?=
 =?us-ascii?Q?9GjdSfD9bCez0pBMRJ5qeZXcN5iAwK25gYGmywEklHbUnp+gRsXiTLBLDbrL?=
 =?us-ascii?Q?45NjxU3NwGtmbAcNEL/ScZPsmOjGMDgJN5Oh1ePM02Yrd4sp0e4XeDt2fNpn?=
 =?us-ascii?Q?KuAypuchFUyRcaRS2jWYap4Vp4O7DGm4OnwxbxYU0+F9mDsPPGIKwAYgpCU7?=
 =?us-ascii?Q?ZZsBYw=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hdNVSeuo8VowyP3HCmr73uJ+thEC0yPswinYwwv2TJarMaxLjCep7Yf7Z9i+N1COk3f8yEGo7+2+BnVz6mdqrtJGZpR0R+h4BR7kTynixm3vj5iT489iK002yQIuyl0Uy7KdA66DCU+pxK9trWgGmCfyBBUxoqpaD00hEcw1zyOAjSlVpwHKPRnosTQcNhL/XeNGsFeN5MRq2tWnTkJbIoODzVFbjY1Lo9zpHQY7e/O1R27g+FAPm7Joc4+CeiGZcuX0T1WFmizWmRq3xY0XbirB5m9s5OwIlHiq8cFGPrnhuYBnBQUBWTc+HJvb86r++NiwqhhG6YwfgVFRx4q9y2hURXir5MWiqt+wh9ECGuPcyx/PuO2Xv58KC8cLowG3WRjcLX7DnOnWpkvcWNnNkyarUPIdRuVoEfj0XoMjNfCxDzUUKkLlTXveynv4cqVQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 06:04:47.0915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08159a5d-eb5d-48a8-9953-08de6ac5ca88
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5833
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_220454_086620_BFFC7AB1 
X-CRM114-Status: GOOD (  18.13  )
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

On Feb 12, 2026 at 15:38:09 -0600, Kendall Willis wrote:
> From: Vignesh Raghavendra <vigneshr@ti.com>
> 
> Add "ti,am62l-padconf" compatible string for the AM62L SoC, which
> requires register configurations to be restored during system resume
> after suspend to RAM (RTC only + DDR mode). This reuses the j7200
> configuration which includes the PCS_CONTEXT_LOSS_OFF flag needed for
> proper restoration.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
> RTC Only + DDR is a low power mode on the AM62L SoC where most of the
> SoC is off except for RTC, which is used as a wakeup source, and DDR
> which is in self-refresh.
> ---
>  drivers/pinctrl/pinctrl-single.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index d85e6c1f632186b36e95b0b1338a7644ae751f99..288c9c9bce9a5b1cdfa96f69e6a104152439789f 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -1980,6 +1980,7 @@ static const struct of_device_id pcs_of_match[] = {
>  	{ .compatible = "ti,omap4-padconf", .data = &pinctrl_single_omap_wkup },
>  	{ .compatible = "ti,omap5-padconf", .data = &pinctrl_single_omap_wkup },
>  	{ .compatible = "ti,j7200-padconf", .data = &pinctrl_single_j7200 },
> +	{ .compatible = "ti,am62l-padconf", .data = &pinctrl_single_j7200 },

Reviewed-by: Dhruva Gole <d-gole@ti.com>

>  	{ .compatible = "pinctrl-single", .data = &pinctrl_single },
>  	{ .compatible = "pinconf-single", .data = &pinconf_single },
>  	{ },
> 
> ---
> base-commit: af98e93c5c39e6d0b87b42f0a32dd3066f795718
> change-id: 20260212-am62l-padconf-ff5f6050107a
> 
> Best regards,
> -- 
> Kendall Willis <k-willis@ti.com>
> 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

