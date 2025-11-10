Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0096CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhp4YgfhsRZMzX8NUUCQPo90BZ3bChzDwUAKuvs0tfk=; b=0AmAhOwauREo/FhX4jTPqbs1kM
	xXPHxODk1PbiZGi65nwzXdmYtXiFKFeFSfSBRlI1OZp2dr3xQ75r8SNiVKNkh8saDhlXZUOnsQRaP
	62J6PaCMoyoNl/B8GwoxGUs/P7xGyz84fZFOBlRgmEa/Uq1Y8/Th+l8QSXeU6Aqrv2jQqZO9OlAxv
	ix6ycZE1qA7LOiINSpl1E5fE4ginRess+vOH7uv+EOVWOha8Hr8oQnRrsEabEVtF23XpLQLJ9Vc6S
	nVVAI92++TxHdP5oZ/rn1RST8si+EbUxUj3HD6Qfqemujvw6PHrYn6FYGmptQ7Gm5HJSz8PBdHQS1
	h3ivkhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOZn-0000000586l-2xkZ;
	Mon, 10 Nov 2025 09:52:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOZk-0000000586F-3Gl0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:52:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so17382125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762768359; x=1763373159; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rhp4YgfhsRZMzX8NUUCQPo90BZ3bChzDwUAKuvs0tfk=;
        b=In79emh4WaFhso/KFVD5taorQ9V2fUApNKyCnrn/AHjRB0ADnuZ0aPDxHOtkJvLUE2
         Z8nEaN8AmucvRHQ6qCr9uEVC03zOD3VnzUZ2dEUc+DZlUNIVbqTfrw2rLFlORaIgkCRd
         bP1vD0NngLhclKbJWEoeNG2gFQhrQWoXO9i0QEIQIwv/+7e+m/HEB27hCa/Y26F1WW4X
         YgZhvWpkXQiQfl3/aYtKEYTa6xRmLm6JzQdQ6p4LqxbO2DLs+/Doq5gb8YlJ+sqjnXt0
         tRQwBu01V8VdfUJOg/DuiOgLZD+GdwWOzjKhckbpbV+Immpu2PSyLLPaQpfwdCJwlnUv
         fS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762768359; x=1763373159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhp4YgfhsRZMzX8NUUCQPo90BZ3bChzDwUAKuvs0tfk=;
        b=w9Krj/k0jISmNTCkoqC1D8peA8JfxjZOpkI9n/6t97HU1t/A6iL6JGX+/ONE0IpQbA
         7KLnP+pAGhPJVJ/Uh2Q1mpzIzmnu/xr35fOua8G34r6KiWlS/cEwPmp/IvKOvHjmThzX
         bR/eJKvwr5xPbhJB4ZQnzrRa9VhKmYiCo9zQDXGQuGO4g8DfJfzxi6TJroLWe3vBHXM9
         TPvOpPvRSOUfOG4QB0qhavM8zs+BukFe8WCi+AInw3/yRDUX+RgFRP+B1QCHKw+TdVyf
         +Bl1ijjA7akeGu8P/hoe8l3VqMK8p60BVKceT+Z+ZsHyPyejUCe6vrgzqmEE5KBkVv1w
         7LvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsQLR8u0VS4/k6m6xeUO9u+gjZECtXoQbgFUH7Tr+oBPUpckNqaimE2zXkGdUkCyDDQ/+Bf2LAynmDKxrEkRTc@lists.infradead.org
X-Gm-Message-State: AOJu0Yydc2lC2e7hFw166egp50r+tsa/zeILn1JJEatWTLWRJMfN9YF4
	pj8JdUMqNt3MIeKK49HxUEoQ4qRtF+TdpSGrO984QQKGTUK4TutOSeLA5RjrLX+eQ8E=
X-Gm-Gg: ASbGnct+kHdtTukccRLexVn8r8V875CwAdO/cC2Wo+tJ8PC01lhzB2idzh9ix4YLajH
	RB8S8cn5t/OqLT4mMc98j44r2Cz8fyQxikNqaJFtXaw4S4fNmGrgTTS1Vwt8YYRCI6m78ijPpVH
	0ry/1n5p5SQFI4lRBy2SAvKLuY+0ymBs12rZGhP/pymdE2RfEBFlH+Fv2SIyKpIiyJi0xavZNS+
	KIVfPqURRzP0dGqun3k1FWutSSz1McKIuTy1Nv/HW+4cGF8kWZbHRfqVFlaEhpXb2OyuxQos3ou
	AvfpkELaRzH+50sKMFnTvtduBH5RM224ZszoYJHZ+UyvJeQi2kWigzr9CoYkFlrfDAbHTSGAG/b
	6UC0u8r1F9zIAHv/jDyPRBqowsIb7cLqlGup1empwSWCc04E9hd7q3nSCGSUdycXLmmSoXCEktg
	lSFFfJxA==
X-Google-Smtp-Source: AGHT+IHCMEptRrO3Xd4sJVJqG0K81DdTzjfPzWE+SEpDSUp7i+llvbmd/DfdXqcN55ZcAaess9TJ5w==
X-Received: by 2002:a05:600c:3011:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-477797535a8mr26023715e9.29.1762768358611;
        Mon, 10 Nov 2025 01:52:38 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47774df2d80sm121261635e9.14.2025.11.10.01.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:52:38 -0800 (PST)
