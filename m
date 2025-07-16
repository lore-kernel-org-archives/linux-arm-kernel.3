Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35192C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 07:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JTZyE17KIP8MeS2UO3NBP08211fLukiUHXp1mSFEsMA=; b=JUYvLXAOHY5n5S
	4CUTJRTzTfwShVYIUqePCyFbecW43/ivz1t70c8Bxu6Ii5Jbq/nXd63pU0hKieSFNY1+q2On2enVU
	oMDSQfFCsYsSArNgfFRbJ8cj0PCNUoo7kWruk4LJgSU0a9dwtNAFdFq7yDeAKVCj/I3BeH1RdpGxT
	8i1DYZC9qvvuh3TEXAU7IXjRobmhXTlQenqxRsoJPy2SpZwNeR8OLX5/DhwdHgEVW11EleYCjrYM5
	TEesygK1Lvsc79x6fz/WGiAaOwi/fNZYk1e1I8Hn5iQ7LHY+i3/Zj7bpXNCYyYsUs3ZqSm48ThTs1
	yQg/FD+y4MJTGh4715iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwnA-000000072ta-3R8W;
	Wed, 16 Jul 2025 07:43:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwib-000000072Ey-2B1p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 07:38:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso46800275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 00:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752651499; x=1753256299; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JTZyE17KIP8MeS2UO3NBP08211fLukiUHXp1mSFEsMA=;
        b=Ldwbr91D5KSNQx7lPLctIAEW5aJruZv7jkE/TagywBQFDyu6Sqi9dOkRYH8M4Sf9To
         tJcJQt+rIQ4neXpaPVMJem6vkdFS3XT4H7TH4dUMF24IHm07DV2Z8qu4VnkmRdeMERMi
         BOK7SFS3h850oYFiXGn2ULd2rSmfj4+E7ZPn+x4LQC0Eg6Jz872KM8B3lh20BMBgZj0a
         QhGK4vxO8vxWTKmj48rUFcdUnHC8cBftxuaC/Hxa8pjNh7+asQmSyClaPhkfc+ceSBoa
         QNw0N7vg1awoNDsUu03onw4wAAL7xPOL8ticBSGSaqj5AVbqlxwFyVyZLLavemQSBXn8
         gfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752651499; x=1753256299;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTZyE17KIP8MeS2UO3NBP08211fLukiUHXp1mSFEsMA=;
        b=BaPMRuWDSk1UwpKE25B9zahE1/0dZkIdz9rZwXaRL3l79VmIpyM1F4nMlhqRZWb56T
         gKrvA8BT2sifLESD3RmJGvOwpyp1hAR6V+xSAJlz/y6VnQx8nFW2wnzJBhvd7B7jigDU
         513omny48bvAH4Gh1dG205FfBupi/uQVdO20HywG7CRR+uqsfm6d2uJjBFGWaB3Wut3i
         gX0BEhzWdYVuVPuCjtAZ7lGCgyxGhzFfglZBnw9F4e/oDNOZfIYF+BUCDSmePAca1cra
         2E2smAq4L2dyjUMheUhU8P/bm6hQpWYwQmWdMF84vNzpt8A0hbrxdG0gJCGhlZk97aPn
         zkAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjUTGtmvnyhRyrqAqB8AzBwZtMNPBm6vljvIw7zKUQfPHq5EhkW4hZKnmwzoPxkvx5nWDW+pLrnPXOvyvvPURy@lists.infradead.org
X-Gm-Message-State: AOJu0YzYFqAsrteqlkSfFZD6IODLOvV8CxzSUYOQsLSNGM2RN6/rDEGx
	fjs4wHofYtb4OOXh7fCwGVDe9dq9kD0+kvDi3soIxfKyqFRMdRRU6E+sRTl+0NXm3Ik=
