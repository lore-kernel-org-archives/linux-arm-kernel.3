Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619BAE7718E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7rn19r4HgbPbGx9r0DQ1iakhx3qC0hkuGhdxpRpgMI=; b=y/ST81EAqObRtcEjNZXYzoH2gk
	bSiR171gsef141Op6EsRlBt1DiJ54uiXt5VpGJdqDLyUqt4nsdiVIMeBbtxF2j5mLvdOguBNlkGcs
	nYcB2Da+P1tSrGvK1rt2GLmBZjKrh0ikut5q2hwUjjU1H2RZMrVjDVxobsVXf8l4j3bxGjCE9RrHJ
	Wh1XatYLaHPCUFv72U87alAAf53QPX1jpaHwnIOkD1Edvk/Blk+4fiIGcm5fHnC5rjOFuSk9a/qwA
	GMTCQ0HAlnHsYmOOCJ2yiV3Swb7xEomLiSb+Asxor+CWWY+0Bu9T1ernk6+Uja1ewAEUgAMq8Dcs6
	DxDiSUbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQp7T-0000000Fvt5-04bv;
	Thu, 26 Dec 2024 14:45:47 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQp6G-0000000Fvmj-3G1k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 14:44:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43634b570c1so47110305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 06:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735224271; x=1735829071; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A7rn19r4HgbPbGx9r0DQ1iakhx3qC0hkuGhdxpRpgMI=;
        b=PH8AqvFSMiWIQXkPwJ1ULrED3YgEL7Z/bgsTHJCdMwdRje2j9cMIquCZUJZLnlcWXL
         73Yzc0qEpe64sMMoF/mwQXMSFX+WjjzVtdnrNXq0QjMaAqjnyugYPK/MZGZRHaTgdr9J
         fI9R2bFmHP2rVsq3bELCntzLlkX35DnAqHFLmFuzjef095xBE2ZdCQlN5yPWUmwSkEsT
         P41mE3TKFGNz8kyG0jEetLll6aaZYlNiiwN0R9CcxJSwNesY64LA2+u13JKkCrJVPsqY
         hc1lP71QP76bqNUX72tdTZptnGOfd8J/PU4Iu41qlTOwfUhUcWsIr+C3/0MiLu0UPZPt
         8Q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735224271; x=1735829071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7rn19r4HgbPbGx9r0DQ1iakhx3qC0hkuGhdxpRpgMI=;
        b=v9s8DdCpDpmsoMkxMjDu22+9BH5ToDGEJ34D70pHulfsbPYtemmR+M74wy8i6twjBZ
         46V7teORhqdQ5tYEo0Z3wnLJY5m1BJBwUyzqkDOaTOVHCnIdeqsbSdQ6a+m380wnbVhV
         6zLEVmNDEAVtDha1ZLbYlEDReFIq+wOelMqS5WySCgNQXkGUEQ8ONK2seXnptxGPwgXr
         szAUGig0rwUVDR/P0+RXje3ecsesSDPVCTCtvrIoQa4FunFj+z4eTu/MbEsPxIFP56wh
         Izj106WEsl7PRRE9dh/vwueBqds1cTN+cdY5WFy0XXwCGZSlEmBno0hrDbjOppCAK3Kd
         aLcw==
X-Forwarded-Encrypted: i=1; AJvYcCVo0dNH/qC3rlyNXK/UXpMRYMBVX6PRY0OKE0Zau5IUfgAv6gDle7P//mQvz6zqKkPYprNOPtRaGL/kIirAUyHu@lists.infradead.org
X-Gm-Message-State: AOJu0YzNh2DYmjOPifTdudROpGDfAPuTYJyIGHaZ1aKInjLdQ71N9qB9
	cq8f3OcxYeUpZ01iPIgnKzpXw/KsIRCbxGVewCRTc6/Rb4wLGXkMydo3pkWSiu8=
X-Gm-Gg: ASbGncsHOdpFzT/5/ODnlHe3l+uqnL3Rnp0VegYxZaVuYR9kysCEqYrjgZNXlcpSCXa
	iTkZQn1W90RFpeI5E/Fq1Yg7aphyCPyE6CNAHx21DwSxJWQijG8qv8NOgqpNarVdYa2e4+orQKt
	IuewMrPIKTIzrAMTFmQ1fZvEP6VNtC48CDWDmbkqtT4EsDrXAPODC+M3Q6gdqg31cbR0tngsyYo
	Nn6VtnZkFU8azSDszPMiy2p9W3JlP5GSmQTdwLArNaqXYSR/iqIuCI=
X-Google-Smtp-Source: AGHT+IEs46r2QTrphoxhnYAjoEZ26B+gzvCJ6J2PHOuEvEPqcIAkbr1HCYher+BV97nl0i4rzQRD/A==
X-Received: by 2002:a05:600c:350c:b0:434:a91e:c709 with SMTP id 5b1f17b1804b1-43668b78c11mr157293045e9.28.1735224271050;
        Thu, 26 Dec 2024 06:44:31 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea47asm234453595e9.4.2024.12.26.06.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 06:44:30 -0800 (PST)
