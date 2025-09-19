Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD4FCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sj//8F4fTHzOhzOgZFY9djcOmaWCzdNmUbED0aVzyoU=; b=gSevRAEYvseF0a
	b/5N0QFUzDxm9QIQwknzlKIch81tERolsTaTwVV+KWKo3jnwgVXH4fJro509sR0RvH5sUdwYpWiQJ
	HHB8i5dcfQsR1to+NlNDg+R/k144l0k0mjZHqoiEgwFaQe88WWpRfMu+mbwYoPvN2lHqZ7FTa+aiw
	ZDH+V8O96XTz+led7CuOTMMsjtuG15oy1SHKzs9KbhqkcztJEnljklo+DH5aVa41M7EKn00/tbyQx
	XvI6k2/rzvHr+YgdNbTHS2vVno7n9NFPCVQT8B6TQE7QmIIPdhYlmGO9rlrwzykvHL5SdC9FXAL3U
	30FVS03/4ec2g3TXU9qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVor-000000027YH-1aeS;
	Fri, 19 Sep 2025 07:46:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVop-000000027Xt-0xWq
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Sep 2025 07:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Reply-To:Subject:From:MIME-Version:Date:Message-ID:Sender:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Sj//8F4fTHzOhzOgZFY9djcOmaWCzdNmUbED0aVzyoU=; b=It/FwiUdqJbv/2gTGRtOTcZDED
	V1bCseNVv/S8AMkI+OpQVPtTjL2KVAVU+qYH6FhrGLLhxEPAOmZ8czAdYkdLv0/gr1w9osIJvkW77
	V9gfbLEqASvHIdZJnNvRhtLQ7OEBpw1GJpGQYbMH91xqDSUpBGAspVPJGHy4uIIa0ZfX1sRzYEHNQ
	WjY93DNjDX6vSM6ci9QxepuSHHXM1zswQAVQMDXPD+8kKrmIjOmm9uh9JYjJM8JB8QN4BA4ZCOAj3
	tDVjR/lUf97EobyXRTr0VbNZC57N3+7Gmnk3leyurP0qT0zBnFgoSpEcpX/D3/v9IqATloIV1gD7S
	GetFFTyA==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVol-00000007mAS-3Dzy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:46:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3f1153f4254so40269f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 00:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758267965; x=1758872765; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sj//8F4fTHzOhzOgZFY9djcOmaWCzdNmUbED0aVzyoU=;
        b=xhEIQMCmrIcNZkE2yNTrlgdk/Z43CHtyopzogS3VAxk3sxI2kx45Mm6A2D3OSX7i6i
         2+P34S9QUD2vhuqnR9NeBulObsvXszyrXJDGxv9aB95lNHAJy9247QIseWhNajyiUzhW
         BG54bXApYLaEhCf+L5ywhjZ8dA55O0WTQyNcJXbjWCQmYv+LSHfV5CW2IpSqNymfb70+
         LqNx7V/hYAPPZ0Yz0e1FRuRG+ZnrkAWQMi7a2C67bCBf6w7hxg1zd0GoOnoNCnsb5sto
         luijO771Y7lipEO5/+Mf0t3+wO0DhQ5ZBZc8mqjZUWur8GmboGB7DXgnPyFiNloyUam9
         g0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267965; x=1758872765;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj//8F4fTHzOhzOgZFY9djcOmaWCzdNmUbED0aVzyoU=;
        b=T4lL1pZ15c0qW+h0M1WlRR3ap2leuz91dTbdCOAHjUesYGG9Xlw5Kvc3oAX6VRqlsv
         aTVixJ8QcbbZEw1TBjyoUO11yKdy7cPwcm+15Ft0tiCQ0OJiisDcP0FyKbkHVXpwvu+a
         DKYplffeRdAffM74GIkaMUk68bDzucNeeOTnHS5CxaLq8l9EJ0eq4msS6cXYQDJQ/bDg
         sQlLbw0W8rReipnMd6AnoKZUJEJerlhZos07cEHZChJjmo4KDSzmd492p6TTXQGqplMw
         BXDxZ8z1cj5W02fJiEYos7ZVzPPSmW4ELSMXQ/1kLSOb9I3HdZWB4b73XBf02zlBaPzT
         8tgw==
X-Forwarded-Encrypted: i=1; AJvYcCVK0PrVsWwOwMCaf9jTFTqPUSc4qM1wpCdatpcuDkVIXq78VQxyBHyoYR/Ms+c47+Cdh2+DR0SXjCYkSMXEfTkT@lists.infradead.org
X-Gm-Message-State: AOJu0YxUEmLWdzfKnj5TitkrAmgUVWAxFYKIBGZZEnh1l2uoQAxXNW0O
	GR1GmzBIkVu+M5mTDZqMpa2UUdEzjfPibhCZ+T9SbcI0zbF+agjd3meeXgyjAOtNfhE=
