Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F440C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6tvj/DkNBulYt/YV/mLvh6U0WsYjvJUAB4Jgyqsz68=; b=KWxi50XdMOWSHH4zKao5ZM3qA9
	Z6J2I1QAAAMMk2TEnjJ2AExm/msU047J2xkyn3yGi5vu82WU9D9tVNMsHv4STyYrAq/gJTczyuhKd
	I0eO6azNpLCXoWaHpKTSg/RT4VuEMnoMLx/c26tgjumGV29CGSu0XgmBYidWbTsTlCy7EtAhaSrD/
	iEtSV+XPK+AgCtxB2y1mgdAvgrx2ziFEQMBb2JV7IXv8Yqgyk2ABxv9m/Q4RLDnOKZMrU3o1vNJBz
	cEF2JRZQDLIwgrk6vlRkbfI+IwhNuyfPL95Emi+uCLKBSH3IQbagsy0Xv3bepu/6MjApmXxei0Zm3
	jKitqRvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueA8g-0000000296l-0bJL;
	Tue, 22 Jul 2025 10:22:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9sj-000000026S1-1MlI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:05:58 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so39181455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753178756; x=1753783556; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6tvj/DkNBulYt/YV/mLvh6U0WsYjvJUAB4Jgyqsz68=;
        b=ZDUqmCnlXkyoV7etnCNNr5pSHgNoYPD+cQjwCaBp005o8nRK6HtKSE4Zg88Z9ReGpn
         nyk4VgTPrlumktKDZ/DVtbbgOwM9R8P4O4ohGhaBB3yeH5bf+NFV2+nIRI9WlVot6ruR
         r48hFCbiZuU/ZLYJCQz98lZ5j2sZ3MqqRU77ZSiUZc1DP0Mz7jNIwnSbquiWyYN0/NB/
         jasbYDnOOGHr1VwU4mGNtAch4lJaT8D0nJV+XKt/YvfoVWaOYWqRqTov6psxqAfl1j5z
         HxLoNFhaDvI1rOkSxJfp1aSGJR/5koMFzDM37piSHOlcJVBlZqS9Q32//LtBSST1N7Je
         u4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178756; x=1753783556;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K6tvj/DkNBulYt/YV/mLvh6U0WsYjvJUAB4Jgyqsz68=;
        b=OjRKnHOU23vfcsAjcJoKa8Rkph3jY0MD0A4haFq75ec2pNtYkly39QTc/B8dxHoap7
         9IyOmodPbpjmnVJld3NM56nxsGbXV1oZuwc3tMB87YEy8+oAP+hT8r4oWldtDvbd27Eq
         J4HGfcUHmGrvcA9wl52l/KWQfG9YVgRJ/f2NrPd+a6ulFpvdFwJIdLge4w4nJCnOG7SM
         +j8kkB6ztP74Keb5gGHc3j1Vblk0i9sR0Rnpx0BMDpF1cakSuhbHPb1XDx70vdvwT40s
         eFLXLtT6b2vkYX8W7bbO2p1zzLQ+XghS1+Vc74y+/QmmAUJLv6NaYMLOKc/ddJ2uXQQK
         t9WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG5lMi/nM81QhZeXrvqaBxVW4dy/ZsbFAe/MYhVBtiKd1E6Nnz0gsbtRc9Z1vc5brhg4GOptBIwO0eNJngxIXZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwrokMIjwILO3lIMdkrEd3Z1bIOmRr4Igrm6xI1jgrUY/VIQ2H9
	dHcE+QIyyON+okhv+0NNkJY6z1ehjfWzUBAc3PYqRnglKmbz0zvIjyxBgOOStciuiQpmvyH2arg
	Z5K/k
X-Gm-Gg: ASbGncuQKmVqLAh4qXBxzFUEdYzbXizg+EYdnPOTfu1YdqWCcEfoBC5Byz4k/3868tO
	whUKRnZY0rVAtLX8NFKSroQEaDCvjvzK1pktsPboN09f1hWHLoZnSVaAK4SmNROPkTiCLS5kjkc
	FjcpnvnKWPlBr9pF8gFjC39SXBpewSL3J5RuzXBeWObbTm8bl4aG8WWLkTTn6xPVjBBpzn9jMte
	TzKySZFQe2BmcStuqIqachxPm5YFseF4yK226Cm6qr253NLogKuLCcimcgZBYd/nmmgup9wRRxj
	0oRabzEn1eT1T4M+jYFp6guvRLB1ZmqJcJ7nQrUQ4kuNtHR2Wi4F7Djz3EpkCUE1M3Bq6s5/B4P
	U2aChl3PDjQ0a0wSHI6DBYlCqsWrGRc3g/ZAYmw6ZND476DyQa2q4xCW8OKUwaTdUULNA+zL/Y9
	6+oTfYFrYEoA==
X-Google-Smtp-Source: AGHT+IF6xHLS/NKb0FDDLslT+SQ8Ge7DpH9qHjfZKBiFCLY7EOoCDjUS/Zdn1Tv9T1Zp8mEzCtRq7w==
X-Received: by 2002:a05:600c:3acf:b0:456:e39:ec1a with SMTP id 5b1f17b1804b1-456348e70f4mr208884215e9.14.1753178755675;
        Tue, 22 Jul 2025 03:05:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bce4:725d:6922:d1ba? ([2a01:e0a:3d9:2080:bce4:725d:6922:d1ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61c9f16d9sm13213953f8f.0.2025.07.22.03.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 03:05:55 -0700 (PDT)
Message-ID: <4a78f570-62fd-4779-aba2-1c9c558989f2@linaro.org>
Date: Tue, 22 Jul 2025 12:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: C3: Add RTC controller node
To: xianwei.zhao@amlogic.com, Yiting Deng <yiting.deng@amlogic.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
 <20250717-rtc-c3-node-v1-2-4f9ae059b8e6@amlogic.com>
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
In-Reply-To: <20250717-rtc-c3-node-v1-2-4f9ae059b8e6@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_030557_376658_92C7F02A 
X-CRM114-Status: GOOD (  13.25  )
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

On 17/07/2025 11:38, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add the RTC controller node for C3 SoC family.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index cb9ea3ca6ee0..b81bffac7732 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -53,6 +53,13 @@ xtal: xtal-clk {
>   		#clock-cells = <0>;
>   	};
>   
> +	xtal_32k: xtal-clk-32k {
> +		compatible = "fixed-clock";
> +		clock-frequency = <32768>;
> +		clock-output-names = "xtal_32k";
> +		#clock-cells = <0>;
> +	};
> +
>   	sm: secure-monitor {
>   		compatible = "amlogic,meson-gxbb-sm";
>   
> @@ -967,6 +974,15 @@ nand: nand-controller@8d000 {
>   				clock-names = "core", "device";
>   				status = "disabled";
>   			};
> +
> +			rtc@9a000 {
> +				compatible = "amlogic,c3-rtc",
> +					     "amlogic,a5-rtc";
> +				reg = <0x0 0x9a000 0x0 0x38>;
> +				interrupts = <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal_32k>, <&clkc_periphs CLKID_SYS_RTC>;
> +				clock-names = "osc", "sys";
> +			};
>   		};
>   
>   		ethmac: ethernet@fdc00000 {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

