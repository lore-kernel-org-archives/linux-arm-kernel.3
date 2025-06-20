Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88912C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 20:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByAPDQByeMdLRhDMIGN/IiSb/H4BbcIKGrfBibrThdw=; b=0agoRl2tXxCQHvAeLiq/zoJ1aV
	hAW+rXG3EB/g63oeJZ0+I/CCBgd96Z0u19+rnVbu4GYfZKgkEiLBwmNVAAk4U1eQ4Ip/wg29m5SpO
	/RIFlEKY7JeZR0od31mu4PJ7iZHGd62JVXys+YFoM30KDpcQR4IY/PlzzYEctAn6lvfct3aLGcFj4
	nc01WJlT+NWQt7mbb4CsglCZB29pS+tvFRjm2LwrLeg144e0U6ay2Ph59SThxlae3D9YkBBn1mnpy
	kExbHAfydfNh2KHpG7Ofs1QFaMzVpyJUyTbI7WOm02PY36s5RkhurpFLlRS4TBWrX7hXkbX92ebZZ
	hdZNp66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSilK-0000000GZzg-0v5U;
	Fri, 20 Jun 2025 20:55:02 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSidL-0000000GZPg-203C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 20:46:48 +0000
Date: Fri, 20 Jun 2025 13:45:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750452395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ByAPDQByeMdLRhDMIGN/IiSb/H4BbcIKGrfBibrThdw=;
	b=wB2JMktH26IhXs7XGQI53IupRTDVbGuWl0qkGpR4EDdkm6Y0SKYhHCVQ3hJR8Rqu2hK1LA
	N1NJF2AJ9y/cp/vQqHMdmu8F0Mj3Qd4i049KApbe8HC1z3bEABA5689uiXgYJFwU2g76pp
	zOPEZ4caj/QyY29FLXxszr21nzjdq9A=
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
Message-ID: <aFXIgrmU8uSA6YHS@linux.dev>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-4-seanjc@google.com>
 <86tt4lcgs3.wl-maz@kernel.org>
 <aErlezuoFJ8u0ue-@google.com>
 <aEyOcJJsys9mm_Xs@linux.dev>
 <aFWY2LTVIxz5rfhh@google.com>
 <aFWtB6Vmn9MnfkEi@linux.dev>
 <aFWws7h3L-iN52sF@google.com>
 <aFW2NISX0q11sop1@linux.dev>
 <aFXFO6_lVV5PpGW-@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFXFO6_lVV5PpGW-@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_134647_658036_E835DE30 
X-CRM114-Status: GOOD (  17.03  )
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

On Fri, Jun 20, 2025 at 01:31:55PM -0700, Sean Christopherson wrote:
> On Fri, Jun 20, 2025, Oliver Upton wrote:
> > On Fri, Jun 20, 2025 at 12:04:19PM -0700, Sean Christopherson wrote:
> > > If I post it as a standalone patch, could you/Marc put it into a stable topic
> > > branch based on kvm/master? (kvm/master now has patch 1, yay!)  Then I can create
> > > a topic branch for this mountain of stuff based on the arm64 topic branch.
> > 
> > Ok, how about making the arm64 piece patch 1 in your series and you take
> > the whole pile. If we need it, I'll bug you for a ref that only has the
> > first change.
> 
> Any preference as to whether I formally post the last version, or if I apply it
> directly from this thread?

Since I have this email on my phone I'm always in favor of not getting
spammed :) This thread has all the discourse too, so likely a better
artifact.

> > That ok?
> 
> Ya, works for me.  What's the going bribe rate for an ack these days?  :-D

Usually about the cost of a pint ;-) For the arm64 bits:

Acked-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

