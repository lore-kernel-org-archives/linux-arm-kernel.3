Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB9FCA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 07:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jT2zf9su+V2G9GQXB3y4tFuNVD9WDBdAXweFNBBIfQ4=; b=aIWAkgwHIwO8Efi9zBEmLjWQhO
	jnwglFEtJG93RxuBdy8S9hwY+74RYNtdgTVrrPnnLW3Ze6aHtzhLSkaEmL+1cyKow9xoU8vvm10ne
	gX76iThjhDkKFAt1Nq5ETLc/RZrjXMRcDpm6Rm5Zrv0onRjxzi5MjaGr43H6r3jNtOutrbaUQSm6Y
	uwauwFeavTCaYxhSlCVfPKoT/hQgGBH6Vvr8Qi00UOCqwVDnXZ3fb1Xx2ovZ9JLpUdkE7utHNEuHQ
	iMnsxMkdepgK6rI8YU/Mmjv+XOcBLd79KoBPWHdzOnv3CEuTCuHtYnDuY34U/elQTW6k1+jqWCbZg
	3a5POfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMJy-00000001suY-0JEf;
	Wed, 07 Oct 2026 07:44:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMJw-00000001stL-1pVc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 07:44:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DDE06600C8;
	Wed,  7 Oct 2026 07:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78D51F0089C;
	Wed,  7 Oct 2026 07:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791359051;
	bh=jT2zf9su+V2G9GQXB3y4tFuNVD9WDBdAXweFNBBIfQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V1nco5hzrKpmdyxWlo78fqQDnQdFOcKLGh3v/x1fb/R9gMtxn/jWl84KV+iPj9S8d
	 34tD8XwWEOLrsTRuR5yzkSvYkzhDh1mlfWnoMIYtmcQUx5dJG4IkTyoVjF/zyrs9mU
	 0JL7kEU7bPc5M8Yzvg8SQmG27ZndbWL0cqdrQILcghZWFVIwkVfKcZSms0IoMeKmru
	 TGZRRyW7heB3FEcJm+l5bxF1hoahss0GV2QXOLEZZ2QODk6Ea44kd3h6MCuwMDKRg8
	 vZhIwzyDhNDPYiTr3/lmavwZJZ4nvDaQUNNG4rD4X1fdKXPSyf59k3Nc2jnVwK2Qxa
	 m+jEyC+dk1PVQ==
Date: Wed, 7 Oct 2026 09:44:04 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
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
Message-ID: <asX4RPKF5IbUNd-n@red-moon>
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

Thanks Robin.

Yes, those are the possible options, last one requiring a look-up
from fwnode to the data providing GSI numbers/flags for that specific
fwnode - we do have that for IORT but I need to check for other
devices.

To be honest, I implemented the three of them while prototyping, it is just
a matter of choosing which one we want to support to sort this out.

Thanks !
Lorenzo

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

