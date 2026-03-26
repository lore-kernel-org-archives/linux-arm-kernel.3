Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E814D10A62CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5T/06PnZQDDMs+KvURgz2r0ZPGg12B/UFXU9prTTL0=; b=M6ZCGG1l+ixkzjS1gi7jnbjTyF
	wsmdKisDKxT2xh/fW3//orhgjm5glpKTy3Ik6Pi4p0FmqhbpmnuSLMrNdsp7EkWHFNIod+X4QsJry
	j3lukcS40OHq68ZnYNi2Cuo8eD9Wr1NwFHFY17gdDjj4/wfZ3sRElILEeskGRnBVUd6G8vP6LLbT4
	YOUbYppD93XabDUjKiuVP+sxvWEBiLfFuahRurbBSCJXfoNrnWY3Qv91WpR6ojfjvUDG8bkR8Ky2P
	tBHcOXyWONFz1TB3o8kFk85lJrjF0VdNnPLixCMnjs/+IQqxKtIyM5OMXur1+ThLclQtaJb8RRsSu
	7rrOZHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kTX-00000005WQp-37Ky;
	Thu, 26 Mar 2026 13:10:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kTU-00000005WPe-3uvD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 13:10:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-483487335c2so10930785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774530611; x=1775135411; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5T/06PnZQDDMs+KvURgz2r0ZPGg12B/UFXU9prTTL0=;
        b=kajOSXbcNnoy6lWY+/j2FRrQb6+rC4imGjzs9J+MLOpbDF6+xGQpnBtoZb5/eZ3zSg
         2vkfVC45Q4QmZwm5qOOJdw13Sy3uce0zVVlQKdCkOw40WaNW++tu2a9yZ/t3IeF/+iPe
         Rk2YhMCCPY0qZ8bvduj7qpdlaEP2lbcSUC0D1Rk3uOLfiqIdTcsYUi+vq89Q7LtlJ9kY
         +xmBSzj2uf848DGeaBoJnwZsrt3cHCxp+vv88o7Fthkg+La2nJcGIlOciTAU5nfCA+Hs
         A8Efkp3BeIQhOptbcd9hSQrJpDC9xblZbesROFysjMuFP/BhVZOoiK2sFeUHEjVv161D
         AUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774530611; x=1775135411;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5T/06PnZQDDMs+KvURgz2r0ZPGg12B/UFXU9prTTL0=;
        b=G9noqUBkU6doBPU/6xhijsyXwMkfYo6cM78dXMFChC/C7ue6C3MUlpxqqaU85pFiTM
         UbFvXNc8fG6d4HaHrfK5LUfFGWTj1g/AEd4cjy5YDgN0b7IjtW3Eye4W1EvMOvdrWiVg
         9VCevow727dLFNMLk18q3XYqmXuluwDPahmr4QpTyGLWYcytYsi6RtUF5i82FJfU0ZOw
         +NqTlPqtdS4UQKVV2sXMhvgLAIm5UjreoyRW6oGjW6mo0Rca6OjIxDjfcc1CmQz7NrAY
         jrAXF15H9YYPbSRXmJbOuGCEfVTarmHUlIv8MteWZMiBGfAO1m4NrJU5hdRXQZ/Jo33T
         lqLQ==
X-Gm-Message-State: AOJu0Yw2sQ+fQUNlsghFtROmgb0aGF+doK8LhgGRwxNnE99Ai1uQUs4f
	EQIbtxvMPU+8OkNVGoaqoEmo+2bwy/tMEa/oVjFZi/JlvS13K3RdS25K/lAAU2Ba84A=
