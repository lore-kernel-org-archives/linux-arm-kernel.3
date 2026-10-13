Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B71CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ACtBFDMyQfLEniDWOYIjXyTNEq2aFsADzh9Mfbx6cXM=; b=n2hJfruj5PULOM4jc+3U4VSl+E
	Xd3xK6weALtnfB2lbdjNsA2aelVSK2IV9MsC9Ir5D2Tr879S0ok2fI5PLfNrrEewHqX7hREB09ioR
	8HWd2Cf02Dqmo0aybt3TWXxQWN36g9JyF7vm0o8HQAUuQnVq9yUj02+E0DLSnJvoYYHtmbhGEr0au
	IYje7ONR8Daph2e6PVqz9WbzFkSpOxqbhnUJowTudLLHN+f0tGqk91EPh8BjH0UNQSoQLx3NELGwS
	KOQzBddLbJXxD5xJoLxmk88Vnc2Z8cRZpdDkC51bh0VhUsbdSYWoRBvzJQLIjggFI/6A1j8SL/mWo
	SOTSHTmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfbJ-0000000DZos-2bor;
	Tue, 13 Oct 2026 16:43:41 +0000
Received: from out-117.mta0.migadu.com ([2001:41d0:1004:224b::75] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfbG-0000000DZnZ-3IGe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 16:43:40 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PcPBi5Nzv8M4w/Sm2h+bvnujrs8RY53hUJG3UM3gd0I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791909815; v=1; x=1792514615;
 b=ZZWxNsc9Flf9ovBnPjcSpEXnM8zrl3NkD9IJ7xQeBgazRInZPY8C1YQfvZizYS5ppdQulj3T
 ToFzNfPAoJoinBTqqywE2fBaQvXYYXutc2XuA4djyyBL9rvT5iBV5wZAeck1kU8gAGdFcPSLOdh
 9MJWYsUpokMuodxSOK4poSa0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bb0e231c7fdb8771;
	Tue, 13 Oct 2026 16:43:35 +0000
X-Mizu-Trace-ID: bb0e231c7fdb8771
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: Don't WARN on SMCCC filter reserved range allocation failure
Date: Tue, 13 Oct 2026 17:43:34 +0100
Message-Id: <20261013164334.1492070-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_094339_021098_57F3E01E 
X-CRM114-Status: GOOD (  13.71  )
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

The first time userspace sets an SMCCC filter, kvm_smccc_set_filter()
inserts the reserved architecture ranges into the maple tree and WARNs
if that fails. The insertion allocates with GFP_KERNEL_ACCOUNT, so a
tight memory cgroup limit is enough for userspace to hit the WARN, even
though the -ENOMEM is also returned to it. The WARN dates back to when
the ranges were inserted at VM creation.

Leave -ENOMEM out of the WARN and keep it for every other error. The
two reserved ranges are fixed and disjoint and go into an empty tree
under config_lock, so any other error is a KVM bug.

Fixes: fb88707dd39bd ("KVM: arm64: Use a maple tree to represent the SMCCC filter")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260829055809.29AD31F000E9@smtp.kernel.org/
Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
Changes since v1 [1]:
  - Keep the WARN for any error other than -ENOMEM. (Oliver)
  - Split out of v1 as its own patch. (Marc)

Based on Linux 7.3-rc3 (fd73f4a665989).

[1] https://lore.kernel.org/all/20260928152507.2116110-2-fuad.tabba@linux.dev/

 arch/arm64/kvm/hypercalls.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
index b11b8821c9fbc..c9d488c586e5f 100644
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@ -197,8 +197,10 @@ static int kvm_smccc_set_filter(struct kvm *kvm, struct kvm_smccc_filter __user
 
 	if (!kvm_smccc_filter_configured(kvm)) {
 		r = kvm_smccc_filter_insert_reserved(kvm);
-		if (WARN_ON_ONCE(r))
+		if (r) {
+			WARN_ON_ONCE(r != -ENOMEM);
 			goto out_unlock;
+		}
 	}
 
 	r = mtree_insert_range(&kvm->arch.smccc_filter, start, end,

base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5


