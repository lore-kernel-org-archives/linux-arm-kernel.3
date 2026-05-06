Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A36ECD3442
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMDmbK31Q/cBTRDNdYVwkrUVXvsO29GTLMWDni5jKAI=; b=YUjwX4gZ4Sbf1oY5+260+IXkCK
	tx7BCOluNqjRZbYXXQIEMzVQAjnX56hKS4QroRD8U5qbyKxzXed9OGwqgXrG+BfUSVNOV5DLkV/7w
	POw9FHMqmd6BXUSXfsu4ELahXdaLQNtYrkl6GG43JTo3sSJ0Q8HqRYXuc+7nzO6otCuk2PueHhmhs
	rinAaUdiO+hsTPikbG5lSRB3op8NmgGQEl2mnVGVAPPR5qivTeAC/NaiO9zPHY9Jsrf0Tn1EuMfiJ
	lLFeAMYiEf2U4rNqUIjhoQKCD0jfq2BPvvp/KaGk9I0v9W5cTxlbnKi6ENJLMLBwpXhZXRxmPU9yO
	L7t4TzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeam-00000001Pyw-2gx6;
	Wed, 06 May 2026 15:55:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeal-00000001Py1-0gl5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:55:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488b150559bso45936825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 08:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778082917; x=1778687717; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMDmbK31Q/cBTRDNdYVwkrUVXvsO29GTLMWDni5jKAI=;
        b=xrT1oOAjQGMXNLkhOZQ5VRhbh+8zifoycwkSWLwnro+8VWW58raFklg08ewcvqsXnz
         jRzdtGVy+i2r0CNmNf0Ug+bbUWSjAg6qyfPFwfREO35wfev3zw1LM+2rf/DnQrN9ZUvT
         8PWz8mwTKsNVzfLMVyBUflz7UgDVAMeZDjLHJpvlTyDM9wEXs+8jSbho6Vkol/Iq8pLY
         TT1ooCxqDwGgayqSYsx+V7TmN/6ZMLls4IO8fZndhNpjGytA3e0su+B8Iw58ndlw2uO9
         l5CiErbkRzwp+HYkk/islfuavRZHnuPXf40+poFnuQiy4HbYurvpRwFrL7sJB3aN6pqd
         SR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082917; x=1778687717;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMDmbK31Q/cBTRDNdYVwkrUVXvsO29GTLMWDni5jKAI=;
        b=N6n3/yUtq+tl1yqzXnM0mGkSAIhPtxWtKWaMjxJ6o5PvYZYHUd7SaW8m4aCJaxV9WJ
         GgE4BPvltcYTJfGDIBEjiZ2tkrXdum8u3BAB5Er/TzTbfwjaSMoTtXP67qcPdmVu1VNg
         gH/hKjR1Af5zvQ/5YhNovvqZ/zDR0JOk5SbX/lEwnFs6+LrlxBRRXrzP1fFXxWMMAYHq
         RQRVJwz4GniMp95sHcKLS2bGBx1hFr2wg2VBrK4vT23rRr2/FpjHOIUhjAvIrOyUqDem
         pAHEQ5TsR3TafLZYD06zXexoFmhjl5COcH5zbxFllC6pYNm7vKkQvihh+//qGHmU4Nu2
         +D2A==
X-Forwarded-Encrypted: i=1; AFNElJ+i0CEp4X2KLZ09qhS8i3WsfX+CDQpCDHrEVwpJHKfvvysEYyGzllazlew8bdVRfeAliJpt/eZExyP5jHDlI2iN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzimk1Zt+kUb7MqQHiOVyrad3STsvQitW/EWI1iggpg9kWzN2N1
	/LLCx3fT847WLhuXZPeXPjZXZhLkOAgohtd4RL96BYjU2gtjVhzxSCc/gs+DwKK0i4g=
X-Gm-Gg: AeBDievfjNSUjtRPHLjwGHAekiPlXs15ayQnsQZo9w2M1A8uv6f5XG3JvTD3ociQCZt
	qEDP7e7ZUFV67qEAdDiJfEzSyGxsrl1+t6BT5nSgdIyI1NGZUPnHTSP4aLAkEalzNjvBbuckbXz
	mhPWlTBBJlquWjfx05gQ7c6zhRbyAXPxqsWgwCozDGbc0XuIE5zKFdHK9iGZUJuYzh9n97cNYqj
	wY3izmANcCnq8CjH2UZqbn7BGnoxc2/y7P1Y/GNBhnbGIPubiL0ctHlzFBKVGP6u6Uk673ZxWEb
	ZI4oX4PONogIS+YDi2QJ2Ie3AnTRpUcSZ7AFgAKir0yZOJzSwrKfjs8qMbLMp0IbbESwaOsGqxD
	KbVTKSWIQ0ipp6f5Qm0Fb3ImLgCKO2qzq6GxNvOqT3X0+0PTXnXxeJV2QVPosLOv+M8FHZDBw41
	9p6vk+2U/txC23E5bqHlqkUGnvfZHdiMgJbNKQDWLesx/fAVggvMq5pgCNkvWrxOJz76tjUiYDc
	c6PJK0n4WkJlhuQfQ==
X-Received: by 2002:a05:600c:3ba8:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-48e52bd5035mr71562705e9.14.1778082916975;
        Wed, 06 May 2026 08:55:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538a547bsm62226385e9.5.2026.05.06.08.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:55:16 -0700 (PDT)
Message-ID: <27d7363e-b8bc-4e69-a9d2-abd7e12fe562@linaro.org>
Date: Wed, 6 May 2026 17:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 4/8] thermal: amlogic: Add support for secure monitor
 calibration readout
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr>
 <20260424-add-thermal-t7-vim4-v5-4-9040ca36afe2@aliel.fr>
 <f4bd99bc-00c7-47f6-a914-e398dd2c3bd5@oss.qualcomm.com>
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
In-Reply-To: <f4bd99bc-00c7-47f6-a914-e398dd2c3bd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_085519_237515_AF1D8C8D 
X-CRM114-Status: GOOD (  12.95  )
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

On 5/6/26 17:45, Daniel Lezcano wrote:
> On 4/24/26 17:45, Ronald Claveau via B4 Relay wrote:
> 
> [ ... ]
> 
>> +static int amlogic_thermal_probe_sm(struct platform_device *pdev,
>> +                    struct amlogic_thermal *pdata)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct of_phandle_args ph_args;
>> +    int ret;
>> +
>> +    ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
>> +                           "amlogic,secure-monitor",
>> +                           1, 0, &ph_args);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (!ph_args.np) {
>> +        dev_err(dev, "Failed to parse secure monitor phandle\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    pdata->sm_fw = meson_sm_get(ph_args.np);
>> +    of_node_put(ph_args.np);
>> +    if (!pdata->sm_fw) {
>> +        dev_err(dev, "Failed to get secure monitor firmware\n");
>> +        return -EPROBE_DEFER;
>> +    }
>> +
>> +    pdata->tsensor_id = ph_args.args[0];
>> +
>> +    return meson_sm_get_thermal_calib(pdata->sm_fw,
>> +                      &pdata->trim_info,
>> +                      pdata->tsensor_id);
> 
> This driver has a dependency on patch 2 and 3. Shall those being merged through the thermal tree ?

It's fine for me.

Neil

> 
> 
>> +}
> 
> 
> [ ... ]
> 


