Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8E2CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 13:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60Pf9XMwdYobqlpxIf9V/Xi8ufuCJnBC10qkluRXtPw=; b=O6Thb5FtijwGTlOlAE2EPLussI
	BjsdTOm27tq632wGbsiIO/3EhZJWS/lxrSDUoEaukbeN9/m8cPphPdRSfjYqTSNme5l3AQUVSvovs
	+ax+Dgl0TSwKh5aa+CZPSYmc+WGqDgOoy/0fvTQzvRL2JuO0wFnPBaKlQ6efTwjGKDGaGZHKNDUqP
	lfCmgtpxkGo4bTDupQTPHQWTvu0SUvEaAxe55Ii3qVIIWq5dVqyHL2Ya6TO1PJJ7VLd9tOXKDPfJm
	kuxygnNKwFP2fJPskdnI20LTLuucEK/C2HCMhSSLqtru3A5XLaDocQaDeUNexrcjJz+VsdJpHTjJH
	UA9bweFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqFJ-0000000HPTn-2MAr;
	Wed, 17 Jun 2026 13:23:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqFG-0000000HPTH-3xSU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 13:23:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1AAA4794;
	Wed, 17 Jun 2026 06:23:46 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B94FC3F915;
	Wed, 17 Jun 2026 06:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781702631; bh=af+vwUJx5/nKf7spNaPaxuPmMl8dQF1xTaTv0lMenRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e0RKjS5efaGFzQSLQqFTgt0U5xjfYBjoUrrXTUdKz6sBI4aYwgx3Fol7GuTwU+tfd
	 oCi0OKgiG72jmzixU3bWCpjqsXpVpJ6SafCaxjol828e3Pz4YLDg4xopW/Ccxg0uuP
	 UyLI8cC1NQLB4JBHqj+zCFh6ST0x8KMP2l2S/swA=
Date: Wed, 17 Jun 2026 14:23:47 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: David Hildenbrand <david.hildenbrand@arm.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	maz@kernel.org, oupton@kernel.org, suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	seanjc@google.com, mark.rutland@arm.com
Subject: Re: [RFC PATCH] KVM: Ignore MMU notifiers for guest_memfd-only
 memslots
Message-ID: <ajKf41Fgy_jKBAMI@raptor>
References: <20260615155244.183044-1-alexandru.elisei@arm.com>
 <42323088-c06e-42e2-b095-136062a8d27c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42323088-c06e-42e2-b095-136062a8d27c@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_062355_052268_AEEDE303 
X-CRM114-Status: GOOD (  24.08  )
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

Hi David,

On Mon, Jun 15, 2026 at 09:07:50PM +0200, David Hildenbrand wrote:
> On 6/15/26 17:52, Alexandru Elisei wrote:
> > For guest_memfd-only memslots (kvm_memslot_is_gmem_only() is true), the
> > memory provider for the virtual machine is the guest_memfd file, not the
> > userspace mapping. Faults are resolved using the guest_memfd page cache,
> > and the permissions for the secondary MMU mapping depends exclusively on
> > the memslot (i.e, if the memslot is read-only). How userspace happens to
> > have the memory mmaped at fault time, or even if the memory is mapped at
> > all into userspace, is not taken into consideration.
> > 
> > guest_memfd memory is not evictable, is not movable and there's no backing
> > storage. Once memory is allocated for an offset in guest_memfd file, the
> > offset will not change, and that memory is not freed unless userspace
> > explicitly punches a hole in the file. As a result, memory reclaim, page
> > migration, page aging and dirty page tracking for the userspace mapping
> > serve little purpose.
> 
> I don't think any of that is relevant for the patch at hand?
> 
> The thing is: invalidation (truncation, later migration, for any other reason)
> is driven through guest_memfd notifications, not through unrelated page tables.
> 
> If we don't lookup pages for the KVM MMU through the page table, then there is
> also no need for MMU notifiers. It's all guest_memfd only.
> 
> Or am I missing something?

My thinking was that, because guest_memfd is not evictable, there is no need to
do page ageing, which would require that secondary MMU mappings be made old.

The invalidate callbacks are also used when userspace memory is marked read-only
for dirty state tracking. I was trying to explaing that, since there is no
backing for the guest_memfd file, host doesn't need to keep track of dirty state
for the memory, and ignoring the invalidate callbacks is correct for all cases.

I can drop the paragraph entirely, if you think that would make the commit
message clearer.

Thanks,
Alex

