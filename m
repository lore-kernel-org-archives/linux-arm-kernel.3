Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868F5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+ZTRlttFyaaWewruQotMT+nDIsG4ZmQfRE4kexMEuU=; b=2TQlMUi/ldLosYl3a9OPItziUw
	/JLrOxtNiJn09pcw/rRvR2Mga4up14vVTDL1DD4ZDjHDUoNnuvZMLl90o3ACj39li21BwYkoPHJJI
	dsNjSFrY9kPZsZynTsCis404amitwEfJTQ9tIdNZLamStYNNQ4MzO1qqNOAj6nc2pNKFJ0bBlVcW2
	Y43HmmSEuvvaOWKu8GQXZ/nCqCifbqN9bsftvgqck1hrOp8RTaHV5069JX3qv4REvB3HKBrgF+W/T
	okkCbahwqML2kwmlzffMSrrGROKwFg/XfyKV6Fjmw0OWpiJyI7Jw/njJoqEN0a2GFkV7tg713XZ+q
	Kh3rpm0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneM-00000002LIr-2jCL;
	Thu, 09 Jul 2026 12:14:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whne2-00000002KkW-0um0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8635E3594;
	Thu,  9 Jul 2026 05:14:17 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C9A613F66F;
	Thu,  9 Jul 2026 05:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599261; bh=Ghm6oBHMgHi7cxo24LO6KnmNtDL6JAgBAoypWa5qbGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZhJXR2s8KlG09lMuc/qZr45zWuU6ehne5i9Fn579b3kLiY3+2mYtZa3HdKStylpWe
	 28V7VlWlj5wy+HMqQZBPRk3T40P7w8LI+1jKBa6uB7Na+gebpaiqFeBFljW5a+Ldyk
	 qeS4ANfczDst0SNkcVMGWHDyq07LR7DRnuUKm/B8=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com
Subject: [RFC PATCH 19/36] arm64: cpufeature: Remove system_has_prio_mask_debugging()
Date: Thu,  9 Jul 2026 13:13:16 +0100
Message-Id: <20260709121333.23507-20-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051422_331670_AF6EE670 
X-CRM114-Status: UNSURE (   6.84  )
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

Users of system_has_prio_mask_debugging() have gone, so remove it.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/cpufeature.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index a57870fa96db..95cd8d4acd26 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -821,12 +821,6 @@ static inline bool system_supports_mte(void)
 	return alternative_has_cap_unlikely(ARM64_MTE);
 }
 
-static inline bool system_has_prio_mask_debugging(void)
-{
-	return IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING) &&
-	       system_uses_irq_prio_masking();
-}
-
 static inline bool system_supports_bti(void)
 {
 	return cpus_have_final_cap(ARM64_BTI);
-- 
2.34.1


