Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AABF557E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4gP1X/1RVo+LT2tXlc26R+u2cPe0X8dceny5kiXZXs=; b=ueYlngJEu4qwqGVk8cZpHYYFJu
	yosOH7kE1WxpsACDKsBSr0Uu4/z7yRY3VSyYqd42dx47uHM2WsrmOohh1Y99Tq6TMaIhvXnYQFvZ3
	BbermMldouewe7NuMzfrHHUIo6YXW4cnojzc6yPGmHFEcWhCoZFDqRf/Ug/qdJvjcNsOt93zMsos+
	iiD/AzhOYZG8b2KDThrnNMFivJ0R8jZ4B1g0bpny/0c6XAvhIJsEnabSS11361dMmkOvSqeyMCBNH
	HlMLj0o0KJO8PqPYXit4w2XCNZMLOw78nmupfnG7YQqulQZvRXlqSmkX7pB/AtuXt4SRnZJ3cMxS+
	KC/FtzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkID-00000006cht-2FOO;
	Mon, 20 Apr 2026 08:47:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkIB-00000006cgG-1V6l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 08:47:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so42600115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776674861; x=1777279661; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4gP1X/1RVo+LT2tXlc26R+u2cPe0X8dceny5kiXZXs=;
        b=hBOP62k4bocva331IezFoQgR+ewoED49SxRU3TjbRjxe5fjrE3P6iW+adHana3oI9S
         JCVuOXrRDA5y0iNkRDaL2SozrZVF19aZQng4SmjYMqWtMrpfiyrLZmXIz9Dco3fKHf5a
         rM+XRSccfnTxgjvRWrj8bZ35em6W+RMqOInK4zZv5w3PY0k5UlrcDWkRN+oilU1Ey27M
         MHwgKN7a5XzR9+TwXOKGk1saJsJowxKZWL71i2+i4Kr2AV/VffKTrThMnRu6p3aOvycj
         Z7QOYVcCm7UVjGs5Gm8vIITOTrxBYvs5nJMXCcx83gEpeSNKh2/vQ43r6WVlwbkS8932
         URtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674861; x=1777279661;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4gP1X/1RVo+LT2tXlc26R+u2cPe0X8dceny5kiXZXs=;
        b=YU4cm2qj7tTtKv3AVdNybqgTOK4+qlOL1QHNw4HiNCVG5IIjP0ol+ILSrvmnzGmaz4
         edbt7tEAslkxq+iNS5aqOLl4jZ7uGV9N6sYrh97oENQpZWwmebzqcmqELn5ADTNmTjbW
         eH9sKtEAzXLB7sKIFFIQqOFq2ewwj624TVXbC851+WHLBqBuF7VKfiftMdE07bCt+vNk
         q9JgXHm2XlX2B5ZoMf5hMsmHHlKiXozUGkKUynvWqyNu7qTrpM8f+ZS8d+V7tgEYuMcw
         6dqfzusIBCL4kjJhTWh6VBJhJcgHMDQW6qg0MkoxKwmpn4XyWo6ekJsp8w63u9NXJbvr
         oe2Q==
X-Gm-Message-State: AOJu0Yz+/MiKMHxSQ73W7FnTMUpvedjZToL1JTR6dp2fOJabwua86qxG
	jAuk/F+VJIOwrL/5XXq4QYclhvn5O/Cs70tldyTEtCZNBhliT78b7kSdrysexT8XZtk=
