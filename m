Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAF1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 06:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xEOXhmoH;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cePFW3Pc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFucjpuwH0j10r8rB0xRq98gv+GUqPboTiWqHPsU1AY=; b=xEOXhmoH3NcZIFcIY1ivQKALL4
	JydgT/RFspNEs3j3d2Rc03nQGtktckudzBs/1WoLC1XneDeDhNZDF3pAk+7ek1CCII8B0WopItpEX
	SJ0q6MV1e4vaM+Voss19wlXXf+Zyvyu0Vc4z2j2/6/0b4A0r7A5FLqZ5o51ehfyB6TwuhYcwZAFzT
	BlrfblIxsUUi9IM/JpIJxTj1HgDi8DaizsUsbQ1BuVtdU/LR8X8/7g+ZrVQtzWZmSVIlis8VfGVIC
	n4E9NeDYmKHy95ZefOifJVw134vcyWlLgmpE6NYZgxWqUH/9rYjJLljbajJyFVp25aL2uB5MREw+N
	M6HwJxQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmWr-0000000DV0K-0gLr;
	Thu, 22 Oct 2026 06:43:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmWq-0000000DV0C-03aC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 06:43:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E17643BB0;
	Thu, 22 Oct 2026 06:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959781F000C1;
	Thu, 22 Oct 2026 06:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792651435;
	bh=aFucjpuwH0j10r8rB0xRq98gv+GUqPboTiWqHPsU1AY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cePFW3Pc8RdsHIvENQO8gtCTXKpiGowW/j+CGwDXbGb/ag+JPQF5T4OgKFgQ9t1hP
	 E5TZPEcE9TrkVjThtJ4uPlsL2X07kyz7LXakl5kd5wCwol2K6l5BsyApt4ZXv/a5Pe
	 5vzQl/ZYcmDUkZk1g2oYPQR33zF7oBMLsDAaN48bfdujQUjMdNV83CBRuQLKeCan9y
	 MeNrm7Sv13nsv8SAOP2oBhxPZEZOawRSHAju8oFOU4KlPq4o0sp7jqxBZDFGrJYkpT
	 EfVU6yHKMOnfZQkIGjnX5ZHBa3UDA63FdwG6zzv8viGOqxuutEuKWZu7JBrZZ/kclb
	 OZWpQCnhjgfWA==
Date: Thu, 22 Oct 2026 08:43:47 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
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
Message-ID: <atmwo3Bpi62kB8_n@red-moon>
References: <arqSqcoWAkhy-8do@red-moon>
 <d1720b63-65bf-4019-bc19-1852555f7993@arm.com>
 <asieTvinZ7c2QpQm@red-moon>
 <CAJZ5v0hVLSJs1j8J1TV3yJ8Psyaf=B_0UfHsYSMtM5xTup0B_Q@mail.gmail.com>
 <atXyIadz1TEKSodg@red-moon>
 <CAJZ5v0joJBZg==DWPsNviPfL7Jo=qupRhb6GinqOLoHXGnvevg@mail.gmail.com>
 <ateI-JcExDyfXKrs@red-moon>
 <athimRqtDvQu1ZzA@ashevche-desk.local>
 <atiAmZSPiRNBAO5O@red-moon>
 <7f077fd3-9c67-409a-b46f-7f28a55c180b@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f077fd3-9c67-409a-b46f-7f28a55c180b@arm.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 12:18:39PM +0100, Robin Murphy wrote:
