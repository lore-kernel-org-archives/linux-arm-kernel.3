Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4DECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvJwbcOsjvAx4Cb95HKEUrId4UgDZ83tfHPDy6XNbLM=; b=VCfmPcnlDAvXchVB93+mTjv4lp
	yZ/+BpuT/d0xRNey3e63pE163OmH0Dhf380s2ptiN2z5n5DHc2rt9CCMYRhPkh7EKrthvdv9zywKJ
	7PzITjK/XLJ4VHPy99D6fz+SbhtM79aN2pKuB0bvfpkDmvbxEphUEnSmwlMklbRdnR+LBZpLh+NXQ
	ceJGxl2JDpWAuFRbL8gSWv60rBMErbJmj4w6Ao9jQMDljTQ7WprInS6hKouZ9vxPvpuPFpYuaUHst
	4a5yU0Sx/KCAHERaJnFNhXVp/9O9Wdyzqs0GLF9XABnx0Dxzy22ddaxTzxSW+Yg9DEurfx720UMKD
	0gmPhguw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTmS-0000000326m-0kLy;
	Fri, 22 Aug 2025 15:34:16 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upM51-00000001niw-385g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 07:20:57 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3c51f0158d8so1058497f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 00:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755847254; x=1756452054; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IvJwbcOsjvAx4Cb95HKEUrId4UgDZ83tfHPDy6XNbLM=;
        b=jn2LvbFX+VsL2qiUryI0w2AQpi+s6ty2Tj2Rny1sBJ1AbwnkDHfnrSIQKrNzgGKLhp
         ZJm7Guz7d4xVIZjswH4+hkMKG+N5Nw/ZImTg2hUmE4Impk4kmBFo4eVyVdKDvdq8hlZd
         cZM6HA9TFPXD/ZdkzkDcsGqcNM9MnE6BhsGjDr8AZAvU0vqUXiwCICPYOf5q2wrmsjAj
         VDzaxkw4yJoDZLPGnzzpVOwiLC8h/n7R/vCTudq4sXUUTlLpYUbQ8H+34RqtPjdJD10Z
         Bg3UAq7tv/4kbW4L3QgeAst1p3qgB6TjXMSIkP9Thv26gF282v82jusN7tCM6FwQIBN5
         wLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755847254; x=1756452054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvJwbcOsjvAx4Cb95HKEUrId4UgDZ83tfHPDy6XNbLM=;
        b=wdCR+K2cn+Z2NkX0CmAUyAkh3BQlieVVmCflcnWKcMLsbHZNssTSmjWduC1nvz3yPq
         b1ttKCDDOkt3oQbD4+TMGU7TX7f/NywlgZI1CwxfmDW5XqNRU+31CQKZGQgjU4l1CYlK
         dZpsQnVwDTrXEE7T2bvkqFHTbze0GKMG/hfw25FCoLnuOg4FmycmB8Obh8YmzAkj26De
         bMVBlJ3KhnaF3guk/ih4Zo+R2tVAI/X9JxquhofpJFA8/Pp5JGewNTafWgSFjMrjB/1o
         gDH5EHRYB//oMf7yw9a2x9cREMFJ2JsCxo8uswBJgCDpkn6shzSCDRFHIe2GZDjndlDI
         OdkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpp8rNX7CG5lZOarMTv7yUek5UFaQYNIoSpdnQlzKM0UiIDe/MJiAfqBf/FLGW2nsgFMOO4UBArzjEhNYcbMBR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8CZ0krWxqDVyj2YOEAg4zq2e4Do7kFV1KZ2HkGs90upTwkK9o
	+BH7EMIA7ynyVcBoa8APbL287r4LJ7YSgf2mcZFZCW0BhQW1as6UQOsZmyzP3/36QXw=
X-Gm-Gg: ASbGncvsdFPl0OIL+K4fyfnNn9qABCtSqLRE20a7vaewKo3qzuvY5DJnEExt8wbJULM
	ahMDhDT9aMkmXpR8R1QcSMyErB27IVYOFITQC0w3oGb3d2apHKJGp0a3Q5RaAmfSmG9SmGttqMa
	azlYlNW0JpfT7Hncv0SdnbvQ38N/5+Fspo8gX/sJUdfyOhCL7xyGXwwhzkhn0LZzHf3Fq+r0ZIc
	TMXThP2ICPD4PYHTjn+h9P2srxqwsu6pCXzavywpw8Nznkgn9kVH2oaKL3ICyhz3el+ewV+B1CT
	wxGr/LoalN2FKPcCizcHgCICJc3DNZ9vjaSnUO4Cc8aBLHfKa3kz9+ATJ1Knqa7NuF1yYNLt0Er
	PtlfNMpGt2JTzY20H2RtDoslzRzArhLPbQoPvvTjrPT1sfKOwvwKwK8H57kEiTSpsZXPiZwxOaB
	pwgJFltw==
