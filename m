Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F846D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 08:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhpKp4EOdc/uAxidXP5+DjIvtbDmc1Iqu+qiPd4ztK8=; b=RoVhNemfkYjaDT9gxRUt9ikmu/
	i7MUQL8uED1+aQBRzXlcx8ZwW+1QQRp6MmsuLjh+uNgZX3jGw5HLT6a8SBkA4/xbkJuMMxMRRmWCd
	nqaRplMg3F6K2CYXlo7uPvMzwF9eoz/CdhMsc0CToKCZLpm23APVe9leroosSRD761V3qlf9dvKxT
	tQ1vN6lanhsFGcdrxPHMmut069Vkk9XJC/vnZ/yy5/vyE0oz+nRJhXDmQwzfJ7t0IlwJJGt55I2Eq
	GHNbu8QY37emiTZD1KPxaQtNlXjnc/CouBBELLXx6hjUJPYRe0jFOoSgxEa8hsEcNwrlHywvLU4Kz
	4G36bMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi751-00000003ShX-2L8m;
	Tue, 20 Jan 2026 08:27:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi74y-00000003Sgk-2aVI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 08:27:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4801bc32725so24234065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 00:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768897629; x=1769502429; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhpKp4EOdc/uAxidXP5+DjIvtbDmc1Iqu+qiPd4ztK8=;
        b=xHu3u4ifSn8TklvE7CvkrPMxVzmUzNa9IK/bEMJKKC+6VL8q4LiSkNz2VGe1UHGT71
         5ywwjzHUOqtXox3zsBiMX2eIsNbakelgV/c0Upog7qVaJBvEiuzNuehEYDJw85KR08MJ
         SOmHuJdGUkEMOT3VvIF1weVutgJ5CJYIRLSStPRmhw832rnniShUwMjBl/sYfUzbIqyL
         5+IOim7Lyjnf/2NGOH0enXgsBjQP9Pz/x7Z7V7cXjsVQtsYf3Zztbqo+9PzGAreGHSw2
         v2hftEp50pBn+KqwQ4p7DPfKU4ktJ6SGiY/Ul4zyfKbwFO0RSj1HD/EzkMQvoIS3L3Jf
         P+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768897629; x=1769502429;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhpKp4EOdc/uAxidXP5+DjIvtbDmc1Iqu+qiPd4ztK8=;
        b=QeFSybalslt6hHUQVsS4vtXbHbAld1nQGDaRFiz801oYodIAUKmeXjVDQlMlc2Dh5e
         3szyQ5sHxKsywTVGnk6emgJsNry6pIyADeHcBwfLQrdX5ab2kxIZ7gw5CUsvfzft5iFR
         OrrJXWoEsNl9akEWQ5rJZUo97yd4IvfPKh1EXzTNUz+sytaEe4Vx4tVsVAh8mzYx1CKG
         69bxkEV/EZ4pU3m9SoAkQZ1Vs1Ty2pK+LPWyR3Z3F3v7QnU9CRiO+OrMv870uRHmBoAV
         94Lez9e++iiF0ZGGUQfAQ6ijQrn+bK2IHJM1vBGyrNOn+NLV3pCBSqnXf6RYMBRBliOy
         6QTg==
X-Forwarded-Encrypted: i=1; AJvYcCVlHRxq6nnUFaBwqkGgzba7A6rzV1Onea4uYdFZDcQTGTkO0fPguLHPucplHLswVHR87C9mv6Vyeu7820nt0Hwn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8C4ahXKOt5eJ9HSd2avzvwWrW155IsN8lYex4hrKknS52lGWr
	p2dHF44GGFUV53u/ihqdEQmzG+6ufADFCoNhvgwYnMYmzBKMFLq/bKf9AaVk1siN4Ds=
X-Gm-Gg: AY/fxX5nUGM6D/GF9tjEJBHFhPVoPJTry0hkWCGFF8Nzf4VtZm3IZNreVb8nQJOErq2
	WX9l5dcBZLQUHFri2P9SUH11zIVbI4jBGWKkMHpAV0eyE0PsKHPHGqegEWOBCEGr/Tn/HSvOTkA
	ErCtBxGnFyBud+iMZgweNjaCLULgkV9P9MsPCVroNIGjpMYY+yISI9n1iZ80qOpMiDRSkAJgJn/
	Q5Y1p4KmHOsVm9IQ/qrgwBpDPE9QmcaUyLuEaBaF0b/TRPNOoW9QxcV599jtwjQtNCP6UC3pxb3
	Xtx5CSU8oZQAGg26uBzyHJB0TixrvePD/B7WHbXZwxQ3WfaRO00CPgJ2KCMegYGwMpk3p8TZ5tO
	yayTpD1GEJWsRSRgKS7zfVogFmxeVXY/RyFZJLUTk99cBhov8EdZNXfohxD8X2nnBjiwHsig6Q6
	Uu72BOXqxjckS/IyRVjKJmor2rO1jjc1bFLwuwWjgwdO9xEyZBMe/k7B93+Rmx+Yw=
