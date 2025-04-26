Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15863C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 12:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlCdume0repBDbTxGETbd8epx1r1hZUoZq3x1vUJEm0=; b=ha9N9deXCDjEp51zYSFOyKArEJ
	viar44abbVHbo+n2GTHIWcBm2wAQoDbHTxRIP3EJcBzyvT6aZAdul8Ci6DAAxljnd9U1UWb/v2G3X
	7bXzEHNpSSVP1osmKjpuzb3OBdVcOskPI7I8g7LviOxrVq8Ao6XuneaMIReS/EcNcOz/j6Y+I6UfL
	ndcMUCD7cP6pplS0B7JgIS/RZptpryQt2yS+dFPO4Ts8T389Vj478MrRyOzewI9RuQoDinSObGKzo
	PSFlkts/9MxZMHzEqWIzyGR2pARGduNLFp/AFHVNpLc9LXV40gkwOleSmnlDXhzlmo6tAaD3D0IVO
	f6t9dFew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8f2J-00000002260-3UaM;
	Sat, 26 Apr 2025 12:53:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeO-00000001z2c-1OkR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:28:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF9DF6845F;
	Sat, 26 Apr 2025 12:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E3AC4CEE2;
	Sat, 26 Apr 2025 12:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670535;
	bh=LyW63IDsD513vLKhwXs5Pn8n+SMo4tx9SsM1UwXEgds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=skrm/nPLn0PQ/PM54fKmf4ip7NCwd6aKMS8MilFQsifLLZcpe2EI+fOi7X/ywoOPc
	 Sg3iYTf+pzsnoAqftWStJXScPBLZdo86YqzlumWxT0uNJGq0RLj5RQXyz9mWdzk9Zo
	 wH2BZPstgB23/6XrT64vzq250byd5bXbIyJ9AUWFhtV6gmchsmDlSKgcn21tvxnm2B
	 6157kIBNSuQ7Mb+AeKUeUEg3ifY6Oq4Rv0tmkJJqbqkzXsKR0C6Wh/Zv6DIhjMEhZ5
	 xZvr9zCqh+W8DT7AW30UA7nxx3Ohjcx8KZCSUZvf5gy/EJ1BOy08MEZXea6/9ivJoI
	 4V8GEncjga8mQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeL-0092VH-HV;
	Sat, 26 Apr 2025 13:28:53 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 18/42] KVM: arm64: Restrict ACCDATA_EL1 undef to FEAT_ST64_ACCDATA being disabled
Date: Sat, 26 Apr 2025 13:28:12 +0100
Message-Id: <20250426122836.3341523-19-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
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

We currently unconditionally make ACCDATA_EL1 accesses UNDEF.

As we are about to support it, restrict the UNDEF behaviour to cases
where FEAT_ST64_ACCDATA is not exposed to the guest.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 6e01b06bedcae..ce347ddb6fae0 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5150,10 +5150,12 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 	kvm->arch.fgu[HFGRTR_GROUP] = (HFGRTR_EL2_nAMAIR2_EL1		|
 				       HFGRTR_EL2_nMAIR2_EL1		|
 				       HFGRTR_EL2_nS2POR_EL1		|
-				       HFGRTR_EL2_nACCDATA_EL1		|
 				       HFGRTR_EL2_nSMPRI_EL1_MASK	|
 				       HFGRTR_EL2_nTPIDR2_EL0_MASK);
 
+	if (!kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA))
+		kvm->arch.fgu[HFGRTR_GROUP] |= HFGRTR_EL2_nACCDATA_EL1;
+
 	if (!kvm_has_feat(kvm, ID_AA64ISAR0_EL1, TLB, OS))
 		kvm->arch.fgu[HFGITR_GROUP] |= (HFGITR_EL2_TLBIRVAALE1OS|
 						HFGITR_EL2_TLBIRVALE1OS	|
-- 
2.39.2


