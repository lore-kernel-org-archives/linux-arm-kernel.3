Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B2AC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evKoye4qr3e2esDEjAClgjzYt25iik3YDkZA93sVcVQ=; b=cFOUr8OdlElpv3Jrl91O7h9zLd
	V8y8eUgkCT1R/ZSTZMnVvzZGcRatj9PRzJAAmTPTsomjMvX4GhQjP05M1c+ShXHH8U4r54u6uB13B
	EKUN4vdsYdEPyoDcpPh3N9NnpAYm8+ry3Ng3suxGxAqnenG1PjERUs1b7X6G8To7KVQSOth0bAmqb
	a4A1o21iQ9FFQpaXo9Ue55L7Wcwq0qe8bapkOIfbb1QbLKeQIlbOQX3s5WhzWbIWcdz7z1mj2ZY73
	O45faUTj48pkuwEeDyZxokl69qiYA0pdFBP5FIh3ad+ffkfWw0PRLcYoze93R7jQ6ZaSOkwntBA8/
	UfhFEV7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbuP-00000002OwP-1Et7;
	Mon, 24 Mar 2025 07:07:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbqg-00000002OUn-31KT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:03:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso26878525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742799829; x=1743404629; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evKoye4qr3e2esDEjAClgjzYt25iik3YDkZA93sVcVQ=;
        b=LFjACb8lwZysxSb74+RiPxPmvXFF9ToLsa5jqCyOUXHFNstt+mXZ7udDGYU2UObfiy
         VrNpVTkPgNzRVAND2Is3PuUHDaaYELwqQA2xxEbxYd1N/v1oztDDPgeTfoi7GrNHh/FG
         vSc5NumEIqr/JZ7JlSai+VHUZqxpDcCdR78ElzXCRuXokGGRcpNccKeD/peakiXjcIdq
         xzvLCZjEMZpaUPPKOiURY+zYOy+dgqlE9RBrjP969p232TEvij8otcvrmTBdy+O3/vHb
         VPh+9AJsfhjYnGew5LNOiL7S/Id9RgZAM+4U2PstW3Sl9gDOuea4GjcbJjn0bidM3mNh
         XY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742799829; x=1743404629;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=evKoye4qr3e2esDEjAClgjzYt25iik3YDkZA93sVcVQ=;
        b=pCEG+FDKGa40Fyi0EALjEAx+STC6lw0bCVyPnbbjtrhkF2/DRLJnKDv21tWcqsUDZp
         cJLG76dgPHiZRMgfIktR/lSUuAGU7y5//SFzhY4i6jbpEhOS3JEQIK4zY5h7Sp09mZse
         GXx//PhWALDpliXPOYms/0abk1tkMbYZQv1/TdMEgdzzA5BM17rkbaFojf3dUghdwoqP
         26YfnWHmyP0PUD2YxMPin2Cf6DCFsQkEmevEjr1+hXm0bI8TPhXYAGmN6/Qct1hmk+Vp
         R6I3PbIfJqd+xIuySylNOEeCtuifuhfpHG1qIVEoH5y3U5FAR+PmmGMuzm9FyhuyppqN
         c6xA==
X-Forwarded-Encrypted: i=1; AJvYcCVkBnVKHcbZfAB43k+jnBrHzSOkkFFrHSBdREM9cK8CPLs4YCZ42SFpyhxwKNX53JkKZDvOuQrfG2Yrass6PhSp@lists.infradead.org
X-Gm-Message-State: AOJu0YwFxeM5/c6THFppWcOqRoLaEaTCr7f37do5LyP0jDSMMhbYc5DA
	oIfpjlIvzK88f/PK6cddEl3SiJ6DiVsL5Ii5ghiNSn22y4sdL5ks0yQrNt5lxI0=
