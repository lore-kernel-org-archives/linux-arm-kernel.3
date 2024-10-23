Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76097CFA448
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqHFwa2VI2+BMch3lTOo2CHjrTFuo6NLIGDv9j4QIz0=; b=HxyaWZKs5rLZHgChZ4+AH/ooxz
	3SC2TQlHAt7je+SSWligb6uThqPxJGK/3LDlwaiHADSnoN112v10vQJIkT5ZWUoc1Gqy3gNTClOEr
	60LY6mpgWaVDZQuv8s8zz+5qeq1H2kjXZPRdOyW9jH5BrAF7nCZRCChYZK9IMKD1CP9sPj4euy4NQ
	ZQIe2dsavLvGwB1IB/FjQPHlUvYmwHKMDNjDjBPW0SyeoN+iEE/vaBkbzO0RXraQn4+/HNGSvZlnf
	o8ZNGvzSUGuz5IonC5gnDRZb+emnGQJn6c+wz07kve4SBVqwcP2ps4YdBhp2Ba9VpgiIBt7ChcF6V
	kaWCYXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dfV-0000000F2kr-04nh;
	Wed, 23 Oct 2024 15:53:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckM-0000000EpP4-2810
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 36BA3A45048;
	Wed, 23 Oct 2024 14:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19687C4CECD;
	Wed, 23 Oct 2024 14:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695237;
	bh=WLG6aiuNN/mgMCljFrWmlIWIhDcWjA7d1uKxmA7beSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jxSBUsKh7hQVSFN64yE9/XErRIOD7J8rX8fQpHiQcTIfzofjYLphnHiHIqFUZkaBK
	 5teXi/vyU0SNqJYTUh3MTsMhzy0Yxijzt1qU81NDzUvBt0KgUQu4Vh879e9Pj9IldJ
	 53pxMLK/2uRzAGzINlLJpOX0HohmzkRZAyK8AqC8HM5THbNtXnnGyPLNYLtgg0eDnP
	 MD4P1cAb88DPyG/lA4Avu0xq7M78m2fnCPAy470YO3WyeLRTY9fnvdoR/wnN7UDdLD
	 7ek5r+q4xQBODox1Z8nCP+Q8XVkW/8gPpbD3O05+6K7WVWIqK32KJpVt6IT6deQBwg
	 fUpdVAS3g6bNw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckF-0068vz-AJ;
	Wed, 23 Oct 2024 15:53:55 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 28/37] KVM: arm64: Drop bogus CPTR_EL2.E0POE trap routing
Date: Wed, 23 Oct 2024 15:53:36 +0100
Message-Id: <20241023145345.1613824-29-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075402_719938_FD4F7912 
X-CRM114-Status: GOOD (  11.34  )
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

It took me some time to realise it, but CPTR_EL2.E0POE does not
apply to a guest, only to EL0 when InHost(). And when InHost(),
CPCR_EL2 is mapped to CPACR_EL1, maning that the E0POE bit naturally
takes effect without any trap.

To sum it up, this trap bit is better left ignored, we will never
have to hanedle it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 05b6435d02a97..ddcbaa983de36 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -79,7 +79,6 @@ enum cgt_group_id {
 	CGT_MDCR_E2TB,
 	CGT_MDCR_TDCC,
 
-	CGT_CPACR_E0POE,
 	CGT_CPTR_TAM,
 	CGT_CPTR_TCPAC,
 
@@ -362,12 +361,6 @@ static const struct trap_bits coarse_trap_bits[] = {
 		.mask		= MDCR_EL2_TDCC,
 		.behaviour	= BEHAVE_FORWARD_ANY,
 	},
-	[CGT_CPACR_E0POE] = {
-		.index		= CPTR_EL2,
-		.value		= CPACR_ELx_E0POE,
-		.mask		= CPACR_ELx_E0POE,
-		.behaviour	= BEHAVE_FORWARD_ANY,
-	},
 	[CGT_CPTR_TAM] = {
 		.index		= CPTR_EL2,
 		.value		= CPTR_EL2_TAM,
@@ -1141,7 +1134,6 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_AMEVTYPER1_EL0(13),	CGT_CPTR_TAM),
 	SR_TRAP(SYS_AMEVTYPER1_EL0(14),	CGT_CPTR_TAM),
 	SR_TRAP(SYS_AMEVTYPER1_EL0(15),	CGT_CPTR_TAM),
-	SR_TRAP(SYS_POR_EL0,		CGT_CPACR_E0POE),
 	/* op0=2, op1=1, and CRn<0b1000 */
 	SR_RANGE_TRAP(sys_reg(2, 1, 0, 0, 0),
 		      sys_reg(2, 1, 7, 15, 7), CGT_CPTR_TTA),
-- 
2.39.2


