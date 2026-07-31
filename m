Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5148CC55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a87j8swmEQc4k8uOXUNzJXiAtCjtnQaei+ph1mC40T8=; b=tTapWofelximGj
	H7zISbiXtI4I5lnM8mYQZBmuSUwGRUbHVhfu+38uwDE/+csiLkk4bYuLU4KA7x1Iw7Yy0+gQx309V
	j4gVZR9zzKk6TEQa1zmvzf1IhgR8c+0vNBI7zqPW7guAOQZV1OCga7G4j6dmphXzo64A0uwke4+1W
	EOnet78XVlNniaMuPbBjEfVTF4fq2S2HzcjOYpj+LMb8YF2qvNjK8tNwONiruP3pom8uoFWVyzRhl
	FboDUdb17JHs6D+gxOZJdSxXr41i6lnKSHDwMeof3AGBcphXXHcU/o8EcW41XODZR7loClEgsKw88
	gEsjsp8bo2syjiokJGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppeG-0000000CwSK-31iG;
	Fri, 31 Jul 2026 15:59:48 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppeE-0000000CwRY-0UfA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 15:59:47 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1119665f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 08:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785513584; x=1786118384; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a87j8swmEQc4k8uOXUNzJXiAtCjtnQaei+ph1mC40T8=;
        b=khI+JoGdW8EU7NSRuiY3x3W0cij6+XmVOY8YQzw+a8lL1xpI079ukiGwRKaOE5lfxG
         yMcP4/jsPlbVL+gjpf19cEFpM3cTTtz3ClbwVinrDUkFJzis5ut5qXjy+Q4kaejI/5bC
         Ka1rP0pNvRDZwEd2bq+r2UuOtrOGRiYCq145XxO9ee2ianWvU/TWAP9xy7gBKtGOZnY9
         lMNVXcTnYvKX6xpjlthOyxMP3scwU3LrhMkQQaEp3bbmoTj3Llm7WnyseRSUPBdWiru4
         wGxf3oK3szkG6HhiEOwd1R5prX0G47hRHs5eFxP3CD7kNpaHLxPuirrntbTHken6HhdP
         83wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785513584; x=1786118384;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a87j8swmEQc4k8uOXUNzJXiAtCjtnQaei+ph1mC40T8=;
        b=mG8MzssibpSbFNTwAMGNFAIHWnOEFYZVzPdSnd/H/U1/qDmIJe78cecM8IEqU2ZPpv
         mBl1OeJEbxp6c24fYc1mJgfOtQ3xnt2zm9cv7lLaJ74lyuUmnauHeb2Eu9yCqakQr6as
         KWxyNGb+gYcQCGBYXIHBoJ7HLxI4uWGRpbLsW9nF9Qc40b6KXXas2EwYwCcNjWZ9wgN3
         3heVpujGj4qsTiqFb1b2FrEBpjleysS+6aG9SeSg724SspyhxgnOk7EFaeOGsYaUVpMG
         lqeVYvALyaRPMRPISvbRt+orzxltYWrYbEgMzITrrWG0vwVDrSjSX28tlFiKxjBpWvg8
         gL5w==
X-Forwarded-Encrypted: i=1; AHgh+RpSq6HQvsMc6bHYnl4EHeP+Vfd5/LaXuLwo96OjgvnwBmF97OryhfxZSA0Pv4CW9/A6vr1H/L8X8i5wP2FFrsyQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2kvjiJooIDpTwmWpMBk5Kfz4v5rKNzUu3hTylrPcvBrYRW42D
	IWjK//9hr2aW4mObNG7HsU4xlR0kCPiqX0F2RHR3Z2yCtYIdVuN7//PwK8FIYvSrrWA=
X-Gm-Gg: AR+sD12exfai0mPMkViw5ivjWag6QkVcxMFdC97SdHEPnmDItQN39Df7wc40kiRku7y
	/vTegXa4/USCTybaXswcxn5gmmJIYAEAWcUoSyeT8kuZCzMNeILjwblQxXQSDjzDPMO0fKUzq/8
	vD3zqHG27DfxipviZRrfGyn9LCgg2D1J9SH+MNlg38MqQYp9nC9A6k2s2JRXvEarGePsmhpaOCV
	XGpAN9c5lPoFVWBYndJ+/DuobLFbbJCaQLmbEWFvaD88BzwPnRFXAjUbRFOJNx/XJL4JSjyUtUj
	pE+2BtOoEd7G9RXZRNk2UmaQhCBaKNn3o9ZaStKdO3gdP2fxA0VVue3NHnYj6hFbkC6a3BbtIsz
	XvdV+3Qu8RQtvqwJfa8xRI7aT/ZKMXWPGrvHwe+v+EzX3J7wEp2qHvGucPi8qFy01YAIqtQXgHe
	3aDV6FHluWU33B8wDRp8b/KKpVfX7mvsJ1Cv8j5DO0PA4Qcu8qJ5VC8ELntfcheVHH8SbSPgiOC
	tBShIjMOzSJrbvn3I5edVgZje03TLf9fBjCIVKJhA==
X-Received: by 2002:a05:6000:240a:b0:47f:8558:8ff4 with SMTP id ffacd0b85a97d-47fd72ffa87mr374052f8f.54.1785513584059;
        Fri, 31 Jul 2026 08:59:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2? ([2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2cf1sm6118853f8f.10.2026.07.31.08.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 08:59:43 -0700 (PDT)
Message-ID: <7db3a138-facb-4132-aed8-8e8dcd3bdf60@linaro.org>
Date: Fri, 31 Jul 2026 17:59:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v7.3
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
X-CRM114-CacheID: sfid-20260731_085946_231884_532ACCC8 
X-CRM114-Status: GOOD (  10.05  )
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

Here's the Amlogic ARM64 DT changes for v7.3, contains some overall
indentation cleanups for the Amlogic DTS, some new features support
for Amlogic A7 & A1 (clk measure), A9 (pinctrl, gpio-irq) and some
fixups for AXG to only enable PCIe on the S400 board.

Thanks,
Neil

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.3

for you to fetch changes up to 7f1d0cc86cb70fa550163b6f70fd1d484c03218e:

   arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for PCIe (2026-07-20 14:31:02 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v7.3:
- Amlogic AXG fixups for PCIe and NAND
- Overall indentation and whitespace fixups
- Amlogic A9 Pinctrl & GPIO IRQ nodes
- Clock measure nodes for Amlogic T7 & A1

----------------------------------------------------------------
Jian Hu (2):
       arm64: dts: meson: a1: Add clk measure support
       arm64: dts: amlogic: t7: Add clk measure support

Jun Yan (4):
       arm64: dts: amlogic: meson-axg: Disable nfc node by default
       arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
       arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
       arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for PCIe

Krzysztof Kozlowski (1):
       arm64: dts: amlogic: Correct indentation and whitespace

Xianwei Zhao (1):
       arm64: dts: amlogic: add some device nodes for A9

  arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        | 140 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   5 +
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   5 +
  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |   8 ++
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   5 +-
  arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  |  38 +++---
  .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |   2 +-
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   2 +-
  8 files changed, 183 insertions(+), 22 deletions(-)

