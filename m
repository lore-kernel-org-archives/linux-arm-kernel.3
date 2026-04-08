Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8ED10F9972
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 20:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xT3HNXt0q205SHvVfxbeqCwBMz/Vdt7pmnVCLCDcy+k=; b=qaWZqlHapVBJyhy/xU9RcmwmP3
	PdoO+cav/Bzb6nKpQUAGjNsVAPmgAevZpYUG9+ozT0VoNOp/A5oGvkxCYmNi2Gu3H0Z4zUFYq32Iz
	MFmw0/L0yRBnqjIAMvFrZeV6G70EWr0scvDbtz32j/dKzedZOosyowdDl3UFlwtwSl457Y0a0F/mf
	CTEwwuTmCjJ/JGrjAB7PJ8x2VgwUS0hRWkDbGxXXWPjVbGQqYj9U0WW96PnpyF7EfGnEpoK7blErz
	EKWM5KrYqcmCM1dF6ORaSSEIBMDTog8HDP9cZFbLg/DYWdh2uzJsSMq0YXugIgxV/ilHHDKV10Ktx
	pKVICqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZTV-00000009NuP-03fF;
	Wed, 08 Apr 2026 20:26:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZTU-00000009Nu0-1P6z
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 08 Apr 2026 20:26:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=xT3HNXt0q205SHvVfxbeqCwBMz/Vdt7pmnVCLCDcy+k=; b=EnW7yCGQnOBfrXthwZ22O5s79+
	rKKQibCVwjLY5k66FDxgDxYbpmR/O8hl+z+k9Mp+RsTVXile9JV0/MEW+uopybVNP4jfiVS5f1fkR
	Oxp2Aia1lv+h/sOPHwT8cbKc/4CseX5A2AqM0PNToR1FEgy/p0oZtr98hwfD1fpz+6BiePKuQJBAl
	tfdB11GZKWt4a5hTkRVj8xnzHvViW4L0NLD+dVHg/WNWBtAiJXKSqwM1MdrUTzsYl4vDzpL2LosXo
	dPFkLeIV70Ksp2dJCzqqLR3wlj+Q3wbdDlQu3bOuCJO5UWfyRylLnhJdww1fs7d1Y7WVWQQ0udUm9
	J119SUGA==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZTM-0000000AmLw-2H9h;
	Wed, 08 Apr 2026 20:26:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZTL-00000008oxS-0geV;
	Wed, 08 Apr 2026 21:25:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	Colton Lewis <coltonlewis@google.com>,
	Jing Zhang <jingzhangos@google.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 2/2] KVM: arm64: selftests: Add KVM_CAP_ARM_DISABLE_EXITS UAPI test
Date: Wed,  8 Apr 2026 21:23:48 +0100
Message-ID: <20260408202557.2102476-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260408202557.2102476-1-dwmw2@infradead.org>
References: <20260408202557.2102476-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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

From: David Woodhouse <dwmw@amazon.co.uk>

Test the KVM_CAP_ARM_DISABLE_EXITS capability interface:
 - KVM_CHECK_EXTENSION reports KVM_ARM_DISABLE_EXITS_WFI
 - KVM_ENABLE_CAP succeeds with valid flags (WFI, zero)
 - KVM_ENABLE_CAP fails with EINVAL for unknown flags

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../selftests/kvm/arm64/disable_exits.c       | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/disable_exits.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 878d7cb92555..d8e7ff122445 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -179,6 +179,7 @@ TEST_GEN_PROGS_arm64 += arm64/vgic_irq
 TEST_GEN_PROGS_arm64 += arm64/vgic_lpi_stress
 TEST_GEN_PROGS_arm64 += arm64/vgic_group_iidr
 TEST_GEN_PROGS_arm64 += arm64/vgic_group_v2
+TEST_GEN_PROGS_arm64 += arm64/disable_exits
 TEST_GEN_PROGS_arm64 += arm64/vpmu_counter_access
 TEST_GEN_PROGS_arm64 += arm64/no-vgic-v3
 TEST_GEN_PROGS_arm64 += arm64/idreg-idst
diff --git a/tools/testing/selftests/kvm/arm64/disable_exits.c b/tools/testing/selftests/kvm/arm64/disable_exits.c
new file mode 100644
index 000000000000..27fe6c9297b2
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/disable_exits.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * disable_exits.c - Test KVM_CAP_ARM_DISABLE_EXITS UAPI
+ *
+ * Verify that KVM_CHECK_EXTENSION reports the valid exit disable mask
+ * and that KVM_ENABLE_CAP accepts valid flags and rejects invalid ones.
+ */
+#include "test_util.h"
+#include "kvm_util.h"
+#include "processor.h"
+
+int main(int argc, char *argv[])
+{
+	struct kvm_vm *vm;
+	int r;
+
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_DISABLE_EXITS));
+
+	r = kvm_check_cap(KVM_CAP_ARM_DISABLE_EXITS);
+	TEST_ASSERT(r & KVM_ARM_DISABLE_EXITS_WFI,
+		    "KVM_CHECK_EXTENSION should report WFI: got 0x%x", r);
+	TEST_ASSERT(r & KVM_ARM_DISABLE_EXITS_WFE,
+		    "KVM_CHECK_EXTENSION should report WFE: got 0x%x", r);
+
+	vm = vm_create(1);
+
+	/* Valid: disable WFI trapping */
+	vm_enable_cap(vm, KVM_CAP_ARM_DISABLE_EXITS, KVM_ARM_DISABLE_EXITS_WFI);
+
+	/* Valid: disable WFE trapping */
+	vm_enable_cap(vm, KVM_CAP_ARM_DISABLE_EXITS, KVM_ARM_DISABLE_EXITS_WFE);
+
+	/* Valid: disable both */
+	vm_enable_cap(vm, KVM_CAP_ARM_DISABLE_EXITS,
+		      KVM_ARM_DISABLE_EXITS_WFI | KVM_ARM_DISABLE_EXITS_WFE);
+
+	/* Valid: no exits disabled (no-op) */
+	vm_enable_cap(vm, KVM_CAP_ARM_DISABLE_EXITS, 0);
+
+	/* Invalid: unknown bit set */
+	r = __vm_enable_cap(vm, KVM_CAP_ARM_DISABLE_EXITS, 1ULL << 31);
+	TEST_ASSERT(r == -1 && errno == EINVAL,
+		    "Unknown flags should fail with EINVAL: got %d errno %d",
+		    r, errno);
+
+	kvm_vm_free(vm);
+	return 0;
+}
-- 
2.51.0


