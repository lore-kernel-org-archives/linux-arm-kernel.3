Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BF4CF8553
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 07:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSz2GctBw2xvU5PntnomhhO4auUxq6yMHRLtbTex4HM=; b=RI1n3wuiRW1xjVSCRSNrFyEPRP
	31RjPL2JM7YnCgizNOkmAxrRULKFwM+RMR7fMnqXm+3nvMd6zKcT7QibFWl3NH9UKnryG/KR5uh0v
	7V4BVT6cCDMRUBKLljHRl2XSgm8aCHYWhfYvimIGnBJ4Tws5nlJlxH+EwXu0B6rvlJNRiatN7WbFa
	WQP4su0uSIJ2Kyp9bC4NAsXxD3UCwXNx4fbsXFQMzW2yLZMCf6up4kxP2xtVhkXk4/PmDeiCw7zyT
	POTpT4ECDoEVgFLnsDunGYGlZxlvfmDY2S2k3h+/JpC6XpuoGkl7iqpE/LAioTeN+Gi34nmxQ/YcR
	htzRl7Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLzVC-00000006JlM-3XlA;
	Thu, 20 Nov 2025 07:54:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLzVB-00000006Jke-0soz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 07:54:50 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so3874975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 23:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763625287; x=1764230087; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSz2GctBw2xvU5PntnomhhO4auUxq6yMHRLtbTex4HM=;
        b=w3O4uQtKoXn3St0xcnrlw6YT8Uo91ilu44jb4k7UJdNe632E4TOw7X2b1f815ajhPP
         RamLXGVL2ZAjY2Frj/NqpYE7g/UCHaZ8z9p55t8jClLSUCE8tXQsIGolN80Vcl234vU/
         K0uo9wfStzfFrEhghCTZ8yyNvr6nSybRugzigO/Pt2P6nHiXhdHEXBy+xUHc3xsiu+je
         eXaixWPaaRP1qV9TIqhAC52Y7jxaDdCogAjFacnhz+zfsURKQoSU0KNROei7t+LpvJNT
         oliJP6JEm7NLx+IOtzfKmoU8ENRtXchNSjbk1GyF81XxkzB626jgBQIgq3TjeUAajbYT
         /hxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763625287; x=1764230087;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSz2GctBw2xvU5PntnomhhO4auUxq6yMHRLtbTex4HM=;
        b=gZ+x/glue4CYhhKFLNTV9tJedL+iW0+oQCY04enl/fPrItgaMkqUUJ5JdsSBE6Q5Br
         LSq0g+L5GvzKoX+I1WUpHNFrEd7NAWwGO+UhSD0p7zYyKJOI8QxLrkTme95APufJVPCa
         Hz66y0JX7xtjqgsZ2ofcF4EGnsLj1YgrwAhDAohVmvQd0R1njpKRW9MIVrLuFXT/wGIr
         m4yLdKTbPE5PjxQakhvgK+2EEVlKHftCiHFZWpNF8ofcKYEyB37OC2G+42o/tYsHMLJo
         0fMlf1+tFMTsNerA//aR206gwEY/ASyj390GGxDKnyLkRei5OqhcuzoOzbN6Pn2laci9
         OKDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzQ4lS9E4Rn8gTLi3K6i1x/6SAGwYBkFJi6esoEFS8JvxNX87TGJC1avGCnI9FKCzNlLJejlVu2xexECkA5kfu@lists.infradead.org
X-Gm-Message-State: AOJu0YzbFSXTHbSvVDlQNL/PYSSoJH4DyKUsLVNfTYBeYyyDirCgPeQz
	XOFVIbq8Rdx8bcnECU9d0y3qqw3clBoVQSN9pKp2Otuk2Dn1Vmw7fMCaRUy15iOZupw=
X-Gm-Gg: ASbGncv4U/mu68c8nzow7sCIdZ94hJiT7TrZ9tB4OZhB+TORCSKJpFaNhfQgAU0/Xqm
	ycEjfMCl8hUCI1Qv+Pl6CHbN2cwItF7iBifmzaePlAqQvnpQVoAsH2q2jZTIOdmT0GjG89dCZDZ
	6/c73Rnzrpb8L79tVBgtPp+sn0XUOXid24feshMZhv7d2hSQECNJxhlfPKkhyUTXAStXqZP/AXe
	2mWmP1HTxUp0vH5t2owZ0wvuP0Coln2o7wZBlIeO0qlNELXbRYH62boFoM06BbHjlVInUXARxYG
	1RSGv0itHn4TJqnVv3rNNURKeS1qnxE8leD1nZbjwmD/EQtz4Vwk9H2ISPVc68PY+xGanNHxkoN
	Zux4N/jPAXy2uMMAutj5o67bNivXldv8E9WXc+MvwnwCbJnVUBWshczrUhfXNoKWrIg8Tqu4HFz
	SLXRdqYTSEkbSwwpj5XCLdP6Iq5ISOCflw7kuY6zSSS97HjKkcmfTxPLAkNFoAyNg=
X-Google-Smtp-Source: AGHT+IGZkigYvVipOkjCsohA+H+g4xgNMAhJfXWPt674Fr40MBEpp5RlEgS30L/W6WyTzBeuC+Bnmg==
X-Received: by 2002:a05:600c:35c7:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-477b8954523mr18503715e9.11.1763625287187;
        Wed, 19 Nov 2025 23:54:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:f6e4:d897:2b4d:1bc7? ([2a01:e0a:3d9:2080:f6e4:d897:2b4d:1bc7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b83200f1sm34221015e9.15.2025.11.19.23.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 23:54:46 -0800 (PST)
Message-ID: <d2b2807a-285a-40bb-8aa8-eacba97b1f14@linaro.org>
Date: Thu, 20 Nov 2025 08:54:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/5] Add GPIO interrupt support for Amlogic S6 S7 and S7D
To: xianwei.zhao@amlogic.com, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
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
In-Reply-To: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_235449_302495_AB47B50A 
X-CRM114-Status: GOOD (  12.78  )
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

Hi Thomas,

On 11/5/25 10:45, Xianwei Zhao via B4 Relay wrote:
> This patch adds GPIO interrupt support for Amlogic S6 S7 and S7D SoCs.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Xianwei Zhao (5):
>        dt-bindings: interrupt-controller: Add support for Amlogic S6 S7 and S7D SoCs
>        irqchip: Add support for Amlogic S6 S7 and S7D SoCs
>        arm64: dts: Add gpio_intc node for Amlogic S6 SoCs
>        arm64: dts: Add gpio_intc node for Amlogic S7 SoCs
>        arm64: dts: Add gpio_intc node for Amlogic S7D SoCs

Coud you drop the DT changes from the tip irq/drivers tree ?

Thanks,
Neil

> 
>   .../interrupt-controller/amlogic,meson-gpio-intc.yaml         |  3 +++
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi                   | 10 ++++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi                   | 10 ++++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi                  | 10 ++++++++++
>   drivers/irqchip/irq-meson-gpio.c                              | 11 +++++++++++
>   5 files changed, 44 insertions(+)
> ---
> base-commit: cb718411c4c05a4a424c2b73790a1648be97a4af
> change-id: 20251105-irqchip-gpio-s6-s7-s7d-9eb2ce7fccc6
> 
> Best regards,


