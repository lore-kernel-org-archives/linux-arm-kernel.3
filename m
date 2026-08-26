Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D980C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 09:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stp9PLONuG5ZO5VWMIxZEJbXb8VtweiqjlFaBczDy5M=; b=Ytl+71248KSEModpQyei2CPoIk
	SR/K8t4X5YiH29OgoQ8knz2y/R6f6NDdQXfZ5bD6FwIS/gHSX/Iqn6WSMrhfzDBOKJR6ykvo2GRj+
	DFySSW1OKv8U7zPcvtyDA8Ig6cPYhOe3H9z+GxDVhiBSJW3xSJUg/HHAh1AOmHy2gE6oihNhikBIU
	jOlAGDkmLiyHH+CSm5xLjvWZV0TfUMYIV4375ydx69pwBxAS73WKfeXw3II81V9bJrhvruDrbz0aD
	+hO4MBSummTPokh2zX1PnN0L7/2CeFK7ST52LF8e4YhPA6C6QH3cburm3o9ZjrbLGBAMNChSTzlG6
	fNE+DOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9X1-000000028YZ-0SEJ;
	Wed, 26 Aug 2026 09:02:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9Wx-000000028UE-023A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 09:02:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so5400015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 02:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787734964; x=1788339764; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stp9PLONuG5ZO5VWMIxZEJbXb8VtweiqjlFaBczDy5M=;
        b=qxY+qysyK+vu8UyTwNMQiG6m6Vip6GOnRvDkVvzo9AR722L1q/G5nJYOc/LmbW0GBd
         hfVSWmjK3Omx7fiFYdIO5j0aJQ1FpJzh0oToe+n3bhKj9TNCHxgf8lr/6JvWKcUdXl2N
         UKqQetyAvfF4nXYoOdIoYFykJQXjGt4jRGvOSL9l17wc8/U0qJiw92VBPfszvcrQDEcF
         IEnsILjU1bcpzVeIRxaG34JVNzEx8Zk8hPHIi+C0cdwmK7pdb4NqYR4SWqdrq1sF1NkP
         zHGqeKeHkrkv5QztDGPTl/xhK2OoX2+wicpWUOydijLWUY338fvu7yTXtMiji1+BjIez
         HP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734964; x=1788339764;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=stp9PLONuG5ZO5VWMIxZEJbXb8VtweiqjlFaBczDy5M=;
        b=GB5x+vhKkCMb7kzGr78HDIB6Gic46v6zrcBtg4hmqJe0H/9LZJG4gdJTzwbqEUZa3R
         MBpIUoTZGB1GEazDeHptPx93Wn3BeQBIS7H7uj6FpuW7sRg1yGmqlzZKwnsL8zZ9t3VP
         zipY9Ie8Q0GwRxnz8Zljd1Hc9NsaT3gpfBPIxR3lz4R4xbT3lpapi91JSBSZRJBKLDtu
         QNwFphsNqC72HcpzASGoOYehVCq9mfosH7MaZ2Iw4IInz2IHhU/HPUtP0CCHC8U/TZV7
         Imsa2Rvputv1fJhrncYbVGMq6l7DP89UduAGK6+9fq+S8DZPgYs5ovuXwIP3PEdWeYDZ
         3wAA==
X-Forwarded-Encrypted: i=1; AHgh+RqYHH42gyJPa5srHnYV2atWZe+/q6r7AhHr483c1vwj2kVi5Epp+6/C9GL0Ie+aKWcGf6ySaRhCEn59+R3vgCO6@lists.infradead.org
X-Gm-Message-State: AFuF++kXMz+Z46VfxKcBbZacOwz1yuuuXDJ9e+jCXLGTCpCCZMObQE+6
	ym/g5ecdfBZzqhWfuOOV0z89EFWRKQ8dylz1SnemmsJtOK2zdHcFZrc/EVkunOtvkt4=
