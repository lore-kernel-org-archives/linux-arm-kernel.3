Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FF5C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 08:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lH46hfoNIJY5qCmuJzlF3d7GkHG348kgpWLaJA6DDWM=; b=zKJK5PFV5Zs5ju
	ACHdPag2azyK5cDZxjR187guOhCCbuCBP+5KDh1kfb+5c9icIK2Bva6AxOYbp7kcMS9rpgGOJxZq8
	fqQMOQ6igHZ+vcCf3oJMtcsKKm11b9ZxzLI0EfzhpDiQWRj/sU4SawH5s33gyxsSfQi88oXYs+k+E
	pjCkn0ejS+uT8T5vlWCzSLjsH+OJqVRAeKqoH3e3Dc+pCSp53KFsYqEgWZMK54t0qA2gsE3g/4zvO
	JIiYGnF+GviorMzv61lUvDXI8uxrjVdxBY4JoYO3DJ2h/Y9WpMUYqtsYKKXLXUxYd4DQ5aVDiskU8
	Gwnhbg6DsBpZTfD1lsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u794Z-00000006KUx-3Rf9;
	Tue, 22 Apr 2025 08:33:43 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77yi-000000066SS-2rTv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:23:37 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2482933f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 00:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745306615; x=1745911415; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lH46hfoNIJY5qCmuJzlF3d7GkHG348kgpWLaJA6DDWM=;
        b=L0xw77IySOGzsVVkRyQLEhmMMmoSt71cmi17a/BJMCze2eCY0cSGszGBWLMuaove2u
         5Lk7yfwW1m+6H3U0tQXrSLVGpexuiZDqz/ikGuTU5CiSiNZdB15pOSm3r1h/rv/Ojrrq
         neX/Or+0qI7GEaNZoajwWzAYUKIpET6w6TvR0+2Eicn5jZbjeXgbW1Qs91cwmuPjU23Q
         /LHKVoZ+W6M+5Xkhc1S410nFWJu+1VB1kuYUneWUXkAhId49IJIGhSS7eGURge8/cua4
         noQo6ICFiECg+5GMyVXVMYnbqRwdRbQmqbcpjxAbXD6VGInX/ux1vKTx3GIWZZje489f
         0ajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745306615; x=1745911415;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lH46hfoNIJY5qCmuJzlF3d7GkHG348kgpWLaJA6DDWM=;
        b=W9FjiaZvanPXPOCnKYdwev8fohsaAZG/zh+lMBT4heh13tJw7p4+vPbAQlG+XN7teU
         fZWjl5zH4d1euXjVb2OHpROobyC7eHXxnzE49KGxx6AGw2kqyLNm3ekcy/zwmtP3qcrl
         gAgSdBpD7XxqV77uRwkQT2h2tO6llUCtNy/MFFI8vHBD8jau7DI+qDnb7w5NWdb7Rls9
         Pvd5vTtyEwwz6hEsbxzpOpBV38l+mPNZFCQVSX2JkJCvckTTUND+8cZ/+MQJRLRnRYgy
         +LmT6/5O26ahlN88DrtNujy1BhVltIfNrv0RyaCvuhfV98+e7LkMy4ccVqAudlzcFI0L
         2HDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVGVhQ9Q4FI1ULwyVDymPnnect1F/sqduGPrSq5Gpyrg6TMMkIlbQPv12aeJffwGywRCRojPfLcsFdUxFZ3iHv@lists.infradead.org
X-Gm-Message-State: AOJu0YxoFEHPr6yoZtZ1jLY4ZSmeZ1ubxixhdL0AV033k81v7ydIUI9V
	0YcWUPowDOG2NB4ZQFcAU0phbV+yQnsOjmMrRIr6Yu9QfSI6xiYGt3Kg/4CDDDE=
