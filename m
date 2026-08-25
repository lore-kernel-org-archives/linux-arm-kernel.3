Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63575C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieciqQAppu3w3m3vaA8fGDEB9zmoYk7lFyM6rUcK1Z8=; b=S6BD7KLb2yZKAoE1tvq2pKLFwG
	ovxTAk0zJBOCy5vE2E2Xf2FpmZKUF9djslDtIfdH4C2pTyZq5X/lXcwT/2gOf+WV13HKida/T/lrd
	5g64LZlXvtar+VQmWRBDOotxsuZ7hhObzJ1aiZhWG+pRrw6VGtY/dZsRptck3eH2gkacmFJV3qYgC
	5FRP5O1IyYbpXrScGbM4l1MYVOYamOXEJIinbM1GTzgG8ss0JAOMvbOdjKlf72IW431TjYaJU0i2S
	e5LPkw6GJFq/oA6XwChoj7eMJpH+9b/gSeQ/MP/6HFur+uxqufCCpS6JWI6arQz6OXhId8/WBFkNG
	p8TyMroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyXv-00000001UuE-0PXU;
	Tue, 25 Aug 2026 21:19:03 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyXm-00000001UqJ-3dEZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787692735; x=1819228735;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=70JDFubTVkBsDgJS+Q5x0sY6ZqnQo0abv+xo6mjXvqY=;
  b=F5mBfxmwAFgL2O/kLbQwFwcfEZPuKJCHB6bc7snp3+3d6hoS3f7cnYVU
   20VwcK6J1OVbXPSBTCQdg+HwS8CWfML6D7YevMNeKf7Z5SGNv8t0GOuqF
   zbxAHn/7L/rzfIUvIN93lo0REfEC4XmKLOIzetVlNiixWkIYFO8OO9LMN
   T9dZb2/lzskdbYt2JPUk1s1lmFIOaLeKRd8xL/H/kgH1N4VRcf1broHid
   9yL7Z1/M/8PZvJ+778N9k6plx8GKhUZ+NdTbsqKlbG4v4CtBMG4aD8Rha
   Ygiu5FDhc/i6v9urEE4XJmxwnQqXtuCpD1wclw/zykTUn1CadxTxkFYlM
   A==;
X-CSE-ConnectionGUID: hxJwm5zaTQeQSxlClP1qPg==
X-CSE-MsgGUID: K0/3tl9YQbecs3ymvOerZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="238776803"
X-IronPort-AV: E=Sophos;i="6.25,243,1779116400"; 
   d="scan'208";a="238776803"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 06:18:53 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 461041C1C70D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 21:18:53 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id F37258D65E1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 21:18:52 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 358C51801C03;
	Tue, 25 Aug 2026 21:18:47 +0000 (UTC)
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Date: Wed, 26 Aug 2026 06:18:35 +0900
Subject: [PATCH 2/2] KVM: selftests: arm64: Add 52-bit VA guest modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-arm64-52bit-va-v1-2-14ec98211363@fujitsu.com>
References: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com>
In-Reply-To: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
 Takayuki Okamoto <tokamoto@fujitsu.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787692718; l=4987;
 i=itaru.kitayama@fujitsu.com; s=20260825; h=from:subject:message-id;
 bh=70JDFubTVkBsDgJS+Q5x0sY6ZqnQo0abv+xo6mjXvqY=;
 b=ZHsdORZZInAmcydx9m1zTcNgmLZVUmMpigF0GjTpwFoRUApwYAlxNWL1Iyxbgd3+bkTV5CIKA
 TM139YCgkS+Dh7GS1EiU69FwFgnlB+Z4dMFUe3eAH5TfkH6jDxrt9oy
X-Developer-Key: i=itaru.kitayama@fujitsu.com; a=ed25519;
 pk=g9bTnr9giRP7JwNSZHy+OMLQZBEUtSE9tUnXso0hH1Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_141855_204793_48403DAB 
X-CRM114-Status: GOOD (  14.21  )
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

Add P52V52 guest mode IDs for the 4K, 16K and 64K translation
granules, along with their mode descriptions and parameters.

Advertise the 4KB and 16KB modes when the corresponding granule supports
a 52-bit IPA, implying FEAT_LPA2 support. For the 64K mode, also require
52-bit VA support.

