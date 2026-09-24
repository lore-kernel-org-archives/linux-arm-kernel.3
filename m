Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D69DC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9mTX/KhI9tbBf8bi2+uPOVll08OAX8Onn8naecwooY=; b=VBkp9p1tfKKTd02flOAltmswVh
	T5mo1IDMOJg4e/Wpfoz0fe9kBDt6jxrRJje04mtKZEWO78cDupDXNa/8C1GlN4gAR4NeWAZIPpgIN
	bTeNgkpEKCY41LdT9Pp8nlloDbeEzX1FXKUZE9Ab/S8D5F1k3ZN2OvjC9ivbqPt6troWY668LHpYV
	iw1ejCKuf9UNTrA9uNYRZJFjMlegM1dGFnaV5fvFtgp5b5PerNTdleECuZlABlQxMci9o+ujHNlAh
	+VUV33TacyFz5+ZsBuuGwplMrOl/1C10PTRDhAGyUztEIAcIaR1JnVwQtQdZjozJBZCmUcL2ZU4Hb
	nCLaJpVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9s3F-0000000CILW-1tIC;
	Thu, 24 Sep 2026 22:36:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9s3D-0000000CIL3-3Puj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:36:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 07EA344779;
	Thu, 24 Sep 2026 22:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D884F1F0089C;
	Thu, 24 Sep 2026 22:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790289382;
	bh=F9mTX/KhI9tbBf8bi2+uPOVll08OAX8Onn8naecwooY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ckxGT+4FfA/ok8lLJO245QIzG+fkjOC8FIFiLkpuTYry8yOyey/2OBNgoEpCWBunH
	 AIut14glPRKRGX+sQnv0ITTOASutGAhKEQu5xidPQkSXLQJSdTiW1oB71wvPVl4urz
	 KgeYmpnWUOLAj/d3d9wQ5tK2tSEXxjZ498MFro/EOqxoLZ/fDg+vzzH/0bHP14YSH5
	 qyZaBTHdAnX2D8bXQrLmpZHqes0+ynH8H0ZfIE4y0+KzPX+L/vf4OAJiEim5A8vttZ
	 9iKQjkWE7nIqanamz1/3O+72h3+F9yasyVpDzcydRaxuOuG7cP0J5s8jcPtr4/6An3
	 HM+sJQBMzY0lQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x9s3A-0000000DF6D-3C6n;
	Thu, 24 Sep 2026 22:36:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Jack Thomson <jackabt@amazon.com>,
	Jack Thomson <jackabt.amazon@gmail.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Leo Soares Passos <Leo.Bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 00/14] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
Date: Thu, 24 Sep 2026 23:36:15 +0100
Message-ID: <179028933997.3498983.13670468775554214735.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, will@kernel.org, oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, pbonzini@redhat.com, corbet@lwn.net, mark.rutland@arm.com, fuad.tabba@linux.dev, rdunlap@infradead.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, david@kernel.org, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, skhan@linuxfoundation.org, shuah@kernel.org, ljs@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, jackabt@amazon.com, jackabt.amazon@gmail.com, alexandru.elisei@arm.com, vdonnefort@google.com, aneesh.kumar@kernel.org, seanjc@google.com, imbrenda@linux.ibm.com, Leo.Bras@arm.com, weilin.chang@arm.com, linux-s390@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Wed, 23 Sep 2026 16:15:43 +0100, Lorenzo Stoakes (ARM) wrote:
> This series implements the KVM stage 2 page table pre-faulting feature for
> arm64.
> 
> == Foundations ==
> 
> 1. Providing a generic kvm_arch_pre_fault_allowed() hook.
> 
> [...]

Applied to next, thanks!

[01/14] KVM: Allow architectures to disallow pre-fault
        commit: caa63620f9e37a5eec4d0af13534ebd6c0d33f97
[02/14] arm64: Add ESR fault helpers
        commit: eb2eb48c8d72b19a7163cfc9e4b416e60f5b9e2d
[03/14] KVM: arm64: Use ESR helpers in guest abort handling
        commit: 18b94675b1fb22b5ce9b607f9de818d916b3da16
[04/14] KVM: arm64: Propagate and use esr in s2fd when handling guest aborts
        commit: 2b8033a99631b744a67a6fa5df46d0d7b3b9ab7c
[05/14] KVM: arm64: Propagate and use mmu in s2fd when handling guest aborts
        commit: b477bcdfa0342145084948a079b606e058066d80
[06/14] KVM: arm64: Propagate and use kvm_s2_fault_result on S2 fault
        commit: f1fbc7ef12caf0785fdb3ea24193dbd9c425d7b7
[07/14] KVM: arm64: Size the stage-2 memcache from the fault MMU
        commit: d27acc152c62f368d4d4d9d3f0faa891c154e4ce
[08/14] KVM: arm64: Propagate EHWPOISON in kvm_s2_fault_pin_pfn()
        commit: 33f849d808e2329f569bcd8fdbfe5ce22449466f
[09/14] KVM: arm64: Pass walk flags to kvm_pgtable_get_leaf()
        commit: ee26443f3dd70a961ad5e9384d5f41a8675213d1
[10/14] KVM: arm64: Implement KVM_PRE_FAULT_MEMORY
        commit: 34cfa9b3af17d0554ffd6c655fc1097854b49487
[11/14] Documentation: KVM: document arm64 KVM_PRE_FAULT_MEMORY
        commit: 28187f51e4c470c473350905141a8054ec0f1f2d
[12/14] KVM: selftests: Enable pre_fault_memory_test for arm64
        commit: 8ab194f836391fdcb1a8328d5ff0f0c7f0afe557
[13/14] KVM: selftests: Add option for different backing in pre-fault tests
        commit: c4560edbaa81291ee79a97b5e793934cea88500b
[14/14] KVM: selftests: Add nested pre-fault test for arm64
        commit: 6fddb4f6f76910fe0cc2d3d78872b86357899018

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



