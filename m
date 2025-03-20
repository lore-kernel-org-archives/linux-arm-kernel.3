Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534F1C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0kwE+SJqtUvsUuOi4gOltpyOEmelfpfJunPkTYkz3ZQ=; b=zehGVgx8FsEMZ1
	LZ76b0vw6wau8LvFv+E3j8jPCrFGFd0CuETSEsjqex1NBxHnQvFUZfeQgA+GxJTrdHD/rHf5PRta2
	0daI147x5rgv9Nw+PlFGbhaOa8xw9sS2wOs5c7wGf+eS89IuGSKpq3ACQHliNW/fsY+6INdu2QCcR
	eaFuXq+V+q80pBQBvNp0bT9JZ7dq6ZYcF74GQmraLiSWmqwYGTG5suUHwrX1evvjmf8W5n0ccszar
	fu4ht+KkNEP13KioVwdvCnmhvpzkcwZYGnqlkfgjXC+Sj6nkQuPynTWKV87mqxc3iB8/hDHc0QWeH
	3D6IpQWrf4Hf8032KbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBXZ-0000000BaGb-4BAJ;
	Thu, 20 Mar 2025 08:46:14 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBUJ-0000000BZiO-2j3K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 08:42:54 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-391342fc148so262071f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 01:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742460170; x=1743064970; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0kwE+SJqtUvsUuOi4gOltpyOEmelfpfJunPkTYkz3ZQ=;
        b=RUzPQEHA2k9FGgFQYM9U5fm7oylq28EM4MRZP00uQVwSjH9HRiSPp4SUTlCD4Hu+AV
         3w+/Xlx17lJlPq4XM2n4loMbohif0Pu8aFIgsUhGIeW8GhzmmZ2K82SIXjEl7lesZq7S
         +CqYHYrAJUOBsU/hZmEVZWhGyrVp/JhV41HKnQ2UA7bUbFJ8ONdOyS8/LQhDwve5yHOM
         04J9+lfqcxN+FX/j4cusczb7gBFH+51Os0hettz9lxcO8ftHsFcssmibna8Ke6u29Tq0
         KFxgPj3uutLiVkQ00RpF3/kAjgRIG0CGm8kwlr471Fu+pEvFysSlGZeBlNl9m+uZjhQ5
         Y2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742460170; x=1743064970;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0kwE+SJqtUvsUuOi4gOltpyOEmelfpfJunPkTYkz3ZQ=;
        b=gRnVbqqb5EQEsU8DmFp1K1ieksmF7rugUk2ptx2EUev3iFeRLesgKIsVvHvTj9S06x
         ek5z+erfjBMoPwCCLSky2p+o0TvB7SxYG4/NIJZp8p9VEbrsGiCKaJ7SetT5mfipmQod
         0B8iH07vZ8cAzBLMArgViqqsBKnrw7P57DmyVbV6slN71M9LiwFLvrMN6FidlgxKv+aQ
         KbA3VzSeasRmzet7o7pwQZGI/LT1Rm+940X9cyWx4HSDmsEsw+d2XQNaOYTCavVsMCPL
         1QVQD+iEt2dy0BmR7sMEjbJL3hyKhsU0zhG/g8PRZu1qEK6aRJZw931zQqomu6DJRgOe
         fqOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0RNtwdc4mHgJbrhH9tj6oOvi2xzc+gZNkxB7l3hkiO9Eff6RXvDqmPvUw9DxkrPp84EErVK6784yYOq2YGOXj@lists.infradead.org
X-Gm-Message-State: AOJu0YzV55k7vAAbiYywaAmEjlqAbP0oekeCJC1Cb+Xsnb1FpuhhKOg6
	zSZuBElLrDR3G1ApOtY9pkXOKPVTxdN0fb8KsNQpDPgxI50snvR45wYNfY03zbc=
