Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3D3CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSNeLXOTTtx1jiH7gbagvP3wzyOrWOl7dY+YqOglVMY=; b=XvN3d7AX+yWltWqq8SiS+rBM9x
	HibADu0LcEEpHTdNGtM3KKMpDMZF9pcGa9kG8gwKGIsGmeASxzBlbQ9bxBl81pCzWJTcI0vP/tjqj
	TwdLMYHbnYkNnJpL4BNNkfl/9vOkxUVQd0gQu6gQyOFAcNmF6bjI8q6FTIJbUQrbkaeA5eDVOpS1w
	o8I0QgM7csd6X9m2U+QcVBiYXqp/Azj0kA2vtyJG20vFKOUbCNB/zhaYlFjIdht+eSo72ESqnPcgH
	lbRo4967bcJqKKlV2Q9lknwwqibZsAwfXS94uhHPRB40NJSdjV0BnU+KCu///w8rZfeMyfyNn81NC
	3MiwsEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0Qn-0000000FdkW-0ZvJ;
	Thu, 06 Nov 2025 13:53:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0Ql-0000000Fdk2-0927
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B65D843272;
	Thu,  6 Nov 2025 13:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C72C4CEFB;
	Thu,  6 Nov 2025 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762437218;
	bh=qcQmnaysazEGwAaCAXfwCY+ui93J1l78Y+j7goEWMJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/B2+GtcbfxHYrwm8y9iKwVHm3brmqcyvJtf4kiAdXrQDv1jwhYUcTEgaaUtro6s0
	 o5VrpCW2Rju2WAsXureWRM+JhsrHxM+pBN4wLQVW2lonyMvfzgZJKiNHhifzSY7wt/
	 PhIv8p4oNEq8+U8/zZ84jDmu5ataeLN4CvNqXhqpq/n0D95018PTYjFlsC8Tvt0iW6
	 lFfWNyXVb8yhjgd0vYXnjOAHkfjdxK+aQkd1xrgZcclFjSbvvf3p8E5KrLg7FfboCg
	 3dKl+jQSzofaYCalbwQFv8FKaevex9OtCiic+efn2dU9bPa8oJ3g+/IzfVFSU5/hmQ
	 reEPNN+OZK3mQ==
Date: Thu, 6 Nov 2025 13:53:31 +0000
From: Lee Jones <lee@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v4 08/11] input: macsmc-input: New driver to handle the
 Apple Mac SMC buttons/lid
Message-ID: <20251106135331.GN8064@google.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
 <20251025-macsmc-subdevs-v4-8-374d5c9eba0e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025-macsmc-subdevs-v4-8-374d5c9eba0e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_055339_112133_DE5C2A9E 
X-CRM114-Status: GOOD (  25.66  )
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

On Sat, 25 Oct 2025, James Calligeros wrote:

> From: Hector Martin <marcan@marcan.st>
> 
> This driver implements power button and lid switch support for Apple Mac
> devices using SMC controllers driven by the macsmc driver.
> 
> In addition to basic input support, this also responds to the final
> shutdown warning (when the power button is held down long enough) by
> doing an emergency kernel poweroff. This allows the NVMe controller to
> be cleanly shut down, which prevents data loss for in-cache data.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Sven Peter <sven@kernel.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  MAINTAINERS                       |   1 +
>  drivers/input/misc/Kconfig        |  11 ++
>  drivers/input/misc/Makefile       |   1 +
>  drivers/input/misc/macsmc-input.c | 208 +++++++++++++++++++++++++
>  4 files changed, 221 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 79b9f40224a9..e8283f127f11 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2451,6 +2451,7 @@ F:	drivers/hwmon/macsmc-hwmon.c
>  F:	drivers/pmdomain/apple/
>  F:	drivers/i2c/busses/i2c-pasemi-core.c
>  F:	drivers/i2c/busses/i2c-pasemi-platform.c
> +F:	drivers/input/misc/macsmc-input.c
>  F:	drivers/input/touchscreen/apple_z2.c
>  F:	drivers/iommu/apple-dart.c
>  F:	drivers/iommu/io-pgtable-dart.c
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 0e6b49fb54bc..109660a1a5d2 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -981,4 +981,15 @@ config INPUT_STPMIC1_ONKEY
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called stpmic1_onkey.
>  
> +config INPUT_MACSMC
> +	tristate "Apple Mac SMC lid/buttons"
> +	depends on MFD_MACSMC
> +	help
> +	  Say Y here if you want to use the input events delivered via the
> +	  SMC controller on Apple Mac machines using the macsmc driver.
> +	  This includes lid open/close and the power button.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called macsmc-input.
> +
>  endif
> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> index ae857c24f48e..480a0d08d4ae 100644
> --- a/drivers/input/misc/Makefile
> +++ b/drivers/input/misc/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_INPUT_IQS7222)		+= iqs7222.o
>  obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
>  obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
>  obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
> +obj-$(CONFIG_INPUT_MACSMC_INPUT)	+= macsmc-input.o
>  obj-$(CONFIG_INPUT_MAX7360_ROTARY)	+= max7360-rotary.o
>  obj-$(CONFIG_INPUT_MAX77650_ONKEY)	+= max77650-onkey.o
>  obj-$(CONFIG_INPUT_MAX77693_HAPTIC)	+= max77693-haptic.o
> diff --git a/drivers/input/misc/macsmc-input.c b/drivers/input/misc/macsmc-input.c
> new file mode 100644
> index 000000000000..d35322856526
> --- /dev/null
> +++ b/drivers/input/misc/macsmc-input.c
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple SMC input event driver
> + * Copyright The Asahi Linux Contributors
> + *
> + * This driver exposes certain events from the SMC as an input device.
> + * This includes the lid open/close and power button notifications.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/input.h>
> +#include <linux/mfd/core.h>

This looks like it shouldn't be there.

> +#include <linux/mfd/macsmc.h>
> +#include <linux/module.h>
> +#include <linux/reboot.h>

-- 
Lee Jones [李琼斯]

