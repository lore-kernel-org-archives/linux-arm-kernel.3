Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2375CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kVStZuaynsxldxI4z6f6e5rL63M/lihgHYjp99abbpQ=; b=drjE1bpa/7TGQL
	wPBDRLI4c/90ziwK/2RqLZcng+05Ef0cZiRQPImg63L+Ywvf+Fbi7rJ+kmise+chwRQR+n6cygnhn
	TasngYyABTRs4ahm1QAykF394zQjqla/xj6qoD2KCfhx7m2CgDnDoxIHCv0msprWrxoAzQbsqMlLC
	EN/HZUaKB/H+53sExwFhSU0sB5adfNpYxqE4E7ORRcoMzT99h2og1WpZrVCsTGGbA+WeePOMLK9VL
	mqzjkqe59df9xHiCUm8VX4yw3kr8ccRS70NT3bb8MVPyGHt8wHNfqbRhE+KZuhMGXlf4930PtzwjZ
	PQlYrkaPqFMaEh3Hb//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3JM-00000007qd9-2nK4;
	Thu, 21 May 2026 13:19:40 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3JJ-00000007qbw-2zkp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:19:39 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so4896653f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 06:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779369576; x=1779974376; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kVStZuaynsxldxI4z6f6e5rL63M/lihgHYjp99abbpQ=;
        b=uSAWHVyuGMKh+TwJu98tXuhiSRgIJUV2ItVUWoUV12nfTiet9UDgxWcC8PsaoAbZ91
         Tf4/qFzjcn7eR415knUz2mhBafY/OFARr+chEvjh1qDwfa+nzvGtu5G1BHmGvbfK9Ue1
         BpBqsciLc61vcbQ374UWG8iGI+oHlTO+1kEGgVbRn0LlLQuL1/yJwVekuCaPV6j4FydQ
         NTaD3K1ZjLdJWX/JOrI/6QLmfcv2rdjqblYd2SPL2Vzr10b20CAJdJ+91rLZUhQhZ2YF
         hmGOgP5fVTF8B5P1WYbq7b23FFbhD45SgzQ9rpiqbGPHDVBsVj79i4hRThb2MWS/tXA8
         INuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369576; x=1779974376;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVStZuaynsxldxI4z6f6e5rL63M/lihgHYjp99abbpQ=;
        b=C6E7OangCSwgpQhBr3mdkQMER+1t1o2I1b3ryGJXQtn0DbGREwA7QstspGqfJvJxrV
         KSk7TTR++nPIF2EIIInQIzypPIoh+Mz7ioN/fCyl+pPAJkXWCWRoQHvxu/Dl1XmEOmNc
         fdo3BiHUlnmTgoFogrpKAV0hKnyzhhU52MLuGLWFUL3GrUg0OOdvk7t1Uq3Kj6CCMRLU
         D+TzvV5ojVszVKXLuy0Q8bpgB2yMsT0BLjHdNmewWn/DZh/uSEEUY8Of2YGpRx0K1koJ
         JVadYMAAX17NqT/9xt8QUw1DPOwEZ42GpVPHr/Uq7cL9i33PK6tobx2LpK4D6a7z5l86
         N4yQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NBEZWHE7FIVQx1yXTVbg0AvUzam1pw9b6IoM+7IGKp6tpji9HxAHvyFDrglSwpmMsM8HAlIfA6cv6OTMD2O1B@lists.infradead.org
X-Gm-Message-State: AOJu0YzCNSVXt/2Vz21Tk4N8AmXxmPfk1Qs312EmI1CjxThvUAdWjfdc
	9iDxcKmjDaUsfRKPe8v0AqZglX0aPZC7bBGpJwkHtALqE/hIG1L7Tu+dTNh1nfK505k=
