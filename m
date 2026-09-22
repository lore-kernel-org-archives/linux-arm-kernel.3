Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB1FC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 20:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9SqF1U4AYAmpuF1a0G96/WAnPd35ZdOW84UAYiJBR8=; b=rucg+hjUP+eJ1Mc71BpV7yFUDg
	93muWA6hlkvfQ5RqX/VQkxJuJgVjOT45PoW8F7uiyZY71jk0DKdK7aV0ajkQSvXBiVnrUZEcbi23v
	K4PKVpIu9Vnisgv37QETu4eqeq1rnyGEH0ZbmhCSRTYdf2hPbG17gmSumGefvLrOOGmt8NMOsOmVA
	em3HZswKQdrX9xt6NHvW7kABxHqIzQKmv+X9nNP1N3aK4XKXBJMtGPG4gX6eA3oDFs+LgOYmzaikR
	DVPTordkbKji7kNqGsu/6lfnZmduJcsq68HeOUhC3r0Mf4TM/71mlxeD+W9i+PeWxr20g/exSdkYo
	YkbYsEYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x97KJ-00000006Yfx-1U1l;
	Tue, 22 Sep 2026 20:42:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x97KH-00000006Yfd-2jb7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 20:42:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 93D9760142;
	Tue, 22 Sep 2026 20:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB881F0089A;
	Tue, 22 Sep 2026 20:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790109772;
	bh=b9SqF1U4AYAmpuF1a0G96/WAnPd35ZdOW84UAYiJBR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ot50nqYa/vsD+HB2q0FRrRNgPARDAPRd+XUlcKbw2C2Nd8GheCjRiCk83nxmTP249
	 ufuLNrMiPHtEd5o9ypLesJK1Y0+m84SUTp6pnv9gdW5siMF9JpTqBCw97jQTn3wPVg
	 RYrHcnLnIGwkXgGFhs1tqUY3p1yqpHzemp0QTbhPGQGD9fBVk2Fc0xFeZGjkWfEc7X
	 zKzOLUsuVaoKiVJRlg0xCX8kLlgnwBNs9tw4J0YUG4rMQiRX1gQ+/NofpzI5iValLl
	 zPXAL9mERHl+HrEEKrN9FWJBjbLKfQTpjepOrkh0nyr4CPof6O3a+lJIKoKC1qBOeZ
	 /uukaxJgnIjBA==
Date: Tue, 22 Sep 2026 13:42:50 -0700
From: Oliver Upton <oupton@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Jack Thomson <jackabt@amazon.com>,
	Jack Thomson <jackabt.amazon@gmail.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Leo Soares Passos <Leo.Bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 00/14] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
Message-ID: <arLoSiMeCkzPkl9T@kernel.org>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
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

On Tue, Sep 22, 2026 at 03:17:54PM +0100, Lorenzo Stoakes (ARM) wrote:
> ---
> Jack Thomson (3):
>       KVM: arm64: Pass walk flags to kvm_pgtable_get_leaf()
>       KVM: selftests: Enable pre_fault_memory_test for arm64
>       KVM: selftests: Add option for different backing in pre-fault tests
> 
> Lorenzo Stoakes (ARM) (11):
>       KVM: Allow architectures to disallow pre-fault
>       arm64: Add ESR fault helpers
>       KVM: arm64: Use ESR helpers in guest abort handling
>       KVM: arm64: Propagate and use esr in s2fd when handling guest aborts
>       KVM: arm64: Propagate and use mmu in s2fd when handling guest aborts
>       KVM: arm64: Propagate and use kvm_s2_fault_result on S2 fault
>       KVM: arm64: Size the stage-2 memcache from the fault MMU
>       KVM: arm64: Propagate EHWPOISON in kvm_s2_fault_pin_pfn()
>       KVM: arm64: Implement KVM_PRE_FAULT_MEMORY
>       Documentation: KVM: document arm64 KVM_PRE_FAULT_MEMORY
>       KVM: selftests: Add nested pre-fault test for arm64

Besides the usual nitpicking, this series is looking good to me. Thank
you for picking this up Lorenzo!

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

