Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9770FC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8awU+4wV+C2mB9+O3Epm/xXCd//Sm6J8UaCO33agAk=; b=kJp6K3/zSVhqeyjPF9/QvI/k59
	/BwYyy+CZbMfBssoEYFF+eTUyqGbcIOW5QGiXOksxHuSFwzVXbtPsIhbtpjZrb5rDs7HPvvp5gSq2
	e2kgZTgSe+ze0XhEaU0a2lIzYA8pNyPar5/DlLco8MHxRBmwSatdOH3HLHzqmvAZPOr5h+MMjnjze
	DSX/MIdAP6XyXHVvwyMAQ1v3vjMs6b32riHR0dJ2IrLxvSsaciruT5Lr9Gtg3RTtXAsHbbAw5dyHU
	LJ3oZDthaXDmxcbt4/qGOXVNReDzzKSGdIvJbJYi4hfcxXi/cGVAmJ9bGZLZkqFa2NJvlx2mVVf7k
	MTvGK1Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ybU-00000009dNz-0T1u;
	Tue, 08 Sep 2026 16:23:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ybO-00000009dIn-1RVV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:23:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6C791476;
	Tue,  8 Sep 2026 09:23:13 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 526EB3F7B4;
	Tue,  8 Sep 2026 09:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788884597; bh=CgnhUkjRCuK5Hn3XRTDM/Af/LZ4kv2s2gn1J+cXjimM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vfFLvsGBSaN2oezQYfkot3Y+FXdmwUIVuwYRthDibzcWmcx2Frlxv4hVZczohPmB/
	 y4mjeTNNINippo3RnXpp+1FIM87EkCd6qbR8ywk2NgCHN7lLREQf5b2ji+VIf666KR
	 9V0EM0n9MnrdzvudZDiIvBAezfm9jn1NPqQ+uDmY=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v17 08/20] KVM: arm64: coco:  Add a helper to check if a VM is confidential compute guest
Date: Tue,  8 Sep 2026 17:22:11 +0100
Message-ID: <20260908162223.1683432-9-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908162223.1683432-1-suzuki.poulose@arm.com>
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_092319_877252_AFEEEDEE 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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

Both protected VMs and Realms are additionally secured by the trusted hypervisor
guarantees. Add a helper to detect if a given VM is a coco guest. Base this off
the ordering of the VM flavor type.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/kvm_host.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 824a3383409c8..020aef5a1b698 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -316,6 +316,7 @@ enum kvm_arm_vm_flavor {
 	VM_NVHE,
 	VM_VHE,
 	VM_PKVM,		/* Normal guests on PKVM */
+	MARKER(__VM_CONFIDENTIAL),
 	VM_PROTECTED_PKVM,	/* Protected VM */
 	VM_REALM,		/* CCA */
 	VM_FLAVOR_MAX,
@@ -1524,9 +1525,11 @@ struct kvm *kvm_arch_alloc_vm(void);
 
 #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
 
+#define kvm_vm_is_confidential(kvm)	((kvm)->arch.vm_flavor >= __VM_CONFIDENTIAL)
 #define kvm_vm_is_protected(kvm)	((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
 #define kvm_vm_is_realm(kvm)		((kvm)->arch.vm_flavor == VM_REALM)
 
+#define vcpu_is_confidential(vcpu)	kvm_vm_is_confidential((vcpu)->kvm)
 #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
 #define vcpu_is_rec(vcpu)		kvm_vm_is_realm((vcpu)->kvm)
 
-- 
2.43.0


