Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D619606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JeDYkQf5;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nxCRwjkv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j+I6b8Lw3jEZszd3OEeMvDJs6j/SiiNSbTh5u70J3nY=; b=JeDYkQf55WaHxxbVsS+T3HaGOP
	054QtUoPKL+8YmMOvWJK8xGVgUtp2YfeKo9yAKQVOjqUNvitD/fuls7ybH0g3T4XBaBtwiX2vQLGk
	UJPvCVH7+R37hrKnQSRbrn4Vh0M2qXJq7gQQExvDCgm7bUpb6BpeZivI+SbIcKzIzkDLQKcG6TPds
	6U2oMFi2NO8nPAbW1XAVcns3P3ZwFIfaAVTEKn1EMcqKWt+fG+bddKC/wx3mIcsHeC/HQjCp2AtKC
	rkNvqnOpvXM/uLbOQpqTVpVL1dyhC6erCWjGY6F3aqUlSReA/Yvd43msvJRpjN7eafVJXRpkwYCpI
	ite6buhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2io-0000000AHKU-0tMl;
	Thu, 05 Nov 2026 19:02:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2gu-0000000AG3g-3wtD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 19:00:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A550168F;
	Thu,  5 Nov 2026 10:59:59 -0800 (PST)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90AD83F632;
	Thu,  5 Nov 2026 11:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793905202; bh=JjjUn7pagxMjzSjZizKzJ1kdJvVKVB8LhvENS0UPqF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxCRwjkvMKt7vu7ToFKtKqBljmnoS1rxTk1fIl31Xsk8fvm1QIy4jGuHFjT3q/EoC
	 QrLKZso0mep7/QH33QH2dDhVzdI1DGZmv4CTCt68forDpaeraXnhuFr6LmdUM+CdKj
	 mrSdCICWb7cdM4qoRhmcyKmomUCNET3sE2HYdOek=
Date: Thu, 5 Nov 2026 18:59:55 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: Stop stage-2 teardown scaling with
 the IPA size
Message-ID: <56rrmewwluy2iw52zmusrys3qfqcdhtsgzpqtskr6zt4xhmhfo@hzlwy5ol47kd>
References: <20261104124451.2148724-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104124451.2148724-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_110005_366410_B7FEC076 
X-CRM114-Status: GOOD (  21.25  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 12:44:49PM +0000, Fuad Tabba wrote:
> Hi folks,
> 
> Changes since v1 [1]:
>   - Run all teardown from stage2_destroy_range() (Oliver, Suzuki)
>   - Dropped the Fixes tags (Marc)
>   - Dropped the patch moving the teardown into kvm_vm_s2_ops
>   - Use gfn_to_gpa() for a mapping's address. (Vincent)
> 
> Two patches that make stage-2 teardown take time proportional to what
> is mapped, rather than to the size of the IPA space as it has since
> 4ddfab5436b6.
> 
> Under QEMU TCG ('-cpu max', 16K pages with LPA2), destroying even an
> empty VM takes about 7 seconds in pKVM. Without pKVM it takes about 19
> seconds if the VM requests a 52-bit IPA (crosvm requests the host's
> limit). With the series, both take well under a second. I tested only
> under QEMU, since I don't have hardware with LPA2.
> 
> The first has the page-table walk return where it stopped, so that the
> teardown steps over an invalid entry larger than a block-sized chunk in
> one go. The second has pKVM return where its next mapping starts.
> 
> pKVM gives every VM the host's IPA limit. My series honoring
> KVM_VM_TYPE_ARM_IPA_SIZE in pKVM [2] doesn't change that for crosvm,
> which requests the limit.
> 
> Based on Linux 7.4-rc1 (6628e7d4c6b25).
> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20261103084742.1302597-1-fuad.tabba@linux.dev/
> [2] https://lore.kernel.org/all/20260917091826.2639205-1-fuad.tabba@linux.dev/
> 

I haven't looked very closely, but do functions that use
stage2_apply_range() suffer a similar problem?

If I'm not mistaken we previously realized unmapping a full IPA with
kvm_vm_stage2_unmap_range() is slow partly for the same reason.

I'm not sure whether optimizing stage2_destroy_range() and
stage2_apply_range() together in a single series is preferrable though.

Thanks,
Wei-Lin Chang

> Fuad Tabba (2):
>   KVM: arm64: Resume stage-2 teardown where the walk stopped
>   KVM: arm64: Resume a pKVM stage-2 teardown at the next mapping
> 
>  arch/arm64/include/asm/kvm_pgtable.h |  8 ++++++--
>  arch/arm64/include/asm/kvm_pkvm.h    |  4 ++--
>  arch/arm64/kvm/hyp/pgtable.c         | 15 ++++++++++++---
>  arch/arm64/kvm/mmu.c                 |  4 ++--
>  arch/arm64/kvm/pkvm.c                | 12 +++++++++---
>  5 files changed, 31 insertions(+), 12 deletions(-)
> 
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.47.3
> 

