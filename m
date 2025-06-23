Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85E5C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 12:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3N9VDcshFlX/X0wI8PiOUMmEVYOdmeyI0DJYhB4LlIE=; b=QET7yMn1NMG5zaZ3cE7/KIvySm
	UTJslldcl57ZTyEykgVPuEdOKwMuWaQvyKKNonf3Kx5M8OQqfolKpIzFN0FBI7+yAjh5OtKXsNGel
	Nol1qnwUyitQ2NlXYhR9F5e/XsGUHAt2LGELIrsEvV4eCbQHM8lYik18TwZHDuUcNFnbz7VhtfyO+
	qi7q8Q/DRV4vyGvn0/Y++IfCFz2BqfFZjdZAwyEfO/2vC40cYqXYmXlcwdFzUu9CWtlju1NYj+OqY
	gjd/rJ6EYWN4+mn6PfoLJDKTeJWo5ltZ5K+VWa7eRkVZWoWlHIaW+CJzGMskVBnpaXWnCWV0yS6iU
	Kp3wtz5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgSs-00000002jBr-2iOy;
	Mon, 23 Jun 2025 12:39:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTejN-00000002QB7-3swH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 10:48:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 79EE45C011A;
	Mon, 23 Jun 2025 10:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B19AC4CEF2;
	Mon, 23 Jun 2025 10:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750675732;
	bh=GeiFc7fkYtw2PiNgSxLbHE9VEewIkyxJ97+h2sDlPWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PYEM387M2psgVE2tb0EwhsInLMPQjhG7/iZjloP4oYCadD9zFGQjfoCkngU2nBn4j
	 ZtjKAHh/K0U5HyjNhPn8LgGC3mrFLOf2cy1tzTfy9Wj/Ds31wly05dSbbxaYhKsItd
	 O13P4GBuwDHshV1nkSwnQCSPg2G0fN1yd7BJV7RgsMv7+kLRFbYizrWLeQlFINhEPm
	 JLTSPH/Cs3R43kdHUJHONuE2Zq3CXb/6bOmSa90m9TnPQ8/eRMWhsqOS9FgUsyDZSb
	 bFYKhdqVb3JincAkzMdkR0dqzVYxdhHOytVPtYRg/bOeZJYJo+P8XitEmpBg/re+L0
	 OvPgeesbzz7LQ==
Date: Mon, 23 Jun 2025 16:15:13 +0530
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
Subject: Re: [PATCH v3 17/62] KVM: SVM: Add enable_ipiv param, never set
 IsRunning if disabled
Message-ID: <basmpkilvhmg52pktjkpkqwmfcx2nnpbv75c6dxs73w7ehnwam@yyeft6vgabk7>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-19-seanjc@google.com>
 <2eqjnjnszlmhlnvw6kcve4exjnpy7skguypwtmxutb2gecs3an@gcou53thsqww>
 <aFVylP1XzMoqocOx@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFVylP1XzMoqocOx@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_034854_019985_61E92520 
X-CRM114-Status: GOOD (  20.17  )
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

On Fri, Jun 20, 2025 at 07:39:16AM -0700, Sean Christopherson wrote:
> On Thu, Jun 19, 2025, Naveen N Rao wrote:
> > On Wed, Jun 11, 2025 at 03:45:20PM -0700, Sean Christopherson wrote:
> > > From: Maxim Levitsky <mlevitsk@redhat.com>
> > > 
> > > Let userspace "disable" IPI virtualization for AVIC via the enable_ipiv
> > > module param, by never setting IsRunning.  SVM doesn't provide a way to
> > > disable IPI virtualization in hardware, but by ensuring CPUs never see
> > > IsRunning=1, every IPI in the guest (except for self-IPIs) will generate a
> > > VM-Exit.
> > 
> > I think this is good to have regardless of the erratum. Not sure about VMX,
> > but does it make sense to intercept writes to the self-ipi MSR as well?
> 
> That doesn't work for AVIC, i.e. if the guest is MMIO to access the virtual APIC.

Right, I was thinking about the Self-IPI MSR, but the ICR will also need 
to be intercepted.

> 
> Regardless, I don't see any reason to manually intercept self-IPIs when IPI
> virtualization is disabled.  AFAIK, there's no need to do so for correctness,
> and Intel's self-IPI virtualization isn't tied to IPI virtualization either.
> Self-IPI virtualization is enabled by virtual interrupt delivery, which in turn
> is enabled by KVM when enable_apicv is true:
> 
>   Self-IPI virtualization occurs only if the “virtual-interrupt delivery”
>   VM-execution control is 1.

Excellent, for this patch:
Reviewed-by: Naveen N Rao (AMD) <naveen@kernel.org>

Thanks,
Naveen

