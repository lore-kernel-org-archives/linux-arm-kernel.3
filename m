Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81E4CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMEmwy5OYSzYEqW8CrYSgwNilhiDK3hUxMtbCQ2lCR8=; b=TN2z0x0OGI+Vg82Gwj+hDOjLcu
	zfGchcHEplRH+9wdjzLtojzHoUuDnxERw85Zq+BpNmo5sf9NkMRYXt+ChdW4JBfdA0fh0K8eZWYqo
	i7Kg8bXGyWZB7MX4VvgicZ/cW1n+DDAkiVktidqhOh5+8e56sWV2QrN/gmDdll4nE6tV/O9C9S4O7
	CinPmlND62vmzhflgI0w2x7SQdjMTKpU4C7De39n7c9SmeGwaaLcdfRl4IRpeLC0OkJPPmDwzacGM
	nUTRtLy5L4JQI6nvzI2NnZas0PNc6jqcxfb6tUC0N4jnbzAjxlXEP6YIN8ITh8ca9BXHEX/RSSWkM
	jtNqeLHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcyU-0000000D1E8-0Imc;
	Tue, 13 Oct 2026 13:55:26 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcyR-0000000D1DI-2E3V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791899723; x=1823435723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jvbrqy8I4miW+wSkK502XDqoPN9Jx1JKbrD9wkOUpXw=;
  b=EKJRs8AFGxsszKDwkwTDKrXD7jHYyhT4jXVcRJKWMn1fxdyT7YPJfWpl
   +aVylzWFp5usjJQ0BSJCT3H9Qi6nWvYUJ3rXdCc1yCwRxNNJWSwTiNJ6O
   IPaz3xlO2ZcGNueNMjbNgSNlbiJW4zFYHWkwCVkL7JZIgUPD2ZU3CnrS9
   HBF+zGXooXL18rz9TrqmGUe6YssLk7esYp8CLoBGdOWYNnAm3xEXePOKs
   DM8bVhHmXkcxK2C1DAYtKgfMTkrot7j1bBulTblc85JwOrVwQwGVR4rEf
   5aikmjjIVrQTp6lKIH/qpENxzLBbm+sfoGmEh/jGSzaNstJRj4KvsnclF
   g==;
X-CSE-ConnectionGUID: W3BJIfuhSCeWTk+CQg4R8A==
X-CSE-MsgGUID: dwbne8T9TXmpZJqGG+7wxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="721315"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="721315"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:55:22 -0700
X-CSE-ConnectionGUID: oMI85wWfS9WDIx1vH5Lxxw==
X-CSE-MsgGUID: sowtfEJ3SgSLsZaLynl/kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1110177"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:55:18 -0700
Date: Tue, 13 Oct 2026 16:55:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Message-ID: <as44ROCHy-WeMdIZ@ashevche-desk.local>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
 <as4tep73cAI57Yk7@ashevche-desk.local>
 <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_065523_611914_D995AE39 
X-CRM114-Status: GOOD (  18.28  )
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

On Tue, Oct 13, 2026 at 09:35:43AM -0400, Bartosz Golaszewski wrote:
> On Tue, 13 Oct 2026 15:09:14 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:
> >> On Wed, Jul 15, 2026 at 8:51 PM Andy Shevchenko
> >> <andriy.shevchenko@linux.intel.com> wrote:
> >>
> >> > This is the finilazation of the work announced in the commit 61e1fd2abca4
> >> > ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With this
> >> > small series we kill gpio_request_one() and leave only two legacy calls
> >> > devm_gpio_request_one() and gpio_request(), where the managed one has only
> >> > a few users and high chances to be killed soon as well.
> >> >
> >> > The series is supposed to go via GPIO tree (due to nature of the last patch)
> >> > with possible immutable branch for others. Please, ack.
> >>
> >> The kernel is clearly a better place after these patches than before it, so:
> >> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >
> > Thanks!
> > Bart, anything needs to be done for this series to go in?
> 
> We don't have Acks from MIPS maintainers. :(

Hmm... Usually Thomas is quick. Thomas, can you give your Ack if you agree with
the changes, please?

-- 
With Best Regards,
Andy Shevchenko



