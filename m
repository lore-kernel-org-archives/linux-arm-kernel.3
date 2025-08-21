Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEF7CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHxcorhp5czLlBBNNIvPxeZEYbfShmd+8rRbKqHVLQc=; b=pT7O1br0++xEppsl5SccG+6p2F
	XL6Ij1zi2k0shnt1ITOPFxxWcHxim/Ykx48kULGGNJX9qGF543FYyA9Eq3lZcHFuwf4QVoVXgVmFG
	Xqbn0MmCRfLi07BpL78MGtrQHnVsHcDdbxlSFZYph2CINeXrW1vBR7VvB/MmlseyvjiyJ7rlRSJTd
	rUFekeoUAAiaT8CjT3MjvdbqawU6efa4N3YErGyW/103eNquBT9Y9yEUfKAhS/O6yF8eM1PE8+96I
	T3NTQtym8imuoWIpUhLrNi1t74vceWPX2iKFkcNxX0KwWJdmh1OPjRJnVJ+/gF0kKgNoVDqAuYHBu
	V4yxGdHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4uo-0000000GyeG-3nCE;
	Thu, 21 Aug 2025 13:01:15 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1lv-0000000GQJH-2lBw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 09:39:53 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L8uf03028719;
	Thu, 21 Aug 2025 11:39:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	kHxcorhp5czLlBBNNIvPxeZEYbfShmd+8rRbKqHVLQc=; b=x54WHZWtHoVtnKSh
	GwXIq32qEehSt5QN4pnCvtl8/TiFHUGkCVxLDpTAaQktot64B36wulxk1ei+r5EB
	q4oJU0m5ApNcrcGtHJTtGKf8JmVGtpf2P+Nqv7T7elfSWoaqyewnWBbT/y30hkyM
	QztQ5odjdA0mMraCkgbl+w7JGJlgWV4xAyEG9fI/kLcwVxziU/qGhGPxTAw20d6i
	hM/4vG1IQ1AxUrf3PLjbdmzhAQKlbABlritN7UG4B85uzMmfNcd9IrPQzWD/XlfS
	/PHF7fjxPPYQDRwv1ACERxT7tPpV8bBLheQgLG2lpZ+jXslc/76fxC3S4Xlo4gTt
	cUUJxA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n81wnyun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 11:39:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 50FE64002D;
	Thu, 21 Aug 2025 11:36:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3FF873DB4E;
	Thu, 21 Aug 2025 11:35:26 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 11:35:25 +0200
Message-ID: <ea6b8999-4f5d-4cc2-b92b-b0776c2b1363@foss.st.com>
Date: Thu, 21 Aug 2025 11:35:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/stm/dw_mipi_dsi-stm: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo
	<shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Pengutronix
 Kernel Team" <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Clark
	<robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        "Abhinav
 Kumar" <abhinav.kumar@linux.dev>,
        Jessica Zhang
	<jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Raphael Gallais-Pou
	<raphael.gallais-pou@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
	<wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland
	<samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
 <20250811-drm-clk-round-rate-v2-6-4a91ccf239cf@redhat.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-6-4a91ccf239cf@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_023951_974640_766725E4 
X-CRM114-Status: GOOD (  18.69  )
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

Hi Brian,

thanks for the patch.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>

Le 11/08/2025 à 12:56, Brian Masney a écrit :
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> index 2c7bc064bc66c6a58903a207cbe8091a14231c2b..58eae6804cc82d174323744206be7046568b905c 100644
> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> @@ -274,8 +274,8 @@ static unsigned long dw_mipi_dsi_clk_recalc_rate(struct clk_hw *hw,
>   	return (unsigned long)pll_out_khz * 1000;
>   }
>   
> -static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> -				       unsigned long *parent_rate)
> +static int dw_mipi_dsi_clk_determine_rate(struct clk_hw *hw,
> +					  struct clk_rate_request *req)
>   {
>   	struct dw_mipi_dsi_stm *dsi = clk_to_dw_mipi_dsi_stm(hw);
>   	unsigned int idf, ndiv, odf, pll_in_khz, pll_out_khz;
> @@ -283,14 +283,14 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>   
>   	DRM_DEBUG_DRIVER("\n");
>   
> -	pll_in_khz = (unsigned int)(*parent_rate / 1000);
> +	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
>   
>   	/* Compute best pll parameters */
>   	idf = 0;
>   	ndiv = 0;
>   	odf = 0;
>   
> -	ret = dsi_pll_get_params(dsi, pll_in_khz, rate / 1000,
> +	ret = dsi_pll_get_params(dsi, pll_in_khz, req->rate / 1000,
>   				 &idf, &ndiv, &odf);
>   	if (ret)
>   		DRM_WARN("Warning dsi_pll_get_params(): bad params\n");
> @@ -298,7 +298,9 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>   	/* Get the adjusted pll out value */
>   	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
>   
> -	return pll_out_khz * 1000;
> +	req->rate = pll_out_khz * 1000;
> +
> +	return 0;
>   }
>   
>   static int dw_mipi_dsi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -351,7 +353,7 @@ static const struct clk_ops dw_mipi_dsi_stm_clk_ops = {
>   	.disable = dw_mipi_dsi_clk_disable,
>   	.is_enabled = dw_mipi_dsi_clk_is_enabled,
>   	.recalc_rate = dw_mipi_dsi_clk_recalc_rate,
> -	.round_rate = dw_mipi_dsi_clk_round_rate,
> +	.determine_rate = dw_mipi_dsi_clk_determine_rate,
>   	.set_rate = dw_mipi_dsi_clk_set_rate,
>   };
>   
>

