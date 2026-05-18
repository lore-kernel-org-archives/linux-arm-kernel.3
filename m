Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FECCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTzZu6PNEHK5eJaUTG9yj4SnM6fDyLlKBKNjBkf8mjE=; b=ibKGkc6eolTvkClG2mLiaFqBz/
	MOiUhHdC5wPPQ615ACrTCsCwMNZ3E7WsTpQjk2opXZYdiFphSzWmOakJpfe3l9hjQkG+fdFDpRvQy
	f5qgBwF8s+Fzl9clZF/qXAmHa2FJesy7eOdkGyiViGI5VXelb6xZNy4vr7VsMB9JgwRrSKGPTYqAv
	t9Gte8o/4vOtNwscH9V8WoC6/obtRqRfDvWgYtVN3DB05UNFh2lFDej4Ja5xe8zEi0IcuN17JkYFh
	uiPOdYYEy7z+KT+/h87jzcQUGWgVPig+vr7XN1JEfM1ioziCyJ2i6eFmngGsZwG5zl7xKn3TFxUGa
	yT6yRMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxWU-0000000Fj10-1yJo;
	Mon, 18 May 2026 12:56:42 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxWR-0000000FizE-2oLy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:56:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso15733265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 05:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779108998; x=1779713798; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTzZu6PNEHK5eJaUTG9yj4SnM6fDyLlKBKNjBkf8mjE=;
        b=ODw11VenkSBiNuXly80YFJmDNzNvNA7/7joldMHZ7L6FUaUxcO4/yuHSPyO/VkhSy1
         dL6b5sVoGnMENat44cgB9cVqKyhMGwMG2nJ1uhAryK0r5EWb6llYUpD5IwimubapCFir
         OXb1FXtXBNAqnZ/lxETT7PBnS54We0Gcd7fEhOnaePvOhSTutaEByMeVWxnBOiWOdF5P
         BJXXARL0DiMtJCB8tYuuo4KcNC9/IALRwHcHKWTzUGulbb9QiSDRggCFZHM5Wmty2r2m
         y7YYNPgLlQfjcIG4zRh20PL3Fd6CzkkZT9gDtmfikpw3m3H9jgsK50JpeF72h1vufA07
         xyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108998; x=1779713798;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTzZu6PNEHK5eJaUTG9yj4SnM6fDyLlKBKNjBkf8mjE=;
        b=Gowgkr55fXNDk3jQshb9rnKYNVKgQxj8bhRGiWWjUnvuYEcpCAlkMIYqqtL+GavJqB
         9Y6hv+0u8k3w8+IH5EBhB8bDNYMT/y1+I2Uy5Lpfl5Fc1DrqI1qsrzFOvD+DwtpbaQig
         461UUPC4WTiDuCjXPkWeo/OOEwQFPuD00OSUD1y2fN7KncaYwd1zmTfgoE/Nkucpo/QU
         /EKgCG286joW5PrVRp2i9T27Jiwph6KRVzRYhSC/dP2an+bvW7PVKBKmk/P5KYV5g/QF
         w10+09LYbsNIXsRvGTBdAtjwVin9ZzOhIH5bGOrIBlrIjhRzacGiPfZKnHBWu0D8GhcP
         oMtg==
X-Forwarded-Encrypted: i=1; AFNElJ+fdHd2NVl1LMYQShZk/Mmm5yU09K+Qzkxvil/lzy+5gjZIqVCwfBUxgVtpJLkQBUd5HPk4+w0kmH9qJl++LIgR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4u6kDcNLXuaRYYEYdJfJgWML4BTFRLW4lqj3u2nCDlOXtCdMy
	D7h3aW1dzZtNnpuJ28yAjbxMrJY5wcfym9gC1Y6DewyJgTLB1++yMrX8o4ES8B3rJL8=
X-Gm-Gg: Acq92OHOhGSxEhDBk9AfhmI2dvpQtWDiaSq3ab0aE/Fj70Qg293UKgWYXO4OfMxj4Qp
	FtgcgUYqC3+1ufwmdQUFWXlNYeclXC73AhC6hRAlfNBnFFUDzOq90xytNbTk/+5pL1iU3CdjQsY
	FrsJYDJQlVpEcluMXR0Fjo0IGfv2+DQLoyTZB9M48ee0Pb62H8opALYvlO2FnnLIeA+WcsbspgB
	1960quIjA1etw9+Va1IkBKG+8ZQ+Wjyvtx4HzrPZ2mak/LC+cL6UdSmogChwyRhDoRtCJKV+gon
	96S4BHiHUif0By3RCy8C9kduSza+1VD//KyMydogsf4ofz2H3tOvTMhkrY4Gt6Rdx4MVnol7Yf5
	d39haB3E7sZSNbCOcL19y0V26zDdNygZzuKaBUFwnkKS9A+ff9XwqhQTeDNXqURUNBUp0kRxwBe
	JqHqHsmZrUuZpvHiL7vVZCuiOVygG2jh5BRdSQu/FyQoP86eOSQU71Dfq5kkN+W2Ooly2RU5y0e
	wJaeN3my561Of4nkw==
X-Received: by 2002:a05:600c:34cc:b0:48e:60a3:220a with SMTP id 5b1f17b1804b1-48fe59af1cemr249848065e9.0.1779108997664;
        Mon, 18 May 2026 05:56:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1029:e3c5:362e:1250? ([2a01:e0a:106d:1080:1029:e3c5:362e:1250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537c516sm276340275e9.13.2026.05.18.05.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:56:37 -0700 (PDT)
Message-ID: <08de1873-d2d8-4387-8521-7161ad71ee46@linaro.org>
Date: Mon, 18 May 2026 14:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] PCI: meson: Propagate devm_add_action_or_reset() failure
To: Shuvam Pandey <shuvampandey1@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
 "Lorenzo Pieralisi <lpieralisi@kernel.org>" <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <177909148011.9588.6639767953842842291@gmail.com>
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
In-Reply-To: <177909148011.9588.6639767953842842291@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_055639_742243_C40BCBA2 
X-CRM114-Status: GOOD (  16.42  )
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

On 5/18/26 10:04, Shuvam Pandey wrote:
> meson_pcie_probe_clock() enables a clock and then registers a devres
> action to disable it during teardown. If devm_add_action_or_reset()
> fails, it runs the action immediately, disabling the clock.
> 
> The return value is currently ignored, so on that failure path
> meson_pcie_probe_clock() returns the disabled clock and probe continues.
> Return the error so the existing probe error path unwinds normally.
> 
> Fixes: 9c0ef6d34fdbf ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
> Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>
> ---
>   drivers/pci/controller/dwc/pci-meson.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index 0694084f612b..8d495bcc3a41 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -204,7 +204,9 @@ static inline struct clk *meson_pcie_probe_clock(struct device *dev,
>   		return ERR_PTR(ret);
>   	}
>   
> -	devm_add_action_or_reset(dev, meson_pcie_disable_clock, clk);
> +	ret = devm_add_action_or_reset(dev, meson_pcie_disable_clock, clk);
> +	if (ret)
> +		return ERR_PTR(ret);
>   
>   	return clk;
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

