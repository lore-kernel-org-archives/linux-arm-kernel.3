Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC52BC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JJeqmvQf3UAL4kCovc4gGHXLVQH6Y8/QOMAb9LY1twk=; b=UV4xoBxu3T3/3G
	Wzlz08W8e8l6cKbcC1HhonmwKVlMcAdJFHCU09nfITcTwwg9183/Q4KpWWaYmXjq3mnySuL/FbsjH
	AZ+zPKd3cqc3pKfRujGFoGw9bENdR7ermN+1UnH/x1gBLm2PaGYQsWuQY31OSUPN3XN+vw+rStCzR
	uFWWzZIMs6hCYDwLct0gmsA86udn+xHe6rYmsm3TphpA83/FuGLoZEn9cV/x9BRETRI1Bn2bHgode
	9ef1VMbBWeO0SfO2M+0u+PYxuY2vVjBfPqHXBIJ6kOwE7+GPTSNfbvuVOFTOW69vxA6CAWCIEZ/Ss
	EE3WApSBDl1T6dgc93SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmlN-0000000C51U-2ltI;
	Tue, 13 May 2025 10:21:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmcW-0000000C2sB-46xN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 May 2025 10:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Reply-To:Subject:From:MIME-Version:Date:Message-ID:Sender:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=JJeqmvQf3UAL4kCovc4gGHXLVQH6Y8/QOMAb9LY1twk=; b=NKYtzh2RVehTeYclf88gioHfMp
	0cMl6Yxg8D2qFzfW1aL+SmLWo5mmAmakYdBEoCriiXFB72oDoMAh26DVPsUyukzqNCynzDTjKZ8ba
	bAuuJAvYAFa37m69fzJeqQB9CWxuKleL9z+xPUzuqLh5gcPIvQW4S3wE06N5cM45EZZgGWus97+yx
	gff2r0luVJ4Bj563Fv3PonuATG7GYod4QqJljL2zVHr6wjMvmI1vaiSUhny00vm1Bq3MX6zjBdJLi
	aKXFs6O6d5XHov4bRzI3nANitANyTkNRaOPyO2ahIZEPQh2eYHoN7q8uUquZw/SjnP2O0FB2NGP9Y
	uuTvpcdw==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEmcT-0000000GvnV-1brp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 10:12:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so58754025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131135; x=1747735935; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJeqmvQf3UAL4kCovc4gGHXLVQH6Y8/QOMAb9LY1twk=;
        b=nbu0V2apurhO1P+o/o9/VKmZ1KxqDfJhhr8b6pSuPETpVt7YnG8wZMNxUU4aq3mzN6
         lLvnbqwkXR7SLodXcPAyFUr/H9NSJ8EGWwTd39tb6d8TVKaxjl0ovw4t+x9lUGMFxAPX
         HkTNNDM0F9W8GD8dpRilv15B4+shuFLl6tFDhHaMu+1Wh7+3rhr3VAA+Aioorp/ceP+h
         VZDvXcqqCAGwmhDtLtvW6xOLU8jKYMdsaX0Zxt+whDDUsaifpXYRAhxdN5zMjehmgK5K
         4KQ5jn5630V9cUTGWHAVhH24U7tB8He/kqDNw2ByF2M09fi94V2dQgkN7iHWWMiTXygi
         XkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131135; x=1747735935;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJeqmvQf3UAL4kCovc4gGHXLVQH6Y8/QOMAb9LY1twk=;
        b=nFuvm2H5esYtT2gG6AUe1JlFK4xNXm181N4o5TFZO+0eJkqpJc9tHnbMPsmloPy/KK
         HrVxYsT/X334rwnQnHyOFAMkkYLaonve9fprmx+9+rIh+CHpTzORP3DLZiRMdkgIlvuq
         avS/SAINHbPWkdLhBBNtTiVeQb6DfwDRXYX/sk7hoZJ6crxbPept1JmIJYwgit3aO7nR
         wnQG1KYovYy0w1094YelVMSZMnj0t6NECS/J93u7BAaqQxPfKdubr8E97bl1s3OLUni0
         XT9e2e5HP6SgEjEvowHBcFWg2yyXaF/hD//P/QNPsd57e7haehkEwmNvMrYlEP2dfDHq
         OS/A==
