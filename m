Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6103F8A146
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 09:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I38ScfBQglQ0+pGkfvf8hKnVt0nXOENdafUs4iJeEt4=; b=q7XWBYA8/XJVuaGtDREeK9ZvJm
	3mCz9yMfLeo0WHADYDuGrbYmlVDdAqVK9wLDsCupY9OSJMZi+eq3CDeOeO1H71RtgPsHDXd3zmenx
	2G5enP33BGgjUF7oYENM6pLDsI7tHmyVKIUOGitk5omKSO5F7e8S/e1hx+Zm284OFjnmgrsMVj2a+
	70+e+0Ly2BK4+RPsy2QD8uUrHsLECFY17OzUBxzHdHh49CHGMiESHSdffEZIhEKWP6VaUHeksvTOK
	iRZQOysScbpCMfVfQCN7Qy3syuTYhhvD1rtEYiPfO14ZflG2JTXJcyzrGm8uaarlm0GYlqZOBCQbi
	dJOm2qiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJ3T-00000002FG5-2vyW;
	Thu, 16 Apr 2026 09:30:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJ3R-00000002FFk-04Qa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 09:30:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38AC522EE;
	Thu, 16 Apr 2026 02:30:25 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 071643F641;
	Thu, 16 Apr 2026 02:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776331830; bh=evCSgKpVBFb0A+dSG71xa2VfI3qVglLRmCaaMCz809w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vjBUYv/oHhZt5IDME2rqdMYHH/Q5ecolMz+cBVoFUOp68y1j46RiTF+AbY3ziJLVs
	 b86XJcZUqSEgu40OVqUwBUrUiP67W4ujeit6TW4OipcSMxTzYEXsBfz9IgAbmdo7eG
	 1s/a95a2gbj+Rg2phlE2Ew4ielZIPWQPewgTf+to=
Date: Thu, 16 Apr 2026 10:30:23 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm_pmu: acpi: fix reference leak on failed device
 registration
Message-ID: <aeCsLy-45QyeCwGA@J2N7QTR9R3>
References: <20260415174159.3625777-1-lgs201920130244@gmail.com>
 <ad_WmuauLJ3xDKqh@J2N7QTR9R3>
 <2026041603-guts-crested-ef76@gregkh>
 <aeCOdWLaVpH-5w8s@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeCOdWLaVpH-5w8s@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_023033_149229_72F4A3CD 
X-CRM114-Status: GOOD (  45.54  )
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

On Thu, Apr 16, 2026 at 09:23:33AM +0200, Johan Hovold wrote:
> On Thu, Apr 16, 2026 at 06:40:55AM +0200, Greg Kroah-Hartman wrote:
> > On Wed, Apr 15, 2026 at 07:19:06PM +0100, Mark Rutland wrote:
> 
> > > AFAICT you're saying that the reference was taken *within*
> > > platform_device_register(), and then platform_device_register() itself
> > > has failed. I think it's surprising that platform_device_register()
> > > doesn't clean that up itself in the case of an error.
> > > 
> > > There are *tonnes* of calls to platform_device_register() throughout the
> > > kernel that don't even bother to check the return value, and many that
> > > just pass the return onto a caller that can't possibly know to call
> > > platform_device_put().
> > > 
> > > Code in the same file as platform_device_register() expects it to clean up
> > > after itself, e.g.
> > > 
> > > | int platform_add_devices(struct platform_device **devs, int num) 
> > > | {
> > > |         int i, ret = 0; 
> > > | 
> > > |         for (i = 0; i < num; i++) {
> > > |                 ret = platform_device_register(devs[i]);
> > > |                 if (ret) {
> > > |                         while (--i >= 0)
> > > |                                 platform_device_unregister(devs[i]);
> > > |                         break;
> > > |                 }    
> > > |         }    
> > > | 
> > > |         return ret; 
> > > | }
> > > 
> > > That's been there since the initial git commit, and back then,
> > > platform_device_register() didn't mention that callers needed to perform
> > > any cleanup.
> > > 
> > > I see a comment was added to platform_device_register() in commit:
> > > 
> > >   67e532a42cf4 ("driver core: platform: document registration-failure requirement")
> > > 
> > > ... and that copied the commend added for device_register() in commit:
> > > 
> > >   5739411acbaa ("Driver core: Clarify device cleanup.")
> > > 
> > > ... but the potential brokenness is so widespread, and the behaviour is
> > > so surprising, that I'd argue the real but is that device_register()
> > > doesn't clean up in case of error. I don't think it's worth changing
> > > this single instance given the prevalance and churn fixing all of that
> > > would involve.
> > > 
> > > I think it would be far better to fix the core driver API such that when
> > > those functions return an error, they've already cleaned up for
> > > themselves.
> > > 
> > > Greg, am I missing some functional reason why we can't rework
> > > device_register() and friends to handle cleanup themselves? I appreciate
> > > that'll involve churn for some callers, but AFAICT the majority of
> > > callers don't have the required cleanup.
> > 
> > Yes, we should fix the platform core code here, this should not be
> > required to do everywhere as obviously we all got it wrong.
> 
> It's not just the platform code as this directly reflects the behaviour
> of device_register() as Mark pointed out.
> 
> It is indeed an unfortunate quirk of the driver model, but one can argue
> that having a registration function that frees its argument on errors
> would be even worse. And even more so when many (or most) users get this
> right.

Ah, sorry; I had missed that the _put() step would actually free the
object (and as you explain below, how that won't work for many callers).

> So if we want to change this, I think we would need to deprecate
> device_register() in favour of explicit device_initialize() and
> device_add().

Is is possible to have {platfom_,}device_uninitialize() functions that
does everything except the ->release() call? If we had that, then we'd
be able to have a flow along the lines of:

	int some_init_function(void)
	{
		int err;
	
		platform_device_init(&static_pdev);
	
		err = platform_device_add(&static_pdev))
		if (err)
			goto out_uninit;
	
		return 0;
	
	out_uninit:
		platform_device_uninit(&static_pdev);
		return err;
	}

... which I think would align with what people generally expect to have
to do.

Those would have to check that only a single reference was held (from
the corresponding _initialize()), and could WARN/fail if more were held.

> That said, most users of platform_device_register() appear to operate
> on static platform devices which don't even have a release function and
> would trigger a WARN() if we ever drop the reference (which is arguably
> worse than leaking a tiny bit of memory).
> 
> So leaving things as-is is also an option.

I suspect that might be the best option for now.

Mark.

