Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839A7606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hXMd9SH+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nAarvwLp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y06JvPs8K+3h5iGkCmJ6Hn2gbcqjc1hia4SrPtzPFhY=; b=hXMd9SH+7kfx1t+ROFgZay5y5K
	JaH0EIYF1kkZD6ZcEiZUEwpIp2C4qhHDCA0hk/1mgg6mDLYH7jGB8CPH09nEbTyOpp3d0YzUFQsMc
	Apc/eXieWNLahDq0jg6jY/km0Yjn6TDDtlZIA5uV/xeyumH3GnTFJG5P7Ua6Dfw/buJv2Y1wiX/Ci
	0Uuilik++rapsdPMSPqOfjCyadYIGRa2Gcw4m7mbYZKbCx9VvmzJIeekHzgKDSYG7UelR7jp2jjXi
	AKQ1sNoLXg0iwIXaWyt/tUuv9hQRt+1URvvMqOBFNrMRkD8T152+VzAcU1SrhORnBpgb9JkcUafOF
	Eo1sbKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy2X-00000000CuX-1Fly;
	Mon, 02 Nov 2026 19:49:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy2V-00000000Cu0-3A5B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:49:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2370E6021A;
	Mon,  2 Nov 2026 19:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5C51F00A16;
	Mon,  2 Nov 2026 19:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648994;
	bh=y06JvPs8K+3h5iGkCmJ6Hn2gbcqjc1hia4SrPtzPFhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nAarvwLpYqOyKZJYyxaqtSICy5gsKVolKpwF6Y0yB5CsJo9Xi2bSPJTkaTXcxlEy3
	 36xfnr73lYyD41sdeHrN43xEQJtgt492KonUTFj22H+pbTJkvyzxfrFWtzRO1c09kS
	 PVEdredJwhGNq0GeXJVGRqr1Y1f1YuPApkKcF1A+KS7seW5No3bSaWm6mfCLQN7x9Z
	 vNV68TpU/ijsN+dc2MpUXNke39HcNbU8xllJFOHETrvaXUU11a7IteeUxMaclewCst
	 LQtUHU50v4RadXAfOCdrLXKWll2Dw+8Ywu6CK3JJXLLHlEdBeFL0Td2MfRy3EI9V0h
	 j7OlkeJym2/zQ==
Date: Mon, 2 Nov 2026 19:49:49 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Ard Biesheuvel <ardb+git@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Don't livelock when AT can't resolve a fault
 IPA
Message-ID: <aujpXU0ZAb8yCO3G@willie-the-truck>
References: <20261102094748.2638468-2-ardb+git@google.com>
 <auiXMN5td-2QlDkd@willie-the-truck>
 <CA+EHjTxVPyY70Dm+BiwgQQNwx1cJpEKvJBJGZWPCKLx2M8X2FA@mail.gmail.com>
 <86bj872n1b.wl-maz@kernel.org>
 <08db10ef-c3d8-44b8-9d80-e7505400bf12@app.fastmail.com>
 <86a4nr2i0k.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86a4nr2i0k.wl-maz@kernel.org>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 06:41:15PM +0000, Marc Zyngier wrote:
> On Mon, 02 Nov 2026 18:23:09 +0000,
> "Ard Biesheuvel" <ardb@kernel.org> wrote:
> > My experiments seem to indicate that on this uarch, the AT instruction
> > does not hit in the TLB, and so it can fail on AF==0 for an IPA that
> > is covered by a S2-only TLB entry (with AF==1 and XN==1 due to lazy exec).
> > 
> > So after the VAAE1, the S1 walk happily produces the same translation
> > we just invalidated, without taking a S1PTW fault, and the guest faults
> > again on the I-fetch that took us to hyp the first time around.
> 
> Ah, I think I see what can happen, even without split TLBs.
> 
> If you have a S2 walk cache that skips the descriptor where AF=0, then
> the TLB refill just succeeds, and the cycle repeats. OK, I'm now
> convinced we need S2 invalidation as well even in the VA->PA case. We
> needed it for NV anyway, but hey...
> 
> Hopefully this doesn't happen too often.

Ard's observation in the commit message that kvm_mmu_notifier_clear_young()
doesn't do any TLB invalidation is also an interesting aspect to this, I
think. In that case, I don't think you need a particularly imaginative
TLB implementation: you just have AT always walking the S1 page-tables
in memory and seeing AF=0 at stage-2 when accessing a page-table page
whereas the MMU itself always hits in its (S2) TLB when doing the S1 walk.

For stage-1, we don't elide the TLBI quite like that -- instead, we elide
the trailing DSB (see __ptep_clear_flush_young() and the comment there).

Will

