Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C732EF8FE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyzTC4575PRxGxCASwkzLjmVQ/2HJapmlArj9xz0Y8A=; b=SUov74NogRbGqm0Mp0djAVtoej
	nqRYsQSqsG8fTK8lcQaLZ6hTaKYVlZV9tS3q1OKPoIXR/VWLzwU8ORMe2nvOBD6SQOqPsUNrnL6Mv
	hZbQsYWFUemCsIo+oHyFwwCpbwz53vSDdLVDY0OwJN8OHBIEIOYJds4mR0DNcqZVtG7XKn/Lj6Kx3
	4PGfjJGI2lOzabNvhWBa9t5aDpc1dxLDOoSqexeDiyrXn6yjzmqz7E6g0DxGoc54/vw1ZghETjJ3p
	yzkGS20ZfzU7bZJ6VHvvgyoo2QgrAntMiaXbZiK5Hdy1CCAIQGauk2+1T1TkWGzNYJ3pbK0Z17jIH
	Qltkch2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmrq-0000000HJvv-0ABr;
	Wed, 04 Mar 2026 14:06:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmrp-0000000HJuz-2IYh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:06:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F2316132D;
	Wed,  4 Mar 2026 14:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B92EC4CEF7;
	Wed,  4 Mar 2026 14:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772633184;
	bh=wxXDr1QgTU6gkNXy3Zs/MWD84psAtMhiIYMJo/aj2aM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2qb/h721GOUEpt2dlo5BXt7vSNW+6wMBpBoLkRWRkziixIr3aIvguWO5AoT8eBJY
	 MvbR7t1FswR3SCC2zxkzFS76xxmbSh7xOl/FIigqpgL2DjJ3c3GrXuRgFgHELw6QWp
	 WjT3//wMsyAo51Lgq/mosmyNrvtKjh8Dc+sW6/s64En0j+eh2tFhOYyZdJ3haXMbHO
	 T3Q+uvwMLOAzdm/9cN6y442XUfJ7x1lSR5MvbpJP3bEBK6jHqogkjcrwrBIk2t7qrD
	 /zWMvWWb9oDfofrRoxJNBk4lYVz6w4E9aVqUIXg6+VJDFtSoaQIj7dnQoAzSlQwX/V
	 1uUuMwdmkLmzQ==
Date: Wed, 4 Mar 2026 14:06:18 +0000
From: Will Deacon <will@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 25/35] KVM: arm64: Reclaim faulting page from pKVM in
 spurious fault handler
Message-ID: <aag8Wi47wSzGNs35@willie-the-truck>
References: <20260119124629.2563-1-will@kernel.org>
 <20260119124629.2563-26-will@kernel.org>
 <aY4MVDoEnq-fqv_F@raptor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY4MVDoEnq-fqv_F@raptor>
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

On Thu, Feb 12, 2026 at 05:22:28PM +0000, Alexandru Elisei wrote:
> Would be nice to merge this with the previous patch, that added the force
> reclaim function, as it would make reviewing easier.

I deliberately kept them separate as the previous patch isn't exactly
small and this makes the EL1 part easier to review in isolation.

> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index 8be91051699e..d1926cb08c76 100644
> > --- a/arch/arm64/kvm/pkvm.c
> > +++ b/arch/arm64/kvm/pkvm.c
> > @@ -563,3 +563,10 @@ int pkvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
> >  	WARN_ON_ONCE(1);
> >  	return -EINVAL;
> >  }
> > +
> > +bool pkvm_reclaim_guest_page(phys_addr_t phys)
> > +{
> > +	int ret = kvm_call_hyp_nvhe(__pkvm_force_reclaim_guest_page, phys);
> 
> Nitpicking here, we have the functions __pkvm_reclaim_page_guest() and this
> function, pkvm_reclaim_guest_page(), which calls
> __pkvm_force_reclaim_guest_page, which in turn calls
> __pkvm_host_force_reclaim_page_guest(). I think having a bit of naming
> consistency would be really useful when navigating the source code.

Yuck, you're right! I'll make sure 'force' is used consistently on this
path.

> It might also be useful to document that callers of the hypercall
> __pkvm_force_reclaim_guest_page are not expected to unpin the page in case of
> success, but callers of __pkvm_reclaim_dying_guest_page are.

I'll add a comment, but this is the private hypercall interface with the
host and, as lwn might put it, it's rigorously undocumented. Unpinning
memory from panic context is an interesting idea ;)

Will