> On 2026-10-21 10:06 am, Lorenzo Pieralisi wrote:
> > On Wed, Oct 21, 2026 at 09:58:33AM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 20, 2026 at 05:30:00PM +0200, Lorenzo Pieralisi wrote:
> > > > On Mon, Oct 19, 2026 at 08:05:50PM +0200, Rafael J. Wysocki (Intel) wrote:
> > > > > On Mon, Oct 19, 2026 at 12:34 PM Lorenzo Pieralisi
> > > > > <lpieralisi@kernel.org> wrote:
> > > 
> > > [...]
> > > 
> > > > > Basically, yes, the idea is to defer the creation of the platform
> > > > > device until the dependency is met.
> > > > > 
> > > > > > till the dependencies are cleared but then, without a _CRS, where will
> > > > > > the consumer driver find the platform device resources ?
> > > > > 
> > > > > Well, good question.
> > > > > 
> > > > > > There are multiple facets in this issue and possibly some of them have
> > > > > > been already solved but I need to pull them together.
> > > > > > 
> > > > > > > Note that the dependencies can be added to acpi_dep_list after
> > > > > > > creating a struct acpi_device with acpi_add_single_object() and
> > > > > > > acpi_scan_add_dep() is not really suitable for that, but it should be
> > > > > > > doable if the dependencies can be found.
> > > > > > > 
> > > > > > > > I need to have a deeper look into this next week but I wanted to ask first
> > > > > > > > whether there was something I missed - most likely.
> > > > > > > 
> > > > > > > Well, it is not really straightforward.
> > > > > > 
> > > > > > Yes it is getting messy. This RFC, with all its flaws, does not transparently
> > > > > > prevents enumeration but rather relies on -EPROBE_DEFER to sort out
> > > > > > dependencies - though it does so by adding more stuff into ACPI static fwnode
> > > > > > that to be honest I'd rather see gone.
> > > > > 
> > > > > I think what you need is a notification mechanism that will trigger
> > > > > when a specific device (enumerated via the ACPI Namespace) becomes
> > > > > operational.  It doesn't look like any of the existing ones (platform
> > > > > device probe deferral or ACPI device dependencies tracking) is really
> > > > > suitable for your use case.
> > > > 
> > > > Yes. It might just be a notification from ACPI core to say "the driver for
> > > > this ACPI device probed, go create platform devices that depends on it".
> > > > 
> > > > We can check and track the dependency in code that does create those
> > > > devices today.
> > > > 
> > > > I will think about this to see how bad this might look like.
> > > 
> > > Don't we do something similar in drivers/acpi/x86/lpss.c?
> > 
> > I suppose I can add a notifier that checks whether the device whose
> > companion represents the ACPI device a given platform device IRQ depends
> > on was bound to its driver and then map the IRQ and add the platform device
> > _then_ - after all that's what acpi_dev_clear_dependencies() does (similar
> > at least).
> > 
> > There is still the question - where the GSI number, flags should be
> > stashed so that the notifier can grab them in a uniform way. We
> > could simply attach platform data storing those values to a pdev, either on
> > a per static table basis or generalize the data so that a single notifier
> > would be able to deal with it.
> > 
> > That or I can just piggyback on acpi_dev_clear_dependencies() and add
> > a separate dep mechanism to acpi_dep_data that instead of being acpi_handle
> > based the consumer is fwnode based (something Rafael mentioned before).
> > 
> > I will have a stab at this and see what's the least bad solution I can
> > come up with.
> > 
> > I suppose we are scrapping the -EPROBE_DEFER solution (ie this set),
> > what we are talking about above won't need to defer anything other
> > than the time when platform devices are added.
> 
> I dunno, that seems pretty drastic for some use-cases - the fact that a GSI
> is described in a table doesn't necessarily mean it is critical to device
> operation. If we don't even create the device until all possible resources
> are available, then its driver never has any chance to decide whether it's
> happy to ignore the deferral and just use MSIs or polling instead...

I agree with you (but that's what we do for ACPI autodep and AFAICS OF
devlinks - though there there might be opt-outs).

To make -EPROBE_DEFER work I have to pursue the approach undertaken in this
set and apply requested changes - I don't see any other way.

Are we willing to accept the approach taken in this patchset (I can remove
software nodes and make the whole thing ACPI static nodes self-contained) ?

One way or another this ought to be sorted, please all let me know your
take on this.

Thanks,
Lorenzo