X-Gm-Gg: ATEYQzz62uzguQ0XB1t3Hz/SJ4xxGJtnfmfj9vE3SaNW92ROA1I8kn9BxcKqBb+RBd0
	tZGvf79uG2ElRFFISBDhqORLF9RIvm+0O85obQFgiRCtcfZesT29CDYXo2VNQ7xg/g80fiBeQn+
	0wpfhPrtypR40l0NcnD6nMEAvKgYOwe4zFCBbftoMWQh7+wwvWA6vT6uwcPia3v9K2yO0d7lpp0
	Jzu2JUwGst8Ei6B3AkOJ3mf7neBG9m7xIUdIQeZyYMy9XdqIzUEL04awz6R6/AJH5WCAfupihG8
	2WU+XED6pK8AH3oXGUA5gKdCZyWIdUcxijZcGRIXf0iLAAHUugeqNnzIN9JrHb7llOAaSHtbSPP
	ZrxhD7L/BBj48OcB5aZcRNkkWX676v/1gMeOgqqzymsPXsEWNshlsIpGqn1N/X42APbMOlZZErh
	rHWhW24r1or3DfK6nNMEQ1/KqQEpxHFzqTJ7SemO1Selz1IZRzhXe5dRRvPugyUhOKO9X75T/Me
	wvl9sg=
X-Received: by 2002:a05:600c:620b:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-48715fdebd2mr120329765e9.11.1774530610950;
        Thu, 26 Mar 2026 06:10:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c78bc2sm29702165e9.5.2026.03.26.06.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:10:10 -0700 (PDT)
Message-ID: <c54566e1-f0e2-4584-bc4d-484ebfd40324@linaro.org>
Date: Thu, 26 Mar 2026 14:10:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v5 0/9] arm64: dts: amlogic: Add MMC/SD/SDIO
 support for Khadas VIM4 (Amlogic T7)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
 <177453048347.439230.1647215482099213609.b4-ty@linaro.org>
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
In-Reply-To: <177453048347.439230.1647215482099213609.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_061013_008179_11EB4163 
X-CRM114-Status: GOOD (  20.61  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 3/26/26 14:08, Neil Armstrong wrote:
> Hi,
> 
> On Thu, 26 Mar 2026 10:59:11 +0100, Ronald Claveau wrote:
>> This patch series depends on Jian's SCMI clock patches yet to merge
>> https://lore.kernel.org/all/20260313070022.700437-1-jian.hu@amlogic.com/
>>
>> This series adds device tree support for the MMC, SD card and SDIO
>> interfaces on the Amlogic T7 SoC and the Khadas VIM4 board.
>>
>> The first patches add the necessary building blocks in the T7 SoC
>> DTSI: pinctrl nodes for pin muxing, PWM controller nodes, and MMC
>> controller nodes. The amlogic,t7-mmc and amlogic,t7-pwm compatible
>> strings are introduced with fallbacks to existing drivers, avoiding
>> the need for new driver code.
>>
>> [...]
> 
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)
> 
> [1/9] arm64: dts: amlogic: t7: Add eMMC, SD card and SDIO pinctrl nodes
>        https://git.kernel.org/amlogic/c/fb69fa2cabc68da247bcc0bc99a14dc857b16842
> [4/9] arm64: dts: amlogic: t7: Add PWM pinctrl nodes
>        https://git.kernel.org/amlogic/c/b1e49f6c1ac15b2c947bdb1d22a82b823de22d27
> [6/9] arm64: dts: amlogic: t7: khadas-vim4: Add power regulators
>        https://git.kernel.org/amlogic/c/60eff75ac67bbf5445bdbd2842b0109ac591441c


I'll pick patch 3,5,7 & 9 once patches 1 & 2 from [1] are merged.

[1] https://lore.kernel.org/all/20260326092645.1053261-1-jian.hu@amlogic.com/

Thanks,
Neil

> 
> These changes has been applied on the intermediate git tree [1].
> 
> The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
> for inclusion in their intermediate git branches in order to be sent to Linus during
> the next merge window, or sooner if it's a set of fixes.
> 
> In the cases of fixes, those will be merged in the current release candidate
> kernel and as soon they appear on the Linux master branch they will be
> backported to the previous Stable and Long-Stable kernels [2].
> 
> The intermediate git branches are merged daily in the linux-next tree [3],
> people are encouraged testing these pre-release kernels and report issues on the
> relevant mailing-lists.
> 
> If problems are discovered on those changes, please submit a signed-off-by revert
> patch followed by a corrective changeset.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> 


