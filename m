Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E868FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQLovIVVNlt3sbk+HS3nizKbf7CXEbobD3FQnQghx3g=; b=aRVX6K4irENJOawYckIy6GfrTu
	D6v+5ULmQBefFVcRpV9YvWjBmB+PLThKTIvlDwdQcnnWUojzeEp4A6eWHdCtoDDBKkNqxQcW512Ib
	cRmuw0p1qTC2mm+AdiKwFVVl0nQMrZkEqoPxEoC94tK+HAJ9yZyXbT0Wv3vxLWx5K+bFOEwdwgqBm
	gACDO55IuSswRtVa73RH1Cecc2UdHnzPMLwJg69r+2JkVOUowaXVSUFsbnwdh6nGa6ZD6b10wk7u5
	ebge5/b+TQnsgY6uYHl7DwPhvpnp8DMjrgUNeauzBEDoqHXJm5yiVFTWY1JPnneOTjZ+GMLoGR96E
	VVMKt70A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHO6X-0000000HE6v-3zGn;
	Mon, 27 Apr 2026 15:42:37 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHO6V-0000000HE6Q-0LCU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777304555; x=1808840555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jpeqo3blo68qkWdVPmQrUuVlGinKzd6r+L8pS5ET8wc=;
  b=V6UFk3Ek6NnJTVSuUUGJbsuFlZxtitJ/y2vTGGwRlMXdASf1LbQAgcxy
   Etwy/Lyb1B1q7R61SmCHxutJ3C2GcVnyjDA1QoMl9dgK5s+bFVGiuuPTP
   5p+s0okbxThasOa7WB0rd+yUpEZ73YtHTwboPk8Y60ZfBXY22ziTy3PIi
   jOaQMoF8SWax40/eCfNf4qr1skPs+LEo1jap8ctx1UHWqoR09cIdVSO7M
   x5PV6s16B8dMhUuURKcIF3e6f47wkgOZxc9BNjy35MxkBrLBo4DjrR+Wu
   Bk8ratN3Z+Hh+7Ptx6h6ilFfgriQ/4Sdq6bVf6fO4SmiuC0hNl/LZ6xwM
   g==;
X-CSE-ConnectionGUID: f7815X07SLa3uAjDXqPvEQ==
X-CSE-MsgGUID: G9et5JuxQjGGOGAPSwQyOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="95758805"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="95758805"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:42:31 -0700
X-CSE-ConnectionGUID: YGGLeOhSQYyz1BHpkVsziQ==
X-CSE-MsgGUID: aLLViqwXTyqs3NaMC227iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="235425461"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:42:28 -0700
Date: Mon, 27 Apr 2026 18:42:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] usb: udc: pxa: remove unused platform_data
Message-ID: <ae-D4Qki41GpOHyx@ashevche-desk.local>
References: <20260427143300.2887692-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427143300.2887692-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_084235_239877_B373B168 
X-CRM114-Status: GOOD (  14.25  )
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

On Mon, Apr 27, 2026 at 04:32:10PM +0200, Arnd Bergmann wrote:

> None of the remaining boards put useful data into the platform_data
> structures, so effectively this only works with DT based probing.
> 
> Remove all code that references this data, to stop using the legacy
> gpiolib interfaces. The pxa27x version already supports gpio
> descriptors, while the pxa25x version now does it the same way.

...

> +	dev->pullup_gpio = devm_gpiod_get_index_optional(&pdev->dev, "pullup", 0,
> +						    GPIOD_OUT_HIGH);

While I gave a tag some time ago, I still wonder why we use _index variant here.
With

	struct device *dev = &pdev->dev;

it becomes just a single line (yes, 82 characters long).

	dev->pullup_gpio = devm_gpiod_get_optional(dev, "pullup", GPIOD_OUT_HIGH);

> +	if (IS_ERR(dev->pullup_gpio)) {
> +		dev_dbg(&pdev->dev,
> +			"can't get pullup gpio err: %ld\n",
> +			PTR_ERR(dev->pullup_gpio));

This occupies more LOC than needed (also gpio --> GPIO).

		dev_dbg(dev, "can't get pullup GPIO err: %ld\n",
			PTR_ERR(dev->pullup_gpio));

I even wouldn't mind this to be long single line

		dev_dbg(dev, "can't get pullup GPIO: %ld\n", PTR_ERR(dev->pullup_gpio));

(I dropped ' err' part in this variant, though).

> +		retval = PTR_ERR(dev->pullup_gpio);
> +		goto err;
>  	}

-- 
With Best Regards,
Andy Shevchenko



