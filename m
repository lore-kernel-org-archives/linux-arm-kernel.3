Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C3EC5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 08:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAIbtg6t1nkmAMDBYVOgCCRD8NVdgH1lo/7QZXXpTgs=; b=QKbBg/eD8Yn6uC4x2CR4sD7Cp6
	lOhrCtcL7nlUUo3ByCMquhI2Ocspwt2Qq1MaEQRM/bDeroLNECU3BZE5AAJHwl6URgOFSc0lxyvV+
	KvOWW94jd14qKupS2gyThaPvWl8JABDsc3OzIwu1LQApy6l/XFVAN7vfH21N4uGIrCQ10AtQuCjD/
	iS9qzM26QfzKXP4DcpmZ/evYkNtLdBbtXU0ZExOrMr132GvHCuAjJOnP+JBKslfgiqiF4j4dWkBGA
	w0LZQhXNQIrcT6ec3MzP1iaRAy/gyncTXwG8qeHbFIz3Bc76pRWrkR3tWYXNuaU2yCGaAMcsEKqVK
	v6NsxCjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKWl-0000000CZOO-21Dj;
	Tue, 02 Jun 2026 08:31:11 +0000
Received: from mail-m60171.netease.com ([210.79.60.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKWg-0000000CZN1-3qCs;
	Tue, 02 Jun 2026 08:31:09 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 40bc4550f;
	Tue, 2 Jun 2026 16:31:00 +0800 (GMT+08:00)
Message-ID: <4f4ff085-80ae-4144-b040-be9b136574ee@rock-chips.com>
Date: Tue, 2 Jun 2026 16:30:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] drm/rockchip: dw_dp: Implement out-of-band HPD
 handling
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
References: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
 <20260501-synopsys-dw-dp-improvements-v2-7-d7e7f6bac77f@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260501-synopsys-dw-dp-improvements-v2-7-d7e7f6bac77f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e87751e4e03a7kunm8e11791c2d3216
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQklJVkseS0pITE9KTUtOSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=QfBoCmyEgpoenhswOoF/yKeUbTuxC9EVhGvEaAxRGsfG65iwiUWilCqWRkQMXBJJJRpVEwrSs1M1osaREHDbW7weEXveiQmAc1431woQ92hbOWFgBun80jvoxHNSm4sVE50IyzGNKvhAwX5f3PfPxGXAK/ouRy8shvw1IMoYgS4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=JAIbtg6t1nkmAMDBYVOgCCRD8NVdgH1lo/7QZXXpTgs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_013107_544438_A7A98294 
X-CRM114-Status: GOOD (  11.28  )
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

Hi Sebastian,

On 5/1/2026 6:20 AM, Sebastian Reichel wrote:
> Implement out-of-band hotplug handling, which will be used to receive
> external hotplug information from the USB-C state machine. This is
> currently handled by the USBDP PHY, which brings quite some trouble
> as the register being accessed requires the power-domain from the DP
> controller and also requires custom TypeC HPD info parsing in the
> USBDP PHY driver.
> 
> In contrast to the USBDP PHY this does not just enable the hotplug
> signal when a DP AltMode capable adapter is plugged in, but instead
> properly detects if a cable is plugged in for things like USB-C to
> HDMI adapters.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

[...]

> +static void dw_dp_rockchip_hpd_sw_cfg(void *data, bool hpd)
> +{
> +	struct rockchip_dw_dp *dp = data;
> +	u32 hpd_reg = dp->pdata->hpd_reg[dp->id];
> +
> +	dev_dbg(dp->dev, "Force HPD connected=%s\n", str_yes_no(hpd));
> +
> +	dp->hpd_cfg = hpd;
> +
> +	regmap_write(dp->vo_grf, hpd_reg,
> +		     FIELD_PREP_WM16_CONST(ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG, dp->hpd_cfg));

FIELD_PREP_WM16() should be used here because "dp->hpd_cfg" is not a
constant expression.

Other patches in this series have similar issues. Doesn't your compiler
warn you about this? Thanks.

-- 
Best, 
Chaoyi

