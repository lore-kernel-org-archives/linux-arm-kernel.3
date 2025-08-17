Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94DFCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 20:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zmFf0WYHHsEOGMgwgWp/O6pTDhIcPpSKxlCDMxFxKg=; b=ilGyEjb1JNLFRZcVN3cAuHVVO6
	ETiMtKBP+gKb0LEfRdrSVWA+MWIfas2UpbrUZixe5JeBPcX4V/0fV8rvetUzWANJUAuE3fla17kbY
	XzxF0S+JBkzRjl6fzxrl/ZEQeFuDD6P4vehPz5FB5HgVRnTpKaiTVynpIZ/F/VQWPOsbLbzzcR6TP
	QlneYnngttKbm9Qrufollv09hZRZF3Ef/4OyH0XAKw6VPENlRsMYkwFaVAW3geraoiiiak+6rMbUV
	4mgWDGFmLXq6sihqNlBcAzW77ZIA0IUzVsLsFsPQUPG56k13fvKwhbGXzsilkoZs+QM6tKj1Tngaz
	3wRLZSbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unjvq-000000060oD-1jJg;
	Sun, 17 Aug 2025 20:24:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unjtH-000000060QV-1yis
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 20:22:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCD4145BBE;
	Sun, 17 Aug 2025 20:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A7BC116D0;
	Sun, 17 Aug 2025 20:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755462125;
	bh=/kr1h3ivDaybILMj58T9joQcQNXYw3TXcpEPHXi8CWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M/p1LFvyG1jWQGFGy5M3aZHnSBRa/vq1bKsLxZDZItAsACkJ+cWaK066JObotivc7
	 so7haCYLxbnPyuFWhZ8IA3DhNbcXFXxkorzj62eXIF0G9F4Bo5FZUJPYpSSWTGTe0l
	 DA1qm5DCUkm2F89pDehuWKtv/Sstnq2vGNYEDqX+hSSVnL1mRs48Zt3SiopSlTvJb/
	 ifmaQ6zdh1E8Ml3ddO5aZjoLX4HaOAostCLm2ORaA/qJ5gEzMnmi2bliQoFvsKSsSn
	 VsevUxHY/t8UYuS9x3AK3B7ZNzIElwPCJZjWKXKWJGvAJ7216DVLOHE9ybem/Ve433
	 EngDuW9UR1o2Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1unjtD-008PX0-OS;
	Sun, 17 Aug 2025 21:22:03 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 4/6] KVM: arm64: Make ID_AA64PFR0_EL1.RAS writable
Date: Sun, 17 Aug 2025 21:21:56 +0100
Message-Id: <20250817202158.395078-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250817202158.395078-1-maz@kernel.org>
References: <20250817202158.395078-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com, cohuck@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_132207_538828_3A1C4B1F 
X-CRM114-Status: GOOD (  10.32  )
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
index feb1a7a708e25..3306fef432cbb 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2941,7 +2941,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 		    ~(ID_AA64PFR0_EL1_AMU |
 		      ID_AA64PFR0_EL1_MPAM |
 		      ID_AA64PFR0_EL1_SVE |
-		      ID_AA64PFR0_EL1_RAS |
 		      ID_AA64PFR0_EL1_AdvSIMD |
 		      ID_AA64PFR0_EL1_FP)),
 	ID_FILTERED(ID_AA64PFR1_EL1, id_aa64pfr1_el1,
-- 
2.39.2


