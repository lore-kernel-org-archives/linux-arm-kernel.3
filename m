Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58150C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AD8fo2TbioxdBHBzGiMAUFOtmTrHt8a2YC2VBdFc3ss=; b=1WMTk5gng9GjZs
	lyzp1qAS3zgLEoLoZNXb/OhZactp/p6wo5fgiC03CJfNvM59B0VRuSX6GhAKNrsGeStNKye3OXNbb
	xo8XAwHqazzXYgYK+4jK37zCZ3bZzwmvkbmUYjoGZQxtSkIhkmyoyOiT4cVKulxxqsmQxzPF4iYPm
	qraKG+vxW1mq9C2pn020tAbooyuZk6tPHnCrvggas6DeMO9jLnDqYbYM8ejTwxVEM0OqPyzrp18H+
	lQ/JQ6gOCTQ1UPwfjAshTirwnvDrHovmav47JuOcfNU0AqC5bwH8RxPMtmS4MajQKUf1dffdOTmN9
	9DmVf2FUMQPzQdaMxxAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRtD-00000004UgX-0zjy;
	Fri, 09 May 2025 17:52:03 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPux-0000000492g-47x8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:45:45 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso10594865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 08:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746805542; x=1747410342; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AD8fo2TbioxdBHBzGiMAUFOtmTrHt8a2YC2VBdFc3ss=;
        b=Qy01MC0X3Mc9Jl2IQ9jsOaNPAJKSunpPXlB3Q4CifInfBGq+/qXp4C7SDXNxWy278/
         YRC9MkyOQg/qaHlP3+BocSVvOuARvSdGkVYXwvwsuLG6HZGwIDZ4KYggl6TXwbM9QZlZ
         4wu2ABmIy0UDAyBYouNm5cksDEQ/A6vBRBGpUZNHXVN+Wm6p1dq+WcR3s+o71TOfDM6/
         d1r/v2b/D08bxVk4tNTwc2ehow7scLUConjpA5Ig/EHewXiwJinlvFHXK4kKkFo1c26F
         xeAdVkdWjeNRHv8DUNPIwcuZExwCIHAg0UI0uOlG5Fk6Dg5RpnGQK14R7f5fmXFwOuuQ
         /xMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805542; x=1747410342;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AD8fo2TbioxdBHBzGiMAUFOtmTrHt8a2YC2VBdFc3ss=;
        b=dNz/4aBAmC7CNUzLuhTHKQhSal7BWwODfEjql/b+scQSPty4xrHhqrgRZdFWXD0/qP
         ZkHbGLpVnXZTFmYKexyNJS0bARjPPqdy1UqcnVboAmebc+8EMTfso8k9Y+OOQZihXICj
         aU6xHNCgFlh0BaMmtFLwceYOgP5ngxwhUHvT6sngXm6ONtAnWLnQZY6qaz4fO/2HpaKr
         PnvOsH8zHLF1eeA/SW0vKbLuO2GtmiM3ZjT/ovEBihW1mtmsD0VBAKx4t9Fs9GZ0U94E
         9npb5HA1CLInC87RGb60bIr6FV9Hq/Wi+6JQ0Ta0HHpqBx53HNICiMLrTkA6QTgJWxRC
         4HVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyY20e/4hXOckSZIK381UFhm9jCZFzRPPs6WqnJ0ht+F+XE2l8CuXjiUZuqavM5Kp71N/k0DQH1AixY5thbc25@lists.infradead.org
X-Gm-Message-State: AOJu0YxdkthSp5OJs7J9Qa4CDO+1bfpHfsPR2fCN3+eONztoZjGnQjRG
	5B+gA/x8vxHXEuWRw3mrfj+3Xqo0dCtWFh0czgI735YTFn6Ci93pWS93iVKGjgLvZ0Y/ytlM6el
	u
X-Gm-Gg: ASbGncugfyH2d6xlDFDmLLaJyOJIz6fIcSRUHGjl50wigMMo62d/fKFEJ/Q5u7Fe6hn
	grPRijRclT7ymxCKZn1xCgo7UNTbGNk1Dh13O6SAySVB3OerpBIe48+APV8K8IAS3y5zmruVZyk
	xo6qTOdxz47QJiOXxSKChAx/KrK43Inq5f2MdNN2wgRcZHnjQVvFXMyztsxXLDAxMu0a6hYqq8O
	LvucMRTf0pHlReqwbyXoG547MDmD85yaMgBGEnjxyizcA4ozmkXoA0+BA1zjDSK4tz3TKMdgG7j
	Gk74R3NepYS0OGXr/hIDWp3dbaey7/I9KaxCdCKVA5gOUGt/nbcletEyj48h+w6hwDKRlG2s5yN
	+VKBNIeBDNglVHxw=
X-Google-Smtp-Source: AGHT+IEDu0RmADt0QA6PX+zldOg7l+W1rhlKf41kRBI2/GfQDlr3pxPYPPmtAWW82aWDZ8qrzQJ2fw==
X-Received: by 2002:a05:600c:1d8c:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-442d6d64644mr36882015e9.15.1746805542515;
        Fri, 09 May 2025 08:45:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:22d7:71a:9f62:f7e2? ([2a01:e0a:3d9:2080:22d7:71a:9f62:f7e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df5ecsm33463335e9.9.2025.05.09.08.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:45:42 -0700 (PDT)
Message-ID: <e9c520a1-b986-49e1-b9b1-67511c187716@linaro.org>
Date: Fri, 9 May 2025 17:45:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic fixes for v6.15
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
X-CRM114-CacheID: sfid-20250509_084544_034698_F2455F58 
X-CRM114-Status: UNSURE (   8.26  )
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

Here's a set of DT fixes for the new PWM bindings migration, and missing
audio nodes enabling for the dreambox DTs.

Thanks,
Neil

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git amlogic-fixes-for-v6.15

for you to fetch changes up to 0f67578587bb9e5a8eecfcdf6b8a501b5bd90526:

   arm64: dts: amlogic: dreambox: fix missing clkc_audio node (2025-05-05 14:35:46 +0200)

----------------------------------------------------------------
Amlogic Fixes for v6.15:
- fix reference to unknown/untested PWM clock on ARM/ARM64 boards
- fix missing clkc_audio node on dreambox ARM64 DT

----------------------------------------------------------------
Christian Hewitt (1):
       arm64: dts: amlogic: dreambox: fix missing clkc_audio node

Martin Blumenstingl (4):
       ARM: dts: amlogic: meson8: fix reference to unknown/untested PWM clock
       ARM: dts: amlogic: meson8b: fix reference to unknown/untested PWM clock
       arm64: dts: amlogic: gx: fix reference to unknown/untested PWM clock
       arm64: dts: amlogic: g12: fix reference to unknown/untested PWM clock

  arch/arm/boot/dts/amlogic/meson8.dtsi                | 6 +++---
  arch/arm/boot/dts/amlogic/meson8b.dtsi               | 6 +++---
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi    | 6 +++---
  arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi | 4 ++++
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi          | 6 +++---
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi           | 6 +++---
  6 files changed, 19 insertions(+), 15 deletions(-)