X-Forwarded-Encrypted: i=1; AJvYcCUh0DUxdIeiwySK6ISYSQLWeQ2INabVv9YmIkG6rb8uOxFGchCtN+xgLEa9EmlC5QEQQeoOoCHkCOn8/FxgRo4s@lists.infradead.org
X-Gm-Message-State: AOJu0Yzveo7oJcCgdlZ9nc3Zp+4PiMxpPHotW1X1mTT1kEZs9ZmBtATn
	6NyHf4OKTtNZpalPNpZlEfkU25M4p8SwXJTEN9b0p1rqJqGOiP6ifXavTv/Boes=
X-Gm-Gg: ASbGncv8aGTFtpI7izHUPoh5qtHdsPIZtyvSb2L1Vucg3k079s/wdXXa+4SzcueyubX
	It3zvrnWGYIG96iqh3GEXIIY7KWBB7NBFwGzGF5O9pXkdV8XNJoKPc4Fe9JHVB5v1D34/TpUhbQ
	Jh+YVqKCikyIbUC52WEuWJ2mfvmQtx9W7woXvvUROWUj5omcM5SEh9BmN8kyjHjK7cTmwPNu2b0
	SgCJghAoIbvmEudaFWQ1ph9ewVVyAuzq7R5u6fuFiW0H7S5IY17qoFkDYc1qC7Qv2DVZYL0Pb0Y
	9khLY9MWsXH7Hc3sh39R3jRDHb/+RVdFU7ElEB/iZ+ZVKuCUAIKiYzgnTCrdGOzdwMYPZmj5teI
	gkBXzSUBMnqYm
X-Google-Smtp-Source: AGHT+IGkA3sY3L4MfFT9frruBvb5if6+w/Gw4kde8Il5ntffLfGLugxuM3zv1UQFvt6KFoEpgM+QbQ==
X-Received: by 2002:a05:600c:4e90:b0:442:e147:bea7 with SMTP id 5b1f17b1804b1-442e17571eemr76287125e9.29.1747131134966;
        Tue, 13 May 2025 03:12:14 -0700 (PDT)
Received: from [10.61.1.139] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3aeb6esm207550715e9.25.2025.05.13.03.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:12:14 -0700 (PDT)
Message-ID: <838c5305-5c5b-4232-b7fe-86598dc50ace@linaro.org>
Date: Tue, 13 May 2025 12:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.16
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
X-CRM114-CacheID: sfid-20250513_111217_564835_CD34335E 
X-CRM114-Status: GOOD (  10.02  )
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

Here's ARM Dt changes for Amlogic SoCs, setting pull-up for UART RX/TX lines by
default for avoid issues with debug connectors, and introducing the Meson8 based
TCU Fernsehfee 3.0 board.

Thanks,
Neil

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.16

for you to fetch changes up to 2c1879a440315e0b292bbff0fa63a73bd8a52e34:

   ARM: dts: amlogic: meson8-fernsehfee3: Describe regulators (2025-05-09 17:37:05 +0200)

----------------------------------------------------------------
Amlogic ARM DT for v6.16:
- UART RX/TX pull-up pinconf properties for all SoCs
- New Boards:
   - Meson8 TCU Fernsehfee 3.0

----------------------------------------------------------------
J. Neuschäfer (4):
       dt-bindings: vendor-prefixes: Add TC Unterhaltungselektronik AG
       dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0 board
       ARM: dts: amlogic: Add TCU Fernsehfee 3.0
       ARM: dts: amlogic: meson8-fernsehfee3: Describe regulators

Martin Blumenstingl (2):
       ARM: dts: amlogic: meson8: enable UART RX and TX pull up by default
       ARM: dts: amlogic: meson8b: enable UART RX and TX pull up by default

  Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
  arch/arm/boot/dts/amlogic/Makefile                 |   1 +
  arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts   | 306 +++++++++++++++++++++
  arch/arm/boot/dts/amlogic/meson8.dtsi              |  22 +-
  arch/arm/boot/dts/amlogic/meson8b.dtsi             |   4 +-
  6 files changed, 332 insertions(+), 4 deletions(-)
  create mode 100644 arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts

