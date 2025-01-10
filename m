Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A627FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxsSP/VD9Lx0NclgfZYbaTy2AGtF2Qp2aXxhwUyl1us=; b=dPEYVt27jL+vb8bPVXLtiHe1UV
	1CTigFlIhG9U3AaVkmQeCFs2ntVOKivDNdMQS0AI9h3sLU8/WsVq5TEItmS+Bt2UuPyPJHqOmNIMf
	uf7PS/v/hg7K46GiGUGJCZmTlaRYntutrQhDAYSmaigX3KPt7OtoFARLicrhKLloa//QikzqiRFLX
	efCdQB9PaalV93pcg1a+BPEKk1DAgDZ8VBliYW5nz7pgu8S4AootM65XN+V77SVCdE1zuWJ7Zb3fN
	ept4QPQ9x23RSydbbZIZeXaQzkXANhEhRIYhaMab77tskye429jXJx0pBuIX7wrysBVycMtzoZPql
	djH/foRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCEo-0000000EwlD-2MUw;
	Fri, 10 Jan 2025 10:27:34 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWC0C-0000000EtpP-3ShV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 10:12:30 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1424400f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 02:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736503947; x=1737108747; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxsSP/VD9Lx0NclgfZYbaTy2AGtF2Qp2aXxhwUyl1us=;
        b=T1kuwoJhr4CEDhRmWelynqA/kA2j4APYdOenIXhJLihqn71lllFPDAWmHlU8oQ+niY
         sh1mjh/nKEzmtcaKB9bQMJMSiwv4FHvAJ7FYrpnKUOgJHhH7s2HsuZUvbV1/2FfV9x/G
         TD6hTLU5zyr6CSfiLpwrwaMnDFa5SLuhfImYKnVv+El1zZs07JZuaXeILOSkQmlLs9y/
         DtYHYCB/N8hS3SNN5S97sZquu22k5WAkDMMBZEoxmeZ48zNn+N4HSerVnD/zxRT4P71A
         m3Q0umNnZ/grcNVYCdcW0wPwdjuN2vHAcSELqSDQBY9urJyKbqEiYV2oGaBLim1+FoKK
         vm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736503947; x=1737108747;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AxsSP/VD9Lx0NclgfZYbaTy2AGtF2Qp2aXxhwUyl1us=;
        b=V5mOnvSSsBx9/sGmob6fixTskWHXZQXEXbiAXbrrzq5xkHZxLCvMjKSA3Xb6Jt8gHE
         oBAVsckfrFuhMYyTPxLrtnGjsaCetAXGmvu0MOBGnkMaGUiI8oHsjR7tq6TyGf4aPVsX
         VPgo3OrM3beCa6+ggSIbjughxZLWvSC8l+otfeS3JUtgrbSSTb5WTQ+ewHYbvskYYi7w
         7+N4iablSJaiXblKl/ObREYm9TOQsGL7AuwWuxB21E7QPa5Y0ZvXvva3oBGb3NeFsNJH
         5IhFiWqv5sCw1/fJ+f1YDJZbcWrmucU9XEYmosJlyXNpKr5stRVeOHRooomwhKtaRegb
         mQLA==
X-Forwarded-Encrypted: i=1; AJvYcCXWmH9aUYL0AJ0Ri/+Ij1P4bW0ySHXr2uXbxXEjQdy4+ISX8wpIMX7Bv5QNUEK8MY/bYLiDBWqhAJVzJRlUiQBD@lists.infradead.org
X-Gm-Message-State: AOJu0YwaonmqpL2RQvvtiZrkaN/XHLcJJQuQrpG17+2iGLMpeWqab6WT
	mzToLRFRrXcpPOXj/Akif3YsPvXGGm8Jo0EYA9ylqctRxUuCKlXuaF6kACtPky4=
X-Gm-Gg: ASbGncu8WMPReuPjMqinYCJMcGKEAw1wtfVLjzlOZINxRWWx8euz2WbH8XSTPCumc+K
	Oy7/xbmH6HiP6JfBx1zcnNCuz6GsIFrAUaUzecsqWRo9AfC6Yzsb+1+hWFO0WB/I/dZ45jxYyGW
	ZyarPKD1l0jk9EsxxzewWgfQwZ/bvx7RW7dTe5ZdAghhKhSWGTxRt1LVeYSxgAkDHxL/mITOX2G
	AE78JhoD7WjJU+kIWLhnzQ/rXG6escDwDn7w5z8kPV3MDd2vFGM6F4UsHlL94aPXuAT1lufQkW+
	gIWjYcUwRBJJIi6YslBeYKQGdqcnM9UsoQ==
