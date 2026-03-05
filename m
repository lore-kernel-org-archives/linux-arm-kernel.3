Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1049F30946
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHYAEG7kdjVY7HjponX9xKsbsh2G3LLKlsqfumamkXE=; b=f1f+WVs45DFn/z1VUO3magoDI5
	dswj5TibUvj/xcTSm4STZmO/3A0CGEaWk1bPUD+jWHSwgea9ZVYrVfl/ABnI/iuntsgGXtXGd0uYO
	DP4sQXGEZECL4ioC8EQKwueJQCw+vEYPIonxqMdtjMj82lIka3F5iIbCHeirFpOv8EC8lqCLi+h15
	l9eeKDQr0iup5fS4a0A9cUV2GdulCdtAK5grh0296MPPTXOcEMxBkUPxTIBmuz7BJ7LH0XFViW5bo
	CAswuC3xVJSyToS1B2Re9k8MT+2tgvVGhJuXmhCIQmJfK2Mky0FYVIjYKdOvK3Q2I6QjaHZ1fOln4
	92IED9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6zn-00000001giE-0iJ7;
	Thu, 05 Mar 2026 11:35:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6zj-00000001ghN-3gyB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 11:35:57 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so638901f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 03:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772710553; x=1773315353; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHYAEG7kdjVY7HjponX9xKsbsh2G3LLKlsqfumamkXE=;
        b=VCeZ52XA36y+eCuz7otEu54EUP61CZ1w324jX5ngb7MI4DiAAK2uzLe6mTFOMCn153
         haqMVKssRqYeahHAOmlM7jPxZ4QFr2F6Az8D/A+YwS43hdalYXXWbVRx1e7G42D5INW9
         SMrQ5w6uJLZQkGU3o1XMJ+VOeuyUoBykDs8XeAOBLKcIDQsix9IqS3jHef5y8gZjjalP
         hGb+Ybsxu6gRORxqDiqeYAHEotAyeKpmfnWCFBLGQBrGUfZGQcA8aJSc9IJbgjV688cP
         TNfKf50xI0uq7IIkv4ESeXLJGw9q3ZesGWTND6hmKFVOKYLuZY7F9Qr+3dfvj2J1abkr
         l+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772710553; x=1773315353;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHYAEG7kdjVY7HjponX9xKsbsh2G3LLKlsqfumamkXE=;
        b=V/lQBXPH0XUpWAPHKmbPdkfPToQ1cLRyC3azvwgieQx3lhfzFi2jgeObcQQ+NDFOHX
         FVv4EJC3DI14PZ6a3kUfeK4e/ZBRkDlGbYFM03IN8qWQNpBR2LyN/dlg+C407AJ5VFqY
         kEAtgYXlCT4PA8QqC0CAnQ+CJ4Fi0FiL082pxqPCR66q4PkhdPDRVTXXFqAhYW/+GqzJ
         e4RQJN2rb1dlRETR0j8FbWQrvoRbB1po70Bb5c4AQykpZLon6NzRDkutfR2ee2KYfKwF
         wp5MiBg3ortIj3LqxNtj68lYaWaFfGRStkxFZMUhI9oxRA+j/rAlsIAMI45IsYyzAGL1
         tjnA==
X-Forwarded-Encrypted: i=1; AJvYcCVoo4XQr8oqh7Bs8Pnm4DXTibnCgLlrCT7RQkOJw/Ch9DOW+iW6SolnAXLH7oqGZzd6mYsq8K1gGHj/h2Ez2aMH@lists.infradead.org
X-Gm-Message-State: AOJu0YxgMsQSoKCv8epsV1XyoKV68qyeiESJMCamPemmZJyzI1vQNOwZ
	02UT3/7V0gx8Bcw4uOTte4+/twE5tGmLMUUYQ3DUwZ0AaeroJT7r6uoV0HAflIcmKu0=
