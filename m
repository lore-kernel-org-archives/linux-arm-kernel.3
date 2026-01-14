Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810B0D31A29
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 09:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofYNEYsZ/JYVYWk8P2K9X7Vw7eOrU/DC/WvC2YuSY3E=; b=avp1kgZsBRYHEWl4TEgPAqt4H6
	ar3cQzRf3+IBlbycJzUEqdOg0e1qN93+/A2puq7O1LbvBPq/pMxx40kZKu8FHfWPwbRPNPzZ/xuXT
	8Uoxl3hil/XO+1uyGmi42DtQg1sj+/syhP4jqqfw+7kngIkR22/LRVgBf0mNDIvwRKZU6CXFVj6+F
	/Wrd9FV86X3OUjFKPurDxEq+c2+hULyW2gn2cijzTdw/ZE1Z2i6XuW/atVr1LX8tyc/WJpkqBg2ww
	8uoPDwxIBe7PXuUJVZrJAoTpFtCdEHEZVNQPqWHSi+caeeapk1icgLirwwQOOcRnR554e/pV8e/WI
	MCCn0pdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwos-00000008ScJ-3Ldm;
	Wed, 14 Jan 2026 09:05:38 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwoq-00000008Sb8-15cY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 09:05:37 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-4775895d69cso42130315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 01:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768381534; x=1768986334; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofYNEYsZ/JYVYWk8P2K9X7Vw7eOrU/DC/WvC2YuSY3E=;
        b=hBB4RF8u2IUHed63FsRqdnAzwzxtdx7hnk7uImdiB5gVRQV6zowk+SXnP5h1YykAuT
         MWop+0BXEJZBiOm4aRM4/x77hfv0YBHmw3y+/uzq0u9C3n4eAZ05m8sSRT2TxZmzgoho
         qpKtKLwzjVrvLD6XWNsbW9sFW5bV8oPsW+sZYhLSj4Pd4w9BX5cHfdiVyoXswdXYNqET
         1jmNvG9s762qaZRQ8HIOBaBP3RVx3U8xC8j8GOHR1at3eR/h4YhYaJoAuOpwQTeyF7ke
         duWVlGpALS4WKN9PckL1MKgLTnr61J8G5MNiUVxjRu9Ga1ElcsCAwV41qL8Zb4MUJyr4
         4PPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381534; x=1768986334;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofYNEYsZ/JYVYWk8P2K9X7Vw7eOrU/DC/WvC2YuSY3E=;
        b=N59U3OWXCUF6X/0vUbU/rlKIZj5F5hHcnw0YWgACk+fUQblrOIMkNVbVMKJOSrkmr1
         PHtj6Tep3QXWUaZxBQ1gp2h/ru9LgVXM/4nM33uGjdEZg/yzRzgkGn+jbDcCeM9wr+QP
         rZleTL44h3lwzKrNia+KqpSA4U9GapVG9axJlyvJ7ze7QQrX4sTXcASR5kRrI0ggPBgF
         SzyBeE7YvAcfbMfDr2G/p3oaoVlmlNnA9iMA45Imfd85wrgYkViWbY30QKRneIhdYeJM
         EBCuXqs6qHRFsB5ZPvuiZ3kxNxa0ODXiAWb64vaTp00jrzCB+TeDG1xLq5uHekhRmdLZ
         qNbA==
X-Forwarded-Encrypted: i=1; AJvYcCUR7h4KrkT96Sc/wzeDnqJQYxPHDrehXN/jZoOR5otZ8C2V3G6bD4ClH2VffN9OTBRBmN2Wzo8ngsbAIvnMN5nl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4BCHwaMxIF6oJX6p+e38DJBkGprctVOGiSB4xBAzx8NeKHbxo
	WvFsXvZta84ucEp54zAR8pRy+AOvQLOiPsi45pPDZA1n1p0LadrJRicA1k9+O8IDYgc=
