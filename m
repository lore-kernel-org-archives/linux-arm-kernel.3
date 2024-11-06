Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08745D44D73
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 14:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ehYC5jyHQqP2TfK80B/7xWqvzi8c0/X0fL6unhG4urs=; b=2Rtlgd2AGBytPO
	TDiL10leb35/OGAsMqSMoNtMUopPHMlrV7KQRlTkkSE7LX22tOZeTaw3uq4EcqiRXAVhiEs1auHD/
	ePCIknYHv0ZH7IzxfT7cuHQqq8McqpER/1NStOKHU3cB95ZWM/Ndcp9IjH5TFfqaCaIFvWL1EqbUT
	42c+8k284KWjRr4CrNleeRLdQUubb6Ig3+Y7NhKzl6X9TGalRkDt9wp7ZZNr3VnenJH2/BkCLnCmz
	9+mg55d2J1tk9tSgiIxfikUGw++1IbQfLfl5Nzna0xYp3iz58LSJvxJd8p2xCVK+ICRT1fcvz51uL
	mXl20FGilGmid2ae0/nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8geB-00000003X9u-19LD;
	Wed, 06 Nov 2024 14:04:35 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gMC-00000003TOy-1nGZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 13:46:02 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so8338192e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 05:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730900758; x=1731505558; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehYC5jyHQqP2TfK80B/7xWqvzi8c0/X0fL6unhG4urs=;
        b=nBPoOJzhykyoYbwcV19EzWU567+GvMs56ZjjqGvWDKJgk1b4BkRDJmIPtk0IWKEzLs
         HlqpIRDhG+9Ze7tbdgugys6ltl5wyndu/LyVb4zjZYkwGyPfUQRVVdyJPFDeraZh1MIY
         oxloAfE5E1ycfc8MeKk6uaZrWjvSTk9nvxDLPgA1VMndPGgYpE7J6i+X1s1oN41awXUa
         GTncyQBFh7BLt678Xx94tS+SII2Icv4/OcjDQSJ90V2zuPcw3tMRY+UKX2NGL2G5rDnL
         PhvSE2etHLMdP4drQHCc+FTtlrrof3d59R+iSzQi0r5jU9GhpIx1RUCo6i9Yq2OAHkxu
         KNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900758; x=1731505558;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ehYC5jyHQqP2TfK80B/7xWqvzi8c0/X0fL6unhG4urs=;
        b=cz+509HNti52fOOGdn+hDEuTb2EHd2kg4yydSzKv4Deo4kriwOrPhDOPsYDUw45V+A
         GHx40hNfuGfGnLdGqfoDvruhog+FVViE2husD9F0md2BSHuWUiJfub7/0Wrr+642E4do
         t7y3EsVF3j0jymMag1LB/V5lTuTYOtyuSE+mJU0GnEi0I46UL3CaSfKMYcQifyQEwtoJ
         HnmkChTTgpoEv8HYRV9XjHGF2LdOycUD0brZxSTigxcmht1pTp/4PiSZsZHw9vdsRXAt
         gwqYL3186M7yW7Cgj+ZAS5EVPWUehFzXeUIeLHzWGPnokmckyygnZun6dWGzusRpmVsq
         olNw==
X-Forwarded-Encrypted: i=1; AJvYcCUTvjfdXQKZntQp7SBeqWTGxue6Zn+FUgA/A/A4zZCz+VTwSjhnZoP0Qq5eLsdYtQViR6W/twixUDxHvRhNVeWw@lists.infradead.org
X-Gm-Message-State: AOJu0YxgoPw/kqLDrzaKY9AcfJiXLQPEcf0re+yWq/wj4tn9M82FSAKV
	DyWdIynPqD66E4rtiqzeSsjkge3lcqIQM6uUyXIsa9kH5eyU6d0xQ7C32QkxZ/Q=
X-Google-Smtp-Source: AGHT+IG36xkVt+ks+JYrBPCyJZNNr5to2RevB/PEtfvJ914bM+YQAJ+CS5sRJcV8XkOk11ShH2fhow==
X-Received: by 2002:a05:6512:3ba3:b0:539:eb44:7ec3 with SMTP id 2adb3069b0e04-53b3490fabamr19945832e87.31.1730900758178;
        Wed, 06 Nov 2024 05:45:58 -0800 (PST)
Received: from [172.16.23.252] ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa5b60cfsm23255865e9.7.2024.11.06.05.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 05:45:57 -0800 (PST)
Message-ID: <6fb3d64a-3913-4db0-9cdc-336af32a88a9@linaro.org>
Date: Wed, 6 Nov 2024 14:45:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.13
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_054600_516054_C04D04B0 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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

Hi,

Here's a set of Amlogic ARM64 DT changes for v6.13, with
PWM for A1 & C3, missing properties & typo fix.

Thanks,
Neil

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.13

for you to fetch changes up to be90cd4bd422e8ae235f534a2fa46d40dae0816b:

   arm64: dts: amlogic: Add Amlogic C3 PWM (2024-10-09 09:57:50 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.13:
- Add PWM nodes for Amlogic A1 & C3
- Addd missing power-domains properties
- Fix G12 uart node name

----------------------------------------------------------------
George Stark (2):
       arm64: dts: meson: a1: add definitions for meson PWM
       arm64: dts: meson: a1: bind power domain to temperature sensor

Kelvin Zhang (1):
       arm64: dts: amlogic: Add Amlogic C3 PWM

Theo Debrouwere (1):
       arm64: dts: meson-g12-common: fix uart-ao-a typo

  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi       | 364 ++++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi         | 216 +++++++++++++
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi |   2 +-
  3 files changed, 581 insertions(+), 1 deletion(-)

