Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957CDC71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiYXVgcIqh/RTLmK+Rx+QzUVOjDT9BY8SQ3RWUnrRPA=; b=U6MHMnW4wNdq1pUnq48+kwqWS1
	Cxo6jW09eQ8CCwpFX0eiXD+QEwwduw35xo+wnZ17Xz19PBvjadktF1f1zoPpECnkIK5RWh3xPiCNg
	BeiwR2ZAmVGlj2Jz3Pldbi1YCRZ9POhYZXAY5crxW+PkXYmWfD70bWZOtotFZgsGbg3AW9ODoMMOd
	7oy0jTjbE6BtMrrIzXv5XexSCz5XxLpDPQkje9f5FA+xMgcRo9okRigrlWv8KSqMr0lfmGmmLI5rQ
	bwd8FYHOrT+QrPIjg4KFWsB5tYNl6SWOtr9w5HPG3JLrvOaeZqjeU0KV4SI9uthro/yiJhBrrPhNp
	awrijLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQALP-0000000HVEl-44a5;
	Fri, 13 Jun 2025 19:45:43 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQAJF-0000000HU8H-2x7o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 19:43:30 +0000
Date: Fri, 13 Jun 2025 12:43:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749843807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RiYXVgcIqh/RTLmK+Rx+QzUVOjDT9BY8SQ3RWUnrRPA=;
	b=Vd7PKd8wGfZvL5kqVq+Dca3A5hDB3H0EKNSbHMcN6e7P8ORHUnyy6UkFj4MyqfKzaiKyyy
	cluvv8f1WJyFdH2b+/DBV0z7DYn18aGgYZ50ltz3iGZ+XYjl8KLTJ8+lmr7urH53OmMXpz
	IzAMWm6MMTUuosIcgGHMBqXqO+4KxIA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sairaj Kodilkar <sarunkod@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Francesco Lavra <francescolavra.fl@gmail.com>,
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v3 01/62] KVM: arm64: Explicitly treat routing entry type
 changes as changes
Message-ID: <aEx_VlekBuL0ds5v@linux.dev>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-3-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611224604.313496-3-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_124329_884873_72FD69B8 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jun 11, 2025 at 03:45:04PM -0700, Sean Christopherson wrote:
> Explicitly treat type differences as GSI routing changes, as comparing MSI
> data between two entries could get a false negative, e.g. if userspace
> changed the type but left the type-specific data as-
> 
> Note, the same bug was fixed in x86 by commit bcda70c56f3e ("KVM: x86:
> Explicitly treat routing entry type changes as changes").

Yeah, I'll let you guess where I got the idea from...

> Fixes: 4bf3693d36af ("KVM: arm64: Unmap vLPIs affected by changes to GSI routing information")
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

