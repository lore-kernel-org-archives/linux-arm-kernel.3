Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3F2C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jE+eIzcQ8oQ4HV8nw3uP9cmcpgngx1xK2AKLODCmwbg=; b=S+NAFQKhXCc1YK88eJjm8Fn5wo
	AhXw/GuWemc+X2ykEFRttQRWSaolMmW7PGLEE8DcaLROZAnkgqQ5r7d/8nLaOXXI9+OWbagSB5Uy+
	JoKSktDsFGjs5vx6gVryrK9SpTCABNrktn4hf+8RJ9RIb5bfNw6mVtiGFKME/ZVh71l3DxmmA5HO+
	CxTqCHKBVUyUQzmbmvcvO3H390FEXuF7IJI5n9tlj1XbzyWs0FL6dRUZh9jxOfbOY2Ykb7u1tn0hf
	uD8wZT5/DiszRhxiyhWkvV1pn2+zRTWoQ5k3z965Y5mwrKjTB7TteRbyTKOFolIwvBtnwIiNhNUiD
	9DI33Pzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8auY-00000001cpl-05VL;
	Mon, 21 Sep 2026 10:06:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8auS-00000001cna-1tpg;
	Mon, 21 Sep 2026 10:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789985161;
	bh=cDVOUqRmDAiIlq1x0W5Pvyz6PeI3fBgskd+Ma0ilQKo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A3pfzR/dCqrz8smbfXkXbFTaPcptGDfypqJU0/vWlqaFXv6he4RZgFT2s1gI4WHJD
	 wnsm/w/bm4cf/OeQ5iGHeKsxop9OmaKwEk4DZSFWhR41obr1W9Q07t/Fhla4sa2KEo
	 rZnlnUNakg4PvHKtYLdwwHYiVAZ/FWjTBaVVkzdqqSjzjwtTpMPmSMn+ULiGk4PJFA
	 3Yg/py1RSSE+qxIaNb4EJFtx9TGzAGtSqqfSHFORXNQi1k7h7bLkp5b5veC22bHsoW
	 fQZFTnrMgQa9NJODZqU7bEF1cFC4Ay1PfltiJIBmiwucz+NCWMz6oTIgZxOF9fLomF
	 FESu3L+VMYGPw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 49EA117E020C;
	Mon, 21 Sep 2026 12:06:00 +0200 (CEST)
Message-ID: <a657522a-30b3-491c-8f1c-9d09e3bbe176@collabora.com>
Date: Mon, 21 Sep 2026 12:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/13] drm/mediatek: Implement Display Stream
 Compression support
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, jitao.shi@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 justin.yeh@mediatek.com, jason-jh.lin@mediatek.com,
 Nikolai Burov <nikolai.burov@jolla.com>
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
 <20260916110825.102631-3-angelogioacchino.delregno@collabora.com>
 <94451cc1-5dcc-4017-9b17-19fc20245ca8@rock-chips.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <94451cc1-5dcc-4017-9b17-19fc20245ca8@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_030604_670948_0AAA991E 
X-CRM114-Status: GOOD (  28.22  )
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

On 9/19/26 08:52, Chaoyi Chen wrote:
> Hi,
> 
> On 9/16/2026 7:08 PM, AngeloGioacchino Del Regno wrote:
>> Add a real driver for the Display Stream Compression (DSC) Display
>> Controller IP, implementing support for DSC v1.1 to v1.2.
>>
>> In order to do this, it was necessary to remove the basic DSC IP
>> bypass setup from mtk_ddp_comp: this functionality is retained in
>> the new mtk_disp_dsc driver, which checks if DSC was actually
>> requested by other components (with the only one that currently
>> supports this being DSI) and, if not, it will set BYPASS mode in
>> the DSC IP.
>>
>> Like before, the BYPASS mode is set before starting the DSC IP,
>> but unlike before, this is being done in the component start
>> callback instead of the config one.
>> Notably, the config callback is called by mtk_crtc always
>> immediately before the calling start callback, so the order of
>> register writes is retained.
>> The only real difference is that now this is being done through
>> CPU writes instead of CMDQ, but since that's called only once
>> and since it's just three registers, the performance impact will
>> not be minimal and not even measurable.
>>
>> As anticipated, DSC handling was also introduced in the mtk_dsi
>> driver: when performing dsi_host_attach, the driver now checks
>> if the DSI panel adds the DSC configuration structure to the
>> mipi_dsi_device structure and, if it does, it will store a
>> pointer in the driver-local mtk_dsi structure's `dsc` member.
>>
>> The DSI driver will then check whether the DSC configuration
>> that comes from the panel is valid (in regard to MediaTek DSI)
>> and will call the DRM API's DSC helpers to calculate and set
>> all of the const and RC parameters for the actual DSC setup.
>>
>> For the time being, even though the latest MediaTek SoCs do
>> support DSC v1.2, only DSC v1.1 pre-scr support is implemented
>> as an initial contribution (which is rather big, and 1.2 would
>> make it even bigger - but that can anyway be implemented later).
>>
>> As a last step for validation of DSC parameters in DSI, a check
>> for the hdisplay against DSC slice sidth and one for vdisplay
>> against DSC slice height was added to the mode_valid callback,
>> making sure that H/V are, as expected, multiples of slice W/H.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/Makefile       |   1 +
>>   drivers/gpu/drm/mediatek/mtk_crtc.c     |  21 ++
>>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c |  43 +--
>>   drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   9 +
>>   drivers/gpu/drm/mediatek/mtk_disp_drv.h |   8 +
>>   drivers/gpu/drm/mediatek/mtk_disp_dsc.c | 449 ++++++++++++++++++++++++
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c  |   2 +
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   1 +
>>   drivers/gpu/drm/mediatek/mtk_dsi.c      | 151 +++++++-
>>   9 files changed, 635 insertions(+), 50 deletions(-)
>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_dsc.c
>>
> 
> [...]
> 
>> +
>> +	dsc->simple_422 = false;
>> +	dsc->convert_rgb = true;
>> +	dsc->vbr_enable = false;
>> +
>> +	drm_dsc_set_const_params(dsc);
>> +	drm_dsc_set_rc_buf_thresh(dsc);
>> +
>> +	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_444);
>> +	if (ret) {
>> +		dev_err(dev, "Cannot find DSC RC params\n");
>> +		return ret;
>> +	}
>> +
> 
> Just out of curiosity, is there a reason the DSC v1.1 rc parameters
> aren't used here?
> 

I was using the v1.1 RC parameters before, but Nikolai found out that some panels
actually require that, even when v1.2 support is not declared.

Besides, he also validated that v1.2 works for him, and works for me as well, so
I opted to use those ones instead, as the v1.1 pre_scr params were working for me
but not for him.

This will be improved in the future, as choosing any of the two will leave us with
something working and something broken... but I plan to make those improvements
only after at least this basic support finds his way upstream.

Cheers,
Angelo

