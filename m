Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C9ECA0EF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7p0qE46AgjxpfksdTqVKBD7rHzhLux4qpqhb9pg6lNg=; b=D7EotSkaUOR7m5BgtQdpwBcXEo
	V8jhb0Mbo/VY3jZt+wEXwq8tJykomgItLTFOwUYhEqEWHUabKmYp/0dIs9ZSfBRVnCYRTcjptd8yr
	t57N9ymKS6sj5HXvnUI8/BJ7UVtQyPQfJdO18Der6FuhxzfXCf68iBjCupdM6Ag512xSyRA/if98B
	s5yHqmOTXQfUPH1zd+0wQuYMQiQ9xB1Vx1yOTkjv0e3l8/2fsl2VmKpNEHEKBWo+s1IpjRkDYsGy4
	P5f1h+uYkOFutEnYtZrhTbKtZfnBhsTiVNXxCAXfF1Wldtu8OyyKgxORrZXbIfhlmZ9OHawKHH2sj
	J36yI71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1A7-00000007oM5-3ErS;
	Mon, 18 Aug 2025 14:48:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwCc-000000073xU-1sMx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 09:30:55 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A84E817D1;
	Mon, 18 Aug 2025 11:29:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755509395;
	bh=H/RXtCGHHBQ1De/TaksVJ3qWD5+W1hECG5Q6BNf8hho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WEvCwHrtO2zW5f35Nzm4LD1pik4x3m01g/rzVvq5amdOzMDfxcHEbM1SBjhuZlUbn
	 cdHrFSzhbRD36iU9dU+fKvvVVshrRm+mbJ8cLFex0lqSZnIQV0Ha12azlU7PpeCFla
	 GIGsF+cQc6JPBw8OXJRgPKDt1IUfesZndTSM1xpY=
Date: Mon, 18 Aug 2025 12:30:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Inbaraj E <inbaraj.e@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, martink@posteo.de,
	mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com,
	shradha.t@samsung.com, ravi.patel@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/12] media: imx-mipi-csis: Add support to dump all
 vc regs
Message-ID: <20250818093030.GB5862@pendragon.ideasonboard.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141041epcas5p2b281659391a8e45c95e8db21d9867f98@epcas5p2.samsung.com>
 <20250814140943.22531-9-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250814140943.22531-9-inbaraj.e@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_023054_627956_F832A789 
X-CRM114-Status: GOOD (  13.81  )
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

Hi Inbaraj,

Please see [1] and in particular [2]. I would like to get that series
merged for v6.18, but it's missing reviews. If you want to speed it up,
you can review the patches :-)

[1] https://lore.kernel.org/linux-media/20250608235840.23871-1-laurent.pinchart@ideasonboard.com
[2] https://lore.kernel.org/linux-media/20250608235840.23871-9-laurent.pinchart@ideasonboard.com/

On Thu, Aug 14, 2025 at 07:39:39PM +0530, Inbaraj E wrote:
> Extend support to dump all 4 virtual channel register.
> 
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 4f6c417fdf58..c1653a738854 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -876,11 +876,26 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
>  		{ MIPI_CSIS_DPHY_SCTRL_L, "DPHY_SCTRL_L" },
>  		{ MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
>  		{ MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
> +		{ MIPI_CSIS_ISP_CONFIG_CH(1), "ISP_CONFIG_CH1" },
> +		{ MIPI_CSIS_ISP_CONFIG_CH(2), "ISP_CONFIG_CH2" },
> +		{ MIPI_CSIS_ISP_CONFIG_CH(3), "ISP_CONFIG_CH3" },
>  		{ MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
> +		{ MIPI_CSIS_ISP_RESOL_CH(1), "ISP_RESOL_CH1" },
> +		{ MIPI_CSIS_ISP_RESOL_CH(2), "ISP_RESOL_CH2" },
> +		{ MIPI_CSIS_ISP_RESOL_CH(3), "ISP_RESOL_CH3" },
>  		{ MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
> +		{ MIPI_CSIS_SDW_CONFIG_CH(1), "SDW_CONFIG_CH1" },
> +		{ MIPI_CSIS_SDW_CONFIG_CH(2), "SDW_CONFIG_CH2" },
> +		{ MIPI_CSIS_SDW_CONFIG_CH(3), "SDW_CONFIG_CH3" },
>  		{ MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
> +		{ MIPI_CSIS_SDW_RESOL_CH(1), "SDW_RESOL_CH1" },
> +		{ MIPI_CSIS_SDW_RESOL_CH(2), "SDW_RESOL_CH2" },
> +		{ MIPI_CSIS_SDW_RESOL_CH(3), "SDW_RESOL_CH3" },
>  		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
>  		{ MIPI_CSIS_FRAME_COUNTER_CH(0), "FRAME_COUNTER_CH0" },
> +		{ MIPI_CSIS_FRAME_COUNTER_CH(1), "FRAME_COUNTER_CH1" },
> +		{ MIPI_CSIS_FRAME_COUNTER_CH(2), "FRAME_COUNTER_CH2" },
> +		{ MIPI_CSIS_FRAME_COUNTER_CH(3), "FRAME_COUNTER_CH3" },
>  	};
>  
>  	unsigned int i;

-- 
Regards,

Laurent Pinchart

