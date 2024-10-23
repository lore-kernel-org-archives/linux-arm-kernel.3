Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57091CFA441
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IXYT/q9RNLymB2esqo0NvRZeHISaCOKoU/Zw8hUJYs=; b=1GzFKfmpgvjTVvuoNxrZTzThwy
	7sb0dXWpH5PFOZ/b+ISF/8XmY7GxXr3B90v/6elqyJ3BIFlKVtQiOHxtKPbAvAdXf+Y7fMXtLt0GW
	/7m3G+0agyu0ja/7qmWm/kPmLD+l87bHg8i5nw66HV3LWSYJ1I2DSwN7zQyZ+7ltlCyJt8aMvcRpE
	keUHcuNQaH2RnPqCkPCTf2iO5I9l8i9JuRQVLph2BM9fa5r6WL5ttCs9NbsXFgSsn04Ykf4KC75TC
	0o1hM2yXYOV6msIYgF/OF3WdgciqIHSFke7PsiUtbZSOvCjcD+fF1gFcta59BQDJCBMGWniCn96AJ
	2vAAH2xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dNR-0000000Eyht-1mlE;
	Wed, 23 Oct 2024 15:34:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckP-0000000EpR4-2F0f
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 14:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6IXYT/q9RNLymB2esqo0NvRZeHISaCOKoU/Zw8hUJYs=; b=EhXfgkLcRrp2Dbk/78TLe0rp0z
	5CJxzg4AIC1emBI/Hl2ZCU3W6bsERJi/ewtyDOtGNaMxxQy+TZMi26w7FK7dtl6FEsLQLw134VIOC
	Ylk4YmPAAdGXTx4Y3Embhypzbb9LJ3zCqEJJ0QLUFXfe0X3XZ/UI3CRACtFiPh7432EIB0WziKCh7
	pjr4LV1HsPUND4+xOyPx0Z7wJB+mkA28TztnFGWJPw7k5Wr+LkJheApiCucafWVczYFy+D6j0ylbc
	Fp9PQzUQ4SQpx/C8zkdaCet7mlpdeiRjXRD2qr0OHWl2uEVZ4V0OWD92xanh78KVV7DDxgm0OunaH
	2x4S11rw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckL-00000008QdJ-3tKa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A8199A45042;
	Wed, 23 Oct 2024 14:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0DB0C4CEC6;
	Wed, 23 Oct 2024 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695235;
	bh=dHJ3KFc8Fd9R8bqsS2a+yer53TbR/Cd03c/AD97edWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o11ddARJDnLBeEjJG+CyPpObqIDDpR0vqcQ4FGr/pdC+izcd9Dpas5K0cL6KayFx3
	 LyifpRU+qUeju5SN612Akgc5qw4LmSAYw5gE0MNdZuiwB9vZz8hqsEhO1YTPIO2YAY
	 jLQxcm5lSfsIumrkD3yOnl3Ha5oXaMJotq1LuXhX8wR9bZ8jlCwQgTFk0ZZInFCYNK
	 uxvp00wI3aY4s8/3XsjLTii0FD7ak7xLPVh9edJq0/vVuXv/8PIfSSR2Spl2yI5nDa
	 wq3S5QcpFbtgFJ1gX8FDpCQsU4CyqTpjA+KLbMRgjZGgU0nGHKHed13EOGggd+BPJE
	 Syr7eOkHWnYUg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckE-0068vz-1v;
	Wed, 23 Oct 2024 15:53:54 +0100
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
Subject: [PATCH v5 22/37] KVM: arm64: Add a composite EL2 visibility helper
Date: Wed, 23 Oct 2024 15:53:30 +0100
Message-Id: <20241023145345.1613824-23-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20241023_155402_276118_96CADA85 
X-CRM114-Status: GOOD (  12.05  )
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

We are starting to have a bunch of visibility helpers checking
for EL2 + something else, and we are going to add more.

Simplify things somehow by introducing a helper that implement
extractly that by taking a visibility helper as a parameter,
and convert the existing ones to that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c9638541c0994..dfbfae40c53c5 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2296,16 +2296,18 @@ static u64 reset_hcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 	return __vcpu_sys_reg(vcpu, r->reg) = val;
 }
 
+static unsigned int __el2_visibility(const struct kvm_vcpu *vcpu,
+				     const struct sys_reg_desc *rd,
+				     unsigned int (*fn)(const struct kvm_vcpu *,
+							const struct sys_reg_desc *))
+{
+	return el2_visibility(vcpu, rd) ?: fn(vcpu, rd);
+}
+
 static unsigned int sve_el2_visibility(const struct kvm_vcpu *vcpu,
 				       const struct sys_reg_desc *rd)
 {
-	unsigned int r;
-
-	r = el2_visibility(vcpu, rd);
-	if (r)
-		return r;
-
-	return sve_visibility(vcpu, rd);
+	return __el2_visibility(vcpu, rd, sve_visibility);
 }
 
 static bool access_zcr_el2(struct kvm_vcpu *vcpu,
-- 
2.39.2


