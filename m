Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD785C44524
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 13:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6Awn3Cip6WinOaXp4OqAmFuhAYE4A4acDGbfEewbog=; b=NHYR6i44DezH5YGvoxqc1PYigs
	ZYuT5NQ5r736HroEJ3fDmp7cDb2taETLRJbg6RLPlyf1IV26vrznUoQVRzYJ54fniGZXv7c/K3W2B
	e3sy/frJpAWrNEDcLMqYWTxOXsa2fOtrERTJjOAoCUsG1r2sn+uO1HPpugHvbN+A2Qpvs2Tc5B7kY
	dJym04O2QvPBIKb8fO6rCVD1rSEg0ZgUanXRVy1ijdEBcCIl1j8VHohZ839JJ2WbaawA1eQqCbjRF
	tutpbdqLWO/pj07oa+wLtHtjUrMGbXP+98oXCMZqZvWdrRhL3MM++Opmf/tnS6Gc5YirbZtJqkhRS
	VuElSp6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiEj-00000002Lne-036H;
	Fri, 17 Jul 2026 13:04:17 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiEg-00000002Lki-0jaf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 13:04:15 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784293451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w6Awn3Cip6WinOaXp4OqAmFuhAYE4A4acDGbfEewbog=;
	b=vTqZQVcvnbqTera6vR3ctDXJn/somZz5PfLLM0khrASOMvrxrDjGa+jgm1rPclTNFJ9VHZ
	W4pJeIuM2LskrdT4zeBAcXZHQUPnlN5eiS2bHHkWZJaBd/S03Nu+a9kOjG2hURa0tnI5vo
	3fnSaxpDtapXRTv/t+dkvxH3HOBBF4I=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Dev Jain <dev.jain@arm.com>,
	Bradley Morgan <include@grrlz.net>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/7] KVM: arm64: Don't advertise eager page splitting under pKVM
Date: Fri, 17 Jul 2026 14:03:16 +0100
Message-Id: <20260717130317.1953574-7-fuad.tabba@linux.dev>
In-Reply-To: <20260717130317.1953574-1-fuad.tabba@linux.dev>
References: <20260717130317.1953574-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_060414_358618_FDA271BF 
X-CRM114-Status: UNSURE (   8.78  )
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

Under pKVM the stage-2 walker resolves to pkvm_pgtable_stage2_split(), a
WARN_ON_ONCE(1) stub, yet KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE is still
enabled and reported for non-protected guests: the capability check keys
on the per-VM protected state while the walker dispatch keys on the
host-global mode. Enabling the cap and then dirty-logging the guest
reaches the stub, splatting a userspace-reachable WARN.

Reject the capability, and stop reporting a chunk size and the
supported block sizes, for every VM once pKVM is enabled, keyed on the
host-global mode like the split dispatch. Gating only protected VMs
would leave the non-protected guests that reach the stub still able to
enable it. Userspace decides whether eager splitting is available from
the block-size bitmap (QEMU falls back to no eager splitting when it
reads 0), so leaving it advertised steers an explicit request into the
enable failure instead of the fallback.

Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_pkvm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 57afb07d6b13..beea00e693a0 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -45,6 +45,9 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 		return true;
 	case KVM_CAP_ARM_MTE:
 		return false;
+	case KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE:
+	case KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES:
+		return false;
 	default:
 		return !kvm || !kvm_vm_is_protected(kvm);
 	}
-- 
2.39.5


