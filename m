Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB95D44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utuMCqpzw2ap7NG551P5yjgKWnue//yUgXgEoxu/4hg=; b=zlT2jw6rChhg15Geko8+BlhlzQ
	/pv6N+yJVHrPOUWS+ulVTJaJKHUuNPafXGjtKapDmYKxMDeO9Lml9N+a6Rf9NZwPmaW+1v01HfvXH
	RtVcMNCoJAXuKcF7tjjMKl3LICFUrd832OBotUPBWyDKAGp7qANyutP68HHS4ooYfRi182uG+v0wH
	EywisI8p2FOx8oAqfKSBQHbKQbQCyto7/KVCy3NUZo3Dih2lf7CN4GZ4zhYYMLAuGp4QomtGBJmVU
	6b3KHxY/q0RaTEZxB2gUE40JHjf1M38YowR49h+5ApKNxsIfjCbpOVT0dWNI6HHY8soIv4OGfBwCj
	PCVm1E/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8f0U-000000039n2-0jbp;
	Wed, 06 Nov 2024 12:19:30 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8e0m-00000002tTX-07RI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730891744; x=1762427744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VGxsjJni8GVkPbFXNANcrnf8kZf7wifiipk6hRa1wYY=;
  b=l7Z6bS29TJa+zARsPhO710ujZIs9O2D3MhUAbWVumKv66Nb0GeqLWj0A
   WIpw4LR604+QyIsChlzprNN39fG7yVe+Ow7epla0NS2Nlw8UTSVA9S9Or
   eurmVO+neiWEOwrOVxn0V/cqzAncWKIu12dbRfKoY/FNxZVA3k4UFBXFN
   oAf5VPpEKXzw2z8yYVGQeaUgs7lcJ91kWhJCiSU4jhc9EYE8SyWQ0gbG8
   KOptFujVvZh97Lonq8J08CbuTh370i0I4ZfXk6Ab9H2+zN0HBjYtowtQ1
   lLMAkvVpVxAzhfZL3UwUyLvf1mrZ8hyLrE/NCFm+QtcABq6XUdyGqv/Xe
   Q==;
X-CSE-ConnectionGUID: LaEFBUmbQwewXxiGZFsdFg==
X-CSE-MsgGUID: ghm5yQ19TVOM4ZV7o0ss5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41231033"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41231033"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 03:15:37 -0800
X-CSE-ConnectionGUID: 4CW4v63uTKuAVbYgjM7Jtg==
X-CSE-MsgGUID: z+o230JATEmPRbNbc5ytmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84603766"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 03:15:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t8e0X-0000000BlrG-22X7;
	Wed, 06 Nov 2024 13:15:29 +0200
Date: Wed, 6 Nov 2024 13:15:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 0/6] gpio: Get rid of deprecated GPIOF_ACTIVE_LOW
Message-ID: <ZytP0XGgmz_R5gos@smile.fi.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_031544_158479_6C1A5D11 
X-CRM114-Status: GOOD (  14.63  )
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

On Mon, Nov 04, 2024 at 11:34:18AM +0200, Andy Shevchenko wrote:
> This series targets the deprecated GPIOF_ACTIVE_LOW as only a few users
> left. Convert those users to call modern APIs and drop this legacy piece
> from the source tree.
> 
> The idea is to route this via GPIO tree, please Ack.

Thank you for Acks, folks!

Dominik, is it possible to get yours or are you inactive nowadays (I saw
last mention of your name ca. 2023).

Bart, we have all Acks except pcmcia (see also above), and the change is
the same all over the places, do you think it's okay to apply if Dominik
won't respond for a few days?

-- 
With Best Regards,
Andy Shevchenko



