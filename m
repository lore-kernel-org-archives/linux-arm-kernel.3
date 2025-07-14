Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC35C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvoHwTIaoK7r5mrjI8VNIiWgdyHYsKWNsFaP+AS9bdk=; b=wkpIMEdS7BrSh4pokMxpPQgFGX
	D2DAkIc+lma6RD7ChOXrREWsKyl9EYAa1HEwfM6SBMjgbK0QWq0Qgh8SCeUTN3P9paxFqrn07dG7D
	CEp3HHBg2G7DjlzlXtlJ/1mAoB/UpEzqcMGNsWKWuIfydtw7up/Aqq2BNYt7B/VZNUMaTlYD2Ftkd
	v92M85QSd1BHTiXYEJEWfDYhu07FmlvFFB4LyaFkJ6mhcfHXmLbTy9Z0gRKFZzVpfUQkPu5rqD9oJ
	12jwQemwzFZFY4TKWQrws2+6apJHg7v/OqTgyUEF5I0xg2ffyk9f2/9zByvTYVK76lXZGGOea/tuj
	7K/xj1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIYf-00000002CKf-1r7V;
	Mon, 14 Jul 2025 12:45:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIGa-000000029il-3Kso
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 12:26:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 53C665C5DF0;
	Mon, 14 Jul 2025 12:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058B8C4CEF7;
	Mon, 14 Jul 2025 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752496004;
	bh=/vMk69jugUdux6Iyc4dtdLKZPTxMcIyoAC9mmbKItVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hT19ib0gB87CTcvOTQ4J+9fgrUgk+vestQGaCqyq/xZZYAR4lwnYqUB2IFqSMv24L
	 li3/fefTutw4HDawhjeZ8UOD6rIOHv/aHqpBwXjc00h8CoJGIFa1RlKf4zjT+pw4vr
	 0drrzucrITtmTWMtIH2E6WWa7YKZRCGe26zMle03PpeBKtHQala/PBxU0FTH2Q/rKa
	 RES+P1rBUubCQIv4Y3Dl63/d1jvNgMuvzgomg6IAxymdfRAAgyqlL0q40uVPxAipKj
	 I7zqvYQPtGTDckqC21QoiC+WUkmVVEMf84+cOn2NYLe1KI326hiYGqEIw+MxY0MFbE
	 s61ZSssSzqGcg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ubIGY-00FW7V-6t;
	Mon, 14 Jul 2025 13:26:42 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 03/11] KVM: arm64: Define constant value for ICC_SRE_EL2
Date: Mon, 14 Jul 2025 13:26:26 +0100
Message-Id: <20250714122634.3334816-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250714122634.3334816-1-maz@kernel.org>
References: <20250714122634.3334816-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_052644_922573_CCB4969F 
X-CRM114-Status: GOOD (  13.53  )
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

Move the bag of bits defining the value of ICC_SRE_EL2 to a common
spot so that it can be reused by the save/restore code.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c  | 3 +--
 arch/arm64/kvm/vgic/vgic.h | 3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index dceb4f8f242a7..6981c1b34c2c4 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -532,8 +532,7 @@ static bool access_gic_sre(struct kvm_vcpu *vcpu,
 		return ignore_write(vcpu, p);
 
 	if (p->Op1 == 4) {	/* ICC_SRE_EL2 */
-		p->regval = (ICC_SRE_EL2_ENABLE | ICC_SRE_EL2_SRE |
-			     ICC_SRE_EL1_DIB | ICC_SRE_EL1_DFB);
+		p->regval = KVM_ICC_SRE_EL2;
 	} else {		/* ICC_SRE_EL1 */
 		p->regval = vcpu->arch.vgic_cpu.vgic_v3.vgic_sre;
 	}
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 4349084cb9a6c..af4bf80b785c3 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -64,6 +64,9 @@
 				      KVM_REG_ARM_VGIC_SYSREG_CRM_MASK | \
 				      KVM_REG_ARM_VGIC_SYSREG_OP2_MASK)
 
+#define KVM_ICC_SRE_EL2		(ICC_SRE_EL2_ENABLE | ICC_SRE_EL2_SRE |	\
+				 ICC_SRE_EL1_DIB | ICC_SRE_EL1_DFB)
+
 /*
  * As per Documentation/virt/kvm/devices/arm-vgic-its.rst,
  * below macros are defined for ITS table entry encoding.
-- 
2.39.2


