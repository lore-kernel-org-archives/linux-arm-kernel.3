Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E615C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77oi9lqhFhaRcjE8+3d7j7EJvGUZJl9yis2gt0lJHQk=; b=Lg+iXBX8Qg+HzI7nvPXOxjgDlP
	QQIi1il+Ka4BjIi92KGtoRz82rAi+Ab1BYPYjZgSX+anpuB//uPpD2XlMzXojJgJHpnUJ8yzN5wkn
	+QsOBZSmWP+y/ytclW4h9WbvZF+dWcP2tlExt5TIuCrbwTmeE26C//85lrwKu3P2j70E5LPgjyToB
	NZVp2CTtu4lpmFsa4AOmi1RZ71X1ts7ISMyNDhHhesq5cMQos6VWsgpRaFdkr7kvRBN0DAHAux/m+
	N4RCeGmfQaWYGyjGFF9fbWig5f1pf6M1kor6cck/eCzMzrmQhP5dUG64DuvCI079TRDRhuSauRg/y
	h0Ny3Y/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERbR-00000009HnA-0f2X;
	Mon, 12 May 2025 11:45:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERXN-00000009H6y-0rDt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 11:41:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCBB11515;
	Mon, 12 May 2025 04:41:25 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 64C8A3F5A1;
	Mon, 12 May 2025 04:41:34 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	pbonzini@redhat.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: james.morse@arm.com,
	Ben Horgan <ben.horgan@arm.com>
Subject: [RFC PATCH v2 1/3] arm64/sysreg: Expose MTE_frac so that it is visible to KVM
Date: Mon, 12 May 2025 12:41:10 +0100
Message-ID: <20250512114112.359087-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512114112.359087-1-ben.horgan@arm.com>
References: <20250512114112.359087-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_044137_284432_11D1BFC2 
X-CRM114-Status: GOOD (  10.25  )
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

KVM exposes the sanitised ID registers to guests. Currently these ignore
the ID_AA64PFR1_EL1.MTE_frac field, meaning guests always see a value of
zero.

This is a problem for platforms without the MTE_ASYNC feature where
ID_AA64PFR1_EL1.MTE==0x2 and ID_AA64PFR1_EL1.MTE_frac==0xf. KVM forces
MTE_frac to zero, meaning the guest believes MTE_ASYNC is supported, when
no async fault will ever occur.

Before KVM can fix this, the architecture needs to sanitise the ID
register field for MTE_frac.

Linux itself does not use MTE_frac field and just assumes MTE async faults
can be generated if MTE is supported.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 arch/arm64/kernel/cpufeature.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9c4d6d552b25..e952f4b07ce1 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -298,6 +298,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
 static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_GCS),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_GCS_SHIFT, 4, 0),
+	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MTE_frac_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SME),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_SME_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MPAM_frac_SHIFT, 4, 0),
-- 
2.43.0


