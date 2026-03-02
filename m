Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1256E9B36D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ET1j7rjWF3mdgoGf5vpvpdnMH7Vdh8sdsRMOO/A75m4=; b=BGxQXke8siY8p/moCVf1aC7kZs
	YztW9CbPKnP9JnHI8WG7kpi2wGK1/JEaB9AEpfZgLd988dICSswRh6kQFfexzULayoy937EfluTC0
	z5loDpQMu+TgbAwWeBmbU9EThfW9tNjQK2Bn8Y0U2N7pw5uG6Frrwwx4xMusaBb6nmr5mxfumXUCK
	Kk4lhfm2PieTuhLKc8Xvy/Y7TdQvMg59mourzBRNA+93xQ73N/Sb9yKYS1QOi9fKMWSYdAdK2ieBC
	JyOIZstUb01fwbk4Lo8u35VRz1JexbR44pkdP7+hi539ccYY3KWF1D5ECNAzKhCBl6l2i11HiISgz
	YFb/HiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tl-0000000CsJp-1nuN;
	Mon, 02 Mar 2026 11:57:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tk-0000000CsID-0lqc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:57:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 515F060051;
	Mon,  2 Mar 2026 11:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFA4C2BC86;
	Mon,  2 Mar 2026 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772452635;
	bh=XYv2uFoCScsWY4QYL23fib7a+k78PtSH2Bqah2U4qNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s+oRTm/38BZES5QNRLH3fG9evg+VNxa5AvoUru8iuxu2hhxUFF6AWHo0x1LmMpel7
	 I5lQ4sQs5Veyh+uSJVkOW4vdnpKuytDq7NoZwH+FBiT46IYv32SDyEEPGsJ1+AP/24
	 FooeLWS5Mu2X9ZaJf5oG/+boZt32AT87z0TbWogRe18lwKRihnE5Lsk+GSmuVB3Dat
	 h/3AQ2AQiPN2oEj1BAUg0liT/cf5g2ElDse/w7cbXAr8ZUfZHlOV0e+6eRHTVOieRP
	 riJ+K+d48O9FQi/+GWGgGoKcndRRyQzwu/+s28KXHuxRP8yCR+VsLQ07XLcKFlJ1K6
	 gwoSsD38w5vbQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vx1th-0000000FDFJ-0OkR;
	Mon, 02 Mar 2026 11:57:13 +0000
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
Subject: [PATCH v2 01/11] arm64: Skip update of an idreg field affected by an override
Date: Mon,  2 Mar 2026 11:56:42 +0000
Message-ID: <20260302115653.1517326-2-maz@kernel.org>
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

When computing the new value od an idreg that contains a field
affected by an override, do not update that particular field.

The value computed at init-time must be kept as-is, as that's
what the user has asked for, for better or worse.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c31f8e17732a3..28fc77443ccd3 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1224,6 +1224,13 @@ static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
 		s64 ftr_cur = arm64_ftr_value(ftrp, reg->sys_val);
 		s64 ftr_new = arm64_ftr_value(ftrp, new);
 
+		/*
+		 * Don't alter the initial value that has been forced
+		 * by an override.
+		 */
+		if ((reg->override->mask & arm64_ftr_mask(ftrp)) == arm64_ftr_mask(ftrp))
+			continue;
+
 		if (ftr_cur == ftr_new)
 			continue;
 		/* Find a safe value */
-- 
2.47.3


