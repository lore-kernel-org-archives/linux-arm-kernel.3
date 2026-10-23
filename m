Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D80E606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RDBD+MDR;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l1F2Iw3z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A5hfuGLL9U51nvhID9oUu3453+srUYM+t5Xwxht3AIo=; b=RDBD+MDRKuD9ZO71CQiBv+Z516
	AFg5PU39krurYrHZAXMVbU0Ve56qTi+BRtmYtyG3Uwl/XL40pn0M56RAlKVGrsgU8B2PzJWcSiGhV
	yFyefV6Pwg++s3Q744slRMjOPbZC5XXP/B0IY7bXd6jH87QpbBlm88iqvkqZVXE708XgR5ZnsEWWr
	U1Lv5NBsynOzlEbpSgtNRLUCN2dAMumtNM9iLHqLhBzk08WgIXPPKx4El64adPK/L45aYKiylMKBG
	ntELulMROeQFe4gqcJE1td44PR/yu53BmKF5cAZ/uLCPIbppGwH24ekd7nn00yaXmO3VINIQjvDKE
	epk+sdJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK92o-0000000FdGT-3BMi;
	Fri, 23 Oct 2026 06:46:26 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK92m-0000000FdFe-0ts4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792737984; x=1824273984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IK7GHeF/iSOkxUaWEWahXG0mGoC8RmG0GWUii1LygYQ=;
  b=l1F2Iw3zsYau6/q83/zylwOg7n6lmvMefpzklnAUfK90JU99oBlgFA4I
   BSeYS3IEqkw4dwHUzqVruXRk0PdtsstC95ZdRqA72BdrkzpM5SrwB8pNx
   y3sTlVL6Koi9TCNtmtFzkNao8bsAbwJg1X4eh5Achcpe91Cin404p2piV
   8uT5GEEUbfbVopEQvLrTFqWVF3YPFd/qWynJELn6zL+JIXbssIeK9bhOj
   XZpsY3vsYDRBTuQz5JIvRZfbLb2kyJ0/dyz50d/xvqlmqrmd2Yk87EcmO
   XGTDsCZwh5GS1nKi6jFlYJNobiEfHUb9xJLwHh0A/gbDyAt+nNMnYH/H6
   A==;
X-CSE-ConnectionGUID: W40BBzrvT52XffBVUweFBQ==
X-CSE-MsgGUID: zQeydp/vQZCLLOBOUuIfcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1377336"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1377336"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 23:46:23 -0700
X-CSE-ConnectionGUID: ymazaAbZTm26TqRgwuVb1g==
X-CSE-MsgGUID: lcL7yanMTpCwy4PyBDK5Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3505972"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 23:46:19 -0700
Date: Fri, 23 Oct 2026 09:46:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
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
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Message-ID: <atsCuEYYPokdQn_m@ashevche-desk.local>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
 <as4tep73cAI57Yk7@ashevche-desk.local>
 <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
 <as44ROCHy-WeMdIZ@ashevche-desk.local>
 <atjBsoY8mjGw9fQ8@alpha.franken.de>
 <atjbpKxrW7x7Ohpq@ashevche-desk.local>
 <atjfOrjsxnKe80zh@ashevche-desk.local>
 <atpbQV_qEoLyAG2J@alpha.franken.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atpbQV_qEoLyAG2J@alpha.franken.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_234624_330030_0D031A89 
X-CRM114-Status: GOOD (  22.72  )
X-Spam-Score: -4.5 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 08:51:45PM +0200, Thomas Bogendoerfer wrote:
> On Wed, Oct 21, 2026 at 06:50:18PM +0300, Andy Shevchenko wrote:
> > On Wed, Oct 21, 2026 at 06:35:06PM +0300, Andy Shevchenko wrote:
> > > On Wed, Oct 21, 2026 at 03:44:18PM +0200, Thomas Bogendoerfer wrote:
> > > > On Tue, Oct 13, 2026 at 04:55:16PM +0300, Andy Shevchenko wrote:
> > > > > On Tue, Oct 13, 2026 at 09:35:43AM -0400, Bartosz Golaszewski wrote:
> > > > > > On Tue, 13 Oct 2026 15:09:14 +0200, Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> said:
> > > > > > > On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:

...

> > > > > > > Bart, anything needs to be done for this series to go in?
> > > > > > 
> > > > > > We don't have Acks from MIPS maintainers. :(
> > > > > 
> > > > > Hmm... Usually Thomas is quick. Thomas, can you give your Ack if you agree with
> > > > > the changes, please?
> > > > 
> > > > sorry, I was on vacation.
> > > 
> > > No problem, we now have more time :-)
> > > 
> > > > I'm fine with the changes, but I'm not, if they still apply cleanly...
> > > 
> > > Can you provide your formal Acked-by?
> > 
> > Maybe I misunderstood you, but FWIW I have applied it on top of today's Linux
> > Next and there is no conflicts.
> 
> ok good, I probably mixed things up :-/

Thanks for tagging the relevant changes!

Bart, I guess now we all set for this series to go in.

-- 
With Best Regards,
Andy Shevchenko



