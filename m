Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3978C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 11:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XbgIPmxFtVM1BGwhXr/tVxdvgWwhEB3gww1YRaGjATo=; b=qlpElgHrZyLTYD
	IFf84LvkoLfhAPupcKzVgG51QB/6zScSnIYpvW/zKbX7okMpR940pDwCuBkwgmwFdjMW98evnuwq0
	Z8YK34WTiJCzKyGjq21Iya+V7us5NVMu9qImvS9dtvCwcdzr6Vw5rqNypsghWspJFLvuHwTkO4IZM
	TR39LI3JHzN/pWjemdT5GrQn4GOKTiT6xZHVStkQgWg8Tl4mnDrCanyX5tjn6vJTIKl0UqJnYFg6z
	malpkADWBhuhMGDedWbEZBvtXKpFndY0RxLSg5bkbH5OpHRtKutyvbLLcgoOlg7vRh2qiT3aMf5au
	HEDEPJeXl8oCvxVoBBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEntc-0000000CGMU-1YXr;
	Tue, 13 May 2025 11:34:04 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmiZ-0000000C4Lw-3xmV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 10:18:37 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a0b9c371d8so4537731f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 03:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131514; x=1747736314; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XbgIPmxFtVM1BGwhXr/tVxdvgWwhEB3gww1YRaGjATo=;
        b=lJ8/oRZVXAc3DxsK3G1g+n6CO6yGEsUUx01wGwNnEEfPp3CEfIOANSoCOLVvZKWp8P
         e+UejYwkuZ+4Aax+Mn6UCzXeHR/0jupcvWx9LRPyLWAIRqqIwkdglh9epItk5bNq41bW
         CX77tSjl8rKpFF+/Vn1yZu8eZdqotjFWom9Dp8ZNUZUKrVVRVDc/Gkn94ZwsipuFBqhg
         D/E32FBf3GHhDAHIxkxWx+1vW5N/JSiEK3jlhiTtIgXmamR+g+gBCUaZ6vRZnzFoLSzW
         7dsoCrs0RSHHpXfq4FzRECSgwg86x2dV/WkoqYP9NZOVfR1ccahviUS6EKDaPUpjqOZ2
         25Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131514; x=1747736314;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XbgIPmxFtVM1BGwhXr/tVxdvgWwhEB3gww1YRaGjATo=;
        b=tHWuPorgsIjnVBHIOB19/A+WIwmivNMm3p45KWsiMzLl1WexzMMIBjt2CimHNcjEJC
         V6wGZ7teERspY75TpA5PjidhMUFkQZfBhoVhhCFmVEHog3bjSfYskSHU8COTMuB6zV51
         B3wtylNSSBnHJNIrHVU9QXnU8htkT3wk/E2ZiXs4QYXcLhBclXnTt6ZjUefXXfBRDr3M
         TyKm3BWKDTgqSMAhAEjAVvQ2485S619ms2wWf8B+9Tr6QNJLWIqgznU+IKh/PsQpEMJs
         dDn9ZlACTAapSRXTHhfkL23IsNjS1vA95OGAdvZI+iFRkTEV9WyBTJYJjf7qUhNj03/v
         IIUg==
X-Forwarded-Encrypted: i=1; AJvYcCUCxOvYAPbWv6h8sBRAboCfCrdWyPaDnLeHD9OUYyPPbTOPqwnjKqEAuATv7uihAWlOd4t8CXOltw+DsinzSjul@lists.infradead.org
X-Gm-Message-State: AOJu0YwmBK8TCfi4ZP11yru7ghEJn+khWYwZsqqUjj3SQg4pfbvsoJQy
	X+LNnO8rB/1R6i0iEh7nQvCy8uYcqAF/pOp3LGBi6cv+Ens3Hq77/loSgUFbMeRkMLA7ftfBzQl
	mLuQ=
X-Gm-Gg: ASbGncvKsYpo0Bt+voGL5sBPhu78LzWr/exxobw4OVgDyW1Oo+idI4C5ry5zMesOn5r
	r7uungyDeboihZybdAys/9vF4m9T7slGBUAKvcKLgh3Qu5pagsgcmRiDbn34C7D/Dm5CVxVSipC
	bLAJT9mA2zY0U4WVA5kq1PYbQNyhly/aZGdKu1s0mxv75IurG3qX0prft1BPOS6BXZ8GI+DWNNm
	HVJvIyX6kunKw9yj+IfZm8JbDHwM8PTCcn5aVuu0Q3JQNvF80LBkC2XuQqawyC0h71AEtMNiE0T
	Z34TbOUlCpJk/+JvcPKCaZFzJqZ/JJOr2d5inEy4iEJJ0faxnPQvoQoHn3g2g9ZwFppz5BFSyVm
	kMZqcrmltj5UkYTwG2301Q3k=
X-Google-Smtp-Source: AGHT+IELqlGYEyz0bgUWVEOHjILw2+jZZTXNzra6IJ+FQuqp14XzoRo/D2dnZ8V6LTyFM6eKT8E8lQ==
X-Received: by 2002:a05:6000:2509:b0:3a2:133:b1b2 with SMTP id ffacd0b85a97d-3a20133b622mr9093752f8f.31.1747131514243;
        Tue, 13 May 2025 03:18:34 -0700 (PDT)
