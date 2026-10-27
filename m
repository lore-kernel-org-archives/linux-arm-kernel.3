Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E644606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PMtpucoA;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=S8vG/Rdf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6U6ukWtJS8Ibwot9neAzAfooQ69RGsnjUX/d7S/uqMM=; b=PMtpucoAGuXkMvWH/i4B9c+Ns+
	wr0sx92osDCUQs1kte2cYKbmDLVNOnjEqK+IQfmRm6ykf6mUP3DCfOBpEm4hyNidOvraQIAIZvM8R
	7jqDhD7QuFF9XNa02IWr5Oc0uf4S7dJRbbqoFQgDwYfV84xF+HiS5uwEl65pOpkDFzBOX7/hnwxbx
	zQtqLb1KtBKjJL9AfMC4jJXGR27Tvfg6zUsVTdaHIFICUnamnPj8DYkxbbJ3+8xwoUsSn9ZwzUFMc
	m6zuHI053vq9rA1+L0yiuTmzBinscU+MHSeZRfdQ3nUywOyGGuU125Zsk+/WCoNCxqPHCsHkA+Brn
	eP3f6ZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgPg-00000004fu5-3k05;
	Tue, 27 Oct 2026 12:36:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgPe-00000004fth-1eTY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:36:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08D2A15A1;
	Tue, 27 Oct 2026 05:36:16 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D9063F7B4;
	Tue, 27 Oct 2026 05:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793104579; bh=HF9mtcjcyXbLfac05vPyf9/ddhhqUEYPjy2TFsm4o6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S8vG/RdfKAp3mrTU24tsu1+AvwXvDJXh/3pGzvtcrDobvdvAFaasDGuudwYnXYpU9
	 oh+CiuR4qh3TXwjU1uPdtdAVK1rB02wyOTJ1mWXqismrYaSKGMnTX8DSFgefBBZ4cP
	 BmbTu8nTjAt76sVM8SE9Ixb2QC0ThhEK8P/H7kjs=
Date: Tue, 27 Oct 2026 12:36:08 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Gavin Shan <gshan@redhat.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Replace memslot_is_logging() with
 kvm_slot_dirty_track_enabled()
Message-ID: <3gewc54nkhrdyof75ijpyv3f2gbd7isc7sx2foqdk5yo2bjpgx@hoxbbo3n3ayn>
References: <20260605153248.2412064-1-weilin.chang@arm.com>
 <20260605153248.2412064-2-weilin.chang@arm.com>
 <CA+EHjTwK092o8YZjV0vzBDLSY=cesOvhqj39zDd1MF-toOVTwA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwK092o8YZjV0vzBDLSY=cesOvhqj39zDd1MF-toOVTwA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_053622_534169_3FA4F642 
X-CRM114-Status: GOOD (  32.56  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fuad,

Sorry for the late reply, I was focusing on something else.

On Wed, Oct 14, 2026 at 02:18:29PM +0100, Fuad Tabba wrote:
> Hi Wei-Lin,
> 
> On Fri, 05 Jun 2026 16:32:47 +0100, Wei-Lin Chang <weilin.chang@arm.com> wrote:
> > When checking whether a memslot has dirty logging enabled, the
> > KVM_MEM_LOG_DIRTY_PAGES flag is the source of truth. Previously we were
> > using memslot_is_logging() which only tests dirty bitmap and did not
> > consider dirty ring. This was not detected because
> > KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP was introduced together with KVM
> > arm64 dirty ring, and users need to enable it to ensure dirty
> > information is not lost for the case of VGIC LPI/ITS table changes.
> 
> I ran into the same bug while testing the arm64 KVM_PRE_FAULT_MEMORY
> series, and then found that you'd already fixed it.
> 
> It might be worth mentioning the impact in the commit message: with
> the ring and no bitmap, a logged memslot still gets block mappings, so
> guest writes to most of a block are never logged and a migration can
> copy stale memory. That would also make the case for a Cc: stable.

That makes sense, thanks for the suggestion!

> 
> > Note that memslot_is_logging() also treats a memslot as not logging if
> > KVM_MEM_READONLY is set, hence a memslot with both dirty logging and
> > read only would be seen as not logging for memslot_is_logging(), but
> > logging for kvm_slot_dirty_track_enabled(). This allows a read only
> > mapping of size > PAGE_SIZE to be built when memslot_is_logging() is
> > used, leading to a better read performance compared to
> > kvm_slot_dirty_track_enabled(). However memslots that have both
> > KVM_MEM_LOG_DIRTY_PAGES and KVM_MEM_READONLY set do not really make
> > sense as dirty logging is essentially nop for a read only memslot, so
> > this shouldn't affect real workloads much.
> 
> FWIW, I'd go with Leo's suggestion of keeping the KVM_MEM_READONLY
> check, so those memslots keep their block mappings.

Okay, then I'll not remove memslot_is_logging(), just use
kvm_slot_dirty_track_enabled() within it. This makes it even easier to
rebase & backport.

> 
> [...]
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> [...]
> > @@ -2084,7 +2079,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> >          * and a write fault needs to collapse a block entry into a table.
> >          */
> >         memcache = get_mmu_memcache(s2fd->vcpu);
> > -       if (!perm_fault || (memslot_is_logging(s2fd->memslot) &&
> > +       if (!perm_fault || (kvm_slot_dirty_track_enabled(s2fd->memslot) &&
> >                             kvm_is_write_fault(s2fd->vcpu))) {
> 
> FYI, this no longer applies to kvmarm/fixes or kvmarm/next, where the
> condition now ends in memslot_is_logging() ||
> is_protected_kvm_enabled().

Ack.

> 
> I tested the series on v7.3-rc7 (with that conflict resolved) in QEMU,
> with dirty_log_test changed to back the memslot with THP. In ring-only
> mode it fails on the first iteration without the series and passes
> with it. I'll send the test change later.
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Thanks for the tags!
Wei-Lin Chang

> 
> Cheers,
> /fuad

