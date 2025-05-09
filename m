Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C73BC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Lf024pTfan+q9P4HvlL7cyqlLI9Q/+p93cpsiJhSK4=; b=CJSrUqFR+3iu/9bbY/tVJT4T3L
	T4G+sH5kVgmnRjRO5jBLAv0biVCwIlgaYkF/LlmWRrdDtTjbOkT1kz9leC6HWfozYoyWytwQjaEYd
	8qOEO5JaYNGhVjboLZ3nLvB+gYeSUR5Ouq3Nw0cAevQ8941lLVVjTwAbbPT67oqzR38kkjFkEf6J4
	B5DJFpcyac1aA9sjElJwvozlP/TPL50ZhNxfvlm9Q3CvBPIGbo7dlEMFF4D/HobJWVSN17iobpcl1
	ofLIJ1CmBlVJ7D+UVHSN1SMgP0tmLY9EVTkz1cWXYlWf2FoteSpd69yyZOfNa1qdJT/r9hnpEjg7v
	Xd3uuWLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRhX-00000004Sps-01Pl;
	Fri, 09 May 2025 17:39:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPlC-000000046eg-32L6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:35:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so23687565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 08:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746804936; x=1747409736; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Lf024pTfan+q9P4HvlL7cyqlLI9Q/+p93cpsiJhSK4=;
        b=EBeQLqPRsHOerBbmUkvdNXLmEom4uFrDHBfo3plXdv3uYaoraOM6qQaely2k++yd4f
         dE/AeTVzJf5kOKSL2LeLxYieTQev0u4clXPwklsLe1dNCNRRQvQ713pc40AnBCBRmkNh
         Ot3HDwcBv0PAsksrv9/RPalZu1gGNk8tPVfG2t8RTm81rFYcu/prSu2mCGHhh2tofEGr
         b3N4lHAcqm5k5E00v6RtW2eNIyu0uK9INUat/PLCPE1TsqyGQ53PEoFQJfETd5gCIQjX
         1h9nOhG3NRPqFWG8gsBRUbUYyBfZfj9c4RwM/jK9jW2W5EhkfTo2shDAHhBybngIvoZN
         WL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804936; x=1747409736;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8Lf024pTfan+q9P4HvlL7cyqlLI9Q/+p93cpsiJhSK4=;
        b=sqlmEkObLMiJ+zgF09EZhAE/akLCWDGYVBxMP9dK4w4vFYWrocQurPyAv8cnaPP9zp
         7URNH2ni7lb1mPVw9FgkvxziLOwdw7V+hNLbZY/JFTzqVjDLHzYj+Hf+G9w/+em76uO2
         UqH3vdlcG0alf1YKBG+iz93+JeKIabpHBBJ5WHURp56XnPAMFXq96RTQsTrGMdATfi2W
         jOWWy5tA93h5AAoDDG4YtqDv8oJ3TT4IEo5SQtj8rXsh1QunQA1XlFgife4ghorE1YSX
         4zQrAbaa1b5Z74V3cHParB2n3Vdy5CZCrRRX6VIbZfNigmw1UVYfyQwz91ZpSQbuF2Fz
         r3gA==
X-Forwarded-Encrypted: i=1; AJvYcCVeb7Ub21n/yfX7FvKOim2ZChy2bpOOczC6ZkBHg1SIAHsiFRSl0jETVMMzPntKxwjjdx5vIRoi9PvIJwIjbyDX@lists.infradead.org
X-Gm-Message-State: AOJu0YwNt/Md23EuD5cEtshfRFQm9elM7iIacAzaPaxZZki0HNC6uBz/
	5opydrgBBIMxuhbY/yLNf3pLUSs6zKG6OgRkrwoep80E5mkHfTFixGwQ3oMqZC8=
X-Gm-Gg: ASbGncs0fe4kD3LmwzcgbahhdmKaH/thdCFcsi+2HEsCTDuPEXDbq41bIpbgoPiLiD4
	fpvd14ttUac0/DX8va/GDZyjdu2wjmjffLNgwZT3ZQqIUrOl/OC0Zr02LoqGnGCqqTBTZprd5Ma
	vSVuqqAJ+Je4bxL9Rjmnw8Ud7SxjA9jvlrq7MiUMgPpYy/e1nv/4ayfvM0YfMlu9XPfOlbG5Unp
	BlAhYYP9iMyfxf0r3eXwikjoKfWtfGWVp7+j340uQnfMbm7Pp+u3idfyBp8KFNR1RIjPTbnwVbN
	+h2y4AHO4hoZxXUQObhDlG/L14kkSC8YLrqaHBKOoyClU02uj9meN8e/f9qBFTjOnBSUy2GPMW7
	kwkZdU7Hpyzg9CjE=
X-Google-Smtp-Source: AGHT+IHee8AoQ48Wmh4QoUcNKP20otCxG3keyweeVnCtmCpXbPFY1XMvweqwVZVtf5GlL3zDrP25Eg==
X-Received: by 2002:a5d:5f86:0:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-3a0b99504f7mr7296980f8f.24.1746804936618;
        Fri, 09 May 2025 08:35:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:22d7:71a:9f62:f7e2? ([2a01:e0a:3d9:2080:22d7:71a:9f62:f7e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2961sm3570883f8f.45.2025.05.09.08.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:35:36 -0700 (PDT)
Message-ID: <6d2f35ee-1b33-40b6-b164-ab4480110e49@linaro.org>
Date: Fri, 9 May 2025 17:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
To: I Hsin Cheng <richard120310@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, christophe.jaillet@wanadoo.fr,
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250505184338.678540-1-richard120310@gmail.com>
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
In-Reply-To: <20250505184338.678540-1-richard120310@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083538_770329_327957CF 
X-CRM114-Status: GOOD (  23.06  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 05/05/2025 20:43, I Hsin Cheng wrote:
> Coverity scan reported the usage of "mode->clock * 1000" may lead to
> integer overflow. Use "1000ULL" instead of "1000"
> when utilizing it to avoid potential integer overflow issue.
> 
> Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>

Could you add a Fixes tag ?

Thanks,
Neil

> ---
> Changelog:
> 
> v1 -> v2:
> 	- Use 1000ULL instead of casting the type of "mode->clock"
> 	- Refine commit title and message
> 	- Fix the issue for the evaluation inside drm_mode_status
> 	  meson_encoder_hdmi_mode_valid() as well
> 
> Christophe,
> Thanks for your review and your suggestion, I think I should add a tag
> for you,too, but I'm not sure what should I add, if you would be so kind
> please let me know how should I tag you in the patch.
> 
> Best regards,
> I Hsin Cheng
> ---
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 7752d8ac85f0..c08fa93e50a3 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>   	unsigned long long venc_freq;
>   	unsigned long long hdmi_freq;
>   
> -	vclk_freq = mode->clock * 1000;
> +	vclk_freq = mode->clock * 1000ULL;
>   
>   	/* For 420, pixel clock is half unlike venc clock */
>   	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
> @@ -123,7 +123,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
>   	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
>   	struct meson_drm *priv = encoder_hdmi->priv;
>   	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
> -	unsigned long long clock = mode->clock * 1000;
> +	unsigned long long clock = mode->clock * 1000ULL;
>   	unsigned long long phy_freq;
>   	unsigned long long vclk_freq;
>   	unsigned long long venc_freq;


