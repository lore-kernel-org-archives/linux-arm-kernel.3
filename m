Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0DCC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGxtQUKlmrtmSlpVIOuOpCZoju6luge5XNefwhjY828=; b=fRX2c17QKUbVO05QezqOmnZTpg
	JsB05kLGh/DkvsjZ4uGH/inwXxUU/iIpm3phmiAfsUBtTSj9Mtd8KQgN9SRWUDg8Ro3XXz/aR9/pv
	KHLY07BuKDFRhFbnuYmROX1pGSoJNuuw7l3z5iUxJr8oNQXlG1s88TOlzCGM9V/d3gRAgJTw+b8aw
	VGPn+VP0S+NeAShU2aSQTY73LLpdNi9QFRP8XK7zYPf74x8AxKijmlcgbYGna683EwhkiL3cf7+ac
	Zx8TD0v3p2toTcaoFiKObpmsReQI4FLug5VjX8gC6c0KKBrrsgRVWsopLINqDbEi7x05lOAAFKlap
	yUqs6pOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmrW-0000000BerT-15ad;
	Mon, 05 Jan 2026 15:51:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmrS-0000000Beks-1rv4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:51:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 171264349A;
	Mon,  5 Jan 2026 15:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6548DC19422;
	Mon,  5 Jan 2026 15:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628274;
	bh=z+ECzJROyQdWWU7EpyeiCPFMZT/79bbG51bzW+4nrIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RKZ6ExlMtj2i5gtBpyNGEVPoyvAQFmA502jSn1cYYu3f8bDRUaiybGO+HKre2RPmY
	 fCMI+4+jGeAIkUqGFsNKl7eyU6cPyGMRN6fM0Ei53tULseptEbKEwoQSdKtWXySbuY
	 dk4TBEthW7liY/bS4EFIYfS1Z4qY55AvmeYwJW0I8CHUhs+caHJZc2FNAPTh7t2RrV
	 5TajTshsmE+bWzRoZGQ/a5REkJQejY/fsEZrVWMPd2qnxv+A3PCSmnor0LdczZRrAC
	 lL3QPqS9x7H7NE8Mh+f8NW/sW60x5SRRlCPHsUYJw48SVJuxEavkfdMf3C7yMT/Xga
	 awBQlHKOaHEMA==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH 27/30] KVM: arm64: Add some initial documentation for pKVM
Date: Mon,  5 Jan 2026 15:49:35 +0000
Message-ID: <20260105154939.11041-28-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
References: <20260105154939.11041-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_075115_681572_F92FEFB9 
X-CRM114-Status: GOOD (  23.70  )
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

Add some initial documentation for pKVM to help people understand what
is supported, the limitations of protected VMs when compared to
non-protected VMs and also what is left to do.

Signed-off-by: Will Deacon <will@kernel.org>
---
 .../admin-guide/kernel-parameters.txt         |   4 +-
 Documentation/virt/kvm/arm/index.rst          |   1 +
 Documentation/virt/kvm/arm/pkvm.rst           | 101 ++++++++++++++++++
 3 files changed, 104 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/virt/kvm/arm/pkvm.rst

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a8d0afde7f85..9939dc5654d2 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3141,8 +3141,8 @@ Kernel parameters
 			for the host. To force nVHE on VHE hardware, add
 			"arm64_sw.hvhe=0 id_aa64mmfr1.vh=0" to the
 			command-line.
-			"nested" is experimental and should be used with
-			extreme caution.
+			"nested" and "protected" are experimental and should be
+			used with extreme caution.
 
 	kvm-arm.vgic_v3_group0_trap=
 			[KVM,ARM,EARLY] Trap guest accesses to GICv3 group-0
diff --git a/Documentation/virt/kvm/arm/index.rst b/Documentation/virt/kvm/arm/index.rst
index ec09881de4cf..0856b4942e05 100644
--- a/Documentation/virt/kvm/arm/index.rst
+++ b/Documentation/virt/kvm/arm/index.rst
@@ -10,6 +10,7 @@ ARM
    fw-pseudo-registers
    hyp-abi
    hypercalls
+   pkvm
    pvtime
    ptp_kvm
    vcpu-features