X-Gm-Gg: AeBDieu3O2XD644meLAtO35zDqrHJJAwIqFnTjwT04Sm3u9z7EiXsGkdGEzvkTJbicP
	6M4vN2wvWZLzoavERZp0yL6343xBb491Q5RTNTeRWGYrWNpbj5Uwjcp/VPsMBdJFj+JEfkFPonE
	K3v9bLkOiAS5T2ob7gFMXQPjWZgC0jqNIKMhkmR+Md4Svdjar4FUaBQRLky4+T0epFc4S531SMk
	Psya68dJO5IA9jiRDU4GQeXL9fuoDqf97H/1efOeFdTqJDkNqYad+6SkCYTH5EnwKzz7wLLTLAI
	P0BW6JZpLrV6sRoeE7W55ZqPzXp3Z0yNVR58yWhWVATwxdX6CklxwXZ/G2rOUmOv4sFclZP2bBP
	BbFUDXtmOehBFQwYu4jlt2elTooakkdlZFqgWYYXNPRHYi9CxnA5qomAjwqDUpZE65cwuspLEyX
	u7KV9IM/BUJZWPd+ORT0YYZ1/f1lH8wwOCizvd69JI6i/kyNMYJ8m+2B29w8e2QXi8JgIhECDGi
	a5qP1UenD3VA9f/Lh06dylPqZd8
X-Received: by 2002:a05:600c:890c:b0:487:1108:48af with SMTP id 5b1f17b1804b1-488fb7389a6mr137523595e9.4.1776674861197;
        Mon, 20 Apr 2026 01:47:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8290:9fd8:8af0:67dc? ([2a01:e0a:106d:1080:8290:9fd8:8af0:67dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm11193695e9.23.2026.04.20.01.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:47:40 -0700 (PDT)
Message-ID: <e055b694-3e3e-42da-af54-586ef180b746@linaro.org>
Date: Mon, 20 Apr 2026 10:47:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: amlogic: t7: Add UART controllers
 nodes
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
 <20260416-add-bluetooth-t7-vim4-v2-2-9a57098fd055@aliel.fr>
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
In-Reply-To: <20260416-add-bluetooth-t7-vim4-v2-2-9a57098fd055@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_014743_437522_9334C7C1 
X-CRM114-Status: GOOD (  14.97  )
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

On 4/16/26 10:54, Ronald Claveau wrote:
> Add device tree nodes for UART B through F (serial@7a000 to
> serial@82000), completing the UART controller description for the T7
> SoC. Each node includes the peripheral clock.
> 
> While at it, move the uart_a node to its correct position in the
> bus address order (0x78000) to comply with the DT requirement that
> nodes be sorted by their reg address. Complete the
> uart_a node with its peripheral clock (CLKID_SYS_UART_A) and the
> associated clock-names, matching the vendor default clock assignment,
> consistent with the other UART nodes.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 61 +++++++++++++++++++++++++----
>   1 file changed, 54 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 4a55d9641bc9b..81c26b1e3e7a4 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -577,13 +577,6 @@ gpio_intc: interrupt-controller@4080 {
>   					<10 11 12 13 14 15 16 17 18 19 20 21>;
>   			};
>   
> -			uart_a: serial@78000 {
> -				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> -				reg = <0x0 0x78000 0x0 0x18>;
> -				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> -				status = "disabled";
> -			};
> -
>   			gp0: clock-controller@8080 {
>   				compatible = "amlogic,t7-gp0-pll";
>   				reg = <0x0 0x8080 0x0 0x20>;
> @@ -713,6 +706,60 @@ pwm_ao_cd: pwm@60000 {
>   				status = "disabled";
>   			};
>   
> +			uart_a: serial@78000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x78000 0x0 0x18>;
> +				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_b: serial@7a000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x7a000 0x0 0x18>;
> +				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_B>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_c: serial@7c000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x7c000 0x0 0x18>;
> +				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_C>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_d: serial@7e000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x7e000 0x0 0x18>;
> +				interrupts = <GIC_SPI 171 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_D>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_e: serial@80000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x80000 0x0 0x18>;
> +				interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_E>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_f: serial@82000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x82000 0x0 0x18>;
> +				interrupts = <GIC_SPI 173 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_F>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
>   			sd_emmc_a: mmc@88000 {
>   				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
>   				reg = <0x0 0x88000 0x0 0x800>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

