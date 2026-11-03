Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57554606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D4n8hQsC;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EH1UgyGW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q/ltEAc+N+3ENVziqnPe9OWDAKNpP/rCTARs1hVfB1Y=; b=D4n8hQsC9zaateg9IUytZ7N9Ea
	IYNF98l5kbLM3++q8E8zZYsU7gNwscTXsmWPuXRWfJT9osqztvajNvsmnOcvR5FP6ilfDS7L/+yLB
	wE29ATy7wt6H1qB6d8iRP12PP64tCN7xYtkO7BqzWV5Qtf5xw5AHO9cP5PcolshmWKcgpZG8iE2Hu
	yDWS+JOr1/BCp/ndQ8h5zTJhn29nexdC4VqZF/6Lbxw1iT+wn/xAjnHOvCCNKUfJDtwO29otjzK82
	JuE5D7cEFGpcJ8osCfZeDbDHtoR0LylY3rVqoCcLVZ5Vsxz3mwvBC8xrOe67slYnvVtXGtdjdwGzQ
	kVt1dbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHfa-00000003CtQ-3l0I;
	Tue, 03 Nov 2026 16:47:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHfZ-00000003Ct9-3Nty
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:47:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02E5D60136;
	Tue,  3 Nov 2026 16:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769DE1F00919;
	Tue,  3 Nov 2026 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793724452;
	bh=Q/ltEAc+N+3ENVziqnPe9OWDAKNpP/rCTARs1hVfB1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EH1UgyGWR3BQgaGa2fY0FrvPhw0YrCxuvKsWxRS4qOVEE4xwX1BtTABDzgitcwH+F
	 d5TpvMRv/iEnKwkiN8ZLZmfJYjxsGa1608mwytH5s/dLdvYGanDtHoo3M1ED4+/VhZ
	 SJHH4ERCS/OlaC7IIpraTBgPsU8zulVrWGbln8CXqudG5U0b+dhq2SfVagd4AX7Rg1
	 AAqTWlmMKLtqFfq7aaogICoZSaDCZrpGieBzKIwhQpcSsC9mSnJlZhGhEYPmBc4gl0
	 OHTJs4XktOIdB128KA3U5V0c/ueV//1psyTDDiWxzrSjVBNkBgBSYSAnJMTdwSUSgM
	 /M/3kNXS6w+Qg==
Date: Tue, 3 Nov 2026 08:47:31 -0800
From: Oliver Upton <oupton@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Don't walk the whole IPA space when
 destroying a pKVM stage-2
Message-ID: <auoQIzfM8tF4F98q@kernel.org>
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-2-fuad.tabba@linux.dev>
 <auoN4h8iloqPuepc@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auoN4h8iloqPuepc@google.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 04:37:54PM +0000, Vincent Donnefort wrote:
> > @@ -513,10 +514,18 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
> >  		kvm->arch.pkvm.is_dying = true;
> >  	}
> >  
> > -	if (kvm_vm_is_protected(kvm))
> > -		__pkvm_pgtable_stage2_reclaim(pgt, addr, addr + size);
> > -	else
> > -		__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
> > +	/* Called once for the whole IPA space, so reschedule between mappings */
> > +	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
> > +		u64 start = __pkvm_mapping_start(mapping);
> > +		u64 end = __pkvm_mapping_end(mapping) + 1;
> > +
> > +		if (kvm_vm_is_protected(kvm))
> > +			__pkvm_pgtable_stage2_reclaim(pgt, start, end);
> > +		else
> > +			__pkvm_pgtable_stage2_unshare(pgt, start, end);
> > +
> > +		cond_resched();
> > +	}
> >  }
> 
> Just thought that it is a bit weird that pkvm_pgtable_stage2_destroy_range()
> does cond_resched() while kvm_pgtable_stage2_destroy_range() does not.
> 
> How about instead kvm_stage2_destroy() refines start/end with some accessors
> calling in pkvm.c pkvm_mapping_iter_first() / pkvm_mapping_iter_last()?

Yeah, I'd rather we tackle this as a general problem than doing some
pKVM specific hacks.

Seems to me that we do a lot of wasted work even in the non-pKVM case
where the outer loop will continue to iterate KVM_PGTABLE_MIN_BLOCK_LEVEL
worth of IPA even if the underlying table is empty.

What we'd want is for the kvm_pgtable_stage2_destroy_range()
implementation to report back how much of the IPA space it actually
iterated over. We wouldn't want to keep re-visiting the same invalid PGD
entry only because it's larger than our max block size.

Thanks,
Oliver

