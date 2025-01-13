Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62B8C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 18:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wDWkSKMaGREqooW9tCHlvYNwkpMqhcREqvlyssXIN0=; b=lly0h25SgImkCiiP2Gxm9spagO
	pvqdFRYnMbsHIo454hamBHuX9Zg/tLzj1IDPZD1EVDfKWAn7f+SgWYV4oqJ/4dgqdqQ6tlb3ySto2
	rh3sQMsxYiDhutlLVORqnDgs/NAPBiTRT0pMM/e2qkBDA9JnD6O5xtSCfpp2Lm46RoxN/LxKLjRp+
	JyG+ynRjyIPbg3ToZOaVe7LXrUaF2YcrZ0TDOXHR1nu7nlMSpbbBiPB86uNx97O1EQPq2BkqpRB1F
	1qgxApPEoTLHsb8D2XUxM3fFOK2zu0hI+8QiOAqxHbAriJzkiw+3bMXbyGNflTsioZkGJx7ca6MBU
	C5mVvtOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPKI-00000006EYd-1qB8;
	Mon, 13 Jan 2025 18:38:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPHh-00000006Dts-2jnr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 18:35:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A72F7A41311;
	Mon, 13 Jan 2025 18:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A55C4CEE8;
	Mon, 13 Jan 2025 18:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736793332;
	bh=iDfPCs4CoYYumxUkz5rb7H2Ak9SuzFwLEKDiaW1buB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mMrMEIQl5czcJh+YNOu0C5S8pHTIAuoLE22qcNphV1EBFsPIdACsKHGAKbp2JE0bM
	 zT2ixoTCeCqOp0kY6ZWt9XAxW52ZsLrR3gMA6gFdzOYucXzKegZyNYZ8bDLv43AHYT
	 tiAeyxVXldcm3oUx+Y0wLbImkhOhLertTLHrFosFztvqV5lTgaWO+dlqWDrgU6vXeL
	 Nk7GdzDIzl6IEFFJ4ecw03vWDm8gSCUA1UA+pq7fxqftkxDgD/vKY9f+kxp1cnJ9Ax
	 ziLEZ0966u9ImpjmEXwOTc2gFoNowhnlHwfEat+4FvwktJF2r4tkM5QgiZjEOFsmID
	 x9yyqpwPc6s/g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tXPHe-00BjrF-Sd;
	Mon, 13 Jan 2025 18:35:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [RFC PATCH 4/4] KVM: arm64: Make __vcpu_sys_reg() a pure rvalue operand
Date: Mon, 13 Jan 2025 18:35:24 +0000
Message-Id: <20250113183524.1378778-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250113183524.1378778-1-maz@kernel.org>
References: <20250113183524.1378778-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_103533_759053_78838B5C 
X-CRM114-Status: GOOD (  11.14  )
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
index c96a0c19dd108..7f2bfc2573fbd 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1088,13 +1088,13 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *, enum vcpu_sysreg, u64);
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


