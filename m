Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1CA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 08:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v4z961hn;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=FIGBN9fR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gtkThhp7HAR2Inex6AHRIVWwfpvzSe5F6c2HI/CDFLI=; b=v4z961hn9MgE8y
	S8lCE3G6U+X40H9w4IFc4mTDolrMZmmaR8XiIR8mAYKRvOKM41NuhDjHL/eUv/lpmxGLJ0O7YVkrn
	s2Cc5uJ1UOik2hJrRxAoSBP8hOrZZRG6Jznu1ncWPDfw+wyCBV770OKP0qFUExup7YtIUe10KUdCO
	wajhVSEUgq2U2+guJBfU0aElWxUV8IYOsMWp1yqxyWaYAG8DEGqKJQMle164vn+6BIqgC0mF8fyDv
	qyYS/B+PV3glYHkefPPQ5suMJYWat511YwbfmwGM2EoBtPICQXzHWY5rhh7lGvklTVvkcvaZrSXhH
	b9qXuNFCztEVHV9QhD9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLUO-00000008jBn-13cx;
	Thu, 29 Oct 2026 08:28:00 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLUK-00000008j9M-3xXP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 08:27:59 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261029082752euoutp0140d5615d73c015bcf0180dd175ccf4f0~i8repN58V1929619296euoutp01M
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 08:27:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261029082752euoutp0140d5615d73c015bcf0180dd175ccf4f0~i8repN58V1929619296euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793262472;
	bh=gtkThhp7HAR2Inex6AHRIVWwfpvzSe5F6c2HI/CDFLI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=FIGBN9fReDJodzfMzBXaOENYqA6b4tTsue6GFNMj62QZ5y3M+Nw4b3DLcC0qOklA2
	 IZcAIk+OEP4qtBJ4ZqoEKPvu5V8q1vWtmxRYj63v60IHrWc8EWtrQFjuh209vGUaE2
	 mbLDKIybckrKXXv1l/Uex5TI7ki9ZhULmmnTFtd0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261029082751eucas1p2453c151aaaaf4dc156fecaa44b339ef2~i8reQdPDF1008610086eucas1p2d;
	Thu, 29 Oct 2026 08:27:51 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261029082750eusmtip168d8b64350b4dc54d7804c97473cdeee~i8rdAMflV3276632766eusmtip1K;
	Thu, 29 Oct 2026 08:27:50 +0000 (GMT)
Message-ID: <fa68308d-07f5-4a62-9e18-a306a5751e43@samsung.com>
Date: Thu, 29 Oct 2026 09:27:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 1/3] drm/bridge: analogix_dp: deassert DP_PHY_PD on
 power-on for exynos
To: tb@a-marquet.fr, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae
	<inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
	Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Douglas Anderson <dianders@chromium.org>, Jessica
	Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	Lukas Timmermann <linux@timmermann.space>, Henrik Grimler
	<henrik@grimler.se>, Hendrik Noack <hendrik-noack@gmx.de>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261027-drm-misc-next-manta-auxbus-v1-1-3a45c3cf531d@a-marquet.fr>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261029082751eucas1p2453c151aaaaf4dc156fecaa44b339ef2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261027120921eucas1p2af4aec7a911cbb07018a91fcf82a8c32
X-EPHeader: CA
X-CMS-RootMailID: 20261027120921eucas1p2af4aec7a911cbb07018a91fcf82a8c32
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
	<CGME20261027120921eucas1p2af4aec7a911cbb07018a91fcf82a8c32@eucas1p2.samsung.com>
	<20261027-drm-misc-next-manta-auxbus-v1-1-3a45c3cf531d@a-marquet.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_012757_582048_4CDB2E6D 
X-CRM114-Status: GOOD (  26.36  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 13:01, Alexandre Marquet via B4 Relay wrote:
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> On exynos platforms at least, calling
> analogix_dp_set_analog_power_down() to power on (with enable=false) CH0
> to CH3 or the AUX bus currently produces no effect, unless the function
> is first called to power on everything (by setting block to POWER_ALL or
> ANALOG_TOTAL). The reason for this is that DP_PHY_PD being asserted
> (which is its default state) renders every other register bit
> ineffective.
>
> This is particularly an issue for AUX bus initialization, that tends to
> happen before anything else (e.g., to request EDID), and thus, before
> anything has any chance to request a power on of the whole analog
> section of the chip.
>
> This commit allows analogix_dp_set_analog_power_down() to power on any
> block, by deasserting DP_PHY_PD if needed.
>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Snow, Peach-Pit and Peach-Pi Chromebooks work fine with this change.

> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> index c1344a3f013a..9f634d4e4793 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -256,6 +256,19 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
>  	if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
>  		phy_pd_addr = ANALOGIX_DP_PD;
>  
> +	reg = readl(dp->reg_base + phy_pd_addr);
> +
> +	if (dp->plat_data && (dp->plat_data->dev_type == EXYNOS_DP)) {
> +		/* On exynos, register AUX_PD and CH[0-3]_PD have no effect if
> +		 * DP_PHY_PD is asserted. So, when powering any of them up, we
> +		 * need to deassert DP_PHY_PD first.
> +		 */
> +		if (!enable && (reg & DP_PHY_PD)) {
> +			reg &= ~DP_PHY_PD;
> +			reg |= AUX_PD | CH0_PD | CH1_PD | CH2_PD | CH3_PD;
> +		}
> +	}
> +
>  	switch (block) {
>  	case AUX_BLOCK:
>  		if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
> @@ -263,7 +276,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
>  		else
>  			mask = AUX_PD;
>  
> -		reg = readl(dp->reg_base + phy_pd_addr);
>  		if (enable)
>  			reg |= mask;
>  		else
> @@ -272,7 +284,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
>  		break;
>  	case CH0_BLOCK:
>  		mask = CH0_PD;
> -		reg = readl(dp->reg_base + phy_pd_addr);
>  
>  		if (enable)
>  			reg |= mask;
> @@ -282,7 +293,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
>  		break;
>  	case CH1_BLOCK:
>  		mask = CH1_PD;
> -		reg = readl(dp->reg_base + phy_pd_addr);
>  
>  		if (enable)
>  			reg |= mask;
> @@ -292,7 +302,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
>  		break;
>  	case CH2_BLOCK:
>  		mask = CH2_PD;
> -		reg = readl(dp->reg_base + phy_pd_addr);
>  
>  		if (enable)
>  			reg |= mask;
> @@ -302,7 +311,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
>  		break;
>  	case CH3_BLOCK:
>  		mask = CH3_PD;
> -		reg = readl(dp->reg_base + phy_pd_addr);
>  
>  		if (enable)
>  			reg |= mask;
> @@ -321,7 +329,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
>  		else
>  			mask = DP_PHY_PD;
>  
> -		reg = readl(dp->reg_base + phy_pd_addr);
>  		if (enable)
>  			reg |= mask;
>  		else
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


