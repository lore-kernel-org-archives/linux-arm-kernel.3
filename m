Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CAAE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yq8GWva/j0oQQ6wM2GBV0ohAe1Be6wj+bUvYwAlOHy4=; b=LET0/Y0ne35eqvDM4Q1i/LNlU7
	63oWPwFGEO7Wmu5PAZQa7QwQyPnGymVskL2ETAPc8jSqnwnmqkn1QAH8MbSNHr0ChO2aj5+ugsNwH
	Xz3AhmLGH+MxKlGlDtztXXO7K7ST5GJmMidevGjSH4GEjXtDrCufzqd7l9WX+hnP5wEgX7JJYSx4N
	vsS2aGAEGdvCCtQFT7aXwPH+9ooWfXEWKzj3Mmrlbd12Z4Dt9qYppzeFQf1Nvmvc7y+8CRtyM5KEw
	jszNTnZXYacBhQwBXDYmMlYoTUg5GoO1foxykRhgOArWRT6QNDR3EEQQ2evbevbYebYvyC+zhdCyh
	hgbRxmbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJB72-0000000Fz1y-3Jcq;
	Thu, 05 Dec 2024 12:37:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJB5h-0000000Fyka-3Aqm;
	Thu, 05 Dec 2024 12:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733402179;
	bh=te7Fq4Bo3HG2cZ3InWv7OJj4fVdLIRE8o0P8loWm+X0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oBL2+fFJd7Uue7s+sKucSheC+bCKoHl/qx4RzhjKclRVRd1npg9MpzC3TgYxh69r0
	 Q3X8VV2vqYcOUMh/KwpnLaCNWRvVmTNlUqIgAbHM0GAtHuazRSnVNDnKYR1xsrSZQR
	 tCf+CpVzMffcpmhxGRcAekrGP6xc1MbNEukU3SoDjLJ2wsosEbLW2x04VlUFWlyqua
	 pmyHaGZGV2UyROHl4NfynSLi4R+o4N2TwDQjusAFI3sIp1v2zZBBALrxsD2xgwQg09
	 8u9QqC6fr9CKERkKZPDZTjAZdMTt07MZYRjrGR5p4lW5UvkHrYPIRz/06bn7qONJRP
	 mDOc4ZokWgniQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 054A617E366D;
	Thu,  5 Dec 2024 13:36:18 +0100 (CET)
Message-ID: <f2862790-f613-4583-bec5-302e06c77d8d@collabora.com>
Date: Thu, 5 Dec 2024 13:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
 <olxtqto5mbgofxg4iqjvsmpxxzz6zoj7pbwmoeklhfjiavqfvv@dyveek7hgtki>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <olxtqto5mbgofxg4iqjvsmpxxzz6zoj7pbwmoeklhfjiavqfvv@dyveek7hgtki>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_043621_965079_4000401E 
X-CRM114-Status: GOOD (  21.63  )
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

Il 05/12/24 13:29, Dmitry Baryshkov ha scritto:
> On Thu, Dec 05, 2024 at 12:45:14PM +0100, AngeloGioacchino Del Regno wrote:
>> In preparation for adding a new driver for the HDMI TX v2 IP,
>> split out the functions that will be common between the already
>> present mtk_hdmi (v1) driver and the new one.
>>
>> Since the probe flow for both drivers is 90% similar, add a common
>> probe function that will be called from each driver's .probe()
>> callback, avoiding lots of code duplication.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/Kconfig           |  11 +-
>>   drivers/gpu/drm/mediatek/Makefile          |   1 +
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c        | 724 +++------------------
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 425 ++++++++++++
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 203 ++++++
>>   5 files changed, 729 insertions(+), 635 deletions(-)
>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
>>
>> @@ -1026,19 +812,12 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
>>   	return 0;
>>   }
>>   
>> -static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
>> +static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd, size_t bufsz_spd,
>> +				    u8 *buffer_avi, size_t bufsz_avi,
>> +				    struct drm_display_mode *mode)
>>   {
>> -	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
>> -
>> -	hdmi->csp = HDMI_COLORSPACE_RGB;
>> -	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
>> -	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
>> -	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
>> -	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
>> -	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
>> -	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
>> -
>> -	return 0;
>> +	mtk_hdmi_setup_avi_infoframe(hdmi, buffer_avi, bufsz_avi, mode);
>> +	mtk_hdmi_setup_spd_infoframe(hdmi, buffer_spd, bufsz_spd, "mediatek", "On-chip HDMI");
> 
> Please use the HDMI Connector framework instead of handling everything
> on your own.
> 

Dmitry, my plan is to get the MediaTek HDMIv2 driver upstreamed *with* using
the HDMI helpers - this commit is only splitting the old HDMI v1 driver in
common parts and v1 handling.

This "handling everything on my own" is something that was already present
into the old v1 driver, I am *not adding* this code, but *moving it around*.

I cannot migrate the v1 driver to the HDMI helpers right now because in this
moment I have no way to test that and I don't want to break any functionality.

If you check patch 15, you'll see that I am indeed using all of the helper
goodies - but for now only on the new driver, and not on the old one.

I do plan to migrate the v1 driver to the new helpers as well, but I would
(please) really prefer to do that only after the v2 driver is upstreamed.

Is that okay for you?

Cheers,
Angelo

>>   }
>>   
>>   static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)
> 




