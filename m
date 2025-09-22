Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9FACAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 23:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gGrtxGEbr8glZCCzkowKSxbC1Oe8vVU3z0oyF8KHbg=; b=AUaQAurwoASsKTK6GFpd6ieSme
	UzDRLdH60v0B9IIr14hEhw4b20igXkzeKasAaX0NCJRj+k+l7sik8VxANPg/Ugt0gRuZxLOM0Noyz
	CJMfmMgaoxG8r9xLYE2Z3n/z+Yf6QJIohL7ATVIWiF05RRRrdlOsfiLD/LK16ZAA4sdkgQHSH8pE6
	E624wau+OAP3KFG/cycEZGmZzXHdS4i9l3rAWmtVRJ9MeHScioeDR/W6FkufJW2cNRAI2e5DtOa0l
	mFkQ//80U2fVMXwa4v/c7mYs3x9K9w2eAdtVzXOSWd8ptFAJsIblHgC8VezML8FL5VTmUh8hpmK8h
	DOCqrVoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0q2R-0000000BmL5-1G5X;
	Mon, 22 Sep 2025 23:33:43 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0q2O-0000000BmK1-0DRi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 23:33:41 +0000
Date: Mon, 22 Sep 2025 16:33:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758584017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+gGrtxGEbr8glZCCzkowKSxbC1Oe8vVU3z0oyF8KHbg=;
	b=mMGh75xNEe4RY/R53PguYpSyqXGPw0OgyU7E4WIQLZdW5fJ9APyuFCOfmsIY6mEhBJdnSz
	C2AQy8wK00Gp1wZVGnvgy4Vd2BfaCWKgX9Nzw2c4rDVJlz+NDnD2YG996EE2/YoqQBHcJg
	iphTJiLG9nbEnIXGMx7tLgcyh8AIYsM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, qperret@google.com,
	sebastianene@google.com, keirf@google.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2] KVM: arm64: Check range args for pKVM mem transitions
Message-ID: <aNHcxAJXHeS2T7TH@linux.dev>
References: <20250919155056.2648137-1-vdonnefort@google.com>
 <87plbkxcvv.wl-maz@kernel.org>
 <aNG417MneSKBxyn8@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNG417MneSKBxyn8@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_163340_593658_00AC0C63 
X-CRM114-Status: GOOD (  28.00  )
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

On Mon, Sep 22, 2025 at 10:00:07PM +0100, Vincent Donnefort wrote:
> On Sun, Sep 21, 2025 at 12:29:08PM +0100, Marc Zyngier wrote:
> > On Fri, 19 Sep 2025 16:50:56 +0100,
> > Vincent Donnefort <vdonnefort@google.com> wrote:
> > > 
> > > There's currently no verification for host issued ranges in most of the
> > > pKVM memory transitions. The subsequent end boundary might therefore be
> > > subject to overflow and could evade the later checks.
> > > 
> > > Close this loophole with an additional check_range_args() check on a per
> > > public function basis.
> > > 
> > > host_unshare_guest transition is already protected via
> > > __check_host_shared_guest(), while assert_host_shared_guest() callers
> > > are already ignoring host checks.
> > > 
> > > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > > 
> > > ---
> > > 
> > >  v1 -> v2:
> > >    - Also check for (nr_pages * PAGE_SIZE) overflow. (Quentin)
> > >    - Rename to check_range_args().
> > > 
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > index 8957734d6183..65fcd2148f59 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > @@ -712,6 +712,14 @@ static int __guest_check_page_state_range(struct pkvm_hyp_vm *vm, u64 addr,
> > >  	return check_page_state_range(&vm->pgt, addr, size, &d);
> > >  }
> > >  
> > > +static bool check_range_args(u64 start, u64 nr_pages, u64 *size)
> > > +{
> > > +	if (check_mul_overflow(nr_pages, PAGE_SIZE, size))
> > > +		return false;
> > > +
> > > +	return start < (start + *size);
> > 
> > I will echo Oliver's concern on v1: you probably want to convert the
> > boundary check to be inclusive of the end of the range. Otherwise, a
> > range that ends at the top of the 64bit range will be represented as
> > 0, and fail the  check despite being perfectly valid.
> 
> Do you mean allowing something like start == 0xfffffffffffff000 and size ==
> 4096?

Yes, this is what I was alluding to on v1.

> But I guess that would still put all the following checks using "addr + size" at
> risk. Also, I believe even the code in pgtable.c wouldn't support a such range
> as it is also using a u64 end boundary.

I'm not sure I follow. Ranges are pretty commonly expressed as a range
terminated by an exclusive value. This just hasn't been an issue yet as
the page table code is only ever dealing with TTBR0 or VTTBR
translations.

Anyway, I'd rather these range checks have as few assumptions of the
applied address space as possible.

Thanks,
Oliver

