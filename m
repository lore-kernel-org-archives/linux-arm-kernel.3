Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB48CFA445
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAtXtESvIXkfsrHCqCJVJ6R/JnMF3OyusgtfB0NE3Xk=; b=Alk3KZ8WchoZP1sPzh2yTLAKVY
	GEXO5BpD6TLXJmKlT5sE8YOqLt5HtrBk8AqtgjfyzS5ZTgFJqXvxYBKsO32xVoXyFefNe6ptgu8P2
	HwlScq2lWRNXnRGsYIhHnZ+fpHkX8TZT9HLJGXSIlyTq7yARTGv/rl0ZXFSEhQCnfi1B8251iaAYO
	9OHYgFZLZIU0LrWw4O+4peIIAQwp572TSlmpfweJmVPkYeTO5KggJa3475EeXLfzpqInZVXZ3W6NR
	VRtx6zmrGIUWBsd/eA9fHHvVnIRzjTmHG/AdOidowO7wPPRtwGNTUXgJfCS7dOHJ3I93MRbmGUEdc
	Qqhk9LbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dXx-0000000F12p-2jQa;
	Wed, 23 Oct 2024 15:45:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckR-0000000EpSA-1A4h
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 14:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DAtXtESvIXkfsrHCqCJVJ6R/JnMF3OyusgtfB0NE3Xk=; b=iJIxi+uPsZEn/RzFLdVH24G/Wh
	wk/PMWtB9Hp4LQUSJBFocmUDhVBxhAhZMlDz+rsKZyfzuYvnynW9gGQxB5q01N2bH41rDWhhvqEiK
	11hIEzwynSTYYMAF03meMoxb3aKhrIveNPiSLmGHmw8EWNy5o1q7iRVfli2H/zLE6LiDyi24zn77u
	ZS6+zq56elOoFfE+9o/yht30Wv356Lu9l7ByilYLhHlLlPx6NCqCT3LcGUSm+khovhk1nu3LGYdPA
	k1EXmR2Y7g4hg9n90Xp/t007oEUHNF2UQW+TzZf0QYioFy6a6a3pbTpMCUw9Q/0qfdYMnzbTaYJp8
	4CFtRxLw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckN-00000008Qef-3J6y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CD9B0A4504D;
	Wed, 23 Oct 2024 14:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6990C4CEE8;
	Wed, 23 Oct 2024 14:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695237;
	bh=3G1xYA34SHjfXANtSC9yiL8s0uLe55QVekkzGzfYn3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qt2si3RrI4YYz9q84umz4H8ioLRDqFVL5HfTd/xxv4Zgt9RvP4ElsPNFGvIjWLb9E
	 bemajTQ9FS4edYbvXamE0Qg7ImZyVUUu7r8UiWHxfQLGTsRknXKkw8lzOm40ldSqNS
	 lPSF8zPO5/AjB6nWuKNp2yvwZjXujrtaGh7TttjUny7IJMzC6na6/Q+zFE/fsRYpJq
	 wN1udVW4Z71xH7dFrLJ2DOn8jvhlVX16PmDVcm8Fgamhc2BgrFc+eqZKOUYg3ev+IC
	 nhUdyuy0CdlE2bHZQ9G0EAmHZFdGsdKPc4aVcIXAAbTphqugI9r1o5anuq68MOiKx4
	 bwR+PsR20Pn2Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckG-0068vz-4n;
	Wed, 23 Oct 2024 15:53:56 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 32/37] KVM: arm64: Add save/restore support for POR_EL2
Date: Wed, 23 Oct 2024 15:53:40 +0100
Message-Id: <20241023145345.1613824-33-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_155404_289469_B4EBDE95 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

POR_EL2 needs saving when the guest is VHE, and restoring in
any case.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index a603966726f65..5f78a39053a79 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -58,6 +58,9 @@ static void __sysreg_save_vel2_state(struct kvm_vcpu *vcpu)
 				__vcpu_sys_reg(vcpu, PIRE0_EL2) = read_sysreg_el1(SYS_PIRE0);
 				__vcpu_sys_reg(vcpu, PIR_EL2) = read_sysreg_el1(SYS_PIR);
 			}
+
+			if (ctxt_has_s1poe(&vcpu->arch.ctxt))
+				__vcpu_sys_reg(vcpu, POR_EL2) = read_sysreg_el1(SYS_POR);
 		}
 
 		/*
@@ -123,6 +126,9 @@ static void __sysreg_restore_vel2_state(struct kvm_vcpu *vcpu)
 			write_sysreg_el1(__vcpu_sys_reg(vcpu, PIR_EL2), SYS_PIR);
 			write_sysreg_el1(__vcpu_sys_reg(vcpu, PIRE0_EL2), SYS_PIRE0);
 		}
+
+		if (ctxt_has_s1poe(&vcpu->arch.ctxt))
+			write_sysreg_el1(__vcpu_sys_reg(vcpu, POR_EL2), SYS_POR);
 	}
 
 	write_sysreg_el1(__vcpu_sys_reg(vcpu, ESR_EL2),		SYS_ESR);
-- 
2.39.2


