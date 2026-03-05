Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91354F33A75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSH3Oo+04uor97/OyzycHt950XkNbYFw0O9pY7ouszk=; b=ja1k4rhZtcjXKgMn8zuJX1lS/z
	w45QoxD3RBrnlJPKjgNRoZJf5Ij18XE87KoGv1NPHOLGNjk/iv6IBQ1eCS4xMSKK/Jvufg833T9Bo
	JDPjOrgGnEe9eyf8jilx5CVP9XATyaKOhUaTPhlGZm0e1Tn9hDlvYkgLVa8F/WeSH5wensi8Tblx2
	mT8jpv4Ew14mD/jZRd2ES/EP9rAZW/O0XR31659qOVWA7J8Nubmr7/ymPqrSd9q4SI0HFi1Qg7F01
	7SR7uPkdkToLk5joQJ7GWuzgLjnE0WQWSgVVVGnkHRyzpfy8juSiqjdsJt75aq4nbsGgkGCURivMm
	u/ZntlNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xC-000000022ED-03Jd;
	Thu, 05 Mar 2026 14:45:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xA-000000022BM-098V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:45:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67E2361854;
	Thu,  5 Mar 2026 14:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B68C2BC9E;
	Thu,  5 Mar 2026 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721927;
	bh=TXBLAESaWwmhTrLdTHIjZB5tcCyfd2YEw+VxiDwVIKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lZths6EGU1LNdBGAuEdyAub1a1jES/+bU/DWBKUD7pt5ftLPDIOL9jGK/Mex5ZfpN
	 WP1CXZmhFNB3/2bzuX69M3NVOm7jf1CDQL/gRj8+CHQQvihZb+YzKVkr1PyTS5FJF4
	 4u141Szo5RncVjUWW95Bs0Q6EPbqNzAb0vcNpUcOKHB5P73eQLsovicMtGceF1nAmm
	 wmCtLKOhO/XzR7Ih7uS/0Pe6JIEZ4hkjEbQ6wmS33fpU+NcOJhe+V7zzLQJFQQa/Hx
	 KEusQI/DMQnW02JJHMHWfoia6gbkMLmcIuv7/huBk8tqvSNEwHLE0Ek6HLx52kR8Kv
	 rDLZZH+tRUAxQ==
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
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v3 22/36] KVM: arm64: Change 'pkvm_handle_t' to u16
Date: Thu,  5 Mar 2026 14:43:35 +0000
Message-ID: <20260305144351.17071-23-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

'pkvm_handle_t' doesn't need to be a 32-bit type and subsequent patches
will rely on it being no more than 16 bits so that it can be encoded
into a pte annotation.

Change 'pkvm_handle_t' to a u16 and add a compile-type check that the
maximum handle fits into the reduced type.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 2 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c    | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 911819e6e757..13fe4bd1fe0b 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -247,7 +247,7 @@ struct kvm_smccc_features {
 	unsigned long vendor_hyp_bmap_2; /* Function numbers 64-127 */
 };
 
-typedef unsigned int pkvm_handle_t;
+typedef u16 pkvm_handle_t;
 
 struct kvm_protected_vm {
 	pkvm_handle_t handle;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index a2d45f4b0cf6..a7253a884163 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -222,6 +222,7 @@ static struct pkvm_hyp_vm **vm_table;
 
 void pkvm_hyp_vm_table_init(void *tbl)
 {
+	BUILD_BUG_ON((u64)HANDLE_OFFSET + KVM_MAX_PVMS > (pkvm_handle_t)-1);
 	WARN_ON(vm_table);
 	vm_table = tbl;
 }
-- 
2.53.0.473.g4a7958ca14-goog


