Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3107CFE51F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 10:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsMn/6Mklq7GQLtU1u5HkQpW7v3yh2oa94aAy8k1B2Q=; b=GWXXA5vLH7IqDXLoVzjfi/0uo1
	LG53T0rKmZFmsB4rg0i947wJA1NqXo9w9BbrJkFkCHkj4KS4cePQMJ17tarYuCBfV+A1ucSwxYmmV
	zBfoD9ZzgySmWVX2kjdZ7MLFAfS8TTq/IXOZDDnycK+woU5N5T7tNY+IIJ+hBt89EQx14yOdbmthm
	tc2WgOQTs4+oGb65yzpL1VqZYDiKaXvPQVpuRbuDwr4cc8vxX3JXN57lBjnhLuk0Ukgw6OtltsVKf
	ltPHDFrOJx9DRS5cflgfW9Ln0R9E4U7p7bmTNmvZlT/pKSZdWWnJd3cnOFob2wjwtMn+AJf/Zcjlf
	JvoKzdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDLf-0000000Cz4A-1Iqo;
	Fri, 24 Apr 2026 10:01:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDLW-0000000Cyyn-2i8D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 10:01:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4891b0786beso49108965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 03:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024873; x=1777629673; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QsMn/6Mklq7GQLtU1u5HkQpW7v3yh2oa94aAy8k1B2Q=;
        b=KB/rIeIYpmaXRI7+ELGyENYEqgtwYoOBwIyqyxBr6pIwpDn3gBfVrc4VL3URLwEQG1
         E3eNaUZ3k4wp9Xm4cXQDsAffnowfeAjzu7VHDjtlS9n0tjusNctOU65QSM2KG1/X8dUc
         XSkkGBYRvHSJ+zba5LyCz1Ak3d9qzoo5rMpB2gWXKnxWlQn1QqCYfsFk5/DuRsluB6zc
         bxzgX4sjyh+DUl99ZVHwjFbl0S5fFqYHSQ82s6xpf1e4BkwuwvJbUr2RAKj3VoONyIzY
         u15RKoXfGqMRqv8abruV8Wbcnw2CYP2D/jEcRlu9x6F8K0DRX5ZwtdIVe8GHYqkcE0cJ
         W+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024873; x=1777629673;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsMn/6Mklq7GQLtU1u5HkQpW7v3yh2oa94aAy8k1B2Q=;
        b=eRLrRxFnFVFulFd+sFZjloiwJdWOtc2PGZ/9/u83XEt+zMsAsvdG2e/oOYDuOt13qb
         wsanhiboRUWABllWPjmmdSYUGypylzF7E8LiAbOhuMYMMJDCqQ/w4zh4InU1YtZZ48bY
         sALbpT3h0IOhyh/8pok3W4GTGn9KuuWiVrGBgwJxisy5wMWAOFAJS7hcb0OfNv+QU9zU
         V8tw2sPoX0N88XWf3YjQVxyW/Lm4rEit4jSX2ejDqVpzOiMJAWMN9lXliG8dTgv52td1
         i0D0gesGWiTBjlu8O2BQWJNj80EN3Rq7ixGrCNE8Y9dl9MCgfbaG2ZYMkMxUgH5cxtaG
         Y+kQ==
X-Forwarded-Encrypted: i=1; AFNElJ989aUv6ufrLSmXk05WF2yOp3BV89aW5PDWZFs7+9Xw7f2i7XstxaF7atSlrGlqxx1I68H5shA6xlUB6Y313WVc@lists.infradead.org
X-Gm-Message-State: AOJu0YzXjhAfkwaUxWg6NtdCEV/c3UdhNVpwgpMQcVWzHa/JuHAxXIOZ
	99vwCsikspZyyLMkbm6OTbJXuo7zS4c7EfpsJOgG31lhtSMBXVoTWzH6OFyvj3JYwCM=
X-Gm-Gg: AeBDietK1Ho2aUzrFWNvXqjkuLU86hIEZzJzmeZzjCRf25Rp01VdzQd210tKsd9bVw4
	PumfKiqmhONn2g0UWvGJUTcETvj3qrESiHx2hw77lQwAres782Ov50Y3rXN2hnmzH7dIzQTA9hM
	GqTcb1Yt7nMcQnhRvNE+9PaM3xvVdV/ufH/i02Q7bGX+hDqvxMduhZ8ij7npEZXOm7YeDk3CrE3
	wLE7sqkwa7JTd6iWgLSU3LB8oX5+5dlLJ3ovJDv5H0kVuCYs7vuIwjTg9RO5F32x2D79yEgjeCZ
	5bQi2tJWnocR7dWdd5kQqvVfh9r5QSeEg1gH+xBY2IxKQd+tZLjys9m0tnfSwA65VyT56fVBh8l
	MhQ5kWzMf+e7HSltG8iohBnKGVlsAxdV9vip29ycgbvto7qJF78WWXWUkl6n9P/Xq8QwBDhoQr9
	MuCh5S6RFLc13uZoG3eMaJTH4saLMMtn6LIN6wZyKN+WpyA9mPjTIYA/LWmgVDkPy3VoczHOZ+a
	MnTy+1KY7C2vPhrww==
X-Received: by 2002:a05:600c:350e:b0:488:a82f:bb95 with SMTP id 5b1f17b1804b1-488fb7861c0mr465740345e9.29.1777024870872;
        Fri, 24 Apr 2026 03:01:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6124d7e7sm136810305e9.5.2026.04.24.03.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:01:10 -0700 (PDT)
Message-ID: <f05e4ca0-1fd1-4900-9af8-6e402887bf09@linaro.org>
Date: Fri, 24 Apr 2026 12:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 8/8] arm64: dts: amlogic: t7: khadas-vim4: Add i2c MCU
 fan node
To: linux-kernel-dev@aliel.fr, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
 <20260421-add-mcu-fan-khadas-vim4-v4-8-447114a28f2d@aliel.fr>
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
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-8-447114a28f2d@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_030114_759890_0AC015E5 
X-CRM114-Status: GOOD (  12.62  )
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

On 4/21/26 13:49, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Enable and configure i2c MCU node to get fan working on Khadas VIM4.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts      | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 69d6118ba57e7..5d7f5390f3a66 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -157,6 +157,19 @@ wifi32k: wifi32k {
>   	};
>   };
>   
> +&i2c_m_ao_a {
> +	status = "okay";
> +	pinctrl-0 = <&i2c0_ao_d_pins>;
> +	pinctrl-names = "default";
> +
> +	khadas_mcu: system-controller@18 {
> +		compatible = "khadas,vim4-mcu";
> +		reg = <0x18>;
> +		fan-supply = <&vcc5v>;
> +		#cooling-cells = <2>;
> +	};
> +};
> +
>   &pwm_ab {
>   	status = "okay";
>   	pinctrl-0 = <&pwm_a_pins>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

