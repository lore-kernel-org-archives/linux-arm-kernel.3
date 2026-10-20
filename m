Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F05606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DB45ENar;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NChkwsKK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hOOdwwvS68qb6hsI+X6Jqe9Kqp84lfpxhjnWTc5H9M=; b=DB45ENarSZSdOlyF67DaW7N4w9
	AGTUv3+4YRappuJ1Ne+fOzuERKFQ0jjszYsElSWr70GL/6b8qnK01bIOPpzNSdQi1dSAoKM6jocf6
	CfZzWg92CVS1fbEwVNw72T+K6Y+Pw4l0oahXbLF2o84bYL0BrwXvfcpF5yRNQazUTfHpGvnObcpNR
	wvqBlq2IztrsB5U8jHzFkKjqADfvER4OkQb7lJrxKhipQu7EyeonPpbWhCudS+gwKuXuYT+3oOOP5
	bYNvXt4BE2p6XskfDjJwzS1QV0LY1G+WPuen8rCyn9ulV0+4X0sEKKXaCFfuMiRGyc7mGmMvJ0OZT
	+jka1oYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9lv-00000009mE4-2d8O;
	Tue, 20 Oct 2026 13:20:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9lu-00000009mDp-2AkP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:20:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1460740C40;
	Tue, 20 Oct 2026 13:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34F41F000C4;
	Tue, 20 Oct 2026 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502454;
	bh=7hOOdwwvS68qb6hsI+X6Jqe9Kqp84lfpxhjnWTc5H9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NChkwsKKEhQs6KtzcgJns22pF4ahdQVZlJeAmMNPOPWfHAEB/j1QoKfgeDihzA7lg
	 zhtkmBeyDaVMsBy7h8xND0Jx2P1zx/LHEJia21IDAiv7qxWjJwIz2dlH78bGQ6Lbjn
	 ixr/ZhWOFYvMEhU//Fq5Ez6/ILtSLApvpFEJM8IkDRCHdsR4G/E1pa2qJwStVBMmOh
	 VDWxUIS0HmWsbayWWYUiqbFuZvpbmaSqBw44jpdwf4roTbaaCp3iyuUEWrcCbs5uKh
	 VR7aTwGqwyZGxNq/zz0Y/csSO5wYNfoOZwIc2EXrSLbKrflh+5gH/QfV1vVHiexhSb
	 i601AlAGcZjwQ==
Date: Tue, 20 Oct 2026 14:20:47 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Steven Price <steven.price@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, David Hildenbrand <david@kernel.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] KVM: arm64: Sanitise MTE tags when a permission
 fault installs a mapping
Message-ID: <atdqkJty3juWpngu@gremlin>
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
 <20261019132103.3836646-4-fuad.tabba@linux.dev>
 <atdXdtXXTH-6DWVt@gremlin>
 <CA+EHjTzH_GA=Vigd_nDXKDFAPCJStcANFFLeLXvsh3UqpjOpCQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzH_GA=Vigd_nDXKDFAPCJStcANFFLeLXvsh3UqpjOpCQ@mail.gmail.com>
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 02:17:00PM +0100, Fuad Tabba wrote:

> > In the else branch? Seems neater and clearer.
>
> Agree, I'll move it there in v2.

Great thanks!

> >         if (is_mte_fault(kvm, s2vi))
> >                 sanitise_mte_tags(kvm, pfn, mapping_size);
>
> I'd rather leave that out: the fix doesn't change that part of the
> condition, and it only appears twice.

Ack, just a nice-to-have that. Not a big deal.

--
Cheers, Lorenzo