Message-ID: <513678ee-b93d-40a4-a565-ca6ae41bdde7@linaro.org>
Date: Mon, 10 Nov 2025 11:52:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] nvmem: add Samsung Exynos OTP support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
 <20251031-gs101-otp-v1-2-2a54f6c4e7b6@linaro.org>
 <93d5636b-a515-4976-b68c-9606924eab8f@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <93d5636b-a515-4976-b68c-9606924eab8f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_015240_860033_41B1D9FC 
X-CRM114-Status: GOOD (  28.05  )
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



On 11/4/25 9:19 AM, Krzysztof Kozlowski wrote:
> On 31/10/2025 13:45, Tudor Ambarus wrote:
>> Add support for the Samsung Exynos OTP controller. On the Google GS101
>> SoC, this controller provides 32 Kbit of OTP memory space that can be
>> read/program/lock using a specific sequence of register accesses.
>>
>> The OTP controller register space is of interest as well because it
>> contains dedicated registers for the Product ID and the Chip ID (apart
>> other things like TMU or ASV info). Register the OTP controller
>> register space as a nvmem device so that other drivers can access its
>> contents using nvmem cells.
>>
>> Support for the OTP memory space can follow and be modeled as a
>> dedicated nvmem device.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/nvmem/Kconfig      | 10 +++++
>>  drivers/nvmem/Makefile     |  2 +
>>  drivers/nvmem/exynos-otp.c | 98 ++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 110 insertions(+)
>>
>> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
>> index e0d88d3199c11a3b71cc274b2114e9554ac486fc..f973e009737f2fbdc8511e50f1aa9e6003286065 100644
>> --- a/drivers/nvmem/Kconfig
>> +++ b/drivers/nvmem/Kconfig
>> @@ -84,6 +84,16 @@ config NVMEM_BRCM_NVRAM
>>  	  This driver provides support for Broadcom's NVRAM that can be accessed
>>  	  using I/O mapping.
>>  
>> +config NVMEM_EXYNOS_OTP
>> +	tristate "Samsung Exynos OTP support"
>> +	depends on ARCH_EXYNOS || COMPILE_TEST
>> +	help
>> +	  This driver provides support for the OTP controller found on some
>> +	  Samsung Exynos SoCs.
>> +
>> +	  This driver can also be built as a module. If so, the module
>> +	  will be called exynos-otp.
>> +
>>  config NVMEM_IMX_IIM
>>  	tristate "i.MX IC Identification Module support"
>>  	depends on ARCH_MXC || COMPILE_TEST
>> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
>> index 70a4464dcb1e25cf9116280a32f4a0f4f9941a75..920a536fc359a5a7d8f3aabba6a712e85c277ee7 100644
>> --- a/drivers/nvmem/Makefile
>> +++ b/drivers/nvmem/Makefile
>> @@ -20,6 +20,8 @@ obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o
>>  nvmem-bcm-ocotp-y			:= bcm-ocotp.o
>>  obj-$(CONFIG_NVMEM_BRCM_NVRAM)		+= nvmem_brcm_nvram.o
>>  nvmem_brcm_nvram-y			:= brcm_nvram.o
>> +obj-$(CONFIG_NVMEM_EXYNOS_OTP)		+= nvmem-exynos-otp.o
>> +nvmem-exynos-otp-y			:= exynos-otp.o
>>  obj-$(CONFIG_NVMEM_IMX_IIM)		+= nvmem-imx-iim.o
>>  nvmem-imx-iim-y				:= imx-iim.o
>>  obj-$(CONFIG_NVMEM_IMX_OCOTP)		+= nvmem-imx-ocotp.o
>> diff --git a/drivers/nvmem/exynos-otp.c b/drivers/nvmem/exynos-otp.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3bff9421e6f2b80a8f20533b490a289687d117e8
>> --- /dev/null
>> +++ b/drivers/nvmem/exynos-otp.c
>> @@ -0,0 +1,98 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright 2025 Linaro Ltd.
>> + *
>> + * Samsung Exynos OTP driver.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/ioport.h>
>> +#include <linux/module.h>
>> +#include <linux/nvmem-provider.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/mod_devicetable.h>
>> +
>> +struct exynos_otp {
>> +	struct clk *pclk;
>> +	struct regmap *regmap;
>> +};
>> +
>> +static int exynos_otp_read(void *context, unsigned int offset, void *val,
>> +			   size_t bytes)
>> +{
>> +	struct exynos_otp *eotp = context;
>> +
>> +	return regmap_bulk_read(eotp->regmap, offset, val, bytes / 4);
> 
> 
> So you are just reading MMIO and pretending this is NVMEM?

Right. I thought of registering the OTP register space as a nvmem
device, so that consumers can read it. The OTP memory space (32Kbit,
the one accessed via OTP commands) can then be registered as another
nvmem device.

> 
> Is it possible to actually do the other actions from your commit msg
> "read/program/lock"? If not, then you just created NVMEM abstraction

It is possible to add support for the OTP memory space (32Kbit) and model
it as a nvmem device, but I don't really care about it because downstream
does not use the OTP memory space in the kernel.

I now think that the correct way to handle the chipid for gs101 is to
register to the SoC interface directly from the efuse driver. Support
for the OTP memory space can come later on if needed, I don't really need
to register any nvmem space for now.

Thanks,
ta

> over existing chipid completely duplicating the driver (with more
> translation layers).
> 
> Best regards,
> Krzysztof

