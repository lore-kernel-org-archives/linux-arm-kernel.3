Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE72C982CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcrDVwAhBZz//oZ5C2qr68s7JHHoWQqhY8HjvQ3QH1Y=; b=0JFcS2RGDQMief6eDYgaZuB3OU
	eqPmtkUkuFl9EYG+aqkkfpSfr6kCTEOxPNXl/gHDRJEZR5IlseXO8jDUqPuIo/02PYOtjYwX07dke
	tNHLLuKEHGSHEdy4xsKv7z63+lTbUNpwb+y1+mV0W5fHJFxkq4hiGrN52KBCbSUCSbVWds6RgUHYv
	twaU2Pa/2/DnwhOztv7l3Zt4T8Bvh2UajpuIP4CuZlo+r3GWtUp+56fhl60lnKvx8gPQwcCOt6Wrr
	W+1O37WBRgAsLvZJheU8P7XQiEjUgwr+SfEkN+0eT7llY3JfMCz90ZQdZ7pka4BcLEzv76ThHSweg
	MY64Jn6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VcD-00000007LOd-2NHX;
	Tue, 15 Sep 2026 16:02:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VcA-00000007LKu-1d1n
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 16:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jcrDVwAhBZz//oZ5C2qr68s7JHHoWQqhY8HjvQ3QH1Y=; b=KXG0tqPSYb3UewDWVHi14eTtey
	e3Pg+B5nx6A8Yhs7VK1JCijyMcaP4RsTl4CvLvjXfTJ4Ybv7qR6msG88C1Zlrwo9hMemnva06Y57p
	sXroGuY7NWimfRuCg2As89YIXQrrllrmRsb9C8t1T5vVxaOJknt5BQ8wSFk6sVm6de377XTTHq/UX
	2jD3e66OwBZTZpMnjFBzH+vrlc0PrDzVGWN5uc6cJg0UDldcbsONL/ayUIo5P7d6UWcVT1HtmHlwo
	TCyDD939ZsbyJzuq06PWBUiExsPi4z6eJeTqYHxF4KLogc8eCInm1UJJFNqtPpfJt92SwNGhlao06
	ByXUgvYA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Vc6-00000006zlj-2bjR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:02:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 962AF1BF3;
	Tue, 15 Sep 2026 09:02:25 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7CAD93F882;
	Tue, 15 Sep 2026 09:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789488149; bh=qj0/UumNi5rDv9Vg9CrV5dfdz5rbhLtkWFeMlHj/0ZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uc/omc6LolGCKoufSQrM1eLdyE1xcH7d+Puq7h5KkYr2fAslOBuR9wgoGo+lGo/xu
	 bKhiV67zsxwjjhEyvws5kVS5N6sdOX39WqbvP77n79jT9mqJ4Kn918LdoQo7OXkQAG
	 M2576vXCPvQdJs5xBMZHqUrcDrbAKbH7nFxM1HmI=
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
Subject: [PATCH v18 12/23] KVM: arm64: Widen the scope of "protected" VMs
Date: Tue, 15 Sep 2026 17:01:30 +0100
Message-ID: <20260915160141.3543048-13-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915160141.3543048-1-suzuki.poulose@arm.com>
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_170231_043444_0BB4ED33 
X-CRM114-Status: GOOD (  14.77  )
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

On arm64 we have "protected" VMs that run on PKVM as a confidential compute
guest. Given we already have the construct of "kvm_vm_is_protected" in the core
KVM code, use that for all confidential compute guests including Realms that
we are about to add.

Use the VM flavor to detect the "protected" VMs by introducing a marker.
Add explicit helper to detect if a given VM is a "protected" VM under PKVM.
Change the existing users that precisely want to check the VM type. These
include :
  - kvm_arch_prepare_memory_region - For preventing memslot changes after pVM
    creation.

All the others are retained as a wider check for confidential guest VMs.
These are:
 - kvm_vm_ioctl_set_counter_offset - For disallowing timer offset configuration
 - io_mem_abort for dabt handling without valid syndrome information

Both of which are true for Realms too.

Realms support is restricted to VHE host and thus "kvm_vm_is_protected()"
checks in the pkvm hyp specific code doesn't need to change, as the only
protected guests it deals with is "protected PKVM" guests.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/kvm_host.h | 4 +++-
 arch/arm64/kvm/mmu.c              | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7ce46d853c47e..1bb43c57fb0f0 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -329,6 +329,7 @@ enum kvm_arm_vm_flavor {
 	VM_NVHE,
 	VM_VHE,
 	VM_PKVM,		/* Normal guests on pKVM */
+	MARKER(__VM_PROTECTED),
 	VM_PROTECTED_PKVM,	/* Protected VM */
 	VM_FLAVOR_MAX,
 };
@@ -1535,7 +1536,8 @@ struct kvm *kvm_arch_alloc_vm(void);
 
 #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
 
-#define kvm_vm_is_protected(kvm)	((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
+#define kvm_vm_is_protected(kvm)	((kvm)->arch.vm_flavor >= __VM_PROTECTED)
+#define kvm_vm_is_protected_pkvm(kvm)	((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
 #define kvm_vm_is_unprotected_pkvm(kvm)	((kvm)->arch.vm_flavor == VM_PKVM)
 
 #define kvm_vm_hyp_is_pkvm(kvm)		(is_protected_kvm_enabled())
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 607c908c15c42..38f3bf772278f 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2678,7 +2678,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	hva_t hva, reg_end;
 	int ret = 0;
 
-	if (kvm_vm_is_protected(kvm)) {
+	if (kvm_vm_is_protected_pkvm(kvm)) {
 		/* Cannot modify memslots once a pVM has run. */
 		if (pkvm_hyp_vm_is_created(kvm) &&
 		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE)) {
-- 
2.43.0


