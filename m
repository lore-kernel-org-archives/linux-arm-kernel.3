Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00464CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 17:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujSu9aIj42XzTySFT0TuJodAat1iyrUpdlV6tLqkI+4=; b=CuH9vuddWeMrxQasXcI2IggTVC
	9JlLJ2klqCsAtLryIpoA8T4SntdWCl1OaR6ak405m4kGAbzsZSBd6xKaM6s8QfTqZA9EjrZrdaTGS
	pGV66Izx0NMoD7KW+fMjCkwdrWc5LDgtwESpYzcM/loF/5OQ05PCJ1XGCR3St9XVO4pi26Or72Sy2
	p6MYRPNUTTRQJn1Nl5KXSpEVRTPqXKeyjyEw99LV7rnIIbQFoaI3/dw/FqoQc3s3umFWXzz5WBqK+
	zXwkPFdjiggLpg3/+2my/PjgV+xgL3pyr/4Ligl7sWF9UdkqYYOv5L4gEdXhMLnwaKsibRfIE3Yz/
	la2dHR8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1ew-0000000GOks-03zm;
	Mon, 18 May 2026 17:21:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1et-0000000GOk9-2tAM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 17:21:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7B80302D;
	Mon, 18 May 2026 10:21:30 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 043033F7B4;
	Mon, 18 May 2026 10:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779124895; bh=2Ad+b40QKOgmfGSGo1dsdGk4tJnXSxqznXpiRjuVOyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1G5aw8O3BbozglFHYWcaZytNBlpNfwL+tPszrn8bRU6NzoZ86pjhSlwh7n6ndYN5
	 Lz0SSl8gp4UJVzInHX5ZC2Hhm/mHojV7DS2o9ujq5XJC4RtO+7xbn5dvY+JlvLXGnH
	 GmYbu+5CPLnbrnYH8thBVWwZz+kgtyakaQUPSsm4=
Date: Mon, 18 May 2026 18:21:26 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Will Deacon <will@kernel.org>, Sami Mujawar <sami.mujawar@arm.com>,
	Gavin Shan <gshan@redhat.com>, Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] virt: arm-cca-guest: use raw variant of
 smp_processor_id() in arm_cca_report_new()
Message-ID: <agtKlvxAvCHXvX-z@arm.com>
References: <20260518033157.1865498-1-enju.kohei@fujitsu.com>
 <agsHBb9f3HkmJaIx@arm.com>
 <agsSyRT7z-F5iBIp@FCCLS0092175.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agsSyRT7z-F5iBIp@FCCLS0092175.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_102139_866659_221F5F63 
X-CRM114-Status: GOOD (  23.03  )
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

Hi Kohei,

On Mon, May 18, 2026 at 10:38:53PM +0900, Kohei Enju wrote:
> On 05/18 13:33, Catalin Marinas wrote:
> > On Mon, May 18, 2026 at 12:31:31PM +0900, Kohei Enju wrote:
> > > diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> > > index 0c9ea24a200c..2d450caee3e4 100644
> > > --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> > > +++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> > > @@ -108,7 +108,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
> > >  	 * allocate outblob based on the returned value from the 'init'
> > >  	 * call and that cannot be done in an atomic context.
> > >  	 */
> > > -	cpu = smp_processor_id();
> > > +	cpu = raw_smp_processor_id();
> > 
> > That's just hiding the warning which might be genuine, irrespective of
> > what the comment says. Sashiko has some good points:
> > 
> > https://sashiko.dev/#/patchset/20260518033157.1865498-1-enju.kohei@fujitsu.com
> > 
> > Basically what guarantees that the cpu won't go offline? Can we use
> > migrate_disable() and ignore the smp_call_function_single() altogether?
> > It looks like a hack anyway.
[...]
> You've raised a very valid point about raw_smp_processor_id()
> potentially hiding a genuine issue. I agree this would be a concern in
> most contexts.
> 
> However, this implementation was intentionally designed not to block CPU
> hotplug:
> https://lore.kernel.org/linux-arm-kernel/7a83461d-40fd-4e61-8833-5dae2abaf82b@arm.com/
> 
> As mentioned in the thread above, the potential failure from the target
> CPU going offline (resulting in -ENXIO) is an expected and tolerated
> condition in this path.
> Using migrate_disable() would go against the non-blocking design goal.
> 
> Given the context, the debug warning looks false positive for our
> specific use case to me, and I believe raw_smp_processor_id() correctly
> reflects the design intent by simply acquiring a CPU number without
> debug checks.

Thanks, I wasn't aware of the old discussion. If user-space can
tolerate, than it's fine.

Would you mind updating the comment above the changed line? It talks
about not allocating memory in atomic context, so migrate_disable()
would solve this. Just mention that it can't block CPU hotplug events
either and user-space can handle spurious errors.

With that:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

