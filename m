Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823E9CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjUs+9lmvxg6hFDNkzR33u3tBhhnwtURtsDnKXMgT0M=; b=QMxEwO1H6RBOqtvK4ySP2n+Vxy
	TMbYR0SghuyluLnw78/4ptQz3h9NOK+Vohv3qK6Iye1G2jY9L3ozIqvWSfct5A23FibxBKi1yahwz
	OBco5BZ2ZTKkWZ1h8ZyQlgdX3b1w8nOV07dmD1se/AIwoYLdcmW80J0fNuu89e5xWt/MErZii04w9
	dBJIsWmiSQRGb6e72lHd/hCQk1dtPASpM9KmhgvTAAQ2YjYTT6lxj3PrlpJw0MhuuooWs0Qe4VfFK
	LigzMxCB7Ql45Hyhe9y/rmgtAk7tHj2jh90LgFfzJmdNzMZ9kzrVfye8upePoeNiC6DV4qN/mIrKq
	LHN0YZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrAK-00000009XFP-21yt;
	Mon, 03 Nov 2025 09:47:56 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrAH-00000009XE1-3mQD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 09:47:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4298b865f84so1828808f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 01:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762163272; x=1762768072; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjUs+9lmvxg6hFDNkzR33u3tBhhnwtURtsDnKXMgT0M=;
        b=UA0O+EZSMfZM752AJRq+4bdFdJoNJK9hudWiLL2ihGjSrWMMbGQ9DpZ1kdNtYYFHvr
         1js+vv5OdLnQXc0BBIHPeC0EyaXq8nCstpQ6WVPduf14igkO3T+dmSJ6ILc5NZTKqMq1
         +qK6J8VxZw0RWuTo/L4rZ649lPrkUAAJKLWkyG2/BZn4q6UGvdcp4VMTa77eaNOJ8BYb
         s9uzwUrA5d3c8XGRZYhuR/c7ql6rd/Pw3q9KXZ9wScLAmquJw2n63dF5mB0YOZI6gHpS
         VOre5VQumJ92NuIH3VU3YhAA98oEg1Kqx0SS7CKH+OMnLJ0rFlzv4GK3SKsv3MMtgJ4A
         8L9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762163272; x=1762768072;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rjUs+9lmvxg6hFDNkzR33u3tBhhnwtURtsDnKXMgT0M=;
        b=o/KKY+V7OCmTqT98i+Lp5moqny8t/ebLLxM1oOII9TAQ8Gmeuuj8DntnpYVQ65KFmV
         rEIRfkJz6AaEXU0UcdWzORMsI6BC+oiT9cwnIZ0D/gI7fgOHwp5IuXKO99tLj8Lc1Xb2
         fByyOwD9BBYDGH4W2YnRN+pbwrDrySTLJ3qpREGaJEmPpBOiyq2lAuTzkxxRziCHUjhn
         dFCxIX/3Ghc8LavRcTPtliROH1Y6jNzAEjUNB21ac0f5T6us0/fvuRdQ16TGkBrJUlGX
         PDTYIrquwN5td/iVQKwsga0kldcdA9ZmPElEFpfeCI/gy/1n+HpHTsn8rA7yLLhcagR0
         WRyw==
X-Forwarded-Encrypted: i=1; AJvYcCVNXwKH91tqE2n7XU8a+ijFaHuA5Wc7nsqb6cz6OVdUERuLIH4QxCYOhzXrc9gto59Pvi2hudGN2wN6bg1ipZL3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7R9okkhaapOqLPz5FzX2zghE00ryTggCSLkBvhwHcK9tR4dNt
	o4o17/Qx+eBYWbtEglh7XPkjG9wNFM7bKAlddbmIp3XRyZ0N3KprLaS/f0xOGLZQPNs=
X-Gm-Gg: ASbGnctmvrXmTul8MPXYByF4YUqdVWWgKuhcjp8f3djM8zUSW55Jpm+/8D/KBEU6wla
	fTOReRaeiFbnTi9iKCov1vqkcjM6j46HDOEcjFKrN3pfIxeQFqBFitWHX9HOhg4ym5MGS2Ff408
	M+FILfuW4eg79sswajRvIyZ0L7b2f+Ymqevb4d6bzxg9lSV94r1rEeZHtcI8f2pS6WqTBbdLaHP
	4ky+jnVy2yJoNcW4GAaLhK88AWCn1hNaESqS9rC6qiBSkicSQKsWfKJLsXSCopHi57rP+k9+XFu
	s1n5ZIHUDufEcvE70IwwgerBGvucjQyN1GtGR9WmHb9qnwYlERDFqdlp0SRPKpwZy1Hc8Z0IAmg
	JEr+/yRU0nl6cQyBwjTh6gIoIcpI+ln3bT7C80vUnL3AA7wBilYy11eWvCmQhN0QSuWNrxRqdJL
	K8Rxn7OVbFa5JmlsNvu278McjqIiQepziOWw==
