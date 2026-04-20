Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218C2F36C51
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wP4/KJBDU8qUkLu4kWJBh4G/OQO5e1M+1s0MTVghO4=; b=eLftSHE5gzQ0gn2h30p/1Fs9WU
	i8rHG8BKZXWVvLVkKxtLNIDtnognyEOBmKNXJG2TObRzIHKU5YAja8Vr0+MdtvgS/ve23XVPk3eFp
	QaEVhbJVSSQrLzwTwQ4i0snQ1BEYBTm705BK0VRG515M/thnS6iO0AR36+EDfZGYUcOpdpRV9YMPI
	Fuuce8JKZDZGITM9bWRtJVGOux47Xw6nQSgbV4qudBFjcFATzvGeo2S6v+b30YuNGPuaieqm2utIu
	iXOOaPgy7ZbINcVgibu/OfUILdUS3sMJh0MBCvpL5qo2yFl+6lDIHdu+K6DiaZoNEHLi/+7yHqWwS
	pMvjNkBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEjdB-00000006Zmi-2tAu;
	Mon, 20 Apr 2026 08:05:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEjd7-00000006Zmb-3CcX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 08:05:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6ED4160055;
	Mon, 20 Apr 2026 08:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA67C19425;
	Mon, 20 Apr 2026 08:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776672316;
	bh=MMupEMtX6NN4l5jTf+bz3F5R6Vo4CjtgyIq7YTbFxHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LykavP4pX3GCYTqTdeEIBtIbX2DFZs8B3m6RCglX/J79jIEazMhTA/jfI/Sz6kS0t
	 EA81PvZXntRDBoIBhWQM68Sk1Inud9l6WkYI/yut6CarTLOqKJAe94IELYel9aIbRM
	 Hc5HKHnCor3a4biY021qGQM2JgimR27cRrxQmTaw=
Date: Mon, 20 Apr 2026 10:05:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm_pmu: acpi: fix reference leak on failed device
 registration
Message-ID: <2026042058-charm-storable-4ad8@gregkh>
References: <20260415174159.3625777-1-lgs201920130244@gmail.com>
 <ad_WmuauLJ3xDKqh@J2N7QTR9R3>
 <2026041603-guts-crested-ef76@gregkh>
 <aeCOdWLaVpH-5w8s@hovoldconsulting.com>
 <aeCsLy-45QyeCwGA@J2N7QTR9R3>
 <aeXVr5enpjb3rfq7@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeXVr5enpjb3rfq7@hovoldconsulting.com>
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

On Mon, Apr 20, 2026 at 09:28:47AM +0200, Johan Hovold wrote:
> On Thu, Apr 16, 2026 at 10:30:23AM +0100, Mark Rutland wrote:
> > On Thu, Apr 16, 2026 at 09:23:33AM +0200, Johan Hovold wrote:
> 
> > > It's not just the platform code as this directly reflects the behaviour
> > > of device_register() as Mark pointed out.
> > > 
> > > It is indeed an unfortunate quirk of the driver model, but one can argue
> > > that having a registration function that frees its argument on errors
> > > would be even worse. And even more so when many (or most) users get this
> > > right.
> > 
> > Ah, sorry; I had missed that the _put() step would actually free the
> > object (and as you explain below, how that won't work for many callers).
> > 
> > > So if we want to change this, I think we would need to deprecate
> > > device_register() in favour of explicit device_initialize() and
> > > device_add().
> > 
> > Is is possible to have {platfom_,}device_uninitialize() functions that
> > does everything except the ->release() call? If we had that, then we'd
> > be able to have a flow along the lines of:
> > 
> > 	int some_init_function(void)
> > 	{
> > 		int err;
> > 	
> > 		platform_device_init(&static_pdev);
> > 	
> > 		err = platform_device_add(&static_pdev))
> > 		if (err)
> > 			goto out_uninit;
> > 	
> > 		return 0;
> > 	
> > 	out_uninit:
> > 		platform_device_uninit(&static_pdev);
> > 		return err;
> > 	}
> > 
> > ... which I think would align with what people generally expect to have
> > to do.
> 
> The issue here is that platform_device_add() allocates a device name and
> such resources are not released until the last reference is dropped.
> 
> It's been this way since 2008, but some of the static platform devices
> predates that and they both lack a release callback (explicitly required
> since 2003) and are not cleaned up on registration failure.
> 
> Since registration would essentially only fail during development (e.g.
> due to name collision or fault injection), this is hardly something to
> worry about, but we could consider moving towards dynamic objects to
> address both issues.

Agreed, this whole thing, including the error handling, is all just
theoretical as no real user ever hits this, which is why it has been
_way_ down my priority list.

> We have a few functions for allocating *and* registering platform
> devices that could be used in many of these cases (and they already
> clean up after themselves on errors):
> 
> 	platform_device_register_simple()
> 	platform_device_register_data()
> 	platform_device_register_resndata()
> 	platform_device_register_full()
> 
> and where those do not fit (and cannot be extended) we have the
> underlying:
> 
> 	platform_device_alloc()
> 	platform_device_add_resources()
> 	platform_device_add_data()
> 	plaform_device_add()
> 
> But there are some 800 static platform devices left, mostly in legacy
> platform code and board files that I assume few people care about.

Yes, I agree that we do have all of the needed apis here already, we
should just work at converting existing drivers to the new apis OR just
not caring at all as again, no one will ever hit these code paths :)

thanks,

greg k-h

