Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3073D1F9A1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fHBwPXIWc/zyUz2jBySgq2qPwaMaOIhXdKQPzL9Dr8=; b=GDAJGVJufOMNKHRN59o0p78JaO
	ctA4C0t8zxFc2sZvJZS7HQcC69AyCh1WSPIGEKv+8A6N6JVUV54lsh5XuDZzKf2pY5zrKFcnyri2I
	ZwXcy8MRt3YNCqp2zzEHhoW0xAT6aRfTRpbAbwB944BA7unbmtDxtz+bItV9P3ZHeULw4DsiByUha
	eAgDS9vHf+piMmj5ekwcJl8MhMs7HHgajxmz0cQRByS8yb58Jw/fZTBBe4qfNnXOWLPDxQvu5GhW/
	4V1Qe0xb5fKjZtLWoHYgZ18MTcU4/PytqZ4fruAC3QRC4MVOFCQdhgUH+29q9GVFYnJvwTJcM36UE
	O9wFVTVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5x6-00000007mvX-0McE;
	Thu, 04 Dec 2025 09:48:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5wz-00000007mp1-3b7a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:48:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F81C44230;
	Thu,  4 Dec 2025 09:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0A0C113D0;
	Thu,  4 Dec 2025 09:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764841717;
	bh=ZNBR/fm3XY6TFtf3KXZjf2qzVbXXjNo0ipwm39p6iv0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dRsmK5nKo5kGkySQEKujBf2koyzXM5RMpczZkILyUJjWp9moVcP/Vc9V3yTua9wWV
	 SFbG6HfFqmGCfjfvcdxFOL+UlISZHUSQ4PaIORmHydPSLh5NBzvtPmIlBdXG6mZO0t
	 nTYagwyuiI6F6gk88X56CnJ0yPEVtev5dI0dIyjec4V2iyjN8tTZLyBZeNAiGKLR4J
	 Xzc6OIzTK9dJGbCx96TGxjlmr3H1VT2uDMdqlS/qCcqA06vrEjiDJ2UoIsZw+uidVn
	 UEq0aCR6RbTfhSEe84RGLXAUpZiWVUtXrO8kVfig3k/+urQVgXLcTIxO3A8IyyoYit
	 ofWC0XKgvjZPw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vR5wx-0000000AP90-2661;
	Thu, 04 Dec 2025 09:48:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v3 6/9] KVM: arm64: Force trap of GMID_EL1 when the guest doesn't have MTE
Date: Thu,  4 Dec 2025 09:48:03 +0000
Message-ID: <20251204094806.3846619-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204094806.3846619-1-maz@kernel.org>
References: <20251204094806.3846619-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_014837_995119_B1086C09 
X-CRM114-Status: GOOD (  10.88  )
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

If our host has MTE, but the guest doesn't, make sure we set HCR_EL2.TID5
to force GMID_EL1 being trapped. Such trap will be handled by the
FEAT_IDST handling.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ae1e72df1ed45..2e94c423594eb 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5558,6 +5558,8 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
 
 	if (kvm_has_mte(vcpu->kvm))
 		vcpu->arch.hcr_el2 |= HCR_ATA;
+	else
+		vcpu->arch.hcr_el2 |= HCR_TID5;
 
 	/*
 	 * In the absence of FGT, we cannot independently trap TLBI
-- 
2.47.3