X-Google-Smtp-Source: AGHT+IHDfLLp21iBMkqrIfzSTyKmVftOPG60mqDFYiQNslVJnYicp91LxbC0vPtq3CNiEJa9/RFQWQ==
X-Received: by 2002:a05:6000:659:20b0:429:d1a8:3fa2 with SMTP id ffacd0b85a97d-429d1a84015mr2297058f8f.48.1762163271853;
        Mon, 03 Nov 2025 01:47:51 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c1125ad0sm19637181f8f.13.2025.11.03.01.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 01:47:51 -0800 (PST)
Message-ID: <2f2bc6e9-6bc6-4d1b-8cae-0ff8a7386d7c@linaro.org>
Date: Mon, 3 Nov 2025 10:47:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND 2/3] arm64: dts: amlogic: Fix the register name of
 the 'DBI' region
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Murray <amurray@thegoodpenguin.co.uk>,
 Jingoo Han <jingoohan1@gmail.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, stable+noautosel@kernel.org
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
 <20251101-pci-meson-fix-v1-2-c50dcc56ed6a@oss.qualcomm.com>
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
In-Reply-To: <20251101-pci-meson-fix-v1-2-c50dcc56ed6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_014753_975177_07E5A49A 
X-CRM114-Status: GOOD (  13.74  )
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

On 11/1/25 05:29, Manivannan Sadhasivam wrote:
> DT incorrectly specifies the 'DBI' region as 'ELBI'. DBI is a must have
> region for DWC controllers as it has the Root Port and controller specific
> registers, while ELBI has optional registers.
> 
> Hence, fix the DT for both Meson platforms.
> 
> Cc: stable+noautosel@kernel.org # Driver dependency
> Fixes: 5b3a9c20926e ("arm64: dts: meson-axg: add PCIe nodes")
> Fixes: 1f8607d59763 ("arm64: dts: meson-g12a: Add PCIe node")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 4 ++--
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 04fb130ac7c6a498f7e8029aeaa7e511cbfe815d..e95c91894968b2c8b3b8e96a5f5e85cd60f3e085 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -208,7 +208,7 @@ pcieA: pcie@f9800000 {
>   			reg = <0x0 0xf9800000 0x0 0x400000>,
>   			      <0x0 0xff646000 0x0 0x2000>,
>   			      <0x0 0xf9f00000 0x0 0x100000>;
> -			reg-names = "elbi", "cfg", "config";
> +			reg-names = "dbi", "cfg", "config";
>   			interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
>   			#interrupt-cells = <1>;
>   			interrupt-map-mask = <0 0 0 0>;
> @@ -234,7 +234,7 @@ pcieB: pcie@fa000000 {
>   			reg = <0x0 0xfa000000 0x0 0x400000>,
>   			      <0x0 0xff648000 0x0 0x2000>,
>   			      <0x0 0xfa400000 0x0 0x100000>;
> -			reg-names = "elbi", "cfg", "config";
> +			reg-names = "dbi", "cfg", "config";
>   			interrupts = <GIC_SPI 167 IRQ_TYPE_EDGE_RISING>;
>   			#interrupt-cells = <1>;
>   			interrupt-map-mask = <0 0 0 0>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index dcc927a9da80246da43391f9f90049c3570f10d2..ca455f634834b5a52db8ff4e6ebca35a87ea17b7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -138,7 +138,7 @@ pcie: pcie@fc000000 {
>   			reg = <0x0 0xfc000000 0x0 0x400000>,
>   			      <0x0 0xff648000 0x0 0x2000>,
>   			      <0x0 0xfc400000 0x0 0x200000>;
> -			reg-names = "elbi", "cfg", "config";
> +			reg-names = "dbi", "cfg", "config";
>   			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
>   			#interrupt-cells = <1>;
>   			interrupt-map-mask = <0 0 0 0>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

