Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004ECC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZPLWfXiCCARjQLVMbM6O6mOQhpsqAEIICbBKDhLFXs=; b=QQCp0O75IZ1Xiq6y0Tdm5GGpi9
	XNn6hWiuFPt7mtIAha964drhwop3h/UC0NoBIxCCJNkT8Vu1TG8AdnWvLDIn/brV/CuZ/BKg+XlWw
	TNDnuEsT3FEKQ3Gy9NE5r1PkFGcK4c797bXZdlOS0sLOECQEr4qXIMuo55nk3MT5YHzIgfe+5xCc0
	hAzgi+efXY7nMyaa3zrvIo/Cv7K+AXkYTOcErO0jRAT8aWi68mDy0zb4J5ZyqO6RsOFz+k2WnrnTt
	CwD7J6uzZtSmpElrXP5wlXhyhoMDFj+PPPjBpyd812vVYd24UBQKYuOii7oC9Is+2sCXoG9lurAd0
	cpByqyYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKcE-0000000BbYi-3dCW;
	Thu, 03 Jul 2025 14:08:42 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJ6j-0000000BLFk-36px
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 12:32:06 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-60c4f796446so13348743a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 05:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751545924; x=1752150724; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SZPLWfXiCCARjQLVMbM6O6mOQhpsqAEIICbBKDhLFXs=;
        b=m/q4yQS+FMlEBYP5V/HExLXkO1f4KLt4izq1/6C/1hr4kMAh/nCy46cEwmf3vHaAV3
         sxz5ZdgIPqDfUp1WyJHua4yDZ7+78/tHcgRoImyq9ReBCENE0msVSsAqGWHWycptV8kQ
         +AFbIHPDvI0+4Tkm5OaxXewAZyIJaD+Oa5iB3jWOUwBh+mbj8bMlqDvveRnvVcYDrnWS
         EsPbd4VxI3Uj+PH6TNjw7GqxTAyHD4ou4kjX/s72Q9Akzde2/QALGktQLszBKHd3pEEi
         XHJzT7s3E7MnYuJ4/SsrAAVE68FRfkWD3s1HpalAEzKadxPysAvByo2MllX1mYgT4ZGF
         1+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545924; x=1752150724;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZPLWfXiCCARjQLVMbM6O6mOQhpsqAEIICbBKDhLFXs=;
        b=aTYGcz0kSYExbHRfr0ptUpCjTv3kkRmbNDySY39xPWCKSU4TeevF9t8nnShED8KzyV
         /zIWJNf+pe2MOiBpAsekadCnMsKZkzUX4cutIHYaJjkXqxyhaDyeIShRCk8aOMFldINW
         4v/0NBZfZ09B8prRFGfaYww/37j2gO3EMYAuemm1vDqg5XI1szr6guyL4T//eWQXdMZK
         exOOjC3tVtlkCuTu1jK3VjsBQV8MBraOdqsZhDq7mSUX2Q4dA9zbvFxUOA4DIT4HeIjb
         wf/1JFAZfUvmiAbfPK6BTQC05BfQ5972S7POfgW5jtnG1lxZ8Zr77/X2dTClr1Jvd81p
         OFWw==
X-Forwarded-Encrypted: i=1; AJvYcCUaCf6Idf6eXYHM21KnSwOkAyjXwq/Vb2QLXyJoDx8D9Oa97so5TEWgsEIDoL8CcRLNL2kSBCNvqDsj6RbhqITG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzt/r+4gksLlAdXElqcodZpClkJBEx/mK4jgeRGOQ0j1CfCwvi
	MZ9upiyBnf3gfGhlFzoCk4JgfToukbkQn/KjnjryfHCIXIl5DuIsI3QB
X-Gm-Gg: ASbGncvZH+U1Yi4oC8xfGNUknhDfFPk7TqRqir24z65F6dsVF2mk+8C6+Rkx+UMEUYb
	8kZkWKmBDhXRgx1q/WGy+9gUQy7lfkXxHCLtEU/pt4bkUioIiQ00gPxsyzWdmMp26KxHSInOQVh
	cmEVjLVPVHlvH+chgvtF04i+COnhF+SyTMN2IAU03hWOA+Rm+PY83NaqRSKtBJ8BgK1q5Zd18aF
	A44lev9v8xV7mhnSpDZ4rBtOIGW6qQ8Q1sc3s+6vQn8o7v3zx8IymgATh076ao9iolLxABL1ZPd
	6JHd+hu3kqY2nrFP3/RE8wZuFEBltpKD7IMfsSLDCzF13RphtaopB5fuf3x661yjtjcV8/O7qLB
	Xr0k=
X-Google-Smtp-Source: AGHT+IHuheH2n6bV6dLkCNbg1HG9FS/Kp24cqUOr7wqs04JRCAIlvn2pDbqaGZ7WBJdV42dGc8EYOw==
X-Received: by 2002:a05:6402:238a:b0:60c:44d6:2817 with SMTP id 4fb4d7f45d1cf-60e536053a9mr5295465a12.20.1751545923806;
        Thu, 03 Jul 2025 05:32:03 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8320b5aasm10343175a12.76.2025.07.03.05.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:32:03 -0700 (PDT)
Message-ID: <5fad0945-27a5-4c49-8f20-59c197fc1ba0@gmail.com>
Date: Thu, 3 Jul 2025 15:31:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/24] media: i2c: maxim-serdes: add MAX96717 driver
To: Julien Massot <julien.massot@collabora.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
References: <20250702132104.1537926-1-demonsingur@gmail.com>
 <20250702132104.1537926-19-demonsingur@gmail.com>
 <b591e7daf1e351fbfee181fcce399db08b28faf9.camel@collabora.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <b591e7daf1e351fbfee181fcce399db08b28faf9.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_053205_780956_45781F5B 
