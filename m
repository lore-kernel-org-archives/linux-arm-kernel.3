Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC960C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/ECa4tNd88XdLDSwFPQYikw5L3eXcClU7jpbYu21eM=; b=gDwhfXi/UxPbDmtWR3rFLFHdoR
	VXJcB6OhLswsnX6EInlVJKBoMB3DIgfeJEGJZg+EvJUREOc7AhHWFVDLb669wk3evdbv+8Z4gf4Vr
	hGrFYU0HcLgCZOTTP74A/AEB/IQxpdugoF2/VHdSs3JaJS+dCEW28i/JGs4Xc66mxs7y/D0CSwBj+
	V5RmJjOyHarIrxmtgImx6FCCAgibG0XUM9zEFO7oRJupVA9p/ThmZDm/z6NZq4CQzm4W1pfzPxAn7
	ud7vNcLuC/sZzlK3erYrXjB7tceNwWVOdYhi/94yTf5CRd5fO7KE6mnTlcCtFUHR7LZ9FJKyxNsye
	sgPBTctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVpA-00000003gUQ-1ZHl;
	Thu, 27 Aug 2026 08:51:04 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVp7-00000003gTL-3o1W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:51:03 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47fd4531020so988620f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 01:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787820660; x=1788425460; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/ECa4tNd88XdLDSwFPQYikw5L3eXcClU7jpbYu21eM=;
        b=osw+Tkk/tsSneZngcrKtHXl+zI1JwrAxHBQLYTY3vfuFp+sZhffylR1RiRVmvyhmGx
         kyW7M+kZ18BDDZlVioFQzDY7iX1YRHFWA9zo3Kb+YA63bnn8oy1ieFEApefnHZLHbYTe
         CZyFV+vFFq/9RBnPDSA62xcTnK89RLCNEwgxViipK6QSPdokN2he/uYzzyvKANdDwP1v
         onEut55XuhJASIs9qAwFgNhleRR1Ny6QXNdumWSN16Fvm8v3d7VvUIZ273hzoY2wcdai
         wMMWOQ8tBjAfPkWTmb8aTDt/Oe4PIke8nWsnnK4If0a31K+g5ALj7ycuCE1wqfqUyi2q
         mJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820660; x=1788425460;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/ECa4tNd88XdLDSwFPQYikw5L3eXcClU7jpbYu21eM=;
        b=jK6wVaYnDcKZUfsFgSXo3e7/Wf+x4SxS9hlf6Q1HZvQLR8PPlmFqlpUgPZDqUJAVnU
         2Dvj2zXJPwvlI6jynZzwG5y0FQw0PU2TLkkdFiRmqAq7URcK6kCkPMTGiYeOzx/dyOh4
         BsQKhG4NkWwU4aygFQx3n6bqdiuhdTX37DYthxiT4bI3xzsjMS1ASeIbUJVOkQB2QxmA
         VO1TGAN4Cikwp+mP7RN2gFyPuEhm3uKFFIXA+Ev/5nLkwAYlTWPMpZu8xpACvY5ByvNR
         h90HVPxGtCbYj2o7YAzM249zfrWt52SB4Q8vxSlKfjU+cIyY6lOBcWe56RzAtJZeuPyZ
         NK1Q==
X-Gm-Message-State: AFuF++kCvtKBCLnsO8qWhaDkmNMTzLhSXfKLJjUaDMItKVqCJ9voqB1B
	MHGxWoRBfBkywEUmVd1Qajc4TYdRO6IN+vdLPRJFEkfJRRwLxphbi6jd5jIm17lFS8o=
X-Gm-Gg: AR+sD13nbz/uWM2UeuOuxOgeW/irCSnm3Fe3C8l+A5qRYCHmDP4UGuoW6Xc7wevIDoX
	B1kp22ePZbNEA1j1tj++teK0y1X8QKSSEoTVWqMpRFQa1hwAVWhTX4PyAw/Kzn2CBE8HD/TZBr2
	zfmK3Ju4cs7WAQ5Nt0+/B4ymorMr7wOLjdo6r+0bTi/f2FPCSoOJTS0UQDh+05CeunW/mMzpmD5
	+W6nA5vkO2g+huvRVpz3L8iYPNGsSEVIvRcRwAVAKrhPXuIdQKCK8bugxUGzYsoOAURUjV0UNa1
	WVaor/NL15+iU2WXMsNGXqfLZngXdEXyg3+RFafS2Jm3ypB54x3AZMr8eYUbmUCyFpJA/D3FYuo
	1eNa3S3YbfmrODe5QDQ7NX8sGygIgV3JbSz9SfbPVj3/UDpReluRO6kix1TImxmK7oT4Px9Q5qT
	9ISekj7QUxDrof8N0O62ZfkBHICZc0UBWwOo/k7xz+rx5vW8lL3C87TgWwcMEqJPEO/HgA9g==
X-Received: by 2002:a05:600c:a0d:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-499dc6e9b00mr154198865e9.3.1787820659765;
        Thu, 27 Aug 2026 01:50:59 -0700 (PDT)
Received: from [172.20.10.4] ([37.165.68.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4ddf5023sm30302265e9.13.2026.08.27.01.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:50:59 -0700 (PDT)
Message-ID: <57e0daca-485e-4672-abf4-a1f8e55777da@linaro.org>
Date: Thu, 27 Aug 2026 10:50:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260823115335.102219-1-tanure@linux.com>
 <20260823115335.102219-2-tanure@linux.com>
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
In-Reply-To: <20260823115335.102219-2-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_015101_987203_B27A4D7D 
X-CRM114-Status: GOOD (  16.18  )
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

On 8/23/26 13:53, Lucas Tanure wrote:
> uart_a listed the 24MHz crystal for all three of its clocks because the
> T7 clock controller driver did not exist when these boards were added.
> 
> That leaves the real UART bus clock without a user, so the kernel
> turns it off when it disables unused clocks at the end of boot, and
> the board hangs.
> 
> Update the board DTS files to point uart_a's pclk to CLKID_SYS_UART_A
> instead of the dummy crystal clock.
> 
> Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add initial device-tree")
> Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> Assisted-by: Claude:claude-fable-5
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 +-
>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> index cab2ee9ea0d3..ca7536f772ff 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> @@ -33,7 +33,7 @@ xtal: xtal-clk {
>   };
>   
>   &uart_a {
> -	clocks = <&xtal>, <&xtal>, <&xtal>;
> +	clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
>   	clock-names = "xtal", "pclk", "baud";
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index c41525a34b72..75d81ad6830d 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -266,6 +266,6 @@ &sd_emmc_c {
>   
>   &uart_a {
>   	status = "okay";
> -	clocks = <&xtal>, <&xtal>, <&xtal>;
> +	clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
>   	clock-names = "xtal", "pclk", "baud";
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

