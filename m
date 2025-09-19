Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305BDCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+s3KzlEou4Arh9IszQHrxspSJWPrDvVkQR1g8Npkl2s=; b=eOBvXiz+9AeYbG
	vCSomAA+clTYJxqUY3SQYzz3o39qkeoXl2AuDzrFLQTLE2Y4kLt5x7ryyN5OD7SUEM/TaKmt2ibxt
	n9Hoj1HlTgenD4LYAkrTlBAbuNbSzWmDgRvcRBR3Sd4/gs+IyN7JxqegcWTzl3x8DQhIZsNvY2tdO
	otx4Evkgi+DAYTZpOt0YVWOQ66+URsBrIxJhtjXKDun9VlbZo2PXX3tFVD2EsSvMgSu614CXZH5F6
	qGSQtIR57Yp4nR9ADJKXnm1ROR/U0QbSmZJtuGFRfj2S1ukcl26iXPwVVB6HLcdCGXfMYK8vxdXTF
	1DzdvgHqH+QP8R0btE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVmX-0000000270w-3SIL;
	Fri, 19 Sep 2025 07:43:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVmU-0000000270H-3FC4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:43:48 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45decc9e83eso17504005e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 00:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758267824; x=1758872624; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+s3KzlEou4Arh9IszQHrxspSJWPrDvVkQR1g8Npkl2s=;
        b=QtTPGWhULb/YD1Z43OTnj3IR5qzhXn2yxNRa8PIL1NxxunSgNxapEUhHrzysqM1nsw
         XAH5BeafZyVSXK6mtPQUWovyjn6SMR5AVMKoRTmsSdzESyXUJqY+zHiazFqaMqAJIx3s
         Yw7EewDUgoELty5uk+IGMDG2LwKFSQ2xBqcLEdZi/yJpCpvryXQU2qQcDORTnlZbnOpl
         NAoUQJbln6HavoOwmZ2hwYXY53o5c6i5cUfp+AGP4VEwy22gKUWwmo/8OpCnhvA3Ey0r
         375ssuXw+GHZrZrOYc5Mmd1adH1o1scwrjP74M6zUq9vtDk3i8lbVOMreR+JCuL66Xk7
         EASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267824; x=1758872624;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+s3KzlEou4Arh9IszQHrxspSJWPrDvVkQR1g8Npkl2s=;
        b=FXYc31XJ58PXzorsHMmfaxAxi2BXZQv3Voiq5cr8vZMYmbRr7ZlXA4x0NRwiJo5qJh
         5xll2EK+fKbwo78X9McK9nm4W8VWs15Q+hoN8wE7dk/LdqxySU46auQaHahoNulyEi7/
         L/tlBSBxUChXIbrZUoE7ZFxA6Hrui2Z7PNorWyQ00/UY+cLgCTUm4bxkz/94GGsrPXSL
         jyGcA/5SE3RHc5DqM47aCuWNJQ2Gv74bWsMvNYnFZHBJfGgQYdIweXPvJWf+rEE27oAj
         MimTW3hCrsJJs83utdzruAmoTZ9BDP1qraUVStJsEInBGlhw6JEOaPuAriMddGza7sFA
         k9/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWS6k0hJCRZlBY8zUrREqpUyEsytQ9WZwnyDfPXTvzldl5fK7FGkPIwnuIVrK/nZyo0eSenL46nhsZkDTnjvAAY@lists.infradead.org
X-Gm-Message-State: AOJu0YzdgUO3MPhZaQmTXaohPsVO8zdtZM9jWrQm6yxVDta04/ClCe5v
	jZ3EkaTFw+W6ug/8b0Jl30hxH4I5EWcHCg0j+wJ8NJ/dzeTJuuFGlqEBw2CIIu4MpFU=
X-Gm-Gg: ASbGncsgzMBgMHcfFGw35eut4ZGL5JpStksklGM3RRCt1uEp4lCyTlsYvOt5eScEvdS
	Acq+wYVypwb79bxO1im96uI0lUZbAbnSfIXxHs7HSZX9ivByqvbHBsQRm+IGpA9j5kwBHNR1g/D
	73u0FVi8K+awYqvSZOzOmDImuzXzrB01aJKrkMqZY7tL6zhWmEaD2EUveKVDGLYQcKMewxFkrbY
	Jtfavtj26yYJWkIoHaWdObWSkR4ip/eNTJNlOBP6esY2j1gwObbxdiP78+zQLYu9VBa47+tH5xm
	KxTHr8NipFkuGx2Mk5Mj6okB5qwZJ1yREItwHxs5zdZAkrCIzZIWQU+0W5PPWzJzSjBZ0xqo7b2
	j4ewssTMfEX9ptl8Tb0Jt59hBJ2NrZFLakXJMxSoFPTwRTzVGEjSOBgCvtSeaDT04hZy95ay0
X-Google-Smtp-Source: AGHT+IHcpJllzu9GwIGxRnbuf2O8B6mLK+lDLJvJu6rm63gNOYwmoqZg+mDrovu4zkhtTeyVh08/AA==
X-Received: by 2002:a05:6000:2681:b0:3ed:c9c0:73ce with SMTP id ffacd0b85a97d-3ee8407d43cmr1276205f8f.32.1758267824324;
        Fri, 19 Sep 2025 00:43:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f? ([2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f4f9f339sm84730655e9.14.2025.09.19.00.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 00:43:43 -0700 (PDT)
Message-ID: <003cb467-531d-4a8d-a97f-19d59154132f@linaro.org>
Date: Fri, 19 Sep 2025 09:43:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v6.18
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
X-CRM114-CacheID: sfid-20250919_004346_845401_01F32A3D 
X-CRM114-Status: UNSURE (   8.30  )
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

Here's drivers updates for Amlogic SoCs, 2 non-urgent fixes for the meson_sm driver.

Thanks,
Neil

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.18

for you to fetch changes up to 0454346d1c5f7fccb3ef6e3103985de8ab3469f3:

   firmware: firmware: meson-sm: fix compile-test default (2025-09-10 09:31:20 +0200)

----------------------------------------------------------------
Amlogic Drivers changes for v6.18:
- device leak at probe in meson_sm
- fix compile-test default for meson_sm

----------------------------------------------------------------
Johan Hovold (2):
       firmware: meson_sm: fix device leak at probe
       firmware: firmware: meson-sm: fix compile-test default

  drivers/firmware/meson/Kconfig    | 2 +-
  drivers/firmware/meson/meson_sm.c | 7 ++++++-
  2 files changed, 7 insertions(+), 2 deletions(-)

