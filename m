Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AADC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 19:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgldqAkN4EcKf+iDJigOAF1MecbzOvfvyTrQTD43eRc=; b=arEr14XVGKTmWoFwCrrQSxUzqM
	ELbI5AdHkCvnh4Ss31P3I3wqdiRvzxa5s40dHrwkQHRcSiu0mscr+r5A7ky7Ic35i6uUH0SlWOtYK
	DwbSMj14GmwvMb47BO+dXBzWtXceHW+lzqaryG/OTCVCuNS/Izu+F+t22+ERBCEaaJKzlYjUcaG68
	Fjx1//WpJWL4/Mye+6MH65W3qpY2dgp9zDb2VrafLP/PpKWIZbtzZgIoEfU6t8JnM/oMzRiaTVQm6
	qvgox7T+W5wtIQjP6/IQRjLKfWURmEgnYcONbXcWdD3zURHqbIN73V2xNwImekywEJyVmrtT0DsJr
	xWYR67Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uShSC-0000000GRlt-0n9A;
	Fri, 20 Jun 2025 19:31:12 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uShPw-0000000GRMn-2ehL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 19:28:53 +0000
Date: Fri, 20 Jun 2025 12:27:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750447730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NgldqAkN4EcKf+iDJigOAF1MecbzOvfvyTrQTD43eRc=;
	b=W42T7MNlvzs/y0GgOq0jyWHLLYVFWnXTLt8ehslxEORhH363LQ3I2EKnyY/lcXJ7TuYCCP
	/ddoesoS1z3+FzcQtRf+UEyi/ryVP6PVmtH1LVq3QA7cCZuxX6dbA5NubQaX4Y9lVNRphf
	Jqn5Jzz8vxkhz8VXmNt/f9dhM/LssW8=
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
Subject: Re: [PATCH v3 02/62] KVM: arm64: WARN if unmapping vLPI fails
Message-ID: <aFW2NISX0q11sop1@linux.dev>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-4-seanjc@google.com>
 <86tt4lcgs3.wl-maz@kernel.org>
 <aErlezuoFJ8u0ue-@google.com>
 <aEyOcJJsys9mm_Xs@linux.dev>
 <aFWY2LTVIxz5rfhh@google.com>
 <aFWtB6Vmn9MnfkEi@linux.dev>
 <aFWws7h3L-iN52sF@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFWws7h3L-iN52sF@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_122852_818601_CA3E3D30 
X-CRM114-Status: GOOD (  14.32  )
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

On Fri, Jun 20, 2025 at 12:04:19PM -0700, Sean Christopherson wrote:
> On Fri, Jun 20, 2025, Oliver Upton wrote:
> > Can you just send it out as a standalone patch? It's only tangientally
> > related to the truckload of x86 stuff
> 
> The issue is that "KVM: Don't WARN if updating IRQ bypass route fails" directly
> depends on both this patch

Eh? At worst we break bisection for the warn, which I'm sure we manage
to commit similar high crimes on the regular.

> If I post it as a standalone patch, could you/Marc put it into a stable topic
> branch based on kvm/master? (kvm/master now has patch 1, yay!)  Then I can create
> a topic branch for this mountain of stuff based on the arm64 topic branch.

Ok, how about making the arm64 piece patch 1 in your series and you take
the whole pile. If we need it, I'll bug you for a ref that only has the
first change.

That ok?

Thanks,
Oliver

