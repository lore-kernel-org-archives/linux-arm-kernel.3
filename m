Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D41606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zPgNaZIW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n5NEqPng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XniwFWmdWJJxTKlBX3jUY4ryliNwdMdnocDo12kQRnA=; b=zPgNaZIWdrtnMzwGEqQsJnJvNr
	f9EWrPOL6Pd9KDrpau9n5F+17XyRqfQDvTa0WrkglYEt0F4fJmiDo7e26kQs4r01H/eFiYE3qecQp
	M240VAKwikEm9rKYaQt1SUuRpxYt3e1PVEoVK7Vmz8fKy4KMk2FIji88VZgocBv0d8dG1Zl9hL3YN
	hVPqSO12fcn926aFcKQnKvhZNwh7QyvTnREnUX1nWfpu+/92II4tmTCZhkq4NSuyouHeHmnDYDVt1
	DcFxPQS1KFB7NDfeNvmdeahBgvFuT3q/XWdJhb4s9PBNOZQrnKvQBWf6C7gRvqAk3DkQJMHgHqVy2
	PPvXPJ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHum-00000003G2o-3C2K;
	Tue, 03 Nov 2026 17:03:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHul-00000003G2O-34RH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:03:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 277694368C;
	Tue,  3 Nov 2026 17:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D354A1F000C1;
	Tue,  3 Nov 2026 17:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793725395;
	bh=XniwFWmdWJJxTKlBX3jUY4ryliNwdMdnocDo12kQRnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n5NEqPng3ViSCzXGdS1xqMMiuW9nsrOJq+jQasw2mK1EPAC+gI42YyFFbJFiWm6V7
	 DgBZ+c1W/VFRIzCeaqA4gYXHf7Og6X6+kuzd9UTGwVXY6hJfadCJec5LnpnO5ANZuO
	 yCxTUBy9I7NoufAXyvjWWjOTXw6Cql6g9B6SV9BTuWa5twkN2kCUSDYop54lrvpvaA
	 0cgZVwOUklAlNjQkjzRAfWnKfLtPaJsJPSzqM7feSHWl78prGoYPgFUUDSnZa7gBVE
	 VMRcGI/OW4vZbCEPaIgaOPOn8u9hL7DrLbL+gmL9zhVECMxg/BEQYFaBIcLwU3OF45
	 rnlnyXGEzftHA==
Date: Tue, 3 Nov 2026 09:03:13 -0800
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 0/3] KVM: arm64: Stop stage-2 teardown scaling with the
 IPA size
Message-ID: <auoT0b1LxuDlZOnc@kernel.org>
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103084742.1302597-1-fuad.tabba@linux.dev>
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

Hi Fuad,

On Tue, Nov 03, 2026 at 08:47:39AM +0000, Fuad Tabba wrote:
> Hi folks,
> 
> Two fixes for stage-2 teardown, which since 4ddfab5436b6 takes time
> proportional to the size of the IPA space rather than to what is mapped.
> 
> Under QEMU TCG ('-cpu max', 16K pages with LPA2), destroying even an
> empty VM takes about 7 seconds in pKVM. Without pKVM it takes about 19
> seconds if the VM requests a 52-bit IPA (crosvm requests the host's
> limit). I would expect it to scale the same way in hardware. I tested
> only under QEMU, since I don't have hardware with LPA2.
> 
> pKVM gives every VM the host's IPA limit. The first makes it release the
> VM's mappings from its tree instead of walking that space. My series
> honoring KVM_VM_TYPE_ARM_IPA_SIZE in pKVM [1] (respinning it soon)
> doesn't replace the fix, as crosvm requests the limit there too.
> 
> The second makes the non-pKVM teardown step over an empty entry larger
> than the largest block in one go, rather than start a new walk for each
> block-sized chunk of it. It depends on the first, as the lookup it adds
> reads fields that hold the mapping tree on a pKVM stage-2.
> 
> The third moves the pKVM/non-pKVM split in the teardown into
> kvm_vm_s2_ops, with no functional change. The first two apply back to
> 7.1, except that a backport of the second drops the flags argument 7.4
> added to kvm_pgtable_get_leaf().

I don't see why optimized destroy walks for CCA and pKVM is
fundamentally incompatible with driving them from a loop that
reschedules. Non-preemptible kernels are still very much a thing, I'd
rather not undo the fix we took for that exact use case.

So unless I'm missing something completely obvious, I'd rather that CCA
and pKVM do teardowns from that loop.

Thanks,
Oliver

