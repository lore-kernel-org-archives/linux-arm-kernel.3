Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7555CCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 01:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/YTKzn8x+ScPY0xOlbOt0GetCsCtokkL6paqigkGfsw=; b=d8DJnLfoXrnCOCN35CQv8ln1m9
	1KA1ePLTQ7UF3INyaw72AcSKZxsR1Y5DpyIpcXj3cDQBVf5FVGgtONsnXHPx/csmklSSwfTfQRgTk
	QeTDGGEaiJ/SYPlKM0gqpa7AJiFU/PvnV/hMtdsk0qkNuH8K7szxGjG/r0LK160KqIwZhwFACHBqA
	r5l6lGhU72TczWfy8sZ/S7o9ljZ3XHAedxcJ4EK104jNYLBpfwARE3Ap97jIhyLytbkVbLegajv1Z
	Ju5XOOJH8GzlBdycLLPI2Uh4KrGSPSgQel9dx49P7zuABjZL9YSz93LTFBUjdaXN510CGbGt2XJDc
	6pzxAcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUaVB-0000000E3HP-1R3V;
	Wed, 03 Jun 2026 01:34:37 +0000
Received: from mail-m128113.netease.com ([103.209.128.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUaV7-0000000E3Go-443X;
	Wed, 03 Jun 2026 01:34:35 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 40d4cc4e8;
	Wed, 3 Jun 2026 09:34:29 +0800 (GMT+08:00)
Message-ID: <a473c5a2-b1f9-4cf8-85bb-d3ec1572cbe8@rock-chips.com>
Date: Wed, 3 Jun 2026 09:34:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/rockchip: dsi: Add dphy_get_timing support for
 multiple PHY types
To: Heiko Stuebner <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Guochun Huang <hero.huang@rock-chips.com>, Chaoyi Chen <kernel@airkyi.com>
References: <20260324085838.90-1-kernel@airkyi.com>
 <20260324085838.90-2-kernel@airkyi.com> <7091445.e8TTKsaY2g@phil>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <7091445.e8TTKsaY2g@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e8b1e272b03a7kunm90780f18321e8e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSE8dVkNMTR9DSUNMGkxMSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=gzwYSJAZtEjsJiFDXTJx3X3klY2kxyRngymRyZO/CboKLZ4h8irwxcCEeGyX/4ik7HcJIYhtzRcN48RWubO1+CNdphs94VR4/HiD0dJq7ShOOng0FAHP3mmqLCnuMneIWFjfLaJ6qckQdBgFJ7eHVyPbITPJ1a+LXjFeJvoGu9M=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=/YTKzn8x+ScPY0xOlbOt0GetCsCtokkL6paqigkGfsw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_183434_236553_43781A90 
X-CRM114-Status: GOOD (  16.65  )
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

Hi Heiko,

On 6/3/2026 5:02 AM, Heiko Stuebner wrote:
> Am Dienstag, 24. März 2026, 09:58:38 Mitteleuropäische Sommerzeit schrieb Chaoyi Chen:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Currently, there are generally two types of DPHY for Rockchip. One is
>> the DPHY used by RK3288/RK3399, whose timing is described by Table A-3
>> High-Speed Transition Times in the databook. The other is the DPHY used
>> by PX30 and its successors. If its timing is still described using
>> RK3288/RK3399, it may not perform correctly on some DSI panel.
>>
>> Add dphy_get_timing for different D-PHY types to adapt to timing
>> differences.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 45 ++++++++++++++++++-
>>  1 file changed, 43 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> index d3bacfae174e..2d1c9e54ff85 100644
>> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> @@ -247,6 +247,7 @@ enum {
>>  	BIASEXTR_127_7,
>>  };
>>  
>> +struct dw_mipi_dsi_rockchip;
>>  struct rockchip_dw_dsi_chip_data {
>>  	u32 reg;
>>  
>> @@ -262,6 +263,9 @@ struct rockchip_dw_dsi_chip_data {
>>  	u32 lanecfg2_grf_reg;
>>  	u32 lanecfg2;
>>  
>> +	int (*dphy_get_timing)(struct dw_mipi_dsi_rockchip *dsi, unsigned int lane_mbps,
>> +			       struct dw_mipi_dsi_dphy_timing *timing);
>> +
>>  	int (*dphy_rx_init)(struct phy *phy);
>>  	int (*dphy_rx_power_on)(struct phy *phy);
>>  	int (*dphy_rx_power_off)(struct phy *phy);
>> @@ -721,8 +725,9 @@ static struct hstt hstt_table[] = {
>>  };
>>  
>>  static int
>> -dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
>> -			   struct dw_mipi_dsi_dphy_timing *timing)
>> +dw_mipi_dsi_phy_rk3288_get_timing(struct dw_mipi_dsi_rockchip *dsi,
>> +				  unsigned int lane_mbps,
>> +				  struct dw_mipi_dsi_dphy_timing *timing)
>>  {
>>  	int i;
>>  
>> @@ -738,6 +743,32 @@ dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
>>  	return 0;
>>  }
>>  
>> +static const struct dw_mipi_dsi_dphy_timing dphy_timing_px30 = {
>> +	.clk_lp2hs = 0x40,
>> +	.clk_hs2lp = 0x40,
>> +	.data_lp2hs = 0x10,
>> +	.data_hs2lp = 0x14,
>> +};
> 
> so just to make sure, the timing on the px30 (and later) variant is the
> same for all lane speeds?
>

More precisely, it applies to this fixed value for INNO PHY used after PX30.

> Please include that bit in the commit description
> 

I will add more details in v2. Thank you!

-- 
Best, 
Chaoyi

