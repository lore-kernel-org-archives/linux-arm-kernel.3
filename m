Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9988CD37BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 14:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqZkWm27C2WWNzAMyZHUJHh8nBziwXytMbN+PPDbkvQ=; b=mxSqDGwUtHr2rBEdwB9dP4n1jh
	0Y1gOsi47WkNUUhODs5Sb6pwSqheny1FTBI6SZnS2IlYyUoD+mghn3Xxf39Rgtk0U28PrzWM0ZX4+
	JUKMvZPiezlTwmldYxlbRQuPqXmnpWk5Brs+4k+8MglP775kTdQhPPesqyHYZ0iYD+19qX/WIlCwy
	xB7YAZtH8B6WmpSj/5lG8vLhoz1JNMOX3oha7tj7zLvFHxg0V8Sjg5EpRXaRz9CzTwncuMJOMx0W1
	cwbVp9i0Y3L3rlNNKKUB13DvIsOjnDt/VEAn4W4qgzcB9iVVVrY1udAxkhEo8liY0slxAhm7J2Y/t
	AdMamB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5Xz-0000000AytX-0m0x;
	Sun, 10 May 2026 14:54:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5Xw-0000000Ayrr-1E6S
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 14:54:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CE5627B5;
	Sun, 10 May 2026 07:54:11 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74EA23F836;
	Sun, 10 May 2026 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778424856; bh=lwnpRiOgHSXv6Wdc+Q1IaXvZ4XNXi6T0Q1XkzBl0AqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n+eSL8vZC3Yo8PcRWxnD55+5D0P+TgPrOL/fco4Em4zvoDbZin1x1JPbfJHL4/BuY
	 NYhbP8b1fhny6BbLMVVcMzYnJp1kuzrB5Bmu/8Pj6o5C0s7jx5JvA01oGaerU5zO25
	 sGMj7p7jy9Rt6cESpP6/92tuylxEIv+NKa7jxYXA=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 1/5] KVM: arm64: Use a variable for the canonical GPA in kvm_s2_fault_map()
Date: Sun, 10 May 2026 15:53:34 +0100
Message-ID: <20260510145338.322962-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510145338.322962-1-weilin.chang@arm.com>
References: <20260510145338.322962-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_075420_552403_099A05B0 
X-CRM114-Status: GOOD (  13.72  )
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

Create a variable to store the canonical GPA, instead of calculating it
when needed. This will be useful when we need to use the canonical GPA
for the nested reverse map later.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/mmu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index d089c107d9b7..e4becd5cdf36 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1981,6 +1981,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	long mapping_size;
 	kvm_pfn_t pfn;
 	gfn_t gfn;
+	phys_addr_t canonical_gpa;
 	int ret;
 
 	kvm_fault_lock(kvm);
@@ -1994,6 +1995,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	mapping_size = s2vi->vma_pagesize;
 	pfn = s2vi->pfn;
 	gfn = s2vi->gfn;
+	canonical_gpa = gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
 
 	/*
 	 * If we are not forced to use page mapping, check if we are
@@ -2012,6 +2014,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 				goto out_unlock;
 			}
 		}
+		canonical_gpa = ALIGN_DOWN(canonical_gpa, mapping_size);
 	}
 
 	if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
@@ -2045,11 +2048,9 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	 * making sure we adjust the canonical IPA if the mapping size has
 	 * been updated (via a THP upgrade, for example).
 	 */
-	if (writable && !ret) {
-		phys_addr_t ipa = gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
-		ipa &= ~(mapping_size - 1);
-		mark_page_dirty_in_slot(kvm, s2fd->memslot, gpa_to_gfn(ipa));
-	}
+	if (writable && !ret)
+		mark_page_dirty_in_slot(kvm, s2fd->memslot,
+					gpa_to_gfn(canonical_gpa));
 
 	if (ret != -EAGAIN)
 		return ret;
-- 
2.43.0


