Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2091FCF65ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+lQN6XO5v8TFAqmUwqQTswOwEBbpUFiwaYZ4MP21+Y=; b=A61B48xq4eIbxR9zIxGYfKl8ua
	zuvnhVp3cFnNBVyEIEs1mv7jZ9Ek0uUda66D6fPZOikcIihMUcz9GE55XoeZ4IA99lfkiY7sfUPWu
	3nMhVP4VN8ZTJb1UKliSZeusWQoQ8XikpIYbdIjErq9cOfDcECqxseII6T865CKuyxW2XbjnhvQTX
	Nl/FzXJZtDe5RNUI16rOx12uLRBWRT3BBgZrj9VUMwaZG4+3L3nITsMaNba7f27ThiHD1oUiZmtEh
	cht+kEf/glPOrBxvyeeKxCUszVVv1YJRQs+ofZpOA5+9/uuku7c7jnhUonElsAQSE6K3vTHA3Lvze
	kHlBI/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXT-0000000CV4j-2nbp;
	Mon, 26 Jan 2026 12:17:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXE-0000000CUsS-25ns
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F03B443AF;
	Mon, 26 Jan 2026 12:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4901DC4AF0B;
	Mon, 26 Jan 2026 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429855;
	bh=y57eypVaqnVgq3cxgx+jkvg59wcWPCxI619OLu3MS/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ThUj+RoHAhJbCX5ENfAgxA2rpSz2ag1dE1DkeciOi0cxdE+7sJr4OFZpH/5IBPEcS
	 Uylx2iPIev5R1POCXHtVxZ4XwqM1rZY+My3WM6qDWx5jZT0ygsEueDbK+E39aeJuZJ
	 Qj0tSXPN678DVuqwfAqqrNiDKFluc53Md/dzRoLJk8N+Hz/HwV0pfMI5JK8M0S2ccf
	 Zoyc6i3teMqU1hRQk9LyuEcWwnvZrtUytMWJCBPqkjNrA9aRC6V21KY4SNd4CTKeB8
	 LYCv1HlBT3iA6iaIvqFNkWoYXSI1BDxWLGRPZvZT5kdMM3Udj+ZFoaqPV0reOugvnk
	 vNvrLbviOIg5w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkLXB-00000005hx6-2Aqw;
	Mon, 26 Jan 2026 12:17:33 +0000
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
Subject: [PATCH 08/20] KVM: arm64: Correctly handle SCTLR_EL1 RES1 bits for unsupported features
Date: Mon, 26 Jan 2026 12:16:42 +0000
Message-ID: <20260126121655.1641736-9-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260126_041736_591314_6453EAF0 
X-CRM114-Status: GOOD (  10.84  )
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

A bunch of SCTLR_EL1 bits must be set to RES1 when the controling
feature is not present. Add the AS_RES1 qualifier where needed.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 6a4674fabf865..68ed5af2b4d53 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1085,27 +1085,28 @@ static const DECLARE_FEAT_MAP(tcr2_el2_desc, TCR2_EL2,
 			      tcr2_el2_feat_map, FEAT_TCR2);
 
 static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
-	NEEDS_FEAT(SCTLR_EL1_CP15BEN	|
-		   SCTLR_EL1_ITD	|
-		   SCTLR_EL1_SED,
-		   FEAT_AA32EL0),
+	NEEDS_FEAT(SCTLR_EL1_CP15BEN, FEAT_AA32EL0),
+	NEEDS_FEAT_FLAG(SCTLR_EL1_ITD	|
+			SCTLR_EL1_SED,
+			AS_RES1, FEAT_AA32EL0),
 	NEEDS_FEAT(SCTLR_EL1_BT0	|
 		   SCTLR_EL1_BT1,
 		   FEAT_BTI),
 	NEEDS_FEAT(SCTLR_EL1_CMOW, FEAT_CMOW),
-	NEEDS_FEAT(SCTLR_EL1_TSCXT, feat_csv2_2_csv2_1p2),
-	NEEDS_FEAT(SCTLR_EL1_EIS	|
-		   SCTLR_EL1_EOS,
-		   FEAT_ExS),
+	NEEDS_FEAT_FLAG(SCTLR_EL1_TSCXT,
+			AS_RES1, feat_csv2_2_csv2_1p2),
+	NEEDS_FEAT_FLAG(SCTLR_EL1_EIS	|
+			SCTLR_EL1_EOS,
+			AS_RES1, FEAT_ExS),
 	NEEDS_FEAT(SCTLR_EL1_EnFPM, FEAT_FPMR),
 	NEEDS_FEAT(SCTLR_EL1_IESB, FEAT_IESB),
 	NEEDS_FEAT(SCTLR_EL1_EnALS, FEAT_LS64),
 	NEEDS_FEAT(SCTLR_EL1_EnAS0, FEAT_LS64_ACCDATA),
 	NEEDS_FEAT(SCTLR_EL1_EnASR, FEAT_LS64_V),
 	NEEDS_FEAT(SCTLR_EL1_nAA, FEAT_LSE2),
-	NEEDS_FEAT(SCTLR_EL1_LSMAOE	|
-		   SCTLR_EL1_nTLSMD,
-		   FEAT_LSMAOC),
+	NEEDS_FEAT_FLAG(SCTLR_EL1_LSMAOE	|
+			SCTLR_EL1_nTLSMD,
+			AS_RES1, FEAT_LSMAOC),
 	NEEDS_FEAT(SCTLR_EL1_EE, FEAT_MixedEnd),
 	NEEDS_FEAT(SCTLR_EL1_E0E, feat_mixedendel0),
 	NEEDS_FEAT(SCTLR_EL1_MSCEn, FEAT_MOPS),
@@ -1121,7 +1122,8 @@ static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
 	NEEDS_FEAT(SCTLR_EL1_NMI	|
 		   SCTLR_EL1_SPINTMASK,
 		   FEAT_NMI),
-	NEEDS_FEAT(SCTLR_EL1_SPAN, FEAT_PAN),
+	NEEDS_FEAT_FLAG(SCTLR_EL1_SPAN,
+			AS_RES1, FEAT_PAN),
 	NEEDS_FEAT(SCTLR_EL1_EPAN, FEAT_PAN3),
 	NEEDS_FEAT(SCTLR_EL1_EnDA	|
 		   SCTLR_EL1_EnDB	|
-- 
2.47.3


