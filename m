Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5740F41994
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KR+/TB9Yez6ofhLetKPMHXPveUYI+DWa2bMl6f96E4=; b=fD2cErbFgJJhER7ynVBGzeDlwf
	s9oi8DlvOp/f65zPeihnkCiDMBaVYL2t2otQJeITMAQNsnpe1PegcbsHBIWIrTE9IHYgt8SRVsq98
	Ik1y1YEM+KVioQlMXVEceWRs9WZussjW0vq83t0hZQ7uDh+csYF2zV8ST7jGiu3JT5tm1DvqcmW1B
	hq/kE7iylPnZlWXEPI/Mk4uEC3vPZqU3al/bCycj72rLh3X6NHjF6WEzH6z4ZLMst9wBHyFvAvgWT
	1ZupIycWmRYpziS31IN/RX/yBTs9M8EumkxwgJ4TQNEvVHaYGw7TF0EFetbyT6aTB4/Bxc9z4eo/V
	YnkCe56A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyrI-000000014K0-07KS;
	Wed, 15 Apr 2026 11:56:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr2-00000001478-2hic
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB35644597;
	Wed, 15 Apr 2026 11:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0545C19424;
	Wed, 15 Apr 2026 11:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254183;
	bh=sB52Lk/iyzOu++m68c6uukcJ6VfiI7VFY+ooUkIlVy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tjf4jJMnkj7a7JG2urSIAUTH8PsG6h9kbh2T1Sl7QR4mhnX1QMNh0D3+9adJm5mKm
	 +Bjr0hVgxgZ2qS/X9cHF6bXGQF4Jt5HbDDRM+LAJWwfrjNKWKl/FcYwJcdUvjfp6NT
	 U7gxHgdjWzTuKQmArxwzVrXaxLWkGWtGs85Unig7M3VjMlPBzk3wP9QvkiJaho/TZU
	 I+cGn+srl99khiJlpbSKMZ+jG1AtY/Bo+Srtkc1Pd3XZjFNlrkOhvsR+/Y6g1KLJQu
	 arLzNF8gNZoctMj4sYxGgNdwIrh85NPAyVMLDhtviXrB37OTlxx3FdiEa97Evi9qIS
	 fIyrzHk37xaRA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyqz-0000000Bqsi-3z0P;
	Wed, 15 Apr 2026 11:56:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 14/18] KVM: arm64: selftests: Improve error handling for GICv5 PPI selftest
Date: Wed, 15 Apr 2026 12:55:55 +0100
Message-ID: <20260415115559.2227718-15-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415115559.2227718-1-maz@kernel.org>
References: <20260415115559.2227718-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_045624_701856_2027D12F 
X-CRM114-Status: GOOD (  12.25  )
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

From: Sascha Bischoff <sascha.bischoff@arm.com>

Cases where the KVM_RUN ioctl returned an error were wrongly reported
as incorrect ucalls. Furthermore, potential failures when calling
KVM_IRQ_LINE were being hidden.

Improve the error handling to correctly propagate the error in both
cases.

Fixes: 0a9f38bf612b ("KVM: arm64: selftests: Introduce a minimal GICv5 PPI selftest")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_v5.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_v5.c b/tools/testing/selftests/kvm/arm64/vgic_v5.c
index 9ddd32c3665bd..49c57ea72eaa9 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_v5.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_v5.c
@@ -129,6 +129,8 @@ static void test_vgic_v5_ppis(uint32_t gic_dev_type)
 
 	while (1) {
 		ret = run_vcpu(vcpus[0]);
+		if (ret)
+			break;
 
 		switch (get_ucall(vcpus[0], &uc)) {
 		case UCALL_SYNC:
@@ -144,7 +146,7 @@ static void test_vgic_v5_ppis(uint32_t gic_dev_type)
 				irq = FIELD_PREP(KVM_ARM_IRQ_NUM_MASK, 3);
 				irq |= KVM_ARM_IRQ_TYPE_PPI << KVM_ARM_IRQ_TYPE_SHIFT;
 
-				_kvm_irq_line(v.vm, irq, level);
+				kvm_irq_line(v.vm, irq, level);
 			} else if (uc.args[1] == GUEST_CMD_IS_AWAKE) {
 				pr_info("Guest skipping WFI due to pending IRQ\n");
 			} else if (uc.args[1] == GUEST_CMD_IRQ_CDIA) {
-- 
2.47.3


