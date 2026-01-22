Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED88D3EE66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 14:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lnv/c+j/dDiQDA/eMqxqzoMEwWCZc5OQuRRv6Q4OcAA=; b=ZaHFBLm0H4mHvd
	ZQ5I3n9v1AMFhClMis4ow53VKwYYz7W/vuv4vbUeKglVXaoR2h6zVBu+KSzf5pm1u4lePhPQUSfWY
	oXeOHgjhNpBY4j/05gA6IMXiujGo+BYiv9myZvcz0FJ28dRoNS7h4M1pfDW/FVckYBV2KoHbGU2IM
	Ji3ur7cPAkcU4vo2Kdq9lWaDkYT3Z2A0SkLNcWI7wuC08jg7J4HLobMjF/6qHxwQ1a3VqTbljkSDB
	5epqdRI4CZG1Q60ZlgyTa2S3SwS2PNQZ/r+FQGJGj5duZ5zFZ1/XhtaPwILaP/kJ9VrlILdK7zXKO
	rLDuK9K0xeEr3STk9ONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viw6A-00000007Grv-0XQl;
	Thu, 22 Jan 2026 14:55:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viw65-00000007Gqk-3ynn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 14:55:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so14574515e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769093742; x=1769698542; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lnv/c+j/dDiQDA/eMqxqzoMEwWCZc5OQuRRv6Q4OcAA=;
        b=IawpaqtPMTqH2N3/kaVof7UMNJe7iIZM7cLuXbBqIPrDN8zhRzPX+R3zdxZj8Dwdmp
         07nT0J+7LO8uaA9cUbxlkEhWZHnTtI3qWM36aPgsnRVh6PQm1cQVb3StjuY6D9PicSn2
         yrFgxh2idk/F1AWayn+NyhRRsq44qyuwbDsImvnBBcsJUIe0VmDj3RkOjxBqvTIuWd16
         Jj+n2QGbzMO8bPDmAup2fwn68XBxgbMERu9uDuU0+3jf96IB8TEUpLyIbZSPg+sCQSO4
         nYMbAHC4rjYoXJ1kanVyR0zi8VM8A2zGasndl9q0/yNgTusPqUO55gkvoGvbPZxTtRky
         bAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093742; x=1769698542;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lnv/c+j/dDiQDA/eMqxqzoMEwWCZc5OQuRRv6Q4OcAA=;
        b=At2XdzPJ/EJ+AnvlEL2PvfNiZLxCAMTWOwLeTZb3onJva9FiGdW/7mD99CIcrwUaFl
         FhEmxk9xXChN1tAPJFIR5LvpgMfn4r/vBOVWAwWXPVyx73N69t521TenwtfkGrVAI+vK
         k+1Qm1DPP0ljjvZy221IYm5PoYuUpl8k1C4aY72olx/RMuunkHrF+vp1KPpPR7Ovu05+
         H+uxrqe1yzEYRDbJHD1CS+Wefh8xRMRvSTo4gcHcEqFRAEPxMSdtDmTkEX2Ni1A5LpCK
         TQvFWPL/V2D/r6DaE0dM2yEWZzbEbhuJ7mhO+wNz6ziARp8cD9ZTdpQxfmF/aCSFxqZI
         11zw==
X-Forwarded-Encrypted: i=1; AJvYcCX8xPdbPnH2E7UFPB8iCLL7YwuyfCySuohbCPsW7OhyPO7nOR36UKa3SKjUgXw1W5P/hU+lYc0hlKRVF15PMJR0@lists.infradead.org
X-Gm-Message-State: AOJu0YyfIwcSOPiv6mdJBl+u6D/5J3tVdeQ88tUPjWinLGUMJMtzNKef
	vx06A+bpfkRjjnWFIKJARG4tPqd8+JyIcLQi830la9ks7UVReM4HyymtPyp2KLkeuQo5Gp7PRJp
	LhanBXsizLw==
X-Gm-Gg: AZuq6aKkwiT3lWG06oX0gUTy5C84ZiV+faC/k/V3JBZEdAOeQ9c/BCVucPCYEWbCGGT
	bDpSCQLCxEZ6MMhPc7eJ5UxXh+UZOyxmmOaMkXhFsa2VzAO0PVcWzQMwQeRpmCPnFjr0MeFwvmt
	XutIOoSSdzvn8NHqBoJi1R7oi8NU2lB/eUWFiiCxCyoPcbaSbBFDqwE227wSvk05iVBKgE1p2ET
	etfleTDmBas252nAHVeUc1VNbGNieNml4UQLpO+FJOYxs8ImW60llAXyzqX57slxB454nOg4rAP
	6jkXgvxOwjWfUDJnQ02q1BODamsFfCnT9BTMx5Uocjwtu4qv/4vh9peURKHXYELLX2sJ8fAZWmp
	A9Ik+gehEUJgPWRjy06r6/O+UolODYTnJiDNhpDetGCr+zzqfOz5ISzM+yOqBHwzwvK1PhpIjHd
	eyDqOycmHO1Snq3PaXD1/AVFLhv+jRuEWkNWVP6yrsNyxHfA6ikWCSIP/S5EQBe54=
X-Received: by 2002:a05:600c:4f8a:b0:480:3c28:838 with SMTP id 5b1f17b1804b1-4803e78ffbemr143482445e9.8.1769093741349;
        Thu, 22 Jan 2026 06:55:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9dc7:6955:8850:f258? ([2a01:e0a:3d9:2080:9dc7:6955:8850:f258])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804703b90bsm86876285e9.6.2026.01.22.06.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 06:55:41 -0800 (PST)
