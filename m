Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3B1CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+nio9Hhvbka7Ed6Pqah8EBJxLi2/eirIVfDib3AzpKE=; b=lCARy6v1a09yOX
	x4h+W4WZQHY+30Ga9I9xS/5td5BY9cpN8gbXHEUNq6RIAbLqEOPXVurc7RR+KvLjsNqRU2Irz1c1H
	yK/7Doa32LYnwMKc15xIgsJxC9CwYCK540cq8tj+3R4I6z+SXkrFUH+m7wM4Nj0z3oEWs6JM0/vvg
	FHi/nkG9ilp8EaeQA8XloY6O3NxvKBhwEUA+16IQc1qHXucD83IQY0jKyM2y0o0puJo7IGrtuiaNU
	dC+Q77fcdR91XJVCztbV3hrnxSrigSzjnWBmHEAYAkYSCrAr0AcdVqW5LdcUe4vHDFIQoqDN+P4VE
	4NB37PdQtVuxZdC0TEPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2tw-00000000Zwy-2Cln;
	Tue, 06 Oct 2026 11:00:04 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2tt-00000000Zvq-11ec
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 11:00:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1541711f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 04:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791284399; x=1791889199; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+nio9Hhvbka7Ed6Pqah8EBJxLi2/eirIVfDib3AzpKE=;
        b=tbf6wKg7IJ8YB/823jQ6/Wq8GTSgkGmOcLejPVWEzIFdlhXqhs7usRo92Tx2SRRuX1
         I1ZTMgZHShmk9UKQ8+HuWwyPqjULKIL688CFcgwCAmmX2N5Qm21l28GJ7fKXw+bU6THM
         6qYN/9pGs83TSBu8jooGM88DZrIHC36pk3PcHjyi/R9kzcuS9Rt/ACg8XbKxES1idu5S
         vz3rn+/cOiDHqbELO67vXv0rCqLWGpKB5RcA7igq99NOV/NmaDVpzRHMhuKDnkn41k7a
         eotZnbBzoLgaPYk1M9qXvat7Z4NHHYDhfa/UV+lh/9n+aOWi1YrLhHV1TkTgx1N3iBTh
         8Lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284399; x=1791889199;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+nio9Hhvbka7Ed6Pqah8EBJxLi2/eirIVfDib3AzpKE=;
        b=Nrkmet/fIlnp+V9OmSf8mumrnIiyv4febso8uwTapqHIRCwBnBWn65hmDmgvIKuGX5
         6/ss1RDHhAEHJtsoSImv2Xn+61rGaRj7nt5yMMoae75wl2dAg+9cCCxlNNnKShwwzUBi
         CqHXnD+A8AUOx5geX922ThY02AwZ+ITW3zfkzFTzWI6M0E9GOAW3jTq3ceOze/922/nm
         jlT7eTr8az9ikquTDK9vFNJ8H49TkC6Xey6AEE169C3aEPKmOygFr0NQ7lHHsIZ1v3xk
         mmzklOnXmuvKizvITvj8DwPz5Pe6Odbe3eSdCLkCAM+izOKisbl94zNlY4eTc/EyLhk5
         2tnA==
X-Forwarded-Encrypted: i=1; AKwUvByCBZezx9BJWC4AnnMJrRv4nCHdg/4kuM3pB/w2jaraAzaOxOaVSaJc4QS01AnxmjAJPCMwprobtQuVJZ2E/u8K@lists.infradead.org
X-Gm-Message-State: AFq9FYLCyIsnboFv2O4KxmcJfJ2QWWxuCZ7jEQwuJBZl1nR5MM3Fw+oh
	kKbipsY5/MdkcoigFQFKyFfbQxMQk206U1Vv/ZWw1M84+X88+CX7feFj0df0HHS0lu4=
