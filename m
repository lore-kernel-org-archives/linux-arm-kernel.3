Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D767D10395
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XruInUkMDiRfUB8yo5/J+YoWJdFLwmVpCDCt0tsy4IU=; b=mH6Xirfb9KunEg
	UZ2rfCN77B5wtZbXivrJ76DcZLeYi7NJx5kaQsrdFJcBvnK32dzctghIWMRseCAg6wUEjDWWZ/dRw
	pQbX8wE03Mrc6RGfXoZ/iM9AqvCuzA9epQvMv9no0QsLPsVljwaxCAQXOcSBkUaOQgNFPH91S+oxj
	P13lcQrPgljvbh049QcP0jjyzi2WlBoBcjBcECP2QSKKLBS1KlIdNwAdsiGkHTMIUfN8u9kZrnKvK
	hTpe3bHpXpK5MUtkGEU4oowpT2aJ57BuLpWGsHtzqJSVvtZqB4bS7Y1+lsvatOQ6tOpJhrmSPQNdh
	HryV66O+Q6vLO9eXwt+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOB7W-0000000EdBU-3lNt;
	Wed, 26 Nov 2025 08:43:26 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOB7U-0000000EdAm-1OvR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 08:43:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-477563e28a3so4131205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 00:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764146602; x=1764751402; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XruInUkMDiRfUB8yo5/J+YoWJdFLwmVpCDCt0tsy4IU=;
        b=DRKukq+clnLIeYu4AQQWcYj/sKzhlSp0aLvCc7cUGBpVk2Lp4gmm2iLatvnF/QXiLY
         0jpb0tIp6hOpf9bIs3ddfJ0mDTGIrJV63QiF4A13kOKB650t3pytY50kpEBhfMspxKlg
         YovBpgzPIraa5zPgO5lGJAjpz/newdQdkYBhgRydPthLo5nxOeO6Fat6Au4Bf+kXn8hr
         ANVS7zBbofLQhVjYasVPPG+tKoZmJU/XHzCLSnJJFw9Hz8vcffLwROe178eAeZcXbuaw
         cwXvQKGF+gF39LqZ6A0nCHsL8koxQ2rbfdmhtU+ETfGfbvU2CgyfVsJk8TAERA1umun7
         xG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146602; x=1764751402;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XruInUkMDiRfUB8yo5/J+YoWJdFLwmVpCDCt0tsy4IU=;
        b=EUxWFyOW1QQO+GfE7o2iI7jskIi+w425c6frz+FdsUlJ3E22TJqVm31H9GVYGgjNPe
         si9OMPD4Wr5NhRwY5eGBvY/fK8DgY2BRuPh4ow3U1QTDunClpl1sRa2iRpRO4lqW65W3
         04+Vi867Id+mLmJHUYpwcmWbNS+l25qMwZaDBgGuCcHUgNmSTJLStI84+Ocw1jdagbBi
         Ocqk36UOevinzgUG24tyxHSA56s65FHgrfqc+PNPfFw8D4VEiw/yHHTlTvrJJfWUfc8p
         Z7kVW6PSxIxBx8sMuKbX65igIJ7e4/GypQFA4bBLljrVH76jzCAHgTiR+UFLSVPkMP9N
         0DKA==
X-Forwarded-Encrypted: i=1; AJvYcCVeaF7/7Oj9Jp3bTCPFQQ5kd+qs9BP7BsC2AgSIu/BVoRTjdfYN7VdquSQy+cRx/w4+y+H+1tqXEN1DMD9JCyTu@lists.infradead.org
X-Gm-Message-State: AOJu0YxTVXgUKDjgelRBbBj03a/gHRLbcZwnOoQpKKOvPYr3KoNpfkA1
	sUyKMRGxpmFPN1FTsl8h/MKzNYb1Z6zgts28wnkvI//kQa/BTVRNaKSHKri90F/tfyNzr6Oqkfu
	I4Ime
