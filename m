Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9175CD2E9D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 10:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXW10J5D9gWltXu/GmAM+0Z0JJYb/7PohclGDYO/OfU=; b=STrboymYP6zksh5jTF9v97Vtnz
	70UMfCbPrc7zcx8lb8l4QnheGMuL9/SHaPQF4dNUp6I0GQI+S2ykl3pfCr0PNjwqVxVgQ9MfR+r5l
	ZAVAIm1/Iit8wSQ+sIrhUX2pN8jKgRx8vzFt5SjH6YOlhlgSxTUcuzr3sQMzy/4FALlYZfp6xKJwy
	Hp/uBURu0Y/GmT2Vk9heVEXmJyNB31Pkj1GUM0tk14eIeyJAvnEpbT6TmFzmr1imzGQ67O5WQe9mb
	NZjfIDSShFgdiva8OAOLp21to1qR4GbjoDmd6GTn8SQP2doY5TECs2b5oOTP80Mc0DVmlEpzvQarb
	1P0vxW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARGO-0000000HD7i-2Zjn;
	Mon, 11 Nov 2024 10:03:16 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAR22-0000000HAhJ-1L3O;
	Mon, 11 Nov 2024 09:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731318507; x=1762854507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dnK1S3CmbMpjkJBTDuGbtVP12MBQ7Sg1Q3hSdde0Z1g=;
  b=c74paN/maO/b+rMTBuONxNBM8ufCpah7Efidlc7fvRyTzAfiAUuYr4Oj
   uMGX7viMej2WrI20MzAkGCY+lZrPVm8uMWMG7wmt4MJv2VtuDjyagNUMw
   X0z6Zpc6qgQHsK3sIjXrvk1Z03GYzW2B/HrIJT1ipoXNPgca3E8HowQiq
   S+598PQnoK7AMCaZOsXPTSXuqo9UZGz7l8mzVql/LlVKMApqoFL+XaXg3
   n3zr0S8mhaxYjU98rKC4dOSeFnUURvyLuV2f3WWvJOcoisyWAchNP7onN
   TBTQ2xeKQuE/m4HTg5tssPVItbdDpTgmCvhVFP2txKTLh4FJM9J8c8FhR
   A==;
X-CSE-ConnectionGUID: wB7+RNK3R3meVMppVILOqg==
X-CSE-MsgGUID: mMcs9zDdTouWX27DBlKNOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="34906283"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="34906283"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:48:25 -0800
X-CSE-ConnectionGUID: 756tk182QPiWIKEOWj5bsA==
X-CSE-MsgGUID: 3wm7aZiKT/CJRbT4dpICAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="110092576"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:48:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAR1v-0000000DY1B-0fJq;
	Mon, 11 Nov 2024 11:48:19 +0200
Date: Mon, 11 Nov 2024 11:48:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v4 2/4] gpio: rockchip: change the GPIO version judgment
 logic
Message-ID: <ZzHS4uMpP8qF9F3e@smile.fi.intel.com>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
 <20241111023412.3466161-3-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111023412.3466161-3-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_014826_435878_E1E84DEB 
X-CRM114-Status: GOOD (  14.01  )
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

On Mon, Nov 11, 2024 at 10:34:10AM +0800, Ye Zhang wrote:
> Have a list of valid IDs and default to -ENODEV.

...

> -	/* If not gpio v2, that is default to v1. */
> -	if (id == GPIO_TYPE_V2 || id == GPIO_TYPE_V2_1) {
> +	switch (id) {
> +	case GPIO_TYPE_V1:

If you leave the V2 case first...

> +		bank->gpio_regs = &gpio_regs_v1;
> +		bank->gpio_type = GPIO_TYPE_V1;
> +		break;
> +	case GPIO_TYPE_V2:
> +	case GPIO_TYPE_V2_1:

...and the v1 case last, the whole diff will be much more understandable and
reviewable.

>  		bank->gpio_regs = &gpio_regs_v2;
>  		bank->gpio_type = GPIO_TYPE_V2;
>  		bank->db_clk = of_clk_get(bank->of_node, 1);
> @@ -677,9 +682,10 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>  			clk_disable_unprepare(bank->clk);
>  			return -EINVAL;
>  		}
> -	} else {
> -		bank->gpio_regs = &gpio_regs_v1;
> -		bank->gpio_type = GPIO_TYPE_V1;
> +		break;
> +	default:
> +		dev_err(bank->dev, "cannot get the version ID\n");
> +		return -ENODEV;
>  	}

-- 
With Best Regards,
Andy Shevchenko



