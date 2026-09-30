Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E178CA5FC8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjNzOSbZhH3UC1XcZKT+Hgp+Sdib45z8YSE/jOVoT0c=; b=x3WWlpfx0wdDvsT+NggQvn62zv
	P4QMqjcVihQSgTjcJWTbxcshdJJ/6DgNLLKWe5zMxop//0fTTVeo40n9cv/hQYzKHYrWr2es4f+oj
	AZEfWMU9XwHrhZzaFt4ORtojR0vEgBk7YhMrkLdwd6H7hnpWUTwmagPhUtMmkkvm2k26wHtcjJW1v
	1p6eoFoAT3Mk+ZYnsJ6u1FOkRHNWxz4/tHLpOlE8mC8/etkbrf2hw62cm2UhO/lOJ/TA+HdREiUZQ
	DJjFMzMvr1CPRtXGV+1nSbFVHM9MwPyvxIQCMn844OGwD4PExQU74Ea1jolyKMm1IvRhjxI3gBVEo
	HFRxAKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuGp-000000067Vk-2D7o;
	Wed, 30 Sep 2026 13:22:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuGo-000000067VM-09NI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 13:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=WjNzOSbZhH3UC1XcZKT+Hgp+Sdib45z8YSE/jOVoT0c=; b=VaF0c4dv/kX3CJ4gWYfxdRpCFs
	yW/1xM1DRufniSNfx2jt8y2sYom5kJhhoBgmIPePRGI4Syd4hG3GBQIkKZeXOiDgbYCwRfrQT8kEG
	YgCwiQ2YgdJftJqTw2WmwS90ycpcY3I/MsI9OfrkkhyYlI7Z9/GFCwCvCQAqPgtCOh2kLiTS70G4W
	/DrRtNfyt/r5M0ZN20G6fPLW/+kXQfi0cTB80O4Yqj75YgJJwOY0HrX9t7C5enjONQ/YuvaxKerVK
	rrFP9/m2ZPjzCPDh9RzMIClizKw/U9gLoD9uxsrwryJMNntDk+kjNmsokY8Oe6KKTRmYn1ntMb8Sy
	QZtpaoKw==;
