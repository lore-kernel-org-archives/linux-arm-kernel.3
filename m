Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DE4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOVHRec3Uwtn6lBQr+8WhgKfzwuMI+dX9uWayyNwvIE=; b=XaCS+D7dFl3U+2EaOnFr8YFAv3
	u3Qho4vNh4Io7zcoir7gH8WYg+adAj6r4slQ/xKj8XasrJfbEh5CVt6n79932Amh+e7Kdix5JjCVM
	XfO51m9SI/zymNgqUIqPdKe+ivaFUVQ8PWoY0ZH6ZLtiaIctU/jxku3hd4RUUAo9Js7N0ef8xaaF2
	0PsDkrfgfXVyZE/fHZ3gi2XbT9sXvrOyoEzq/h5N7X7d7+KrcrIGK8TXlIn8cjOE/3IAOpc/dN0bU
	JG3EmNy6r09CoMIXDKZv9p7qeASZOgoXlWOs30j2tQlTQZSx2JVZ8E+6hYE+WX9yLJco9haNA/Wzf
	+U1hm7Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbo2-0000000BpZT-1IeI;
	Tue, 14 Jul 2026 12:00:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbnv-0000000BpVM-1YVM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:00:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE7061476;
	Tue, 14 Jul 2026 04:59:57 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD06E3F93E;
	Tue, 14 Jul 2026 04:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784030402; bh=RPfike1o9nuXZBOiQAjbQMhBFKE/+EBRVPOQI5nvn6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kzhJlb0nAI9smDy/4lMOJ0AcSAkvKnNWn2soWpbbvZtDl2ruR8Gb/+ENw6cqhjTIS
	 4bjzQe121JTL2/WPP0EtjvbCpOAkGafnLZVOMFpJ/LCgCDk1ONEC+x4fJh+4k0aM/Q
	 whm6MV7IF6jry9SjgmYOM6Ofc1FLFo6eBxRBlmh0=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Sebastian Ene <sebastianene@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v4 1/6] KVM: arm64: Use a variable for the canonical GPA in kvm_s2_fault_map()
Date: Tue, 14 Jul 2026 12:59:20 +0100
Message-ID: <20260714115926.2044757-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714115926.2044757-1-weilin.chang@arm.com>
References: <20260714115926.2044757-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_050003_514695_82698DF5 
X-CRM114-Status: GOOD (  13.83  )
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
index 8811ad60cf72..54395a608fd3 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2021,6 +2021,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	long mapping_size;
 	kvm_pfn_t pfn;
 	gfn_t gfn;
+	phys_addr_t canonical_gpa;
 	int ret;
 
 	kvm_fault_lock(kvm);
@@ -2034,6 +2035,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	mapping_size = s2vi->vma_pagesize;
 	pfn = s2vi->pfn;
 	gfn = s2vi->gfn;
+	canonical_gpa = gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
 
 	/*
 	 * If we are not forced to use page mapping, check if we are
@@ -2052,6 +2054,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 				goto out_unlock;
 			}
 		}
+		canonical_gpa = ALIGN_DOWN(canonical_gpa, mapping_size);
 	}
 
 	if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
@@ -2085,11 +2088,9 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
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