X-Gm-Gg: AY/fxX6nJnClTxPPI0N9amqvD+/4sSzITxXBCHCmMVlo67Y+a+T/m7U/VjwF0tqp5Ij
	YD99sBIKcZM3QivZjmufGuVIvu7odMCgIDM+3PD8AyTfWlzWffDSNBjFcApYjeStemr74ipkc2F
	lC90xjTCMeH5LOGBYUCYeKfd4Ig4TacRhAqQiKoGZMPaYCANszKalU3RMve3VrYRaoEi5Kdpehs
	9w8GnDZcCna0I8wzlErB+XeznotKUxglsGVsFJbF33ZUAmXoprSp8y5ABupTXVBJyYKIb/FNxYH
	Rz3quugNE4mzqJR/cuXwzWvXW9epSigGEa6IInIyrsRp1NOtsXo1VA5hVtvopaaYcv3ySUX3B6d
	hA5ExSQKa7hcCkeQkWQAIRiNyZduFZA8cdM8zz/ohydeQ22QMSKmMiB0I5hrQus5G0SD7i3UFHJ
	7aZBD/oFlc3FUEqN6qK+uvN1lZ6O/Bmfhv6DpARxBvtdrvs6Mjbf71XpuEuRR45zo=
X-Received: by 2002:a05:600c:3acb:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-47ee3353e2emr21588345e9.21.1768381534430;
        Wed, 14 Jan 2026 01:05:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450? ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee562d7aasm17655715e9.11.2026.01.14.01.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:05:33 -0800 (PST)
Message-ID: <a09feb0e-6736-49a9-aba1-799174c9b43a@linaro.org>
Date: Wed, 14 Jan 2026 10:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: s4: fix mmc clock assignment
To: Chuan Liu <chuan.liu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
 <20260113-amlogic-s4-mmc-fixup-v1-2-1ab1fca0fb2f@baylibre.com>
 <2491170c-d055-4231-8fd1-164d89198ae3@amlogic.com>
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
In-Reply-To: <2491170c-d055-4231-8fd1-164d89198ae3@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_010536_367875_F7A51DE8 
X-CRM114-Status: GOOD (  16.48  )
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

On 1/14/26 03:48, Chuan Liu wrote:
> hi Jerome,
> 
> On 1/13/2026 6:39 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> MMC A and C are mis-represented as having their "clkin0" input connected to
>> xtal while it is actually connected to the MMC clock, mostly in an attempt
>> to provide 24MHz to the device on this input.
> 
> Right.
> 
>>
>> Fix this and assign the clock to 24MHz to actually provide the required
>> rate.
>>
>> Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> index 62538fd9db6b1ffb33a88e12628aadefbaa453ec..6324d1eb5994009df5b09923cce373a87229f4b8 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> @@ -819,13 +819,17 @@ sdio: mmc@fe088000 {
>>                          reg = <0x0 0xfe088000 0x0 0x800>;
>>                          interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
>>                          clocks = <&clkc_periphs CLKID_SDEMMC_A>,
>> -                                <&xtal>,
>> +                                <&clkc_periphs CLKID_SD_EMMC_A>,
>>                                   <&clkc_pll CLKID_FCLK_DIV2>;
>>                          clock-names = "core", "clkin0", "clkin1";
>>                          resets = <&reset RESET_SD_EMMC_A>;
>>                          cap-sdio-irq;
>>                          keep-power-in-suspend;
>>                          status = "disabled";
>> +
>> +                       assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A>;
>> +                       assigned-clock-parents = <0>;
> 
> Is it possible to remove assigned-clock-parent?

Yes it's not necessary to keep it.

Neil

> 
>> +                       assigned-clock-rates = <24000000>;
>>                  };
>>
>>                  sd: mmc@fe08a000 {
>> @@ -849,13 +853,17 @@ emmc: mmc@fe08c000 {
>>                          reg = <0x0 0xfe08c000 0x0 0x800>;
>>                          interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
>>                          clocks = <&clkc_periphs CLKID_NAND>,
>> -                                <&xtal>,
>> +                                <&clkc_periphs CLKID_SD_EMMC_C>,
>>                                   <&clkc_pll CLKID_FCLK_DIV2>;
>>                          clock-names = "core", "clkin0", "clkin1";
>>                          resets = <&reset RESET_NAND_EMMC>;
>>                          no-sdio;
>>                          no-sd;
>>                          status = "disabled";
>> +
>> +                       assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
>> +                       assigned-clock-parents = <0>;
>> +                       assigned-clock-rates = <24000000>;
>>                  };
>>          };
>>   };
>>
>> -- 
>> 2.47.3
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 


