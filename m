Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7F6CA0EF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mHPM8YQkeb5dzUYP/jWeZGNM27XcN6UAt7s92fAKeg=; b=CECNLpPNdFrVETHv4sVFkVCoVC
	2A5Mj6o/bU1eug4vYUkV0HnwiD8q0IeauhRqrtOTY4IBLdneEmLdO4Sa2fZYiR8hBS8MmukrnheEe
	R1o+GVPDSv6DWa6qNBCXzEoNQt/c/FJ1bI7mrXUud8xhIE598/6SnbBO0+WpJCd9t9mDvh/JWrTO1
	JHNEoTCd7vEe0m3RTGdJazQLpJQrLY/U7KSTk0/4EGe2gD1xvyHKUCfUfQhG5k5RMo7hRl0UzbpI/
	ol8nRxvYbYGFEVTn+WIEcPxp23XGd3bPqWdBBmWyU1djHS6RK+0gr6YvV3oUJBycGdUNSokP8c/px
	9oTJoy0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo039-00000007TpU-0X9Z;
	Mon, 18 Aug 2025 13:37:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuo0-00000006taz-2bjE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 08:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=8mHPM8YQkeb5dzUYP/jWeZGNM27XcN6UAt7s92fAKeg=; b=QGdtLnQMDrJCZNDhv/jN2P+110
	RDuyvdwMoFpPXCpvd0YrYFW5KlinunY2eqsiYx7Xoc6uyMK0hZcQ31I6AzS4H4/xyxCkFODcyL/+i
	nuawC9x3AYmsLoBijiIRPb+c5EKqWs0/gnAX1k3WHmg+sRW999qKPjOSOUQuATmA8xN258n409nPk
	kiiW4Yq5OQIjeFPs9QLzvLGB/k1ImeE9qw6nx9HlP1Bt9nVIR2Wfh53wytdLxA8MzaDMPpKQjqdqB
	562BcGCRsxH8rrmA4jEbhs90suF8hSMzWpqL0tduiN1iSNbu9ThH0L/0fWjcEGYaB3IP1a9OAinKy
	8PTne06Q==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ununx-0000000HJLQ-1qP1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:01:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45a1b0cd668so18804955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 01:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755504079; x=1756108879; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mHPM8YQkeb5dzUYP/jWeZGNM27XcN6UAt7s92fAKeg=;
        b=SWyNoQg+nsdygAA+M/wI5OHeunF+x9In/dTpaMnx973ofchq1KpI7fP0qbt/SxMXlb
         4q+JIhjIBShmbs3mb0Ws/FnxZsC/8TzdqXGkipSE9KnvV+qHEVgFOgvUuTz4qdLtXTFg
         GE2KD+9yhsnO/KxgM7MIYHt30hmRTGtRBGb5GU8tLMaaNxClr9m0xrTVHACqf2OIJboC
         VhE8IbM3+l7QxOaahXKM2oY8PxxWNcqCIg1PyGnHQ1bdjvtEpKkF7j0qNTgVESZzl1G5
         TSSNYPWwXghOSinVPtePR8eTd0DHiVt1DAvordz2kBxqpOlr5hsTYfRtorOr2ebHhbGq
         EQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755504079; x=1756108879;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8mHPM8YQkeb5dzUYP/jWeZGNM27XcN6UAt7s92fAKeg=;
        b=QcnoiqIB9xR6qSLNblW0zV0l6jen19D/IMp7BZjLJk8JiXbQpStnSSL6mrVBPAp+Uu
         zMjldqxmT4nYgLoO/8u9MIHox+4uXIt1UQ6Fpq0EnSqpkHj7YLbrCHKcByyxWkgI7pGL
         CWEfnFpSeGB8DQRNbQznFIm9TKn3xMofRkIxU1LveAy0vg+Qu8fm76wg0Yd+a9mZFUor
         IYU4tmy4+VnTMhN1fJV/SOtxT0cZXb5pAAcw9FKBA9R9DI5uZ9vbDgc9zZi7Q6T3XKUw
         uAmK+2sx/xsbU0dLaYjiqDElAtNYvEI6Jct2nJJeE1OFop7/+zkSMpwfd/dUf2Blzlfn
         sFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUybeLEnco3OxlVqo4Prez1N+n+R0TfVy3uz50ac6YCPJxchCIsBGuYNV75G3kW43OvTjCxZ8JHClqMvrFOv+W5@lists.infradead.org
X-Gm-Message-State: AOJu0YwUs+BXNNxjlYgeHG5xr4rDKCXqyuD0HrDL+N0KSuy1FLocEvLi
	hHBG1vtROxFzL02R47GBVjr9U6VzsXW/xl5iyKN7bruLSH4h2OvelIHm1JUzpR51+08=
