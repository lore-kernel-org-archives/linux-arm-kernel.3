Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4B8CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 10:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ruVGsuPQy0eatTFKb5OBeOFRqUGuVR1RYE/wDl/f+Y=; b=kLlnJix34DGQFKe17t4YVzTjAs
	O8OXVhkPJ+pBgh/7uaafTTh87UASdLLlNAb1YVNbCHugvFlPhRBrskwFH6vFBxXGBoSvjOTl00Epe
	EEu+V6FgyZxaZsgmHDcX5ExcF/tZCQFFh0KxLNMGqlDc41YVnaJzwL65VeT/LsjrPNiWiTxmUpTax
	/wkFpV+KVyADz4lpDImKG1dYycWKW1Wz4ukdSIqJDlvD4wvLQGBHVZL7T02pIjNHMHBse9m4VVMMp
	5382fgMqAQx9pWyJjo8Kkebv/WoKtsXFSKeFitAT3upFoaCkxymuruDL9h70/WThc5yxZqzsijWqf
	bBSc4vlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTdOV-00000009UMt-3Lur;
	Sun, 31 May 2026 10:27:47 +0000
Received: from mail-m128136.netease.com ([103.209.128.136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTdOQ-00000009UKU-3Ags;
	Sun, 31 May 2026 10:27:46 +0000
Received: from [172.16.12.77] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 407772abc;
	Sun, 31 May 2026 18:27:27 +0800 (GMT+08:00)
Message-ID: <9dc8e781-d03b-481b-808c-93b4855aa14c@rock-chips.com>
Date: Sun, 31 May 2026 18:27:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/bridge: synopsys: dw-dp: Support unregistering
 the AUX channel
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260327-drm-rk-fixes-v3-0-fd2e6900c08c@collabora.com>
 <20260327-drm-rk-fixes-v3-1-fd2e6900c08c@collabora.com>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20260327-drm-rk-fixes-v3-1-fd2e6900c08c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e7d93036509d8kunm8afc72a22c895f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSUxCVkpNGRhNTB4eThlCGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZIq/YCVtOl35D1xQ8MzmffgcSCqU8+cY9Hu2qI8SbIw+XMakCpttBw0OFii0+PJHSNz8m8krVqk6aGlgYvRrjvC7iGSaNGsh4uVmMBf/cIGxuIvU4pSdx3NRPDEgJjsbuPLXQ5QUW9KSSLfg3tkWJwIT6Q51cpnBX0sbYGmX9B4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=+ruVGsuPQy0eatTFKb5OBeOFRqUGuVR1RYE/wDl/f+Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_032743_383703_0175E75E 
X-CRM114-Status: GOOD (  13.40  )
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

Hello,

On 3/27/26 08:55, Cristian Ciocaltea wrote:
> The DisplayPort AUX channel gets initialized and registered during
> dw_dp_bind(), but it is never unregistered, which may lead to resource
> leaks and/or use-after-free.
> 
> Add the missing dw_dp_unbind() function to allow the users of the
> library to handle the required cleanup, i.e. unregister the AUX adapter.
> 
> Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

    Reviewed-by: Andy Yan <andy.yan@rock-chips.com>

Thanks.
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-dp.c | 6 ++++++
>   include/drm/bridge/dw_dp.h              | 1 +
>   2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> index 3f4530c117c7..6211ba6ba7bd 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -2093,6 +2093,12 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
>   }
>   EXPORT_SYMBOL_GPL(dw_dp_bind);
>   
> +void dw_dp_unbind(struct dw_dp *dp)
> +{
> +	drm_dp_aux_unregister(&dp->aux);
> +}
> +EXPORT_SYMBOL_GPL(dw_dp_unbind);
> +
>   MODULE_AUTHOR("Andy Yan <andyshrk@163.com>");
>   MODULE_DESCRIPTION("DW DP Core Library");
>   MODULE_LICENSE("GPL");
> diff --git a/include/drm/bridge/dw_dp.h b/include/drm/bridge/dw_dp.h
> index 25363541e69d..22105c3e8e4d 100644
> --- a/include/drm/bridge/dw_dp.h
> +++ b/include/drm/bridge/dw_dp.h
> @@ -24,4 +24,5 @@ struct dw_dp_plat_data {
>   
>   struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
>   			 const struct dw_dp_plat_data *plat_data);
> +void dw_dp_unbind(struct dw_dp *dp);
>   #endif /* __DW_DP__ */
> 


