Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ECCCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6F5AltN2PaZJFgZ1Qy/IqUyWkgsBB7MOGVwDpftwzA=; b=LVPNApiN7Wu8O7aAtF8Y+DdfaF
	Ck1EVdtFXcNWXtxlQckL7+tSsNbW2pAljkaRinkU4UF98hVqygJkLmg58fgieVQnzp2NS7ZvUM3Sg
	aBeWptkD1bxrhSSNUq5MtJMUU+PMXTDJgOLCXbQUAgXkloMt1STfGv9Ea7Am/hMNiG4dfNIZ5xBVV
	Yxq6DA99YVaUzOksXFRl50CqCbMuZkZ/0gbKOuhcfk/K1F6IvNOFABDn5QNZF5XIrvaONb6pjaV5l
	kO1b9TTjtfKaoPEmP4wNSHhHOm4SOeqdIYdKi6bI3o9FlprgKOHt9BLRwWg2Xkm32ZHEOjHSzSTWs
	doPXZ5Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURS2-0000000DNAk-1Dgo;
	Tue, 02 Jun 2026 15:54:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURRy-0000000DN8j-3inJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 15:54:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E96C642BBA;
	Tue,  2 Jun 2026 15:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDE51F00898;
	Tue,  2 Jun 2026 15:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780415681;
	bh=g6F5AltN2PaZJFgZ1Qy/IqUyWkgsBB7MOGVwDpftwzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jq98lp5R4Wne4GQFBsJlJ9/JUnApw+k8nJ5cFtNGtTsPRL5DdWkYymrDAAmKgzv63
	 6Z3klmZvuNuNoJ3o3S1t49kslZJ6OaX7iL8rnZ1kxR2LZAEc6MtAJ6KuWwJ6THjnsY
	 cVSEHvCnMFnyCciT8gUC+pVEtBF7gGVzkgWUD4+tMZfabg79fa5CIurvaTRBTDIJNP
	 FWQPdbquM/GIReZwwmePZsJHW1zpkFHnyQrYTIk8D+qEy28h06XjmeRAur3kjHZpgl
	 CCnrZFhNTDusRgdosMnvbMaVYqPgFAJmuLrCUznx7Rd8u1WHI7VNmQk2bAZd1hWRm+
	 pH6rCPjOdMvhg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wURRw-00000008fVv-0EHR;
	Tue, 02 Jun 2026 15:54:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 1/3] KVM: arm64: Key CPTR_EL2.E0POE propagation on FEAT_S1POE
Date: Tue,  2 Jun 2026 16:54:27 +0100
Message-ID: <20260602155430.2088142-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260602155430.2088142-1-maz@kernel.org>
References: <20260602155430.2088142-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_085442_949753_9672F9E7 
X-CRM114-Status: GOOD (  12.14  )
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

We propagate CPTR_EL2.E0POE from a L1 into the L0 configuration, but
we key this on the L1 guest supporting FEAT_S2POE. This is obviously
wrong, as this bit is solely concerned with Stage-1 translation.

Fix this by making the update depend on FEAT_S1POE.

Fixes: cd931bd6093cb ("KVM: arm64: nv: Add additional trap setup for CPTR_EL2")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index bf0eb5e434274..161bb2a3e1d90 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -141,7 +141,7 @@ static inline void __activate_cptr_traps_vhe(struct kvm_vcpu *vcpu)
 	if (!(SYS_FIELD_GET(CPACR_EL1, ZEN, cptr) & BIT(0)))
 		val &= ~CPACR_EL1_ZEN;
 
-	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S2POE, IMP))
+	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S1POE, IMP))
 		val |= cptr & CPACR_EL1_E0POE;
 
 	val |= cptr & CPTR_EL2_TCPAC;
-- 
2.47.3


