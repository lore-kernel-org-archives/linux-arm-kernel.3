Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51419CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJvbqf/yt1tsn43VAwo8VG/RGkLizif52M9SXD1q9EE=; b=f21RyjEVLsa36Zq9cxbwwVWaB7
	Ig7dVgI4UPTgAmntKOwt99M7Sjtn/pvurNygI0kg1ezGPB/u0b4pmC857IYatEhbiq+kZkSvH/OaJ
	7kj120OjoNTPBaOM+PPBAWB5twSXFQIVdjjj0E8fRjA+eH6Ih0VC47x4PhRiHeEl3M21wlLi2Kzfl
	4Yh5Sg8AjJLM2Pgymd2GyS7dwz5dtvrWW38b/gw4kuADRhyIREqQ5JlrPOWx3gf4lGEbxBgdcUYN/
	q98XW8ODI6w7tAPEHHpxyf9K4PlLFI92PhtU9UuAp5PJNvIFa1FbFgk+JDQk+Qwxd4J3WeCH+iTzc
	kOEHBB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWiw-00000007zcX-45wB;
	Mon, 25 Aug 2025 12:54:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVuL-00000007rXZ-3dDf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:02:43 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3c607029266so1807629f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 05:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756123360; x=1756728160; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJvbqf/yt1tsn43VAwo8VG/RGkLizif52M9SXD1q9EE=;
        b=FXaBEdelv9KE/qBBcsNsbwnIKQQn5B8FUnQWcse23g8N5GNW5YHhEn+UG4nWcodY66
         8kbrY+jYWMg5wQQCq/BCfpFlefSAwL8FTvr2lnotCS8FQVpyLwox5Zfyfl6zQjjx5EdF
         MAzC/is4MZN5Bm5HB1AbajkrMLMh5HHkc8Z1jSVNPFOlBgXX9AFx2x0Kj1v3GfhnXCbJ
         cpQYUop9IvIVvOmcIRn1dYf4DHbZq+tt29WifzZQCw2MjkslEvAdSHHRZP7xRVlSSXMO
         +SoUZWEJt1MQozEhWv7MQvVR01NchHryzSqZkrs0XsjiFVR+SmxpQHPCWJ0P0Co+5le/
         lSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756123360; x=1756728160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJvbqf/yt1tsn43VAwo8VG/RGkLizif52M9SXD1q9EE=;
        b=rVoYZNckT7wTI2XXEHaledf4p8grk9QkzWriAtMNdCJ/oKVgizrTkVNdQiqq5RHUlm
         mYcDNodfmO4Mzd/Bv6O8VKKIMkQQCh7oID49zIVV5Om0yf8ubk4sYkPxix38aiEKpVFu
         TpRqKz4vdVS5Km0oXWbGi3lYod2hundl3/1VNpvGkD6zH0K6hcgq6Ud/bRROQhnBW8Cr
         Z+kKFEEW+MeT1Nx4mbiJ8LZnMRbX1qceB+FBwZT5CXgArIkWmXu1xTJaSJl+fTo1I8VW
         YCqddgevx8tI5Fj12z57EcBimjvgP0FJBqldpPV4pzBYi69zBYfCb3/WsT5p2W+cYyvI
         emSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHyH1TMuRKknh1c9YO3lRW5sjFYb3qKzRDyEfZcR4vMTC1StSultFWn432lUE3IR5l4l/dk2cDMvx7trnVIDHl@lists.infradead.org
X-Gm-Message-State: AOJu0YzBiBy62DXl689XCSNCZ8Y9iyysgZilFqg1PWi7RSub/AzRh8Di
	3SCof0k25KedSklaPk9sjw5K2y4zWMhJ8DIf22+pBGmR86iUoUl2BCDqszg6lpfZix4=
