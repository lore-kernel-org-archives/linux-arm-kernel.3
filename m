Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA01C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6e2O83xXO73NCOPTb5tKbtGqAAMzCLcAq/J1uQu/Lg=; b=ckrkFpkdtrwVQzQmy2SQF5TzfF
	lxCRxOpQmDwhSuKiIscZfzj7CXP24qKnkiouj8Bg3jiR++ofAvTLbik2guJxOFfD/f+mRmg39MwQS
	H4d+mY9OzQwqOXXNGKp65C8ty9jzZN8KhVf76dQ7gXDRLZjJRWqwawwXe7VqkyQ0yTTCmsIFGq8e0
	E/F68kaUTRDmc39CEAKgRAJcEdFTvRAaqntev6BMTG5Nc5JzBkOgXDkbm+5mMkWEb0q/WIvVEb0vq
	Fhz79dUSzP1KdG+wMDB+ljE9mcZC6ZwbJKHsqIw1WEvpQECzH8sRoFwTdoMeU99OT8FqgrCRz5PiY
	ovFoGt/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSO3-0000000HJzi-0cFa;
	Mon, 10 Feb 2025 11:55:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thSDF-0000000HHPq-3rZA;
	Mon, 10 Feb 2025 11:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739187868;
	bh=Uxj3j902irE5mB9g0HpLqhRIezxhsErLRfVa7qx/A3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ddRQ6ASLVKzePQskZvnHHKet3LeoRiI2+q2NjrE8c6D6+nzRQB0x2uIVfqxhUM/J2
	 hE0hVlY9PPJKqUK8ya8V4kuFX+LOR6TCTOUtK5n9+0IVFyJ3fjbFaT/tnnjCMZmznO
	 gFi2OvQLC5NrOVzqbAS8d2VlQ0lpk5OkqWyy9cxnfT0QTYAY46tlloVVcBtdP8C9F5
	 pPYF9roVpg4d5z1Qlf3jUz6ilDpHDgwvYJuoESaIgW0T4lDA2VahEDl0HAzKDfPGGM
	 XrKkEiK7TfHH1396pTvSKspQUtomvny/JobjSjrIDS+YpW5tU+FPR8oE5lC0lsCg4R
	 Lxj3l8YBJz+mw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A35617E0CA2;
	Mon, 10 Feb 2025 12:44:27 +0100 (CET)
Message-ID: <59f611c5-1dcf-4667-bb34-c7f57b341f49@collabora.com>
Date: Mon, 10 Feb 2025 12:44:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/34] drm/mediatek: mtk_hdmi: Move CEC device parsing
 in new function
To: Alexandre Mergnat <amergnat@baylibre.com>, chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-22-angelogioacchino.delregno@collabora.com>
 <18fd9544-f9ef-4f58-9a8a-026737c26b94@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <18fd9544-f9ef-4f58-9a8a-026737c26b94@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_034430_108356_A8976111 
X-CRM114-Status: GOOD (  25.65  )
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

