Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04849C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 20:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJF9HWy7wkusHjQ5XOzTnD26subHMVamVnoXMJ3j9ys=; b=z0BS0ISMeHtr7LU+afjp8r8kya
	CqTPpTcjGDKYPXeVRB1Z0M9pvNedICl64/CeikJPEKQtl5cd87nicY5JOqd3OfmTJRDj6IrMpv7xy
	9IGjalio3ezo0LEVSlA0ZlTNyNk/tm7wDjzS+g0r32O9cySY7Oa8fCzY2cwZhgr3WyxmJUVRl5mWs
	HZOHbggZNVhEC9GE3pYwHaLY8asqCwKv15txlAjWNu/HM9GlyZcElaqrI3jEFKz0vJ6iqGwlLICnT
	JRj0X/OykA6MCNaEl7bMgeyHZ+A7Gj3ZxUZTTpO1cn+0hlsVpgEfaz0ECGhkDTPDSiOmAlhUXhhj5
	BHLbQOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKNK0-0000000E4a3-2paH;
	Wed, 28 May 2025 20:24:20 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKNHo-0000000E4JR-2zSJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 20:22:08 +0000
Date: Wed, 28 May 2025 13:21:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748463720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJF9HWy7wkusHjQ5XOzTnD26subHMVamVnoXMJ3j9ys=;
	b=lWaSbmnesIXm8TvqRaGJyb4mtKLnRTErMhmaV0isdSqCDAUXJtv5slw7A+8jLeTIwU6k5M
	kLCq8ZAZWXOIGy3Um5AcDj1pA7a6FPgFpMMw0brsDPLtDla6O0Bq85rKGuqthWj+wjKRdo
	1X29WU4k78nHFAS3E3MD/bNL587ZQAE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: James Houghton <jthoughton@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Anish Moorthy <amoorthy@google.com>,
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>,
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 05/13] KVM: x86/mmu: Add support for KVM_MEM_USERFAULT
Message-ID: <aDdwXrbAHmVqu0kA@linux.dev>
References: <20250109204929.1106563-1-jthoughton@google.com>
 <20250109204929.1106563-6-jthoughton@google.com>
 <aBqj3s8THH9SFzLO@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBqj3s8THH9SFzLO@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_132204_975016_03E771D7 
X-CRM114-Status: GOOD (  13.07  )
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

On Tue, May 06, 2025 at 05:05:50PM -0700, Sean Christopherson wrote:
> > +	if ((old_flags ^ new_flags) & KVM_MEM_USERFAULT &&
> > +	    (change == KVM_MR_FLAGS_ONLY)) {
> > +		if (old_flags & KVM_MEM_USERFAULT)
> > +			kvm_mmu_recover_huge_pages(kvm, new);
> > +		else
> > +			kvm_arch_flush_shadow_memslot(kvm, old);
> 
> The call to kvm_arch_flush_shadow_memslot() should definitely go in common code.
> The fancy recovery logic is arch specific, but blasting the memslot when userfault
> is toggled on is not.

Not like anything in KVM is consistent but sprinkling translation
changes / invalidations between arch and generic code feels
error-prone. Especially if there isn't clear ownership of a particular
flag, e.g. 0 -> 1 transitions happen in generic code and 1 -> 0 happens
in arch code.

Even in the case of KVM_MEM_USERFAULT, an architecture could potentially
preserve the stage-2 translations but reap access permissions without
modifying page tables / TLBs.

I'm happy with arch interfaces that clearly express intent (make this
memslot inaccessible), then the architecture can make an informed
decision about how to best achieve that. Otherwise we're always going to
use the largest possible hammer potentially overinvalidate.

Thanks,
Oliver