diff --git a/Documentation/virt/kvm/arm/pkvm.rst b/Documentation/virt/kvm/arm/pkvm.rst
new file mode 100644
index 000000000000..1882bde8cc0b
--- /dev/null
+++ b/Documentation/virt/kvm/arm/pkvm.rst
@@ -0,0 +1,101 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================
+Protected KVM (pKVM)
+====================
+
+**NOTE**: pKVM is currently an experimental, development feature and
+subject to breaking changes as new isolation features are implemented.
+Please reach out to the developers at kvmarm@lists.linux.dev if you have
+any questions.
+
+Overview
+========
+
+Booting a host kernel with '``kvm-arm.mode=protected``' enables
+"Protected KVM" (pKVM). During boot, pKVM installs a stage-2 identity
+map page-table for the host and uses it to isolate the hypervisor
+running at EL2 from the rest of the host running at EL1/0.
+
+If ``CONFIG_PROTECTED_VM_UAPI=y``, pKVM permits creation of protected
+virtual machines (pVMs) by passing the ``KVM_VM_TYPE_ARM_PROTECTED``
+machine type identifier to the ``KVM_CREATE_VM`` ioctl(). The hypervisor
+isolates pVMs from the host by unmapping pages from the stage-2 identity
+map as they are accessed by a pVM. Hypercalls are provided for a pVM to
+share specific regions of its IPA space back with the host, allowing
+for communication with the VMM. See hypercalls.rst for more details.
+
+Isolation mechanisms
+====================
+
+pKVM relies on a number of mechanisms to isolate PVMs from the host:
+
+CPU memory isolation
+--------------------
+
+Status: Isolation of anonymous memory and metadata pages.
+
+Metadata pages (e.g. page-table pages and '``struct kvm_vcpu``' pages)
+are donated from the host to the hypervisor during pVM creation and
+are consequently unmapped from the stage-2 identity map until the pVM is
+destroyed.
+
+Similarly to regular KVM, pages are lazily mapped into the guest in
+response to stage-2 page faults handled by the host. However, when
+running a pVM, these pages are first pinned and then unmapped from the
+stage-2 identity map as part of the donation procedure. This gives rise
+to some user-visible differences when compared to non-protected VMs,
+largely due to the lack of MMU notifiers:
+
+* Memslots cannot be moved or deleted once the pVM has started running.
+* Read-only memslots and dirty logging are not supported.
+* With the exception of swap, file-backed pages cannot be mapped into a
+  pVM.
+* Donated pages are accounted against ``RLIMIT_MLOCK`` and so the VMM
+  must have a sufficient resource limit or be granted ``CAP_IPC_LOCK``.
+* Changes to the VMM address space (e.g. a ``MAP_FIXED`` mmap() over a
+  mapping associated with a memslot) are not reflected in the guest and
+  may lead to loss of coherency.
+* Accessing pVM memory that has not been shared back will result in the
+  delivery of a SIGSEGV.
+* If a system call accesses pVM memory that has not been shared back
+  then it will either return ``-EFAULT`` or forcefully reclaim the
+  memory pages. Reclaimed memory is zeroed by the hypervisor and a
+  subsequent attempt to access it in the pVM will return ``-EFAULT``
+  from the ``VCPU_RUN`` ioctl().
+
+CPU state isolation
+-------------------
+
+Status: **Unimplemented.**
+
+DMA isolation using an IOMMU
+----------------------------
+
+Status: **Unimplemented.**
+
+Proxying of Trustzone services
+------------------------------
+
+Status: FF-A and PSCI calls from the host are proxied by the pKVM
+hypervisor.
+
+The FF-A proxy ensures that the host cannot share pVM or hypervisor
+memory with Trustzone as part of a "confused deputy" attack.
+
+The PSCI proxy ensures that CPUs always have the stage-2 identity map
+installed when they are executing in the host.
+
+Protected VM firmware (pvmfw)
+-----------------------------
+
+Status: **Unimplemented.**
+
+Resources
+=========
+
+Quentin Perret's KVM Forum 2022 talk entitled "Protected KVM on arm64: A
+technical deep dive" remains a good resource for learning more about
+pKVM, despite some of the details having changed in the meantime:
+
+https://www.youtube.com/watch?v=9npebeVFbFw
-- 
2.52.0.351.gbe84eed79e-goog


