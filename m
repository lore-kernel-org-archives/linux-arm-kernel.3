Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8DFD29DF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxiGIDObJlq7aXCI7xV3vqh5HtX1MZl5+b/eMs8JrbQ=; b=xNiOK1J0WJwyvRjXHRFELAWepS
	EB+/x4Vwk4GIeCX3ZTDJgNA8I1CqMktPQszgxtoKEA/PxYtj6AWR4pZZlVeUw/iGSRAogByzQVO28
	XrdrIAVI2hVRzgwIy9eWU2NbuM5XbFm2S5FBJyOKHQgJixjMIG7wKMBO2TpzPrQgKikUsvJi1nPAZ
	c85rCpsvUVSZ2+Na6XYHlAt/X55pdBW5icYot8k+yvwMwUxZ50mOggJ//O1PdquxlIPpH+OvZG+Wu
	RlmFEd8PKp8fSTMJX7GL313ftwMq3t9MDU2fhE3S10dU6DApTl0QSIMpxrZHxvJuV4ogFmUeWe8mU
	bO2VooDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbDJ-00000006rwf-2sNM;
	Tue, 13 Jan 2026 10:01:25 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbDG-00000006rvw-3kf6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:01:24 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so3916723f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768298480; x=1768903280; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxiGIDObJlq7aXCI7xV3vqh5HtX1MZl5+b/eMs8JrbQ=;
        b=RcX9wQctje3/ca6IqnDSvfbGUkH10oeF0ow28QNF8bTQR+4RwHIxQCHdA42RMHs+87
         pEWK5s9JV78Hz5TWWkE7cZTNlPZz6k+gLvkX83a8ufr/l0ed9KIUcaBYe3bgBP5UPdJK
         VZ6M8bKqHE7mRgXHpKOLkdXD/Tu9NqyIdWORy2Th698EeMAZmxHmERL9T/P0jAlEBYjM
         VJvxklPZVGsh6tOIUzSnWVWy+cLYZ5/dAliRTdFwuFslBaVF18J2VQHwEWz6mlPk9+k5
         XQPL0vuttt/RndHLm17MEk4IwFRefy3+dkIGixlL2tabed4doTD+kVgfW5AT+O0VgkLi
         HaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768298480; x=1768903280;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxiGIDObJlq7aXCI7xV3vqh5HtX1MZl5+b/eMs8JrbQ=;
        b=jD5GvAgTGDq7gurpKv3OOHktnGhP3DG5Lvxxlh+h0Wji/JQbkI+jlIJC1WlHRrjX4N
         BJbqU8V5gR84p8YRecfm4Vdmcjpm/iLwZUZs3Iq4kgGeVFt6fjs4ldl55BNoRPeUvsiU
         8saG97astw/R0OPaoBEnyXvxQygGm4kh2gXdOg4xfH+LF5CN6t9ey20c+mHuPfkxqAo/
         1Izd3RBFc93RGausI3w6PkolE44Z/q2uG1T7kloJuwAl6hykQBBD79ddRuRyCDPNluI6
         4j6W/X/TUZnujad0Bc+mUQ7Ln+Fy0gjtUkoC1y4HsOuRAxZBwzlYBOvqisSBUbt4zqPn
         szEA==
X-Forwarded-Encrypted: i=1; AJvYcCVUT88vlTtzfPO84RCMBBWWUXKBoFPcl9ItSq+pzxOKriH/fXegcPILXfs4witt0QuOeOIil4TqMwnRll5yXL9i@lists.infradead.org
X-Gm-Message-State: AOJu0YyMx52yvmQiKdGyAxAOqorNQDXiZsvpFj+y31ZV2f7VLkCCG2XF
	KRciNrA5vK5mTmkbGErAGAx/s242RP0z5wbZ5lUVyVYa/BOL4ZCtICDbxtx9QAG3+AE=
X-Gm-Gg: AY/fxX7UMHqIS9bghhGyLi+r5avzt7WSBnbhhG/JO6ujTmEVbWR5c+pQUaBxec5lUYT
	DLEyQsGGU8IRWEv9ChpgCj5kORnAk1/6aDo5+Oi8sjeEtEwxeTX6B+bO5vKN42gKto6PKXBzvTs
	vZm82c+BzuXznjVchMbjOHoQa/4ku9DGpBkP3U0vvWPZfQyaoR1QBCIQUmynJXsIakVYAWe9jxT
	PVJOjKx2+al6JIVpToO39tEi0EGmtczo2ZK2VIu5QKIdMwqMux1BoSDaAoItM7F861gDlQyKzRs
	Cb/VqknidXfEPTHTJGlJaRfEy79DMtHwGtw16S72/iJjm9GUokT/i0b5ziP3rxxztKdhYImurgh
	cV1nGBLL66U0rZhytEreLk1NtsngeGnhOIIxcP0s6+Zb8i1dQWWTwwXgzo7hQ0urn81BZ0/GtOk
	+2fBCLDGuGBEDBBFi6oBMddJ3XQNJ/v8wvN4Zzm2g=
