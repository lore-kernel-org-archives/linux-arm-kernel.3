Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1107C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVSOFdbay1u0grjbb1LUrKz3NBTjY4v98MFRYOh4cHM=; b=jWH2KQdVy7JhoD52oB6WMNuo15
	NlGy87us1UriDPWBd9assAHO63qcntSLk04hBc2dcD27zHEZNnOJuvJek9XAB2NPHMg76zoVMawYA
	wTTc89Ir+gqLDKhJmTVgGttDAQnwGYRB71TSTPivLKGhFKcB2yQVJsI69suvjGD/YHBp6BeNAr7Af
	CYVkUJEI3prlWXSKbKwDAH5uDaWZ9rjcScD0czh5obpvgRM+HVFB/uPvrCCUeN+OWn6tEcRlwFBqM
	dEHZXtFzL+XGuYhv7zNg+oE9q9zXsxQDmp4HWUsUJF7pjfABX5pfQJNQXA9s0z2EeI9pdO/l20NRO
	hv6RAAYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk3K0-000000017X1-39Zh;
	Thu, 07 Aug 2025 16:18:28 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk39t-000000015Ac-06F5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 16:08:02 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4byX894865z6DB6D;
	Fri,  8 Aug 2025 00:06:01 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5CAF11402EA;
	Fri,  8 Aug 2025 00:07:50 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 7 Aug
 2025 18:07:49 +0200
Date: Thu, 7 Aug 2025 17:07:47 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <dan.j.williams@intel.com>, <linuxarm@huawei.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, <james.morse@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <gregkh@linuxfoundation.org>, Will Deacon
	<will@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Yicong Yang
	<yangyicong@huawei.com>, Yushan Wang <wangyushan12@huawei.com>, "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	<x86@kernel.org>, H Peter Anvin <hpa@zytor.com>, "Andy Lutomirski"
	<luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 2/8] generic: Support
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
Message-ID: <20250807170704.00002ff2@huawei.com>
In-Reply-To: <20250711125218.000050bf@huawei.com>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
	<20250624154805.66985-3-Jonathan.Cameron@huawei.com>
	<686f565121ea5_1d3d100ee@dwillia2-xfh.jf.intel.com.notmuch>
	<20250711125218.000050bf@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_090801_342324_C99ACFC3 
X-CRM114-Status: GOOD (  24.47  )
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

> > > +bool cpu_cache_has_invalidate_memregion(void)
> > > +{
> > > +	guard(spinlock_irqsave)(&scfm_lock);
> > > +	return !!scfm_data;    
> > 
> > Lock seems pointless here.
> > 
> > More concerning is this diverges from the original intent of this
> > function which was to disable physical address space manipulation from
> > virtual environments.  
> 
> Sure. We don't loose that - it just moved out to the registration framework
> for devices.  If a future VM actually wants to expose paravirt interfaces
> via device emulation then they can.
> 
> Maybe we can call from here to see if any device drivers actually registered.
> That's not a guarantee that all relevant ones did (yet) but it at least
> will result in warnings for the virtual machine case.
>
> > 
> > Now, different archs may have reason to diverge here but the fact that
> > the API requirements are non-obvious points at a minimum to missing
> > documentation if not missing cross-arch consensus.  
> 
> I'll see if I can figure out appropriate documentation for that.
> 

Hi Dan, 

I'm struggling a little for what these requirements should be (and hence the
documentation).  Do you think having the possibility for us to go from returning
that we have no support to later returning that we have support as additional
drivers arrive is acceptable? Potentially the opposite as well if someone is
unbinding the drivers.

So for x86 it's simple as you use an explicit cpu feature check on whether
it is in a hypervisor. For architectures using explicit 'drivers' (because
the interface is in MMIO or similar) there need be no difference between
the 'is it a VM' check and the 'do we have the hardware'.

If someone chooses to emulate (or pass through) the hardware interface then
they get to make it do something sane.

On a somewhat related note, I don't yet have a good answer for how, in
a complex system we know all the drivers have arrived and hence the
flush will be complete once they all acknowledge.

Could do an ACPI _DSM that returns a list of IDs and check drivers are
bound to them but would need to get that into some spec or other
which might take a while.

For now I'm taking the view that there are many ways to shoot yourself
in a the foot if you can control driver binding, so this isn't a blocker,
more of a nice to have.

I'll send out the new (simpler) code next week (so post rc1)

Jonathan

