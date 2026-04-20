Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB8AF557EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2e/JkWh5NIRiOWxLUHpiAERqrkA0EPAqAxoaneAyAOY=; b=qzO6QqPbTDlL2F6GeGK6RI9oRN
	sxrHCJ3bfysWJTcUIEP2NjFqE3A4lY3Ej+4kPpC+AtFgJkRV4FmCYdTBwcIF+GUJTmS+5T1e2Ft3V
	N6eaj/NTYujAUNrjjPEecMdpRU8rFl0RjUk2U0ddrQmcKY2f27Us/43ma0j5Qw/BIK8C590rDXhfD
	cQNyyJH9TI5ivOsAlVhLSvLnKTWL8xqREIRDjQVhPYCRX00Yubs2ZxPAKPikMmeRpB3WClRi4V6xh
	XnfW9zsLXxRGSyf1BN8EouRcFgrvAoHJo9Zsl9mJx8iKY6oJlLoKoDg0WcrhKkakRkEr/W6XCgd9I
	DA34YA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkMT-00000006dbR-0gth;
	Mon, 20 Apr 2026 08:52:09 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkMQ-00000006daj-4AO2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 08:52:08 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso31047445e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 01:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776675125; x=1777279925; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2e/JkWh5NIRiOWxLUHpiAERqrkA0EPAqAxoaneAyAOY=;
        b=SHO8g7Dnio6vlVe9IxlZ3XfVLm5X8p2DHwhYK6OOUcSVcfM9QOL+y4YPFMs6NEs9r2
         8BrCEdnNMdEhs6w8mo9lx6fZ9wiiGyYDUqPF7s1/ps7dpHJ/XuhUTfRpqzAOEMBt52GB
         ZeiJKIi7vb4Lu5ibc1SXAvxpeb3id41kDt4bP98rqkJ6sAa9m2VHIG3+QZ++tx0p+FUJ
         HxPts0ng+qvmgoFaBcMM+eI5kytWxa2eDhxn/XOP+UbvoC5zWtRdE56uUXUkqfCcr73e
         5Uzipnafv16uKFPm2c/10XkeaQIaT1peUR4EGcBUNKxwmZ1CaHaYQsX/hFR7XHN9J5ij
         8FUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776675125; x=1777279925;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2e/JkWh5NIRiOWxLUHpiAERqrkA0EPAqAxoaneAyAOY=;
        b=JWj5cAxPYSgte1jtGrpUF7HfkOG+SMQBLK7qVzOH4irQc7cpMVST6fTF2xAyX7DEWO
         6JyU1EoBo40zrsU/2VG2fYk7bD61hX9ZRLZlZ6XD5APxlTessgm3EN9HP6G4rcsCE9++
         hWTkrAVspqCB1cz+71lC1yrvJLNEentgBzTamMm3+N/bKCSlnlguw1rxuP2sOgcq60/a
         MKSzPQ+XU+ygfAGeXfOy42xSzPvF16QJWdMUQjBf5UT3UHq0nk0Mk83vVU8HCnecuI5d
         zQZFd/VhzGm4ppIG5PsyA6JZ7uQ5YcAMonSCDeZ0jiQAX2xA0YsZXuTfeap/cYXnrcop
         2A5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/pnEEidapKeEih4bAFDBNQ21qBv4Q/NuJ4Vn5iA4PuUMILExaLhWriXnMIcFgS19LEEMPsNz35cHjUh2427qjH@lists.infradead.org
X-Gm-Message-State: AOJu0YysSh7XvoYkqLnKsJM7m+RuUwk51/wf0ccMv8KDJjatagzIbc1i
	Pd0A3EQ4jnPNqcd6xOO6N2BLSn7+ys17fY5tFuiS/1rEC+IzRYhjA77s5EMbeLrTamo=
