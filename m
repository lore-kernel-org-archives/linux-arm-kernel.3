Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EE1D0EE1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 20:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VSJyFTQrD9zw8w1a89xtCcNxzkzfGIJqCWJx13KvRA8=; b=GAygbiCYMVO82loIXqXOv9tsnL
	QBHPHIhbguuzABYNMLZNmwZAFestv7TcH2OZBvBfGTAcXH1za1sKExxgoEJ+07VhtIXXWFahxdRNm
	oYA9syACFM6iA8/23OaaYRVUrhj5YYxwclBajeMJP/VLGFe3NbsMA666m/yU6X93n6k+FlGHzW/NU
	139zVBUhp8C/JXHA9os7SCzkzLh6Emb7rGHCHiPjMay/FUO3URrnAWN5Osu5c2OqpJI4wdR6u/De/
	eQn6eZEHlXTUR2RV9pOQjd+IVgkSd0qWsZ6vdvPfude/JuvznnRZl+pSfFi6tcgBt9ijwxWXKMW6E
	DW8JFGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzy5-0000000DvRj-0Cxn;
	Tue, 25 Nov 2025 20:48:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzy3-0000000DvRb-0WiK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 20:48:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C0B56022B;
	Tue, 25 Nov 2025 20:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0FCC4CEF1;
	Tue, 25 Nov 2025 20:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764103733;
	bh=JK/jjvYSwgAGtXn2/4YtYuj6bvcT8tHZpTXPO//omWg=;
	h=From:To:Cc:Subject:Date:From;
	b=t9mZv298Wpa5eTpRc/cfeMLeKRD7X1tEKMrtXLVf/QISI3Crlp6vonCAvSPxWQsZY
	 ro+iytmds2t16rpz2mdFFyA4Q4PJOfadM9IcZEdnyiWmGJQC3Q0oLaGlUCjVHbzq8d
	 NLxScvnNk6R8dlh9BJIpPLBiknpId/E1OGH4rpB9lKs+E9wgvABFin1JjAiASSzh6W
	 i0r+a3+6yKpu4ABehDmL8J273pok8USYQHeZc4emMz5Z+u+/r/8jub4O0qifFJjHNl
	 QZR22SlP707NVF3dA6Ghczg1rDcfZf07sz+CbJAF6zHeKqhLtE+ZkABDzVdYzowhmi
	 75GJtcxBvhz+A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vNzxz-00000008HI3-3DX2;
	Tue, 25 Nov 2025 20:48:51 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] KVM: arm64: Add endian casting to kvm_swap_s[12]_desc()
Date: Tue, 25 Nov 2025 20:48:48 +0000
Message-ID: <20251125204848.1136383-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, lkp@intel.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
when swapping S1 and S2 descriptors.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511260246.JQDGsQKa-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202511260344.9XehvH5Q-lkp@intel.com/
Fixes: c59ca4b5b0c3f ("KVM: arm64: Implement HW access flag management in stage-1 SW PTW")
Fixes: 39db933ba67f8 ("KVM: arm64: nv: Implement HW access flag management in stage-2 SW PTW")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---

Notes:
    Missed the S2 issue the first time, and only caught up with
    the robot's email.

 arch/arm64/kvm/at.c     | 8 ++++----
 arch/arm64/kvm/nested.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

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
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index c3033d1fe718c..cdeeb8f09e722 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -224,11 +224,11 @@ static int swap_guest_s2_desc(struct kvm_vcpu *vcpu, phys_addr_t pa, u64 old, u6
 			      struct s2_walk_info *wi)
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


