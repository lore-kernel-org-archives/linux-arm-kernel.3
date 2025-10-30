Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81544CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7c6+XrmoyFowwhGbEiLq66X/torWpHDQ+1RsFmcHlWE=; b=fuDiaZQBKv6nTscarUSjX8SGVf
	jU2pVEouKnr03eBFzNeVvvbfwoVRnvaYzUXS6vQy0e9VjxvYaeynz0WA2EraAx7EXEbuuzEP0SROF
	DJuq29QBJHLVGDOnhhNIuurqI9Ebvgu71IWgTXqwDlMWUHbhvgby82o4okz4edtW7SJ09KIFahmXy
	07EOJ36mo3/D7vEoWbzu4LF22CYQtSi7/OrHjOY2GZ2OffhrQl9U/aSQ+i2nLkt3f6XbTbVwSxjz1
	09frAeYdfMT+11SyTwVn7ehw92BC1dCzmuT7/C5xpl7IJUtv/aBS8Fk+jsIBATE+lwIKcIPX5JSPM
	pJKvVdGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUys-00000004QN6-2Rjc;
	Thu, 30 Oct 2025 15:54:30 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUyq-00000004QMj-0d6g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:54:29 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4298b49f103so513204f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 08:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761839665; x=1762444465; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7c6+XrmoyFowwhGbEiLq66X/torWpHDQ+1RsFmcHlWE=;
        b=0VIh0tpxySUpX1+54IHg1IQRRNAwZVzvYgmMKy5dxVduRcnTr42yg7NgZO3ruGSRly
         JhSVQbjpQcSqSHDqB/MfxLO45AlDFQXTpfDxcafmywr2UK9Trs95sy9ezgKRCcvLy7QH
         g669JLPNwWDLM6KwFShoxeRfm7PVLH5HRILWi/eHFXcC+5+rmo7HJQhI+WDC1O8XeqzI
         v1UiJV8Z1g34vr24JfZvMhh/u+AGSSPwFBXLZAiowPVMuxDtmhQLb+8GcHfg9PQwIhow
         723WXh3JRWecOl/JJKpRFxLYOUDzmSMSJS1E1idBqr6nnBgqQd8AKXtLXkjj2GFAZcwl
         uSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761839665; x=1762444465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7c6+XrmoyFowwhGbEiLq66X/torWpHDQ+1RsFmcHlWE=;
        b=pOVZ7YAf2kZyqcjt3hELkA4p/pS+mBoSdt76nFHlaswWCQctM7mJnFpfCreXi+gzcL
         +OQWpGikwAKZFHYWkYh7mb6lONrpdcxOqiiY4BbW/eg16EbQpLlHIbDeIP2qg9NJDhTr
         XYs4oA0VCLpWzioSgSHRhJ2UdZilUAxonR0crVbGlk2wJpFBL9FPgdw6l62wBPj1WOfr
         OFPuLQNH5w56Tm5RshrTH3diy/xiyc0JiBXkjtH23Nd6P3snA0lwjPPhcb4T/Uhs9SfY
         bZ3EQ2MVkLZeFKZ4fJir9XRComfdOS/CPaFZW4d0/9MGCy3ZLBeyLo/u0zDkO4BPS/ke
         qjSg==
X-Forwarded-Encrypted: i=1; AJvYcCXSpFx3ALGfDzPqlLYWOWKFYqymsjUgwMco1p0sY6GxjIQhjRU0PB13Z5xMySKeJCuzl7aed6VZ8+c+iwYWNsUW@lists.infradead.org
X-Gm-Message-State: AOJu0YxSa9R4fLLtqodUZJ14WL8AetxUzw4BueBTnzKKoY+zzNJPMQ3Q
	uwybMSPBFVryaZXbV48VBnXqsbe2n34NANQbcvN7FOTOwhur5lgkWHRHfVxydxFzCA==
X-Gm-Gg: ASbGncuBCiPRGq/Kwm8hozL4hxPw+p3JAy+QouWYS4AHO1kdCwiIwVk6OIFVwCL8RZo
	SJq6rUNovEA7pfOFlvYxRtVKo33nHhsLeqJPC6YPa0L6+ebnfZnfAa1bEMa4AtlX+Pjk9UacbkN
	XgQMjKMxDCCSL3TU9RYPNzjWMilhE+L27nBRT4Ia4ORH49AZwfccbMSyLSmBO9qJkW1aFycn88h
	n70D4la8IZBm38WKaWDQPpzX/OiUYwPiXExc8GxWD0VKAEgOA6/+xFDlDKzj9C056tefJFoRwV+
	fOULQ86+yee+FdoRnsBQ1PDQulAiQ0j15PsJC0EE52dcVsjA0O6lu/l9k7JvD19rdVtICd+ZLLj
	6SXfQUSf6rzW39ByHtl/WDnHhQtNunAxi36wil0wzLcc9Or8boOGgxsm6oO/Odg+yLdOYFm8uDv
	wZ+s2KTC9wUAHP6QD7TAAiHvJDuGDFz1MERPAS+8ggZR8176fo3oQ=
X-Google-Smtp-Source: AGHT+IFcl4Bo2iRnn9SQ4R5pthHC8V2HygnH866pn1+ULEALSY6EUZm9nBo5CT91dKPigulLVZJWlg==
X-Received: by 2002:a05:6000:2485:b0:426:d82f:889e with SMTP id ffacd0b85a97d-429bd67c45dmr79155f8f.14.1761839665373;
        Thu, 30 Oct 2025 08:54:25 -0700 (PDT)