X-Gm-Gg: ASbGnct1auCKYJw2wRr/hDsVKTBzGNkXAgbcPY23xT/boNLdmD2sDPkoXPO1HQNNl09
	xpkYo7igBitz+QUhgrH6JMA2V+41bqB+3HBGZQF4PRC+bKJfaq+kwIGYnG8i5hTi/n9KxfIEn6C
	cFB5mLSpnSy5kje4vvw2CB5M5+KKY09VjfuX5jxWf6yzLdwJjjlmqfZJqjq9OFm7q8m31vVsFK7
	/lQpg34ubIUXD2kqzq8RTzgnOpQ9X//goRIzUK2PQdWVijNpNizfDXFKBNNJEV+RpM9PKoamzDM
	LSZ25uPn/lYIzrEfXDTgV8OaP8AI1n2l2ZeARvWEE7TwAkKQw0RRPH27FJbR2hs9+URFV2+yt72
	mm7biorC78tUc6hWZ
X-Google-Smtp-Source: AGHT+IFrItb54fv7OtyWO3JUfvqB/p+6ybKUl5+PzXmwRlD5DkQF8OviAn1ax7qXq3VcP+u5iINy8A==
X-Received: by 2002:a5d:5f96:0:b0:391:2fe3:24ec with SMTP id ffacd0b85a97d-3997f91072amr9832062f8f.14.1742799829315;
        Mon, 24 Mar 2025 00:03:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a356:8d0:d4d:bb5f? ([2a01:e0a:3d9:2080:a356:8d0:d4d:bb5f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b5939sm10243311f8f.60.2025.03.24.00.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 00:03:48 -0700 (PDT)
Message-ID: <88dbbf6e-7886-4261-ac46-55738156a5fb@linaro.org>
Date: Mon, 24 Mar 2025 08:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ferass El Hafidi <funderscore@postmarketos.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Artur Weber <aweber.kernel@gmail.com>, Karl Chan <exxxxkc@getgoogleoff.me>,
 Christian Hewitt <christianshewitt@gmail.com>
References: <20250319190150.31529-2-funderscore@postmarketos.org>
 <20250319190150.31529-4-funderscore@postmarketos.org>
 <CAFBinCArRO-F59tOv9m27f+DV+qhy69OGUunGOAbDdfOdd5_Xg@mail.gmail.com>
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
In-Reply-To: <CAFBinCArRO-F59tOv9m27f+DV+qhy69OGUunGOAbDdfOdd5_Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_000350_764191_5B04BF06 
X-CRM114-Status: GOOD (  16.58  )
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

On 19/03/2025 23:36, Martin Blumenstingl wrote:
> Hello,
> 
> thanks for your contribution and sorry for the late reply!
> 
> On Wed, Mar 19, 2025 at 8:02 PM Ferass El Hafidi
> <funderscore@postmarketos.org> wrote:
> [...]
>> +       au2: analog-amplifier {
>> +               compatible = "simple-audio-amplifier";
>> +               sound-name-prefix = "AU2";
>> +               VCC-supply = <&vcc_5v>;
>> +               enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
>> +       };
> I couldn't find any pictures online that show an analog audio output
> (typically a 3.5mm socket).
> Can you confirm that this is really present?
> 
> [...]
>> +       sound {
>> +               compatible = "amlogic,gx-sound-card";
>> +               model = "XIAOMI-AQUAMAN";
>> +               audio-aux-devs = <&au2>;
>> +               audio-widgets = "Line", "Lineout";
>> +               audio-routing = "AU2 INL", "ACODEC LOLN",
>> +                               "AU2 INR", "ACODEC LORN",
>> +                               "Lineout", "AU2 OUTL",
>> +                               "Lineout", "AU2 OUTR";
> If there's no analog audio in/out then this section can be cleaned up
> as well - together with the references to acodec in the dai-links
> below.
> 
> [...]
>> +/* Wireless SDIO Module (Amlogic W155S1 / Realtek RTL8821CS) */
>> +&sd_emmc_b {
> question to Neil: since we know that there's two board variants out
> there (with different wifi chipsets) - are dt overlays down the road
> enough (to enable Bluetooth / wifi - depending on the chipset or board
> revision) or do we need to split the whole .dts?

Perhaps yes

Neil

> 
> 
> Best regards,
> Martin