X-Google-Smtp-Source: AGHT+IFLbHL5Jfp1HiEMgBzb/cWVZllJl0fqqVCyRz90kU9u6d+rKWlXzqxgMmKXZyGMMiOGZn0oyA==
X-Received: by 2002:a5d:5f4e:0:b0:3c0:7e02:67b9 with SMTP id ffacd0b85a97d-3c5dcefeda4mr1234311f8f.61.1755847253747;
        Fri, 22 Aug 2025 00:20:53 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077c576b7sm14060427f8f.63.2025.08.22.00.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:20:53 -0700 (PDT)
Date: Fri, 22 Aug 2025 08:20:50 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	MaudSpieringsmaudspierings@gocontroll.com
Subject: Re: [PATCH v2 2/4] backlight: add max25014atg backlight
Message-ID: <aKgaUtcNoOsga6l7@aspen.lan>
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-2-5fd7aeb141ea@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-max25014-v2-2-5fd7aeb141ea@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_002056_024546_F08A8916 
X-CRM114-Status: GOOD (  17.92  )
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

On Tue, Aug 19, 2025 at 12:59:00PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
>
> Signed-off-by: Maud Spierings maudspierings@gocontroll.com

Looking good but still a few small comments (below).


> diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..fe5e0615cf6d151868b56ebb9544b175b09dfcee
> --- /dev/null
> +++ b/drivers/video/backlight/max25014.c
> @@ -0,0 +1,395 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Backlight driver for Maxim MAX25014
> + *
> + * Copyright (C) 2025 GOcontroll B.V.
> + * Author: Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define MAX25014_ISET_DEFAULT_100 11
> +#define MAX_BRIGHTNESS (100)
> +#define MIN_BRIGHTNESS (0)
> +#define TON_MAX (130720) /* @153Hz */
> +#define TON_STEP (1307) /* @153Hz */
> +#define TON_MIN (0)
> +
> +#define MAX25014_DEV_ID         (0x00)
> +#define MAX25014_REV_ID         (0x01)
> +#define MAX25014_ISET           (0x02)
> +#define MAX25014_IMODE          (0x03)
> +#define MAX25014_TON1H          (0x04)
> +#define MAX25014_TON1L          (0x05)
> +#define MAX25014_TON2H          (0x06)
> +#define MAX25014_TON2L          (0x07)
> +#define MAX25014_TON3H          (0x08)
> +#define MAX25014_TON3L          (0x09)
> +#define MAX25014_TON4H          (0x0A)
> +#define MAX25014_TON4L          (0x0B)
> +#define MAX25014_TON_1_4_LSB    (0x0C)
> +#define MAX25014_SETTING        (0x12)
> +#define MAX25014_DISABLE        (0x13)
> +#define MAX25014_BSTMON         (0x14)
> +#define MAX25014_IOUT1          (0x15)
> +#define MAX25014_IOUT2          (0x16)
> +#define MAX25014_IOUT3          (0x17)
> +#define MAX25014_IOUT4          (0x18)
> +#define MAX25014_OPEN           (0x1B)
> +#define MAX25014_SHORT_GND      (0x1C)
> +#define MAX25014_SHORT_LED      (0x1D)
> +#define MAX25014_MASK           (0x1E)
> +#define MAX25014_DIAG           (0x1F)

There is no need to put raw numbers in brackets.


> +
> +#define MAX25014_IMODE_HDIM     BIT(2)
> +#define MAX25014_ISET_ENABLE    BIT(5)
> +#define MAX25014_ISET_PSEN      BIT(4)
> +#define MAX25014_DIAG_HW_RST    BIT(2)
> +#define MAX25014_SETTING_FPWM   GENMASK(6, 4)
> +
> +struct max25014 {
> +	struct i2c_client *client;
> +	struct backlight_device *bl;
> +	struct regmap *regmap;
> +	struct max25014_platform_data *pdata;

This appears to be unused.


> +	struct gpio_desc *enable;
> +	struct regulator *vin; /* regulator for boost converter Vin rail */
> +	uint32_t initial_brightness;

It is important to keep the initial_brightness for the lifetime of the
driver?

> +	uint32_t iset;
> +	uint8_t strings_mask;
> +};
> +


Daniel.