X-Gm-Gg: AR+sD13lCHFVqHd8V45y/glReFRwoesC3HAropyoUb0DNppTJWJrqUrXgc9LxS0T1vY
	xBnr0ThfJhT2yDIqhwzbu/EaJI0pxWLd4WDG4nG7TwK5mIbIKmgfuokru6KND5LPsDSIcA/68H4
	pSMUgr5ZI6p9L+4j8poqe0G+5HHfBgOHsJLF+yDlF2rKFl8zgQ48Mhy2CSuPxGNShXKMz7srALR
	fVJ0M1CNx9D5JmYUiIa2Qs4psbhAiBv/3xhUU0U+EnvKgK/5W6pwWp7V/AriZjyx2k0y+KtyjCv
	Qq0rvzeqXsjrZbGg0ZBxi3M2KCdrBuAMOURmxBVCaX8HqfgC+pyz2QR9+vVkqIFiSyaUNPwjpKy
	3MLdvbjQVlE+kcSCilSzNDLpeEyEr6QUlhq2mJkq042KQ+nRyEUWVcFJvM2pbmN9rLjMOQQIp53
	X3cICTNGw3+vnsgYCc+e5JwzVnoDI5vWnSOhUp9S5KZ0zKjT1kDDIhoEdwBVlJ1AWq1JW+fQ7Iu
	HCw1LQundPDy/pbZMdCDrUArRigUGSLhBvZP9YU91rphA==
X-Received: by 2002:a05:600c:3b8b:b0:499:7a19:408b with SMTP id 5b1f17b1804b1-499dc722993mr44636675e9.11.1787734963958;
        Wed, 26 Aug 2026 02:02:43 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:135f:84f0:a520:10fa:2386:b410? ([2a0d:e487:135f:84f0:a520:10fa:2386:b410])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm19644365e9.2.2026.08.26.02.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:02:43 -0700 (PDT)
Message-ID: <048697c8-8331-42aa-accf-d114774ac5fd@linaro.org>
Date: Wed, 26 Aug 2026 11:02:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
To: Lucas Tanure <tanure@linux.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jian Hu <jian.hu@amlogic.com>
Cc: Brian Masney <bmasney@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
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
In-Reply-To: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_020247_130687_23522C40 
X-CRM114-Status: GOOD (  16.67  )
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

On 8/23/26 17:40, Lucas Tanure wrote:
> Hi,
> 
> While testing mainline Linux on the Khadas VIM4 (Amlogic A311D2 / T7), I am hitting intermittent system instability, storage loss, and memory corruption during boot, unless I append clk_ignore_unused to the kernel command line.
> 
> Because the failure is intermittent, I am running 100-reboot test campaigns to bisect the remaining clocks and isolate which clocks are critical and cannot be safely disabled.
> 
> As testing takes significant time over serial console, I wanted to check if Amlogic or the maintainers could shed light on this:
> 
> Are there specific T7 clocks or hardware domains that must remain critical/protected even without an explicit in-kernel consumer?
> 
> Current clocks being disabled that don't kill the board on a test run:
> 
> [    0.380313] clk: Disabling unused clocks
> [    0.380413] clk: Disabled unused clock: rtc_dualdiv
> [    0.380718] clk: Disabled unused clock: rtc_duandiv_in

Those could be used by low power stuff aswell, not only RTC

> [    0.381377] clk: Unprepared unused clock: a73_div16
> [    0.381972] clk: Unprepared unused clock: cpu_div16

Those should probably be left enabled if they're used by the DVFS code

> [    0.382605] clk: Unprepared unused clock: f50m
> [    0.383174] clk: Unprepared unused clock: fixed_pll_dco
> [    0.383786] clk: Unprepared unused clock: hdmi_pll_osc
> [    0.384416] clk: Unprepared unused clock: sys1_pll_osc
> [    0.385056] clk: Unprepared unused clock: earc_osc
> [    0.385652] clk: Unprepared unused clock: pcie_refclk_osc
> [    0.386323] clk: Unprepared unused clock: eth_pll_osc
> [    0.386961] clk: Unprepared unused clock: pcie_osc
> [    0.387548] clk: Unprepared unused clock: mclk_pll_osc
> [    0.388187] clk: Unprepared unused clock: usb_pll1_osc
> [    0.388826] clk: Unprepared unused clock: usb_pll0_osc
> [    0.389465] clk: Unprepared unused clock: tcon_pll_osc
> [    0.390105] clk: Unprepared unused clock: top_pll_osc
> [    0.390738] clk: Unprepared unused clock: aud_pll_osc
> [    0.391361] clk: Unprepared unused clock: ddr_pll_osc
> 
> I am not forcing any clock to be disabled; I am forcing all clocks to stay on and letting them be disabled if unused one by one.
> 
> Any guidance or hints on required platform clocks would be greatly appreciated.

It's hard to say, this is dependent on each family, Amlogic should be able to help here.

You list some clocks, but I don't understand you say that it's stable only if you have clk_ignore_unused, so how did you get this clock list ?

Neil

> 
> Thanks,
> Lucas Tanure


