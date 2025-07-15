Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A22C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 15:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahX+c8vAAgZZo6vfcQjtOUNKD1iNEcYm/d3IzA1fxo8=; b=WHj4fih6wDCzJNVDa80sDCyJHk
	+vXhSphWmC1iSPlJE5wMPoh59qIJUDZbwWzZ156SD1FOPk9HfueaGi3rKznYSXlHRgBaN8F73jB7H
	qIQMtt2wqx5lowrZsYr2jWBIqbFoECDdIRXvNHdVkA6YyNQUrkdgg5qgwSbhP0EqIO0YUr9UDCm42
	V5G5JUuda/DXpjop8B1OQFlIFNNkHi6hOT8jHSny9LLpxpPLDg4Pr/h/YM8szjqCFhZKA6DRON5Ey
	DEaO6G3xPMtLc8dOE1/IyRXKGWGtTBZcSGyRcwqj184FCHbCXO2GlDidn3qXUtDiu5aNC9HW1XVaJ
	KfPePEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhCq-00000005WM6-0B7Z;
	Tue, 15 Jul 2025 15:04:32 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfio-00000005DFH-133C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752586166; x=1784122166;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IS0zMYjCeG1sUzA/o870BnonfbFqvWBqq05l3BrL5EM=;
  b=mWzXnCYW45f3rIaQoOQSmm6cp/J8Bc6bPVfafFexIy5muJcVRZFmNKZ0
   XZrX+IUYsRrr1XNGA9lRTb7YiKMkSsPQwyzOvZvVK2/920/8cW8rMMW8p
   DEg2/MlW7yJk75ALmB+a6Ne8utUuHoN/AC0iwaTBbFQ9ZaWXMq7MVJj2u
   7Ia7mdKjAI4t+7jB676VkxUim4nXnC55k70ZusqRoMxPq/XeVIqXxgY+c
   0y+mkZfR2yyRcWcKP8OEHK0FlNDYVoG4Hj+Fa6W6Yn1sdHw/8teSCo3BD
   hUEg6vPCcmrduel3VZxnxUUSPhlGYoLsKP8d/B3I+6kDUiYN7AsBnDgVU
   w==;
X-CSE-ConnectionGUID: mNsjdBI7R9uUaT0d2j7+cA==
X-CSE-MsgGUID: YKHMXQ3dSp2TJHMGBPzYbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54023337"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54023337"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 06:29:22 -0700
X-CSE-ConnectionGUID: tExs557lSFySzJsjo1bguQ==
X-CSE-MsgGUID: /N6sNHUsRACGHIy570/EYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="161534986"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 06:29:21 -0700
Received: from [10.124.223.222] (unknown [10.124.223.222])
	by linux.intel.com (Postfix) with ESMTP id 5FCBC20B571C;
	Tue, 15 Jul 2025 06:29:20 -0700 (PDT)
Message-ID: <3357db65-279f-4f43-880a-966b10e10287@linux.intel.com>
Date: Tue, 15 Jul 2025 06:29:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpio: wcove: use regmap_assign_bits() in .set()
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
 <20250715-gpiochip-set-rv-gpio-remaining-v2-1-072b4cf06330@linaro.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250715-gpiochip-set-rv-gpio-remaining-v2-1-072b4cf06330@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_062926_350213_3765A13C 
X-CRM114-Status: GOOD (  14.84  )
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


On 7/15/25 1:19 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Replace the if-else with a direct call to the regmap_assign_bits()
> helper and save a couple lines of code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/gpio/gpio-wcove.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
> index 1ec24f6f9300f33f5b3f0f8deb539e08392b8188..816fb8d113e66b27070f286755f3192b2a8f8512 100644
> --- a/drivers/gpio/gpio-wcove.c
> +++ b/drivers/gpio/gpio-wcove.c
> @@ -208,10 +208,7 @@ static void wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>   	if (reg < 0)
>   		return;
>   
> -	if (value)
> -		regmap_set_bits(wg->regmap, reg, 1);
> -	else
> -		regmap_clear_bits(wg->regmap, reg, 1);
> +	regmap_assign_bits(wg->regmap, reg, 1, value);
>   }
>   
>   static int wcove_gpio_set_config(struct gpio_chip *chip, unsigned int gpio,
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