X-Gm-Gg: ASbGncsutdbk69f/Fqfgm1vZfKqSNbjP16f7wy6VA0n6R0oyXKFGCi0gwXsXOfvRHW0
	O6kYcz/yAQUU2SNItzqCBcmcraYPh3D59B4IjsZw8KeJtrVrc8oYsPorN49EhmqfqdssQiT22Eg
	IXb61/vaqQ5MoCPMN+vHx7TrKm/uLzWc3qZQh1G81ZpaATY7HxPVxzWEBiti6WSgN9gmwWMR95D
	Zw17XoOIxFE+hu0qTjqN/m0xflrFpeMA0xmKMvIqZ7Ei3DSxXS/64SGarASf7gSSKiNxsD65+Qq
	T76NTXWuBy7dLgqvuFVXHkb9JijT5g9PCcsX8N9C7/bzn14jwXeaFi/3g4EoiiGrb+2hJucmBfR
	gpbfVVo0nfSX/eqFWPrrabehvqGQV40w=
X-Google-Smtp-Source: AGHT+IHNjJgvFd7vseEGAj3DNMBQJ1GiUVz6n+LYqvwtjb1i5BLxin1zHA6RIo01dWv3lsPQdAUdIQ==
X-Received: by 2002:a05:6000:310b:b0:3a4:f70e:abda with SMTP id ffacd0b85a97d-3c5db8aae86mr8234480f8f.10.1756123360040;
        Mon, 25 Aug 2025 05:02:40 -0700 (PDT)
Received: from [192.168.0.251] ([82.76.204.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711211bd7sm11550954f8f.38.2025.08.25.05.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:02:39 -0700 (PDT)
Message-ID: <c82cb87e-c793-45b1-bfad-fa00fae1d9c7@linaro.org>
Date: Mon, 25 Aug 2025 13:02:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] firmware: exynos-acpm: add DVFS protocol
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-2-6bbd97474671@linaro.org>
 <ca2b3b24-91dd-478f-888e-4f46dd26a672@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <ca2b3b24-91dd-478f-888e-4f46dd26a672@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_050241_918178_F19AB54D 
X-CRM114-Status: GOOD (  15.51  )
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



On 8/24/25 6:11 PM, Krzysztof Kozlowski wrote:
> On 19/08/2025 13:45, Tudor Ambarus wrote:
>> Add ACPM DVFS protocol handler. It constructs DVFS messages that
>> the APM firmware can understand.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/firmware/samsung/Makefile                  |  4 +-
>>  drivers/firmware/samsung/exynos-acpm-dvfs.c        | 85 ++++++++++++++++++++++
>>  drivers/firmware/samsung/exynos-acpm-dvfs.h        | 21 ++++++
>>  drivers/firmware/samsung/exynos-acpm.c             |  5 ++
>>  .../linux/firmware/samsung/exynos-acpm-protocol.h  | 10 +++
>>  5 files changed, 124 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
>> index 7b4c9f6f34f54fd731886d97a615fe1aa97ba9a0..80d4f89b33a9558b68c9083da675c70ec3d05f19 100644
>> --- a/drivers/firmware/samsung/Makefile
>> +++ b/drivers/firmware/samsung/Makefile
>> @@ -1,4 +1,6 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  
>> -acpm-protocol-objs			:= exynos-acpm.o exynos-acpm-pmic.o
>> +acpm-protocol-objs			:= exynos-acpm.o
>> +acpm-protocol-objs			+= exynos-acpm-pmic.o
>> +acpm-protocol-objs			+= exynos-acpm-dvfs.o
>>  obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+= acpm-protocol.o
>> diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ee457c1a3de2ff2e4395d9fc3ff4c13294473b2d
>> --- /dev/null
>> +++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
>> @@ -0,0 +1,85 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright 2020 Samsung Electronics Co., Ltd.
>> + * Copyright 2020 Google LLC.
>> + * Copyright 2025 Linaro Ltd.
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/firmware/samsung/exynos-acpm-protocol.h>
>> +#include <linux/ktime.h>
>> +#include <linux/types.h>
>> +#include <linux/units.h>
>> +
>> +#include "exynos-acpm.h"
>> +#include "exynos-acpm-dvfs.h"
>> +
>> +#define ACPM_DVFS_ID			GENMASK(11, 0)
>> +#define ACPM_DVFS_REQ_TYPE		GENMASK(15, 0)
>> +
>> +enum exynos_acpm_dvfs_func {
>> +	ACPM_DVFS_FREQ_REQ,
>> +	ACPM_DVFS_FREQ_GET,
>> +};
> 
> These are actual values for hardware/firmware? If so, please use rather
> defines.

yes, they are. Will do, thanks!