X-Google-Smtp-Source: AGHT+IFtEGp5Rx9oO08Dn4BpMJA+C/+ExWnZVveHe5szu0IIx2qhT1DHX8lPqBYm1TAwPRYOdBfKYQ==
X-Received: by 2002:adf:ea46:0:b0:432:dfa8:e1b6 with SMTP id ffacd0b85a97d-432dfa8e228mr10548599f8f.39.1768298479725;
        Tue, 13 Jan 2026 02:01:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080::fa42:7768? ([2a01:e0a:3d9:2080::fa42:7768])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0860f5sm43045980f8f.0.2026.01.13.02.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 02:01:18 -0800 (PST)
Message-ID: <5e3ee829-9c9b-4494-878c-09fa58cad63b@linaro.org>
Date: Tue, 13 Jan 2026 11:01:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: amlogic: S4: fix SD card initialization
 failure
To: Nick Xie <xieqinick@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 xianwei.zhao@amlogic.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robh@kernel.org, nick@khadas.com
References: <20260113011931.40424-1-nick@khadas.com>
 <1jsec9ritd.fsf@starbuckisacylon.baylibre.com>
 <CAP4nuTXUd23e6k6iqRVJw6Rcsc46+RrLGR9ZCu=o28g3u2FKSQ@mail.gmail.com>
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
In-Reply-To: <CAP4nuTXUd23e6k6iqRVJw6Rcsc46+RrLGR9ZCu=o28g3u2FKSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_020122_982861_78EA1CDC 
X-CRM114-Status: GOOD (  20.74  )
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

On 1/13/26 10:38, Nick Xie wrote:
> Jerome Brunet <jbrunet@baylibre.com> 于2026年1月13日周二 16:57写道：
>>
>> On mar. 13 janv. 2026 at 09:19, Nick Xie <xieqinick@gmail.com> wrote:
>>
>>> The SD controller (sd@fe08a000) requires a clock source capable of
>>> generating a 400kHz frequency for the identification phase.
>>>
>>> Currently, the sd node uses CLKID_SD_EMMC_B as clkin0 and CLKID_FCLK_DIV2
>>> as clkin1. Both of these are high-frequency clocks (e.g., ~1GHz).
>>
>> The reason you are having this problem is because CLKID_SD_EMMC_B does
>> not provide 400kHz by default on this platform. We have been operating
>> with this (weak) assumption so far ... and it was OK until now.
>>
>>> The internal divider of the SD controller is limited to a maximum value
>>> of 64 (2^6). With input frequencies significantly higher than 25.6MHz
>>> (400kHz * 64), the driver is unable to generate the required 400kHz
>>> clock, causing the probe to fail with -EINVAL.
>>>
>>> Fix this by reparenting clkin0 to the 24MHz XTAL clock, consistent with
>>> the configuration of the sdio and emmc nodes. This allows the divider
>>> to successfully generate 400kHz (24MHz / 60).
>>>
>>
>> DT generally describe what the HW is, not how you wish to configure it.
>>
>> What you are doing here does not reparent anything. You are actually
>> mis-representing the clock tree, making the MMC device believe it has
>> 24MHz on its clkin0, even-though what it is really has still is
>> CLKID_SD_EMMC_B (presumably running a 1GHz)
>>
>> So if my understanding is correct, you are indeed setting the divider to
>> 60 instead of 64, but you are still dividing 1GHz so what you actually
>> get it 16,6MHz
>>
>> If you want to get 24MHz the clkin0, we need to assign the rate,
>> something we probably should have done before.
>>
>> I'll send something for this
>>
>>> Verified on Khadas VIM1S with SoC S4 S905Y4.
>>>
>>> Fixes: 3ab9d54b5d847 ("arm64: dts: amlogic: enable some device nodes for S4")
>>>
>>> Signed-off-by: Nick Xie <nick@khadas.com>
>>> ---
>>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> index 9d99ed2994dfa..b87bc83b5a9bb 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> @@ -833,7 +833,7 @@ sd: mmc@fe08a000 {
>>>                        reg = <0x0 0xfe08a000 0x0 0x800>;
>>>                        interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
>>>                        clocks = <&clkc_periphs CLKID_SDEMMC_B>,
>>> -                              <&clkc_periphs CLKID_SD_EMMC_B>,
>>> +                              <&xtal>,
>>>                                 <&clkc_pll CLKID_FCLK_DIV2>;
>>>                        clock-names = "core", "clkin0", "clkin1";
>>>                        resets = <&reset RESET_SD_EMMC_B>;
>>
>> --
>> Jerome
> 
> Hello Jerome,
> 
> Thanks for your review.
> 
> I also checked the Amlogic 5.15 vendor kernel [1], it also use xtal as clkin0.
> 
> [1] - https://github.com/khadas/common_drivers/blob/khadas-vims-5.15.y/arch/arm64/boot/dts/amlogic/meson-s4.dtsi#L1358

OK looking at the driver, they reference mux0 (CLKID_SD_EMMC_B_CLK_MUX) & mux1 (CLKID_SD_EMMC_B_CLK) and they set parent of mux0, clkin0 (xtal) which is exactly what Jerome said:
https://github.com/khadas/common_drivers/blob/e9cec30b94864f4f3518cc492940690709a5075b/drivers/mmc/host/meson-gx-mmc.c#L751

We need to assign the rate of clkin0 to a low enough rate for the internal divider of the SD controller
to achieve 400KHz.

Neil

