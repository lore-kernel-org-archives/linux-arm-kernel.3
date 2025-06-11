Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36ECC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MV/Iy2juxuj9ep4i85dYaBWLMSNPe+PPc+T3+TGfETo=; b=NVkzzw4T7hcZo5SLrFpva9iN+e
	tKliXNbPoMM2jKm+LSikAobRnrtiUB1o1wB1JoFECykK9yZvKTKAdZIKxTfiJwN8Zq0L2umxAxla1
	rzZwpnXd8JH1SSB6KD4Z9nTT62x/+lqrT54RXiFLRxkEGBaGPsZ+IvZDEnWiXDRjMNo9y9uSSZ8QI
	zlzBhCr0+79c6VtUTsZTCpXbaG0Ot46oXDxZJ75oI3f54YV95w4yI4YcOUDrdpO4g1fAnR3hXPXNA
	0SWhmqfCqR1XwMpvsreQqLqx6GQ9mhZ+6fzzt2F7R1bmFp9bU1m7dul/h9lWq6RZ3B+2B41m1OkW3
	qJ+g7EJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMoj-0000000AFvK-3zgQ;
	Wed, 11 Jun 2025 14:52:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ2U-00000009fVi-0b5w
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 10:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MV/Iy2juxuj9ep4i85dYaBWLMSNPe+PPc+T3+TGfETo=; b=JrWc1YtZxBi/ZZvI3eanI5sEAq
	dnyVqGLYfjAGLbiVzcAsmOG1DVS5yHlHwBydW/KftVyL4y+TIM7UUvUYt3Ar1z/5EsIvKm8RVSyT0
	nKfti2gjyV5ufPMt73gAr5kjHBMI4TNPeQS6GsQoWunODWuwM+zS2Nh6Up+9ZPEBd5oLUkQ5emB1F
	98axRxWExnpNGlWvnJvTYPMvVG5dqSkU7VXm+HV2iDQe4j+M6shMM+Ye4HoiBxxJSbTkVbry57i3v
	2gVtp9+crh/qkW85wX6rxZV4WH1VCiE07WLA99/ERF4fRBjEVfKmKkPmc8HSBpwC3iFr/QhpJGmoP
	51ew2hxw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ2Q-00000002IFN-3lHF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:50:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8AAD1688;
	Wed, 11 Jun 2025 03:50:13 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.67.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19ED63F673;
	Wed, 11 Jun 2025 03:50:29 -0700 (PDT)
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
	Emi Kisanuki <fj0570is@fujitsu.com>
Subject: [PATCH v9 25/43] arm64: Don't expose stolen time for realm guests
Date: Wed, 11 Jun 2025 11:48:22 +0100
Message-ID: <20250611104844.245235-26-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611104844.245235-1-steven.price@arm.com>
References: <20250611104844.245235-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_115035_170856_8F4B8148 
X-CRM114-Status: GOOD (  11.94  )
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

It doesn't make much sense as a realm guest wouldn't want to trust the
host. It will also need some extra work to ensure that KVM will only
attempt to write into a shared memory region. So for now just disable
it.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v7:
 * Update the documentation to add a note about stolen time being
   unavailable in a realm.
---
 Documentation/virt/kvm/api.rst | 3 +++
 arch/arm64/kvm/arm.c           | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 0049d67fe38f..83843c2f755d 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8907,6 +8907,9 @@ is supported, than the other should as well and vice versa.  For arm64
 see Documentation/virt/kvm/devices/vcpu.rst "KVM_ARM_VCPU_PVTIME_CTRL".
 For x86 see Documentation/virt/kvm/x86/msr.rst "MSR_KVM_STEAL_TIME".
 
+Note that steal time accounting is not available when a guest is running
+within a Arm CCA realm (machine type KVM_VM_TYPE_ARM_REALM).
+
 8.25 KVM_CAP_S390_DIAG318
 -------------------------
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 5502997b7354..4eb229b6c315 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -396,7 +396,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		r = system_supports_mte();
 		break;
 	case KVM_CAP_STEAL_TIME:
-		r = kvm_arm_pvtime_supported();
+		if (kvm_is_realm(kvm))
+			r = 0;
+		else
+			r = kvm_arm_pvtime_supported();
 		break;
 	case KVM_CAP_ARM_EL1_32BIT:
 		r = cpus_have_final_cap(ARM64_HAS_32BIT_EL1);
-- 
2.43.0


