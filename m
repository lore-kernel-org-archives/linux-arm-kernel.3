Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCC6C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 10:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T79mO8RfFtSmB6j81nq2g+IuZf6o6aRkee1Vz+SAVHI=; b=thw3m/RAPgXhhshK4CPB9GIcBT
	Ht6Q9EerjKL2ssfZmZPM0wbLJdICfnAlIDQCq2FXBHPCoTFwFWG1/KzVr6qYh0PImtzpDfEsSYIYw
	N7w1gwIUfPexM+VIJeZSIdSFNbFGvGbN7rRnAF1iJjvrOtr9VMX6rb79ame9a0fId8hqn6v24oWAd
	78Fb0H6oWwoSozkDllJLqplJiJH/2TdeGMsReZ8dIEOL8hsJzp1T1NO73prm0vOvzOtSiEdCaJWTT
	eqZ7BtFKcerD9L9/+fPsWvRIk+1rVmNZ9CSpzfga0hHDUuchMkgh53c9mzgRMlbgtzysqaRo/7jB+
	GttMwFTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3Zd-0000000D8Pt-2ZeO;
	Fri, 25 Sep 2026 10:54:37 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3Za-0000000D8PW-4BNI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 10:54:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790333675; x=1821869675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eW3NlcY9rz1RWvEA+xMyp3+IKIZ5dfni2x0WYBdu1Zc=;
  b=YpTTLSwrR1mWIfvPVz7uqjwycT31umZtGhGpJo+cUxMIaG5OX2SYdnRd
   1Mjn9eed0vEQaJ9ZUns7NCGdCByDnvm2Glmz3BH0Zd7t39oFDzu5ORDCN
   UACmCERcXmMDz0eXTkNEJd+9wGzwjY60Pghs3bA1p7vEApQmGZpHcryzj
   aIjH4tvQ8RKaf7psiBWhGogWZ64ZZq0BuSnpDF83oSAiTUw/awKheqhTk
   5PN9l9iz6+JvpNbl2v0iVQQ5eMP3RfZWNe/5S3jjHxqT/Mt5UCf090YHj
   4DiOlBTAcJDIaXegFwcjAl+3x52JKc+eFW+FHHusBDkNklXf7gPi2JAcO
   Q==;
X-CSE-ConnectionGUID: fJYCnMJTQ0yIAjTqFTsH9g==
X-CSE-MsgGUID: eg6BL5YrQxGrO8IPiLIaow==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90076207"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90076207"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:54:34 -0700
X-CSE-ConnectionGUID: t7/XvLctRKC6Kwl9xjQKSQ==
X-CSE-MsgGUID: 4Z7fXr+dSeaftPoz/pks3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="272883219"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.27])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:54:29 -0700
Date: Fri, 25 Sep 2026 13:54:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
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
Message-ID: <arZS4vwxps01dGb7@ashevche-desk.local>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
 <arZDwutoadki7tiZ@ashevche-desk.local>
 <arZNL9BnTGK0Klwc@red-moon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arZNL9BnTGK0Klwc@red-moon>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_035435_083950_C9F8F4B3 
X-CRM114-Status: GOOD (  26.78  )
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

On Fri, Sep 25, 2026 at 12:30:07PM +0200, Lorenzo Pieralisi wrote:
> On Fri, Sep 25, 2026 at 12:49:54PM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 25, 2026 at 09:48:01AM +0200, Lorenzo Pieralisi wrote:

...

> > > +static int acpi_static_fwnode_read_u32_prop_index(const struct fwnode_handle *fwnode,
> > > +						  const char *propname,
> > > +						  unsigned int index, u32 *value)
> > > +{
> > > +	u32 *values;
> > > +	int ret, count;
> > > +
> > > +	count = fwnode_property_count_u32(fwnode, propname);
> > > +	if (count < 0)
> > > +		return count;
> > > +
> > > +	if (index >= count)
> > > +		return -ENOENT;
> > > +
> > > +	values = kcalloc(count, sizeof(*values), GFP_KERNEL);
> > > +	if (!values)
> > > +		return -ENOMEM;
> > > +
> > > +	ret = fwnode_property_read_u32_array(fwnode, propname, values, count);
> > > +	if (!ret)
> > > +		*value = values[index];
> > 
> > Use standard pattern, id est
> > 
> > 	if (ret)
> > 		...
> > 
> > > +	kfree(values);
> > 
> > You want to use __free()
> > 
> > > +	return ret;
> > > +}
> > 
> > I believe the whole approach is suboptimal, if you wish get indexed value (but why?)
> 
> Why what (that's what the irq_get() interface requires ?) I agree it is
> suboptimal - the whole point of the series is an RFC on using properties
> to store GSI number/flags, then how to read them we will optimize it
> when/if we agree that's the approach to be taken.

Why to have indexed APIs. The callers usually do not want a single item from an
array, they want all of them or a big pile (exception is the array of strings,
but we have matching functions for that).

As per approach, this patch is against device property and I don't think we are
going to agree on the approach taken in *this* patch.

> > it needs to be retrieved as that in the guts of ACPI. Allocating memory for the whole
> > array to retrieve a single element is simply wrong.

...

> > > +#define ACPI_IRQ_PROP_GSI		"linux,acpi-gsi"
> > > +#define ACPI_IRQ_PROP_GSI_TRIGGER	"linux,acpi-gsi-trigger"
> > > +#define ACPI_IRQ_PROP_GSI_POLARITY	"linux,acpi-gsi-polarity"
> > 
> > Oh... This sounds like a big ugly hack.
> 
> That does not help much I am afraid.
> 
> What's a ugly hack ? Property names ? Using properties for this purpose ?

Yes, properties started with "linux," for some core functionality.
Yes, using properties for this also doesn't sound right. I think the problem
here is in the table specifications or somewhere that deep. That's why we
ended up in this series.

> Again, it is an RFC for this specific reason and I mentioned that in the
> cover letter, thank you for your inputs.

And here we have a discussion started :-)

P.S. Looks like I was too quick to jump into this thread. I will wait for
others to share their view on all this.

-- 
With Best Regards,
Andy Shevchenko