X-Gm-Gg: ASbGnctILl01b5cJLj++Qd54BJeOAhyglv4K9HbOf5PhKfbfs4+PppC140xxTbCddRt
	66yfgtlR0UrqJJh/8XTT8DX276VqHeCKo9x/bMxiNAbaiUr2DqTuD6Q50PI0B+xAYAOKL7FV5Xr
	m+47WkrUcQdg0ZJldLykSc/v6OgfO4k+e73TiMk7WRA67LA7SUN6OKkvT/yTO/4qFZiRGzmNS19
	7lfsz0bE3H45LTi9iUZTSssl2Vlx6LbkbPxrb7qirpAD9zhGH0fUyHB6jMiCsU5wBy+thnvkoTT
	RJ67+cQV5YCjFqsj9tGl6FGnDIVDQyvdYZs37VBvc3i73T7zmXGzQbuGy1GXRxhStwKHR1r94Oo
	aS/cIhMFkt5pdU/iJZmlDlA0UW5kMYEEwkWtqu6B5/mctDYXPmJRq+ygGhaGvyu0fK0JUlOnSRv
	o=
X-Google-Smtp-Source: AGHT+IF5VHjUdfZNwYUlg6vQGhBqdvVW29xEpVXshvZF1iijy/MsoFJlMDLl1aBwa+n3fGJrEvN4ig==
X-Received: by 2002:a05:600c:3b29:b0:453:7713:546a with SMTP id 5b1f17b1804b1-4562f164b1bmr11491165e9.14.1752651499326;
        Wed, 16 Jul 2025 00:38:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:91d5:1399:613c:fd4a? ([2a01:e0a:3d9:2080:91d5:1399:613c:fd4a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e135sm17207431f8f.72.2025.07.16.00.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 00:38:19 -0700 (PDT)
Message-ID: <3d93b621-9544-4a68-85db-6f87a9e8fa5c@linaro.org>
Date: Wed, 16 Jul 2025 09:38:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.17
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
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_003821_578904_8FAE3145 
X-CRM114-Status: GOOD (  10.59  )
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

Here's small but late PR for the Amlogic ARM64 DT changes, adding the S912 based Ugoos AM3
board, adding pinctrl support for new SoCs and finally enabling the NPU on the Alta
and VIM3 Amlogic G12B based boards now the kernel driver and userspace mesa supports
the NPU correctly.

Thanks,
Neil

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.17

for you to fetch changes up to 587c1c00f75565567d1f26a333a3392f7a21c28c:

   arm64: dts: amlogic: Enable the npu node for Alta and VIM3 (2025-07-04 17:10:16 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v6.17:
- Align wifi node name with bindings
- Add pinctrl nodes for Amlogic S7/S7D/S6 nodes
- Enable the NPU nodes on Alta & VIM3
- New boards:
   - Ugoos AM3

----------------------------------------------------------------
J. Neuschäfer (2):
       dt-bindings: arm: amlogic: Add Ugoos AM3
       arm64: dts: amlogic: Add Ugoos AM3

Krzysztof Kozlowski (1):
       arm64: dts: amlogic: Align wifi node name with bindings

Tomeu Vizoso (1):
       arm64: dts: amlogic: Enable the npu node for Alta and VIM3

Xianwei Zhao (3):
       dts: arm64: amlogic: add S7 pinctrl node
       dts: arm64: amlogic: add S7D pinctrl node
       dts: arm64: amlogic: add S6 pinctrl node

  Documentation/devicetree/bindings/arm/amlogic.yaml |  1 +
  arch/arm64/boot/dts/amlogic/Makefile               |  1 +
  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 97 ++++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 81 ++++++++++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 90 ++++++++++++++++++++
  .../dts/amlogic/meson-g12b-a311d-khadas-vim3.dts   |  4 +
  .../dts/amlogic/meson-g12b-a311d-libretech-cc.dts  |  4 +
  .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |  2 +-
  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |  2 +-
  .../arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts | 91 ++++++++++++++++++++
  10 files changed, 371 insertions(+), 2 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts

