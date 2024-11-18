Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C514BD43FEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8Tvpsfrzk7SMjxhB5HQe3fZdEwkv0xuam5EYzzOBvc=; b=Fs8nKzyomcMu41cgdupv1JmDB1
	LsEj1Z0kWt0I8W43Sbns7x6tiCuJyHLj7CkCjVgpo+AYOh7fsnHbb6tvzP1/OwFsf3kNX1blDj176
	O/aEp5ZDw4aeDdU8rZSIFWoh/RJFiAHwTHbfJLet1poofYnRXk/B49z4yDDKQ9hWDhrw/Hbiw7q1H
	F2t/UfyMY4bprm1ssS/zDOK87+NfE/MYq7aqy2DuvJWsMtK97/VUk4GkS7QI20ofOj10H0cC7Qp9x
	zBi1uhobz69KIOpxDNZQWipNQNxz9Ibk3/75wUuG+seFAmTNKK5E45JnjvpS7CiK78h6cGMY2C5Gp
	EMy0gzfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCxLB-00000008oUf-3czF;
	Mon, 18 Nov 2024 08:42:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCxKF-00000008oGK-1sGu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 08:41:40 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38232c6311fso1276974f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 00:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731919297; x=1732524097; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8Tvpsfrzk7SMjxhB5HQe3fZdEwkv0xuam5EYzzOBvc=;
        b=d1E2SVQu2rz//3EWuItag92u7OZmeKhgHyUMyM+MGeWzTx/I7UFTjnXa9CleMBkUTf
         hl7RMih4Z7owAqwfJWSZu5Xt+QjoVbjBWCpgN1eq/HGpXH8xGBnimyeC1HJZ8pYZ5Mdb
         Sdt8d/72Xo5+i9C7H1zqzz0JotCpRranAHn2RHTYBx+VnfpwVz2KnTRaKZc13eRfq6Fz
         ajT3U0nIbs/MhhMzrNKYUxowgXXwIC+Tyrdb0wj6rXqNTju93dH01x6a60Pn0y/bG+EU
         14aRfgjTmwynfZXgRXMnbnDmNP+4j8aBGw/N5BSbqKXtmxXDBSqcLJ8xKO4iw1xav00U
         5Vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731919297; x=1732524097;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j8Tvpsfrzk7SMjxhB5HQe3fZdEwkv0xuam5EYzzOBvc=;
        b=B4uEJt2oIJux3/CHfuA5sg6qUsGkMVS98DHGS1HRLXXyFGF11Vx2Js6VKv/HqJd0JX
         F91fvQftJa9EPFE2lxbsN5guBbaQV6NvbQPMBiBAOjqB7+ArV7gJpqFSMU9zc5ovwmYU
         cb8dOpsdk5ryX/LVz0maC1iM/GU61WEjxk6UkcgCyCbO7Ie+GKJiib6fRSHviwlkQDw0
         G16339vXg4DzLuzfmtNBQ/4pZS7p/w6bjPMOqTStrz4kiZTywFp4gSC7955tx1+7864s
         al83lL/66dSvtCkboBH5uVzy13mbOYFd+B7VbQMj/XwI11zXd/xvrdKa3pv89X1FmjWv
         i2Fg==
X-Forwarded-Encrypted: i=1; AJvYcCX8uBIGMhUNNh/woLRhrOZrLYkdcj5fZXXzBLim+lfQE3r0pmuNG9f3rZTMroFEM7lgWadphvYw6ZupVGDU54IC@lists.infradead.org
X-Gm-Message-State: AOJu0YyAlj6L3opE1W7RZzVA73G84PXUqqqL/u7ixqemkpaItezKV2Qh
	U56LamXKJCPhXNgm3FpJbAzDzPcvTy/e05RSgXKEObY9ZFrEA3FWv67xDHr9pdk=
X-Google-Smtp-Source: AGHT+IHLztPJBVIbOkJ8ko5/mWh3cnmCv//JSLg3JlabTV27WX4ibS11rR1jLnjQujt+qU40R+nrNw==
X-Received: by 2002:a05:6000:4814:b0:382:4a1b:16de with SMTP id ffacd0b85a97d-3824a1b19e2mr842207f8f.21.1731919297285;
        Mon, 18 Nov 2024 00:41:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed47:520d:3d5c:3acf? ([2a01:e0a:982:cbb0:ed47:520d:3d5c:3acf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3824a64d4ddsm765881f8f.34.2024.11.18.00.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 00:41:36 -0800 (PST)
Message-ID: <f4c33946-125b-459c-aa95-f34e7fb11185@linaro.org>
Date: Mon, 18 Nov 2024 09:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v6 4/5] pinctrl: meson: Add driver support for Amlogic A4
 SoCs
To: Rob Herring <robh@kernel.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
 <20241113-a4_pinctrl-v6-4-35ba2401ee35@amlogic.com>
 <20241113180405.GA653353-robh@kernel.org>
 <1764b1b4-336d-4ca5-ab21-8213691a9622@linaro.org>
 <CAL_Jsq+2v7=egxakPKZ90j9wro+prn5FOjuCGwwsYB8M1GP+mQ@mail.gmail.com>
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
In-Reply-To: <CAL_Jsq+2v7=egxakPKZ90j9wro+prn5FOjuCGwwsYB8M1GP+mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_004139_514518_FD40C259 
X-CRM114-Status: GOOD (  31.93  )
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

Hi Rob,

On 15/11/2024 18:14, Rob Herring wrote:
> On Thu, Nov 14, 2024 at 3:21 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> On 13/11/2024 19:04, Rob Herring wrote:
>>> On Wed, Nov 13, 2024 at 03:29:42PM +0800, Xianwei Zhao wrote:
>>>> Add a new pinctrl driver for Amlogic A4 SoCs which share
>>>> the same register layout as the previous Amlogic S4.
>>>>
>>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>> ---
>>>>    drivers/pinctrl/meson/Kconfig              |    6 +
>>>>    drivers/pinctrl/meson/Makefile             |    1 +
>>>>    drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1324 ++++++++++++++++++++++++++++
>>>>    3 files changed, 1331 insertions(+)
>>>>
>>>> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
>>>> index cc397896762c..3e90bb5ec442 100644
>>>> --- a/drivers/pinctrl/meson/Kconfig
>>>> +++ b/drivers/pinctrl/meson/Kconfig
>>>> @@ -67,6 +67,12 @@ config PINCTRL_MESON_S4
>>>>       select PINCTRL_MESON_AXG_PMX
>>>>       default y
>>>>
>>>> +config PINCTRL_AMLOGIC_A4
>>>> +    tristate "Amlogic A4 SoC pinctrl driver"
>>>> +    depends on ARM64
>>>> +    select PINCTRL_MESON_AXG_PMX
>>>> +    default y
>>>> +
>>>>    config PINCTRL_AMLOGIC_C3
>>>>       tristate "Amlogic C3 SoC pinctrl driver"
>>>>       depends on ARM64
>>>> diff --git a/drivers/pinctrl/meson/Makefile b/drivers/pinctrl/meson/Makefile
>>>> index 9e538b9ffb9b..c92a65a83344 100644
>>>> --- a/drivers/pinctrl/meson/Makefile
>>>> +++ b/drivers/pinctrl/meson/Makefile
>>>> @@ -10,5 +10,6 @@ obj-$(CONFIG_PINCTRL_MESON_AXG) += pinctrl-meson-axg.o
>>>>    obj-$(CONFIG_PINCTRL_MESON_G12A) += pinctrl-meson-g12a.o
>>>>    obj-$(CONFIG_PINCTRL_MESON_A1) += pinctrl-meson-a1.o
>>>>    obj-$(CONFIG_PINCTRL_MESON_S4) += pinctrl-meson-s4.o
>>>> +obj-$(CONFIG_PINCTRL_AMLOGIC_A4) += pinctrl-amlogic-a4.o
>>>>    obj-$(CONFIG_PINCTRL_AMLOGIC_C3) += pinctrl-amlogic-c3.o
>>>>    obj-$(CONFIG_PINCTRL_AMLOGIC_T7) += pinctrl-amlogic-t7.o
>>>> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
>>>> new file mode 100644
>>>> index 000000000000..edc5f2ba2c8a
>>>> --- /dev/null
>>>> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
>>>> @@ -0,0 +1,1324 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>>>> +/*
>>>> + * Pin controller and GPIO driver for Amlogic A4 SoC.
>>>> + *
>>>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>>>> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>> + *         Huqiang Qin <huqiang.qin@amlogic.com>
>>>> + */
>>>> +
>>>> +#include "pinctrl-meson.h"
>>>> +#include "pinctrl-meson-axg-pmx.h"
>>>> +#include <dt-bindings/gpio/amlogic-gpio.h>
>>>> +
>>>> +/* Standard port */
>>>> +
>>>> +#define GPIOE_0                             0
>>>> +#define GPIOE_1                             1
>>>> +
>>>> +#define GPIOD_0                             2
>>>> +#define GPIOD_1                             3
>>>> +#define GPIOD_2                             4
>>>> +#define GPIOD_3                             5
>>>> +#define GPIOD_4                             6
>>>> +#define GPIOD_5                             7
>>>> +#define GPIOD_6                             8
>>>> +#define GPIOD_7                             9
>>>> +#define GPIOD_8                             10
>>>> +#define GPIOD_9                             11
>>>> +#define GPIOD_10                    12
>>>> +#define GPIOD_11                    13
>>>> +#define GPIOD_12                    14
>>>> +#define GPIOD_13                    15
>>>> +#define GPIOD_14                    16
>>>> +#define GPIOD_15                    17
>>>
>>> The conversion from bank+index to a single index space seems less than
>>> ideal, and looks like a work-around to fit into the existing driver from
>>> a brief look at it.
>>
>> Not really, it simply adds a custom xlate per SoC, nothing particulary hacky.
>>
>> I was relunctant at first, but since Xianwei added the plumbing for a per-SoC
>> xlate, then it was easy to add 3-cells support.
>>
>>>
>>> If there's not really banks of GPIOs here, then DT shouldn't have them
>>> either. The question is does anything need to know the bank number
>>> and/or index? If it's only for human readability (and matching to
>>> datasheet), then just something like this can be done:
>>>
>>> #define GPIOD(n) (2 + (n))
>>
>> There's no linear mapping possible, each set of gpios is grouped into logical
>> "banks" per group of functions, and this grouping is also in the gpio controller
>> register space.
> 
> v1 had just that. So it is possible. 

Exact, it had just that like all the other amlogic pinctrl drivers since 2017,
So I waited for the bindings to be reviewed as usual, but then the bindings
were rejected.

So here we are now, trying to not "using defines for GPIOs" as requested,
and Xianwei tried his best and we agreed on this 3-cells solution which
is much better designed on the bindings side and won't need anymore
header file for future SoCs bindings which is a huge win.

The small downside is a custom xlate function, but as I pointed, there's
no linear mapping possible between banks, the current bindings with a
set of defines for each gpio still requires a calculation to get the
register/offset value, so this solution doesn't change much here.

Requesting a gpio is a slow path, adding 2 comparisons and an addition
is an acceptable cost to not add more header files in the future.

Neil

 > No one reviewed the driver then,> so I don't know if that was less than ideal on the driver side. But it
> looks like that linear map was just moved from DT into the driver. Why
> are there a bunch of defines creating a linear mapping? The xlate()
> function just converts bank+index into a linear number. At some point
> you need arrays of settings I suppose, but why do you need a #define
> for every index? Why not an array per bank? I suppose you could use
> the above define within the driver to at least not have a bunch of
> defines.
> 
> Rob


