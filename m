Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62D2C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uT1j/JBqsK2CwsMdQ8uSXV4Hx1epAt5Onvot93kluDk=; b=adwwAsGEixJv0oUwPST5DDqZXD
	RKUY3j4I6O5KZKRG4BjwmRD4r5ZVAqpNHtfwhMq6/xCtDIZuhRCTeIraNquimInpex3Mnwc0Mwf2+
	uKqqZoY/IUqN8Y4ns/U/D2UEai3BpCYJXFRWGzvc3aNvOJA7Dfm0n/YDbkyUTqcOF8VcoVUS4YIah
	tKtkTM8LBUGRhwDKIRC1cECZkAJSiuV8qd4B2PWwvSgW7XF03+mTvP12ZOGtljYjZ4ESahERo8RTE
	albJbO6hQ5c28eaZ7vVItDKQ8sDXwXGCVDEtS6Q1QhwwSfGs9bEY5yt/XjH3BjHgnEt8IFY/Ey5Pi
	DuhwrovQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5UE-0000000FnFx-1B80;
	Wed, 12 Aug 2026 09:43:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5U7-0000000Fn9j-0MtV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:43:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F69F1596;
	Wed, 12 Aug 2026 02:42:50 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B74A03F632;
	Wed, 12 Aug 2026 02:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786527774; bh=TWIx30sQ2XIiCJN5oInxN1eYSUaNHzZF/7kx70htilc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8rQHImNyNAzejdLBSghKJJtyP98JyGNFZAaclJgQJX4RU6fdfS2KryNs33viqr2F
	 XQje0saWr6PrHVv39YXDAKLHVPXX4bNANey2IJxbw0sXCRaSm+y1tzJjYEtIzKyjYo
	 XQxiGkhteJciKjIwzdtfB12Wmc1C3H00f2wNuhLI=
Date: Wed, 12 Aug 2026 10:42:50 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	maz@kernel.org, oupton@kernel.org, suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	david.hildenbrand@arm.com, mark.rutland@arm.com,
	ackerleytng@google.com
Subject: Re: [PATCH v2] KVM: Ignore MMU notifiers for guest_memfd-only
 memslots
Message-ID: <anxAGkdyPYXBlS00@raptor>
References: <20260714160411.302386-1-alexandru.elisei@arm.com>
 <amPCdAswlk24Xilf@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amPCdAswlk24Xilf@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_024256_333905_FBEFF12F 
X-CRM114-Status: GOOD (  17.98  )
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

Hi Sean,

(Sorry for the silence, was on holiday)

On Fri, Jul 24, 2026 at 12:52:20PM -0700, Sean Christopherson wrote:
> On Tue, Jul 14, 2026, Alexandru Elisei wrote:
> > +	 * TODO: Skip gmem-only memslots on mmu_notifier events entirely, once
> > +	 * gfn_to_pfn_cache is also wired up to directly pull from guest_memfd.
> 
> So it turns out we need to solve a very related problem[*], thanks to commit
> b9220d32799a ("KVM: x86/xen: allow shared_info to be mapped by fixed HVA"),
> which as it says, allows populating gfn_to_pfn_cache directly with an HVA, i.e.
> without a memslot.
> 
> My not-yet-tested solution for that mess is to give gfn_to_pfn_cache its own
> invalidation sequence, at which point there shouldn't be a need to process
> gmem-only memslots just for gfn_to_pfn_cache, because it will already be equipped
> to handle memslot-less invalidation.
> 
> Given how simple this change *should* be, I'm going to put this patch on the
> backburner for now, and then assuming my proposed change actually works, I'll
> grab your original change (or more likely, re-post it as the last patch in the
> series weans gfn_to_pfn_cache off mmu_invalidate_seq).

By "original change" I assume you mean the RFC patch [1], where I skip the
memslot entirely in handle_hva_range(), which would make sense since the
problem you are solving involves cache entries without a memslot.

[1] https://lore.kernel.org/kvm/20260615155244.183044-1-alexandru.elisei@arm.com/

> 
> It'll probably take me a few weeks to circle back to this, as I finally crawled
> out from underneath a pile of urgent and am just now getting back into review
> mode, but this is fairly high on my todo list, so with luck we might still squeeze
> this into 7.3.

Sounds great to me, thank you for your time and patience!

Alex

> 
> [*] https://lore.kernel.org/all/aj2hi-NcqUUCaoQF@google.com