X-Received: by 2002:a05:600c:4748:b0:480:1c85:88bf with SMTP id 5b1f17b1804b1-4801eb10a4amr178650505e9.27.1768897628697;
        Tue, 20 Jan 2026 00:27:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0d5:3a84:e303:190e? ([2a01:e0a:3d9:2080:f0d5:3a84:e303:190e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e80c477sm274167845e9.0.2026.01.20.00.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 00:27:08 -0800 (PST)
Message-ID: <3bf9ab54-6d9d-4d17-bd43-9f6ad10c48bb@linaro.org>
Date: Tue, 20 Jan 2026 09:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIIHYxXSBhcm02NDogZHRzOiBhbWxvZ2lj?=
 =?UTF-8?Q?=3A_meson-s4-s905y4-khadas-vim1s=3A_enable_SDIO_interface?=
To: Nick Xie <nick@khadas.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "khilman@baylibre.com" <khilman@baylibre.com>,
 "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "xieqinick@gmail.com" <xieqinick@gmail.com>
References: <20260116023900.2036657-1-nick@khadas.com>
 <CAFBinCAeNcKW_dK+1LD7U_+JkcozxmMw9J4oGUt1=OcvJ95dFQ@mail.gmail.com>
 <PS1PPF62EEA9B1D468A8845F947D26A387BAE89A@PS1PPF62EEA9B1D.apcprd03.prod.outlook.com>
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
In-Reply-To: <PS1PPF62EEA9B1D468A8845F947D26A387BAE89A@PS1PPF62EEA9B1D.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_002712_703885_3C45A08D 
X-CRM114-Status: GOOD (  17.25  )
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

On 1/20/26 02:34, Nick Xie wrote:
> [...]
>>> +&sdio {
>>> +       status = "okay";
>>> +       pinctrl-0 = <&sdio_pins>;
>>> +       pinctrl-1 = <&sdio_clk_gate_pins>;
>>> +       pinctrl-names = "default", "clk-gate";
>>> +       #address-cells = <1>;
>>> +       #size-cells = <0>;
>>> +       bus-width = <4>;
>>> +       cap-sd-highspeed;
>>> +       sd-uhs-sdr50;
>>> +       sd-uhs-sdr104;
>>> +       max-frequency = <50000000>;
>>> +       non-removable;
>>> +       disable-wp;
>>> +
>>> +       amlogic,dram-access-quirk;
>> Have you tried without this property? To my knowledge only early G12A
>> and G12B SoCs required this.
>> The mode enabled by this property limits the SDIO throughput. So it
>> should only be used if the silicon requires this.
> 
> Without this property it will get an warning:
> 
> meson-gx-mmc fe088000.mmc: unaligned sg len 96 blksize 512, disabling descriptor DMA for transfer
> 
>>> +       no-sd;
>>> +       no-mmc;
>>> +       mmc-pwrseq = <&sdio_pwrseq>
>>> +       vmmc-supply = <&vddao_3v3>;
>>> +       vqmmc-supply = <&vddio_ao1v8>;
>> I'm missing:
>>    clocks = <&sdio_32k>;
>>    clock-names = "lpo";
> 
> Maybe it is not needed? This clock property looks for the bluetooth not for the Wi-Fi ?
> 
>>> +       brcmf: wifi@1 {
>>> +               reg = <1>;
>>> +               compatible = "brcm,bcm4329-fmac";
>> Is AP6256 using a bcm43456 chip? If so then this should be (according
>> to Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml):
>>     compatible = "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
> 
> OK, I will fix it in next version.
> 
> With this SDIO patch, the SDIO card detected well, but when try to connect the wifi, it still failed.
> So maybe extra patches are needed to make Wi-Fi working.
> 
> [    5.909858] meson-gx-mmc fe088000.mmc: allocated mmc-pwrseq
> [    6.113160] mmc2: new UHS-I speed SDR104 SDIO card at address 0001
> [   19.206019] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43456-sdio for chip BCM4345/9
> [   19.208638] brcmfmac mmc2:0001:1: Direct firmware load for brcm/brcmfmac43456-sdio.khadas,vim1s.bin failed with error -2
> [   19.218170] brcmfmac mmc2:0001:1: Direct firmware load for brcm/brcmfmac43456-sdio.clm_blob failed with error -2
> [   19.332091] brcmfmac: brcmf_c_process_clm_blob: no clm_blob available (err=-2), device may have limited channels available
> [   19.332113] brcmfmac: brcmf_c_process_txcap_blob: no txcap_blob available (err=-2)
> [   19.332327] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/9 wl0: Jun 25 2021 17:13:38 version 7.45.96.94 (7bb6b14@SYNA) (r745790) FWID 01-2bdfb64c es7.c5.n4.a3
> [   19.332731] brcmfmac: brcmf_sdio_read_control: read 232 control bytes failed: -84
> [   19.332988] brcmfmac: brcmf_sdio_rxfail: abort command, terminate frame, send NAK
> [   21.939090] brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
> [   35.587422] meson-gx-mmc fe088000.mmc: unaligned sg len 96 blksize 512, disabling descriptor DMA for transfer

This is an issue with the driver, it's unrelated with the amlogic,dram-access-quirk, which fixes this because we use a bounce buffer.

> [   44.412677] ieee80211 phy0: brcmf_cfg80211_connect: BRCMF_C_SET_SSID failed (-52)
> [   45.696901] ieee80211 phy0: brcmf_cfg80211_connect: BRCMF_C_SET_SSID failed (-52)
> [   47.491768] ieee80211 phy0: brcmf_cfg80211_connect: BRCMF_C_SET_SSID failed (-52)
> [   53.292090] ieee80211 phy0: brcmf_cfg80211_connect: BRCMF_C_SET_SSID failed (-52)
> [   59.866328] ieee80211 phy0: brcmf_cfg80211_connect: BRCMF_C_SET_SSID failed (-52)
> 
> 
> Best regards,
> Nick
> 


