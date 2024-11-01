Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F0EE6F06D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1evd5lGbHCuOT8tfPmadcUQqa04tuGgPb+HSVtJmF8k=; b=LetlufilBn+E7IIAv+xsccizx+
	pYJ7SG/+kdNHHTfzcIKg89wbkO82INAsQCQrMCt2ADanH3OtHHUcmgcPFmsyLI5AxTqp4xfvFgxxE
	XPEpO2p88x0syQQZeuoxAVL8U3t3Wxv9spjFPH99Ioyn+cp97gdNbHwkkrZNHeIXBm0rKHTFGqgYb
	bn9pxqGa/jQUCngoHPcWXzIIeXJkFdWXiKZrRC/Vtc5VUMbY/dmJrWPDB4Mx5d2LOgASPEIBTCaRu
	lhPvhOhzwKWX2Q18gmlnXoM5+9Q+3AnOgadmRmXUHQM2pnRVXqd1ynfX+gFdkG0lygQ04SHfzT9Xr
	byxnlS7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uTZ-00000007fWE-0V1L;
	Fri, 01 Nov 2024 16:26:17 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uQ7-00000007eXV-1k8R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:22:45 +0000
Date: Fri, 1 Nov 2024 09:22:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730478160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1evd5lGbHCuOT8tfPmadcUQqa04tuGgPb+HSVtJmF8k=;
	b=lZKBzO/N0DQ5XxKAtQkk86AjV5mYav4byhccRQ4eBvOGkAaxRH67vY48wf6QsY3GcRJOQc
	Jcc90LHPWM7riQBmj5VKnWMXM9M0Jd1tad4KG4IqFHlBItdwH/wCsGkCn5RbmsKe15w2bz
	xwxx3Z3KDUlP1gGnQMEpFuUjx4hu94M=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>,
	James Houghton <jthoughton@google.com>,
	David Woodhouse <dwmw@amazon.co.uk>, linux-next@vger.kernel.org
Subject: Re: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
Message-ID: <ZyUARgGV4G6DOrRL@linux.dev>
References: <20241009154953.1073471-1-seanjc@google.com>
 <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk>
 <ZyTpwwm0s89iU9Pk@google.com>
 <ZyT2CB6zodtbWEI9@linux.dev>
 <ZyT61FF0-g8gKZfc@google.com>
 <ZyT9rSnLcDWkWoL_@linux.dev>
 <ZyT-6iCNlA1VSAV3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyT-6iCNlA1VSAV3@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_092243_645856_AD9BBAE6 
X-CRM114-Status: GOOD (  19.34  )
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

On Fri, Nov 01, 2024 at 09:16:42AM -0700, Sean Christopherson wrote:
> On Fri, Nov 01, 2024, Oliver Upton wrote:
> > On Fri, Nov 01, 2024 at 08:59:16AM -0700, Sean Christopherson wrote:
> > > > Can you instead just push out a topic branch and let the affected
> > > > maintainers deal with it? This is the usual way we handle conflicts
> > > > between trees...
> > > 
> > > That'd work too, but as you note below, doing that now throws a wrench in things
> > > because essentially all arch maintainers would need merge that topic branch,
> > > otherwise linux-next would end up in the same state.
> > 
> > TBH, I'm quite happy with that. Recent history has not been particularly
> > convinincing to me that folks are actually testing arm64, let alone
> > compiling for it when applying selftests patches.
> 
> FWIW, I did compile all patches on all KVM architectures, including selftests.
> But my base obviously didn't include the kvm-arm64 branch :-/

Oh, that rip wasn't aimed at you, commit 76f972c2cfdf ("KVM: selftests: Fix build
on architectures other than x86_64") just came to mind.

> One thing I'll add to my workflow would be to do a local merge (and smoke test)
> of linux-next into kvm-x86 next before pushing it out.  This isn't the only snafu
> this cycle where such a sanity check would have saved me and others a bit of pain.

Eh, shit happens, that's what -next is for :)

The only point I wanted to make was that it is perfectly fine by me to
spread the workload w/ a topic branch if things blow up sometime after
your changes show up in -next.

-- 
Thanks,
Oliver

