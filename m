Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C91C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 23:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nW2uwG3VWmqTYBYq5oWNcIeaMFqReX/mfTA7yT0Lz8Q=; b=x+mFNuI9BHpGj5zvF1X+8LbO2t
	VzOzna5gzh+JWqxn/gLo6gJIrkKVAQp20Y719EStIVTfx3PfarefbG82lR0V+R+YXtGqQPRoePQ6O
	2fFawDlpYdVypixDC5zoe7NyQWAOnlhk75d23Pztu4+iBwGgdgW+y9RUIS5QiWE0KTzBa/7JHxV/1
	sl7X2+rWhXlQnvuP2wv5F/Jy47L9QDmkiEfXsFSQbdwtlw4Ylb25UyZ3WKAtAfbp1VdYHHUaCJkSq
	HzbT6IJw8GdJxqRr77WfKwMt8yLBw5SjlPUmq/cmLoQj+THKiqU8jx787oZnJ9WJ+RwBt1vdJhQC0
	97pjEt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1rW-00000000fNs-1AdG;
	Mon, 03 Aug 2026 23:14:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1rU-00000000fKt-0s1Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 23:14:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A1AD660A67;
	Mon,  3 Aug 2026 23:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9651F000E9;
	Mon,  3 Aug 2026 23:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785798863;
	bh=nW2uwG3VWmqTYBYq5oWNcIeaMFqReX/mfTA7yT0Lz8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UUJfR+7IHMsqGfyZM1V72vBi6n1cTfpx09aKjJy1cews2EQ8MJzTECoyN49Qxb4w8
	 LeZ2AC0vfl8Laqclee/QDXA70OWPOLviLGywYHxWiLminr8YW4ZXlUVYNsyUyHDz8J
	 HxJboeTNvZhMNEFFYSwBBQJoPgkE+jXjVgDPDYmPAIop8CnLs64U+BxTUNv9X0hkUu
	 G5c5PDTJnVe0ufNCdfsaH8dwfIpBNGazQFYB7yo6t9NWSx8tE5gffpNHk2QyDy5s8H
	 Opop/pl/a2n49NWVH+1wyFAL0ruVbZPoOOjKwyXFnXlVHLs8bmrMezCW0Q9hFkMO5i
	 XXjDONKXU9IFQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 03 Aug 2026 23:56:57 +0100
Subject: [PATCH v18 12/14] KVM: selftests: arm64: Only restore SPSR_EL1 and
 ELR_EL1 if they change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm64-gcs-v18-12-fd8c40f5ad88@kernel.org>
References: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
In-Reply-To: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kq5inm4XLV9y3q0emrqMvgSlwP7yu7PrdQSzkYGOWPo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcSCjvNz7/djhQRkSZti3j2aUYjpk2yW/YBJMi
 OsYTqXIpiGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanEgowAKCRAk1otyXVSH
 0NdXB/4pR/GcsXnAvSiiTy8IGiyTvuwng5ZpqiFk+rDDrfer18Mw/vryphyfqsiI7x5uutZ/Ol9
 oQBe4HbT+LsmZmA95XxaOcsDnjhfgttYBU4XgOFBNXsed/7xYxODbku9jPDD9a+2IxThVulLW1u
 ty9GLeB1u9o3iwfljQwg5T5M8AUKlzovEpYiYXVUA3eO15DQxjE3mCvp6Xqx4xuh1pH6ejzdk/o
 +6+q+wEnC//QForuKEjDuZ7h/aOrD2cvLe1eMbxGoULioE2Qpr87cqF4FPvTwrZ1QeZ1+vzr3KQ
 LnGk6EA4pmi5CekhtSXkuHcNUf0b3ErDHYCSauYHZsfNPU5u
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

When EXLOCK is enabled for ELx writes to SPSR_ELx and ELR_ELx generate
GCS exceptions. Currently the selftest helpers unconditionally reload the
saved values for these registers regardless of if the handler didn't change
them. This gets in the way of EXLOCK testing, making it hard to generate
contexts which will generate an invalid ERET since we never get as far as
doing an exception return while EXLOCK is enabled.

In order to facilitate testing of nested virtualisation emulation of EXLOCK
change our reloads into read/modify/write cycles, suppressing the writes
when they would not change the value in the register.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/lib/arm64/handlers.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/arm64/handlers.S b/tools/testing/selftests/kvm/lib/arm64/handlers.S
index 0e443eadfac6..367c22d61cba 100644
--- a/tools/testing/selftests/kvm/lib/arm64/handlers.S
+++ b/tools/testing/selftests/kvm/lib/arm64/handlers.S
@@ -33,8 +33,18 @@
 
 .macro restore_registers
 	ldp	x1, x2, [sp, #16 * 16] /* PC, PSTATE */
+
+	/* Suppress redundant writes to support GCS exception lock testing */
+	mrs	x3, elr_el1
+	cmp	x1, x3
+	beq	.Lskip_elr_\@
 	msr	elr_el1, x1
+.Lskip_elr_\@:
+	mrs	x3, spsr_el1
+	cmp	x2, x3
+	beq	.Lskip_spsr_\@
 	msr	spsr_el1, x2
+.Lskip_spsr_\@:
 
 	/* sp is not restored */
 	ldp	x30, xzr, [sp, #16 * 15] /* x30, SP */

-- 
2.47.3


