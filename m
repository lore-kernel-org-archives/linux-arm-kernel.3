Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B22C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qj1wjf8hsIewxFDdBSOym5Re2/X20nVWvOWb4Qgrt2U=; b=hGpfsPvBRiGbf++r5Y5teZ9a7A
	ZIIxe6Q2xSQQz4uMQPbCfkJJbXLq94tshXqB7wyh92rK+0MzidugJJfxs+/7gi7mPN+Bf+9UDr9mY
	pdByNVNwQp5xPRjo7repNSoOTOo1B84zjpnZ/J+9LeFApjghLl95z5aHxaGu+xQONuJ0deqIXtbdP
	2yTQntPsMTLjqrZDwhS1ze2+nqo2O5s5yNksCXvfN7heNn8JzdVoXvD6EJvhX/989m04CmnB98V3p
	Bp5W9mV0nMWUyi049AYgJv3vJqC5rQaTqNDec/a6GsYkJYRRFHuUjTV7Loy4Xtz5wEygf0lY/Axsr
	0Q2rzTew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6Zw-0000000GvIZ-05j8;
	Fri, 13 Jun 2025 15:44:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5a6-0000000GitS-3iwU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 14:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0704E62A03;
	Fri, 13 Jun 2025 14:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5ADC4CEE3;
	Fri, 13 Jun 2025 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825633;
	bh=CH7nTr5IwVC1KQNokMXN8FCbbEIOHzBXmAfmRN7YB5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0SSoTgaAO+dlWR/atirDPk9wUwTuM+3RJWmf/tJRQL0E2XRhlSZqcagL0vhoKfTU
	 4Fim557zSPKuQT29wM4Iflf5R65OxrnBFPvj5BymsmzL7ZXtKMUQ3+wNzbq5TZKSu+
	 qSIbUh6O+Hfx9FkhNv2ogibSnIEOaQT6ssAp8xXFBeIy0+xSfm/K3u6toJ60liUeOU
	 V/W0nefD2HQozu7eDfZMxrifkjUrKfiau7OtMU7mqgHqZnnU94faGYlzSNH2IWw5p9
	 QPVmF58r+kP55im8NRt1AVyODmvRW4C2zZY44d6ueE/EsNhuiXEatUFUjXnFdqsq4t
	 IA0N32/bNx1PA==
Date: Fri, 13 Jun 2025 20:07:16 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, Sairaj Kodilkar <sarunkod@amd.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Joao Martins <joao.m.martins@oracle.com>, Francesco Lavra <francescolavra.fl@gmail.com>, 
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v3 09/62] KVM: SVM: Drop pointless masking of kernel page
 pa's with AVIC HPA masks
Message-ID: <oflbeygd75owcda6ingafhnsrryswrp2qu3dfbd7z53kdm7u7c@ygarzfhtlo3r>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-11-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611224604.313496-11-seanjc@google.com>
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

> KVM: SVM: Drop pointless masking of kernel page pa's with AVIC HPA masks
				      ^^^^^^^^^^^^^^^^
Just "physical addresses", or perhaps "HPAs"?

On Wed, Jun 11, 2025 at 03:45:12PM -0700, Sean Christopherson wrote:
> Drop AVIC_HPA_MASK and all its users, the mask is just the 4KiB-aligned
> maximum theoretical physical address for x86-64 CPUs, as x86-64 is
> currently defined (going beyond PA52 would require an entirely new paging
> mode, which would arguably create a new, different architecture).
> 
> All usage in KVM masks the result of page_to_phys(), which on x86-64 is
> guaranteed to be 4KiB aligned and a legal physical address; if either of
> those requirements doesn't hold true, KVM has far bigger problems.
> 
> Drop masking the avic_backing_page with
> AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK for all the same reasons, but
> keep the macro even though it's unused in functional code.  It's a
> distinct architectural define, and having the definition in software
> helps visualize the layout of an entry.  And to be hyper-paranoid about
> MAXPA going beyond 52, add a compile-time assert to ensure the kernel's
> maximum supported physical address stays in bounds.
> 
> The unnecessary masking in avic_init_vmcb() also incorrectly assumes that
> SME's C-bit resides between bits 51:11; that holds true for current CPUs,
> but isn't required by AMD's architecture:
> 
>   In some implementations, the bit used may be a physical address bit
> 
> Key word being "may".
> 
> Opportunistically use the GENMASK_ULL() version for
> AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK, which is far more readable
> than a set of repeating Fs.

Makes sense.
Reviewed-by: Naveen N Rao (AMD) <naveen@kernel.org>

- Naveen


