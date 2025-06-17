Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214EFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZwmGCWbfKlubtp052O6l8WeU2gS+TuLqlblbxpD0AY=; b=m5h/55XjcH+0wybdVqFYEjc/Aa
	sQo8smEBI/i5lokBhG2pqsOdAdANagGBgSt2XXh1zwgp3CjDdoeUJBd4HqLSJMsCVnqYOrKKcMdXE
	XCYoCT1fuNKZUtU8reiphKZzhcFRs/x+oW0257Jr3yN2SCdde2h2rbXZG4rQl2io/+Ao1XC6nu6r0
	zqOg7Go2QrAGsNBc35GTDu8rBkO+Yd2XWxbjYly6jwBvvgsm8Oki7+XOEJ720M3Cn6lm0+MS73NHo
	IDcHBTf4/sDUdVeJqbH0fIo4Ubq9F9Bugpva5lre08AKbD98cC9VuFTWnxyMN/9B2OG9FGhoxNqcT
	tJrXS4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZq5-00000007yQQ-38mR;
	Tue, 17 Jun 2025 17:11:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXx5-00000007hsq-1daD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 15:10:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C48E9611BD;
	Tue, 17 Jun 2025 15:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB254C4CEE3;
	Tue, 17 Jun 2025 15:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750173018;
	bh=TZcOBjPsqZfGB1DMcUTuXivLLt+YrMUoZ3nRg9JcutA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1V8IgRlHTwSpqeHPfwcab6KJbWP4sgrPRjDiY5mVBfW1R1Ysf8BUTKEIPao3PYyQ
	 lI3B1+Mj6q5O5kBypRlQzoI0+zeVg+I1fwkDRbujK5PcEnZUMljlB8yEQocCjbqlXl
	 vSAD4DY6nXirSVMcaqOWWV5d61j6LRHxZvTg8UArFI6hBYa6KarYXR+JTOG3pMWy0Q
	 ltpk+JEFpn0LUZuzNOniyP0LlW9VNrfuBZo8dxB8XEJHh8d8DFdgtkHUqCD/RXZq2Z
	 BcjKScmmFE7bQHLs4S3AgeqqmssrlnkLDTG7lQ7nEMwFC1/4FwVhOyJn3+Gi8b0qI6
	 q+AdRLx1gSiEA==
Date: Tue, 17 Jun 2025 20:31:36 +0530
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
Subject: Re: [PATCH v3 14/62] KVM: SVM: Track AVIC tables as natively sized
 pointers, not "struct pages"
Message-ID: <a7j5yllrxxzaqzjcmpfu3oxh775xgzx7h7nrkw53rmucnrbspy@zlwzwgfd7uke>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-16-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611224604.313496-16-seanjc@google.com>
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

On Wed, Jun 11, 2025 at 03:45:17PM -0700, Sean Christopherson wrote:
> @@ -277,8 +265,8 @@ static int avic_init_backing_page(struct kvm_vcpu 
> *vcpu)
>  		return 0;
>  	}
>  
> -	BUILD_BUG_ON((AVIC_MAX_PHYSICAL_ID + 1) * sizeof(*table) > PAGE_SIZE ||
> -		     (X2AVIC_MAX_PHYSICAL_ID + 1) * sizeof(*table) > PAGE_SIZE);
> +	BUILD_BUG_ON((AVIC_MAX_PHYSICAL_ID + 1) * sizeof(new_entry) > PAGE_SIZE ||
> +		     (X2AVIC_MAX_PHYSICAL_ID + 1) * sizeof(new_entry) > PAGE_SIZE);

Ah, you change to 'new_entry' here. Would be good to rename it to just 
'entry', but that's a minor nit. Ignore my comment on the previous 
patch.

For this patch:
Acked-by: Naveen N Rao (AMD) <naveen@kernel.org>


- Naveen

