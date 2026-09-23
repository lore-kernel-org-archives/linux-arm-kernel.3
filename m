Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73094C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BL+WnRgTUR3lxWEoLwPKnupRU+QV+lSqW+henCEvPZA=; b=1/zq0Whxl/N6s0Q4hMCI5Mb7Ve
	cn1cO6zvUWFpkJAgO16JwJc7mvBn5V1hAoPINYrDHpDAo13WFIgWXdZzwjA9ESHL+5c13g3niLhaC
	jY2otb2wwACYc9QFNnvqB5TuJda0jm9A8hXn6YVFD8ItiRUt9CET7eu/mLpsxv8/BOX75WpAkuktS
	5qQo7o9ykazoWgP0aMbKa5oUIjGTnxt3ptQH45/HizrH1lpFTDeNPwT5nhsq3N/pHyOYSnLonqckS
	sRjD2e+gvLblWHzYcV3BLjCMU1TY3s5Xf8AeA7iQe49QjC6fwiHX31QDWdRzmVyfkeKBgwvXpa5tN
	Kko0/oGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OVt-00000008cbV-3e3p;
	Wed, 23 Sep 2026 15:04:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OVs-00000008caT-0oJL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:04:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BL+WnRgTUR3lxWEoLwPKnupRU+QV+lSqW+henCEvPZA=; b=eEViGsOpSVpPEoAkYK1/IKQV+R
	lL8O+NYmMQx1Z8TT5h3acDSBgMFNoaTfpvInc2GTLPGQYCCNFYVLtTLSFZn/sO+2kBJLUOTOECXc7
	PyMwMwVE1KiV4PjxoQU+Q4GFQ9zSfN1ctRmrjNcgkMjDSGwEqyqwj/CpX4keHhzJmNeM7GkPC8BqJ
	DXdmQjFzP6aKWohlFyPaIAwWE8CacbYg8Q1AVkQlfbrIcj4BWY7d/kh/F1+OZNTDKCVXBHJ84bbvt
	oLZuHdMYoSY5+7ZsKn/6TzKPQuzF3NaUtKAi0uQaf+c3qEbJeFTTt7zGVaqqk92qfq7Qh1h5rlYfw
	iP5HgsGg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9OVm-0000000EtmN-0jri
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:03:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C412C1570;
	Wed, 23 Sep 2026 08:03:46 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C95553F86F;
	Wed, 23 Sep 2026 08:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790175830; bh=0/Lj5CUiANscmDe5noqB4vYNxkuMu46O/4p4y5g+oM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mlj83BjIHBZYjSrBtJmqIr+9CLtBC7UmNQlFU8rEIHE/TUvAVxz8URr5clFDN5JhL
	 Eqzi1JZ36x6RqiJ/O+SNUS02F4fDI4y1KcltMRlvOovoWnQYuFkTlLI9Qf9pXLSIan
	 dT5QpURCYu+VIG7cFsGk47C8C5k5+fkYRNVQbU1A=
Date: Wed, 23 Sep 2026 16:03:42 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v12 03/25] firmware: arm_scmi: Introduce protocol
 instance notifiers
Message-ID: <arPqThLW7jjbLRJO@pluto>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
 <20260920091928.2014972-4-cristian.marussi@arm.com>
 <c80354c7-0153-4a82-a9a1-9e2fd2929449@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c80354c7-0153-4a82-a9a1-9e2fd2929449@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_160355_733324_017007AD 
X-CRM114-Status: GOOD (  24.78  )
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

On Tue, Sep 22, 2026 at 03:44:48PM +0200, David Hildenbrand (Arm) wrote:
> On 9/20/26 11:19, Cristian Marussi wrote:
> > SCMI Protocol notifications are typically used by SCMI drivers to detect
> > and react to particular conditions: this was the assumption and the classic
> > usage scenario upon which the SCMI notification framework was built.
> 
> Was the paragraph supposed to start with "SCMI notifications" ? Because later
> you describe how some protocols might want to reuse the "existing SCMI
> Notifications machinery", and here you talk about the traditional usage.

