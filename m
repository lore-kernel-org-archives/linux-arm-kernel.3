Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532DFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTwuEyisrGqKUCU60u7Trkb9WMmWkCdK0wy0/IvYPNw=; b=0lOfEuaDJG2r3370+Cdo6NhYOy
	ZL+L6iAXoLk2/tA64fVOoKouUSbz4rc+APoOZHs3jBQGaH6lqyMsY46y/RiDsehfdP9kNWJoF8/Zr
	1oLCEdnVbTf4Zim+5z1Ywr9Q/KMd/NYSCWH7u7sBhjjxFyG05uvLtQejtElbMe1CJ8E7VlGOHH4Zt
	TnXGennMhB+SFpJgGJiERePB9e0x1wW+l9VvW8wp+zRfBSlUJOsQ4f/EDw6k261KMN9rW5dGGoihl
	C73AcWOl5ion5OPxVVxT1nc8u4AdQuhQ2FmRwyFCZAeZWVRtV0/z2CkSe9hBSXkMUZmlJle38l3sf
	ksv+LWEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCoL-0000000F3Ef-308P;
	Fri, 10 Jan 2025 11:04:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCku-0000000F2ct-3APV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 11:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C14B5C5C88;
	Fri, 10 Jan 2025 11:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBABC4CEE0;
	Fri, 10 Jan 2025 11:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736506843;
	bh=vVgMyrLW1OMFgKTrIDDDXD458WHn0AVjGex0Tfq7F2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mMeyRf4KG/aKnNkh+oX9xfvNoII4/xPf/OICujDFWt1vJ2Y41oEGhKboNzyYbrBNB
	 MOkvxOuf4w8/quEjBV0VKaXaLLb1wZD7zvLVj9dx4Icmx8WVEFOuMDugN6Ull/fsE3
	 C2vQJqi85AnDHH2sBi6H/91/ofsuT9n0z61FkZxmVyPoiSTIqJhg0RgWkllPW0/LN3
	 l3SMHzOqOXSzYEUShgsgr7E6g0jzaXpV9cVMiHZqDbhNJN2wBVkngOJaMcJA9CguTu
	 zAU5N59Q/V9vMAmWr5UZ/9aoKXCxIY4pkehnRN75crZm3+bbZYR9KJz7JyVYFQrmeO
	 CdtaYRWKBnaDw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [PATCH v2 2/7] KVM: arm64: MTE: Update code comments
Date: Fri, 10 Jan 2025 16:30:18 +0530
Message-ID: <20250110110023.2963795-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
References: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_030044_839364_35D742FD 
X-CRM114-Status: GOOD (  15.72  )
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

commit d77e59a8fccd ("arm64: mte: Lock a page for MTE tag
initialisation") updated the locking such the kernel now allows
VM_SHARED mapping with MTE. Update the code comment to reflect this.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/kvm/mmu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c9d46ad57e52..eb8220a409e1 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1391,11 +1391,11 @@ static int get_vma_page_shift(struct vm_area_struct *vma, unsigned long hva)
  * able to see the page's tags and therefore they must be initialised first. If
  * PG_mte_tagged is set, tags have already been initialised.
  *
- * The race in the test/set of the PG_mte_tagged flag is handled by:
- * - preventing VM_SHARED mappings in a memslot with MTE preventing two VMs
- *   racing to santise the same page
- * - mmap_lock protects between a VM faulting a page in and the VMM performing
- *   an mprotect() to add VM_MTE
+ * The race in the test/set of the PG_mte_tagged flag is handled by using
+ * PG_mte_lock and PG_mte_tagged together. if PG_mte_lock is found unset, we can
+ * go ahead and clear the page tags. if PG_mte_lock is found set, then the page
+ * tags are already cleared or there is a parallel tag clearing is going on. We
+ * wait for the parallel tag clear to finish by waiting on PG_mte_tagged bit.
  */
 static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
 			      unsigned long size)
-- 
2.43.0


