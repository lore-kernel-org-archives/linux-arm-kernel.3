Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CB9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 11:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4IlcUWxsBK99tkFDt+EwbEGgFcki2T86lZTSUVVIHWQ=; b=j3tIguZr3Z/32Lh1trtklPyBqA
	YhLi4jNYU0RhMJKGZ0961nC99EiPjhGFPKv3AjrJ92jEe2yjNPd257+n6YvuxFmGC8bpcqLHLIHso
	EsClz9wVMtFU0e51p5vOEBLNZLIHAn+yyG6Mgtgairfcyuoxa48EAl45p/u79tAJU51vBX2fXDax9
	UFX7hQqAudxnR/v9o11PnRYNciQFWpyQV+gmKn3JHQ0JyY1rxggi5N90nibWOmotW8lCTyNUmxRUf
	jmeih5v52aQKKUSBwvVbreHRwcWeVACzxlFZAJQvEMgc+OvTxNt1rVFI4yHgMwqRy2yZfBzMxynZN
	mLTH8vTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnfg-00000007ucP-1yXV;
	Sat, 22 Feb 2025 11:27:48 +0000
Received: from mail-m32109.qiye.163.com ([220.197.32.109])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlndo-00000007uOX-0eP8;
	Sat, 22 Feb 2025 11:25:53 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id bdb51f7f;
	Sat, 22 Feb 2025 19:25:41 +0800 (GMT+08:00)
Message-ID: <799ccbd2-0c3b-4a55-b47e-1899975c4020@rock-chips.com>
Date: Sat, 22 Feb 2025 19:25:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v6 08/14] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-9-damon.ding@rock-chips.com>
 <3340006.44csPzL39Z@diego>
Content-Language: en-US
In-Reply-To: <3340006.44csPzL39Z@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQktJTlZCTR8fSEgaTx5MHh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a952d67f14803a3kunmbdb51f7f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NhQ6Agw6HDIKER8cNz4OTxY2
	SFEaFA5VSlVKTE9LSUlITk9ISktIVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKQ0pPNwY+
DKIM-Signature: a=rsa-sha256;
	b=ENxxpIdc+fRY3imBB4Fvef5vOGZG6fA5wJ7ZQJ3/Q4CHHOsDZlC+5/w3k4E3rp5BOTyNBD/acHQvH9bxtM6Ew6mLSBkk31732mwP2INmd+pp5ON4Wv4pZ1/ZSYTKU/EsXsoRaBhyh7otaP6W3DmyJLjc4G1myUF7V4vX7iQqVTg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=4IlcUWxsBK99tkFDt+EwbEGgFcki2T86lZTSUVVIHWQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_032552_383579_8358CBF2 
X-CRM114-Status: GOOD (  14.18  )
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

On 2025/1/31 4:33, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Donnerstag, 23. Januar 2025, 11:07:41 MEZ schrieb Damon Ding:
>> Move drm_of_find_panel_or_bridge() a little later and combine it with
>> component_add() into a new function rockchip_dp_link_panel(). The function
>> will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
>> aiding to support for obtaining the eDP panel via the DP AUX bus.
>>
>> If failed to get the panel from the DP AUX bus, it will then try the other
>> way to get panel information through the platform bus.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
> 
>> @@ -450,9 +461,17 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>>   	if (IS_ERR(dp->adp))
>>   		return PTR_ERR(dp->adp);
>>   
>> -	ret = component_add(dev, &rockchip_dp_component_ops);
>> -	if (ret)
>> -		return ret;
>> +	ret = devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp), rockchip_dp_link_panel);
> 
> This causes an undefined-reference error, so you probably need something like:
> 
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> index f9cbbb40b36f..fa946a809858 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -8,6 +8,7 @@ config DRM_ROCKCHIP
>          select DRM_PANEL
>          select VIDEOMODE_HELPERS
>          select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
> +       select DRM_DISPLAY_DP_AUX_BUS if ROCKCHIP_ANALOGIX_DP
>          select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
>          select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
>          select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
> 
> 
> 
> 
> 

Yeah, I will add a new separate commit to do it in the next version.

Best regards
Damon