Received: from [10.61.1.139] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde0esm15899431f8f.18.2025.05.13.03.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:18:33 -0700 (PDT)
Message-ID: <5f7d3fa4-2d9d-450b-b384-abdd903284dc@linaro.org>
Date: Tue, 13 May 2025 12:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.16
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
X-CRM114-CacheID: sfid-20250513_031835_995886_DDB49837 
X-CRM114-Status: GOOD (  14.14  )
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

Here's a quite large changeset for ARM64 based Amlogic SoC introducing pinctrl
for the A4 SoCs with new bindings, UART RX/TX default pull-up to avoid issues
with debug uart connectors, same for I2C on GXL based boards, finally SARADC
support for the S905L board, clock measure support for the S4 & C3 SoCs and
Reset support for A4 & A5 SoCs.
The new Amlogic S6, S7 & S7D SoCs initial support are introduced with the
corresponding Reference Boards.
Finally the S805Y Mi TV stick, known as xiami-aquaman, support is added.

Thanks,
Neil

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.16

for you to fetch changes up to f0911f29478992f37e91c208fe44c2ea5b378b61:

   arm64: dts: amlogic: Add A5 Reset Controller (2025-05-05 14:37:43 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v6.16:
- Amlogic A4 Pinctrl support
- UART RX/TX pull-up pinconf properties for all SoCs
- SARADC support for the S905L SoC variant
- Drop clock-latency in CPU node
- Amlogic clk measure support for S4 & C3 Socs
- Amlogic S6/S7/S7D initial support
- I2C default pull-up bias pinconf property on Amlogic GXL based boards
- Amlogic A4 & A5 Reset Controller support
- New Boards:
   - Amlogic S6 BL209 Reference Board
   - Amlogic S7 BP201 Reference Board
   - Amlogic S7D BM202 Reference Board
   - Amlogic S805Y xiaomi-aquaman/Mi TV Stick

----------------------------------------------------------------
Christian Hewitt (1):
       arm64: dts: amlogic: gxlx-s905l-p271: add saradc compatible

Chuan Liu (2):
       arm64: dts: amlogic: C3: Add clk-measure controller node
       arm64: dts: amlogic: S4: Add clk-measure controller node

Da Xue (1):
       arm64: dts: amlogic: gxl: set i2c bias to pull-up

Ferass El Hafidi (2):
       dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
       arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick

Martin Blumenstingl (5):
       arm64: dts: amlogic: gxbb: enable UART RX and TX pull up by default
       arm64: dts: amlogic: gxl: enable UART RX and TX pull up by default
       arm64: dts: amlogic: g12: enable UART RX and TX pull up by default
       arm64: dts: amlogic: axg: enable UART RX and TX pull up by default
       arm64: dts: amlogic: a1: enable UART RX and TX pull up by default

Rob Herring (Arm) (1):
       arm64: dts: amlogic: Drop redundant CPU "clock-latency"

Xianwei Zhao (7):
       arm64: dts: amlogic: a4: add pinctrl node
       dt-bindings: arm: amlogic: add S6 support
       dt-bindings: arm: amlogic: add S7 support
       dt-bindings: arm: amlogic: add S7D support
       arm64: dts: add support for S6 based Amlogic BL209
       arm64: dts: add support for S7 based Amlogic BP201
       arm64: dts: add support for S7D based Amlogic BM202

Zelong Dong (2):
       arm64: dts: amlogic: Add A4 Reset Controller
       arm64: dts: amlogic: Add A5 Reset Controller

  Documentation/devicetree/bindings/arm/amlogic.yaml |  25 ++
  arch/arm64/boot/dts/amlogic/Makefile               |   4 +
  arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h     |  93 ++++++++
  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 133 +++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h     |  95 ++++++++
  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |   8 +
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |   5 +
  .../boot/dts/amlogic/amlogic-s6-s905x5-bl209.dts   |  42 ++++
  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |  97 ++++++++
  .../boot/dts/amlogic/amlogic-s7-s805x3-bp201.dts   |  41 ++++
  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |  99 ++++++++
  .../boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dts |  41 ++++
  arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |  99 ++++++++
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   1 +
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  12 +-
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  10 +-
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |   4 -
  .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |   4 -
  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |   4 -
  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |   4 -
  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |   4 -
  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        |   1 +
  .../dts/amlogic/meson-g12b-a311d-libretech-cc.dts  |   6 -
  arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  |   2 +
  .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |   6 -
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |   6 -
  .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |   6 -
  .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |   6 -
  arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi |   6 -
  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |   6 -
  arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi  |   2 +
  arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |   6 -
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  10 +-
  .../dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts | 262 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi   |  10 +
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  22 +-
  .../boot/dts/amlogic/meson-gxlx-s905l-p271.dts     |   4 +
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   5 +
  arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   |   4 -
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |   4 -
  .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   4 -
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |   4 -
  .../dts/amlogic/meson-sm1-s905d3-libretech-cc.dts  |   4 -
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |   4 -
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |   1 +
  45 files changed, 1097 insertions(+), 119 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi

