Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C67CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mu/CPFzTmBED1dYYEdL1wb31e8gnCNr6zbyYfEGeB0Y=; b=dQzo12MpDtP7g9i8FXOjSHrODJ
	I5TeiNkHeSfJt8EqEJZTOGqBwxseSE5USeKqhNL78MmVmpRNu9/wd3vbH10hKQTVbYwmwnew0IevB
	eBI4385ZseZzK6VaN89NHEDEC+yY7iuJjilRxq4+rsyFgO5CY7qKrikIHdH3m3SUNpl8ggpCsNTHL
	DT0znyBzRGA+P08UFXYirc5OD2uK4vf94lUaIoh+1MC+Pfy9G0UwLNLrvtq+5bbmrBFnRum/xc+qo
	Apke2z++PY8aVRkc8qigBm3CMgRjqbQjgLXM4juzTLLwKYfTigFpDbuNuzD10K5o7lbS1Fw5Z4ra9
	GEgqlhmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8dD-0000000GRWp-3hRB;
	Tue, 21 Oct 2025 09:26:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8d9-0000000GRWF-3X5O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:26:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E8441063;
	Tue, 21 Oct 2025 02:26:02 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD5063F66E;
	Tue, 21 Oct 2025 02:26:08 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:26:06 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/8] firmware: arm_scmi: Convert OF-only paths to generic
 fwnode in SCMI core
Message-ID: <20251021-fractal-resilient-aardwark-f8deb6@sudeepholla>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <20251017-acpi_scmi_pcc-v1-3-0adbab7709d9@arm.com>
 <20251020182949.00002bbf@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020182949.00002bbf@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_022611_999986_1838FD53 
X-CRM114-Status: GOOD (  45.46  )
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

