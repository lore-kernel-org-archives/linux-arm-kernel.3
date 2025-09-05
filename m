Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8233FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NScMNYGJTrwVse4UWLw7JWj4Wk4QUY3V8e72K6L26qw=; b=vwJd12jBvukQLPlz5VZz0628dy
	4K2rOsKHehnEHk4TuUVFnBRP3l1PGQqjusUOgk8bt//06/tF/HmZF45w1hbAUQtVUu42FmrzV8h0p
	61BzCgnEDVMrNQujIbTX9kQgJF/Ufahb+/DCRvZmBaPMKCCXXhdTXWBBIwtrr99MKEDkuFbTYGGp/
	iR/jctif5xPNpNUKKHwwl9dkuSWp62xGcjvEBl1GtCJAXstisPby2ks98VL06PDFIst/aYp3MvNm7
	hkko8EK4vz9a52/gD/2ChDjs9lJpNxZFpT4IGmHHWelyIf968OUgPYYbVG6thK2A/io+7MzL5UHic
	jP7B/zUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSyV-00000000p4P-3X7D;
	Fri, 05 Sep 2025 09:43:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQsa-000000001h8-43Mq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 07:29:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE2A14034F;
	Fri,  5 Sep 2025 07:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D324C4CEF1;
	Fri,  5 Sep 2025 07:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757057344;
	bh=yVy1f3yKmPmzFcw9VKqDyY9YboyVtGIYlwJrQrV2qog=;
	h=From:To:Cc:Subject:Date:From;
	b=oGuR7LOdCqpTVIeg+Y1AtdcT434yJI73d6FnTZh8Ibgz6vjBV+WB2H1zg7zyA8Q3X
	 4uZ61Bvtmm9/OU65Kg4MeJAzI9AoeM4UJnAW9Yl2zfvURlKc54UDDFl3BmXsepJIFf
	 P8Q9juSPgRsENh5jbPAzr2C0LdpcHd63f++ybzmoTlZjMhuCwmuyMiPaw1t3Lzg2RK
	 iDf1mBgpf2+rM79po6E0bMX8KRCPq5Kc0VPAYDf/tPTA361hbOao+jIyGeaymAT9JQ
	 3dPB/R3UgXUd4Lr6YRaW8KVDpqEmuFoHJvEvy8+2+GOv96t7TPxgPTAMyJx4v2P4OO
	 9T3NUhB0jcahA==
Received: from [131.175.126.3] (helo=lobster-girl.dot1x.polimi.it)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uuQsY-00000003Y39-0yts;
	Fri, 05 Sep 2025 07:29:02 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: Mark freed S2 MMUs as invalid
Date: Fri,  5 Sep 2025 08:28:59 +0100
Message-ID: <20250905072859.211369-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 131.175.126.3
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_002905_024099_A5C6F75C 
X-CRM114-Status: GOOD (  10.33  )
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

When freeing an S2 MMU, we free the associated pgd, but omit to
mark the structure as invalid. Subsequently, a call to
kvm_nested_s2_unmap() would pick these invalid S2 MMUs and
pass them down the teardown path.

This ends up with a nasty warning as we try to unmap an unallocated
set of page tables.

Fix this by making the S2 MMU invalid on freeing the pgd by calling
kvm_init_nested_s2_mmu().

Fixes: 4f128f8e1aaa ("KVM: arm64: nv: Support multiple nested Stage-2 mmu structures")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9a45daf817bf..315aaadfda30 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1074,6 +1074,10 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 		mmu->pgt = NULL;
 		free_percpu(mmu->last_vcpu_ran);
 	}
+
+	if (kvm_is_nested_s2_mmu(kvm, mmu))
+		kvm_init_nested_s2_mmu(mmu);
+		
 	write_unlock(&kvm->mmu_lock);
 
 	if (pgt) {
-- 
2.47.2


