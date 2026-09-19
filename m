Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FE9C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 06:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCvKOOZJlmWGLHZyrsJtjvW3q4jXCw/cfJrFwwwwJvQ=; b=Ajny4b1NvRv+bGTYKtLNz6Hdaa
	KJX7iHPEO3yhrxnlrM+kNTLC70ct3iv22sugKmoh0OOZtmAmBlCY4yKM5idVhRg+QAfdhLxgJS5TJ
	NM8gWRaXii4sVi8BkhRKG2IobMDh1IQ0whtjFS+QJxXDe2NHCqReW6ytqsXN5i5jzHdQXsDd9omgv
	QXN3lrYrKIzNaqgSCovWBzznzwjvaBLF5FviRtNhp1pKAn6JLXa6+2goxTmas3NfJygJDr/nfrt+q
	IIfaWYBreuLNq5K/r17PrLU0C1hYOtm8GslQ8WM6oOslk/+HCGplRARlrs28Zsu3TfuA5+t7IRWYh
	tRYHDoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7owO-0000000G0I0-3jf8;
	Sat, 19 Sep 2026 06:52:52 +0000
Received: from mail-m2426.xmail.ntesmail.com ([45.195.24.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7owL-0000000G0FN-3pgY;
	Sat, 19 Sep 2026 06:52:51 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e5c81ff9;
	Sat, 19 Sep 2026 14:52:38 +0800 (GMT+08:00)
Message-ID: <94451cc1-5dcc-4017-9b17-19fc20245ca8@rock-chips.com>
Date: Sat, 19 Sep 2026 14:52:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/13] drm/mediatek: Implement Display Stream
 Compression support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, jitao.shi@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 justin.yeh@mediatek.com, jason-jh.lin@mediatek.com
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
 <20260916110825.102631-3-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260916110825.102631-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa0b8703e5003a7kunmb39cf7f3fb4f3e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTx4fVk5JGk5CSk9JGBoeSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=IYvLOT+ZLuL17rn47b2fIRKpsfV3Djch3gDimo9Pbn3EhzAdXn+34mKd9GylNsvfzySPs0QIMnHV0WM952ngEQInR2LgNciceaA4c5mn+0TqE6KLXQw4EIIuKoOnuPzINBtI4+nXvALj8t/uyy6tuGhRnHz+zjY0RhIfWYT0Eqc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=yCvKOOZJlmWGLHZyrsJtjvW3q4jXCw/cfJrFwwwwJvQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_235250_515787_F417D241 
X-CRM114-Status: GOOD (  26.77  )
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

Hi,

On 9/16/2026 7:08 PM, AngeloGioacchino Del Regno wrote:
> Add a real driver for the Display Stream Compression (DSC) Display
> Controller IP, implementing support for DSC v1.1 to v1.2.
> 
> In order to do this, it was necessary to remove the basic DSC IP
> bypass setup from mtk_ddp_comp: this functionality is retained in
> the new mtk_disp_dsc driver, which checks if DSC was actually
> requested by other components (with the only one that currently
> supports this being DSI) and, if not, it will set BYPASS mode in
> the DSC IP.
> 
> Like before, the BYPASS mode is set before starting the DSC IP,
> but unlike before, this is being done in the component start
> callback instead of the config one.
> Notably, the config callback is called by mtk_crtc always
> immediately before the calling start callback, so the order of
> register writes is retained.
> The only real difference is that now this is being done through
> CPU writes instead of CMDQ, but since that's called only once
> and since it's just three registers, the performance impact will
> not be minimal and not even measurable.
> 
> As anticipated, DSC handling was also introduced in the mtk_dsi
> driver: when performing dsi_host_attach, the driver now checks
> if the DSI panel adds the DSC configuration structure to the
> mipi_dsi_device structure and, if it does, it will store a
> pointer in the driver-local mtk_dsi structure's `dsc` member.
> 
> The DSI driver will then check whether the DSC configuration
> that comes from the panel is valid (in regard to MediaTek DSI)
> and will call the DRM API's DSC helpers to calculate and set
> all of the const and RC parameters for the actual DSC setup.
> 
> For the time being, even though the latest MediaTek SoCs do
> support DSC v1.2, only DSC v1.1 pre-scr support is implemented
> as an initial contribution (which is rather big, and 1.2 would
> make it even bigger - but that can anyway be implemented later).
> 
> As a last step for validation of DSC parameters in DSI, a check
> for the hdisplay against DSC slice sidth and one for vdisplay
> against DSC slice height was added to the mode_valid callback,
> making sure that H/V are, as expected, multiples of slice W/H.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile       |   1 +
>  drivers/gpu/drm/mediatek/mtk_crtc.c     |  21 ++
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c |  43 +--
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   9 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h |   8 +
>  drivers/gpu/drm/mediatek/mtk_disp_dsc.c | 449 ++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   1 +
>  drivers/gpu/drm/mediatek/mtk_dsi.c      | 151 +++++++-
>  9 files changed, 635 insertions(+), 50 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_dsc.c
> 

[...]

> +
> +	dsc->simple_422 = false;
> +	dsc->convert_rgb = true;
> +	dsc->vbr_enable = false;
> +
> +	drm_dsc_set_const_params(dsc);
> +	drm_dsc_set_rc_buf_thresh(dsc);
> +
> +	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_444);
> +	if (ret) {
> +		dev_err(dev, "Cannot find DSC RC params\n");
> +		return ret;
> +	}
> +

Just out of curiosity, is there a reason the DSC v1.1 rc parameters 
aren't used here?

-- 
Best, 
Chaoyi

