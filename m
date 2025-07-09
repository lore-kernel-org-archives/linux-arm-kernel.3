Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5406CC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1D9TwGh17RlyeehN+XNynud5RnHK/6z3R9+XwZOImI=; b=2hOtylffUWTtqtMCsIIrMewTBT
	aKiJKUh2XA6r0WrH9m3Os2DTeY2OCt8hL0G9N8TM+M6+284q0cH3aTMBaqAXwPLg/3/0t5x94Nooi
	jzsDnWZkK6Ez9Qrh7lU1AMWxLtAcLOfsA5ptWddOlYp0MFxEp7nZoZ4Rtd7Xmh8zBAY3QQHbmecVd
	yfkeMMbYlkBXAaPlxSiw4upwfYnruwdH3hxr38Hq4GgPOeDY0LXnieQqfuBEMTGB2opIPVqFDHxJW
	C8Isr4QEGzSR9kRHFvRa0lQltD5PgxVhR2zbs8DdztmVa79n6c1Cp/pBzZNmMHOjEUtdPbh3VGrUL
	7cPkuL0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXQw-00000009I6Y-1efg;
	Wed, 09 Jul 2025 16:14:10 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVfW-00000008xOZ-0m2a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752070866; x=1783606866;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CHnl2dn+aVri4wo5LCKGLJbuGJ6Wteg3asFoEH+a+Pk=;
  b=XPerXqjoFG6X7u+nJORKy9VK3DFL6U2YgsycdOQyCQJjl58cVUHBIGOQ
   oQ9NSG9b+vTkrx+/SqrWXCy0+a5nNhgRK+fn3KGrabC6pP+1+9va6DKAW
   /Kq5sWGZcCUxOGUCaYg7Dh+uIcYTlySmm8r6+KAvnXbwPU7YT8Uofzp6v
   5FXdJygXakvpkAM4oh+vszsd27Lt3zgBN6blEmvDlz3/ks2U85bQrMOMv
   aeBUZUPLrpSLz1RFY7JKWRYmEC+4wxsZ9iR8ukYmV1n/SRcI7VOXYi97O
   5vcuKgnjb+HEeKXOBaI3SrYNovns9d3focy7e2/V7UvggPUlS9S8cuhpP
   g==;
X-CSE-ConnectionGUID: 43CnTrxRQnim4lvIZAegeQ==
X-CSE-MsgGUID: Zsxgfu/aQeK0HqCxATBfqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54478763"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54478763"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 07:21:02 -0700
X-CSE-ConnectionGUID: h++JGzHmRkuyD3PTYHa4uA==
X-CSE-MsgGUID: x04SK+l3TlOOOFtScIictg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="156273334"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 07:21:03 -0700
Received: from [10.124.221.108] (unknown [10.124.221.108])
	by linux.intel.com (Postfix) with ESMTP id 9123A20B571C;
	Wed,  9 Jul 2025 07:21:01 -0700 (PDT)
Message-ID: <ec773987-b6d8-4fe9-bca9-a41009f27d80@linux.intel.com>
Date: Wed, 9 Jul 2025 07:21:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/19] gpio: wcove: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek
 <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
 <20250709-gpiochip-set-rv-gpio-remaining-v1-4-b8950f69618d@linaro.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-4-b8950f69618d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_072106_240414_6EE0E481 
X-CRM114-Status: GOOD (  18.05  )
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


On 7/8/25 11:41 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Looks good.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/gpio/gpio-wcove.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
> index 1ec24f6f9300f33f5b3f0f8deb539e08392b8188..c50b74ced6364e3c3cfbe9ed385d21c80a2bb2e7 100644
> --- a/drivers/gpio/gpio-wcove.c
> +++ b/drivers/gpio/gpio-wcove.c
> @@ -200,18 +200,18 @@ static int wcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
>   	return val & 0x1;
>   }
>   
> -static void wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
> +static int wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>   {
>   	struct wcove_gpio *wg = gpiochip_get_data(chip);
>   	int reg = to_reg(gpio, CTRL_OUT);
>   
>   	if (reg < 0)
> -		return;
> +		return 0;
>   
>   	if (value)
> -		regmap_set_bits(wg->regmap, reg, 1);
> -	else
> -		regmap_clear_bits(wg->regmap, reg, 1);
> +		return regmap_set_bits(wg->regmap, reg, 1);
> +
> +	return regmap_clear_bits(wg->regmap, reg, 1);
>   }
>   
>   static int wcove_gpio_set_config(struct gpio_chip *chip, unsigned int gpio,
> @@ -442,7 +442,7 @@ static int wcove_gpio_probe(struct platform_device *pdev)
>   	wg->chip.direction_output = wcove_gpio_dir_out;
>   	wg->chip.get_direction = wcove_gpio_get_direction;
>   	wg->chip.get = wcove_gpio_get;
> -	wg->chip.set = wcove_gpio_set;
> +	wg->chip.set_rv = wcove_gpio_set;
>   	wg->chip.set_config = wcove_gpio_set_config;
>   	wg->chip.base = -1;
>   	wg->chip.ngpio = WCOVE_VGPIO_NUM;
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


