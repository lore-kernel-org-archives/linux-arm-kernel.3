Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4BBCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l63NqOrmYS7OWhnyJ46rzvQOga2GpeIrimZGoJ6BZws=; b=yfj9jXFdJF7GEzVC2tILSErOXX
	k8JFnXixD5yLuqTuFWwVYwpRee0REwRc/BfFnBDVH16TwOo3PnexCsqUd/+OUzYPRIEericKZfS5+
	qWN7p43D3jOaM5RwOscMXP8F9DzjU8wXdWlCJX2tuS4GqlQOmwyIXL99e8ZqDUvHoC8oWhNS5pbyh
	7CQMzp6WXKgyAxDZNMHe/zcWAbEHcTnoxaQWoOmSkrs7C5A/BPBqvodFEJxAu4jZCLEssfACpW3Db
	MhPyROdNZmMHkObQ7e3T3Lho/7z30EogeE3JJjol42uIoT+jAN/ICTbgneSXxTwVBATZJvmwCdfCS
	W4U8CsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE15-00000000zL6-37ua;
	Mon, 28 Sep 2026 16:15:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE14-00000000zKq-0kRt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:15:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B66B600E2;
	Mon, 28 Sep 2026 16:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B11C1F000FF;
	Mon, 28 Sep 2026 16:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790612145;
	bh=l63NqOrmYS7OWhnyJ46rzvQOga2GpeIrimZGoJ6BZws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E7TBTailbJXOF3b09WyFbluQXA60619reCTcV7CQ8hJeZCyDd6THls1fDs19vu297
	 rR8SB4jBUdSOQTOpSseq0eWB41RvN0qZxgmRWpVKttlRSOeEIH2zcQaW2s1qEQs69+
	 7GHhCbXYaYZwxllF7ZgNBetbO0b5OTBSLiFcOwWXoZ70fNgQIn9EVOG7QvsjSN86h9
	 bR9/gaur1nLKsyx/xu1xCgSsZcueblotdLbcBhLHDeKYXMNEY3/kvd0/mYVIRkENTn
	 OTrF6qIVtKG2xPxWS4ltlL1jAN4ULI0HH5IKQvP7EWRacMLtO9t5xcrqInQ+Ur/f3K
	 t5632UFq8n2PQ==
Date: Mon, 28 Sep 2026 18:15:37 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
Message-ID: <arqSqcoWAkhy-8do@red-moon>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
 <arZDwutoadki7tiZ@ashevche-desk.local>
 <arZNL9BnTGK0Klwc@red-moon>
 <arZS4vwxps01dGb7@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arZS4vwxps01dGb7@ashevche-desk.local>
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

On Fri, Sep 25, 2026 at 01:54:26PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 25, 2026 at 12:30:07PM +0200, Lorenzo Pieralisi wrote:
> > On Fri, Sep 25, 2026 at 12:49:54PM +0300, Andy Shevchenko wrote:
> > > On Fri, Sep 25, 2026 at 09:48:01AM +0200, Lorenzo Pieralisi wrote:
> 
> ...
> 
> > > > +static int acpi_static_fwnode_read_u32_prop_index(const struct fwnode_handle *fwnode,
> > > > +						  const char *propname,
> > > > +						  unsigned int index, u32 *value)
> > > > +{
> > > > +	u32 *values;
> > > > +	int ret, count;
> > > > +
> > > > +	count = fwnode_property_count_u32(fwnode, propname);
> > > > +	if (count < 0)
> > > > +		return count;
> > > > +
> > > > +	if (index >= count)
> > > > +		return -ENOENT;
> > > > +
> > > > +	values = kcalloc(count, sizeof(*values), GFP_KERNEL);
> > > > +	if (!values)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	ret = fwnode_property_read_u32_array(fwnode, propname, values, count);
> > > > +	if (!ret)
> > > > +		*value = values[index];
> > > 
> > > Use standard pattern, id est
> > > 
> > > 	if (ret)
> > > 		...
> > > 
> > > > +	kfree(values);
> > > 
> > > You want to use __free()
> > > 
> > > > +	return ret;
> > > > +}
> > > 
> > > I believe the whole approach is suboptimal, if you wish get indexed value (but why?)
> > 
> > Why what (that's what the irq_get() interface requires ?) I agree it is
> > suboptimal - the whole point of the series is an RFC on using properties
> > to store GSI number/flags, then how to read them we will optimize it
> > when/if we agree that's the approach to be taken.
> 
> Why to have indexed APIs. The callers usually do not want a single item from an
> array, they want all of them or a big pile (exception is the array of strings,
> but we have matching functions for that).
> 
> As per approach, this patch is against device property and I don't think we are
> going to agree on the approach taken in *this* patch.

Coming back to this, what is needed here is a way to stash the GSI number,
flags and name in stardard storage (like OF nodes IRQ properties, ACPI objects
_CRS, etc).

To give you some background, I thought about adding an array of:

GSI [number, flags, name]

to the ACPI static fwnode itself. Then basically the irq_get() API has got
all the information it needs from the primary fwnode; while doing that I
thought that this might have been a bit like reinventing software nodes
(granted, software node properties are ways more general that what I suggest
above and I don't expect any other property to be ever added to static fwnodes)
that's why I put together the series as it is, precisely to understand what's
best.

When you say "against device property", what do you mean precisely ?

I suppose you mean that this approach goes against software node properties
usage guidelines ?

Anyway, again, it is just to provide some context, we are talking about
a bunch of platform devices, it is nice to have a generic solution but
it has to be simple enough too given its scope, I understand very well
your concern with this approach as-is - it is there to find a way
forward together and show what the problem is.

Thanks,
Lorenzo

> > > it needs to be retrieved as that in the guts of ACPI. Allocating memory for the whole
> > > array to retrieve a single element is simply wrong.
> 
> ...
> 
> > > > +#define ACPI_IRQ_PROP_GSI		"linux,acpi-gsi"
> > > > +#define ACPI_IRQ_PROP_GSI_TRIGGER	"linux,acpi-gsi-trigger"
> > > > +#define ACPI_IRQ_PROP_GSI_POLARITY	"linux,acpi-gsi-polarity"
> > > 
> > > Oh... This sounds like a big ugly hack.
> > 
> > That does not help much I am afraid.
> > 
> > What's a ugly hack ? Property names ? Using properties for this purpose ?
> 
> Yes, properties started with "linux," for some core functionality.
> Yes, using properties for this also doesn't sound right. I think the problem
> here is in the table specifications or somewhere that deep. That's why we
> ended up in this series.
> 
> > Again, it is an RFC for this specific reason and I mentioned that in the
> > cover letter, thank you for your inputs.
> 
> And here we have a discussion started :-)
> 
> P.S. Looks like I was too quick to jump into this thread. I will wait for
> others to share their view on all this.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

