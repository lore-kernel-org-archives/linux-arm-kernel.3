Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9B7C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjDMnEpfyvE0/n/R7fglBpQPZZ2H1kPvQ+lYLuofLIk=; b=Hb/kOLVHc5t7TJWvPEZmXCbIgq
	PEufPPDzciI1EG/UAIEI30H9Uucyy+ecajQknQKN4HOcLH+XgTfj/BHfrNlyzGjLtr7AWLVUqqFfd
	gVr7P8SEFM072IyHQ6cQcda4lYmjUwRGl4Gtbe8d8a46KugkBHDiAKcdt79F9N+wkCjTG9OxJb9Jg
	flDybjPNAEQbFKWwYdZdIu2lFBk+J1DUQcVBA30qlvYl2bh5oRcw590D/YhLmqEREPM8WEuW6kdgF
	Fevah20uEltV1W1Zh9Sp3eFZjCj8xAB5/i881+ZTwph16Iw0NK02Vsi0mzdFQVcSTsFxMRPzbFUT1
	CY+M4pJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0eV-0000000199N-01Ja;
	Tue, 25 Feb 2025 19:31:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzDN-00000000nJT-3cbe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:59:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-439a4dec9d5so57913365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 09:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740506368; x=1741111168; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjDMnEpfyvE0/n/R7fglBpQPZZ2H1kPvQ+lYLuofLIk=;
        b=SadbNYFGkqBNz+Oz5M9vJc4n+jYYl4P1B2TWd3v2YvJr0E8c6q48luBiOnS+Ua1n5X
         2BFAYe+sGORSegnYtgmHY0eP2xgerLK54tBcetNCy5xtsPD+72VWB17Rc2Eo8Rz+PK5m
         ntOoMkBOmQiX+8rO8SDmdrUU7LIJOewVGQjtkUNpCNz1irjB4BJ4mkMqGRtxLd+SZqst
         DxoNZ6AbIxQ+iDD60uKU9fq7+gOFzNeOHT8UMfsK8XVhPJyDNRLiz/jRRmOOIEUIQQaz
         7dPpQDDF/81+JDWs3z1JSaiFz1+pRDkNe3K/EUVjWgbjVa+iFJniorz08+wy7VkHJ8qY
         beWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740506368; x=1741111168;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hjDMnEpfyvE0/n/R7fglBpQPZZ2H1kPvQ+lYLuofLIk=;
        b=t0PFL10M/P0u0sJ/1f0+C8LlWRayvCwBpNnKwLqGeFuDvCsv1WuTXO/a0SPvLVlhVa
         0QQ8bJRGWuv0QwxU/A0zpc4c4huCNyfh+ZO/JShtjhOwqtz5pqo+cteOMtgJGKtPPYFO
         XfcTEKuzG+0qYBsV07iGJHnvHp5T5h5Ct6G/qtER2Lko0rOxaJCVADVDnsx8/PKXpuKd
         WszzI2w9tOHUvXLTTbjmYt0/7PGHxO1xB4Aquo1UoBmzd5d1K8k7f+lzRxhy9qOQIwFq
         RinB4VpoqLs5GUpRCHuZxEs4JRCuxLLe4BbJeGHhN0AInKRK+R+Etqh3NdTeAHpdO2V4
         KsnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI6FjxqEZ/6ntHwG8AR/cBG90TVEP8oWIahx5+8gFZBsPO1NA1nRhOSSNnbtt/3mDnX6ivGVgtelC/71uF1npt@lists.infradead.org
X-Gm-Message-State: AOJu0YwWG+xmJ5TCAm121xMYShVA0HlHLF1k6+mbsnV4fKpZPQC5GE25
	fRUTbIJC/3pKeJK7/JwkTVS+ORe3+6SNZhzvPpnlwU2/jbaGcqi4aqYJ+Z7MCvo=
X-Gm-Gg: ASbGncvGyOpI3Kp876B1KFQYLxM/l39XGEYRCO2wwm3yb6c4fyLhPVWnALh8iXBRnBR
	S/zUxiHdqipzYxlzAgskSO0WCWVQgBxm18oLBkT+5WOn+K1iTLF5exTLmJ0I+V55DfxMlEYx4e3
	snakqBtePg7pG0W1aI+SRWqF3ZPF/N/R3HIJn/8f3iw5X4gbcJRVvKWZy+KeZZ557lLtVW6i2if
	GPWGTY/62Y2OlEKVueW6HpoBhX98K7pzquMSGCpM3Hyz0epLGBVPjyZFIgNNGTxZI2yyuRxyUXt
	jZQ1JVhC6j+PQ1vifA6DW66EWyo4/7E7sCUTz8rmWLrM8OzAfIu/Im34OHMb36u23jIw9UqBrJh
	JvEo=
X-Google-Smtp-Source: AGHT+IHtZcIoQJsi5dScv1l8X9lcH5/APbnkiDicrQKXKhdO2SowhVhMLSTlVqGJk0pL3x+gu1om+g==
X-Received: by 2002:a05:600c:1f90:b0:439:8544:1903 with SMTP id 5b1f17b1804b1-43ab0f64430mr41996155e9.20.1740506368036;
        Tue, 25 Feb 2025 09:59:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:23a1:f1ec:7a08:3a2b? ([2a01:e0a:982:cbb0:23a1:f1ec:7a08:3a2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab2c50dcfsm21371065e9.0.2025.02.25.09.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 09:59:27 -0800 (PST)
Message-ID: <2d51cb9e-b8c5-4cf1-bd7a-751fb633275c@linaro.org>
Date: Tue, 25 Feb 2025 18:59:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display
 controller.
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
 <CAA8EJpqM8ZQ-ScEtEBXaUF2Nargtp_TBAyMYvbJ49PGbwPWjaQ@mail.gmail.com>
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
In-Reply-To: <CAA8EJpqM8ZQ-ScEtEBXaUF2Nargtp_TBAyMYvbJ49PGbwPWjaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_095929_906794_C8E99DA5 
X-CRM114-Status: GOOD (  12.55  )
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

On 25/02/2025 12:37, Dmitry Baryshkov wrote:
> On Tue, 25 Feb 2025 at 12:25, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Hi,
>>
>> On Mon, 17 Feb 2025 12:39:30 +0100, Sasha Finkelstein wrote:
>>> This patch series adds support for a secondary display controller
>>> present on Apple M1/M2 chips and used to drive the display of the
>>> "touchbar" touch panel present on those.
>>>
>>>
>>
>> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
>>
>> [3/5] drm: panel: Add a panel driver for the Summit display
>>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/40115947b59f2ca361a47615304dff0a2b69a2b4
> 
> Without the bindings?!
> 

Bindings will be funneled with the rest of the ADP driver, the panel driver can be applied individually.

Neil

