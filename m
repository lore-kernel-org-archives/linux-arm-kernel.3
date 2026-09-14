Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59ECCC88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Np9lRZngEX1/cke4zpiBmcslPtIquzm48zu2HawlS80=; b=rq8mWYVBs6W9u6h6k4Ne7zMii0
	IvyN7Me+nVlSFWP4STd5VBc1Ks4CUZENv1kNv1UfNbutQgVZKM8cfz7ItSQ1RW3aviLRP2EmV1I5Q
	XEbpjYY3atGcOxIuE1PKTXadPwT/Ji0KgNr7nx6n7yQ26hwsDAlYikybA/ZDsJXfJn7SdEMKm8KoC
	9Q9mxio60j2jHT0ATETLisDcAiu7XrvsiqQIuS6g4EotEQs9QvWmtSTzlOpFmmoBnycVT2gWhbj8A
	teJ541XBsL2tYCOAwp2U4PgtryTSUdYn6MAGa9TPsr1PnNhQaaddiojUvpWcofRpiZV0AqxP5WbaG
	qIe5uXKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65ma-00000003Xzu-0rBM;
	Mon, 14 Sep 2026 12:27:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65mZ-00000003Xz5-1wJS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:27:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38568411F1;
	Mon, 14 Sep 2026 12:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54421F000FF;
	Mon, 14 Sep 2026 12:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789388855;
	bh=Np9lRZngEX1/cke4zpiBmcslPtIquzm48zu2HawlS80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WEy2l5FkUgCswDMSJ1YTwDmZD1nzQj7T1h5LAqs0+0gjfsmxdZgWDlcZXd1eOsz3W
	 b55osXjinmIkuFGUC4BWtsDxBsJ9JTmvJ7LtvCH4i78rCU2v5kjlcfV+7+fibIwQJx
	 i21rjI7H4st+KYcuyQCpNHQq45V62Nm2nhD0ShUa3iWGS4DtmlJMsNIj3woCUQ6rTr
	 dhmn5EUbPGI3RzxLe6hoxnZwyTQP1k2hPsU9/+WL3+WPN92HcFDoF9nhCIZcurMpt3
	 D1I0ejavTAAkK2XAAMgyyzwxPQtimgr4/a4nX/TlEMBeIbN5XLqoN/GgTWd9M7w3hL
	 g3iMSt8ZSTzxw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Mon, 14 Sep 2026 13:26:21 +0100
Subject: [PATCH v2 10/13] Documentation: KVM: document arm64
 KVM_PRE_FAULT_MEMORY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-kvm-arm-prefault-v2-10-26fb47f74b73@kernel.org>
References: <20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org>
In-Reply-To: <20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
 Jack Thomson <jackabt.amazon@gmail.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Vincent Donnefort <vdonnefort@google.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Leo Soares Passos <Leo.Bras@arm.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3340; i=ljs@kernel.org;
 h=from:subject:message-id; bh=UMAm/iY38JK7kwFijNKO0oMBtghoFRe1xQSMWNQVt1w=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKWP/+2f+vjjNV9sZXahZfKRL90stYV7L/zKk9aViRPf
 6ro5knrOkpZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjCRs/8Z/qd1Lbk3x1Tm8nPL
 gi/JC058c5X0/mO1kX/nrsDmys0pd5kY/kqEd+hem1Zy2DrJmKe+8Cf/nf23VW5tYZacHHAxvWZ
 eGzMA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

Update the KVM API documentation to reflect the fact that arm64 now
supports this functionality.

Also document error values and arm64-specific behaviour.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 Documentation/virt/kvm/api.rst | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 4988c32df4bf..fb7f8baca970 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6485,7 +6485,7 @@ See KVM_SET_USER_MEMORY_REGION2 for additional details.
 ---------------------------
 
 :Capability: KVM_CAP_PRE_FAULT_MEMORY
-:Architectures: none
+:Architectures: x86, s390, arm64
 :Type: vcpu ioctl
 :Parameters: struct kvm_pre_fault_memory (in/out)
 :Returns: 0 if at least one page is processed, < 0 on error
@@ -6493,12 +6493,14 @@ See KVM_SET_USER_MEMORY_REGION2 for additional details.
 Errors:
 
   ========== ===============================================================
+  EAGAIN     A race occurred before progress was made, but a retry may succeed.
   EINVAL     The specified `gpa` and `size` were invalid (e.g. not
              page aligned, causes an overflow, or size is zero), or the VM
              is UCONTROL (s390).
   ENOENT     The specified `gpa` is outside defined memslots.
   EINTR      An unmasked signal is pending and no page was processed.
   EFAULT     The parameter address was invalid.
+  EHWPOISON  A poisoned host page was encountered.
   EOPNOTSUPP Mapping memory for a GPA is unsupported by the
              hypervisor, and/or for the current vCPU state/mode.
   EIO        unexpected error conditions (also causes a WARN)
@@ -6518,7 +6520,17 @@ Errors:
 KVM_PRE_FAULT_MEMORY populates KVM's stage-2 page tables used to map memory
 for the current vCPU state.  KVM maps memory as if the vCPU generated a
 stage-2 read page fault, e.g. faults in memory as needed, but doesn't break
-CoW.  On x86, KVM does not mark any newly created stage-2 PTE as Accessed.
+CoW.  On arm64, KVM marks newly created stage-2 PTEs as Accessed, as it
+does for any stage-2 fault, but leaves the Accessed state of existing PTEs
+unchanged.  On x86, KVM does not mark any newly created stage-2 PTE as
+Accessed, and for s390 it is not applicable.
+
+On arm64, a GPA is interpreted as an IPA, and never interpreted as the IPA
+of a nested guest. Pre-faulting only populates canonical stage 2 page
+tables.
+
+The feature is not supported on arm64 if the protected KVM (pKVM) feature
+is enabled.
 
 In the case of confidential VM types where there is an initial set up of
 private guest memory before the guest is 'finalized'/measured, this ioctl
@@ -6533,7 +6545,7 @@ When the ioctl returns, the input values are updated to point to the
 remaining range.  If `size` > 0 on return, the caller can just issue
 the ioctl again with the same `struct kvm_map_memory` argument.
 
-Shadow page tables cannot support this ioctl because they
+On x86, shadow page tables cannot support this ioctl because they
 are indexed by virtual address or nested guest physical address.
 Calling this ioctl when the guest is using shadow page tables (for
 example because it is running a nested guest with nested page tables)

-- 
2.55.0