Message-ID: <68dae86d-5c72-4f22-bfb1-1834c47ff0e6@linaro.org>
Date: Thu, 22 Jan 2026 15:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.20
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
X-CRM114-CacheID: sfid-20260122_065546_061011_DC8BED81 
X-CRM114-Status: GOOD (  12.20  )
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

Here's the Amlogic ARM64 DT changes for v6.20, fixing proper clock
assignment for MMC accros different SoC families, removing useless nodes
and various cleanups. Finally adds support for the Khadas VIM1S board and
enables NPU and the Type-C controller on the Radxa Zero 2.

Thanks,
Neil

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.20

for you to fetch changes up to 854583f9992671411bad28bd8a3867afba7cce77:

   arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable SDIO interface (2026-01-21 17:44:08 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT for v6.20:
- Cleanups:
   - Use lowercase hex
   - Use hyphen in node names
   - move CPU OPP table and clock assignment to SoC.dtsi
   - drop useless assigned-clock-parents
- MMC clock fixup across multiple families
- Add type-c controller on Radxa Zero 2 and enable NPU
- New board:
   - Khadas VIM1s based on Amlogic S4

----------------------------------------------------------------
Eric Neulight (1):
       arm64: dts: amlogic: meson-sm1-odroid: Eliminate Odroid HC4 power glitches during boot.

Jerome Brunet (9):
       arm64: dts: amlogic: drop useless assigned-clock-parents
       arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
       arm64: dts: amlogic: s4: fix mmc clock assignment
       arm64: dts: amlogic: c3: assign the MMC signal clocks
       arm64: dts: amlogic: a1: align the mmc clock setup
       arm64: dts: amlogic: axg: assign the MMC signal clocks
       arm64: dts: amlogic: gx: assign the MMC signal clocks
       arm64: dts: amlogic: g12: assign the MMC B and C signal clocks
       arm64: dts: amlogic: g12: assign the MMC A signal clock

Krzysztof Kozlowski (2):
       arm64: dts: amlogic: Use hyphen in node names
       arm64: dts: amlogic: Use lowercase hex

Martin Blumenstingl (1):
       arm64: dts: amlogic: move CPU OPP table and clock assignment to SoC.dtsi

Nick Xie (5):
       dt-bindings: arm: amlogic: introduce specific compatibles for S4 family
       arm64: dts: meson-s4-aq222: update compatible string with s805x2
       arm64: dts: meson-s4-s905y4-khadas-vim1s: add initial device tree
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable eMMC storage
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable SDIO interface

Ricardo Pardini (2):
       arm64: dts: amlogic: Enable the npu node on Radxa Zero 2
       arm64: dts: amlogic: add the type-c controller on Radxa Zero 2

  Documentation/devicetree/bindings/arm/amlogic.yaml |   8 +
  arch/arm64/boot/dts/amlogic/Makefile               |   1 +
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |  13 +-
  .../boot/dts/amlogic/amlogic-t7-a311d2-an400.dts   |   2 +-
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   5 +-
  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |   1 -
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   6 +
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   9 +
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |   9 -
  .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |   9 -
  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |   9 -
  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |   9 -
  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |   9 -
  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        |   8 +
  .../dts/amlogic/meson-g12b-a311d-libretech-cc.dts  |  13 --
  arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  |  24 ++
  .../dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts  |   1 -
  .../meson-g12b-bananapi-cm4-mnt-reform2.dts        |   1 -
  .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |  12 -
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |  13 --
  .../boot/dts/amlogic/meson-g12b-dreambox.dtsi      |   1 -
  .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |   1 -
  .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |   1 -
  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |   1 -
  .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  12 -
  .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |  13 --
  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |   1 -
  .../boot/dts/amlogic/meson-g12b-odroid-n2l.dts     |   1 -
  arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi |  12 -
  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |  51 ++--
  arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi  |  24 ++
  .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      |   1 -
  arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |  12 -
  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        |   7 +
  .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |   1 -
  .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |   1 -
  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |   1 -
  .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |   1 -
  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts    |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts    |   1 -
  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |   1 -
  .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts      |   1 -
  .../boot/dts/amlogic/meson-gxbb-wetek-play2.dts    |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   9 +
  .../dts/amlogic/meson-gxl-s805x-libretech-ac.dts   |   1 -
  .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |   1 -
  .../dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts |   1 -
  .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |   1 -
  .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts    |   1 -
  .../dts/amlogic/meson-gxl-s905x-libretech-cc.dts   |   1 -
  .../boot/dts/amlogic/meson-gxl-s905x-p212.dts      |   1 -
  .../boot/dts/amlogic/meson-gxl-s905x-vero4k.dts    |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   9 +
  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |   1 -
  .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |   2 +-
  .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |   1 -
  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |   1 -
  .../dts/amlogic/meson-libretech-cottonwood.dtsi    |   1 -
  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     |   2 +-
  .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts   | 259 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  13 +-
  .../boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts |   1 -
  .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts      |   1 -
  arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   |   8 -
  .../boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts |   1 -
  .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     |   1 -
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |   8 -
  arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts  |   1 -
  .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   8 -
  .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |   2 +
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |  12 +-
  .../dts/amlogic/meson-sm1-s905d3-libretech-cc.dts  |   9 -
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |   9 -
  .../boot/dts/amlogic/meson-sm1-x96-air-gbit.dts    |   1 -
  arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts  |   1 -
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |   8 +
  79 files changed, 442 insertions(+), 247 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts

