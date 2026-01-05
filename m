Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1D6C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 14:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4f2DQ1WSbAm2u31CVo+GntDagSQYTjRfPhTR4DZPJI=; b=XgAiALY45GNm8MdujZAiI3zPPM
	t+z7muJWVJ7hO6BiB8moBZKGFlCR5n4NOftY7dCEZ5WtCrCdwCP1YH25E0NFZno3Z1d7/0/frUW4A
	2FI97ti/FWnJQaH1/eBpobWpa1789BhYgJAseUl90NIp4BhXgfWBpYIC6umddn07i4Um18uFpp2P6
	IGs9z+4Si7hp4kkCgw8Xnv0ieSllCLGdNbu+2rolLKFqPVw1t6FVZIcyiuG5lDbm6DZCUQGAfj2Wn
	fOHKIBJeSRY0IIP2VYXupVGHANOETK1d026KyA5rI6PEP+tn5xt0VNlqsJ33mfCpycubk3IEurrDn
	uCkead9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclwR-0000000BZWk-1w9r;
	Mon, 05 Jan 2026 14:52:19 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclwN-0000000BZW0-1vmU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 14:52:17 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42e2e3c0dccso8730659f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 06:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767624733; x=1768229533; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4f2DQ1WSbAm2u31CVo+GntDagSQYTjRfPhTR4DZPJI=;
        b=XLxf4sPV+B2pkvl/2S0elsNl78DpKWXx+inzorUypPKFFCYaxSyxYxyfZkBjO5WXir
         j/rDZSY7Nzb2e++tRJvpNagn04caMwxAdxt/Rz9zB/IpVDJ45VoiuqwfXR/Gk8Oq1wpM
         X9Rw8+ZmtCINIYXNVK+HPOs/rMmrS7fwMAFCXCrQznpxMOjs9PwqIbWaOHYosI1Ektjo
         ys2huWol2tWLQLM4huO3nJZToMjTH2vf1MYa0121xrlDFHvoZSucXlT9BMYIGVIBmAuw
         YIPgDB8eGNTuvTdyVUOo9IsEfo5JWL809+FZ2BwD6Na5oHqw9IkQ0mKl7Ojk/Lm77NXV
         pk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767624733; x=1768229533;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4f2DQ1WSbAm2u31CVo+GntDagSQYTjRfPhTR4DZPJI=;
        b=aNAZiocnJvpwBgM1Cf7K38uA/dcLIjRXsRa7hIbZghmpOBh6UOrtH0eL9Rp0q3+06T
         ddj3Wurq3pLlwn8i7+2MB6AKVuuSAOb8j1DWKQhRy4P9cGQqu8I7E8/48mqJOrmIupEg
         Koya5i0ZgOv/Azk0ebwah7l4DyE5zvfFK4gnXY2XDVK3MJLUiIMgqG7zWz1a29zv+xRi
         s7KSvLSwTMO1ZuknwrFa9G+Sip7k4IZlD10NpVKX7ZTCw1Wg0uygU7bpx36qKOWMp/Pu
         dj3DSFtTr1SDMT7mWvi3el5VMl6Ik+tL6XMaeu0uyCpZXpyeCeuMocBB01QkTcQ4GrU1
         burQ==
X-Gm-Message-State: AOJu0YxoiXvhYBs+Yt0YFjtNgYGwvKMAKQDGjt1qCUTgfiWNs41iyLr/
	+XOUL96zPbQR+YvjpesQFppUByakNuVpzfoPNSe97qHkiLe7qX0rjeGPbLEujf09i6A=
X-Gm-Gg: AY/fxX5F/RzHNjxxOvpZRN4vBoMd11BE/KZzrNwTDxfkWYS3M/PTryjBOxIhtIBdrGE
	kBWIEzjnU96J3p5H+GojlHHzadELTOHj/1vnyZCMr/a31ThcAKMU6bSbk6G9UuJxzAWNK6eyr1s
	9dyWunGZ4Vu+IoFKalDyFytZqFGLUOJvVRV7/6iONOUIo8+PlMhFc1OWP0vMa5gkLfyfe9w7uVu
	rJXVhexEVuw7hgiFEZ6ZKf8DPR9w3D9pjjN5Aj+GlPMf3i2t7VCXfoKbSIH8dXpxYOGrgG6oc/w
	EPmS8HdB5zZLCXQwhrK9bSIYYLVMMiqadLRNJdZVYvuYLwTA3JAHiwppLU9fpXlMBtiBUjJVUXo
	VzWgfFL8uPOEZ+GsOx+3X1q5NIjhqWYlrfwvCZsQyfnDeoVxr4Qtu3az8FiRoNuOu1XT+3AAzPM
	eX1dOxLPVjqWC1z0YDbJjhceBqlioXP94AArNU5VP+fHR2pe+D/ARDPBK0KAU04pI=
X-Google-Smtp-Source: AGHT+IF04xwY7BPXpJXoTEi+h7FZBuYpUNOJ0m3AYz1i2MW5UInfMvTq40PaR8bkTy9F4e2TmhOFXw==
X-Received: by 2002:a05:6000:2c0f:b0:432:aa5a:3916 with SMTP id ffacd0b85a97d-432bc9eddbdmr31074f8f.40.1767624733256;
        Mon, 05 Jan 2026 06:52:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d4c1:5589:eadb:1033? ([2a01:e0a:3d9:2080:d4c1:5589:eadb:1033])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm100780184f8f.31.2026.01.05.06.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 06:52:12 -0800 (PST)
Message-ID: <aac69070-d000-460f-a1fc-4ac5c097c7e5@linaro.org>
Date: Mon, 5 Jan 2026 15:52:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v1] drm/meson: venc: add support for HDMI DMT modes up
 to 3840x2160
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 tobetter@gmail.com, christianshewitt@gmail.com
References: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_065215_560547_9469DBF0 
X-CRM114-Status: GOOD (  22.71  )
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

On 11/8/25 14:42, Martin Blumenstingl wrote:
> Commit 5d0bfe448481 ("drm/meson: Add HDMI 1.4 4k modes") added support
> for HDMI 1.4 4k modes, which is what TVs need. For computer monitors
> the code is using the DMT code-path, which ends up in
> meson_venc_hdmi_supported_mode(), which does not allow the 4k modes yet.
> 
> The datasheet for all supported SoCs mentions "4Kx2K@60". It's not
> clear whether "4K" here means 3840 or 4096 pixels.
> 
> Allow resolutions up to 3840x2160 pixels (including middle steps, such
> as WQHD at 2560x1440 pixels) so they can be used with computer monitors
> (using the DMT code-path in the driver).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> I'm sending this as RFC as I'm hoping to get some comments on the
> "4Kx2K@60" note from the datasheets.
> 
> I have tested it myself on a GXL Le Potato board using a computer
> monitor at 2560x1440 pixels.
> 
> This is the spiritual successor of a patch titled "drm/meson: add
> support for 2560x1440 resolution output" from [0]
> 
> [0] https://lore.kernel.org/linux-amlogic/20250927130239.825060-1-christianshewitt@gmail.com/
> 
> 
>   drivers/gpu/drm/meson/meson_venc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
> index 3bf0d6e4fc30..4abd0c09b442 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -868,10 +868,10 @@ meson_venc_hdmi_supported_mode(const struct drm_display_mode *mode)
>   			    DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC))
>   		return MODE_BAD;
>   
> -	if (mode->hdisplay < 400 || mode->hdisplay > 1920)
> +	if (mode->hdisplay < 400 || mode->hdisplay > 3840)
>   		return MODE_BAD_HVALUE;
>   
> -	if (mode->vdisplay < 480 || mode->vdisplay > 1920)
> +	if (mode->vdisplay < 480 || mode->vdisplay > 2160)
>   		return MODE_BAD_VVALUE;
>   
>   	return MODE_OK;

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

