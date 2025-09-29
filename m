Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47C6CCA46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSZ81Bbw+7LGCUebjT26vPdVEaBPyZdLaJTfLQGieHI=; b=ihmkrJYczxALgOqo47Jl2iR9Fh
	tLQN/qnBk9HiT1tXeMUh9mid/kOq3HA+0p1lGwDWspGXtZRF0NDkyTSlJW4M6Qc8O+hEUHvnFJnY8
	TeIP7p1anhsiv8rp8dQKnDYXrbcbMx08XU8mixO5GRzAfrxLfTQMiXJppA/hUKYEqPuO0pAzxBlg3
	CDpsU380IhwgFjmaMgQruNra2P2+Zbso16oyzBj+Ymgry19JcTSA7bhdw9f3jLWYTIZ/okrXOovyL
	TdE4FgwWxNhaECouRjXW1dHmmmm4TeySb5syqAZ4Q2WczV/izSNBy+LCRjLRmZnYH+Zp2CtGC7qKP
	IeuTJ/OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNB-00000002tyQ-1ny5;
	Mon, 29 Sep 2025 16:05:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GN9-00000002tu2-12FM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:05:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A93F8625F2;
	Mon, 29 Sep 2025 16:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A49AC4CEF4;
	Mon, 29 Sep 2025 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759161906;
	bh=+R9Ysx4E7t/BLtOfZcuyafnu20V9cRN3ygXcqoeEjbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K5H5NiDMxRsM/YeLbg3+34C6jxa+OW4eEecx9g1UYqYak28SF7Sbxx/rzBW1HQDUa
	 Q1ezLZivy3pJLL3AnX2VVGOCU+QQ7ln2Zh1tx0k92BpYNPwBzSElxInJBF9WoEQAkY
	 NCtwFm1yDXcOVBDOwKAW31ypRb7E8qNDhRWhHsS5+VdAXO/sg/0H1erbCr5rrzw3jn
	 2D1kSiVEuKptsdtU7Yg21PuAvWriOci42/gAOeqnYCCv3jDnX0GZZVeEvCkpUDHm32
	 JQJJWL/9hf8VWUg5VD+2RBTSsWnu5KuHHzLyuxEJtcRnqpb4VtFinLPgtT4x8/S8ST
	 1muI3WkPbL41g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v3GN6-0000000AHqo-1J5v;
	Mon, 29 Sep 2025 16:05:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 04/13] KVM: arm64: Make timer_set_offset() generally accessible
Date: Mon, 29 Sep 2025 17:04:48 +0100
Message-ID: <20250929160458.3351788-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929160458.3351788-1-maz@kernel.org>
References: <20250929160458.3351788-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
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

Move the timer_set_offset() helper to arm_arch_timer.h, so that it
is next to timer_get_offset(), and accessible by the rest of KVM.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c  | 10 ----------
 include/kvm/arm_arch_timer.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index c832c293676a3..27662a3a3043e 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -146,16 +146,6 @@ static void timer_set_cval(struct arch_timer_context *ctxt, u64 cval)
 	}
 }
 
-static void timer_set_offset(struct arch_timer_context *ctxt, u64 offset)
-{
-	if (!ctxt->offset.vm_offset) {
-		WARN(offset, "timer %d\n", arch_timer_ctx_index(ctxt));
-		return;
-	}
-
-	WRITE_ONCE(*ctxt->offset.vm_offset, offset);
-}
-
 u64 kvm_phys_timer_read(void)
 {
 	return timecounter->cc->read(timecounter->cc);
diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index d8e400cb2bfff..5f7f2ed8817c5 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -179,4 +179,14 @@ static inline u64 timer_get_offset(struct arch_timer_context *ctxt)
 	return offset;
 }
 
+static inline void timer_set_offset(struct arch_timer_context *ctxt, u64 offset)
+{
+	if (!ctxt->offset.vm_offset) {
+		WARN(offset, "timer %d\n", arch_timer_ctx_index(ctxt));
+		return;
+	}
+
+	WRITE_ONCE(*ctxt->offset.vm_offset, offset);
+}
+
 #endif
-- 
2.47.3


