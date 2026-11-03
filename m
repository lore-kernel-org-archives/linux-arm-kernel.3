Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D6D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KkRTuxJS;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FgrZ2i1+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l2PUnbLRvVKCeeWmqzWIWxHl8MNmgKSAW2Fw91nyKLI=; b=KkRTuxJSroEZTbVPaQs5jG9y/V
	Ju9zgYWeRiOk77Qc1/LEb1NotK5HvxDrKDGXjeFjCFfXv3pBqDvzewL9Sidfm6fCcqRrQaadxCmgW
	0KyQ6ynq5y5DL6XdTcZfSzcrmwMFwjZLjzaLAc3KB8B37OImjtuvB7i6/KIgv2EyKd2TQYocwz/F0
	dXX08stvmlyCuWG+a/tm/F2IYbbKAYr4e4MmqvhZkQbdda+XU6+42uDlRCUYq3hLIkyi+FE0OEvq7
	ewrdPkDUvGSNRVrArzMxCeTQcM8B3wO5jMyLsJxBxUbKauR8tud65DyZ5/ECMKDhl4cGO92PPTHJL
	3iJVCZ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHgI-00000003D3t-15lc;
	Tue, 03 Nov 2026 16:48:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHgG-00000003D37-3Wfk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:48:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 23DB742479;
	Tue,  3 Nov 2026 16:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E1E1F000C1;
	Tue,  3 Nov 2026 16:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793724496;
	bh=l2PUnbLRvVKCeeWmqzWIWxHl8MNmgKSAW2Fw91nyKLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FgrZ2i1+J+WK+vodFp2ovSXNFdwdlFJaTFd8IMGA6W1WY6waPIpnLf7ufNTEC5hqU
	 pRIK76PgnaLTk/aitEW7yHQbPu9xAsxKKt1mmN2CqhGoYmSRMaDMJLdfPZxr2bHhvT
	 rlJ2EEhaF4PoByjkBunCVYXLEDlM0L8aevI9cpzk6l+8kgW9C4zcpxOkx7fyEfmEuO
	 0mQSjVoo40D+Z/pFif/QqQJ+FUiKOrX0rdH65WhkSvsA0ejBMe+ne7xTQxbp+GZxyB
	 hz9erxg30S1taUiUvNlfgJ3+4CN7VXZNhCRrYsDFYf+vE7OrGnE6YJlHVSZhf6rfo5
	 su0cUG62lpQDg==
Date: Tue, 3 Nov 2026 08:48:14 -0800
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
Message-ID: <auoQTpm_UJWs4RK1@kernel.org>
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-2-fuad.tabba@linux.dev>
 <auoN4h8iloqPuepc@google.com>
 <auoQIzfM8tF4F98q@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auoQIzfM8tF4F98q@kernel.org>
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

On Tue, Nov 03, 2026 at 08:47:31AM -0800, Oliver Upton wrote:
> On Tue, Nov 03, 2026 at 04:37:54PM +0000, Vincent Donnefort wrote:
> > > @@ -513,10 +514,18 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
> > >  		kvm->arch.pkvm.is_dying = true;
> > >  	}
> > >  
> > > -	if (kvm_vm_is_protected(kvm))
> > > -		__pkvm_pgtable_stage2_reclaim(pgt, addr, addr + size);
> > > -	else
> > > -		__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
> > > +	/* Called once for the whole IPA space, so reschedule between mappings */
> > > +	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
> > > +		u64 start = __pkvm_mapping_start(mapping);
> > > +		u64 end = __pkvm_mapping_end(mapping) + 1;
> > > +
> > > +		if (kvm_vm_is_protected(kvm))
> > > +			__pkvm_pgtable_stage2_reclaim(pgt, start, end);
> > > +		else
> > > +			__pkvm_pgtable_stage2_unshare(pgt, start, end);
> > > +
> > > +		cond_resched();
> > > +	}
> > >  }
> > 
> > Just thought that it is a bit weird that pkvm_pgtable_stage2_destroy_range()
> > does cond_resched() while kvm_pgtable_stage2_destroy_range() does not.
> > 
> > How about instead kvm_stage2_destroy() refines start/end with some accessors
> > calling in pkvm.c pkvm_mapping_iter_first() / pkvm_mapping_iter_last()?
> 
> Yeah, I'd rather we tackle this as a general problem than doing some
> pKVM specific hacks.
> 
> Seems to me that we do a lot of wasted work even in the non-pKVM case
> where the outer loop will continue to iterate KVM_PGTABLE_MIN_BLOCK_LEVEL
> worth of IPA even if the underlying table is empty.
> 
> What we'd want is for the kvm_pgtable_stage2_destroy_range()
> implementation to report back how much of the IPA space it actually
> iterated over. We wouldn't want to keep re-visiting the same invalid PGD
> entry only because it's larger than our max block size.

Next patch heh :)

