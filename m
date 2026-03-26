Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5168210A88E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rU8q2u3BMYjFmyPgg9SMXSe4vcHu8unSINEhbt1pvPg=; b=p/hlmFlCjaC3TJT2bScfvVuPEm
	KdA/7hAFUU17oNxWEVhAMqAuxM1sy/XkbA6n963uhkqVrkWkSKjBrUKlk1dQfFvKt9pRJMLbSQ6FA
	DOuBddFJaQfVSosB6FwPlunqeWu+XRrElfKpsrM/U0Bdph0KpmdtnTsoyQwWVs1GY9w68BxL/8vT1
	wEZxB+LQ2dlyj2cs08mSVjUiUKK44cULbCi94uu6FRoaiu4tAvaByTZjUd7d9St3mGMP4kVnEuPjl
	JYwfB8uL5r7nBQLmuzCpYBe4q85PrGKU7/2ZtMikMOUiFal3bBZ46c0Zb63CWLQNAAkqNP8VILwRj
	OVd//NwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkT-00000005lLI-1THH;
	Thu, 26 Mar 2026 15:35:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkH-00000005l73-1SHP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A84944732;
	Thu, 26 Mar 2026 15:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084C1C2BCB0;
	Thu, 26 Mar 2026 15:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539339;
	bh=OnkAaZ/jg85tiwhR94ci/DbNvsuSh0bKDG0rnVDTaYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WhxENzHe5qoKXqeCszF5uMyrwI0ijAlY/QZU9qjz/XNdEMWTHabm0jwPQvAqdb20l
	 DP0l093GHxr2j27R/EmCKrUscLZqXITGKtN6iKage4vb1EJEfS4+4ZtC2Spj1WF0AC
	 trObve05YK0A0H/eYJ0XMH2GMLUmGOZHmqhP0G1dd4pinR1Y20qvYUUlTdQ5DcGsi7
	 yyumgIuQH2Rb2knSDQoVHYEKT2Ib0FhXh/fUlB4MJajtDf92gWdZQAovZASpkQJ4hh
	 KVlnOqzJuIjbu5JZANc0/IzWvoO4kx9UVmElOJuubXEQdhqVD5lkEj5NJ8PkAAYuQG
	 as9gYnKrZs9uQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w5mkD-000000060II-1AJt;
	Thu, 26 Mar 2026 15:35:37 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 14/15] KVM: arm64: Correctly plumb ID_AA64PFR2_EL1 into pkvm idreg handling
Date: Thu, 26 Mar 2026 15:35:29 +0000
Message-ID: <20260326153530.3981879-15-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326153530.3981879-1-maz@kernel.org>
References: <20260326153530.3981879-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_083541_470359_B0E17482 
X-CRM114-Status: GOOD (  11.84  )
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

While we now compute ID_AA64PFR2_EL1 to a glorious 0, we never use
that data and instead return the 0 that corresponds to an allocated
idreg. Not a big deal, but we might as well be consistent.

Fixes: 5aefaf11f9af5 ("KVM: arm64: gic: Hide GICv5 for protected guests")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index b40fd01ebf329..be6f420388a14 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -439,7 +439,7 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 	/* CRm=4 */
 	AARCH64(SYS_ID_AA64PFR0_EL1),
 	AARCH64(SYS_ID_AA64PFR1_EL1),
-	ID_UNALLOCATED(4,2),
+	AARCH64(SYS_ID_AA64PFR2_EL1),
 	ID_UNALLOCATED(4,3),
 	AARCH64(SYS_ID_AA64ZFR0_EL1),
 	ID_UNALLOCATED(4,5),
-- 
2.47.3


