Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D2EC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9CUd5omhd87YPM7u1PnYBkTZPJVmZ4tG2EXOE3TZ/U=; b=TBG9ZP9c1v8Cp5gccq9Zi8rY6v
	3gTSaqMuAZ/y/TEjBi/93399RU7t1/l1znmo6cI3uC8o2czyCSQQIJbbZF5tB/or23lJF8vTU0kdP
	v/4eH8NuBiMpo2/QMZF2d/B9O+r9K3qqcimqBkjA59pZfm5Z+NIFIGICwpuFw7ZUtsab2NGN62upL
	2mJ245+tZJpPK+ksEIjC8DOM4qYxDnB/5HXEs/2XNz4vkAFX1sqlDXqW0U5LjgOsLcE6R+2sAMaTQ
	70rtNajSWeX/xn/uXPHv/iAnuKtP9fS5ZeFe7CTV/Ku6LIFDr9+2SyETyGVGVYU/LVGsIxbkB3f4E
	fCyByx2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91LH-00000005ekQ-0m2o;
	Tue, 22 Sep 2026 14:19:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91LA-00000005eh4-1PLH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:19:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C208D60200;
	Tue, 22 Sep 2026 14:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9191F00893;
	Tue, 22 Sep 2026 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790086763;
	bh=P9CUd5omhd87YPM7u1PnYBkTZPJVmZ4tG2EXOE3TZ/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OeXoPtnfNsZWcpj5V0Gv70rXU5IRkVNox8+WoQETOaGYDhirRHQn1/jU4eNk28jdy
	 V8u8VMEkvA//outI+ZL0m0LlQ+z7IsG/eJSPYGusUVGOrWT4KFGVIjjCyoO+2HUaJd
	 mYMZvGl6Th/xfdkiIxcMgxQO28r/HodY2l7jNq6XxHIEtVqBHGq5B4sIerGY0kifPC
	 MRxepxXevLonmfAtZRRdY2jD8RDVW1bi2CY9geUshN82hK8MPNeQJeXSGWVekD0g2D
	 bvQwu+uJS6HkAAoB0XgsKqM2Le97Xn8DlYj1ubiHK8Qgk3hC2OPN8YIEjQTSHVnbzP
	 jOTR2Yt6/ZY0Q==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 22 Sep 2026 15:18:05 +0100
Subject: [PATCH v3 11/14] Documentation: KVM: document arm64
 KVM_PRE_FAULT_MEMORY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-kvm-arm-prefault-v3-11-787bd3bc7e3f@kernel.org>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
In-Reply-To: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Randy Dunlap <rdunlap@infradead.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
 Jack Thomson <jackabt.amazon@gmail.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Vincent Donnefort <vdonnefort@google.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3399; i=ljs@kernel.org;
 h=from:subject:message-id; bh=cxJF2WPLtBFrXkipzJ9c69Q3Nw2GoUpHKRJk9ftgMbs=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI29Unmva6WElh08Mjfu3fvGafaT0k82Ry3wFbYKUbj4
 MT8uA03OkpZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjCRO28YGRa95tEqe7xExXpv
 hfD7qhstGotDDr5uFY0QqF25904g+wqG//6ejJGlWnNX3HBMLtNLmvuFe3KiQe3j6X/vhPzbf/7
 +DCYA
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
 Documentation/virt/kvm/api.rst | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 1a90598901c5..71b642148b7f 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6489,7 +6489,7 @@ See KVM_SET_USER_MEMORY_REGION2 for additional details.
 ---------------------------
 
 :Capability: KVM_CAP_PRE_FAULT_MEMORY
-:Architectures: none
+:Architectures: x86, s390, arm64
 :Type: vcpu ioctl
 :Parameters: struct kvm_pre_fault_memory (in/out)
 :Returns: 0 if at least one page is processed, < 0 on error
@@ -6497,12 +6497,15 @@ See KVM_SET_USER_MEMORY_REGION2 for additional details.
 Errors:
 
   ========== ===============================================================
+  EAGAIN     A race occurred before progress was made, but a retry may succeed.
   EINVAL     The specified `gpa` and `size` were invalid (e.g. not
              page aligned, causes an overflow, or size is zero), or the VM
              is UCONTROL (s390).
   ENOENT     The specified `gpa` is outside defined memslots.
+  ENOEXEC    The vCPU has not been initialised (arm64).
   EINTR      An unmasked signal is pending and no page was processed.
   EFAULT     The parameter address was invalid.
+  EHWPOISON  A poisoned host page was encountered.
   EOPNOTSUPP Mapping memory for a GPA is unsupported by the
              hypervisor, and/or for the current vCPU state/mode.
   EIO        unexpected error conditions (also causes a WARN)
@@ -6522,7 +6525,17 @@ Errors:
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
+of a nested guest. Pre-faulting only populates canonical stage-2 page
+tables.
+
+The feature is not supported on arm64 if the protected KVM (pKVM) feature
+is enabled.
 
 In the case of confidential VM types where there is an initial set up of
 private guest memory before the guest is 'finalized'/measured, this ioctl
@@ -6537,7 +6550,7 @@ When the ioctl returns, the input values are updated to point to the
 remaining range.  If `size` > 0 on return, the caller can just issue
 the ioctl again with the same `struct kvm_map_memory` argument.
 
-Shadow page tables cannot support this ioctl because they
+On x86, shadow page tables cannot support this ioctl because they
 are indexed by virtual address or nested guest physical address.
 Calling this ioctl when the guest is using shadow page tables (for
 example because it is running a nested guest with nested page tables)

-- 
2.55.0


