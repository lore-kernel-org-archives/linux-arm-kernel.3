Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3B3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 02:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eAD3T5eX;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=kVKDnGi7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=85O98ibYQIY4tqJnX7KyBnA6NvI/h3LWUxQTLuidEQg=; b=eAD3T5eXAg9Nun
	ziQrXEgaBcy10mZAeAz30rmuYtzPhBnTEnl5JduQmBnPKywjy+UPfKO59WBhsLWEDLti9xQTqV4ND
	leVhwzW+sqlBMMJhORlyS3Y6PkLtLwyYoXh4cFqL56o547WuQx1WXGwxwCBncFGG9vmEiUVOLcebV
	kkb5VDxSbVQcC3liW0by1nWFq5wRzPsiFfQqg/K9D8gE/4l/cqJwjdfbwmCR3Se6Ppw4dHkCETKa7
	nmUdC+xj7HPQnKOSyDZA8RfNjaLzu6GddidLWlaESYkAsvFmMwvkhWMdUTh5oYnDU9JTGuLeQ5Wcg
	TzJCTrJ4iG/3aWth2QNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLAII-00000001bXs-2KpY;
	Mon, 26 Oct 2026 02:18:38 +0000
Received: from mail-m12818.netease.com ([103.209.128.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLAIE-00000001bXD-2xGJ;
	Mon, 26 Oct 2026 02:18:37 +0000
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 524c264ae;
	Mon, 26 Oct 2026 10:18:21 +0800 (GMT+08:00)
Message-ID: <9e3dc854-b2f5-459c-8267-55e88e87f5b5@rock-chips.com>
Date: Mon, 26 Oct 2026 10:17:58 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: use the lane rate for lbcc when
 lanes run faster
To: Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261025142639.3454322-1-romain.tisserand@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261025142639.3454322-1-romain.tisserand@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa176006a1b03a7kunm3cd7cb0e672527
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTx9LVktJTRlOShlISUNJSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=kVKDnGi7Vz6BTvdW8UtqvNNMudpYj9sKVhglzVFIrz/tElI5jE2PuHYdAiS+Em2/OikLiA5pArO5uVmdWbDcI+mM3aj9/vteKEmHJRrZIbQxdLJ1BBaBT/QeTSyTI3NC3vRa5R3bNlfuqSS6/sEpaAqq18JMAIiUnDrFscxw/Vg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=85O98ibYQIY4tqJnX7KyBnA6NvI/h3LWUxQTLuidEQg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_191835_322320_E965D696 
X-CRM114-Status: GOOD (  31.62  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Romain,

On 10/25/2026 10:26 PM, Romain TISSERAND wrote:
> Commit ac87d23694f4 ("drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock
> rate to calculate lbcc") counts HSA, HBP and HLINE from the pixel clock,
> which is only right when the lanes run at the pixel bandwidth (pixel
> clock * bpp / lanes). Commit 93e82bb4de01 ("drm/bridge: synopsys:
> dw-mipi-dsi: Fix hcomponent lbcc for burst mode") went back to the lane
> rate for burst mode, where the lanes are faster on purpose.
> 
> The Rockchip glue runs the lanes faster in every mode: it adds 25% to
> the pixel bandwidth, or uses the rate the panel asks for. In non-burst
> video mode the line programmed in lane byte clocks is then shorter than
> the DPI line. On the GPD XD (RK3288, ILI9881C panel, 4 lanes at
> 752 Mbps, 59.5 MHz pixel clock, htotal 747) HLINE was 561 lane byte
> clocks (6.0 us) for a 12.55 us line: the DPI payload FIFO overflows
> (dpi_pld_wr_err in DSI_INT_ST1) and the panel shows garbage as soon as
> a client page-flips.
> 
> Use the lane rate when it is clearly above the pixel bandwidth (more
> than 1/8), and keep the pixel clock formula when both match, as on
> i.MX93, Meson and STM in non-burst mode, where lane_mbps is the pixel
> bandwidth rounded up to the next MHz. On the GPD XD this gives HLINE
> 1181, HSA 21 and HBP 7, and the picture is stable.
> 
> Fixes: ac87d23694f4 ("drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock rate to calculate lbcc")
> Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
> ---
> Notes for reviewers (not for the changelog):
> - The 1/8 threshold separates glues that report the pixel bandwidth
>   rounded up to the next MHz (i.MX93, Meson; STM in non-burst mode) from
>   Rockchip, which adds 25% in every mode. If a per-glue flag is
>   preferred instead of a threshold, I can rework it that way.

Adding different glue code for each implementation seems like a good
idea.

Maybe you should try to add a new callback in dw_mipi_dsi_plat_data ?

> - Testing: built with W=1 for arm (multi_v7) and arm64 (defconfig),
>   DRM_DW_MIPI_DSI=y and =m, no warnings. Tested live on the GPD XD
>   (RK3288, ILI9881C, non-burst with sync pulses), 6.18.54 with this
>   exact change applied: HLINE 1181, HSA 21, HBP 7 read back from the
>   DSI host, no dpi_pld_wr_err in DSI_INT_ST1 while the UI page-flips,
>   and a clean picture in the UI and in games (before the change: garbage
>   as soon as a client page-flips).
>   Not tested on i.MX93, Meson or STM hardware; for them the computation
>   is unchanged unless the lane rate is more than 1/8 above the pixel
>   bandwidth.
> - Tool disclosure: this patch was prepared with Claude Opus 5.5
>   (Anthropic) as a coding assistant, in an interactive session where I
>   asked it to bring up the GPD XD display and then to prepare the fix
>   for upstream. It located the cause from the DSI host registers, went
>   through the history of the lbcc computation (ac87d23694f4,
>   93e82bb4de01) and the lane rates of the other dw-mipi-dsi glues, and
>   drafted the code change and the changelog. I reviewed and understand
>   both, and tested the patch on the GPD XD as described above.
> 
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 23 +++++++++++++------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 22d1b8cbe1..b026b602ab 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -781,19 +781,28 @@ static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
>  					   u32 hcomponent)
>  {
>  	u32 frac, lbcc, minimum_lbcc;
> +	u64 pixel_kbps;
>  	int bpp;
>  
> -	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> +	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> +	if (bpp < 0) {
> +		dev_err(dsi->dev, "failed to get bpp\n");
> +		return 0;
> +	}
> +
> +	/*
> +	 * Use the lane rate when it is above the pixel bandwidth (burst, or
> +	 * glues adding margin in all modes); the 1/8 slack ignores lane_mbps
> +	 * being rounded up to the next MHz. Otherwise the pixel clock is more
> +	 * precise.
> +	 */
> +	pixel_kbps = div_u64((u64)mode->clock * bpp, dsi->lanes);
> +	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ||
> +	    (u64)dsi->lane_mbps * MSEC_PER_SEC > pixel_kbps + pixel_kbps / 8) {
>  		/* lbcc based on lane_mbps */
>  		lbcc = hcomponent * dsi->lane_mbps * MSEC_PER_SEC / 8;
>  	} else {
>  		/* lbcc based on pixel clock rate */
> -		bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> -		if (bpp < 0) {
> -			dev_err(dsi->dev, "failed to get bpp\n");
> -			return 0;
> -		}
> -
>  		lbcc = div_u64((u64)hcomponent * mode->clock * bpp, dsi->lanes * 8);
>  	}
>  
> 
> base-commit: cf61bef3801c3c9d0d8c39026b7b2fb242898a3a

-- 
Best, 
Chaoyi

