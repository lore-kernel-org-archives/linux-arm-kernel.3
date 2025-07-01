Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C41C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6fJWdpn51ApWW1yhF0gTZqsMiWMM9jdy6lOxtpgDyc=; b=ucY+8xP22gEjtnuu0pT8NNNm/i
	ANHN8Wkrpw50HkYOYbruzDHKvecVHX6rAa0meoMnTjHJFIixQOpn++iOjMz/ti1VMZQlbpwuklB5g
	2Scci1rx0GuLQtm5mxR5Jv1xCmCurZhZ/LJdTrfgdT+dxBVuraMaEmiUeoZp/ZMf2iMStXEStwDSm
	sCk08pyEv0JSHE1ER75xaNEJlVh4gFdgrtrkCHEzIqECszfIqbIsfeo4zVGzuVgPKGV9yFCu9K/AB
	hMDP8+kDTUlk4kS8nPRZSOa65JfLJygnNZ+ZUGSxhjzYa1JnruCXIfZWAVR/LGz4kEMh5+HPrgjKa
	LocRmCNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfCf-00000006HEK-14hX;
	Tue, 01 Jul 2025 17:55:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcjB-00000005rHS-23z2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 15:16:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CE4D46783;
	Tue,  1 Jul 2025 15:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDD0C4CEEB;
	Tue,  1 Jul 2025 15:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751383017;
	bh=mqhSvweyiaf53SB/vB+8vcsB7iR7pvgyiynVGmHKKBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dKdFmkAcnhMzS6xOj6wnM50T1AU1vLet2lEK4jIR7ND1DjSK27Y1R25I/Upm7t6sE
	 OOXrxMRLvi7QQlOlpv3flY7Rgip6Y5gj0WPrziNYiOChVOwRIAYjL59rEzPZ26wcGh
	 /xP/HbpV2S0Nygo/NJnhHVc1zzKuCEyg6BtsHpmyGrOd7uNakDRNRU+i+QD4LMeZk5
	 qejDt8VaR2o7NKQUwjfT+fisIWGXhEJp0ZWuSxvqGWp/6G1mkdlLMxP/oKR5u/LPTB
	 +lvBaeFGRhHbXBKZh5+cgtktBf4ePidO6CYjl3uQ6A8jqCOA3jyfeGaB2j34s7yP70
	 sRNhr3XDXthjQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uWcj8-00Bch8-Ss;
	Tue, 01 Jul 2025 16:16:54 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 2/2] KVM: arm64: Follow specification when implementing WXN
Date: Tue,  1 Jul 2025 16:16:48 +0100
Message-Id: <20250701151648.754785-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250701151648.754785-1-maz@kernel.org>
References: <20250701151648.754785-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_081657_568185_F68505B6 
X-CRM114-Status: GOOD (  13.66  )
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

The R_QXXPC and R_NPBXC rules have some interesting (and pretty
sharp) corners when defining the behaviour of of WXN at S1:

- when S1 overlay is enabled, WXN applies to the overlay and
  will remove W

- when S1 overlay is disabled, WXN applies to the base permissions
  and will remove X.

Today, we lumb the two together in a way that doesn't really match
the rules, making things awkward to follow what is happening, in
particular when overlays are enabled.

Split these two rules over two distinct paths, which makes things
a lot easier to read and validate against the architecture rules.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index a26e377a36171..0e56105339493 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1063,6 +1063,10 @@ static void compute_s1_overlay_permissions(struct kvm_vcpu *vcpu,
 		if (pov_perms & ~POE_RWX)
 			pov_perms = POE_NONE;
 
+		/* R_QXXPC, S1PrivOverflow enabled */
+		if (wr->pwxn && (pov_perms & POE_X))
+			pov_perms &= ~POE_W;
+
 		wr->pr &= pov_perms & POE_R;
 		wr->pw &= pov_perms & POE_W;
 		wr->px &= pov_perms & POE_X;
@@ -1084,6 +1088,10 @@ static void compute_s1_overlay_permissions(struct kvm_vcpu *vcpu,
 		if (uov_perms & ~POE_RWX)
 			uov_perms = POE_NONE;
 
+		/* R_NPBXC, S1UnprivOverlay enabled */
+		if (wr->uwxn && (uov_perms & POE_X))
+			uov_perms &= ~POE_W;
+
 		wr->ur &= uov_perms & POE_R;
 		wr->uw &= uov_perms & POE_W;
 		wr->ux &= uov_perms & POE_X;
@@ -1106,21 +1114,13 @@ static void compute_s1_permissions(struct kvm_vcpu *vcpu,
 
 	compute_s1_overlay_permissions(vcpu, wi, wr);
 
-	/* R_QXXPC */
-	if (wr->pwxn) {
-		if (!wr->pov && wr->pw)
-			wr->px = false;
-		if (wr->pov && wr->px)
-			wr->pw = false;
-	}
+	/* R_QXXPC, S1PrivOverlay disabled */
+	if (!wr->pov)
+		wr->px &= !(wr->pwxn && wr->pw);
 
-	/* R_NPBXC */
-	if (wr->uwxn) {
-		if (!wr->uov && wr->uw)
-			wr->ux = false;
-		if (wr->uov && wr->ux)
-			wr->uw = false;
-	}
+	/* R_NPBXC, S1UnprivOverlay disabled */
+	if (!wr->uov)
+		wr->ux &= !(wr->uwxn && wr->uw);
 
 	pan = wi->pan && (wr->ur || wr->uw ||
 			  (pan3_enabled(vcpu, wi->regime) && wr->ux));
-- 
2.39.2


