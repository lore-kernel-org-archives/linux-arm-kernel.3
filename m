Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE72CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 01:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1cnttQcMrvUZx5o8JPHBR3oI+NYB+tDa2bCbLIj358=; b=c7xvc1yqO1r2qKXzlI3N6eooTY
	y1fliExNdQ/Tf+a+dzJuVa+Jpof4uShZu0xvsy3aWmCZQOEnlrmEYLjJoilXaG0Hq6q8UG4hP2nld
	CbYBd+3+cHICzB5jX5IcCmD/0mbgdnlVZVnR5urS5b7Gn1jIBUyyaLF6bNhbQBh52zA+X4zuOF7Sd
	VuryDRkMUPgPDAfipmCp2AQQ+DZdkN/s8GAgUd3xQUmVntPdg2rt3/tVu8b6pIFySUCLgujdtLJtn
	zkoznZcrdp7Xo9l6jpBeT3Lo+PeyguBqr19bhtZm7d1Hfk+1qDq3mOU1NGWZ7Xo9LIN+IoEcRV8Ru
	AxrjBAYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUaPr-0000000E2va-0Wp3;
	Wed, 03 Jun 2026 01:29:07 +0000
Received: from mail-m158177.netease.com ([47.251.158.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUaPm-0000000E2uG-1yRU;
	Wed, 03 Jun 2026 01:29:05 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 40d472abe;
	Wed, 3 Jun 2026 09:28:46 +0800 (GMT+08:00)
Message-ID: <91378132-8a8e-4bcc-9aa7-4de9fb135a6a@rock-chips.com>
Date: Wed, 3 Jun 2026 09:28:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/rockchip: dsi: Add maximum per lane bit rate
 calculation
To: Heiko Stuebner <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Guochun Huang <hero.huang@rock-chips.com>, Chaoyi Chen <kernel@airkyi.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260324085838.90-1-kernel@airkyi.com> <4888940.6M6d0yLqnL@phil>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <4888940.6M6d0yLqnL@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e8b18ebda03a7kunma7a4b39932116e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTU1NVktKGkhCGUhOSkodQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=DpCRBhYhHsk59imJ+FGOLy8d4MOtCjg9bDkKtXvNrDk5iWWBwZS1A4x0JDviW1oUGeFdDFS2d0NWdJVtU4YkUlRC3PajKAKdjolU8I8op2P1QcWAmkz2FKNW1VnFI1EwqOqeverIZpow5QyF0+1N/oei5IaiUWhLDi9TV/7d7fg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=m1cnttQcMrvUZx5o8JPHBR3oI+NYB+tDa2bCbLIj358=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_182903_374317_6335C9AA 
X-CRM114-Status: GOOD (  16.87  )
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

On 6/3/2026 4:59 AM, Heiko Stuebner wrote:
> Am Dienstag, 24. März 2026, 09:58:37 Mitteleuropäische Sommerzeit schrieb Chaoyi Chen:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Different chips have varying support for the maximum bit rate per lane.
>>
>> Add calculation for the maximum per lane bit rate for various chip
>> platforms, and relax the bandwidth margin requirements.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 21 +++++++++++++++----
>>  1 file changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> index 3547d91b25d3..d3bacfae174e 100644
>> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> @@ -268,6 +268,7 @@ struct rockchip_dw_dsi_chip_data {
>>  
>>  	unsigned int flags;
>>  	unsigned int max_data_lanes;
>> +	unsigned long max_bit_rate_per_lane;
>>  };
>>  
>>  struct dw_mipi_dsi_rockchip {
>> @@ -565,7 +566,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>>  	int bpp;
>>  	unsigned long mpclk, tmp;
>>  	unsigned int target_mbps = 1000;
>> -	unsigned int max_mbps = dppa_map[ARRAY_SIZE(dppa_map) - 1].max_mbps;
>> +	unsigned int max_mbps;
>>  	unsigned long best_freq = 0;
>>  	unsigned long fvco_min, fvco_max, fin, fout;
>>  	unsigned int min_prediv, max_prediv;
>> @@ -573,6 +574,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>>  	unsigned long _fbdiv, best_fbdiv;
>>  	unsigned long min_delta = ULONG_MAX;
>>  
>> +	max_mbps = dsi->cdata->max_bit_rate_per_lane;
> 
> I may be blind, but how do the values come together?
> In the dppa_map table we have mbps values of 89 to 1500
> (MHz)
> 
> While below the values set are
> 	.max_bit_rate_per_lane = 1500000000UL,
> in Hz I guess
> 
> And I don't see the needed conversion somehow.
> 
>

Oh! It should be:

max_mbps = dsi->cdata->max_bit_rate_per_lane / USEC_PER_SEC;

Will fix in v2.

>>  	dsi->format = format;
>>  	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>>  	if (bpp < 0) {
>> @@ -584,8 +586,8 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>>  
>>  	mpclk = DIV_ROUND_UP(mode->clock, MSEC_PER_SEC);
>>  	if (mpclk) {
>> -		/* take 1 / 0.8, since mbps must big than bandwidth of RGB */
>> -		tmp = mpclk * (bpp / lanes) * 10 / 8;
>> +		/* take 1 / 0.9, since mbps must big than bandwidth of RGB */
>> +		tmp = mpclk * (bpp / lanes) * 10 / 9;
> 
> Please do this in a separate patch, especially as I would expect some
> sort of explanation on why this is ok to do.
>

Sure! I'll split this out in the new series.

-- 
Best, 
Chaoyi

