Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627DCC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 21:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbNhQBYnEdEg2Y4rui76TMJ+OL5KtDo/xEGr//biWf0=; b=nCcOfLAOmnFovMVtQOcXsTY/pW
	8Gih7lT27OddEohOs0ZsNikqU6VNvqVBm7BAPtTGxFQrNSkP1akPIlB6RxZErg8xmkYGa02NaZ1JG
	2qQykpiz1pgp6YVJjVGSXRzxSIMr7DpN2fucJ3cGK0x8bYyouhDA9uJ+gCPrck4WasqcR1X+xan1t
	mZbOOq/9zEuKWeMMNncIdkTV9y7YoWtyeV8dheuJ+VzLHiV3rEIyhErsxQJsdIKAOret+MPcJiSqQ
	THIl+3Orf5aXsRqWF7PfHECXvET8nkXVwmD2y6OxObl8gCQFgJRK1MPXO6/DX79R6myU5RWMP8l9I
	fQ+AntqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxmI-000000033pM-1JRs;
	Fri, 02 May 2025 21:18:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxkM-000000033ft-2O89;
	Fri, 02 May 2025 21:16:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C16A16844F;
	Fri,  2 May 2025 21:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DFEC4CEE4;
	Fri,  2 May 2025 21:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746220597;
	bh=kzsN5X5daKdANNax1/r/iY9EohjZTKAy76Q08oyT2VE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GK65252choMKHsOuLDuV4K7qmKnN7fPQ6tHc/J83IS0AgNj5kQar2z31XQL1Hozvj
	 VZap9E+kzyJhOEaLWv7W/dH0F3IDMpwfL8v75SFOq7GZbntAB2zUga29FgDz7jNkUy
	 HJYg6XHrJPV5Q+PBuUwzmN8lDl6dPHm2M1KWxgTJV3jY1gmxUbmNL48CyPxNoXbxvZ
	 mL4e6BLMHzI43/Fvxz6B/d2Ohkv5EFpwH63gQpqDrKE2aXHw16P7khFZPy/UZa7A/X
	 iX+2EobXIhe0vYOQ8U6EcHv87lemL+O9yJbAa+R/CyquCcAu2DP0WopdD4W6LkR573
	 H/unhCL4q+ijw==
Date: Sat, 3 May 2025 00:16:21 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de,
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de,
	catalin.marinas@arm.com, corbet@lwn.net,
	dave.hansen@linux.intel.com, devicetree@vger.kernel.org,
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com,
	hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org,
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org,
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com,
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de,
	robh@kernel.org, rostedt@goodmis.org, saravanak@google.com,
	skinsburskii@linux.microsoft.com, tglx@linutronix.de,
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Subject: Re: [PATCH v7 14/18] x86/boot: make sure KASLR does not step over
 KHO preserved memory
Message-ID: <aBU2JQRKXjqoFClQ@kernel.org>
References: <20250501225425.635167-1-changyuanl@google.com>
 <20250501225425.635167-15-changyuanl@google.com>
 <c348c507-c06b-4611-87f4-c498e144fa45@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c348c507-c06b-4611-87f4-c498e144fa45@intel.com>
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

On Fri, May 02, 2025 at 11:48:54AM -0700, Dave Hansen wrote:
> On 5/1/25 15:54, Changyuan Lyu wrote:
> > +/*
> > + * If KHO is active, only process its scratch areas to ensure we are not
> > + * stepping onto preserved memory.
> > + */
> > +#ifdef CONFIG_KEXEC_HANDOVER
> > +static bool process_kho_entries(unsigned long minimum, unsigned long image_size)
> > +{
> 
> I thought we agreed to rework this to unconditionally define the
> kho_scratch structures so the #ifdef can go away?

It's either #ifdef or double casting and my understanding was that your
preference was to get rid of the double casting.
 
> > +	struct kho_scratch *kho_scratch;
> > +	struct setup_data *ptr;
> > +	int i, nr_areas = 0;
> > +
> > +	ptr = (struct setup_data *)boot_params_ptr->hdr.setup_data;
> > +	while (ptr) {
> > +		if (ptr->type == SETUP_KEXEC_KHO) {
> > +			struct kho_data *kho = (struct kho_data *)ptr->data;
> > +
> > +			kho_scratch = (void *)kho->scratch_addr;
> > +			nr_areas = kho->scratch_size / sizeof(*kho_scratch);
> > +
> > +			break;
> > +		}
> > +
> > +		ptr = (struct setup_data *)ptr->next;
> > +	}
> > +
> > +	if (!nr_areas)
> > +		return false;
> > +
> > +	for (i = 0; i < nr_areas; i++) {
> > +		struct kho_scratch *area = &kho_scratch[i];
> > +		struct mem_vector region = {
> > +			.start = area->addr,
> > +			.size = area->size,
> > +		};
> > +
> > +		if (process_mem_region(&region, minimum, image_size))
> > +			break;
> > +	}
> > +
> > +	return true;
> > +}
> > +#else
> > +static inline bool process_kho_entries(unsigned long minimum,
> > +				       unsigned long image_size)
> > +{
> > +	return false;
> > +}
> > +#endif
> > +
> >  static unsigned long find_random_phys_addr(unsigned long minimum,
> >  					   unsigned long image_size)
> >  {
> > @@ -775,7 +824,8 @@ static unsigned long find_random_phys_addr(unsigned long minimum,
> >  		return 0;
> >  	}
> >  
> > -	if (!process_efi_entries(minimum, image_size))
> > +	if (!process_kho_entries(minimum, image_size) &&
> > +	    !process_efi_entries(minimum, image_size))
> >  		process_e820_entries(minimum, image_size);
> >  
> >  	phys_addr = slots_fetch_random();
> 
> I made a comment about this in the last round, making this the second
> thing that I've noticed that was not addressed.
> 
> Could you please go back through the last round of comments before you
> repost these?

I presumed that changelog covers it. We'll add a comment here for the next
posting.
 
> Just to be clear: these are making progress, but they're not OK from the
> x86 side yet.

-- 
Sincerely yours,
Mike.

