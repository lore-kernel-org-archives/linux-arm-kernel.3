Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84C8C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zh2LZI/zrQAUIEH0y3gDJ0JqPRe/U+KLpHjKve6H4g8=; b=PU2Okyaq1n+n37e0ZWN+Ym1MEE
	gxdEnFxKmIjWxggZ0lZPuNRQcCCZjt+Zlox1PocPbp6D3QLzYHRljbA3OKNe/bTy7fK/f5kACDWsX
	fbymOrx5WY+xfmVLkDSDAl63livg+UWudGHkSRtdMEKL5hRTt+tr/f7ecjtR53OkMwh7KpYRH/fLu
	g7T6C2ztxZRWksVPZAcDIS+H7CmsbpU5zr2c53dAgUWEFSh39NZ+X1UMXGi6pgyeMd4vVXKPin0Ft
	wduuSmoqJ6bc5Muuj3AjwMG4/WzMnxSB4qER+z/ncT9KbK32AE/KB03GCzafDvDFAnhxhdl9m80Nd
	p8h4TrnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqszh-0000000HDVD-3glB;
	Mon, 03 Aug 2026 13:46:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqszb-0000000HDOa-2BtP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:46:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B87191655;
	Mon,  3 Aug 2026 06:46:05 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF2AB3F66F;
	Mon,  3 Aug 2026 06:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785764769; bh=CzDXgxOuepxzu+QGvZRaCZEmtV4jtA47VV79b/Le9OU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NYqxGDxysx6UdyDzvxP/Xv5joe9UD6endoboLrwwEK1v+Rf39naqjpmrJacfzmPnz
	 MfV/rAtSkaj1j6ke0cqNbWX6msfj067eDNiXuvILizBUH5nLQXeaiO+Xlw4aMbI3v9
	 Jri+KHjpNBec5BJgL5FI76wASDvQfgwBg6BRMqoI=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v16 24/45] KVM: arm64: Expose support for private memory
Date: Mon,  3 Aug 2026 14:43:40 +0100
Message-ID: <20260803134403.80630-25-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134403.80630-1-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_064611_645988_6EB87A03 
X-CRM114-Status: GOOD (  10.95  )
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

Select KVM_GENERIC_MEMORY_ATTRIBUTES and provide the necessary support
functions.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v14:
 * Switch to guest_memfd in-place memory conversion and drop support
   for KVM_VM_MEMORY_ATTRIBUTES.
Changes since v13:
 * Also update documentation to show that KVM_CAP_MEMORY_ATTRIBUTES is
   used on arm64.
Changes since v12:
 * Only define kvm_arch_has_private_mem() when
   CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES is set to avoid build issues
   when KVM is disabled.
Changes since v10:
 * KVM_GENERIC_PRIVATE_MEM replacd with KVM_GENERIC_MEMORY_ATTRIBUTES.
Changes since v9:
 * Drop the #ifdef CONFIG_KVM_PRIVATE_MEM guard from the definition of
   kvm_arch_has_private_mem()
Changes since v2:
 * Switch kvm_arch_has_private_mem() to a macro to avoid overhead of a
   function call.
 * Guard definitions of kvm_arch_{pre,post}_set_memory_attributes() with
   #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES.
 * Early out in kvm_arch_post_set_memory_attributes() if the WARN_ON
   should trigger.
---
 arch/arm64/include/asm/kvm_host.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 15d42d1993bb..146c52f867c0 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1510,6 +1510,8 @@ struct kvm *kvm_arch_alloc_vm(void);
 
 #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
 
+#define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
+
 int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
 bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
 
-- 
2.43.0


