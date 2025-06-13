Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A317C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnPcSqX11bxR+BEKLUYfqtG6D7GEuXXOIDbVFtqB+JY=; b=L2Yeyv9S5wLzPQYtaQhfxZmV1d
	LxJRm9Uhsvr8LThgWxw+XPQKBvtTtJ2EtmLNSfp9WWXD3l4R032X/HieWhGdJvfHerizRPXIYmA0l
	x84/HrB5qe3jwra8SicqXAojyQeTsvJA48T5eMyFOtiSJe0mIC0LRlnWHjUZ8kCoTIpZ9MX8SWz6B
	4oyCrw1kYBYopnQYqY2C7NIkWnuyVBum9kKK4kytWQpyH7t/LxMtJphzs+XYtb+pzw2+aecTNOLId
	ZwpJjf508Ovpi9WIdkCDcCZbk0+h/L26Lzrp+RzogsSBc4DjBb4YquBrMr4tQNCAgV7Qh+r61YH52
	dT3CEkcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6KA-0000000Gsf5-2wHg;
	Fri, 13 Jun 2025 15:28:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5Gk-0000000GfsA-2M2Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 14:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEC5744E68;
	Fri, 13 Jun 2025 14:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B14C4CEED;
	Fri, 13 Jun 2025 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749824433;
	bh=EPKHkNW/pWvGSKzvuK+zaYdXAKILaYuidguqxeIk4Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ve6FZ8Alf9SI1sYrlPynorHq3vd7XO0hctfD/FwFi1Yr570jgszY/sWUWJFbKLuPM
	 nQu71s/Hul7EmxbxouGX5T+wjrRTxgKeiFEW+bs5rkJCsFxcwHU759DXQlTabuPT5G
	 PxDjtDGhNA7kvKkd2UzQA8HlsRM8T/eu+E+TSoKOFPtdjGyfJ5fxBxWqQP/vDzNKLr
	 oD0dnXeWr2CjqBr5qLfbFaASn2OOi+AW791J7XUTflq3fgp8foITPixPCD2A4VIN4d
	 G1byFjPOeultEOPjaOsp5MWi85kGbs7/Mu2645Oib8V07SqMlETiiDgfkafiy09YOZ
	 U5tjo5xm+nn/A==
Date: Fri, 13 Jun 2025 19:45:10 +0530
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
Subject: Re: [PATCH v3 08/62] KVM: SVM: Drop pointless masking of default
 APIC base when setting V_APIC_BAR
Message-ID: <7kz6bvwpnsbth4puaivtygdzygqmcippdgkihieqcy5ua5rlpr@biu2qjtzraxz>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-10-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611224604.313496-10-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_072034_616682_0D02F2B7 
X-CRM114-Status: GOOD (  11.76  )
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

On Wed, Jun 11, 2025 at 03:45:11PM -0700, Sean Christopherson wrote:
> Drop VMCB_AVIC_APIC_BAR_MASK, it's just a regurgitation of the maximum
> theoretical 4KiB-aligned physical address, i.e. is not novel in any way,
> and its only usage is to mask the default APIC base, which is 4KiB aligned
> and (obviously) a legal physical address.
> 
> No functional change intended.
> 
> Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/svm.h | 2 --
>  arch/x86/kvm/svm/avic.c    | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Naveen N Rao (AMD) <naveen@kernel.org>

- Naveen


