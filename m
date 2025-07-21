Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7B5C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1VbYmhgXUuSbfhRw1WciUzKalIQhkMzI/K6yxuw8ko=; b=1IzJA1DQNobHjmiR55mFk+DwYZ
	DK1j62SMt0h4AB7D1Zxh30loR49wPs1ZymV/dTQLtll9+ouTV2bqti2uH5eTAZmy6BexHbayBXKui
	AsNwkfr47qeoTf/rFBZ0zyKBes4dvwJklYOhPjYgk11rlg1BVeUoXd48TX4rnRL0f0FZVf7/hOca/
	LEr02xeY/uGqRzqIHPX1KHxPeU54Efo1tCAjSUL1YRJPWVGD0+E9JY2/19MksEJfEyEWVIy2iz7T0
	fpF6JXe3k5cfUeYsTdFMEaS/sBWZh7c62wiKydhdp+10LqG0VdauQ4H1BmCujqatjWPbWMosApsCk
	xWbNxa+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udors-0000000H7ri-2auT;
	Mon, 21 Jul 2025 11:39:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udncu-0000000Gwlw-3ov9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A10D645DDD;
	Mon, 21 Jul 2025 10:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843CAC4CEED;
	Mon, 21 Jul 2025 10:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753093208;
	bh=hpSa9Hytttj/ZwtZ6FrPhzLZMQJROeFl8J2vEUiLn7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XnoFQNwh2Fgz5KcR53GCy4ZmDpYmWnwB3lczuWDvMfRT6HQ7z8qJ660Qg8xhJYbsq
	 TFu7sW35VxlvGQpTD/VVS3m22yMPv1fmzPJmrRXvzeIGhOHRU7IevGOkkjqmcjc7Uu
	 tgE38WDqEaRklsURICOHIlJ6qVNbXzpNTugsHR+JOM1iH+yEK3Qr1vG1oFkmz2DRpQ
	 S7OlxOOXesq1jBQXYLxHWJOXSChXVXx+9LmMB5sjnGE4EI5jm8YD/j7OUiK8TU4JWr
	 Egpn4MEIE/+0NB6sdCTe/Ihm6X9nRanr2RFFBP86eKLX8jazGaVgSS2uK4E/EyNjxe
	 5SDzWwbcot9bA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1udncs-00HZDF-QJ;
	Mon, 21 Jul 2025 11:20:06 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 7/7] KVM: arm64: Make ID_AA64PFR0_EL1.RAS writable
Date: Mon, 21 Jul 2025 11:19:55 +0100
Message-Id: <20250721101955.535159-8-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250721101955.535159-1-maz@kernel.org>
References: <20250721101955.535159-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_032008_974888_E0442D2B 
X-CRM114-Status: GOOD (  10.93  )
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

Make ID_AA64PFR0_EL1.RAS writable so that we can restore a VM from
a system without RAS to a RAS-equipped machine (or disable RAS
in the guest).

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 549766d7abca8..64707c62f1cf9 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2946,7 +2946,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 		    ~(ID_AA64PFR0_EL1_AMU |
 		      ID_AA64PFR0_EL1_MPAM |
 		      ID_AA64PFR0_EL1_SVE |
-		      ID_AA64PFR0_EL1_RAS |
 		      ID_AA64PFR0_EL1_AdvSIMD |
 		      ID_AA64PFR0_EL1_FP)),
 	ID_FILTERED(ID_AA64PFR1_EL1, id_aa64pfr1_el1,
-- 
2.39.2