Il 07/02/25 15:45, Alexandre Mergnat ha scritto:
> 
> 
> On 13/01/2025 15:52, AngeloGioacchino Del Regno wrote:
>> Move the CEC device parsing logic to a new function called
>> mtk_hdmi_get_cec_dev(), and move the parsing action to the end
>> of mtk_hdmi_dt_parse_pdata(), allowing to remove gotos in this
>> function, reducing code size and improving readability.
> 
> Why CEC device parsing logic isn't done mtk_cec.c driver ? Then add 
> "mtk_cec_get_dev" function to mtk_cec.c too. Finally, call this new function in 
> mtk_hdmi_probe after mtk_hdmi_dt_parse_pdata().
> 
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 84 ++++++++++++++---------------
>>   1 file changed, 40 insertions(+), 44 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/ 
>> mtk_hdmi.c
>> index 48c37294dcbb..eb285ec394a3 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -1367,24 +1367,16 @@ static const struct drm_bridge_funcs 
>> mtk_hdmi_bridge_funcs = {
>>       .edid_read = mtk_hdmi_bridge_edid_read,
>>   };
>> -static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>> -                   struct platform_device *pdev)
>> +static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, 
>> struct device_node *np)
>>   {
>> -    struct device *dev = &pdev->dev;
>> -    struct device_node *np = dev->of_node;
>> -    struct device_node *remote, *i2c_np;
>>       struct platform_device *cec_pdev;
>> -    struct regmap *regmap;
>> +    struct device_node *cec_np;
>>       int ret;
>> -    ret = mtk_hdmi_get_all_clk(hdmi, np);
>> -    if (ret)
>> -        return dev_err_probe(dev, ret, "Failed to get clocks\n");
>> -
>>       /* The CEC module handles HDMI hotplug detection */
>>       cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
> 
> If it's done in mtk_cec.c, the hardcoded compatible string method will be replaced 
> by of_match_table (mtk_cec_of_ids), which is scalable and consistent.
> 

That's true, yes, but the CEC driver is not supposed to be in drivers/drm/mediatek
in the first place - that should be partially refactored and moved to where the CEC
drivers belong: drivers/media/cec/platform/mediatek/

This is something that is currently in the process of making here, as the CEC v2
driver will be added there, and the CECv1 driver will be moved along side of the
new one, making things finally correct.

Of course, this code will be retained to keep retrocompatibility with older device
trees, and if I move it to mtk_cec, I will have to move it back here after the
CEC driver is moved to the correct location.

For the reasons explained above, I disagree about moving this code to the CEC
driver.

Cheers,
Angelo

>>       if (!cec_np)
>> -        return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
>> +        return dev_err_probe(dev, -ENOTSUPP, "Failed to find CEC node\n");
>>       cec_pdev = of_find_device_by_node(cec_np);
>>       if (!cec_pdev) {
>> @@ -1393,65 +1385,69 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>>           return -EPROBE_DEFER;
>>       }
>>       of_node_put(cec_np);
>> -    hdmi->cec_dev = &cec_pdev->dev;
>>       /*
>>        * The mediatek,syscon-hdmi property contains a phandle link to the
>>        * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
>>        * registers it contains.
>>        */
>> -    regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
>> -    ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1,
>> -                     &hdmi->sys_offset);
>> -    if (IS_ERR(regmap))
>> -        ret = PTR_ERR(regmap);
>> -    if (ret) {
>> -        dev_err_probe(dev, ret,
>> -                  "Failed to get system configuration registers\n");
>> -        goto put_device;
>> -    }
>> -    hdmi->sys_regmap = regmap;
>> +    hdmi->sys_regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
>> +    if (IS_ERR(hdmi->sys_regmap))
>> +        return PTR_ERR(hdmi->sys_regmap);
>> +
>> +    ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1, &hdmi- 
>> >sys_offset);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret,
>> +                     "Failed to get system configuration registers\n");
>> +
>> +    hdmi->cec_dev = &cec_pdev->dev;
>> +    return 0;
>> +}
>> +
>> +static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>> +                   struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct device_node *np = dev->of_node;
>> +    struct device_node *remote, *i2c_np;
>> +    int ret;
>> +
>> +    ret = mtk_hdmi_get_all_clk(hdmi, np);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "Failed to get clocks\n");
>>       hdmi->regs = device_node_to_regmap(dev->of_node);
>> -    if (IS_ERR(hdmi->regs)) {
>> -        ret = PTR_ERR(hdmi->regs);
>> -        goto put_device;
>> -    }
>> +    if (IS_ERR(hdmi->regs))
>> +        return PTR_ERR(hdmi->regs);
>>       remote = of_graph_get_remote_node(np, 1, 0);
>> -    if (!remote) {
>> -        ret = -EINVAL;
>> -        goto put_device;
>> -    }
>> +    if (!remote)
>> +        return -EINVAL;
>>       if (!of_device_is_compatible(remote, "hdmi-connector")) {
>>           hdmi->next_bridge = of_drm_find_bridge(remote);
>>           if (!hdmi->next_bridge) {
>>               dev_err(dev, "Waiting for external bridge\n");
>>               of_node_put(remote);
>> -            ret = -EPROBE_DEFER;
>> -            goto put_device;
>> +            return -EPROBE_DEFER;
>>           }
>>       }
>>       i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
>>       of_node_put(remote);
>> -    if (!i2c_np) {
>> -        ret = dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
>> -        goto put_device;
>> -    }
>> +    if (!i2c_np)
>> +        return dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
>>       hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
>>       of_node_put(i2c_np);
>> -    if (!hdmi->ddc_adpt) {
>> -        ret = dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by 
>> node\n");
>> -        goto put_device;
>> -    }
>> +    if (!hdmi->ddc_adpt)
>> +        return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by 
>> node\n");
>> +
>> +    ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
>> +    if (ret)
>> +        return ret;
>>       return 0;
>> -put_device:
>> -    put_device(hdmi->cec_dev);
>> -    return ret;
>>   }
>>   /*
> 


