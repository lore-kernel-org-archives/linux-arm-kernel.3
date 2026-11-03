Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF0F606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O8DAqDy9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SM9garVI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Uy62sZIrZ53EycNsa0F+QfAVrofv8khe85aXX4gapkQ=; b=O8DAqDy9pr4GMFKcxwvGjL4dLd
	uj70wCFWf9oNkxe6Tf9aFv7IW7kNaVultmhrt8GfviZ8mqcLA/54UnD8PNVH9t+DI4CEMB00qZ5+l
	T7tGYr+UFjej7aPmXoPpX/QR6J+3SvXlA50hAz0lMVKAg5uB5en9XOUU8RzvSY4i+TMQgLXxgjQea
	r6DTAYtJp2Uv4qXmojUJ2wtLuARniJDs9LYI6Hhcm8UMtHz74D60lhYVFuoxZiFRZOc0lLteSonbb
	hr6shtrD8wckbA9Z+CHURrkx6jAL+wDXiv09b3LLL9Fz9pzdD0fvX1a3pFjFdjKcteXKBKGGYF9Qz
	LAsD33zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHnH-00000003EUV-0h57;
	Tue, 03 Nov 2026 16:55:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHnG-00000003EUE-12Ms
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:55:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D22DB43BB5;
	Tue,  3 Nov 2026 16:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A09A1F000C1;
	Tue,  3 Nov 2026 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793724929;
	bh=Uy62sZIrZ53EycNsa0F+QfAVrofv8khe85aXX4gapkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SM9garVI8Du06Zk5PGVus1j5YVh2s2lwl1obZ9eq1O+qxLFFBxvPUJLfTVauKfTU1
	 Ny2uh64m1SVz5j5rudVJfoL9oD8ZZoE1GlSX9+s0NFuPm5mEzNQgn83hcR2IPRvz+h
	 sXpQ6LuRfkuxBJRkcbksscajhHaoE3TwwX62zBJkoAIicoXwLUGBH95pp7hyYDaIa+
	 tjpJYoLtaMV1DUZ6BmsJrIVIG0M5b0V/A31CWm1eI6UmF+nkckH8tnGVJ7CLIkjs64
	 sdqnYEsPzigid3i/OCibJSW7+WGHgtntzLWlEll9d6SmJN71Fb54k3VpWqiyqEnhUg
	 O8CAbTv+8YKNw==
Date: Tue, 3 Nov 2026 08:55:28 -0800
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>
Subject: Re: [PATCH 2/3] KVM: arm64: Skip empty IPA ranges when destroying
 stage-2 page-tables
Message-ID: <auoSAH996QxqrqI1@kernel.org>
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-3-fuad.tabba@linux.dev>
 <9841ba98-7f07-4d5d-8397-a07e22ba7f51@arm.com>
 <CA+EHjTxWA2o7RkZw_17QMfYjXYN2dW-X6Rmj95YN1iYBvBzrCg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxWA2o7RkZw_17QMfYjXYN2dW-X6Rmj95YN1iYBvBzrCg@mail.gmail.com>
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

On Tue, Nov 03, 2026 at 04:19:38PM +0000, Fuad Tabba wrote:
> > > @@ -1010,9 +1010,20 @@ static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
> [...]
> > >                   next = stage2_range_addr_end(addr, end);
> > > -                KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr,
> > > -                                                             next - addr);
> > > +                kvm_pgtable_stage2_destroy_range(pgt, addr, next - addr);
> >
> > minor nit: Given the kvm_pgtable_stage2_destroy_range() is the only
> > called from here, and this caller would benefit from the walk
> > information, would it make sense to return a hint back ? Not sure how
> > much of that is possible. We do this in the RMM, always return a hint
> > of the next possible address. Of course this is not that expensive
> > as the CCA case and could be dealt in a separate series.
> 
> kvm_pgtable_stage2_destroy_range() is also called by
> kvm_pgtable_stage2_destroy(), which EL2 uses to free a pKVM guest's
> stage-2, so I'd rather not change it in a fix.

This one is still an optimization, not a fix. The re-walk after destroy
is a bit fiddly, especially when the inner walk knows exactly what IPA
it stopped at.

Thanks,
Oliver

