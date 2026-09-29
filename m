Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6D1CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wwlrc4OA5be2l/cOfc4ELm7R1PPcfoHaHpyuiOxuo3Y=; b=03GBBG4YGu9LQFxeGbVaHshne0
	kmxQsR95HvpE4kmzbSQeBaFyKCVyHiJLabPi+H/Lwa0DOK9NnTs1Po/ftZaeOTzz0KC+S3ccwlAtx
	j4BtGed/Ueedgf++0IUqDqYFGDDBdmjhpCfGr5P84o1SrYX9RZdRUVBM1E7EMccwjU9Sy2P2wD9kh
	V6PXqye8aPW9y9mi7LXrqsJ7BSe5EoIQPOQqA3GdLLDsCSB4FDP2Y9WtFkWGWzY+8HmdiDyORjQmF
	be7+YEH2rzZLVOiap+PX5Qt24wfnS2UWleLcDLGvKNxJ0isUyoSYyXne2R8uIRP1p1V/0F0YVOdT0
	WeoE039Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTOg-00000002pCH-0u7Y;
	Tue, 29 Sep 2026 08:41:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTOe-00000002pBo-3Hhk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 08:41:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC58560210;
	Tue, 29 Sep 2026 08:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6341F1F000FF;
	Tue, 29 Sep 2026 08:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671267;
	bh=Wwlrc4OA5be2l/cOfc4ELm7R1PPcfoHaHpyuiOxuo3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VCGBkWTvGAAys65g5LYILlIf9iKCwcLFlV12HZy7R3l3OCLy1pRSBhaJqK+tCxWRz
	 BUnQFxvHg6mQzXfdE+oz29U01ZlFC8iLJjcGONGJkaisQMhx91Xij1XTfiiuadGmyq
	 GbbpAtRx3iDnN8Ww78FVy+tCsZrLdgLPuSBOi5yX3sNAU3D3Tmz/fsQ2pa2nSFfJZm
	 pOy1YV1sMgN2pMi+a4tIMsr0qTuzYGSnUZT5KVKpvZuumLNLb8BtXQNjDfHO2T2o7A
	 zggDnaI5j2j4H+pHzoWRWhQQxUY8Z2+LdINYb3duFXB/fMYG0Aqjhf21xu/+2S6i1b
	 g8QJ2utxwgAig==
Date: Tue, 29 Sep 2026 10:40:59 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Ashok Raj <ashok.raj@oss.qualcomm.com>
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
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
Message-ID: <art5m5QPXAOAvkvW@red-moon>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
 <arr3IhF0bwN4uzUP@hu-ashoraj-lv.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arr3IhF0bwN4uzUP@hu-ashoraj-lv.qualcomm.com>
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

On Mon, Sep 28, 2026 at 04:24:18PM -0700, Ashok Raj wrote:
> 
> On Fri, Sep 25, 2026 at 09:48:01AM +0200, Lorenzo Pieralisi wrote:
> > To describe and map GSIs for firmware nodes created out of ACPI static
> > table entries in a uniform way it is required to define some standard
> > properties and attach them to ACPI static fwnode as secondary nodes.
> > 
> > Define properties names to describe GSIs and their trigger-mode/polarity,
> > and implement an irq_get() callback for static fwnodes so that core code
> > can retrieve and map IRQs for ACPI static fwnodes in standard manner.
> > 
> > An empty stub for property_read_string_array() is also added, so that
> > the fwnode_irq_get_byname() interface falls back (through
> > fwnode_property_read_string_array()) to the secondary
> > fwnode to grab the "interrupt-names" property.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Bartosz Golaszewski <brgl@kernel.org>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > ---
> >  drivers/acpi/property.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++-
> >  include/linux/acpi.h    |  4 +++
> >  2 files changed, 72 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
> > index 8ee5a1f0eb48..c609100c08db 100644
> > --- a/drivers/acpi/property.c
> > +++ b/drivers/acpi/property.c
> > @@ -1766,7 +1766,74 @@ static int acpi_fwnode_irq_get(const struct fwnode_handle *fwnode,
> >  
> >  DECLARE_ACPI_FWNODE_OPS(acpi_device_fwnode_ops);
> >  DECLARE_ACPI_FWNODE_OPS(acpi_data_fwnode_ops);
> > -const struct fwnode_operations acpi_static_fwnode_ops;
> > +
> > +static int acpi_static_fwnode_read_u32_prop_index(const struct fwnode_handle *fwnode,
> > +						  const char *propname,
> > +						  unsigned int index, u32 *value)
> > +{
> > +	u32 *values;
> > +	int ret, count;
> > +
> > +	count = fwnode_property_count_u32(fwnode, propname);
> > +	if (count < 0)
> > +		return count;
> > +
> > +	if (index >= count)
> > +		return -ENOENT;
> > +
> > +	values = kcalloc(count, sizeof(*values), GFP_KERNEL);
> > +	if (!values)
> > +		return -ENOMEM;
> > +
> > +	ret = fwnode_property_read_u32_array(fwnode, propname, values, count);
> > +	if (!ret)
> > +		*value = values[index];
> > +
> 
> You lookup with a propname, and then qualify with and index? is it
> possible to have the different index but same propname? 

What is the question :) ? It is to retrieve a property value at a specific
index.

> Alternately you can send the list to caller and they can use the ones
> they need?
> 
> 
> > +	kfree(values);
> > +	return ret;
> > +}
> > +
> > +static int acpi_static_fwnode_read_string_array(const struct fwnode_handle *fwnode,
> > +						const char *propname,
> > +						const char **val, size_t nval)
> > +{
> > +	/* Route string handling to secondary software nodes */
> > +	return -EINVAL;
> > +}
> > +
> > +static int acpi_static_fwnode_irq_get(const struct fwnode_handle *fwnode,
> > +				      unsigned int index)
> > +{
> > +	u32 gsi, trigger, polarity;
> > +	int ret;
> > +
> > +	if (!fwnode->secondary)
> > +		return -ENODEV;
> > +
> > +	fwnode = fwnode->secondary;
> > +
> > +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI,
> > +						index, &gsi);
> > +	if (ret)
> > +		return ret == -ENOENT ? -ENXIO : ret;
> > +
> > +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI_TRIGGER,
> > +						index, &trigger);
> > +	if (ret)
> > +		return ret == -ENOENT ? -ENXIO : ret;
> > +
> > +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI_POLARITY,
> > +						index, &polarity);
> > +	if (ret)
> > +		return ret == -ENOENT ? -ENXIO : ret;
> 
> Consolidate return to one place? 

Yes it can (and trigger and polarity can be just one property "flags", FWIW),
if we agree that's what will do, which I doubt.

Thanks,
Lorenzo

