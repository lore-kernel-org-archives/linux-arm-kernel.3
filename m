Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594BCC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQNMJbiWYGixZ4+KVfGNBt46fUl3S7AjtHgErLnAUdU=; b=S90KYMDyaQPI5gqFx44n18JD/o
	mkvuiaqQzjfjrYGBCFll588XGXTSdjinYWanvnXwbKawwDTzR4XpJ3v8zEvli10AmpgntBNIy2f//
	LssW43qP7Pqsan6jJRLMwzHmmZy+5mMuIN8JfIhZz3skFw/6Ijg5UCkTJZjzTwl8DDPlNRuGBea1B
	iMtoJnTjxtbmoFoeaGVksyine6zuS7Poi9LgnGxoFNSMRaz00cOVUSOMOTvU2nqC1zqJAOvjv864F
	AjmfhCxZZxiRMC+hUsJmSE8Em4Iwh8ezLAeVEhDOHJiRI+3Bx/xoLWVI0SpjL0xVEdyClppzVf4zG
	UpXosT9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnxC-00000006mpG-32GJ;
	Mon, 20 Jul 2026 13:22:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnxB-00000006mnv-2kzR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:22:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 207D860A84;
	Mon, 20 Jul 2026 13:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4E51F00A3A;
	Mon, 20 Jul 2026 13:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553760;
	bh=hQNMJbiWYGixZ4+KVfGNBt46fUl3S7AjtHgErLnAUdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XVnf0cyg+hYKUTj2sszHBsxX/lXtrPV/+1GFW11N6hwXu35zduAYufbqJa+zbpSja
	 wHGss1vWCHEdJSAlsA6pdp6io0OsDseeDbBvVA21Voyf6qUC2bfUPwTY1+8YNbhvmv
	 bWzanGUWSxUQZWyjwlGT6NA4KHZd6FdUWQ9CHBU4+0Jqzg238/rigl68aiGrbwaTBB
	 gW1A42RmIi7LlxSs3nUu+BXFhgB2y506scZ/NENj2LlSv/bcSIMHbpPQRu4tM0DA7P
	 gV+C8l74/DlIJ/A/Mz0XT3EU5JNyInCpR/jlnHSo6TePo9olNSTCVnBdFXXhvxRzlF
	 SU3l5eteph8IQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wlnx8-00000006oKK-2vCP;
	Mon, 20 Jul 2026 13:22:38 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 1/5] KVM: arm64: vgic-v3: Make vtr_to_* helpers use architectural field symbols
Date: Mon, 20 Jul 2026 14:22:15 +0100
Message-ID: <20260720132220.2143486-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260720132220.2143486-1-maz@kernel.org>
References: <20260720132220.2143486-1-maz@kernel.org>
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


