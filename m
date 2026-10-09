Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2E2CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JwBUaKiDw3DL4V1VblyqY4NlQUKc0x+WHZ55mtpZGk=; b=AIDy/2eZncosRq8ujqbc2EMoOX
	GnAdVhBstvC+PkyispopG3ZqbCV1ssHb1APvGXMQanKSuGTRz5OSlYvVcVqXqJqbheymNLbzdT2jV
	ZQ7/yhi57H9m7Rf+k9ELEb52C0akHEgYIpldJ0llvCejNUGKQ8ot/cuNvV6o0FnpQ/HEuEBkCNUm8
	SSbU4GkwCDUnHPf8Mj6rZ8aYWwLoPfUQQIKUY0KvB5Wo0NF0BnLBDK7WQFVKstj0/mt7l+C3UM3wv
	E8Gonu7FMxlAY+m/LKsCfKkMUgDvp1YyKV98bjDN6VUPx8XcyOMVcgI9+QW9RAKqnFdJ//qzKtH7K
	Defg5i+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5Tf-00000005loG-0aHu;
	Fri, 09 Oct 2026 07:57:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5Td-00000005lnb-1SNO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 07:57:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BB35C602CC;
	Fri,  9 Oct 2026 07:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888031F000FF;
	Fri,  9 Oct 2026 07:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791532632;
	bh=7JwBUaKiDw3DL4V1VblyqY4NlQUKc0x+WHZ55mtpZGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iXBkcs1ozdItQ91Qzqsd9bSnGiaVHmmQXgWX31nAahFHARHVMlRC01fE/XmvxTcaB
	 AxmiA9IBMQT1BEgvXWlPPqAKWJ1DK7wtvu/u33eqUlFHZ5HJ518T+j+TlvK48tFoO+
	 vcoithhATsDmOJrOHoFlumiaZLTwOKF1O3v+Lusa8xnFhppIegGSvCTuXkY1zQ1Z+N
	 sEAtMFWBHxxprOVTOQq9vwB98xCsb0zzQaYeZTpImM/zWsPiBhtxLWuBeTdah0I/Tv
	 OcXDTvxQXr65PFPpvxoqiA5WZgehZIlTzQeKPoKAWYRsJm6Zpg939xRbs8gJnnBjV6
	 IaytI+HxCZvKg==
Date: Fri, 9 Oct 2026 09:57:02 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Message-ID: <asieTvinZ7c2QpQm@red-moon>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
 <arZDwutoadki7tiZ@ashevche-desk.local>
 <arZNL9BnTGK0Klwc@red-moon>
 <arZS4vwxps01dGb7@ashevche-desk.local>
 <arqSqcoWAkhy-8do@red-moon>
 <d1720b63-65bf-4019-bc19-1852555f7993@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1720b63-65bf-4019-bc19-1852555f7993@arm.com>
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