Received: from mail-qk2-x0d.google.com ([2607:f8b0:4864:34::d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBuGk-00000003qFd-3Jl6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:22:48 +0000
Received: by mail-qk2-x0d.google.com with SMTP id af79cd13be357-93c599e3902so470699785a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790774563; x=1791379363; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjNzOSbZhH3UC1XcZKT+Hgp+Sdib45z8YSE/jOVoT0c=;
        b=z4uv43wuGdIE3Rk1Ij1ZwvbSZYf1ThnhLTBlI66QbKSXQD6Z0jQaXcQRDppePyoTb9
         5D8JDhrz64p3iBThDZcYMOqZr/Ruvl/ccGUJhXbi8c+WsDtg/2+Ys6osopjviB2WnP30
         /V9CKJqrjC0esc8Klb7cpPnG2taovnoWFKjpISwcg0kw9io5qitekAmVfCyHDotZT8ix
         5gRrBXvGV1pGt99TSgtv3bei7bCHs/HLghJwOsre5y8Zvnq7jwJgrRA6T+cwDGQrHhVX
         PB5jAqvVAitjYvn9l/MkjQ2qcKZ39rU4B7tWlztjEot2lYd31mtJF1cuudkj3NE8oQgQ
         KUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790774563; x=1791379363;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WjNzOSbZhH3UC1XcZKT+Hgp+Sdib45z8YSE/jOVoT0c=;
        b=hFayrSI05vEzn1ar9i8NVDzJ8q7gCH9xQaSC36M4dCgCGYqp1INPE3VGkreUVUpfWB
         XvckdavShzKr2Ryq+MkI2bS499W4Vt5JWDo4OEIpJ6qi0A6IVC71SXw6LyhvLvTzf0JH
         yhbTEP9RKbbrxu9s0sC/bkFSgzDgwXiVewd/W7tHUAex+Gtqmxi+3mHHhSNSX17/GM3g
         t2cAZvXYnmogzMOfT1il5TbzYkbpSfmsoGdnT9K2cfSOecbtV9QatJ8N/aJbrCszMWFM
         u2MkL2LGNIEf8z9HzInBLp6NRRssG/uOtr/XyJ8TXck78vAxWSYso4KbeBwgXjW5NYEg
         ADQQ==
X-Forwarded-Encrypted: i=1; AKwUvByTl9mKhRgN+fvSzysPCMA1o8U7E+ifyUyiARbQS2V3x6ee6aPXAKQ/4M+Ul2F/qc40XcAzp7Ylrcd6oGh4UalP@lists.infradead.org
X-Gm-Message-State: AFuF++kKnyziE3wE8Kw591w+9/K4UDc8J7yB700DcdXNoi0C/MiL6Ba0
	0Bi9EifzUmE3vxHx/GP6Z0WX61NE0m93J2weze1HtxGrBocZpDlX2CWLhgLHQW3EXOc=
X-Gm-Gg: AYBFou07uIq/yPpfHfTYdRKjQbHOakmnIJad8/ev9ibCV0RvXfAAZxPhYvtbCv5/ly/
	n+1VZK2dtfanFR+342KF5ae6wuDVnDz8osrIc/Zhmt543THLnSk6ZkLqeoN12h9pCmMHuQgcv3M
	9bZVKicfrV4kVknUy+w4KEz34FNhhSd8yamhu+bfyjeCYZeGy9q+cc7yhMt9DMWdU+tyO/GQjlh
	D326p7BdZ2bpDvrbzj0AU06o2i78mUZdZoSUkK+Zwk50rj4wwcAb/qHPSnMfzcf8eUsoL4gGFPs
	HDFR/JF8bg7tYkg5HASQjYVX7kP6yCbMMAPkCWHmK3HA2C4rWiv9Sxns10icQ5Y97UtdRS/TuTF
	vZtTak4+7w9y5u+yUMCz8cNqLYtzwgVc2ttHhUc3jYZAKb/dYxTxOpPQVHf6YIH+LVlcg2yK1EK
	3nHCX5WUWTVbQzj4hYFBe92pnqY0Bu2w0IU9mz9IjIN/Furp/zxyWmfCCmE0KZ8R0SQiRqs/TH9
	pV7oHTcNSCJJGsUJvEvvrswg+irtjQd+L4W1Z6Kj+yS3lstomqBbzM1z9EHsFWVS46gYmMX2g9F
	Sqgyhj4=
X-Received: by 2002:a05:620a:2717:b0:939:97bc:5645 with SMTP id af79cd13be357-93ca96b53e8mr222317685a.31.1790774562686;
        Wed, 30 Sep 2026 06:22:42 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ca82a87f4sm114784985a.20.2026.09.30.06.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:22:41 -0700 (PDT)
Message-ID: <a51f9814-fe65-4a2c-92df-cbc3f00036fc@linaro.org>
Date: Wed, 30 Sep 2026 15:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 00/12] soc: amlogic: clk-measure: Add support for more
 SoCs
To: chuan.liu@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
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
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_142246_963225_1414060A 
X-CRM114-Status: GOOD (  24.32  )
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

On 9/20/26 12:25, Chuan Liu via B4 Relay wrote:
> This patch series adds clk-measure support for the Amlogic A5, A4, S7,
> S7D, S6 and A9 SoCs, listed in the order of their release.
> 
> The clock names for the clk-measure channels are kept consistent with
> those used by the clock driver as much as possible, making it easier to
> identify the relationship between the clk-measure channels and the
> corresponding clocks in the clock driver.
> 
> This patchset also includes an additional patch to optimize memory usage:
>    - soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage
> 
> To avoid requiring everyone to spend additional effort on a separate
> patchset, I have included it in this series. Please feel free to point
> out if this is not appropriate for this series.
> 
> To improve maintainability, this patchset also includes a patch to reorder
> the dt-binding and the compatible entries in the driver.
> 
> To minimize unrelated changes, the existing clk-measure channel tables in
> the driver are left in their original order. The tables for the newly
> supported SoCs are ordered alphabetically.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Changes in v2:
> - Reorder the dt-binding and the compatible entries in the driver
>    alphabetically.
> - Order the clk-measure channel tables for the newly supported SoCs
>    alphabetically.
> - Add the const qualifier to the A9 clk-measure channel table.
> - Rename "exit_Tsin_B_CLK_IN" to "ext_Tsin_B_CLK_IN" in the A9 clk-measure
>    channel table.
> - Link to v1: https://lore.kernel.org/r/20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com
> 
> ---
> Chuan Liu (12):
>        dt-bindings: soc: amlogic: Reordering compatible of clk-measure
>        dt-bindings: soc: amlogic: Add clk-measure compatible to support more SoCs
>        soc: amlogic: clk-measure: Support more measurement channels
>        soc: amlogic: clk-measure: Align compatible entries with DT bindings
>        soc: amlogic: clk-measure: Add support for more SoCs
>        soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage
>        arm64: dts: amlogic: a5: Add clk-measure controller node
>        arm64: dts: amlogic: a4: Add clk-measure controller node
>        arm64: dts: amlogic: s7: Add clk-measure controller node
>        arm64: dts: amlogic: s7d: Add clk-measure controller node
>        arm64: dts: amlogic: s6: Add clk-measure controller node
>        arm64: dts: amlogic: a9: Add clk-measure controller node
> 
>   .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |  16 +-
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |   5 +
>   drivers/soc/amlogic/meson-clk-measure.c            | 927 ++++++++++++++++++++-
>   8 files changed, 953 insertions(+), 20 deletions(-)
> ---
> base-commit: a2530c83c458a503e55219966217dfd1c36a385e
> change-id: 20260710-more-socs-to-support-clk_measure-c826f8ab9e68
> 
> Best regards,

For the whole serie:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

