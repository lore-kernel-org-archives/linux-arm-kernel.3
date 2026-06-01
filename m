Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF89DCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 10:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4erhXhxolnnqphWTttWW2Y4zr5sdcM4XBJBGs4a57V8=; b=wCPnSBC45VUrgALKqGCyjZRSuQ
	yUmzFZFLIVmEe28lsNELS5gqWcX3P3xSfhEm8a5Iw8YN8FJoHIHmOSkErP9K9Fg1JOZvL40ey+FMX
	idtUONcL8s4cbYDJewqTHznJJuHxDDr0phw+fIVbn+D/Ej0b+5Tgcm525H47+Pur3UpHePeX/5BTe
	Ii1Iv+KHbc91AVZmEz5IkmgQZ6EiF0hJ7kPxmUNC+QP43yc1Wd7dh9I13Ks4BC0auRSCULH47424m
	JHdbmlL7X4D37TRSHp26xA44yttEgERNqA0FBuqLATT2Vf05lFtn+GgD+2sYpW5NA/JlKPJXlODCI
	ctqqIWbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0FH-0000000AfU0-2DTM;
	Mon, 01 Jun 2026 10:51:47 +0000
Received: from mail-m49201.qiye.163.com ([45.254.49.201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0FE-0000000AfSp-3XcS;
	Mon, 01 Jun 2026 10:51:46 +0000
Received: from [172.16.12.77] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 409783698;
	Mon, 1 Jun 2026 18:46:41 +0800 (GMT+08:00)
Message-ID: <71b11cb4-9c9c-4875-a48f-98cb0e3e0517@rock-chips.com>
Date: Mon, 1 Jun 2026 18:46:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/rockchip: vop2: Drop redundant zero-init in
 setup_layer_mixer()
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260504-vop2-layer-cfg-tmout-v1-0-730226a7331e@collabora.com>
 <20260504-vop2-layer-cfg-tmout-v1-4-730226a7331e@collabora.com>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20260504-vop2-layer-cfg-tmout-v1-4-730226a7331e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e82cafc6109d8kunm2db9e1ee38d185
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSU5DVk9MQ0kYGE4YSBgfSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Xr8G+B54eBQ9FXoDUYlHPIa6DdsjWDxLSkMD/pKLRF6rV+zF6Ax+Y/aClKKK0WwRf3l/eR49as8L4LLYG//fERlL4WJI3KHvReiVuY2neI4EptM4kzvxMzQyEu09lxoTvznKWSnkciEAyFZyhV4c1Rp38e7sbOSAtKvXA5iP0Wo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=4erhXhxolnnqphWTttWW2Y4zr5sdcM4XBJBGs4a57V8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_035145_050076_C2B20D35 
X-CRM114-Status: GOOD (  11.55  )
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

On 5/5/26 02:24, Cristian Ciocaltea wrote:
> The layer_sel and atv_layer_sel local variables in
> rk3568_vop2_setup_layer_mixer() are unconditionally assigned from
> vop2->old_layer_sel and the RK3568_OVL_LAYER_SEL register read,
> respectively, before any use.
> 
> Remove the superfluous zero-initializers.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
   
    Reviewed-by: Andy Yan <andy.yan@rock-chips.com>


> ---
>   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 1f5e8c2acecd..0849bd922ffb 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -2134,9 +2134,9 @@ static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
>   {
>   	struct vop2 *vop2 = vp->vop2;
>   	struct drm_plane *plane;
> -	u32 layer_sel = 0;
> +	u32 layer_sel;
>   	u32 port_sel;
> -	u32 atv_layer_sel = 0;
> +	u32 atv_layer_sel;
>   	u8 layer_id;
>   	u8 old_layer_id;
>   	u8 layer_sel_id;
> 


