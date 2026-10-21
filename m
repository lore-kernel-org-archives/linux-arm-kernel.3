Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE4E60A2626
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GRlYOpNe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgnsI9xvRVm2E2Nsl7k7rIHbcV39kvLE5MaE6MErPqI=; b=GRlYOpNeJ4TsYkd1K5JyxTH/yK
	iz2VAMWpiKGmirNVxnYKdo0gDmfxvFKGvCOZzD5/MNFaRRTyLjzY9vrAaKCbyW4Xk0uX5rUmKwCCR
	3W/oKwGOFdhaPBBCMlACaZVEtzbYXHRrG6aeYnwVtPdQ2D+GXIT4hja25TbT0JECsy9xlz5H6FVdb
	IPRqDo5Z5RP3x3ieIv7fogD3Eb60yWFiATVQHS++EkkAj0VC5rjbtNzA8p6xElg6Mqr1ULiadUIpW
	wUWjljSC5rAws/j7dwdMdAwrvTvcEodJZv2fd0pAbcUlzOXTPQH9ghbgkJwKv7JUIXwLU4ZMJXXK7
	MfkRGpCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXDF-0000000C59j-26mZ;
	Wed, 21 Oct 2026 14:22:41 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXDC-0000000C56s-0j4T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:22:40 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xJXD0-0008O8-00; Wed, 21 Oct 2026 16:22:26 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A39ACC0423; Wed, 21 Oct 2026 15:44:18 +0200 (CEST)
Date: Wed, 21 Oct 2026 15:44:18 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Message-ID: <atjBsoY8mjGw9fQ8@alpha.franken.de>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
 <as4tep73cAI57Yk7@ashevche-desk.local>
 <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
 <as44ROCHy-WeMdIZ@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <as44ROCHy-WeMdIZ@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_072238_513822_76CB9C5F 
X-CRM114-Status: GOOD (  22.49  )
X-Spam-Score: -2.6 (--)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 13, 2026 at 04:55:16PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 13, 2026 at 09:35:43AM -0400, Bartosz Golaszewski wrote:
> > On Tue, 13 Oct 2026 15:09:14 +0200, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> said:
> > > On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:
> > >> On Wed, Jul 15, 2026 at 8:51 PM Andy Shevchenko
> > >> <andriy.shevchenko@linux.intel.com> wrote:
> > >>
> > >> > This is the finilazation of the work announced in the commit 61e1fd2abca4
> > >> > ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With this
> > >> > small series we kill gpio_request_one() and leave only two legacy calls
> > >> > devm_gpio_request_one() and gpio_request(), where the managed one has only
> > >> > a few users and high chances to be killed soon as well.
> > >> >
> > >> > The series is supposed to go via GPIO tree (due to nature of the last patch)
> > >> > with possible immutable branch for others. Please, ack.
> > >>
> > >> The kernel is clearly a better place after these patches than before it, so:
> > >> Reviewed-by: Linus Walleij <linusw@kernel.org>
> > >
> > > Thanks!
> > > Bart, anything needs to be done for this series to go in?
> > 
> > We don't have Acks from MIPS maintainers. :(
> 
> Hmm... Usually Thomas is quick. Thomas, can you give your Ack if you agree with
> the changes, please?

sorry, I was on vacation.

I'm fine with the changes, but I'm not, if they still apply cleanly...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

