Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394C0C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nugg9xwJX4POla3BPsfx+wvdaOHTW9NAJuhI6vGkpt0=; b=Zo4Wk0nm6B23kzOt6vmTBPHAaT
	YLKzAAoI3rWewD7EfcUPV0H5HHaMXPpCl1kIyRc8D7bU9LMmAmSEKKeFjcyFKSnamYQApnMaKsga2
	JZqfKJfbFJf0RN3wvvt7RBtmdQ9oAoRv4w2LeZoO03takuYiuQhpHEf275TZbJSO4oHXK0MQljDLf
	r6MwhuK9UIfmiUP+xu/V4LZwovIn3mD680HV6Yq+Ce4fOnZhJdNOGh91ZNO6bH27G1GPo8dRd3dXJ
	WFfb+znVhP8Ek7QoAe1m7WMH5APZP01EowXeiFowLQ3eAEZLKPGXm+UrtAsCLSZav4h9t7LOBPt80
	lxlKrQvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6cA-0000000GwjT-3MNX;
	Fri, 13 Jun 2025 15:46:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5aA-0000000Gitd-16Z7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 14:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7FA0CA511E5;
	Fri, 13 Jun 2025 14:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68948C4CEE3;
	Fri, 13 Jun 2025 14:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825637;
	bh=ukElmnGXQREfqKEweQO3U9N27ypBuMm6P/e+FMdR3F0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rvEmwf1lFXDM9ZvmgPspADE8tJL4IEhvgbU8HfVx3ZPiT1i6its39cdN+G03Fq8P9
	 S8EbS+WBHsW8CfZqPrsK1wbrPADgopSFt0qBFkOnNw2CH1xXO8K4CjCh3cXg8hoe5t
	 IyazDn1qIEJGAPuxiLjorBKH68Dun7qzyX1ld6KCFGw4S9/53ArQscRaUAsDTWlthn
	 2k6fnhUycmeeQV/Ouk6AWU9gZafBdu3G+QHQtPVLyNJc/9FMpeqNkx3d7SCi5L6rgw
	 R8uz40PlByH7dA9RQ+IAC2JIoeiM0lst0rcEqT+CfmO5J3yplYv1AkICKuEVrdWwOE
	 EZtkBkxTrKy0g==
Date: Fri, 13 Jun 2025 20:08:26 +0530
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
Subject: Re: [PATCH v3 10/62] KVM: SVM: Add helper to deduplicate code for
 getting AVIC backing page
Message-ID: <dgpb6ukrgoo63o3tikrwectvq5l5dcu7k7fskdkyxtr5lmbshg@eb7y7fzwc6wp>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-12-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611224604.313496-12-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_074038_369911_A569DE0B 
X-CRM114-Status: GOOD (  11.84  )
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

On Wed, Jun 11, 2025 at 03:45:13PM -0700, Sean Christopherson wrote:
> Add a helper to get the physical address of the AVIC backing page, both
> to deduplicate code and to prepare for getting the address directly from
> apic->regs, at which point it won't be all that obvious that the address
> in question is what SVM calls the AVIC backing page.
> 
> No functional change intended.
> 
> Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
> Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/svm/avic.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

LGTM.
Reviewed-by: Naveen N Rao (AMD) <naveen@kernel.org>

- Naveen