X-Gm-Gg: ASbGncuBmbdfsh9oL/euCMtY4lnMm1qAEOF/0spQBRVoO6DDYSYNkQ6WMrA7jT7DGdH
	xbHZxWz1k8Uq1AfI28syQKXiByT+hx1NPVwN6ljgrm6HozLsl1nNAm7QIofhTh/HtxiBnO9/Xqi
	5nuHvlntx4/fJSlgmos+XIFxzR94H8lszoOdwALeWPjwrNdDDnUUTOK5BLOZ52KKfBQp1OTRyB2
	dLlto9c3dbiquSC49hwyg7ZQLf7jR9iuwBWBpk8EfmXye1q7Dyh/pqm6FRskrgYBqIpHwZtXpAv
	UZAJjm+Edu9U7angGHo4CNLtu8aqiFNb7YI2g1QZSoz5xuqxIwTZYbgPrdfSu8cmnERp6r97hq4
	Mw5fE0Xu/R1C2i8ztbPEIzmJegA==
X-Google-Smtp-Source: AGHT+IESwEI4bW3h8OovwlFgf3Y/NiHOlvqY+nT0rDadnVX8ifaJ6wjqBUoAfB++I5vFZuv52jMAuw==
X-Received: by 2002:a05:6000:1448:b0:391:3b1b:f3b7 with SMTP id ffacd0b85a97d-399739c93dbmr6175104f8f.28.1742460169903;
        Thu, 20 Mar 2025 01:42:49 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:41cf:ed29:6024:4821:e502:e016? ([2a0d:e487:41cf:ed29:6024:4821:e502:e016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6b37sm23398901f8f.37.2025.03.20.01.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 01:42:49 -0700 (PDT)
Message-ID: <f6fb1b2b-955d-4271-b772-0a75fdba1e48@linaro.org>
Date: Thu, 20 Mar 2025 09:42:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL v2] amlogic ARM64 DT updates for v6.15
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
X-CRM114-CacheID: sfid-20250320_014251_717073_0B4BC13E 
X-CRM114-Status: GOOD (  11.24  )
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

Here's a changeset for Amlogic ARM64 DT, switching to the new PWM bindings
which has been in -next for the last 3 months and the driver was designed to
fully support the old and new bindings, and finally adding gpio_intc
node for Amlogic A4 & A5 SoCs.

I removed the pinctrl changes, since they can wait another cycle.

Thanks,
Neil

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.15-v2

for you to fetch changes up to 67c2799bf11fd0f1323579dead240bfda5b6a3b6:

   arm64: dts: Add gpio_intc node for Amlogic A5 SoCs (2025-03-20 09:31:41 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.15 (v2):
- switch to the new PWM controller binding
- Add gpio_intc node for Amlogic A4 & A5 SoCs

----------------------------------------------------------------
Martin Blumenstingl (3):
       arm64: dts: amlogic: gx: switch to the new PWM controller binding
       arm64: dts: amlogic: axg: switch to the new PWM controller binding
       arm64: dts: amlogic: g12: switch to the new PWM controller binding

Xianwei Zhao (2):
       arm64: dts: Add gpio_intc node for Amlogic A4 SoCs
       arm64: dts: Add gpio_intc node for Amlogic A5 SoCs

  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 21 ++++++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 12 ++++++++
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         | 24 +++++++++++++---
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 33 ++++++++++++++++++----
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |  4 ---
  .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |  4 ---
  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |  4 ---
  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |  2 --
  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |  4 ---
  .../dts/amlogic/meson-g12b-a311d-libretech-cc.dts  |  2 --
  .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |  4 ---
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |  4 ---
  .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  4 ---
  arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi |  4 ---
  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |  8 ------
  arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |  6 ----
  .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |  6 ----
  .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |  2 --
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  8 +++---
  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |  2 --
  .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |  2 --
  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi   |  2 --
  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |  2 --
  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi  |  2 --
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        | 25 ++++++++++++++++
  .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |  2 --
  .../amlogic/meson-gxl-s905w-jethome-jethub-j80.dts |  2 --
  .../dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts |  2 --
  .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |  2 --
  .../dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts    |  2 --
  .../boot/dts/amlogic/meson-gxl-s905x-p212.dtsi     |  2 --
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         | 25 ++++++++++++++++
  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |  4 ---
  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |  2 --
  .../dts/amlogic/meson-libretech-cottonwood.dtsi    |  6 ----
  arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   |  6 ----
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |  2 --
  .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |  2 --
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |  2 --
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |  6 ----
  40 files changed, 135 insertions(+), 123 deletions(-)

