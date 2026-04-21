Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283F4F327B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 08:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeWbx3WFAL4pMrGDmq2TNjEXsVaT12Mw93GvNXeYUa4=; b=HVOlqM4XLQxBC4QyXrFL6Nf/Rs
	XQweR7zMMLfrTjtBZ/ZUQyIrmamAQUWPgubXEY6+pJ9GN2XZ4J4uMyJjSBhInb3rEffFLdmZNJ6I2
	YKk/2MfXq42GDM3y8dNgv/AJaMKA2w1zBL2pxwI1YbjaC+3furkGV7qVkHyitoMMytLKk+DAC4niZ
	JYJuamjQWckE/btHN/l6ufSsLAuJGdS2wybNPJBvy5pIGsBhmmU35RxJK6RMz9HN/I2XnKtjnjrJ5
	2/9g4Oappwi0jvEkemlNUa4CLGyN9gSrLRMS1jbshhU4Fcb8ksl5kei6lC/La+sWsknAaUvZl9Axu
	lAo6R1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6L5-00000008FkF-0fDw;
	Tue, 21 Apr 2026 08:20:11 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6L3-00000008Fj2-0e43
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 08:20:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so29700275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 01:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776759607; x=1777364407; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeWbx3WFAL4pMrGDmq2TNjEXsVaT12Mw93GvNXeYUa4=;
        b=e9dUEd1o/kZEYcoelltGg8cnnB2RL36CHtRjJyRq698U+DgEQP5ALJyr5CT8MU0xIz
         F6iaubXXTXCQ4vh6XQ+MxRCINscUltclK/M7Xv1Czz0cVjY1wq4W/bP2umWr2MEeKxKp
         eke/hD3yM7SoqlDZXNleFJhS3PH78Dr+VrURgt4rPKkEDctCoWmrQOF9N6zUNh9QzFXQ
         PVlQjc27sQ9gSjdJC3IPSsH3OAJ47dLtjp3o6XRWWD5WB0/9o6c9neYtGw9LV75HOZx5
         WRuZK3ZyjToZ+gEkpYxTcXPMvODJWjfS4wf5x0cvq0ZGLVsTMBaxcqdC9GwuCeTk90y5
         4Dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776759607; x=1777364407;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeWbx3WFAL4pMrGDmq2TNjEXsVaT12Mw93GvNXeYUa4=;
        b=gfcCZZZXkReh3MeweHoayStQOlKGZI5FJny9tybf+PcGPESxe+QfHKMpYlyyJVnwQI
         8xPLbZV7KXHtJD47WV6xizoIIJYi7TRpDXXKVYcASKbs4eMoonO3B4ibJ5ihP2ywghAA
         m6XutlpLwYzb1U6Bgscshl031xWX2weMmG3nYjs0AYJGQX2J/HxHqfA7VaDwDyPKaWeM
         Y1pUbnCTrOUi5d/xt5+rElTBNiIgBHTknTo/NM5gjd73Kl4OvAXAJzUn76rvnauSg5J2
         Y6/1mPqAAEN8ErZkHLEKmTvXWtAYoOyaiw71uDSW42cegfiVPLCCziIfTL68REAk1c1i
         h7HA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZxmktQdBD/qO1+D4TkaziLd26DIF43E1MscbbG4jbBiy56bDeBL35L+Wd9c7GhKxrQ/rVcKaNAb41kGm8P1S4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw2X9+RNFyhp/f3/oE6QnnYe0IhEgxZ+Cmd+5cN3+wpqMGDGgW
	3bQjP0QmEWHHwq3LTsCUBGCrfEzzOsfPhGJhewdt/hnWu/gIoW34rQK93riedwu2sG8=
X-Gm-Gg: AeBDiesW5Aa5Otg1YiM2SZQLnS+3HPFhh9EEa3QXBh+lLcRGwbI7bmhx6wzCbLhUVfU
	imVTFJHAq0dVfVqCXpvw1B45aSwPq1WMXRCq3mG5putqCK+dvPGhsFBh8nBiKJkiAFCT7u9Ml/T
	K4HiHdMa5JS0ofYz9iAiXBjDPUloXBrSmYRon2s2NdSBYyfnKqWq2GUB2WhehPKosOLtVw/yaYD
	o2BB1C93oG5/aXU0LhM9a+0+mDGGyydedJW78I5sZHRUq/37DCMrdVtPN9RLXGD+E5Rmctea6eU
	p9LGwlk5wtxzNFZ85w0IwZmg4u6XqIq+eG4C8dGTGsYlVGkmj/cZEDG4UczvMB4fhfBsvGApaBj
	MHvXL4PYAOg6hwnZu7AvA6DQM2WixmVIpU4s9Sjz4lFihgLrjOQgfuuYWl13o6C6U1A7TKBiHp4
	AK439MQA4B0h/eIiMBghhCEdvryRj/0Ty3BlP1Wmy+gQCYSbq5+qtY33sXguhoHvA9TJB5bre5a
	Kryvs7S8QBCjolw/86B8ChYvw==
X-Received: by 2002:a05:600c:308a:b0:48a:54fd:54ea with SMTP id 5b1f17b1804b1-48a54fd690emr22699365e9.12.1776759607201;
        Tue, 21 Apr 2026 01:20:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8cb:a891:9d12:1873? ([2a01:e0a:106d:1080:8cb:a891:9d12:1873])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489fec8f7cbsm90004255e9.11.2026.04.21.01.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 01:20:06 -0700 (PDT)
Message-ID: <3a1dc60d-5da5-4353-bc6c-9cec4b3a9067@linaro.org>
Date: Tue, 21 Apr 2026 10:20:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: amlogic: t7: Add clk measure support
To: jian.hu@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
 <20260421-clkmsr_a1_t7-v3-4-efc00b0f9e6b@amlogic.com>
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
In-Reply-To: <20260421-clkmsr_a1_t7-v3-4-efc00b0f9e6b@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_012009_221239_62C6FC3C 
X-CRM114-Status: GOOD (  13.23  )
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

On 4/21/26 10:17, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> Add the clock measure device to the T7 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7fe72c94ed62..6a22b48a42b7 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -656,6 +656,11 @@ pwm_ao_gh: pwm@32000 {
>   				status = "disabled";
>   			};
>   
> +			clock-measurer@48000 {
> +				compatible = "amlogic,t7-clk-measure";
> +				reg = <0x0 0x48000 0x0 0x1c>;
> +			};
> +
>   			pwm_ab: pwm@58000 {
>   				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
>   				reg = <0x0 0x58000 0x0 0x24>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