X-Gm-Gg: ASbGnctx5hV7FTSQNZosMTGU2BX4X6thj/Lxwpk2c4zMPr+xXYN8lr6+NGG8IeE8lSR
	+rjcdsvPLKWqusDHc2ajij7ley1y+v6j9n809KCd6eVjojfw8YXNZM4X5tNd+vmfiIe/7oCgx+L
	3jqA8AxU2yqsfrTFzqeVRqbmWu4WaXDhpnjcXD1AWlcP3J+q4exX46rVc8EttywcpZMqt5jIJIm
	YG+OsZdiWeipoM9F2se3j45LcdV1whNyeKQR2nnfclv7t0ht/3B9QpMKuJEdkZhS1C85Z1PrIXC
	1MzLUzILffPstcPH0R3p/+LgkEJFKkpfEe61l344aNwx+/zo6XQaU/KCkjAMQYepwolJbaIfQ/K
	tBy8K6zivtGkxpAYk8f4zEtpvxmbGpXH9wQXH4WcAnIDKx8PqimSf4ohUwBGzzmMuLJQIG5gTlW
	wmefijSOIEfxzDoapTtYnV5MfMEvK/1yBbvSPB0l538QaKYg+hc0RhKXgUbwrm
X-Google-Smtp-Source: AGHT+IFYo1aOFiVVd5emFHT/2Q/Aa0vH10uNANU4wEdWdlgfUVEUJxUFnPb3U+rfvktY3VmPyPwQDw==
X-Received: by 2002:a05:600c:c8a:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-477c04cfb70mr207424865e9.6.1764146602375;
        Wed, 26 Nov 2025 00:43:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:91ba:3a5e:334:4534? ([2a01:e0a:3d9:2080:91ba:3a5e:334:4534])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add60e2sm31255295e9.6.2025.11.26.00.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:43:22 -0800 (PST)
Message-ID: <8386665e-b465-4efc-a5c5-72354397623a@linaro.org>
Date: Wed, 26 Nov 2025 09:43:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.19
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
X-CRM114-CacheID: sfid-20251126_004324_392292_79B4D963 
X-CRM114-Status: GOOD (  11.17  )
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

Here's the Amlogic ARM64 DT changes for v6.19, adding new base hardware nodes
for the Amlogic S6/S7/S7D SoCs, pinctrl for Amlogic A5, hardware camera ISP
nodes for the Amlogic C3, non urgent fix for the PCIe DBI memory region and
support for new Tanix TX9 Pro board.

Thanks,
Neil

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.19

for you to fetch changes up to a7ab6f946683e065fa22db1cc2f2748d4584178a:

   arm64: dts: amlogic: meson-g12b: Fix L2 cache reference for S922X CPUs (2025-11-26 09:35:42 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT Changes for v6.19:
- Fix the PCIe DBI memory region name
- Add ISP nodes for Amlogic C3
- Add power controller nodes for Amlogic S6/S7/S7D
- Add Pinctrl node for Amlogic A4
- Add AO Secure node for Amlogic S6/S7/S7D
- Add GPIO Interrupt node for Amlogic S6/S7/S7D
- Fix S922X cache layout
- New Boards:
   - Tanix TX9 Pro

----------------------------------------------------------------
Christian Hewitt (2):
       dt-bindings: arm: amlogic: add support for Tanix TX9 Pro
       arm64: dts: meson: add initial device-tree for Tanix TX9 Pro

Guillaume La Roque (1):
       arm64: dts: amlogic: meson-g12b: Fix L2 cache reference for S922X CPUs

Keke Li (1):
       dts: arm64: amlogic: Add ISP related nodes for C3

Manivannan Sadhasivam (1):
       arm64: dts: amlogic: Fix the register name of the 'DBI' region

Xianwei Zhao (7):
       dts: arm64: amlogic: add a5 pinctrl node
       arm64: dts: amlogic: s6: add ao secure node
       arm64: dts: amlogic: s7: add ao secure node
       arm64: dts: amlogic: s7d: add ao secure node
       arm64: dts: Add gpio_intc node for Amlogic S6 SoCs
       arm64: dts: Add gpio_intc node for Amlogic S7 SoCs
       arm64: dts: Add gpio_intc node for Amlogic S7D SoCs

hongyu.chen1 (3):
       arm64: dts: amlogic: s6: add power domain controller node
       arm64: dts: amlogic: s7: add power domain controller node
       arm64: dts: amlogic: s7d: add power domain controller node

  Documentation/devicetree/bindings/arm/amlogic.yaml |  1 +
  arch/arm64/boot/dts/amlogic/Makefile               |  1 +
  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 90 ++++++++++++++++++++++
  .../boot/dts/amlogic/amlogic-c3-c308l-aw419.dts    | 84 ++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 88 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 28 +++++++
  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 28 +++++++
  arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 28 +++++++
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  4 +-
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  2 +-
  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        |  4 +-
  arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dts  | 90 ++++++++++++++++++++++
  12 files changed, 443 insertions(+), 5 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dts

