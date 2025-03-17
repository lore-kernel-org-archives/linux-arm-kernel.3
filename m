Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10883C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 16:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x1BZ14L05I3ekMDBepYo6Uyru8+RK3QutqbPs+6O6Dc=; b=bG8rDjn5QDXjdg
	BEGnf6LrjZmhzrSi1Wc4hP3jSa9HYRkJycJsAcv/Jy/iBGh8979kt/fIX/KcC31i3QSOuW3RkebSS
	qOVjR1/ugwG6VWB1eftuSuHubCKNgDFLD4Qm7agONDEldJsrTFZAI5/1qc4BeWLaYstpgBLfjO6/P
	ovTzFYUeHyuqBRbIvoPRjABcXpEVhNQk6Ajnd1u9dG//nMbYLevfks9L38gqMBQPgDlrcZRNn0+Rt
	5LbgZM6y47wN8gggOjwEvBpWYdC0YZ17S7x5Nl5Ril/aWjcP3Vz4MvH8sJKvCSdfzzun1Ghe6M3fP
	6P3BScVGChTBamU6DfsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDA4-00000003Ioz-1sP4;
	Mon, 17 Mar 2025 16:17:56 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuD8N-00000003IbM-0gGj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 16:16:13 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-399676b7c41so652661f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 09:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742228169; x=1742832969; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x1BZ14L05I3ekMDBepYo6Uyru8+RK3QutqbPs+6O6Dc=;
        b=FvWHmcWzQssCpTWW4Y4OtI2jLCx6uenG60+kXUeuoh51upfsUXS2RE44dgFHrgmDCD
         MoVKHp84EznnOnQUz7AytVKkY/J1oxm/GCzOrWLwTKlD+f83WKTwG7JaL4WKg/aPXOyz
         MitHrTsScZEc25ixgnqqENqwjC/CQatNAL1K364riQwlHXKR1hYqsV0R0BPdlzTcayPe
         lCwSwjK/i+IJZ54ly4rkZQw8EdvZGwp2LgUL0pPgHTm2uf6eJf/9E1W6HIbAocSJdh6j
         C/pINcSaYQPL7LwIfL2e/COYcQHCyg+oCMMjZLZaCclZXw9H2yvuSi7qb+omr5N2gE9D
         GDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742228169; x=1742832969;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1BZ14L05I3ekMDBepYo6Uyru8+RK3QutqbPs+6O6Dc=;
        b=mhiExJByaFhj1BBJy6+vXxZ5I4yT4J6XZygvSecAbMUAFh1OHvNiz1W1djLVVgD3aI
         sqpDQ3+PAzOJJHTKIwMxyYFkLLogxRaS3kGxetH2T5QdSkQsMKyvWwHC9l6+TXk70BZa
         4li11LA7rwVPEelM9KcZuol1t4y/B+L3Vjs4CI5Njygb86mbeLIscqj6fav9YEuThRpV
         +lPYolId1MVvbA+hbmEOAOsFhspIrj5yO0vD9fxy5dr+h8pJRk++FMqZ6vEF8kYZirqT
         jliYBLrIcjzXoUvAJlUzWWnsDEF46EWP8BdblUZ/si8i2wFFGOm6XANV/nJAovy6IUrr
         lDEA==
X-Forwarded-Encrypted: i=1; AJvYcCULcA9/rsn0T8yF41BscamTQpM0TOXbIPogj0lr6MegfP0bAg2eqvh1TrITy9L19bBrkUpUcopFVFu7zYoxZ5S2@lists.infradead.org
X-Gm-Message-State: AOJu0YyhY+jWTB25s4B6meMQaHGXte5q8l2WdxzMWuOzuKFNNBmS1WE3
	Km54mCLYbK8+w71o702zWQYWwGhU6TOUHdlqOIhyDITsewuphzpgQOrnDozX4lA=
X-Gm-Gg: ASbGncvSGxlx9Dr1tbFxR6xq6m12mIG+svfE25l3ZqrapQuV4DetNCp8okWnBfsG5V7
	BeeZ7gHZrpO7cZ9jQ7k4wtHVimhlCt2mBT7jtH+vFewEXnRtB2hWR+Kw4Yg4WzbhB8vi/jG6lk3
	lNyj6tOvxRmgb5lnSsurY54dnuZvxIcv2BzwkEKt+UJWKf9QivC4UOo0A2B8HWHQMnR97EE/2DI
	DsqMvOa8M8j/YoABIt4kUuNfkf/IoCX5LIytSCJ8THUy6FnshbWw5ywgq2mTPGKBJCynuqg91bL
	T73fjaI/pughnz0UYT1uCHUbaB/NMD6J3u+GpEeuSouPR5Dtv+n03S0GvQMX3FEQI9tM0R6QSHh
	pvWlCcWlbQPa8gLLiAyorTA==
X-Google-Smtp-Source: AGHT+IFWv27SmF7MzpnXo9R7iPDAj+6RqTUsIDH67v/ftmpxSj1WYnFVQKvecSP4MshBViBQNaeQDg==
X-Received: by 2002:a05:6000:178e:b0:38f:5057:5810 with SMTP id ffacd0b85a97d-3971decdc97mr17309093f8f.25.1742228169534;
        Mon, 17 Mar 2025 09:16:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:1a77:b55f:a550:458c? ([2a01:e0a:3d9:2080:1a77:b55f:a550:458c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3978ef9a23bsm11136752f8f.15.2025.03.17.09.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 09:16:09 -0700 (PDT)
Message-ID: <eeaa8d3b-4fc3-4dae-92b8-0fc590e1a070@linaro.org>
Date: Mon, 17 Mar 2025 17:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v6.15
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
X-CRM114-CacheID: sfid-20250317_091611_208054_DD08AF53 
X-CRM114-Status: UNSURE (   7.29  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

Here's the GPIO interrupt controller bindings & driver, acked by Thomas to be
merged via the Amlogic tree along the DT changes.

Thanks,
Neil

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.15

for you to fetch changes up to bbd6fcc76b39502767e213ad24a349205cf75e96:

   irqchip: Add support for Amlogic A4 and A5 SoCs (2025-03-17 08:38:24 +0100)

----------------------------------------------------------------
Amlogic drivers changes for v6.15:
- GPIO interrupt controller support for Amlogic A4 and A5 SoCs

----------------------------------------------------------------
Xianwei Zhao (2):
       dt-bindings: interrupt-controller: Add support for Amlogic A4 and A5 SoCs
       irqchip: Add support for Amlogic A4 and A5 SoCs

  .../amlogic,meson-gpio-intc.yaml                   | 19 ++++++++-
  drivers/irqchip/irq-meson-gpio.c                   | 48 +++++++++++++++++-----
  2 files changed, 55 insertions(+), 12 deletions(-)

