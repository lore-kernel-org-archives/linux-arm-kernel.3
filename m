Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8B4C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eACVn/AeNUkJSj6fqs1SPdUKZxcJXedSP1FDf4UsU+0=; b=brvaEe2Nae/hgbdh6AKyA/E+yZ
	Cq5LN23HHx1abwCrtFB+KHCBAIC7ulvtSQEY5yZq2zmotYfGioXhLPq4+gTcOUtd1RhkJX9Qg4mrM
	EB8udMvOco6F9AStd9iN/wSDTF3fNHEBfSsCoYFeAX3sQMOSynvmy8E9ipoF1an1zcShPAlZUsMZd
	ReFOodRZwI+kLnspCgj6rUX9G/vsCMGzjFjoSCz/Vtx/WNuUL5m0zZLviddhwAS0HJIti8FMI5lBH
	c8oemHrZfWjy3cJoIGwnS0CUipbNZE8llxmGo5E+Lq5U3nvwF/epaZLHpDLO5iYWf/jckwIVyUEAn
	+HoUNxlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueA6C-000000028nx-1QH9;
	Tue, 22 Jul 2025 10:19:52 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9s7-000000026JC-3i2f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:05:21 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3b611665b96so2966808f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 03:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753178718; x=1753783518; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eACVn/AeNUkJSj6fqs1SPdUKZxcJXedSP1FDf4UsU+0=;
        b=JvyFTyZ3jgqS0SEub8L+X3bW0YoI7TR7JyaT+59N5j8DkXhbKfpbwJ3PqH3lnp736q
         +gM2BtM2Hs43EMHg/FPeTzNnlqdP/9bBDOmjbb0qz88DtPB3LTm6MvXiocYSAn7mf41q
         w6Lxye+VHv2vN2I8aib8b+R5XTnzU1RhXRH0I0NFcTIcdiRXSyurv//paV8FIcZNF/yQ
         NQkhXNFK9VHMkmToU42tJQrQPoULIKF8+PSkn4QDG0G5kVP6w/XQA5/hMciMOBDN35oQ
         ZbDDe+4sPxKVP5sjk3fnbvRUJSTvDIug/0wihwYy4yUGzfstuwdgmrjgMc53VEAGxPcH
         fg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178718; x=1753783518;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eACVn/AeNUkJSj6fqs1SPdUKZxcJXedSP1FDf4UsU+0=;
        b=et5C9jw0O1vS3Fnu5qQaQhaDNUt0S+nkpCWieZuFUi3rVOBMKId49K8QDb6PhzfzM8
         HNSOpbYKL94OCCSC04G+BEZ8uPV+WhAytNvXRFZ84aIEt8DK6QjukjUtCYkaDA2OgGai
         G9dIqFIeA6Py9HM/1t3MKADRldaX+hJfARfWlqI3cF8RBzISlfhFgZBitEMWalmg6H9c
         gim9wEGO48pDuRDQHDHsuVlPcEInXY1dOC+ecMQAtawTJHrANyx+6cDNKgw9TkUWBCRW
         ooA0AWc/NzukkK1NVsy327BefeJzysOxz1HOK2eE2R7hDSnSUNrqe7xKY4hjTgcMVtEb
         beUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKbPZz2GddxcGqsWoHzSGrT1dYgHuus4hFvKmF9RT4U08BdpW1Dth5v/ywJxipMiVMgRniQvhbD74YTxV8XCBm@lists.infradead.org
X-Gm-Message-State: AOJu0YwKepdBLREcNKKi+YJ5/Oh36y8l7QqTCJXM69qbWUWU8KewU1j9
	VfKNbNWyAMmEPtEa63nDZbrr0c5RO2OvWKcucJB0dvMXOa+15LM29HGX3Xezp3P+TL0=
X-Gm-Gg: ASbGnctvrRX9Ttw8N2MvVLLk7Zbbs/xVq/M7dckaD/XsT0ESCGmbh57fQxEwM3wOEhf
	nA1Yu9KMQL6QyMjjVC9U1RGQKmMrmgzr7fDzfTcCOA8cnpqFfXiM6b3/uzsuNXZe6GklHwAFFY9
	0As1DCVnNxn+FIR7DQ877A6EAoqe80iwPCikh018eXhkjWZa8SAUwLJKwOfuhrRso1NPDSgFako
	EZGwgEsqfItl5SJKUfsg0ZIXNb65XizWnkXFJ6T5vjFrDbiQ6PFRUpFlLNPCQC+UU4Eq68IoFyN
	cdAmdP4UVRMiUhfnG25+1ff1F11iFYjIxFjum5bVHj61O1zmkpQUHp9oO7lTxcyVY1IO5HRuDVd
	g3FKwGB8l6XtkP1nQSXuxojJfcLicTCxxaP9+nMe3FF3R5hvaLHUS/lYAPFsKjZyf6S/eip9+7A
	E=
X-Google-Smtp-Source: AGHT+IGRKY81gkhXWhMn/9LTWKt4F1bWwxEHclEpgsQnRjAMZGrMWAwlAapyO/AgjZWzNQLVWrBoIw==
X-Received: by 2002:a5d:5f46:0:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3b60e5127efmr20108404f8f.31.1753178718150;
        Tue, 22 Jul 2025 03:05:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bce4:725d:6922:d1ba? ([2a01:e0a:3d9:2080:bce4:725d:6922:d1ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b75baa7072sm6012611f8f.2.2025.07.22.03.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 03:05:17 -0700 (PDT)
Message-ID: <6692f1e4-978e-4138-9d76-ac2b80613a65@linaro.org>
Date: Tue, 22 Jul 2025 12:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: c3: Add tempsensor controller
 node
To: xianwei.zhao@amlogic.com, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Liming Xue <liming.xue@amlogic.com>
References: <20250718-c3-thermal-v1-0-674f9a991690@amlogic.com>
 <20250718-c3-thermal-v1-3-674f9a991690@amlogic.com>
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
In-Reply-To: <20250718-c3-thermal-v1-3-674f9a991690@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_030519_927926_DB2AE8B0 
X-CRM114-Status: GOOD (  13.30  )
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

On 18/07/2025 08:37, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add the Tempsensor controller node for C3 SoC family.
> 
> Signed-off-by: Liming Xue <liming.xue@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index cb9ea3ca6ee0..c853390eca6c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -727,6 +727,17 @@ clkc_pll: clock-controller@8000 {
>   					      "fix";
>   			};
>   
> +			temperature-sensor@20000 {
> +				compatible = "amlogic,c3-cpu-thermal";
> +				reg = <0x0 0x20000 0x0 0x50>;
> +				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				assigned-clocks = <&clkc_periphs CLKID_TS>;
> +				assigned-clock-rates = <500000>;
> +				amlogic,ao-secure = <&sec_ao>;
> +				#thermal-sensor-cells = <0>;
> +			};
> +
>   			eth_phy: mdio-multiplexer@28000 {
>   				compatible = "amlogic,g12a-mdio-mux";
>   				reg = <0x0 0x28000 0x0 0xa4>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

