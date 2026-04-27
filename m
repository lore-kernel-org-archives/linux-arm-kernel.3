Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FC8FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rVr0xAFkdITOqTQCByWq3yujtm5/HuSrP+QK12D9yo=; b=CNk8e+tu4GD1XjxLt8TBbofqNB
	T6fFMnXECGtj7p5rBzOvIxR4zzJofFTCt0dEHmI2WzPqI4vpEALapFqb1jMemMU5Heh27iQ9l2K/E
	OkRUDjQMXQFomovigGXvxn7eES3ORLceuvG+veLIt0qh49FNitcz0oQzxdpnlDoiFmfHY6NlIOURg
	046tikRPxXaifsKhBL0EShUn9vNBBYNYLUV457E0sgzetXjaSW1UJV0oJMSNzEMVDaX2fhyVKU8IZ
	YdBDkfk/trKR1xOMSreN1GA2+n1WQdiiSatKCbbM37+jVzFvpCXcjnqiRCQ1nmOA+ZZXx82VV/5tj
	d1WD114g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHO7Y-0000000HEF1-1OEl;
	Mon, 27 Apr 2026 15:43:40 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHO7W-0000000HEEe-2irn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777304618; x=1808840618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6ISVTMtRX4NqFtLqj4qSZrtb1sJJjw46nVYpkNvtzzE=;
  b=G1zVc9Am0lg0OLEg0IaI2O93vquAA+1aB7uJwL2FFFUoHkoN1wWbMQGt
   5vEjNa5dzQkTtpqQVVZmZLXCNeg7WPvUJ4gdh5cCh8OiN99ww4OjG8+7F
   bEzVFHJepQMpR24mq92heRJmi4hD0UE9cjybDfryspqclBIqxLAvdOiyC
   NXi82JGeJ5atAUruEA2A/yDhzJldBGqUYTFaBf3VeXr0cgq0az6qUUsSC
   uf8c/0/U0qo5dSl4VtAwVdrTkVyezQZu+qODHJ7Sl2Yu64eg0JRh8yN51
   ZnzqtFI7iJ2X+09mB4ubkdgp8+OeCZqTvSXFlESMI5blDcDb8XN+gvvFB
   A==;
X-CSE-ConnectionGUID: z2d5WB9zQtq8Pi8DeyrC6w==
X-CSE-MsgGUID: YrrGwlzTRk6dgreaW0dhyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="103656951"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="103656951"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:43:38 -0700
X-CSE-ConnectionGUID: MSbhwIMpSU6XPZgGx/cnPg==
X-CSE-MsgGUID: VNR5LbqfS7Cae+5Twd97QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="238660909"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:43:35 -0700
Date: Mon, 27 Apr 2026 18:43:33 +0300
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
Message-ID: <ae-EJW3UXgVbiXt0@ashevche-desk.local>
References: <20260427143300.2887692-1-arnd@kernel.org>
 <ae-D4Qki41GpOHyx@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae-D4Qki41GpOHyx@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_084338_737227_A7AD1A85 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

On Mon, Apr 27, 2026 at 06:42:31PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 27, 2026 at 04:32:10PM +0200, Arnd Bergmann wrote:

...

> I even wouldn't mind this to be long single line
> 
> 		dev_dbg(dev, "can't get pullup GPIO: %ld\n", PTR_ERR(dev->pullup_gpio));
> 
> (I dropped ' err' part in this variant, though).

Or even

		dev_dbg(dev, "can't get pullup GPIO: %pe\n", dev->pullup_gpio);

which fits 80.

-- 
With Best Regards,
Andy Shevchenko



