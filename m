Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2137CC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2yaNPf9MjV1U306j4EESZzwqOuOGGByB5Oho4YPfls=; b=B2wG5QXA5B2dyA8DTMAc8c6D2R
	WMCsNQRSrAVQ03seRtlLwUQqFtIyPSiwUCEqynEKO89J4DLH+842Pi+kBAfzfOpvTuSRsbjj7+10n
	Y6DHgkaUfqOT4pMP5dSAcZ6sMNAVPwu4KB0R/f01RrfqouKVk2Io79F/a8/Z3im9GnKBxo5UdBawN
	XgdQn8nHg7ANNo5YRidBZdYEjxp5YnmteYuF41RquTDxVjn/wznpWW5RtvRNwFmpPSBWvI3Q6zJ19
	jjCiCMzM7+0MRjO5T68jSJypwC4f5Cegjvl14BFiQqJIu4uQYQh/GnIvRYeLOi6A4+P7wfBKAglYz
	jEylEZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64yz-00000003HVf-2SM0;
	Mon, 14 Sep 2026 11:36:21 +0000
Received: from out-86.mta0.migadu.com ([2001:41d0:1004:224b::56] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64yn-00000003HLT-0uNH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:36:12 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=2tuch6nKrMgq3ucfEYUyfKrn4X670ODoqukWreMj99k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789385766; v=1; x=1789990566;
 b=RnloSrl6ponThZ9yBOV/KxDHLg+/PpcVbSg1G6DCM/itFEES9rKl0DVDq+BBcwBqtnyybJAm
 W+KlhfCF7T3wLfmusYoh9gi1SP46GNlKjnbmkJhGXtEVXJ+zuT2YwMoWKTARysd5jTbBfZkff95
 w6pD4td6x8XY3r7B6IlJEBUM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4aad1262d0248429;
	Mon, 14 Sep 2026 11:36:05 +0000
X-Mizu-Trace-ID: 4aad1262d0248429
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	steven.price@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com
Subject: [PATCH v3 17/18] KVM: arm64: Advertise the capabilities that protected VMs support
Date: Mon, 14 Sep 2026 12:33:37 +0100
Message-Id: <20260914113338.159227-18-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260914113338.159227-1-fuad.tabba@linux.dev>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043609_408396_EC18332F 
X-CRM114-Status: UNSURE (   7.62  )
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

For a protected VM, kvm_pkvm_ext_allowed() returns false on every
capability it doesn't name, so KVM_CHECK_EXTENSION returns 0 for
interfaces the VM implements: it denies KVM_CAP_ONE_REG while
KVM_{GET,SET}_ONE_REG stage the guest's boot state.

Allow the capabilities that work for a protected guest under the
restrictions the preceding patches add, the vGIC and the I/O bus being
host-managed.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_pkvm.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index fbea052fa3e16..a165af0d75689 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -42,6 +42,15 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_VM_IPA_SIZE:
 	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
+	case KVM_CAP_ONE_REG:
+	case KVM_CAP_MP_STATE:
+	case KVM_CAP_VCPU_EVENTS:
+	case KVM_CAP_VCPU_ATTRIBUTES:
+	case KVM_CAP_IMMEDIATE_EXIT:
+	case KVM_CAP_IOEVENTFD:
+	case KVM_CAP_IRQFD_RESAMPLE:
+	case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
+	case KVM_CAP_ARM_INJECT_SERROR_ESR:
 		return true;
 	case KVM_CAP_ARM_MTE:
 		return false;
-- 
2.39.5


