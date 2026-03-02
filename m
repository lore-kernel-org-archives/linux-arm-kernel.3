Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD00E9B370
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fn1MHTqifnZFgS4vtRMGGVxxAyaKLKlmo7J9hMsq0Mc=; b=wOtL/6asWNKoBJJJm5tnk8lOIP
	YsAenh4dfefX6en9W74FkMdsC9JyjZcYufhUbQ3qbFWXO8WLHnEvhaD6BORYhfZTS56oU0Tys6ozR
	b8dVXcjnkfS5/LRXuhbSwP/PWFOP2/YK901cLeHBcpz+uQFvGYllpXZ/qsQy+eJu/yFCD2+i2b7KP
	M2a/7cMlhwnly9+1YDFEHWJz392+rR1BnpBMZgaGB6069Aw7bWJRga+DftZeYBpe4bvCoB4HdOSte
	ktKi3G5/iC06jzAreJEz02jw3WP8BiFggDHSo5gqW/K1lyXGdrjO71OaLQJ7HtiW2lkDmadaFzNF0
	X+990aZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tn-0000000CsN1-3EgU;
	Mon, 02 Mar 2026 11:57:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tl-0000000CsJe-28YU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:57:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB793600C4;
	Mon,  2 Mar 2026 11:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF64C2BC86;
	Mon,  2 Mar 2026 11:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772452636;
	bh=6QMOHcncUwOcL5HADPQFuLPwDpOhb5X4dCv7+gTCwSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FozNS7gXtLu4xwHbGJsJ/tLrE9iGYPi93ecz01D5jzemyXAOEF4KhMVkjKxcerlYG
	 XzTm+NqLPukHTvukllqBg2k1Cla/KYsQdjlZnfo4hqCu0q2Dlf3LIbkViyBwnAuNR0
	 acdIofoeXw/xV2F6h64eXfUyDIc37efeTIP26j32HMnEBDmRJU1nwN36vj1y1KbPZO
	 cENAyvoNG5dDBiSdkaK5GMnNT9H//p81rp7Ngal5tvbfdC68tKuS8CHzqY5UKSXNa7
	 +yTKI4ORDlHcvmLHbUYeSzs8c1Qndv0oKdFaf86GMjihKjGlwmHKspq7gfB8ons7kc
	 Ip0iCLGTForNQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vx1ti-0000000FDFJ-3iff;
	Mon, 02 Mar 2026 11:57:14 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 09/11] arm64: Convert CONFIG_ARM64_POE to FTR_CONFIG()
Date: Mon,  2 Mar 2026 11:56:50 +0000
Message-ID: <20260302115653.1517326-10-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302115653.1517326-1-maz@kernel.org>
References: <20260302115653.1517326-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

While CONFIG_ARM64_POE=n prevents userspace from using S1POE,
the sanitised ID registers still advertise the feature.

Make it clear that nothing in the kernel should rely on this by
marking the feature as hidden for all when CONFIG_ARM64_POE=n.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index a56d242fe1489..1af5f5b0c48a7 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -504,7 +504,7 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr2[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64mmfr3[] = {
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_POE),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_POE, VISIBLE, ALL_HIDDEN),
 		       FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR3_EL1_S1POE_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR3_EL1_S1PIE_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR3_EL1_SCTLRX_SHIFT, 4, 0),
-- 
2.47.3


