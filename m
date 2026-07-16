Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69952C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toxy2jG5k8rsmVjBC6umRfCjIF/9rl6IYwmcJggg3gc=; b=ANw1KJ0vv67PvlqghQsnDKIrbQ
	UN+vgdHFhqwvOk9zhMUpNik5rO84x0YSjbnvhD447Me0bIYRbKOSkWre4ZyLyZCraGwXcFt99EVMR
	WhV0pHeYtyLhvjMJWBY9tTdAkDOtdKhaV51KaITsjTBP+DkZ38KX913FLDXl9KS7eXj6FAdRytZZF
	JNJk37i3oi+eIHVuYeX+faFYBOCu/dZYBgtEmcm43PJjIgshsL3md7hEAwoya6vdZNw7VOBgXyTzl
	Okri62hXn4RLhYyAO/zImN3FZc1Mu+4rz+ZH9bnH0KDyEgFl17tS/zVw9bdCYOwFwKr4aRoRpgmC2
	jWTPONtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQKH-00000000KG9-3WX0;
	Thu, 16 Jul 2026 17:56:49 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQKF-00000000KFY-1Piy;
	Thu, 16 Jul 2026 17:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784224608; x=1815760608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JOhrs1OFvboDcLOeh8gPY/kmKk14v0E8LAeuat6Eybc=;
  b=N4XXRmqaeMNBUYUpyup/U/uYwhgjmDYWtA8kJGbF/irR7oBsdx4olCLr
   IXTgpI9wAhf5OpptkxAvPUIZnGkB8GTxwDLFwbWyrB6vYsl3q2ZEEFqlH
   WPNp5tC5p/pBkecJmdVwqDhERuObN4KTBePOdZzksnv/XKSLDCld8lmFo
   ZdusP1BRvBv4JyxLjASA72vUmYq4gy0Dl2W1LgVgIfkeN628iNjj/DNuA
   d70VATMJBOB1DpqufEcmjGdgTJmGDImJJ3wBFM4QoFNR4TdvpKYrqhwpW
   SuiF4BKo1c93vU2WzkaPF+FO/+QSPDJyu/JALaBETp+AAZH2+AwrzxeDf
   g==;
X-CSE-ConnectionGUID: bV/Xezj3RYyChRatmuKahA==
X-CSE-MsgGUID: uwMXjpKZQRaHhLZBsAHfMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96029972"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="96029972"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:56:47 -0700
X-CSE-ConnectionGUID: o44G+L4dSBaDIU9Jshoh0g==
X-CSE-MsgGUID: dUnJTDUlRJ2uULcA2u/yFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="260160330"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:56:40 -0700
Date: Thu, 16 Jul 2026 20:56:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Yu-Chun Lin <eleanor.lin@realtek.com>, Michael.Hennerich@analog.com,
	afaerber@suse.com, andy@kernel.org, brgl@kernel.org,
	conor+dt@kernel.org, cy.huang@realtek.com,
	devicetree@vger.kernel.org, dlechner@baylibre.com,
	james.tai@realtek.com, jic23@kernel.org, krzk+dt@kernel.org,
	lars@metafoo.de, linus.walleij@linaro.org, linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org,
	mathieu.dubois-briand@bootlin.com, nuno.sa@analog.com,
	robh@kernel.org, stanley_chang@realtek.com, tychang@realtek.com,
	wbg@kernel.org
Subject: Re: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Message-ID: <alkbVkB5KNNR7ffN@ashevche-desk.local>
References: <d301ba0cd45d49d59e6a014188306ec9@realtek.com>
 <20260716062614.1507243-1-eleanor.lin@realtek.com>
 <aliV4u6_xzx9D9Aq@ashevche-desk.local>
 <DJZVLZ4LLD9E.3MPLYYXT1VQ9R@kernel.org>
 <alim_HGTD5RCupav@ashevche-desk.local>
 <DJZXVOGZ3ZTH.20P8NY7DON0X7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJZXVOGZ3ZTH.20P8NY7DON0X7@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_105647_439799_3EF349C6 
X-CRM114-Status: GOOD (  33.17  )
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

On Thu, Jul 16, 2026 at 12:55:37PM +0200, Michael Walle wrote:
> On Thu Jul 16, 2026 at 11:40 AM CEST, Andy Shevchenko wrote:
> > On Thu, Jul 16, 2026 at 11:08:55AM +0200, Michael Walle wrote:
> >> On Thu Jul 16, 2026 at 10:27 AM CEST, Andy Shevchenko wrote:
> >> > On Thu, Jul 16, 2026 at 02:26:14PM +0800, Yu-Chun Lin wrote:

...

> >> > From the above list I tend to the approach 2, but this might require to have
> >> > GPIO regmap level of locking. I'm a bit lost in the context, though. I assume
> >> > we need a fresh start, id est issue a v6 with approach 2 or 3 in place and
> >> > summarize the choices in the cover letter, so we can understand what has been
> >> > considered.
> >> 
> >> I don't really like approach 3. You'd need to check if the regs of
> >> both xlate calls are the same. With the sample code above, you
> >> silently drop the first xlate'd reg.
> >
> > If I rank the proposals, the worst is #1, the best is #2.
> >
> >> And honestly, it really seems like a one-off. What controllers, are
> >> there that need a write enable bit. The real problem seems to be
> >> the assumption that we operate on just one bit. IOW we either set
> >> mask or don't set mask in gpio_regmap_set().
> >
> > Yes, we should KISS.
> 
> But IMHO #2 and #3 are not KISS. Approach 2 is just a way of adding
> some kind of pre op to a gpio set. Just tying it to a write enable
> feature. That kinda bothers me. It might also be useful for other
> things, too. So don't tie it to just write enable. And who is doing
> a write disable if it's not self clearing for example. Probably Some
> kind of post op :)
> 
> Approach 3 is a way to change the value of the written value - in
> a restricted way, as is is just doing a OR with both values.
> 
> Also approach 2 might not even work if the hardware requires the
> write enable bit set in the *same* write as the gpio set bit. Thus,
> we might need both anyway in the future.
> 
> >> For a more generic solution, we should be able to control the
> >> written value. We could add another .value_xlate().
> >
> > Maybe not now?
> 
> But if not now, then when? I wouldn't add the write enable feature
> and later a more generic solution which also covers the write enable
> feature.

Taking into account how it's done in HW, I think the whole approach can
be folded to just a boolean flag  (or a simply bit shift) in the config.
Wouldn't it work?

> > As per IPs, Synopsys IPs (not exactly GPIO) likes to
> > have that kind of "protection". So, from HW perspective it's kinda
> > pattern, and it might be possible to see more IPs (including GPIO)
> > that follow it in some cases.

-- 
With Best Regards,
Andy Shevchenko