X-Google-Smtp-Source: AGHT+IEhpHVfYVyL4YwlDVVV7UwQb/jHB96RGA1jR1WVLjzbic871pTiOLZF+y0TWn8ytoY3VVuwnQ==
X-Received: by 2002:a5d:5f85:0:b0:386:3213:5b9b with SMTP id ffacd0b85a97d-38a8732c132mr10291514f8f.43.1736503947265;
        Fri, 10 Jan 2025 02:12:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8? ([2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38428bsm4156433f8f.37.2025.01.10.02.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 02:12:26 -0800 (PST)
Message-ID: <0560bac7-ce4f-4b76-a6af-37ee4747dce9@linaro.org>
Date: Fri, 10 Jan 2025 11:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
To: Maxime Ripard <mripard@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110074458.3624094-1-christianshewitt@gmail.com>
 <20250110074458.3624094-3-christianshewitt@gmail.com>
 <20250110-flat-quantum-frigatebird-2432f1@houat>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250110-flat-quantum-frigatebird-2432f1@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_021228_876384_E7387D0F 
X-CRM114-Status: GOOD (  20.12  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 10/01/2025 09:36, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Jan 10, 2025 at 07:44:58AM +0000, Christian Hewitt wrote:
>> Playing YUV420 @ 59.94 media causes HDMI output to lose sync
>> with a fatal error reported:
>>
>> [   89.610280] Fatal Error, invalid HDMI vclk freq 593406
>>
>> In meson_encoder_hdmi_set_vclk the initial vclk_freq value is
>> 593407 but YUV420 modes halve the value to 296703.5 and this
>> is stored as int which loses precision by rounding down to
>> 296703. The rounded value is later doubled to 593406 and then
>> meson_encoder_hdmi_set_vclk sets an invalid vclk_freq value
>> and the error triggers during meson_vlkc_setup validation.
>>
>> Fix precision in meson_encoder_hdmi_set_vclk by switching to
>> unsigned long long KHz values instead of int MHz. As values
>> for phy_freq are now more accurate we also need to handle an
>> additional match scenario in meson_vclk_setup.
>>
>> Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> ---
>>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 42 +++++++++++-----------
>>   drivers/gpu/drm/meson/meson_vclk.c         |  3 +-
>>   2 files changed, 23 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> index 0593a1cde906..fa37cf975992 100644
>> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> @@ -70,12 +70,12 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>>   {
>>   	struct meson_drm *priv = encoder_hdmi->priv;
>>   	int vic = drm_match_cea_mode(mode);
>> -	unsigned int phy_freq;
>> -	unsigned int vclk_freq;
>> -	unsigned int venc_freq;
>> -	unsigned int hdmi_freq;
>> +	unsigned long long vclk_freq;
>> +	unsigned long long phy_freq;
>> +	unsigned long long venc_freq;
>> +	unsigned long long hdmi_freq;
>>   
>> -	vclk_freq = mode->clock;
>> +	vclk_freq = mode->clock * 1000ULL;
> 
> You should be using drm_hdmi_compute_mode_clock() here

Yes in a second time, this simply fixes the actual calculations so it can be
backported to stable kernel to make the feature work again.

And yes at some point we should switch to hdmi helpers in a separate forward
changeset.

Neil

> 
> 
> 
>>   	/* For 420, pixel clock is half unlike venc clock */
>>   	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
>> @@ -85,8 +85,9 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>>   	phy_freq = vclk_freq * 10;
>>   
>>   	if (!vic) {
>> -		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq,
>> -				 vclk_freq, vclk_freq, vclk_freq, false);
>> +		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq / 1000ULL,
>> +				 vclk_freq / 1000ULL, vclk_freq / 1000ULL,
>> +				 vclk_freq / 1000ULL, false);
>>   		return;
>>   	}
>>   
>> @@ -107,12 +108,9 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>>   	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>>   		venc_freq /= 2;
>>   
>> -	dev_dbg(priv->dev, "vclk:%d phy=%d venc=%d hdmi=%d enci=%d\n",
>> -		phy_freq, vclk_freq, venc_freq, hdmi_freq,
>> -		priv->venc.hdmi_use_enci);
>> -
>> -	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq, vclk_freq,
>> -			 venc_freq, hdmi_freq, priv->venc.hdmi_use_enci);
>> +	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq / 1000ULL,
>> +			 vclk_freq / 1000ULL, venc_freq / 1000ULL, hdmi_freq / 1000ULL,
>> +			 priv->venc.hdmi_use_enci);
>>   }
>>   
>>   static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bridge,
>> @@ -122,10 +120,10 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
>>   	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
>>   	struct meson_drm *priv = encoder_hdmi->priv;
>>   	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
>> -	unsigned int phy_freq;
>> -	unsigned int vclk_freq;
>> -	unsigned int venc_freq;
>> -	unsigned int hdmi_freq;
>> +	unsigned long long vclk_freq;
>> +	unsigned long long phy_freq;
>> +	unsigned long long venc_freq;
>> +	unsigned long long hdmi_freq;
>>   	int vic = drm_match_cea_mode(mode);
>>   	enum drm_mode_status status;
>>   
>> @@ -149,7 +147,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
>>   	} else if (!meson_venc_hdmi_supported_vic(vic))
>>   		return MODE_BAD;
>>   
>> -	vclk_freq = mode->clock;
>> +	vclk_freq = mode->clock * 1000ULL;
> 
> And here too.
> 
> Maxime


