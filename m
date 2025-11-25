Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128C4D0EE1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 19:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yyxlkEr+mm1OXXG/cfaCg5SHXW8RBD3NDq8dNVy7uzM=; b=kV/Q4iBimNKd2sZ2gRILjEALET
	83DbypVOsFmZVqcayxeeyYK7proTZVxr253LyCYwi7UmetsJjlRPDjQ7QpQRp7KT3p8FwIwlFr0E5
	Zl1UUmPg0actbhOC6iCr1dH1KHUfYbsAw8DT8zxDRodWnbUZJ7iEG9IZKI6mmgWG7Q1U7YdDmr6Zu
	af7xbv5YT88MG2C56TiilpSHsZnRa1qwEQ8v1eQXlnTCUw+lNpzv8oJt5diOaHktAvudF8WthHAB+
	QMsA06IOJ3rXCWDdEcGOtbIoa58zyB6ROL724cq8tc0PQ2Fzs89rA0f59mpstzxGzhj/1G82X4AkW
	06tBYn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNyv6-0000000Dqm8-1q3k;
	Tue, 25 Nov 2025 19:41:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNyv4-0000000Dqlk-0FsJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 19:41:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6348A4011F;
	Tue, 25 Nov 2025 19:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD6CC4CEF1;
	Tue, 25 Nov 2025 19:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764099705;
	bh=q1XrjBDBdd+NI+CU1uTxO0pJaAQ+bVffaYJhhaFxauQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Ri//HlS/rWxwFVTtjDva4j/if+FF9A0+ocX/LBtvCM1iUVyYF+HV7lFyslkhQLj5h
	 bYmGkQEuFQyH7NZTbZJTCofjUJBy5wmF19PWxLnAImrsJbu6g2PaX0CB7ilcMy9oG1
	 JDnUbneEs1ePLz7svQVGE3P0hifg3R8nONn/mErdSv3z+NosCPnkaFpmZRZNYBwaW5
	 fFY+8KF/TeoZNsAb9jb+nSKTxSpQh+/dwzv/ShfUQ7VnAa9S78msCP8dzSbzVSiajv
	 IEodzobJg/S+/cdEOz8UeJUd9RbcdZ4lOsjNDROgKhs5LjOIz/51y9ymkhMvYRTIP9
	 CZsFdPcwp+4LQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vNyv0-00000008GGi-3P2p;
	Tue, 25 Nov 2025 19:41:42 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] KVM: arm64: Add endian casting to kvm_swap_s1_desc()
Date: Tue, 25 Nov 2025 19:41:37 +0000
Message-ID: <20251125194138.1097971-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, lkp@intel.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_114146_116396_B0A80C51 
X-CRM114-Status: GOOD (  10.36  )
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

Keep sparse quiet by explicitly casting endianness conversion
when swapping S1 descriptors.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511260246.JQDGsQKa-lkp@intel.com/
Fixes: c59ca4b5b0c3f ("KVM: arm64: Implement HW access flag management in stage-1 SW PTW")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index f774a02d9393b..d25fef0f66e21 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -386,11 +386,11 @@ static int kvm_swap_s1_desc(struct kvm_vcpu *vcpu, u64 pa, u64 old, u64 new,
 			    struct s1_walk_info *wi)
 {
 	if (wi->be) {
-		old = cpu_to_be64(old);
-		new = cpu_to_be64(new);
+		old = (__force u64)cpu_to_be64(old);
+		new = (__force u64)cpu_to_be64(new);
 	} else {
-		old = cpu_to_le64(old);
-		new = cpu_to_le64(new);
+		old = (__force u64)cpu_to_le64(old);
+		new = (__force u64)cpu_to_le64(new);
 	}
 
 	return __kvm_at_swap_desc(vcpu->kvm, pa, old, new);
-- 
2.47.3