Date: Thu, 26 Dec 2024 16:44:28 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	"open list:NXP i.MX CLOCK DRIVERS" <linux-clk@vger.kernel.org>,
	"open list:NXP i.MX CLOCK DRIVERS" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] clk: imx: Apply some clks only for i.MX93
Message-ID: <Z21rzK6Nejti6lsA@linaro.org>
References: <20241225001443.883131-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225001443.883131-1-peng.fan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_064432_869907_8168FA91 
X-CRM114-Status: GOOD (  15.44  )
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

On 24-12-25 08:14:43, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Enable the LVDS gate, MIPI DSI, PXP, FLEXIO and MU only for i.MX93,
> because i.MX91 does not support them.
> 
> Update enet clk entry format to align with others.
> 
> Fixes: a27bfff88dd2 ("clk: imx: add i.MX91 clk")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> 
> V2:
>  Update subject and commit log after phasing out more clks
>  https://lore.kernel.org/lkml/20241203130530.1206526-1-peng.fan@oss.nxp.com/
> 
>  drivers/clk/imx/clk-imx93.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 58a516dd385b..5bdd2bdce46e 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -70,8 +70,8 @@ static const struct imx93_clk_root {
>  	{ IMX93_CLK_WAKEUP_AXI,		"wakeup_axi_root",	0x0380,	FAST_SEL, CLK_IS_CRITICAL },
>  	{ IMX93_CLK_SWO_TRACE,		"swo_trace_root",	0x0400,	LOW_SPEED_IO_SEL, },
>  	{ IMX93_CLK_M33_SYSTICK,	"m33_systick_root",	0x0480,	LOW_SPEED_IO_SEL, 0, PLAT_IMX93, },
> -	{ IMX93_CLK_FLEXIO1,		"flexio1_root",		0x0500,	LOW_SPEED_IO_SEL, },
> -	{ IMX93_CLK_FLEXIO2,		"flexio2_root",		0x0580,	LOW_SPEED_IO_SEL, },
> +	{ IMX93_CLK_FLEXIO1,		"flexio1_root",		0x0500,	LOW_SPEED_IO_SEL, 0, PLAT_IMX93, },
> +	{ IMX93_CLK_FLEXIO2,		"flexio2_root",		0x0580,	LOW_SPEED_IO_SEL, 0, PLAT_IMX93, },
>  	{ IMX93_CLK_LPTMR1,		"lptmr1_root",		0x0700,	LOW_SPEED_IO_SEL, },
>  	{ IMX93_CLK_LPTMR2,		"lptmr2_root",		0x0780,	LOW_SPEED_IO_SEL, },
>  	{ IMX93_CLK_TPM2,		"tpm2_root",		0x0880,	TPM_SEL, },
> @@ -177,10 +177,10 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_WDOG5_GATE,		"wdog5",	"osc_24m",		0x8400, },
>  	{ IMX93_CLK_SEMA1_GATE,		"sema1",	"bus_aon_root",		0x8440, },
>  	{ IMX93_CLK_SEMA2_GATE,		"sema2",	"bus_wakeup_root",	0x8480, },
> -	{ IMX93_CLK_MU1_A_GATE,		"mu1_a",	"bus_aon_root",		0x84c0, CLK_IGNORE_UNUSED },
> -	{ IMX93_CLK_MU2_A_GATE,		"mu2_a",	"bus_wakeup_root",	0x84c0, CLK_IGNORE_UNUSED },
> -	{ IMX93_CLK_MU1_B_GATE,		"mu1_b",	"bus_aon_root",		0x8500, 0, &share_count_mub },
> -	{ IMX93_CLK_MU2_B_GATE,		"mu2_b",	"bus_wakeup_root",	0x8500, 0, &share_count_mub },
> +	{ IMX93_CLK_MU1_A_GATE,		"mu1_a",	"bus_aon_root",		0x84c0, CLK_IGNORE_UNUSED, NULL, PLAT_IMX93 },
> +	{ IMX93_CLK_MU2_A_GATE,		"mu2_a",	"bus_wakeup_root",	0x84c0, CLK_IGNORE_UNUSED, NULL, PLAT_IMX93 },
> +	{ IMX93_CLK_MU1_B_GATE,		"mu1_b",	"bus_aon_root",		0x8500, 0, &share_count_mub, PLAT_IMX93 },
> +	{ IMX93_CLK_MU2_B_GATE,		"mu2_b",	"bus_wakeup_root",	0x8500, 0, &share_count_mub, PLAT_IMX93 },
>  	{ IMX93_CLK_EDMA1_GATE,		"edma1",	"m33_root",		0x8540, },
>  	{ IMX93_CLK_EDMA2_GATE,		"edma2",	"wakeup_axi_root",	0x8580, },
>  	{ IMX93_CLK_FLEXSPI1_GATE,	"flexspi1",	"flexspi1_root",	0x8640, },
> @@ -188,8 +188,8 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_GPIO2_GATE,		"gpio2",	"bus_wakeup_root",	0x88c0, },
>  	{ IMX93_CLK_GPIO3_GATE,		"gpio3",	"bus_wakeup_root",	0x8900, },
>  	{ IMX93_CLK_GPIO4_GATE,		"gpio4",	"bus_wakeup_root",	0x8940, },
> -	{ IMX93_CLK_FLEXIO1_GATE,	"flexio1",	"flexio1_root",		0x8980, },
> -	{ IMX93_CLK_FLEXIO2_GATE,	"flexio2",	"flexio2_root",		0x89c0, },
> +	{ IMX93_CLK_FLEXIO1_GATE,	"flexio1",	"flexio1_root",		0x8980, 0, NULL, PLAT_IMX93},
> +	{ IMX93_CLK_FLEXIO2_GATE,	"flexio2",	"flexio2_root",		0x89c0, 0, NULL, PLAT_IMX93},
>  	{ IMX93_CLK_LPIT1_GATE,		"lpit1",	"bus_aon_root",		0x8a00, },
>  	{ IMX93_CLK_LPIT2_GATE,		"lpit2",	"bus_wakeup_root",	0x8a40, },
>  	{ IMX93_CLK_LPTMR1_GATE,	"lptmr1",	"lptmr1_root",		0x8a80, },
> @@ -238,10 +238,10 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_SAI3_GATE,          "sai3",         "sai3_root",            0x94c0, 0, &share_count_sai3},
>  	{ IMX93_CLK_SAI3_IPG,		"sai3_ipg_clk", "bus_wakeup_root",	0x94c0, 0, &share_count_sai3},
>  	{ IMX93_CLK_MIPI_CSI_GATE,	"mipi_csi",	"media_apb_root",	0x9580, },
> -	{ IMX93_CLK_MIPI_DSI_GATE,	"mipi_dsi",	"media_apb_root",	0x95c0, },
> -	{ IMX93_CLK_LVDS_GATE,		"lvds",		"media_ldb_root",	0x9600, },
> +	{ IMX93_CLK_MIPI_DSI_GATE,	"mipi_dsi",	"media_apb_root",	0x95c0, 0, NULL, PLAT_IMX93 },
> +	{ IMX93_CLK_LVDS_GATE,		"lvds",		"media_ldb_root",	0x9600, 0, NULL, PLAT_IMX93 },
>  	{ IMX93_CLK_LCDIF_GATE,		"lcdif",	"media_apb_root",	0x9640, },
> -	{ IMX93_CLK_PXP_GATE,		"pxp",		"media_apb_root",	0x9680, },
> +	{ IMX93_CLK_PXP_GATE,		"pxp",		"media_apb_root",	0x9680, 0, NULL, PLAT_IMX93 },
>  	{ IMX93_CLK_ISI_GATE,		"isi",		"media_apb_root",	0x96c0, },
>  	{ IMX93_CLK_NIC_MEDIA_GATE,	"nic_media",	"media_axi_root",	0x9700, },
>  	{ IMX93_CLK_USB_CONTROLLER_GATE, "usb_controller", "hsio_root",		0x9a00, },
> @@ -256,8 +256,8 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_HSIO_32K_GATE,	"hsio_32k",	"osc_32k",		0x9dc0, },
>  	{ IMX93_CLK_ENET1_GATE,		"enet1",	"wakeup_axi_root",	0x9e00, 0, NULL, PLAT_IMX93, },
>  	{ IMX93_CLK_ENET_QOS_GATE,	"enet_qos",	"wakeup_axi_root",	0x9e40, 0, NULL, PLAT_IMX93, },
> -	{ IMX91_CLK_ENET2_REGULAR_GATE, "enet2_regular",        "wakeup_axi_root",      0x9e00, 0, NULL, PLAT_IMX91, },
> -	{ IMX91_CLK_ENET1_QOS_TSN_GATE,     "enet1_qos_tsn",        "wakeup_axi_root",      0x9e40, 0, NULL, PLAT_IMX91, },
> +	{ IMX91_CLK_ENET2_REGULAR_GATE, "enet2_regular", "wakeup_axi_root",	0x9e00, 0, NULL, PLAT_IMX91, },
> +	{ IMX91_CLK_ENET1_QOS_TSN_GATE, "enet1_qos_tsn", "wakeup_axi_root",	0x9e40, 0, NULL, PLAT_IMX91, },
>  	/* Critical because clk accessed during CPU idle */
>  	{ IMX93_CLK_SYS_CNT_GATE,	"sys_cnt",	"osc_24m",		0x9e80, CLK_IS_CRITICAL},
>  	{ IMX93_CLK_TSTMR1_GATE,	"tstmr1",	"bus_aon_root",		0x9ec0, },
> -- 
> 2.37.1
> 

