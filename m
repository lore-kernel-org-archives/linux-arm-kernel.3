Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B20C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 17:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQNMJbiWYGixZ4+KVfGNBt46fUl3S7AjtHgErLnAUdU=; b=RG+zOwHqA3eLSQeTXPP7mLQO9/
	qOleGHgJI+iK/CEmwfHI383Oygfn/a/b7fLM3F2AgCSeiKkxh5z3oQ6ti3W5+6M7nP5CRdSzn+pMJ
	tdm0cT0dJ+17w+sy5Ph++Uo/oTLnnS/385zSIB8XeEdrP8sr6APIYXjHhA4qPO3AleU+Ni2/OhX9J
	0vw3SAUXzNANaQU5J/8aw3fkNn6yceQHWF/RDbkNucSu8XiDENZ2kTCAITUlK+9mscYyS52VTFre2
	A/ipfw1uGYiuPwzmDtxhKPa3MrIT2SrAVhUw5ZvuqnONRMIBW1LCfsrW6f6ZsfnOzPKQKcI3t9qCh
	bgx01okg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDwu-0000000A0Vm-0MM0;
	Tue, 21 Jul 2026 17:08:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDws-0000000A0Uv-2s8m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 17:08:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7192D43263;
	Tue, 21 Jul 2026 17:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549841F000E9;
	Tue, 21 Jul 2026 17:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784653686;
	bh=hQNMJbiWYGixZ4+KVfGNBt46fUl3S7AjtHgErLnAUdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Gfov7jphQSMTyEW4va5COOjgylfKumt+RH1tOylrRBV5qsRJgoXscd12OByyU4myI
	 cUUyH5qQtmMKK+JBselUe7P5h8tqyh2jhCrxq9b6aEAsD9qHfWbl7e02doDFvX3Apa
	 e1go+4j4ki53R0iNCROZG41xNPW+Ln0A9uIdB2InzuY1F4/V2t+cjsclnqu1AkAO2o
	 DPmm1paGcVqBjdRiODAAOzY8pF1R8KRXnOf+UMg9ZhHzutZ0pLvZOhrJK6O1YLTIQy
	 v0sk/CAKiK3DP4VXlmcJ1Ym1jinX1CdYkCppUXXosuHGPRoBAhTTqD/L1TyWD3LvDj
	 P2hBGoVIMtnAg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmDwq-00000007J9p-1hbM;
	Tue, 21 Jul 2026 17:08:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 1/6] KVM: arm64: vgic-v3: Make vtr_to_* helpers use architectural field symbols
Date: Tue, 21 Jul 2026 18:07:49 +0100
Message-ID: <20260721170754.3150521-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721170754.3150521-1-maz@kernel.org>
References: <20260721170754.3150521-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

vgic-v3-sr.c still contains some hardcoded constants for some of
the ICH)VTR_EL2 fields. Bring them into the modern world by using
the named symbols from the sysreg file.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vgic-v3-sr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index c4d2f1feea8b6..8da7a40ced58a 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -16,9 +16,9 @@
 
 #include "../../vgic/vgic.h"
 
-#define vtr_to_max_lr_idx(v)		((v) & 0xf)
-#define vtr_to_nr_pre_bits(v)		((((u32)(v) >> 26) & 7) + 1)
-#define vtr_to_nr_apr_regs(v)		(1 << (vtr_to_nr_pre_bits(v) - 5))
+#define vtr_to_max_lr_idx(v)		FIELD_GET(ICH_VTR_EL2_ListRegs, (v))
+#define vtr_to_nr_pre_bits(v)		(FIELD_GET(ICH_VTR_EL2_PREbits, (v)) + 1)
+#define vtr_to_nr_apr_regs(v)		BIT(vtr_to_nr_pre_bits(v) - 5)
 
 u64 __gic_v3_get_lr(unsigned int lr)
 {
-- 
2.47.3


