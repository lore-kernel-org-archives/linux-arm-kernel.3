Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39148E74AC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 19:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rWu9NOMgMppqf60Pnys3HfkvoAjKEWmLUDkZwC0aYUc=; b=iugdigH5BeHVoQ7nI4QON2LazC
	EUFsnP8vZfJzZU0dVjcW3zAu1Jl1+Uw0uGfpm4U6ou1adGiVyKRJc2JODyYpZX3NOcGsiA0FRMljw
	k0pu2POucP2JOyMjt3iInPGG2U9Tn7E5y+5rGVez3wpyxzbWWPDNMwE/9NPOZEPHRWiPHN+xtUIZ3
	Mf3dIN7TTdXpdmgtbdLjw7eEQa5tHCMio2DvCk+hkSd8CMoptbetgMI8N0erxYu2h2Vm1BB0aNIiz
	1X5dPW1F1nkWuX5zBkTKk4kY9tN38iR6DMYltaQYph75qSpnLKymV2hQVRgmGVVKoE8eH87Z7Ff5X
	vHTrpMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIYC5-0000000AR51-0Nmn;
	Tue, 03 Dec 2024 19:04:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIYB3-0000000AQt2-3xdx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 19:03:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3469A40463;
	Tue,  3 Dec 2024 19:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0B7C4CED6;
	Tue,  3 Dec 2024 19:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733252596;
	bh=eijrbAe3pZqlViuINmabDVrHYMVGawiSwmMh9zjp4eU=;
	h=From:To:Cc:Subject:Date:From;
	b=M4xOX2qvVUnVLmMBciJn/ktir9cYv44PQgN516P1RUy/hPZeRytnnVwufr9xCirtN
	 L6zCvXUtA0hCxoxiHFGoFlRNuy2LURLASnKomgcf3JbfAYcAit3FgiUPW9KAUKkqVU
	 OO6GIRcXSxn8trEcptZ09FAOK2BdsqOPLLs4jpjQKpDudO+FnHeNQWlzmc9XtlWZuy
	 KNrNEq15+0bxzTIJJ9qAyAGvCh+fFTGp6gghmLFLZCtq2Y1Jd9kiYhmkegjDnHQr1f
	 hZeMLJ7T2GV9snlpAedM7OzOiWRKh0Je1Zj7P+UNLm2YfdGDK10JlY4CPlnwhTemWw
	 bGAddOoecVgYw==
Received: from ip-185-104-136-29.ptr.icomera.net ([185.104.136.29] helo=localhost.localdomain)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIYB0-000CK2-FB;
	Tue, 03 Dec 2024 19:03:14 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	stable@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH] KVM: arm64: Do not allow ID_AA64MMFR0_EL1.ASIDbits to be overridden
Date: Tue,  3 Dec 2024 19:02:36 +0000
Message-ID: <20241203190236.505759-1-maz@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.104.136.29
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, catalin.marinas@arm.com, stable@vger.kernel.org, will@kernel.org, mark.rutland@arm.com, james.morse@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_110318_114438_50E3D422 
X-CRM114-Status: GOOD (  17.16  )
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

Catalin reports that a hypervisor lying to a guest about the size
of the ASID field may result in unexpected issues:

- if the underlying HW does only supports 8 bit ASIDs, the ASID
  field in a TLBI VAE1* operation is only 8 bits, and the HW will
  ignore the other 8 bits

- if on the contrary the HW is 16 bit capable, the ASID field
  in the same TLBI operation is always 16 bits, irrespective of
  the value of TCR_ELx.AS.

This could lead to missed invalidations if the guest was lead to
assume that the HW had 8 bit ASIDs while they really are 16 bit wide.

In order to avoid any potential disaster that would be hard to debug,
prenent the migration between a host with 8 bit ASIDs to one with
wider ASIDs (the converse was obviously always forbidden). This is
also consistent with what we already do for VMIDs.

If it becomes absolutely mandatory to support such a migration path
in the future, we will have to trap and emulate all TLBIs, something
that nobody should look forward to.

Fixes: d5a32b60dc18 ("KVM: arm64: Allow userspace to change ID_AA64MMFR{0-2}_EL1")
Reported-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: James Morse <james.morse@arm.com>
Cc: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/sys_regs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index a26f02ec8748..b1918adbd0aa 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2674,7 +2674,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	ID_WRITABLE(ID_AA64MMFR0_EL1, ~(ID_AA64MMFR0_EL1_RES0 |
 					ID_AA64MMFR0_EL1_TGRAN4_2 |
 					ID_AA64MMFR0_EL1_TGRAN64_2 |
-					ID_AA64MMFR0_EL1_TGRAN16_2)),
+					ID_AA64MMFR0_EL1_TGRAN16_2 |
+					ID_AA64MMFR0_EL1_ASIDBITS)),
 	ID_WRITABLE(ID_AA64MMFR1_EL1, ~(ID_AA64MMFR1_EL1_RES0 |
 					ID_AA64MMFR1_EL1_HCX |
 					ID_AA64MMFR1_EL1_TWED |
-- 
2.43.0