On Tue, Oct 06, 2026 at 05:19:23PM +0100, Robin Murphy wrote:
> On 28/09/2026 5:15 pm, Lorenzo Pieralisi wrote:
> > On Fri, Sep 25, 2026 at 01:54:26PM +0300, Andy Shevchenko wrote:
> > > On Fri, Sep 25, 2026 at 12:30:07PM +0200, Lorenzo Pieralisi wrote:
> > > > On Fri, Sep 25, 2026 at 12:49:54PM +0300, Andy Shevchenko wrote:
> > > > > On Fri, Sep 25, 2026 at 09:48:01AM +0200, Lorenzo Pieralisi wrote:
> > > 
> > > ...
> > > 
> > > > > > +static int acpi_static_fwnode_read_u32_prop_index(const struct fwnode_handle *fwnode,
> > > > > > +						  const char *propname,
> > > > > > +						  unsigned int index, u32 *value)
> > > > > > +{
> > > > > > +	u32 *values;
> > > > > > +	int ret, count;
> > > > > > +
> > > > > > +	count = fwnode_property_count_u32(fwnode, propname);
> > > > > > +	if (count < 0)
> > > > > > +		return count;
> > > > > > +
> > > > > > +	if (index >= count)
> > > > > > +		return -ENOENT;
> > > > > > +
> > > > > > +	values = kcalloc(count, sizeof(*values), GFP_KERNEL);
> > > > > > +	if (!values)
> > > > > > +		return -ENOMEM;
> > > > > > +
> > > > > > +	ret = fwnode_property_read_u32_array(fwnode, propname, values, count);
> > > > > > +	if (!ret)
> > > > > > +		*value = values[index];
> > > > > 
> > > > > Use standard pattern, id est
> > > > > 
> > > > > 	if (ret)
> > > > > 		...
> > > > > 
> > > > > > +	kfree(values);
> > > > > 
> > > > > You want to use __free()
> > > > > 
> > > > > > +	return ret;
> > > > > > +}
> > > > > 
> > > > > I believe the whole approach is suboptimal, if you wish get indexed value (but why?)
> > > > 
> > > > Why what (that's what the irq_get() interface requires ?) I agree it is
> > > > suboptimal - the whole point of the series is an RFC on using properties
> > > > to store GSI number/flags, then how to read them we will optimize it
> I>>> when/if we agree that's the approach to be taken.
> > > 
> > > Why to have indexed APIs. The callers usually do not want a single item from an
> > > array, they want all of them or a big pile (exception is the array of strings,
> > > but we have matching functions for that).
> > > 
> > > As per approach, this patch is against device property and I don't think we are
> > > going to agree on the approach taken in *this* patch.
> > 
> > Coming back to this, what is needed here is a way to stash the GSI number,
> > flags and name in stardard storage (like OF nodes IRQ properties, ACPI objects
> > _CRS, etc).
> > 
> > To give you some background, I thought about adding an array of:
> > 
> > GSI [number, flags, name]
> > 
> > to the ACPI static fwnode itself. Then basically the irq_get() API has got
> > all the information it needs from the primary fwnode; while doing that I
> > thought that this might have been a bit like reinventing software nodes
> > (granted, software node properties are ways more general that what I suggest
> > above and I don't expect any other property to be ever added to static fwnodes)
> > that's why I put together the series as it is, precisely to understand what's
> > best.
> > 
> > When you say "against device property", what do you mean precisely ?
> > 
> > I suppose you mean that this approach goes against software node properties
> > usage guidelines ?
> > 
> > Anyway, again, it is just to provide some context, we are talking about
> > a bunch of platform devices, it is nice to have a generic solution but
> > it has to be simple enough too given its scope, I understand very well
> > your concern with this approach as-is - it is there to find a way
> > forward together and show what the problem is.
> 
> I guess software node properties look inviting in theory since they're a
> ready-made mechanism for effectively attaching arbitrary data to a fwnode,
> however looking at patches 6-7 and the amount of boilerplate involved in the
> reality, I'm inclined to think that a dedicated structure for static nodes
> is probably the best and most efficient compromise here. The redundancy
> argument rather falls apart once we end up creating copies of those
> contentiously-made-up property name strings for every node, especially given
> that any one of those alone is probably already more than the amount of
> actual data we need per node...
> 
> Perhaps the "purest" option might be to just store a function pointer in the
> fwnode wrapper for each static table type to provide its own internal
> irq_get() callback, so not stashing intermediate GSI data at all, but I
> suspect that might end up being more work overall.

Hi Rafael, Robin,

I have not started prototyping it yet but I have got a question as a
follow-up to our chat at LPC about crafting an ACPI device for the static
table entries and sort out the probe dependencies using autodep.

After spur of the moment reaction during the session, I now remember I
thought about crafting an ACPI device for the static table entries and
started digging then bumped into acpi_add_single_object() as you
suggested.

The point though is: what about the acpi_handle and the AML required to
sort out the dependencies using the _CRS ? We have got the info to fill
the _CRS coming from static table entries (MMIO, GSI) but I am not sure how I
can form a full-fledged ACPI namespace object in the kernel, without
that in place I am not sure how the autodep mechanism can possibly
work.

I need to have a deeper look into this next week but I wanted to ask first
whether there was something I missed - most likely.

Thanks !
Lorenzo

> 
> Cheers,
> Robin.
> 
> > 
> > Thanks,
> > Lorenzo
> > 
> > > > > it needs to be retrieved as that in the guts of ACPI. Allocating memory for the whole
> > > > > array to retrieve a single element is simply wrong.
> > > 
> > > ...
> > > 
> > > > > > +#define ACPI_IRQ_PROP_GSI		"linux,acpi-gsi"
> > > > > > +#define ACPI_IRQ_PROP_GSI_TRIGGER	"linux,acpi-gsi-trigger"
> > > > > > +#define ACPI_IRQ_PROP_GSI_POLARITY	"linux,acpi-gsi-polarity"
> > > > > 
> > > > > Oh... This sounds like a big ugly hack.
> > > > 
> > > > That does not help much I am afraid.
> > > > 
> > > > What's a ugly hack ? Property names ? Using properties for this purpose ?
> > > 
> > > Yes, properties started with "linux," for some core functionality.
> > > Yes, using properties for this also doesn't sound right. I think the problem
> > > here is in the table specifications or somewhere that deep. That's why we
> > > ended up in this series.
> > > 
> > > > Again, it is an RFC for this specific reason and I mentioned that in the
> > > > cover letter, thank you for your inputs.
> > > 
> > > And here we have a discussion started :-)
> > > 
> > > P.S. Looks like I was too quick to jump into this thread. I will wait for
> > > others to share their view on all this.
> > > 
> > > -- 
> > > With Best Regards,
> > > Andy Shevchenko
> > > 
> > > 
> 

