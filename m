Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F64CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sneqYwDRBuVT0kWblPgmH+P/YTJffyawFpfKVqEdHuk=; b=yV+xpvK1uN4wLjgiQU9NiR3MvE
	vQC0J9drd350q1RE++4Bmh25MUk3ctqCeGmuAhvIx5BuNbqeptauupa3j/d5eVju0hoiHe4G9ZHjw
	miZGvt74pFA30oFvhVqS9srcFFluhqu8Ar5e/97YaYk0vGk+NqMBQcIKOA92EcIcLidfBSoVZ96If
	Xkp/yWmBXYPaX3bKVp754UZdfcxRqmzc4fi2wuwczzk/pXhwGn0tODGOb5/iwcMXcLngpr/Z5hsPZ
	cCfmBNmuazG2AizwJL/AW07wX07oLvXQu7xHPNG/2MM31qqoG2KPz1JJthWlL91n6KjJPphfXWFj6
	GgJJjvnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBCs-00000001D9l-2uEm;
	Thu, 18 Jun 2026 11:46:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBCp-00000001D8u-0p2Z;
	Thu, 18 Jun 2026 11:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781783203;
	bh=9yeH/5xhRUOAdE0bJjDccTvLL5+CdjMFstSXsgg0CEQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fAdfA6s/ZcUtfI0N7T8BtYWrLx/JOtP3a33kFxOh5bjoWupssUOOgxtoUr3j2dE8z
	 0twbUF21YFAMQhuf2x99LsrQxObeD3eFSmL0IGZwSwp4gVL9U/iqtTo3dc66btDw38
	 kLuxFQoIhNHI/uK/e+brFxjffnZdSGyMgr7pM8WAPKqHnljq3IQcBtqCwIxm/7QY6F
	 ZXgHPYm5eN5Nl4zBi9A2OLY3EGRmtsE5gCdITVDNPPb+D60MBHFW2XhnALWNACs5jC
	 2OWN/pIzRgX7sHNSUJr1sQEPbd38XLxyMI4qNnYPeGoFEcy9ggydxrHuGh6gotZTLn
	 RG8fn+TYDJQpA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5D7817E0151;
	Thu, 18 Jun 2026 13:46:42 +0200 (CEST)
Message-ID: <302d42b0-108e-4936-bc34-49b9194985f1@collabora.com>
Date: Thu, 18 Jun 2026 14:46:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] drm/rockchip: vop2: Reset AXI and DCLK to improve
 robustness
To: Philipp Zabel <p.zabel@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
 <20260617-dw-hdmi-qp-yuv-v1-2-a665cfd06d7d@collabora.com>
 <7c79f233c863654b0266de4b5ec5a8c72bb17715.camel@pengutronix.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <7c79f233c863654b0266de4b5ec5a8c72bb17715.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_044647_401793_FF31C8C1 
X-CRM114-Status: GOOD (  18.37  )
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

On 6/18/26 12:39 PM, Philipp Zabel wrote:
> On Mi, 2026-06-17 at 21:51 +0300, Cristian Ciocaltea wrote:
>> Assert the AXI reset in the CRTC disable path, and the VP DCLK reset in
>> the enable path.
>>
>> These resets are intended to leave the hardware in a clean state for the
>> next use, helping recover from exceptions such as IOMMU page faults, as
>> well as to prevent random display output glitches, such as a blank
>> image, observed when switching modes that also change the color format,
>> e.g. from RGB to YUV420 and vice versa.
>>
>> For now this seems to affect only the RK3588, hence the resets are
>> optional and will be provided in the device tree for this SoC only.
>>
>> Co-developed-by: Andy Yan <andy.yan@rock-chips.com>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 35 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++++
>>  2 files changed, 39 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 4cce3e336f5b..2833fb49ad81 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_runtime.h>
>>  #include <linux/regmap.h>
>> +#include <linux/reset.h>
>>  #include <linux/swab.h>
>>  
>>  #include <drm/drm.h>
>> @@ -860,6 +861,26 @@ static int vop2_core_clks_prepare_enable(struct vop2 *vop2)
>>  	return ret;
>>  }
>>  
>> +static void vop2_clk_reset(struct vop2 *vop2, struct reset_control *rstc)
> 
> The _clk part of the function name is misleading ...

Ack.  

We need to make this clearly distinct from another similarly named function,
vop2_crtc_reset(), hence I'd propose:

- vop2_reset_assert_deassert()
- vop2_reset_cycle()
- vop2_do_reset()

Any preference / alternative suggestions?

> 
> [...]
>> @@ -938,6 +959,8 @@ static void vop2_disable(struct vop2 *vop2)
>>  {
>>  	rockchip_drm_dma_detach_device(vop2->drm, vop2->dev);
>>  
>> +	vop2_clk_reset(vop2, vop2->axi_rst);
> 
> ... because this function is also called with the AXI reset control.
> 
>> +
>>  	pm_runtime_put_sync(vop2->dev);
>>  
>>  	regcache_drop_region(vop2->map, 0, vop2_regmap_config.max_register);
>> @@ -1948,6 +1971,8 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>>  
>>  	vop2_crtc_atomic_try_set_gamma(vop2, vp, crtc, crtc_state);
>>  
>> +	vop2_clk_reset(vop2, vp->dclk_rst);
>> +
>>  	drm_crtc_vblank_on(crtc);
>>  
>>  	vop2_unlock(vop2);
>> @@ -2531,6 +2556,11 @@ static int vop2_create_crtcs(struct vop2 *vop2)
>>  			return dev_err_probe(drm->dev, PTR_ERR(vp->dclk),
>>  					     "failed to get %s\n", dclk_name);
>>  
>> +		vp->dclk_rst = devm_reset_control_get_optional(vop2->dev, dclk_name);
> 
> Please use devm_reset_control_get_optional_exclusive() directly.

Thanks for pointing this out, I missed the comment mentioning the explicit API
transition.

>> +		if (IS_ERR(vp->dclk_rst))
>> +			return dev_err_probe(drm->dev, PTR_ERR(vp->dclk_rst),
>> +					     "failed to get %s reset\n", dclk_name);
>> +
>>  		np = of_graph_get_remote_node(dev->of_node, i, -1);
>>  		if (!np) {
>>  			drm_dbg(vop2->drm, "%s: No remote for vp%d\n", __func__, i);
>> @@ -2890,6 +2920,11 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
>>  		return dev_err_probe(drm->dev, PTR_ERR(vop2->pll_hdmiphy1),
>>  				     "failed to get pll_hdmiphy1\n");
>>  
>> +	vop2->axi_rst = devm_reset_control_get_optional(vop2->dev, "axi");
> 
> Same as above, devm_reset_control_get_optional_exclusive().

Ack.

Thanks for reviewing,
Cristian