X-CRM114-Status: GOOD (  20.84  )
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



On 7/3/25 3:16 PM, Julien Massot wrote:
> On Wed, 2025-07-02 at 16:20 +0300, Cosmin Tanislav wrote:
>> Add a new MAX96717 driver that also supports MAX9295A, MAX96717F and
>> MAX96793.
>>
>> Integrate it with the common serializer framework, while keeping
>> compatibility with existing usecases, avoiding code duplication, and
>> also enabling more features across all chips.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>>   drivers/media/i2c/maxim-serdes/Kconfig    |   16 +
>>   drivers/media/i2c/maxim-serdes/Makefile   |    1 +
>>   drivers/media/i2c/maxim-serdes/max96717.c | 1685 +++++++++++++++++++++
>>   3 files changed, 1702 insertions(+)
>>   create mode 100644 drivers/media/i2c/maxim-serdes/max96717.c
>>
>> diff --git a/drivers/media/i2c/maxim-serdes/Kconfig b/drivers/media/i2c/maxim-serdes/Kconfig
>> index cae1d5a1293e..648cb891eefe 100644
>> --- a/drivers/media/i2c/maxim-serdes/Kconfig
>> +++ b/drivers/media/i2c/maxim-serdes/Kconfig
>> @@ -14,3 +14,19 @@ config VIDEO_MAXIM_SERDES
>>   
>>   	  To compile this driver as a module, choose M here: the module
>>   	  will be called max_serdes.
>> +
>> +config VIDEO_MAX96717
>> +	tristate "Maxim MAX96717 Serializer support"
>> +	depends on COMMON_CLK
>> +	select VIDEO_MAXIM_SERDES
>> +	select GENERIC_PINCONF
>> +	select GENERIC_PINCTRL_GROUPS
>> +	select GENERIC_PINMUX_FUNCTIONS
>> +	select GPIOLIB
>> +	help
>> +	  This driver supports the Maxim MAX9295A, MAX96717, MAX96717F,
>> +	  MAX96793 Serializers, which receive video on a MIPI CSI-2
>> +	  interface and output it on a GMSL2/3 link.
>> +
>> +	  To compile this driver as a module, choose M here: the module
>> +	  will be called max96717.
>> diff --git a/drivers/media/i2c/maxim-serdes/Makefile b/drivers/media/i2c/maxim-serdes/Makefile
>> index b54326a5c81b..04abda6a5437 100644
>> --- a/drivers/media/i2c/maxim-serdes/Makefile
>> +++ b/drivers/media/i2c/maxim-serdes/Makefile
>> @@ -1,3 +1,4 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   max-serdes-objs := max_serdes.o max_ser.o max_des.o
>>   obj-$(CONFIG_VIDEO_MAXIM_SERDES) += max-serdes.o
>> +obj-$(CONFIG_VIDEO_MAX96717) += max96717.o
>> diff --git a/drivers/media/i2c/maxim-serdes/max96717.c b/drivers/media/i2c/maxim-serdes/max96717.c
>> new file mode 100644
>> index 000000000000..60b285e547b7
>> --- /dev/null
>> +++ b/drivers/media/i2c/maxim-serdes/max96717.c
>> @@ -0,0 +1,1685 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Maxim MAX96717 GMSL2 Serializer Driver
>> + *
>> + * Copyright (C) 2025 Analog Devices Inc.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/pinctrl/pinctrl.h>
>> +#include <linux/pinctrl/pinmux.h>
>> +#include <linux/pinctrl/pinconf.h>
>> +#include <linux/pinctrl/pinconf-generic.h>
>> +#include <linux/regmap.h>
>> +
>> +#include "max_ser.h"
>> +
>> +#define MAX96717_REG0				0x0
>> +
>> +#define MAX96717_REG2				0x2
>> +#define MAX96717_REG2_VID_TX_EN_P(p)		BIT(4 + (p))
>> +
>> +#define MAX96717_REG3				0x3
>> +#define MAX96717_REG3_RCLKSEL			GENMASK(1, 0)
>> +#define MAX96717_REG3_RCLK_ALT			BIT(2)
>> +
>> +#define MAX96717_REG6				0x6
>> +#define MAX96717_REG6_RCLKEN			BIT(5)
>> +
>> +#define MAX96717_I2C_2(x)			(0x42 + (x) * 0x2)
>> +#define MAX96717_I2C_2_SRC			GENMASK(7, 1)
>> +
>> +#define MAX96717_I2C_3(x)			(0x43 + (x) * 0x2)
>> +#define MAX96717_I2C_3_DST			GENMASK(7, 1)
>> +
>> +#define MAX96717_TX3(p)				(0x53 + (p) * 0x4)
>> +#define MAX96717_TX3_TX_STR_SEL			GENMASK(1, 0)
>> +
>> +#define MAX96717_VIDEO_TX0(p)			(0x100 + (p) * 0x8)
> This is a bit confusing, looks like this register address is valid for MAX9295a VIDEO_TX0
> but not for MAX96717, VIDEO_TX0 (Z) is at 0x110.
> 

See pipe_hw_ids field of max96717_chip_info.
MAX9295A has pipes 0, 1, 2, 3, MAX96717 has pipe 2 only.
Registers and strides are the same, just pipes are missing.

> 
> 


