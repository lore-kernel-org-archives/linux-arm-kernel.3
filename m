Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92D0606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=su13PXFj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMqDibeEONqAJsijitjSdM1kHE4HWDS9vh+bBPboeGQ=; b=su13PXFjHjomEA9X9R09qu2PYL
	HeAWGYxLv6gdhYiHPPcMw56GTqg28NN7R9/aTjm2CEO/C9+SWpMSvoqV6K2Q3jsuiFZXBM+GsgzUh
	LuV82v/M3L2sH3W00Ey6sgR4iPyY+ZrvYK8IWIhR6z3OckbfXLPYBlP/59HpXyDhcnPOxiwn6ZQRx
	y7aq6onPMcSCZE2T6IK6bDFZOaALkz5601MwS4pZLlwuJWNH9krsdfx3v8pVgc8ZQ6i+aDhbtykzT
	M4Rgn4/fytwOTPCPlBTzMOkYm2JeBRYGsNaUmK+vZD8xyg3t9iOzZnYnTZE/IO+Cy1LA5aSVT6Xug
	ziFJgnzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBnU-0000000A3fm-0TZp;
	Tue, 20 Oct 2026 15:30:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBnR-0000000A3fE-2ptv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:30:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27E5E4045A;
	Tue, 20 Oct 2026 15:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4933D1F000C8;
	Tue, 20 Oct 2026 15:30:32 +0000 (UTC)
Date: Tue, 20 Oct 2026 17:30:00 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
Message-ID: <ateI-JcExDyfXKrs@red-moon>
References: <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
 <arZDwutoadki7tiZ@ashevche-desk.local>
 <arZNL9BnTGK0Klwc@red-moon>
 <arZS4vwxps01dGb7@ashevche-desk.local>
 <arqSqcoWAkhy-8do@red-moon>
 <d1720b63-65bf-4019-bc19-1852555f7993@arm.com>
 <asieTvinZ7c2QpQm@red-moon>
 <CAJZ5v0hVLSJs1j8J1TV3yJ8Psyaf=B_0UfHsYSMtM5xTup0B_Q@mail.gmail.com>
 <atXyIadz1TEKSodg@red-moon>
 <CAJZ5v0joJBZg==DWPsNviPfL7Jo=qupRhb6GinqOLoHXGnvevg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0joJBZg==DWPsNviPfL7Jo=qupRhb6GinqOLoHXGnvevg@mail.gmail.com>
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

On Mon, Oct 19, 2026 at 08:05:50PM +0200, Rafael J. Wysocki (Intel) wrote:
> On Mon, Oct 19, 2026 at 12:34 PM Lorenzo Pieralisi
> <lpieralisi@kernel.org> wrote:

[...]

> Basically, yes, the idea is to defer the creation of the platform
> device until the dependency is met.
> 
> > till the dependencies are cleared but then, without a _CRS, where will
> > the consumer driver find the platform device resources ?
> 
> Well, good question.
> 
> > There are multiple facets in this issue and possibly some of them have
> > been already solved but I need to pull them together.
> >
> > > Note that the dependencies can be added to acpi_dep_list after
> > > creating a struct acpi_device with acpi_add_single_object() and
> > > acpi_scan_add_dep() is not really suitable for that, but it should be
> > > doable if the dependencies can be found.
> > >
> > > > I need to have a deeper look into this next week but I wanted to ask first
> > > > whether there was something I missed - most likely.
> > >
> > > Well, it is not really straightforward.
> >
> > Yes it is getting messy. This RFC, with all its flaws, does not transparently
> > prevents enumeration but rather relies on -EPROBE_DEFER to sort out
> > dependencies - though it does so by adding more stuff into ACPI static fwnode
> > that to be honest I'd rather see gone.
> 
> I think what you need is a notification mechanism that will trigger
> when a specific device (enumerated via the ACPI Namespace) becomes
> operational.  It doesn't look like any of the existing ones (platform
> device probe deferral or ACPI device dependencies tracking) is really
> suitable for your use case.

Yes. It might just be a notification from ACPI core to say "the driver for
this ACPI device probed, go create platform devices that depends on it".

We can check and track the dependency in code that does create those
devices today.

I will think about this to see how bad this might look like.

> > > I'm still not sure why you can't represent all devices in the ACPI
> > > namespace in addition to describing some of them in static tables.  I
> > > guess that would work for everybody, wouldn't it?
> >
> > That's a fair point - though then code will have to work with firmware
> > that does NOT explicitly require those devices in the namespace (ie: firmware
> > as it is specified _now_); it can turn out to be a mess even less
> > manageable than this discussion ;-)
> 
> If it has to work under these conditions anyway, then adding stuff to
> the namespace is rather pointless.

Yes that's the problem, reworking the code to make it work with namespace
devices is doable the issue is existing firmware and that we can't change it
(and we can't create it in the kernel either).

Thanks,
Lorenzo

