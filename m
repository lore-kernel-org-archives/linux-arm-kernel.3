Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45155C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 07:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ta7LfnKu0JVMCRvQ13ydQKE08jzT9C56DwSedw5ZmA=; b=z8GQzI+fTha6bTFEDi5JQ1MlMG
	y4Xp6yvCfzbmJnf4JPsRzS6C89ZZjPpK02Vpu6qEpN0ctGhBr5JpRUlznN3mv2pyYEmPohMkmKF7b
	IfL1e8YadrSagNpBlpEy5Mgof/Vy/1NeKjnr2SmLAPma7upq4MaCgP2qn3iN06WKuSlCEgPGos9Tg
	jx3rgAyxGz52MEokSv69mzRujO0x8tSFwVo4gxyofSY3BuepZkyTSqAprFgT61EHcnkEAlnWVXlZW
	d8zph2tERKGEK0fkEfNRhDOp0syNDE8V1kE1UD+OrSlnz9VJ2oShViYMC8U3el5ANi/QGphUtKE14
	38MG0mog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMLru-0000000A60u-3RqK;
	Tue, 03 Jun 2025 07:15:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMLlM-0000000A4G7-1oAH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 07:08:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F19054A643;
	Tue,  3 Jun 2025 07:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE42FC4CEF3;
	Tue,  3 Jun 2025 07:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748934523;
	bh=K/RtzbQ+b7dH8ZrEJdeD2NQuerIL9r6Cxc/FT5nhyEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZHeMJ/WQsfvNjiBObMaqQKbveVze3OVotUDM2xxNQ605ImX/SjtN+cMCZwDmRGRpg
	 VYF3I4Q9Dby8zBTB364ppewvAWhmaXGp0BhBhRrXaQFx20ltvq+ttSdQWnbGeLlk3R
	 3hNhlAobqz+FgtxKUGTw23YQq3p5HR0rzaedOznouE3hFzCXM1H2szRF0c0d1ii4RI
	 Z+ZqhrStoNlErca/lTUr0ME1aD1JTNyMCxzmWqm8S58GZhF992PI8jKieQNC8CNE/c
	 VeaXKjtSoXDIF2BlzCbD1e6si5uGGvYW+tmhUz1dTqwyHpyIbm0tbdOGT0e/JJ9PE9
	 /l/3oRo8qP3Ow==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uMLlJ-002isr-TL;
	Tue, 03 Jun 2025 08:08:41 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 4/4] KVM: arm64: Make __vcpu_sys_reg() a pure rvalue operand
Date: Tue,  3 Jun 2025 08:08:24 +0100
Message-Id: <20250603070824.1192795-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250603070824.1192795-1-maz@kernel.org>
References: <20250603070824.1192795-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_000844_493213_18D315F9 
X-CRM114-Status: GOOD (  11.93  )
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

Now that we don't have any use of __vcpu_sys_reg() as a lvalue,
remove the in-place update, and directly return the sanitised
value.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index c361f8aa16c90..b4ac2f515f94f 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1129,13 +1129,13 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *, enum vcpu_sysreg, u64);
 	} while (0)
 
 #define __vcpu_sys_reg(v,r)						\
-	(*({								\
+	({								\
 		const struct kvm_cpu_context *ctxt = &(v)->arch.ctxt;	\
-		u64 *__r = __ctxt_sys_reg(ctxt, (r));			\
+		u64 __v = ctxt_sys_reg(ctxt, (r));			\
 		if (vcpu_has_nv((v)) && (r) >= __SANITISED_REG_START__)	\
-			*__r = kvm_vcpu_apply_reg_masks((v), (r), *__r);\
-		__r;							\
-	}))
+			__v = kvm_vcpu_apply_reg_masks((v), (r), __v);	\
+		__v;							\
+	})
 
 u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg);
 void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg);
-- 
2.39.2