X-Gm-Gg: Acq92OFEopQOY0zR88oA/GnZfpD8S1LWGOm33RT48kpNOxysdKgRdGffUI7iVQ93Ug6
	wnszH+/3X0OdTh9QI+MRTzRVTuGbWK7o2xZ6aqYuieO4EeIPNK7hg6rPJ634prC86sQqkdBR1Op
	v7jXKpDcDNuLCCaFEkSDmrGgoJKPE6NHkMHXUQ9+PJPgtoNwtoIjX2P7UK0UVmsPGB3LbNvvYLw
	TRf6YKiZyXp93YzXylZPsNUP2lIYe/FLAkQUWI5LYiG2v4/uX9nKGrSF+0l7ck7pGTzJByyhW2W
	nM8VltQF2nQQhRfnsoLnQxv8sS11g1qfxu6H6uo9HbHYh7nRVe6gBCswm8ISRXmiEFTQfeXovUq
	ZQ+OapTXbpLpuN+ukUdDqY9+ggddDMqyIzLjiUxicEFg6tkgJk1iij7JzltwiFZ0WbKn47lXMhR
	ScFLdCryQgll8QJYXyy1HPBUvsCrMOJjMBXT9/PGRW8lEH/Ed64o6vhbDBHnZz3lY599TM9g6Pd
	JcQ5bk=
X-Received: by 2002:a05:600c:46d1:b0:490:3d3d:805a with SMTP id 5b1f17b1804b1-4903d3d823bmr15928265e9.12.1779369575712;
        Thu, 21 May 2026 06:19:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:7e6c:bb76:ade5:7e8b? ([2a01:e0a:106d:1080:7e6c:bb76:ade5:7e8b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa92f622sm3169586f8f.24.2026.05.21.06.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 06:19:34 -0700 (PDT)
Message-ID: <16fc7412-c470-4f3f-b6c8-55c35698a424@linaro.org>
Date: Thu, 21 May 2026 15:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v7.2 take 1
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_061937_783967_D104AA1F 
X-CRM114-Status: UNSURE (   8.11  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

Here's the Amlogic ARM64 DT changes for v7.2, contains improvements for the Khadas VIM4
and VIM1s SBCs, plus some additions for the Phicomm N1 and a couple of low priority fixes.

This PR is largely the same as `amlogic-arm64-dt-for-v7.1`, but I sent the fixes
separately as `amlogic-fixes-v7.1-rc` as discussed with Arnd, so this tag
`amlogic-arm64-dt-for-v7.2-v1` is based on top of `amlogic-fixes-v7.1-rc`.

Thanks,
Neil

The following changes since commit 174a0ef3b33434f475c87e66f37980e39b73805a:

   arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-21 15:46:29 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git amlogic-arm64-dt-for-v7.2-v1

for you to fetch changes up to 43e6ece01ba673c3bd8dd1638bcd93827d254b3d:

   arm64: dts: amlogic: t7: Add i2c pinctrl node (2026-05-18 16:23:29 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v7.2 take 1:
- Khadas VIM4 (T7 SoC) features:
  - Memory layout fixup
  - GIC register range
  - Model name fixup
  - PWM, eMMC, SD card and SDIO support
  - PWM LED
  - I2C pinctrl node
- Khadas VIM1s Features
  - Bluetooth
  - PWM LED
  - Power Key
  - Function Key via SARADC
  - RTC
  - Remote control keymap
- Bluetooth node for Phicomm N1

----------------------------------------------------------------
Jian Hu (1):
       arm64: dts: amlogic: t7: Add clock controller nodes

Jun Yan (1):
       arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add bluetooth node

Nick Xie (9):
       arm64: dts: amlogic: meson-s4: add UART_A node
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable bluetooth
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add PWM LED support
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add POWER key support
       arm64: dts: amlogic: meson-s4: add internal SARADC controller
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add Function key support
       arm64: dts: amlogic: meson-s4: add VRTC node
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable HYM8563 RTC
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: use rc-khadas keymap

Ronald Claveau (12):
       arm64: dts: amlogic: t7: Add eMMC, SD card and SDIO pinctrl nodes
       arm64: dts: amlogic: t7: Add PWM pinctrl nodes
       arm64: dts: amlogic: t7: khadas-vim4: Add power regulators
       arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
       arm64: dts: amlogic: t7: Add MMC controller nodes
       arm64: dts: amlogic: t7: Add PWM controller nodes
       arm64: dts: amlogic: t7: khadas-vim4: Add SDIO power sequence and WiFi clock
       arm64: dts: amlogic: t7: khadas-vim4: Add MMC nodes
       arm64: dts: amlogic: t7: Fix missing required reset property
       arm64: dts: amlogic: t7: khadas-vim4: reorder root node
       arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven status LED
       arm64: dts: amlogic: t7: Add i2c pinctrl node

  .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 215 +++++++++
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 482 +++++++++++++++++++++
  .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts     |  15 +
  .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts   |  81 ++++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  45 ++
  5 files changed, 838 insertions(+)