On Mon, Oct 20, 2025 at 06:29:49PM +0100, Jonathan Cameron wrote:
> On Fri, 17 Oct 2025 14:23:46 +0100
> Sudeep Holla <sudeep.holla@arm.com> wrote:
> 
> > Switch SCMI core plumbing from struct device_node* to struct
> > fwnode_handle* so transports and core code work with both DT and
> > ACPI firmware descriptions.
> > 
> > This change:
> >   - Replaces of_* property lookups with fwnode_property_*() helpers.
> >   - Switches child enumeration to
> >     fwnode_for_each_available_child_node_scoped().
> >   - Plumbs fwnode through the SCMI device creation and channel setup
> >     paths and updates transport ->chan_available() signatures to take a
> >     fwnode.
> >   - Stores the per-protocol child fwnodes in info->active_protocols so
> >     the core can later locate the descriptor for a given protocol ID.
> >   - Update mailbox/optee/smc/virtio transports to accept fwnode and
> >     map to OF nodes where needed
> > 
> > DT-only transports (mailbox/optee/smc) still parse DT properties by
> > mapping the fwnode back to an OF node; on non-DT (e.g. ACPI) systems
> > these transports will report no channel available.
> > 
> > This refactor is a prerequisite for adding an ACPI-first transport like
> > PCC and brings the SCMI core closer to DT/ACPI parity. This is a mechanical
> > step towards firmware-node neutrality; DT users continue to work unchanged,
> > and ACPI paths can be enabled on top.
> > 
> > No functional change is expected on DT platforms; ACPI platforms can now
> > discover and participate in SCMI where a suitable transport is present.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> Hi Sudeep
> 
> A few comments inline. The reference counting on fwnodes gets a bit complex in
> here so my review more or less skips that bit (it's end of day!)
> 

No, I had exactly same thoughts and I did mention about this briefly to
Cristian before posting as I couldn't follow the existing refcounting 🙁.
I need to catch up with Cristian and align ourselves before the next version.

> > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > index bd56a877fdfc..bc5fea11b5db 100644
> > --- a/drivers/firmware/arm_scmi/driver.c
> > +++ b/drivers/firmware/arm_scmi/driver.c
> 
> > @@ -2820,7 +2820,7 @@ static int scmi_chan_destroy(int id, void *p, void *idr)
> >  		struct scmi_info *info = handle_to_scmi_info(cinfo->handle);
> >  		struct scmi_device *sdev = to_scmi_dev(cinfo->dev);
> >  
> > -		of_node_put(cinfo->dev->of_node);
> > +		fwnode_handle_put(dev_fwnode(cinfo->dev));
> 
> This may follow on from earlier thing about device_set_node().
> I think this is freeing a reference that will never have been gotten if you
> follow what I suggest there.  Note that I'm fairly sure it was never
> gotten for acpi anyway.  However this might be a different fwnode, I'm lost
> on that front.
> 

Even I was lost and wanted to revisit this whole reference counting once again
before these changes find its way upstream.

> >  		scmi_device_destroy(info->dev, id, sdev->name);
> >  		cinfo->dev = NULL;
> >  	}
> 
> > @@ -3118,8 +3119,8 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
> >  		 trans->desc.max_msg);
> >  
> >  	/* System wide atomic threshold for atomic ops .. if any */
> > -	if (!of_property_read_u32(dev->of_node, "atomic-threshold-us",
> > -				  &trans->desc.atomic_threshold))
> > +	if (!fwnode_property_read_u32(dev_fwnode(dev), "atomic-threshold-us",
> 
> device_property_read_u32() Same for all the other places where the fwnode
> is simple dev_fwnode(dev) and there is a suitable helper.
> 

Ah OK, didn't notice that, thanks for the pointer.

> 
> > +				      &trans->desc.atomic_threshold))
> >  		dev_info(dev,
> >  			 "SCMI System wide atomic threshold set to %u us\n",
> >  			 trans->desc.atomic_threshold);
> 
> > @@ -3262,10 +3262,10 @@ static int scmi_probe(struct platform_device *pdev)
> >  
> >  	scmi_enable_matching_quirks(info);
> >  
> > -	for_each_available_child_of_node(np, child) {
> > +	fwnode_for_each_available_child_node_scoped(dev_fwnode(dev), child) {
> I don't think there is an exit path in here, so this is functionally the same
> as the non scoped version.
>

I get you point.

> Also, if you are gong to use dev_fwnode use
> 	device_for_each_child_node() and don't worry about the available.
> I think the patch merged that made device_for_each_child_node() only
> consider the available ones for all firmware types.
> 

Not sure if I fully understand yet, but will revisit this again before
next version.

> >  		u32 prot_id;
> >  
> > -		if (of_property_read_u32(child, "reg", &prot_id))
> > +		if (fwnode_property_read_u32(child, "reg", &prot_id))
> >  			continue;
> >  
> >  		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
> > @@ -3278,10 +3278,11 @@ static int scmi_probe(struct platform_device *pdev)
> >  		}
> >  
> >  		/*
> > -		 * Save this valid DT protocol descriptor amongst
> > +		 * Save this valid fwnode protocol descriptor amongst
> >  		 * @active_protocols for this SCMI instance/
> >  		 */
> > -		ret = idr_alloc(&info->active_protocols, child,
> > +		ret = idr_alloc(&info->active_protocols,
> > +				fwnode_handle_get(child),
> 
> This change is a little subtle to be buried in here and I'm fairly sure
> it is an unintended functional change.  If idr_alloc() fails the continue
> and loop iterator magic, will drop the reference held by the loop but
> not this one.  So it will leak a reference.
> 
> If this does make sense, do it in a precursor patch before changing away
> from of only.
> 

Indeed, I can't recall why I have added the reference counting here. It can
be dropped, will give it another thought to see if anything strikes my mind.

> >  				prot_id, prot_id + 1, GFP_KERNEL);
> >  		if (ret != prot_id) {
> >  			dev_err(dev, "SCMI protocol %d already activated. Skip\n",
> > @@ -3289,7 +3290,6 @@ static int scmi_probe(struct platform_device *pdev)
> >  			continue;
> >  		}
> >  
> > -		of_node_get(child);
> >  		scmi_create_protocol_devices(child, info, prot_id, NULL);
> >  	}
> >  
> 

-- 
Regards,
Sudeep

