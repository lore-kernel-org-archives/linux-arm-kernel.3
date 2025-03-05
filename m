Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824FBC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11RIqpJbRMk0CP7kEnER3o/kKEhmLuNrxSq821K075U=; b=1baAnubdSZZyx6Kj8hHaaWA6+5
	8l0ZxN2Sx0x34IMcnmgqHYU+TsZnGTbhPI+A4iPpD225n+xFcGAFZqPuPc2onKoPZdETbnbF/kG4b
	GR+ycGVWxmKQFBvNUeXzOFkiTplfIKeTSsc+T91y7dDGblGVLcGq9A69MJsGNeMXmvTPEGyW9qGrB
	gK9SENjKqHorYnZFEFWFrJa2eDgvzBE3LORCRTBeSzBq7gmWOdTR+fqFQlWQKvmx4/C3irZ7msva3
	YpgU3AQcgxt+/m6OciQNqod2cZdjYu7lnYUn0Bq+I0C2w/qNSrkha0I6fMs2tFIeSvhV8guW5iy+x
	Qj6h5q6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tppQG-00000008ICz-3Nmr;
	Wed, 05 Mar 2025 14:08:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppOD-00000008I2o-1Bua
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:06:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4394a823036so62962335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 06:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741183583; x=1741788383; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11RIqpJbRMk0CP7kEnER3o/kKEhmLuNrxSq821K075U=;
        b=QTt2K+fq807CkN0teWLuzKO7ZAD/h2XokO9SMfASKN8/ldzmrcl8J8wbuDCQDh+18l
         C8PJ/X0oyc0y5kxPD37mHu+AKBUNtC6tpaFe24qq8hTUPMEFPKwNUTsYN1YwfS0arIYh
         lUIRhkxg5+/C1+YWvgMe+Ed2wp4TlX7MSU8h6TD81WNdwvektjqj/EApHaBJFrNyLGjQ
         i3PQsvkNOCBG1wByDOpFLachqGWxTQ1S4iAwbwGdHmVyh1IRxSMgPRGgvW9H/l5MKxOx
         EsrxJXk0MVuAsMEDN1LxZ/Lo7LxWNXKcN4ZseH7LDV+LtDv7fgxlxqgByfAxDT96JAQd
         dakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741183583; x=1741788383;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=11RIqpJbRMk0CP7kEnER3o/kKEhmLuNrxSq821K075U=;
        b=D8et+qm9I+B9/08+ESlBhkMY6ePTGHxhNoTxOCJ10k6fJ9QkkPm6C/BwmSdd/ZwFnR
         W1RqdqYwG1lKxA+JhcLa7CHHmKDkJ6+M0obZ4SINiTxdIH6YQUdi5/MB8I64NcFGnEZo
         PUYQAaXHG1J6CRqL7u69yRi23tpiGgsOhBjmqazhf+uiL4wJzaO1Kl72tw/FEmb2DUqg
         GZutJqkMFu+D3sQEMF5WHx1uSkBKW+zR3hNRPUToxMhwrjr9NTsjBQnTXk6z13xb8gAq
         LrWth+PZiPVqhD7MV8tkwkbgOZ80yk7TQA4+oxasZjIHwgEhPVbRePhfG84JlF6pMaoY
         +kGQ==
X-Gm-Message-State: AOJu0YzbeNKMHqkRKD6mqoiqOTgOH7HBI/xug9l5KUK4KA3/5CXTTcPl
	BbKf4ViAvvSjdzoWlqXaxDo6AIxjn6kvCUMVQVMHH4y+PVeKH/nAqNjGKplgz2w=
X-Gm-Gg: ASbGncux54cN9zfKNB/fqzTvVz1jb6sWrRPELXuK9e/nqURKmvBsK4LQkKvWgyUKR+w
	09Nd3M2qRV553I6R60LHIKEYhC9U0E0YzxVyVTqxm7W+aeT+ZcJT4AplHMbV+hxIF50Jqz3Sj+d
	iZdVYuAxn5J5w2Srk0vBZX7/gtzvPQjbTrgtGiL7se0cvf/nnCofyxKKc8k8xBlG9lOZ0o0UNnK
	7JqyiH9cbbkOozSMSWoL33L/xrqvdC67tdGAznXrBcSLyQQqLZ8WBakoyyrheGiU2VmZBnq89t+
	eu7I0JFTNzvLOOecWDg9EC4D7yWNOdn2Nz0FBNip787+2LueuxRF3liJuo/6oSEZShvNNws5aev
	4C2/9EDc0IG6ur3a8yOnSDw==
X-Google-Smtp-Source: AGHT+IGw9gdZ+AWcZBF3A5Ecs3XaYdWNI4WSu4gKkjkQYxmSQUUfbmDB8IcIt65GvIVbdvbiREsQiQ==
X-Received: by 2002:a5d:64a6:0:b0:391:c3a:b8ae with SMTP id ffacd0b85a97d-3911f74dac3mr3468091f8f.23.1741183582872;
        Wed, 05 Mar 2025 06:06:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d001:4ab2:d11a:658b? ([2a01:e0a:982:cbb0:d001:4ab2:d11a:658b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39121d7d866sm2079199f8f.39.2025.03.05.06.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 06:06:22 -0800 (PST)
Message-ID: <18f9658f-f2ca-4fd9-809c-ec4d198072be@linaro.org>
Date: Wed, 5 Mar 2025 15:06:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v8 0/5] Driver for pre-DCP apple display controller.
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nick Chan <towinchenmi@gmail.com>
References: <20250224-adpdrm-v8-0-cccf96710f0f@gmail.com>
 <174118223158.156873.6982508045942987984.b4-ty@rosenzweig.io>
 <Z8hZKW_F-HtzYm-w@blossom>
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
In-Reply-To: <Z8hZKW_F-HtzYm-w@blossom>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_060625_334689_E9A744A2 
X-CRM114-Status: GOOD (  13.00  )
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

On 05/03/2025 15:01, Alyssa Rosenzweig wrote:
> Er... I only applied 1, 2, and 5. Patch 3 was already merged, and patch
> 4 is going in via arm soc. I am, new to b4, sorry!

Yeah it's because you applied the whole patchset, and discarded/skipped
patch 3 & 4 afterwards, so b4 gets confused.

Next time specify which patch you want to apply with -P 1,2,5
and b4 with know which patch you applied and generate a good ty patch.

Neil

> 
> Le Wed, Mar 05, 2025 at 08:43:51AM -0500, Alyssa Rosenzweig a écrit :
>>
>> On Mon, 24 Feb 2025 12:02:15 +0100, Sasha Finkelstein wrote:
>>> This patch series adds support for a secondary display controller
>>> present on Apple M1/M2 chips and used to drive the display of the
>>> "touchbar" touch panel present on those.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [1/5] dt-bindings: display: Add Apple pre-DCP display controller
>>        commit: 7a108b930a84e71be71c3370eef6dd96fbb8f618
>> [2/5] drm: adp: Add Apple Display Pipe driver
>>        commit: 332122eba628d537a1b7b96b976079753fd03039
>> [3/5] drm: panel: Add a panel driver for the Summit display
>>        (no commit info)
>> [4/5] arm64: dts: apple: Add touchbar screen nodes
>>        (no commit info)
>> [5/5] MAINTAINERS: Add entries for touchbar display driver
>>        commit: 4d2a877cc0efefa815648f1ed5f5b2b796f55bab
>>
>> Best regards,
>> -- 
>> Alyssa Rosenzweig <alyssa@rosenzweig.io>
>>
>>


