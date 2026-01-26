Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38C1CF65EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugcthfNArEhLbY36awHncKC1NPrn08SzUzdMeMpwPeg=; b=MNVDXZeUe9IE+8XWQR/j9OG8iP
	/GHkIcvl8h1hpUacVHBmt4cRDhqPn+val1i+PJP+hpoQ6vRMX+1ZUHXU7rskuIfsbEjHFLVUEWGR9
	+UFS8QfoG3htdB7inzKXD/8M9T48qewI4VN8+49e4M7ztC9d5w0vZb053wsg+MzpO084fYPB00psB
	x3yLZjtHlgG3Cf3ZUpvO4H3RF3EHlAr7lfYVL847XGI1j5lhaNTxsgqD6mMOKvvK4cUqTE/3RV9De
	4bXo9LiijDmn23KbFlT+tcn0CksxIa5847p4+m7KLyDF7TlQHCnICU0zylkEoPgnGG5P2SfNjCkiF
	9zBD634Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXV-0000000CV8I-2CHl;
	Mon, 26 Jan 2026 12:17:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXF-0000000CUsH-2r3p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D30F5444A7;
	Mon, 26 Jan 2026 12:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E13C2BC9E;
	Mon, 26 Jan 2026 12:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429856;
	bh=mUisdlIwx2NvdW2eeUH/yAqtU/GwtIf2QebGFR6FEio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cTAdc9TzjwpTXYOTaUy+HuSdSZVTp2/IDbgCm4ddtLb45RW5I9owFvIHKW8iEQazY
	 MOs+UIMku8aj1PUrRIq6hGJNF6ctDqC8RU8spSPgK52pa8xl66UyBraxViWxyOdEpP
	 sw1jl9AUjIraoe3VDHykts68HrxupSk7bfBsoQpJZKiOYr12idQpDtq5i8pAd9uKlT
	 pjpaod/8TNuW5zbI2gIwACcAgykOSJZEhnP3LX9vAFBYNrX7lpng4E2ElJUvfSnYIY
	 g+CYoFbswpNOa4CiYCNwUmdLVkc1kHpwVnUJHhwnqH2XEGKOfviVh+s9Esb3PV9+Mb
	 1jVXN83afteVg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkLXC-00000005hx6-3uKQ;
	Mon, 26 Jan 2026 12:17:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 14/20] KVM: arm64: Simplify handling of HCR_EL2.E2H RESx
Date: Mon, 26 Jan 2026 12:16:48 +0000
Message-ID: <20260126121655.1641736-15-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126121655.1641736-1-maz@kernel.org>
References: <20260126121655.1641736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_041737_826591_30F680CD 
X-CRM114-Status: GOOD (  11.02  )
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

Now that we can link the RESx behaviour with the value of HCR_EL2.E2H,
we can trivially express the tautological constraint that makes E2H
a reserved value at all times.

Fun, isn't it?

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index d5871758f1fcc..187d047a9cf4a 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -394,16 +394,6 @@ static bool feat_vmid16(struct kvm *kvm)
 	return kvm_has_feat_enum(kvm, ID_AA64MMFR1_EL1, VMIDBits, 16);
 }
 
-static bool compute_hcr_e2h(struct kvm *kvm, struct resx *bits)
-{
-	if (kvm_has_feat(kvm, FEAT_E2H0))
-		bits->res0 |= HCR_EL2_E2H;
-	else
-		bits->res1 |= HCR_EL2_E2H;
-
-	return true;
-}
-
 static const struct reg_bits_to_feat_map hfgrtr_feat_map[] = {
 	NEEDS_FEAT(HFGRTR_EL2_nAMAIR2_EL1	|
 		   HFGRTR_EL2_nMAIR2_EL1,
@@ -1023,7 +1013,8 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
 	NEEDS_FEAT(HCR_EL2_TWEDEL	|
 		   HCR_EL2_TWEDEn,
 		   FEAT_TWED),
-	NEEDS_FEAT_FIXED(HCR_EL2_E2H, compute_hcr_e2h),
+	NEEDS_FEAT_FLAG(HCR_EL2_E2H, RES0_WHEN_E2H0 | RES1_WHEN_E2H1,
+			enforce_resx),
 	FORCE_RES0(HCR_EL2_RES0),
 	FORCE_RES1(HCR_EL2_RES1),
 };
-- 
2.47.3