X-Gm-Gg: ASbGncvwVKBBo+ZZeaK0fuTdaC1aavHiXdd44iT9c2ZMELblwc/nFvL0bvnT7aJm2bq
	dqEpIPxMYCNKesSskSvCISiQsvVWdGRrttLbii3pJMDk2I+ytAfroULWMs494eF0kGaLQLjU6vn
	2/T8Qiq9Tfjz1NztoSzWzsB5JSvpVaPPHq4/nqsD+4+K/qxUrhrIOx4Qdop204dt2NcMCgPmsNe
	QMZRCKHzRlfaZPrQqkMMOIwaczadWRyxp9kuoJSOcIxsCzf2DCPnpW202IbnaUZe8zpzYbkdy1P
	PY7jslhTNHi/CnwJY/dG2DdMZgo/ZWCJ8n4Q+qz/XgvkCtnLhxWF79i5hIt48VfZmOLgo9w1mrT
	mzgm68M7mYSYnvpnY+p8hy5LTHS/xEpW/DiJK3/K+MS66bL6Z9mCUbZQo+g5V1/E2d412uKl/
X-Google-Smtp-Source: AGHT+IHtNmeWv71R/NzuJ6rCmd2YleYZrdpfO+N7HxQ/sX3ETEDLXy8M/w4CZrrEkHpyLEzRMlluuA==
X-Received: by 2002:a05:600c:c059:10b0:458:bc58:850c with SMTP id 5b1f17b1804b1-45a218013abmr48669965e9.1.1755504078483;
        Mon, 18 Aug 2025 01:01:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:70d:8646:e014:cc6e? ([2a01:e0a:3d9:2080:70d:8646:e014:cc6e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a209c25a1sm132617325e9.22.2025.08.18.01.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 01:01:17 -0700 (PDT)
Message-ID: <8e64245a-d7ce-40b7-b884-84a7234c4a3e@linaro.org>
Date: Mon, 18 Aug 2025 10:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 00/13] soc: amlogic: clk-measure: Add more SoCs to support
 clk-measure
To: chuan.liu@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
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
In-Reply-To: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_090121_721369_1C52A699 
X-CRM114-Status: GOOD (  15.52  )
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

Hi,

On 15/08/2025 10:37, Chuan Liu via B4 Relay wrote:
> As support for clk-measure expands across more SoCs, the current
> approach of defining all SoC-specific clk-measure table data in the
> driver .c file results in progressively larger compiled images,
> resulting in memory wastage.
> 
> Move SoC-specific clk-measure tables to DTS definitions and extend
> support for additional SoCs (A4, A5, S7, S7D and S6).

This breaks ABI and most importantly the clk measure feature on new kernel
and old DTs. So instead keep it as-is for current platforms and try to
add this for new platforms.

But the fact you need clkmsr-reg-v2 means you at least need to add a generic
compatible for v2 register map and drop this property.

Overall, I'm not a great fan of this, it moves data to DT and duplicates
the strings in _all_ board DTs, which is worse in fine.

Neil

> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Chuan Liu (13):
>        dt-bindings: soc: amlogic: Add clk-measure related properties
>        soc: amlogic: clk-measure: Remove the msr_data from clk-measure
>        ARM: dts: amlogic: add clk-measure IDs and names for meson SoC family
>        arm64: dts: amlogic: add clk-measure IDs and names for Amlogic SoCs
>        dt-bindings: soc: amlogic: Unify the compatible property for clk-measure
>        soc: amlogic: clk-measure: Unify the compatible property
>        ARM: dts: amlogic: Unify the compatible property for clk-measure
>        arm64: dts: amlogic: Unify the compatible property for clk-measure
>        arm64: dts: amlogic: A4: Add clk-measure controller node
>        arm64: dts: amlogic: A5: Add clk-measure controller node
>        arm64: dts: amlogic: S7: Add clk-measure controller node
>        arm64: dts: amlogic: S7D: Add clk-measure controller node
>        arm64: dts: amlogic: S6: Add clk-measure controller node
> 
>   .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |  66 +-
>   arch/arm/boot/dts/amlogic/meson8.dtsi              |  94 ++-
>   arch/arm/boot/dts/amlogic/meson8b.dtsi             |  94 ++-
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 212 +++++
>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 202 +++++
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 275 +++++-
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 312 +++++++
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 253 ++++++
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 243 ++++++
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi         | 144 +++-
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   2 +-
>   arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        | 229 +++++
>   arch/arm64/boot/dts/amlogic/meson-gx.dtsi          | 136 ++-
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 301 ++++++-
>   arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         | 255 +++++-
>   drivers/soc/amlogic/meson-clk-measure.c            | 930 ++-------------------
>   16 files changed, 2877 insertions(+), 871 deletions(-)
> ---
> base-commit: e5624eb63c452efa753759e74eb27fe132eb577c
> change-id: 20250731-add-more-socs-to-support-clk_measure-b2a43590d5aa
> 
> Best regards,


