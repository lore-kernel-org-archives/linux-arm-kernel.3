Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B2CC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 11:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hGEN5Pw3qyGq1o8/Aw8crO7pIFvigQKaSany5lXKEo=; b=b9CBENV4f4DTF3weIcTmnNBbjL
	rm3UGs21EP3HpJTeckwa/jNA9hMQIzZljdha8AmdiGOLOqaRpw/1azbEXsCWk27odNcN/+zSJLVrU
	JqTiLWOc/1pJHk2cfVGAvhte467OjW0l5GvO8tb2UqqEcEzCfHea7vfpFBdurEv9vJ3xYzxZILnBI
	5mZNFBDPXKtYy4VppgHJYnIRT26vEQEwM7o674mEGS4nzLsHkpjQ2Ug4E42Zr8ewB9Qtqu/S+WyxG
	d6LYpb9NL1upnAx2FLYn6jS715HdqtpWwODcSi9U9X58xyUJFk8ePCY330PsLs4VSJHDZ53fSt1Z5
	1DPMXAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4Ad-0000000DCjI-004t;
	Fri, 25 Sep 2026 11:32:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4AS-0000000DCgZ-1BaG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 11:32:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B63E643C8F;
	Fri, 25 Sep 2026 11:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BEE1F00899;
	Fri, 25 Sep 2026 11:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790335959;
	bh=7hGEN5Pw3qyGq1o8/Aw8crO7pIFvigQKaSany5lXKEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K7td/OLi9HNrH+3v52Wtzwe7VfnGioRCKEGdblQS4OqMr7PYJX8K7WJ9AQ3NYNX0l
	 HuvsuH+44lOpARJtiTohrYQYPMjANbSrqq0KASM6ufl5DR7CPkGm8DNOCogaU8nThY
	 DumpgT+70w4CJnCwFqfBnyziF//nDmrVHip4zb/zlgjQGP4JWPBr2P5GVwnuVWl+LT
	 GjSbxQmHXWneQS8XAPt2JDEzWWO3rx08EyvfPIsQ4j25UcYVzU+fSS9GCy1wKOFcEI
	 f3+S+UvDhkT2fsGtaAUQkCI3bVtjtpinBLLUqrfmgOzrfEaJHBEcB8rT14mraIib/b
	 qusSihdr/8tNg==
Date: Fri, 25 Sep 2026 13:32:32 +0200
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
Message-ID: <arZb0Cj3I7IvfmeK@red-moon>
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
> 
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

I added a name for those out of thin air, again - the question is on
the approch, properties I can call them whatever we like.

I am not a fan of those myself, as mentioned in the cover letter.

> Yes, using properties for this also doesn't sound right. I think the problem
> here is in the table specifications or somewhere that deep. That's why we
> ended up in this series.
> 
> > Again, it is an RFC for this specific reason and I mentioned that in the
> > cover letter, thank you for your inputs.
> 
> And here we have a discussion started :-)

Thanks !

> P.S. Looks like I was too quick to jump into this thread. I will wait for
> others to share their view on all this.

No, thank you for chiming in so promptly. The main aim is to keep most
of the drivers and API unchanged for a bunch of devices created out of
static tables - ie minimize changes as much as possible, that's the
purpose.

Thanks,
Lorenzo