Indeed.

> 
> > -	mutex_lock(&info->protocols_mtx);
> > -	pi = idr_find(&info->protocols, protocol_id);
> > +	scoped_guard(mutex, &info->protocols_mtx) {
> > +		pi = idr_find(&info->protocols, protocol_id);
> > +		if (pi) {
> > +			refcount_inc(&pi->users);
> > +		} else {
> > +			const struct scmi_protocol *proto;
> >  
> > -	if (pi) {
> > -		refcount_inc(&pi->users);
> > -	} else {
> > -		const struct scmi_protocol *proto;
> > +			/* Fails if protocol not registered on bus */
> > +			proto = scmi_protocol_get(protocol_id, &info->version);
> > +			if (!proto)
> > +				return ERR_PTR(-EPROBE_DEFER);
> >  
> > -		/* Fails if protocol not registered on bus */
> > -		proto = scmi_protocol_get(protocol_id, &info->version);
> > -		if (proto)
> >  			pi = scmi_alloc_init_protocol_instance(info, proto);
> > -		else
> > -			pi = ERR_PTR(-EPROBE_DEFER);
> > +			if (IS_ERR(pi))
> > +				return pi;
> > +
> > +			proto_notifier_nb = READ_ONCE(pi->pno.nb);
> > +		}
> > +	}
> > +
> > +	if (proto_notifier_nb) {
> > +		if (scmi_protocol_notifier_register(pi->handle, &pi->pno))
> > +			dev_warn(handle->dev,
> > +				 "Failed to register protocol notifier\n");
> 
> 
> 	if (proto_notifier_nb &&
> 	    scmi_protocol_notifier_register(pi->handle, &pi->pno))
> 		dev_warn(handle->dev, ...)
> 
> As we dropped the mutex, I assume somebody else could move ahead and
> refcount_inc(&pi->users) + return before the notifier was registered? Is that
> expected?
>

It is more of a problem on the release path...in fact...these limit
condition are an open residual issues...
 
> 
> >  	}
> > -	mutex_unlock(&info->protocols_mtx);
> >  
> >  	return pi;
> >  }
> > @@ -2366,13 +2398,35 @@ int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id)
> >  void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
> >  {
> >  	struct scmi_info *info = handle_to_scmi_info(handle);
> > +	struct notifier_block *proto_notifier_nb = NULL;
> >  	struct scmi_protocol_instance *pi;
> >  
> > -	mutex_lock(&info->protocols_mtx);
> > -	pi = idr_find(&info->protocols, protocol_id);
> > -	if (WARN_ON(!pi))
> > -		goto out;
> > +	scoped_guard(mutex, &info->protocols_mtx) {
> > +		pi = idr_find(&info->protocols, protocol_id);
> > +		if (WARN_ON(!pi))
> > +			return;
> >  
> > +		/*
> > +		 * If a protocol notifier was registered and this is the
> > +		 * last istance releasing the protocol, mark the notifier
> 
> s/istance/instance/
> 
> > +		 * for un-registration: note that the notifier itself counts
> > +		 * as one user, as for any other regular notification, so if a
> > +		 * protocol notifier is registered and there are only 2 users
> > +		 * active we can derive that this is the last protocol
> > +		 * instance de-registering.
> > +		 */
> > +		if (scmi_protocol_notifier_registered(&pi->pno) &&
> > +		    refcount_read(&pi->users) == 2)
> > +			proto_notifier_nb = READ_ONCE(pi->pno.nb);
> > +	}
> > +
> 
> We drop the mutex now temporarily. What happens if another instance gets
> registered (incrementing &pi->users) just after we dropped the lock and
> unregister the notifier?
> 
> Shouldn't we care about that or why is it ok?

I'll try a slight different approach for this...till now I was looking for the
least possible invasive ways of dealing with the fact that the core SCMI mechanisms
were NOT originally designed to deal with in-protocol users but just with
external SCMI drivers...

Thanks,
Cristian