X-Gm-Gg: AYBFou3i6b0Ay3rgJD7e9LFlA1U4aK9MTCZKwkXP3lcCsMs1xKqZNu3x5ftyCFjO2UI
	FJ0SR79Lk8qKtttlUFB+2DVutHfbMjfLnL+MX4KnoQ2Sswjo1ywaoj1n9dAg/NeaiKkUzUkfXGp
	NK4hAHoKdsL08Tg+ZQPuZSVZpEFRbrqcH8XCCB19T9AKbF0C6ak4w1LsWYz76n1rCRPVr+Q7Sdg
	IsgpuVboNmaixCkZ2YMTOPQprPtxnHE9lQlJSwudphM+hFWjVSsIoG7wfnC4H3oU3+KQ33A3Jca
	xXwtYcac/dWvamZA9cWXEUb3WLsUp6AkaM4gmMw9KcxaCCsFvvLIDx7ZcfYf+oLoYm8YGhoIaFP
	Hc47MSNm1x25h06YjPyQ/sKWvUHmlELgaWfK6WXqTvV9orUSqZKzCBP7uo+fS6gjWnWHB0xTPBj
	2COrTU6NNYUGDpf/s1Nbahj/D8rQ4xjw1wQ7PTBelCwqXXuFo+r7uOaG+zp+sX1XdGibaASkwIs
	fC72i38C34CN493XBz/s3sxxVNvrrQ=
X-Received: by 2002:a5d:5d0d:0:b0:487:b4a:3f54 with SMTP id ffacd0b85a97d-48c4800336amr17791685f8f.29.1791284398668;
        Tue, 06 Oct 2026 03:59:58 -0700 (PDT)
Received: from [192.168.151.96] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622907fesm10290942f8f.26.2026.10.06.03.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 03:59:57 -0700 (PDT)
Message-ID: <8987c69f-5576-4358-92e4-e9e3b4f4f2dd@linaro.org>
Date: Tue, 6 Oct 2026 12:59:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v7.4
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
X-CRM114-CacheID: sfid-20261006_040001_302657_5AD142C3 
X-CRM114-Status: GOOD (  10.49  )
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

Here's the Amlogic ARM64 DT changes for v7.4, containing spaces
indentation fixes, MMC/I2C/MCU Fan features for the Amlogic T7
based Khadas VIM4, clock measure nodes for Amlogic a4/a5/s7/s7d/s6/a9
and finally changes to properly define the NOR flash on the Odroid HC4.

Thanks,
Neil

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.4

for you to fetch changes up to b44e2be772f866985cafdf90355285069ea68495:

   arm64: dts: amlogic: meson-sm1-odroid-hc4: run the SPI NOR at 40 MHz (2026-10-02 21:30:26 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v7.4:
- Spaces indentation cleanups
- Amlogic T7
   - Pipeline Clock for the MMC controler
   - I2C controller
   - MCU node for FAN control for the VIM4
- Clock Measure nodes for Amlogic a4/a5/s7/s7d/s6/a9
- SPI NOR #hold/#WP and bus speed defining on the Odroid HC4

----------------------------------------------------------------
Chuan Liu (6):
       arm64: dts: amlogic: a5: Add clk-measure controller node
       arm64: dts: amlogic: a4: Add clk-measure controller node
       arm64: dts: amlogic: s7: Add clk-measure controller node
       arm64: dts: amlogic: s7d: Add clk-measure controller node
       arm64: dts: amlogic: s6: Add clk-measure controller node
       arm64: dts: amlogic: a9: Add clk-measure controller node

Igor Velkov (2):
       arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the SPI NOR HOLD# and WP# pins
       arm64: dts: amlogic: meson-sm1-odroid-hc4: run the SPI NOR at 40 MHz

Krzysztof Kozlowski (1):
       arm64: dts: amlogic: Replace spaces indentation with tabs

Lucas Tanure (1):
       arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers

Ronald Claveau (2):
       arm64: dts: amlogic: t7: Add i2c controller node
       arm64: dts: amlogic: t7: khadas-vim4: Add i2c MCU fan node

  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  5 +++++
  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  5 +++++
  arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |  5 +++++
  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |  5 +++++
  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |  5 +++++
  arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |  5 +++++
  .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 13 +++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 25 ++++++++++++++++------
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  9 ++++++++
  .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |  2 +-
  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |  2 +-
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  2 +-
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  2 +-
  .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |  4 ++--
  14 files changed, 77 insertions(+), 12 deletions(-)

