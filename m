Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4F6C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzQSS4HAZjmOcCbUOqP6wtAjt4Ak/zy+E2W9MCkJRYc=; b=2SRIeuKmyQe1/zvCWkAsm+eZOD
	ASC5hC/lKWuV2G32MlRcICGjpSwWPnd0w/dH/n7O9P7Gyp8BR+w3zrt7Om6B+fIr91ADUV7ef8mye
	ka7Ix7JuOrBTcHigj0ySPyDy8NSn9YIyRMbhuqJtsDt2KfvgOmpLHm/zoqvnsDFZnY/ifk7W2AonC
	xEErqfFOa8ELnpontvqj77OdDJadJNCJwV3EIX4s1vJU5NpTDjTHYUm98wq1YUkdG19jYr+/546Of
	71C7gGpk8ge9VEBpLF0ipvpP5ut9C/QDrzVlrGQwPQ8KODjC8j3cmYh7m9tA0mwoHCM9E83UhdHjW
	zToJB4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfbXz-00000002g0B-3XoS;
	Wed, 05 Feb 2025 09:18:15 +0000
Received: from [198.175.65.20] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfbVi-00000002fgN-3NGp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 09:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738746955; x=1770282955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nmmWn6SkEF2ZFe23C4JsgDiF62pSRLhfA9VmwDQRdpM=;
  b=OKcEAhgNvdR2Go7hhT9n1zNAwE4mCqqChzO6X5d5fiZTEJSgn7S2zICy
   wxvYugNUtGgfKcfJCxKkFMsLdDyDvU5z+CqH9sG83/zdM68UMjdYSIkPY
   UpnoZrkP/XFIjVnke6hvM7QqY+O/zKZ1KNntllShEix2oTRcMYcW6Sl1J
   ovEM82hESd5WhIcl+mQrmY8YvzmlOD8ZWtCDB+zfOTe72ZzvYwiA3A4um
   bi8N2zauWUlfPh5CjLu7dd1XGd7pkg6hSfuvbmHhM4F2f5pD89NdUvUHc
   kgn+JUlOFkh7pOQCDfry1Cb+YdWkeu9wgrXTqxZVFuQv+dUQJ5smz3q++
   Q==;
X-CSE-ConnectionGUID: N5hl5EdiSr+oAISFESYWCA==
X-CSE-MsgGUID: STslh0IlTGeBL9JU8dJCFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39003372"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39003372"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:15:54 -0800
X-CSE-ConnectionGUID: jSRyaZFTSdmsqQNm2+4tKw==
X-CSE-MsgGUID: OjiP+TL9TbGjpAku0FyU5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115817941"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:15:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tfbVc-00000008R5k-1Dxs;
	Wed, 05 Feb 2025 11:15:48 +0200
Date: Wed, 5 Feb 2025 11:15:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 2/2] gpio: xilinx: Replace custom variants of
 bitmap_read()/bitmap_write()
Message-ID: <Z6MsQ7iFnhcugguR@smile.fi.intel.com>
References: <20250204190218.243537-1-andriy.shevchenko@linux.intel.com>
 <20250204190218.243537-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204190218.243537-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_011554_910772_725A7448 
X-CRM114-Status: GOOD (  13.06  )
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

On Tue, Feb 04, 2025 at 09:00:48PM +0200, Andy Shevchenko wrote:
> Relatively recently bitmap APIs were expanded by introduction of
> bitmap_read() and bitmap_write(). These APIs are generic ones
> that may replace custom functions in this driver, i.e. xgpio_get_value32()
> and xgpio_set_value32(). Do replace them.

...

> @@ -386,13 +371,14 @@ static void xgpio_irq_mask(struct irq_data *irq_data)
>  	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
>  	int irq_offset = irqd_to_hwirq(irq_data);
>  	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
> +	unsigned long old_enable = bitmap_read(chip->enable, round_down(bit, 32), 32);
>  	u32 mask = BIT(bit / 32), temp;
>  
>  	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
>  
>  	__clear_bit(bit, chip->enable);
>  
> -	if (xgpio_get_value32(chip->enable, bit) == 0) {
> +	if (old_enable == 0) {

Oh, this one is incorrect.

>  		/* Disable per channel interrupt */
>  		temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
>  		temp &= ~mask;

-- 
With Best Regards,
Andy Shevchenko



