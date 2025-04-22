Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835C0C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Jdsjo/xqjalOgmmmiDVixlLCvZSDipVTEuGlq4N+fo=; b=4WyRd84Irmkxo2n8V1yxh90i4p
	uw9Bw0uQjlhE8TE/m+GDJom9ndQMy8QF3OhEJ0gb9jX0EZiecCfq0DoYwEzztWNNkq7wKnVM/E/v5
	nI0gnVQ8B3WKtbCii9WPALPIRe2Mcr6mVzoED3GYjrkBlKjaCkjz3jdnZHY7BDBjMlHTZrBG4t+gv
	ZS2vGE8drODK4UPxntAui9TIwv60uZdmGxPovXDqbI0lnXxO/Nm7rePYDyo/om7k9ByooIvfg5KdW
	nU5UmkZwaV8fK/ee+FqPKj12PrPRQ0bB/UnljbQErAHUA3I6VB2nvMu9zs7GKGuTnA9graVqwFDxp
	mXyRF+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Fnm-00000007mAw-2g7H;
	Tue, 22 Apr 2025 15:44:50 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EYT-00000007Tpz-1m6k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:24:58 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso3771615f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 07:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745331896; x=1745936696; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Jdsjo/xqjalOgmmmiDVixlLCvZSDipVTEuGlq4N+fo=;
        b=YaYTsCrVFuyckhf3PRZP6prgbVma/QHVK6SZ/EcyXsDisKvSUiIHS2QK30tfJOr+U+
         DtSsWKxLhPs3waWfaQ1Pn7LLikYDBDLPzYcEsqspqSL4os0H7KVrXHXxVeaJDf/kjOA0
         GJ86XJpkVg000vqkiN2RWyCdFwvOQ+p5heAGhtQa1UqFhVrTcjkUk4IX+v5Pa/oDBiHV
         8MbJZOYiHjyzt6awjZRLCrzGi8tnJgQdUrjCJV1kPzduDMrQ6Y63YjyNldFjrpWHuB2k
         kbJA8JbME9pa5/JZtzNIXbRdNGoZvjoqPZ4XW2oRgQhdBE3Nf3+Vbr24sf2J4Q2gNCFX
         3iJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331896; x=1745936696;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Jdsjo/xqjalOgmmmiDVixlLCvZSDipVTEuGlq4N+fo=;
        b=dKwC5+y6K1H9ILs840waVUbWUHTlbKxPKLivHDzbYTHj9/8k8GPsmKPNikM/5raBb9
         JFDLiNGHlnlNmxjrypWeX634bx/fOqvDRnunMApT7PEqTuT2Uup1WUwGkyKlEjMBsQ4F
         6jKw12Ah7jkzq4JQK9TQtuVZ4x/EYwRnyJcRby9q+/WGm5qdppcp3S7Seq3u/WVabCEV
         jaGxEPRbpnxrbMXEjIYFXro2+SZrNOrXxB10P/FdJ6vvBx74DnAqK+o5Z0oVvzTXkgOR
         NPuyp4bEpo+DfHGz60OCDL3RnSL9p9T0QAi7vRXFOVWAk258wR2fXGJvCRWvGehRvXd0
         KqbA==
X-Forwarded-Encrypted: i=1; AJvYcCWw1qQteNLkKwzL7ua1Vc4Y6G0nrtRKZaOd5obu6pbMvIPbFyPwpCx4z7dg4UF+18GU8f+nEH4lyb6orRg5sEke@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8N88MH2iYi6s2N2AdE/0PbmXxHvBDT4CSGxGCzsFFATc4Xx+H
	2NWxNVmiFsviE0Hj4jH1MUy0so+PDQBs9Vzd6hnU2G7jkDF4yxoxFvjkK1Lxx3o=
X-Gm-Gg: ASbGncuDE04J9iOc7AlqW48wGLhAZpfTfgPhtLoFIg/VzLkviTzwWiZQPqdxEFyXYbH
	NIO/nLGF4HkbSx+sc+Sb45MknXuDeLG6gLzXCOE13nPEu150Mk1LH+pGpGMudHOBhWY3MzmnVNa
	RrpMExd6lqYrcjBOoEiiIPeer/L7z/pJuRERBmoVmXrRkJ+/WLuGccLTYJR8w47cCwGdooLkKhI
	giT4XDvYv5hi5PCbAYBUWOL+SNlVaUXasFZAJ62ZooNvNwAhk3jb/nNQdnXXlJLKDM6F/61pH6R
	o1mvhRMU2k+jwx1yEiJFMIqZsKRMH79bW7xWmSScE5h50z/7AE6ee4dh4udqZ6N0EP/bvmhxxRp
	uVyZ7eszN+a41X2Gcuw==
X-Google-Smtp-Source: AGHT+IEMq6D90tumtgiQfuL2iL5ojy1eqb4ZpCOQZ/eL/OvCUSv21+5Nv4KHfhG+kRfhKAADVI9aCQ==
X-Received: by 2002:a05:6000:4201:b0:39a:ca0c:fb0c with SMTP id ffacd0b85a97d-39efba5f80amr12032095f8f.28.1745331895992;
        Tue, 22 Apr 2025 07:24:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d6e05d6sm181482765e9.40.2025.04.22.07.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 07:24:55 -0700 (PDT)
Message-ID: <71a6cd6a-cb2b-4628-b558-01c2172a94f9@linaro.org>
Date: Tue, 22 Apr 2025 16:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/7] Baisc devicetree support for Amlogic S6 S7 and S7D
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
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
In-Reply-To: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_072457_481847_A2B26E62 
X-CRM114-Status: GOOD (  12.81  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 17/03/2025 08:16, Xianwei Zhao via B4 Relay wrote:
> Amlogic S6 S7 and S7D are application processors designed for
> hybrid OTT/IP Set Top Box and high-end media box applications.
> 
> Add the new S6 SoC/board device tree bindings.
> Add the new S7 SoC/board device tree bindings.
> Add the new S7D SoC/board device tree bindings.
> 
> Add basic support for the S6 based Amlogic BL209 board, which describes
> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
> booting up into the serial console.
> 
> Add basic support for the S7 based Amlogic BP201 board, which describes
> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
> booting up into the serial console.
> 
> Add basic support for the S7D based Amlogic BM202 board, which describes
> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
> booting up into the serial console.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Xianwei Zhao (7):
>        dt-bindings: arm: amlogic: add S6 support
>        dt-bindings: arm: amlogic: add S7 support
>        dt-bindings: arm: amlogic: add S7D support
>        dt-bindings: serial: amlogic,meson-uart: Add compatible string for S6/S7/S7D
>        arm64: dts: add support for S6 based Amlogic BL209
>        arm64: dts: add support for S7 based Amlogic BP201
>        arm64: dts: add support for S7D based Amlogic BM202
> 
>   Documentation/devicetree/bindings/arm/amlogic.yaml | 18 ++++
>   .../bindings/serial/amlogic,meson-uart.yaml        |  3 +
>   arch/arm64/boot/dts/amlogic/Makefile               |  3 +
>   .../boot/dts/amlogic/amlogic-s6-s905x5-bl209.dts   | 42 +++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 97 +++++++++++++++++++++
>   .../boot/dts/amlogic/amlogic-s7-s805x3-bp201.dts   | 41 +++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 99 ++++++++++++++++++++++
>   .../boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dts | 41 +++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 99 ++++++++++++++++++++++
>   9 files changed, 443 insertions(+)
> ---
> base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
> change-id: 20250221-s6-s7-basic-f300c30877e6
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