X-Gm-Gg: ASbGncuEdwBLShWmFaKOhyL8W+FjWG3Nt+C+XZqKMgovA43LKYotOv+ShuFu+VjmTHn
	ydflL2ttL15Eou7HhytsQlNyPT3UF1B/VXbyxaEXVaE7sCMlzxpQhBenLQi/EpN/yhhdFMtUOHn
	CkTySJbomDiXcHPSlQEXCsg6g4dVW/UUJvhfcxgGY5QLLyjR9iRu39oPP3PHDh8NRrek+805waB
	Ff3g6sg7mRm9kpvspbPORxEg6y3WOz2iZNotaRGjh46KCNyDmdaN4zorKgKoY4vqIdBTJHdoBQH
	6KLfhoIc5BW1JRU+aQozoRqNlMuOaDnmkniPQT0O6eaG39FMIbZvtYJRV5jzw9sq0cTnVGl0DC+
	Va651zJMvOBK3Zvk+/A==
X-Google-Smtp-Source: AGHT+IGywozzMisXwYOT/E5KYtUsJDT/HnunTc8XE7Knara8DcfAQ+yJD6UJRsAe6X3X6bs1me8xhw==
X-Received: by 2002:a5d:5f4c:0:b0:39e:f89b:85d3 with SMTP id ffacd0b85a97d-39efb9538afmr11846283f8f.0.1745306615026;
        Tue, 22 Apr 2025 00:23:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bf20sm13981589f8f.48.2025.04.22.00.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:23:34 -0700 (PDT)
Message-ID: <7c7b3e81-bc46-417b-a3f4-2d48f2d3638d@linaro.org>
Date: Tue, 22 Apr 2025 09:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/meson: fix resource cleanup in
 meson_drv_bind_master() on error
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux@martijnvandeventer.nl
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
 <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
 <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
 <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org>
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
In-Reply-To: <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_002336_717165_F06A0A13 
X-CRM114-Status: GOOD (  19.46  )
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

On 22/04/2025 09:04, neil.armstrong@linaro.org wrote:
> On 19/04/2025 23:32, Martin Blumenstingl wrote:
>> Hi Martijn, Hi Neil,
>>
>> On Thu, Apr 10, 2025 at 8:46 PM <linux@martijnvandeventer.nl> wrote:
>>>
>>> Hi Martin,
>>>
>>> Thank you for the patch.
>>>
>>> I encountered this issue some time ago as well and had a possible fix in my tree (see
>>> below).
>>> My apologies for not upstreaming it earlier.
>> No worries, we're all busy with both, offline and online life ;-)
>>
>>> While my fix is not as symmetric as yours—I like symmetry—it is somewhat simpler. It
>>> did make the assumption that only  calling component_unbind_all() was at fault and the the rest of the
>>> code was correct. Therefore, calling one of the following functions:
>>> meson_encoder_dsi_remove()
>>> meson_encoder_hdmi_remove()
>>> meson_encoder_cvbs_remove()
>>> in case their counterpart was not called, should not result in any issues.
>>>
>>> I just verified, and, as far as I understand, all of these functions do a check to confirm
>>> whether the encoder was initialized before proceeding with cleanup.
>> Yep, that seems to be the case right now.
>> Neil, would you like Martijn's more simple approach with a Fixes tag
>> and backport that?
>> Then I'd send my patch as a small cleanup which doesn't have to be
>> backported. Otherwise I'd spin a v2 with a fix for the issue that
>> Martijn found (and including Anand's Reviewed/Tested-by)?
> 
> Please send a follow-up, I'll apply this one today.
> 

Yeah finally please split this in two:
- patch 1 that can be backported
- patch 2 remaining changes

Thanks,
Neil

> Thanks,
> Neil
> 
>>
>> [...]
>>>> diff --git a/drivers/gpu/drm/meson/meson_drv.c
>>>> b/drivers/gpu/drm/meson/meson_drv.c
>>>> index 81d2ee37e773..031686fd4104 100644
>>>> --- a/drivers/gpu/drm/meson/meson_drv.c
>>>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>>>> @@ -314,35 +314,35 @@ static int meson_drv_bind_master(struct device
>>>> *dev, bool has_components)
>>>>                        dev_err(drm->dev, "Couldn't bind all
>>>> components\n");
>>>>                        /* Do not try to unbind */
>>>>                        has_components = false;
>>>
>>> Above two lines are no longer used, so can be removed.
>> Well spotted, thank you!
>>
>>
>> Best regards,
>> Martin
> 