Received: from google.com (218.131.22.34.bc.googleusercontent.com. [34.22.131.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9c6sm33378016f8f.36.2025.10.30.08.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 08:54:24 -0700 (PDT)
Date: Thu, 30 Oct 2025 15:54:21 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, qperret@google.com,
	keirf@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v3] KVM: arm64: Check range args for pKVM mem transitions
Message-ID: <aQOKLaCKUDcqIZeM@google.com>
References: <20251016164541.3771235-1-vdonnefort@google.com>
 <aQMBG0SUlNWuQQFZ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQMBG0SUlNWuQQFZ@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_085428_240169_FB2F2DB1 
X-CRM114-Status: GOOD (  31.96  )
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

On Thu, Oct 30, 2025 at 06:09:31AM +0000, Sebastian Ene wrote:
> On Thu, Oct 16, 2025 at 05:45:41PM +0100, Vincent Donnefort wrote:
> > There's currently no verification for host issued ranges in most of the
> > pKVM memory transitions. The end boundary might therefore be subject to
> > overflow and later checks could be evaded.
> > 
> > Close this loophole with an additional pfn_range_is_valid() check on a
> > per public function basis. Once this check has passed, it is safe to
> > convert pfn and nr_pages into a phys_addr_t and a size.
> > 
> > host_unshare_guest transition is already protected via
> > __check_host_shared_guest(), while assert_host_shared_guest() callers
> > are already ignoring host checks.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > ---
> > 
> > v2 -> v3: 
> >    * Test range against PA-range and make the func phys specific.
> > 
> > v1 -> v2:
> >    * Also check for (nr_pages * PAGE_SIZE) overflow. (Quentin)
> >    * Rename to check_range_args().
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index ddc8beb55eee..49db32f3ddf7 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -367,6 +367,19 @@ static int host_stage2_unmap_dev_all(void)
> >  	return kvm_pgtable_stage2_unmap(pgt, addr, BIT(pgt->ia_bits) - addr);
> >  }
> 
> Hello Vincent,
> 
> >  
> > +/*
> > + * Ensure the PFN range is contained within PA-range.
> > + *
> > + * This check is also robust to overflows and is therefore a requirement before
> > + * using a pfn/nr_pages pair from an untrusted source.
> > + */
> > +static bool pfn_range_is_valid(u64 pfn, u64 nr_pages)
> > +{
> > +	u64 limit = BIT(kvm_phys_shift(&host_mmu.arch.mmu) - PAGE_SHIFT);
> > +
> > +	return pfn < limit && ((limit - pfn) >= nr_pages);
> > +}
> > +
> 
> This newly introduced function is probably fine to be called without the host lock held as long
> as no one modifies the vtcr field from the host.mmu structure. While
> searching I couldn't find a place where this is directly modified so
> this is probably fine. 
> 
> >  struct kvm_mem_range {
> >  	u64 start;
> >  	u64 end;
> > @@ -776,6 +789,9 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
> >  	void *virt = __hyp_va(phys);
> >  	int ret;
> >  
> > +	if (!pfn_range_is_valid(pfn, nr_pages))
> > +		return -EINVAL;
> > +
> >  	host_lock_component();
> >  	hyp_lock_component();
> >  
> > @@ -804,6 +820,9 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
> >  	u64 virt = (u64)__hyp_va(phys);
> >  	int ret;
> >  
> > +	if (!pfn_range_is_valid(pfn, nr_pages))
> > +		return -EINVAL;
> > +
> >  	host_lock_component();
> >  	hyp_lock_component();
> >  
> > @@ -887,6 +906,9 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages)
> >  	u64 size = PAGE_SIZE * nr_pages;
> >  	int ret;
> >  
> > +	if (!pfn_range_is_valid(pfn, nr_pages))
> > +		return -EINVAL;
> > +
> >  	host_lock_component();
> >  	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
> >  	if (!ret)
> > @@ -902,6 +924,9 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
> >  	u64 size = PAGE_SIZE * nr_pages;
> >  	int ret;
> >  
> > +	if (!pfn_range_is_valid(pfn, nr_pages))
> > +		return -EINVAL;
> > +
> >  	host_lock_component();
> >  	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED);
> >  	if (!ret)
> > @@ -945,6 +970,9 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
> >  	if (prot & ~KVM_PGTABLE_PROT_RWX)
> >  		return -EINVAL;
> >  
> > +	if (!pfn_range_is_valid(pfn, nr_pages))
> > +		return -EINVAL;
> > +
> 
> I think we don't need it here because __pkvm_host_share_guest has the
> __guest_check_transition_size verification in place which limits
> nr_pages.  

__guest_check_transition size will only limit to PMD_SIZE, which can be quite a
big number if you consider > 4KiB pages systems. So I believe this is still a loophole
worth fixing.

> 
> >  	ret = __guest_check_transition_size(phys, ipa, nr_pages, &size);
> >  	if (ret)
> >  		return ret;
> > 
> > base-commit: 7ea30958b3054f5e488fa0b33c352723f7ab3a2a
> > -- 
> > 2.51.0.869.ge66316f041-goog
> >
> 
> Other than that this looks good, thanks
> Sebastian

Thanks for having a look at the patch.