X-Gm-Gg: ATEYQzwr1fmA5VVOYWlaRRXpBe4HtDnAIH+BbODk2M3lv2qSiP5/QuFqZO4xiksh9Ie
	qoM87KF42pV62oj3Tdr9eUmdVo6YHvtOWKB3fdsVM9xnyhVqvrwoiklOTnGz1E6KmBqtvKrXOIH
	RNJTnc+dQtb7dcV/SYWSitY4QdRMXXbb4RYhgpX/QYPBO+0ru+1nt+AxsXrVJkj/9PXrZSRBwmG
	TFtJtX8hT0TwohBQIt+davyIx8X8lybVvpNUW+GSlHVZLZF9xovpDh1UCD9jBnoGk1YAwBmLCau
	YbozcPZWZaMz8YvMinnj781qgfRZEx5c0Dw3PR2a84SkSDZ0+BCcqcYdfWwzq4j2dtpCpUo5w3E
	enI3Tc/ec3pDnpQ5wPK6OSm3TbtUpbsfgvgqEKR14RtTcyxsJPv3XkfZhwvf5a84KQanWWSPSM0
	azQsEDafCcrd2yU/wvyndAD6B2FP9NKrE4WpQjgLqLIrZALTHGR4l4BTnjnAa+iDrijzcEw4jst
	8Rn
X-Received: by 2002:a05:600c:4f8e:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-485198744bfmr97517545e9.19.1772710553227;
        Thu, 05 Mar 2026 03:35:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:73bc:1eca:d39e:509? ([2a01:e0a:106d:1080:73bc:1eca:d39e:509])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fafe4c9sm47514905e9.15.2026.03.05.03.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 03:35:52 -0800 (PST)
Message-ID: <278f5018-9183-4eeb-bde1-7c19adecab06@linaro.org>
Date: Thu, 5 Mar 2026 12:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC v4 1/4] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Zhentao Guo <zhentao.guo@amlogic.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
 <20260213-b4-s4-vdec-upstream-v4-1-c7112d00d662@amlogic.com>
 <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
 <75e55ceb-e6dd-47b5-a829-66f6fbb3e13e@amlogic.com>
 <2f68ee18-e9d9-4da6-900c-93a7663b3c9d@kernel.org>
 <598c161c-d157-40e5-992c-912540589d7e@amlogic.com>
 <58d57a6c-7c69-4f5b-a4c2-f34ef0238511@kernel.org>
 <26d0f52e-3681-46ce-b0dc-0cb020e8d9a1@amlogic.com>
 <69900d76-3820-467a-9fbc-13f79189df2f@kernel.org>
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
In-Reply-To: <69900d76-3820-467a-9fbc-13f79189df2f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_033555_965941_6C532E41 
X-CRM114-Status: GOOD (  14.55  )
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

On 3/5/26 12:08, Krzysztof Kozlowski wrote:
> On 05/03/2026 12:01, Zhentao Guo wrote:
>>
>>        2. Why canvas is needed?
>>
>>   1. Since the ARM IOMMU HW is not integrated into the Amlogic SOCs,we
>>      need canvas to prevent the DDR memory used by the decoder from being
>>      rewrote by other hardware. Canvas provides the decoder with a
>>      configurable DDR memory range, as well as hardware-based detection
>>      and blocking for out-of-bounds access.
>>    2. From the diagram above, we can see a lite CPU called AMRISC. AMRISC
>>      is the controller of the decoder HW and the decoder driver needs to
>>      access the decoder hardware through AMRISC. However, AMRISC is a
>>      16-bit CPU and cannot directly handle 32-bit or 64-bit physical
>>      addresses. Therefore, canvas is required to convert the addresses
>>      into index to facilitate processing by the AMRISC core.
> 
> This suggests "Canvas" is IOMMU, thus use proper IOMMU abstractions and
> you cannot have own phandle for it.


No it is not, canvas was used for a long time for the display and video processing side.

It's absolutely not like an IOMMU, the diagram is quite clear.

Neil

> 
> Best regards,
> Krzysztof


