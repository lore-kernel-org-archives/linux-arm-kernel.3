Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79ACCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 15:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3n8J2PGXLDx/H5KLegGco+ygP5/7+r1Zqv1kXmn61w=; b=DgiYHuSRVxMS3IDF6x3fHiw4xY
	YsNcqQQp9bFLPGmfeFP90HJ7erQ0Xtxfo0oKYUKxClvA99+hA5DQZlURPrXqqtXJYVq8v641NIACN
	wKNG2VwYPJH0ElUP9t4qFA5RRo3Fh5tPCZpQwcNt9s6xgouBJ3qAlggJeB5lUI5bOPgmGKJhR8i3H
	GMAjPsF7teYi/e67Psj3SEs2cFG1Nq50Wxo2ie0G102ghrlrXEokzJTM9SzxdXX5TyVzW10KFWrv7
	NLTEA8NXgaaZfHQ2SHw5BhnutA+W/bidsmGkD8EKg0qm/uLXR59FomuIhgnxFpE7QSuXXwv9wIY1E
	1PX+kgFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDO9S-0000000EzMT-2LJp;
	Sun, 04 Oct 2026 15:29:22 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDO9O-0000000EzLJ-32FK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 15:29:19 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a0280d4f56so6167935e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791127757; x=1791732557; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3n8J2PGXLDx/H5KLegGco+ygP5/7+r1Zqv1kXmn61w=;
        b=YYppD5x9O2v8fsFVL8Rs1RVkHWWeRuki+lXmCi7MV9nk84yLHOGKGr2tS3QTM3VcJc
         G5eqYbTNTi6Gdv/fzGw0eKuQZlNsuZhonboeIcA1qtfRHr8FJq8rKYNfJtvWVV/95cH6
         EAKlC92kKLmSzCuRlrBz47SkjaPPdVGQulOKw3N1YpowZ6YvOOYoWt/uo1lCxW6PN2qe
         wVLoYVboMbPQbjeMewBlD5Gi29ID0F9ZzLghkdX/KUt0UhK8X0fU6ZWuBFzLKO6b7qc7
         0SP2Dg9Ns6JWpHmwGxDNtFgdLxKTAtNOwxT+v/o6ebYMwzuWL+kiyNgRnhAGJ7KFf2k/
         7Kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791127757; x=1791732557;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3n8J2PGXLDx/H5KLegGco+ygP5/7+r1Zqv1kXmn61w=;
        b=sLhDefHQGWYSn/h6zHxBowuDtGdnNY92yHRlNfrBxgCrfahlZGYl4qx4DgfEpzllSz
         anR5HJZp6GTZxBo/ZtJURdU/6rB4I4fnlKG1rVCrW15GKqrgbbuqDBEo17WryM7mi5hj
         aaCqZDD/Ry8qvmJcwMghB1rLIaehDEdcO0W5HFMkbi7aFsxmdMF//TwQeQgNZM2hwAfa
         nQ9JbwGOtxZWEzjrkOR51YKb/6yDw4oCLmjiJnzRXU6wI4pKBpPMi3aib9P/Uy7zoYTz
         g/okYwGSLQX627flWzMqhB0TRSF4w3jH6sH+koGEsOfBXCDHjlz331WTAFA4Y/0SQyLm
         k/8Q==
X-Forwarded-Encrypted: i=1; AKwUvByuLd8djJWr2gUu2txLGHyiq2WbxudkVMyt4HEXctKHlix+urv2EpFs/1U0IiU+WhKRj+L5nhgkAGamzmtgX4b2@lists.infradead.org
X-Gm-Message-State: AFuF++l2aDeXbYg+6We1PLTUIBhU3rqP8tOeublXWma+bIyOH6qDlikm
	MRWQqd/6/GDtD6cnvtrvN8gKRRwbaNLRqIRuJw3yhSPAZvPkyDNHF4P2cDxbYAfQv9Y=
X-Gm-Gg: AYBFou20QEWtAyLqVtvggftI8XuIDkLdZDez53p9dzV+SNyNinWp10dXuKPuEqoaFFN
	9m8GZ/5sraCW5+dFdNIckLKW/IhadtubdJxUB+RthN2C40du6VWA7liulJa1l2/wUB4CJvjRtTQ
	DsYwOLE83SS+CbffXwoRh1eDEUvZfU0K/4hK1jBIN3GjuAE88IOnXu5kT+EQZw8D48TIMrzfgbg
	KIyh6CH+06l/2bHDgLs8j2ZigspYgrCD0T39bXvDlAnTkyQGO5RmNDtpDNBhJiIFNf7RdwsHYlk
	mnCb1Y8f440eyaS97CMANiQS6BKLIFuXt7i4DrJiA1IWn85RyOodOjFfqCRCyj8dWA7l2uP/Oly
	5XzBE2XojolVVzGCal8qu+8rLUcbOVdFTIR+kKzAYfGd7VkRQjKfmwP7gvZfzBNa5/SxvwjJqjy
	eNy/QscjXOkmvTcmWQGz0racn0tSyC5bjFvA5sbij53DYOPPhfoZB9UI6nXuvu2uFtEJs4CPMFw
	+0A8K3C
X-Received: by 2002:a05:600c:4ecf:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-4a02769ceefmr145584105e9.24.1791127756918;
        Sun, 04 Oct 2026 08:29:16 -0700 (PDT)
Received: from [172.20.10.3] ([37.169.53.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02769a818sm280087545e9.2.2026.10.04.08.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 08:29:16 -0700 (PDT)
Message-ID: <30637763-03bf-4d3c-a9e9-769de28c729d@linaro.org>
Date: Sun, 4 Oct 2026 17:29:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 5/6] arm64: dts: amlogic: t7: add the ethernet
 controller
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261004144046.391444-1-tanure@linux.com>
 <20261004144046.391444-6-tanure@linux.com>
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
In-Reply-To: <20261004144046.391444-6-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_082918_828401_68EA9A4E 
X-CRM114-Status: GOOD (  21.60  )
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

On 10/4/26 16:40, Lucas Tanure wrote:
> The SoC pairs a Synopsys gigabit MAC with a small block of glue
> registers that selects the interface type and trims the clock timing,
> and with a multiplexer that points the management bus at either the
> on-chip 100M PHY or the external pins. None of it was described, so the
> port could not be used at all.
> 
> Add the controller and the multiplexer. The MAC reports a 5.10a core.
> The path the controller reaches memory over runs through a pipeline
> stage with a gate of its own, so hand that to the controller as well;
> nothing else claims it and it would otherwise be switched off as unused,
> leaving the port unable to complete a transfer.
> 
> The on-chip PHY behind the second port of the multiplexer is described
> the way the G12A does it. No board in tree uses it and that path is
> untested.
> 
> The controller is left disabled for boards to enable.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 57 +++++++++++++++++++++
>   1 file changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7bd53ec16607..140f1836f3dd 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
>   			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
>   		};
>   
> +		ethmac: ethernet@fdc00000 {
> +			compatible = "amlogic,t7-dwmac",
> +				     "snps,dwmac-5.10a",
> +				     "snps,dwmac";
> +			reg = <0x0 0xfdc00000 0x0 0x10000>,
> +			      <0x0 0xfe024000 0x0 0x8>;
> +			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			clocks = <&clkc_periphs CLKID_SYS_ETH>,
> +				 <&scmi_clk CLKID_FCLK_DIV2>,
> +				 <&mpll CLKID_MPLL2>,
> +				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>;
> +			clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline";
> +			power-domains = <&pwrc PWRC_T7_ETH_ID>;
> +			rx-fifo-depth = <4096>;
> +			tx-fifo-depth = <2048>;
> +			status = "disabled";
> +
> +			mdio0: mdio {
> +				compatible = "snps,dwmac-mdio";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>   		apb4: bus@fe000000 {
>   			compatible = "simple-bus";
>   			reg = <0x0 0xfe000000 0x0 0x480000>;
> @@ -645,6 +670,38 @@ gpio_intc: interrupt-controller@4080 {
>   					<10 11 12 13 14 15 16 17 18 19 20 21>;
>   			};
>   
> +			eth_phy: mdio-multiplexer@28000 {
> +				compatible = "amlogic,g12a-mdio-mux";
> +				reg = <0x0 0x28000 0x0 0xa4>;
> +				clocks = <&clkc_periphs CLKID_SYS_ETHPHY>,
> +					 <&xtal>,
> +					 <&scmi_clk CLKID_FCLK_50M>;
> +				clock-names = "pclk", "clkin0", "clkin1";
> +				mdio-parent-bus = <&mdio0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				ext_mdio: mdio@0 {
> +					reg = <0>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +
> +				int_mdio: mdio@1 {
> +					reg = <1>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					internal_ephy: ethernet-phy@8 {
> +						compatible = "ethernet-phy-id0180.3301",
> +							     "ethernet-phy-ieee802.3-c22";
> +						interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
> +						reg = <8>;
> +						max-speed = <100>;
> +					};
> +				};
> +			};
> +
>   			uart_a: serial@78000 {
>   				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
>   				reg = <0x0 0x78000 0x0 0x18>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

