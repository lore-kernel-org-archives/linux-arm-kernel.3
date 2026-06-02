Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02B0C5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vh2zzywQb2LDD0ApyXrtv/dbmsJmDaoaJ1y3lBs52fU=; b=yXtvu+lZTY9m+DAfynMsOX4EpS
	9AyJAELS3HjCtvSa7MCCssMOsP+qPq7asrh1KIm0o36l35S8gABpEIC8775ZP2t3d1HeiiAa7oCef
	tqZJnVnDJP8NL5yET7yBSFLSin7k3fRbTyE+Pyilj1w5Tb38NX9zZFUrI3WKvSN5euaHMbsUOck/a
	ybLxhRxWA06Bll01wsH5oJnz/sapQ0Zu0awLGcBtcJbjXttIm34tdf1+5oecm0fAR6hAJ0ayplbZD
	tSgQlTnQXAEWnQPDrIHYVVXG6ukyhk/qe9NkGjjFRDoQGA/BJWJ1yZwfjbzJjzuRBJrimgykBVywJ
	LzlPGZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJqO-0000000CVL1-18d5;
	Tue, 02 Jun 2026 07:47:24 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJqL-0000000CVKD-1EoR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 07:47:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45fd45e596cso1257377f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 00:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780386439; x=1780991239; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vh2zzywQb2LDD0ApyXrtv/dbmsJmDaoaJ1y3lBs52fU=;
        b=pZOOoOiYFFJrfjwgWJRhGyarE5jvFdMWD4whdTaDoXYKlGwwikruI2834+wjoFhVXk
         VOsENJGpEule43/L2PNYPDZF4HvcGnX3KNH7KMMloOS5dKx6nwSnhb6DJkG6FLyv1HKi
         V/jc3vY8i1Iad3XSoDMlzUujq1qQYi91KY19UQWhI0odD8k9xUncDdkEXTFEX8Keoh0s
         6CO6AiQSs/8K+dD3FKr52f2yBgUTXCw3zJ1Sp9LGhYW4pq6rCbam47sWFrVHQeDoohLd
         s4QeKcMH4nMAh0XG26y25U6CDSWiR0CV3i57FslJ6TPfvmHljOoFpCjdCnj1ZBAZhqWJ
         /t9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780386439; x=1780991239;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vh2zzywQb2LDD0ApyXrtv/dbmsJmDaoaJ1y3lBs52fU=;
        b=sEA6MGB7roj3yyJ7pd/5bGngeGaDpg7O9PlVd5C8f7B6CNiFusZ/YCAtqdibgQws/p
         RSR+dqhUaKTA9BfCvY1grq3F6R20f7zqMZd492BiB7tEcmF33F+/s/l9cYozcxM6lmjv
         EDmXv11EmWb4h6VU/QhwRPZKX2SR1ZuBZgja8m7taFy+W/xdSDMIgP52OEOVYIwzliL8
         3Arqs8WOpNQHqy7wVGdjKH076A1ztfPxICFHpE0OH/pomH/tWlGBhrMsT8vnAMpEO4eo
         E51G5hg4xNrcW13rL//BxUsyq7zCoAblPtFnYJRQgUbgO/KMVyvgu0stQTRSdUQ19LLa
         I1Ag==
X-Forwarded-Encrypted: i=1; AFNElJ+4K6x6nvZY6ffOfZ4taqAu0nzEJIdho7JLcWa1Ca4xMQO18TeS6kP66o88C4xxOIz75yq6aKIPJkBroowzg4ag@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtq3xsgefYHbuk6aNTDMlJVpwbCSXiogu0XsyvoN/5wkluIHmg
	OJ+kOwBP9IxfxSUfAIPsNRNkovlSVZ2qG6u9/ZLGau7EH4ecs1w1orCUEz1gCtURzOk=
X-Gm-Gg: Acq92OE9KoSf3YTxIfJD3diB+a0y4eWQfgjgL/1aekLwQ9MW/44tghxrRoAZOVQ8nGN
	+myOEj+rxc/TgNWaKQhGO1BwTwz8f9IfTJMaYjERbgjVyzSgzpsX3Wufu9pLlyUmqjcNbrabxQg
	9w8TIX7FkE8dNNrj/B483KwQd8drmYkuIoAJr3FtoywlTNz5RxIaDC/Cs9mAlnfRAVewNcKjkw2
	j+qsWobS6Gw+QNQ0ZM4TOKCkGwoiDL3OcgPIYinP6NY5kWz1RjVOoldfrLzPv1oaPaoXa+Yceqv
	vPnuFQfi8HshT27uC9Yw/eBq+ebZxH+6GHCBaQk2A+NOr7up85rIFHypqBJWJElv/F0INfNurcu
	Mp4+tu6zLcNe80azuVrLV9Z2+/bABEsB6WRmuL0kwFEA97XVLml6Yyb9fJvzWEyGH7VkjUwDNly
	Z1jqdfbbspIfsxW2x+9IcD1mLJ3HiqqfwK/6U/pk5xpRh5vMwq/xRCGLZQV1+uQV4NYGvmw9xXY
	NTB09tkNOGtPCLvDOG9itZ6sWe1
X-Received: by 2002:a5d:674d:0:b0:454:a41f:d082 with SMTP id ffacd0b85a97d-45ef6aea78dmr20394102f8f.3.1780386438514;
        Tue, 02 Jun 2026 00:47:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:13a7:124b:487c:e2bc? ([2a01:e0a:106d:1080:13a7:124b:487c:e2bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b834esm31159663f8f.11.2026.06.02.00.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 00:47:18 -0700 (PDT)
Message-ID: <9267eeb5-a221-4108-bc7a-57e88347e7a7@linaro.org>
Date: Tue, 2 Jun 2026 09:47:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.2 take 1
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <16fc7412-c470-4f3f-b6c8-55c35698a424@linaro.org>
 <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
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
In-Reply-To: <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_004721_404438_604CFEDE 
X-CRM114-Status: GOOD (  15.65  )
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

On 6/1/26 22:06, Linus Walleij wrote:
> Hi Neil,
> 
> thanks for your pull request!
> 
> On Thu, May 21, 2026 at 3:19 PM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
> 
>>         arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
> 
> This commit has a problematic Fixes:
> 
> commit 6f14ba3c3fa3d67b72e052f431f6776470eb2cbd
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> Date:   Mon Mar 30 14:11:21 2026 +0200
> 
>      arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
> 
>      Fix introduced invalid property for Khadas VIM4 sdcard regulator.
> 
>      arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb:
> regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not
> allowed ('enable-active-low' was unexpected)
> 
>      Reported-by: kernel test robot <lkp@intel.com>
>      Closes: https://lore.kernel.org/oe-kbuild-all/202603290828.5gt393t6-lkp@intel.com/
>      Fixes: 60eff75ac67b ("arm64: dts: amlogic: t7: khadas-vim4: Add
> power regulators")
>      Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>      Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>      Link: https://patch.msgid.link/20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr
>      Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Commit 60eff75ac67b does not exist in the SoC tree nor in Torvalds'
> tree.
> 
> What's up here, it looks incorrect?

Yeah sorry it was probably based on an earlier apply for the previous rejected PR

The right commit is 8f4e4fbd5072 arm64: dts: amlogic: t7: khadas-vim4: Add power regulators

But since it's in the same PR I will just squash it...

@arnd I'll post a v2 of this PR with this issue fixed.

Thanks,
Neil

> 
> Can you look into it?
> 
> Yours,
> Linus Walleij