This makes the 52-bit VA configurations available to KVM selftests now
that the arm64 page-table code supports 5-level stage-1 translation.

Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Reviewed-by: Takayuki Okamoto <tokamoto@fujitsu.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h    |  3 +++
 tools/testing/selftests/kvm/lib/arm64/processor.c |  2 +-
 tools/testing/selftests/kvm/lib/guest_modes.c     |  5 +++++
 tools/testing/selftests/kvm/lib/kvm_util.c        | 11 +++++++++++
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 04a910164a29..9040281c0992 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -184,6 +184,9 @@ enum vm_guest_mode {
 	VM_MODE_P52V48_4K,
 	VM_MODE_P52V48_16K,
 	VM_MODE_P52V48_64K,
+	VM_MODE_P52V52_4K,
+	VM_MODE_P52V52_16K,
+	VM_MODE_P52V52_64K,
 	VM_MODE_P48V48_4K,
 	VM_MODE_P48V48_16K,
 	VM_MODE_P48V48_64K,
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 9108e14a9b5b..bcdf670c9eb8 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -46,7 +46,7 @@ static u64 pud_index(struct kvm_vm *vm, gva_t gva)
 	u64 mask = (1UL << (vm->page_shift - 3)) - 1;
 
 	TEST_ASSERT(vm->mmu.pgtable_levels >= 4,
-		    "Mode %d does not have at least 4 page table levels",
+		    "Mode %d does not have >= 4 page table levels",
 		    vm->mode);
 
 	return (gva >> shift) & mask;
diff --git a/tools/testing/selftests/kvm/lib/guest_modes.c b/tools/testing/selftests/kvm/lib/guest_modes.c
index 7a96c43b5704..4f121e2987e9 100644
--- a/tools/testing/selftests/kvm/lib/guest_modes.c
+++ b/tools/testing/selftests/kvm/lib/guest_modes.c
@@ -21,10 +21,15 @@ void guest_modes_append_default(void)
 	{
 		unsigned int limit = kvm_check_cap(KVM_CAP_ARM_VM_IPA_SIZE);
 		u32 ipa4k, ipa16k, ipa64k;
+		u32 va;
 		int i;
 
 		aarch64_get_supported_page_sizes(limit, &ipa4k, &ipa16k, &ipa64k);
+		va = aarch64_get_supported_va_size();
 
+		guest_mode_append(VM_MODE_P52V52_4K, ipa4k >= 52);
+		guest_mode_append(VM_MODE_P52V52_16K, ipa16k >= 52);
+		guest_mode_append(VM_MODE_P52V52_64K, ipa64k >= 52 && va >= 52);
 		guest_mode_append(VM_MODE_P52V48_4K, ipa4k >= 52);
 		guest_mode_append(VM_MODE_P52V48_16K, ipa16k >= 52);
 		guest_mode_append(VM_MODE_P52V48_64K, ipa64k >= 52);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 195f3fdae1e3..3fbc5b0d75ff 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -195,6 +195,9 @@ const char *vm_guest_mode_string(u32 i)
 		[VM_MODE_P52V48_4K]	= "PA-bits:52,  VA-bits:48,  4K pages",
 		[VM_MODE_P52V48_16K]	= "PA-bits:52,  VA-bits:48, 16K pages",
 		[VM_MODE_P52V48_64K]	= "PA-bits:52,  VA-bits:48, 64K pages",
+		[VM_MODE_P52V52_4K]	= "PA-bits:52,  VA-bits:52,  4K pages",
+		[VM_MODE_P52V52_16K]	= "PA-bits:52,  VA-bits:52, 16K pages",
+		[VM_MODE_P52V52_64K]	= "PA-bits:52,  VA-bits:52, 64K pages",
 		[VM_MODE_P48V48_4K]	= "PA-bits:48,  VA-bits:48,  4K pages",
 		[VM_MODE_P48V48_16K]	= "PA-bits:48,  VA-bits:48, 16K pages",
 		[VM_MODE_P48V48_64K]	= "PA-bits:48,  VA-bits:48, 64K pages",
@@ -231,6 +234,9 @@ const struct vm_guest_mode_params vm_guest_mode_params[] = {
 	[VM_MODE_P52V48_4K]	= { 52, 48,  0x1000, 12 },
 	[VM_MODE_P52V48_16K]	= { 52, 48,  0x4000, 14 },
 	[VM_MODE_P52V48_64K]	= { 52, 48, 0x10000, 16 },
+	[VM_MODE_P52V52_4K]	= { 52, 52,  0x1000, 12 },
+	[VM_MODE_P52V52_16K]	= { 52, 52,  0x4000, 14 },
+	[VM_MODE_P52V52_64K]	= { 52, 52, 0x10000, 16 },
 	[VM_MODE_P48V48_4K]	= { 48, 48,  0x1000, 12 },
 	[VM_MODE_P48V48_16K]	= { 48, 48,  0x4000, 14 },
 	[VM_MODE_P48V48_64K]	= { 48, 48, 0x10000, 16 },
@@ -298,10 +304,14 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 
 	/* Setup mode specific traits. */
 	switch (vm->mode) {
+	case VM_MODE_P52V52_4K:
+		vm->mmu.pgtable_levels = 5;
+		break;
 	case VM_MODE_P52V48_4K:
 		vm->mmu.pgtable_levels = 4;
 		break;
 	case VM_MODE_P52V48_64K:
+	case VM_MODE_P52V52_64K:
 		vm->mmu.pgtable_levels = 3;
 		break;
 	case VM_MODE_P48V48_4K:
@@ -322,6 +332,7 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 	case VM_MODE_P48V48_16K:
 	case VM_MODE_P40V48_16K:
 	case VM_MODE_P36V48_16K:
+	case VM_MODE_P52V52_16K:
 		vm->mmu.pgtable_levels = 4;
 		break;
 	case VM_MODE_P47V47_16K:

-- 
2.43.0