X-Gm-Gg: AeBDiesD3+25rdiNCImbHrcx3Jl7fhdGCj9C6hDnEXKnkdWmb7aIciD4ss9+y+LydEA
	g7JMjrEysDMe+BwLwvV2GmR9V4c3voPsr7ozS/Jj0NGC7A3NXl/WSgrCJic3BlA+Mo4ThsZI4WX
	WevtKbULbFLEKASCFOzo95rJ9un8p2rppQSPnuJQpk1uYkd3nm7koYcX78kbmTPSDpzUEbk1Jge
	F60NPcbCfp4qvpo29NyH7ysqXL7zO23LtbDZjKrVFuNd+7XOw1QDF4x0oDRmm91FXr0R5MUfa9/
	+jxMwLvK/78xZ3msHBsDiLSD7gjg8R3bUiDuV8Cr3E+VaoRILv2jQEDWAl2RHKRtkQKuoN1Mp8Z
	IawCxE4mN6hoHf9gbY/tUbYzPXPBDzeI50damGrTEIYYmX1jTrKb6aMCIsnJuXx5oJ9KhQsHPnE
	xWP7jrpDy2v17WDdTwVxglUEAkquMjiI7qfEW+9+atF6aRgjKyxpdgOxXiSGmYpfD3uHyfFrsVG
	riwhSd2oiw+aeWVPQ==
X-Received: by 2002:a05:600c:1f94:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-4891c2d2213mr44057085e9.5.1776675124969;
        Mon, 20 Apr 2026 01:52:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8290:9fd8:8af0:67dc? ([2a01:e0a:106d:1080:8290:9fd8:8af0:67dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc2cacsm27522967f8f.13.2026.04.20.01.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:52:04 -0700 (PDT)
Message-ID: <f2074119-7b4b-4481-8e39-c822dd67000e@linaro.org>
Date: Mon, 20 Apr 2026 10:52:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: t7: Add clk measure support
To: Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
 <20260415-clkmsr_a1_t7-v2-4-02b6314427e6@amlogic.com>
 <ae61c52d-814c-40fa-b02a-833377d840a8@aliel.fr>
 <64cde9f6-4f28-4ba7-8362-aac28887ff22@amlogic.com>
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
In-Reply-To: <64cde9f6-4f28-4ba7-8362-aac28887ff22@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_015207_095286_2813D646 
X-CRM114-Status: GOOD (  18.57  )
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

On 4/20/26 05:25, Jian Hu wrote:
> Hi Ronald,
> 
> 
> Thanks for your review.
> 
> On 4/17/2026 5:48 PM, Ronald Claveau wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Hello Jian,
>>
>> On 4/15/26 10:33 AM, Jian Hu via B4 Relay wrote:
>>> From: Jian Hu <jian.hu@amlogic.com>
>>>
>>> Add the clock measure device to the T7 SoC family.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> ---
>>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> index 7fe72c94ed62..cec2ea74850d 100644
>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> @@ -701,6 +701,11 @@ pwm_ao_cd: pwm@60000 {
>>>                                status = "disabled";
>>>                        };
>>>
>>> +                     clock-measurer@48000 {
>>> +                             compatible = "amlogic,t7-clk-measure";
>>> +                             reg = <0x0 0x48000 0x0 0x1c>;
>>> +                     };
>>> +
>> Can you please order by reg, it should be between pwm_ao_gh and pwm_ab.
>> Thank you.
> 
> 
> According to the "Order of Nodes" chapter in Documentation/devicetree/bindings/dts-coding-style.rst,
> 
> nodes of the same type should be grouped together, and this takes higher priority.
> 
> So I have placed the clock-measure node after all PWM nodes to avoid splitting the PWM group.

This is not something we ever followed in the past, and I don't think it makes sens here.


"""
Alternatively for some subarchitectures, nodes of the same type can be
grouped together, e.g. all I2C controllers one after another even if this
breaks unit address ordering.
"""

This doesn't apply here, so order strictly by address.

Neil

> 
> 
> Best regards,
> 
> Jian
> 