X-Gm-Gg: ASbGncvg+pBAYleYNG6s+gzvllnrkZp0hHf335kppC02boCJFanfLpBvuE3wzROcbKN
	eGDPouyGDD/HtrPDo2ABvuQyDu+/kHSsGuf04psJd/C+QG6Il0+8oyohVTkIgAD9lQ8fW4GfVpu
	M8/KDVZ0nzkwgPC4qQbbxOUp5tFWERpIe7WuZMH5ogvng2vzqsPen85X1y+jBmBc8WHx6VxepG9
	gywiP7fJB4gpJXXMf1LXI//7nW5tNCdvvKigC2sx+4Ib0OGhgJvwrYkW+qCaW7Ev0l6nXki4ug7
	qMgwESJIQHc02Tx9yWxgTBIWT9LrW9C/ZAGrqG3IxLdIdIbEDNK3k2PL7ByCrpo3a0tq/RafGtS
	6cxlNO3KwULeWHZlAp3I55pSH86cAdMrg3D1LLNmcplftE3T7L4uIZZTFjU5fPU+iAt7nTx6t
X-Google-Smtp-Source: AGHT+IF1xyuhwXqnZwy0ko9KlFPIehOGJYLXMgJOucjyGCzOVvKO3TFQuawkjLcp2ZJOEerqdy3ZqA==
X-Received: by 2002:a05:6000:2dc5:b0:3ec:df85:351e with SMTP id ffacd0b85a97d-3ee7c55272dmr1797890f8f.11.1758267965437;
        Fri, 19 Sep 2025 00:46:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f? ([2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0740841dsm6625247f8f.23.2025.09.19.00.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 00:46:05 -0700 (PDT)
Message-ID: <d40e7e96-4a7c-4e4f-b36f-750c6525b95c@linaro.org>
Date: Fri, 19 Sep 2025 09:46:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.18
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
X-CRM114-CacheID: sfid-20250919_084608_126636_DD580F66 
X-CRM114-Status: GOOD (  10.33  )
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

Here's the Amlogic ARM64 DT changes for v6.18, mainly adding cache properties to all
ARM cores in Amlogic SoCs, enabling RTC on C3, fixing RTC node layout on C3 and fixing
long-running issues with SDCard on BananaPi S905x3 boards and the Odroid-C2.

Thanks,
Neil

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.18

for you to fetch changes up to 663bfe77b6f70bcb33b2607e16c94fcb1029580e:

   arm64: dts: amlogic: gxbb-odroidc2: remove UHS capability for SD card (2025-09-10 09:32:09 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v6.18:
- Add cache information to the Amlogic SoCs
- Add RTC node for Amlogic C3 SoC
- Fix PWM node for Amlogic C3 SoC
- Remove UHS capability for Odroid-C2 SDCard

----------------------------------------------------------------
Anand Moon (11):
       arm64: dts: amlogic: Add cache information to the Amlogic GXBB and GXL SoC
       arm64: dts: amlogic: Add cache information to the Amlogic SM1 SoC
       arm64: dts: amlogic: Add cache information to the Amlogic G12A SoCS
       arm64: dts: amlogic: Add cache information to the Amlogic AXG SoCS
       arm64: dts: amlogic: Add cache information to the Amlogic GXM SoCS
       arm64: dts: amlogic: Add cache information to the Amlogic A1 SoC
       arm64: dts: amlogic: Add cache information to the Amlogic A4 SoC
       arm64: dts: amlogic: Add cache information to the Amlogic C3 SoC
       arm64: dts: amlogic: Add cache information to the Amlogic S7 SoC
       arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC
       arm64: dts: amlogic: Add cache information to the Amlogic T7 SoC

Christian Hewitt (1):
       arm64: dts: amlogic: sm1-bananapi: lower SD card speed for stability

Valerio Setti (1):
       arm64: dts: amlogic: gxbb-odroidc2: remove UHS capability for SD card

Xianwei Zhao (2):
       arm64: dts: amlogic: C3: Add RTC controller node
       dts: arm: amlogic: fix pwm node for c3

  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 37 +++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 41 +++++++++++-
  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 36 +++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 74 ++++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          | 15 +++++
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         | 21 ++++++
  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        | 27 ++++++++
  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        | 62 ++++++++++++++++--
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          | 27 ++++++++
  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  4 --
  arch/arm64/boot/dts/amlogic/meson-gxm.dtsi         | 24 +++++++
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |  5 +-
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         | 27 ++++++++
  13 files changed, 385 insertions(+), 15 deletions(-)

