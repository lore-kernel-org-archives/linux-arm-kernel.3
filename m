Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5A9E7DF19
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ji9nB/t0HcHL/zF0pVXCx1XEDd4dZShWPgxdRPuldic=; b=CIrrnMEpubFWJcipmnDPhgujdT
	fwEBtXU5wr444RridgucT8Te76WQswKK4uhSNVgK1DH6aC2lJEmFAshDuRCO4E8VpGARW/ZgkMMHN
	j2uEe2hm0pSdHFZnf6SXrp70pUg9TEdxezIPye4BDGqC7vicGsfmZ0QPvHUUwwrOdauOIEDWyKtwG
	Mi/Woy1XFAsUSN3w/vEN2Eo4UQrgxTECUABjFxomhFdIhRTFhQ1oMgOh5I9jaQFqx0EK1LZ7kmrvR
	Xat+enznSTs1Y8j0yeyeStdvTd0B/JKImmua9K8yaOCyODjB2kcRAczbLDumGbVmNmtDniVR+FPH0
	WrmgsDLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyu4-00000005RTL-1juK;
	Mon, 02 Feb 2026 18:44:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytl-00000005R1a-15sx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DC3C444AA;
	Mon,  2 Feb 2026 18:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0746C2BCB1;
	Mon,  2 Feb 2026 18:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057824;
	bh=fr7um36i7FSrPooYd82g3BcIiUsju9J2xc0y7Xw8W7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cH1X2uTN7atJ8JexA/Vzidx3Lin5iIV/S5xFbXlXxVNxxFaOYIUfWXk2hUhJxea3c
	 RHsVthAe8va6HDjQj7HD2o6YzzTA3iypubr5UiInBpFmDPfzYNaDqoUgyAgM+PDqcX
	 hBCu55m6irwdiHmowafLnaN/dgjalMmKkm3xTTBn4gsaz1Jr0ILV+3IomPv6/bwWuW
	 Lyv7w/i/reop2ZPQKgEldJSnKbm4Mm+dWliIcqZ+nT75LcVML3DZeoLLm6JiCHxpRb
	 FJi9FVrAtMACpa0pXHTdolZvdCg/3rDlbepteNsJOGMmq6CvsDpgeTBrLuCMDugzaN
	 HbwHLR+6hjfnw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmyti-00000007sAy-0iZ1;
	Mon, 02 Feb 2026 18:43:42 +0000
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
Subject: [PATCH v2 15/20] KVM: arm64: Get rid of FIXED_VALUE altogether
Date: Mon,  2 Feb 2026 18:43:24 +0000
Message-ID: <20260202184329.2724080-16-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202184329.2724080-1-maz@kernel.org>
References: <20260202184329.2724080-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_104345_543571_7CF5CB97 
X-CRM114-Status: GOOD (  13.08  )
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

We have now killed every occurrences of FIXED_VALUE, and we can therefore
drop the whole infrastructure. Good riddance.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index ae72f3b8e50b1..274ae049c4b33 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -22,13 +22,12 @@ struct reg_bits_to_feat_map {
 
 #define	NEVER_FGU	BIT(0)	/* Can trap, but never UNDEF */
 #define	CALL_FUNC	BIT(1)	/* Needs to evaluate tons of crap */
-#define	FIXED_VALUE	BIT(2)	/* RAZ/WI or RAO/WI in KVM */
+#define	FORCE_RESx	BIT(2)	/* Unconditional RESx */
 #define	MASKS_POINTER	BIT(3)	/* Pointer to fgt_masks struct instead of bits */
 #define	AS_RES1		BIT(4)	/* RES1 when not supported */
 #define	REQUIRES_E2H1	BIT(5)	/* Add HCR_EL2.E2H RES1 as a pre-condition */
 #define	RES1_WHEN_E2H0	BIT(6)	/* RES1 when E2H=0 and not supported */
 #define	RES1_WHEN_E2H1	BIT(7)	/* RES1 when E2H=1 and not supported */
-#define	FORCE_RESx	BIT(8)	/* Unconditional RESx */
 
 	unsigned long	flags;
 
@@ -41,7 +40,6 @@ struct reg_bits_to_feat_map {
 			s8	lo_lim;
 		};
 		bool	(*match)(struct kvm *);
-		bool	(*fval)(struct kvm *, struct resx *);
 	};
 };
 
@@ -74,13 +72,6 @@ struct reg_feat_map_desc {
 		.lo_lim	= id ##_## fld ##_## lim	\
 	}
 
-#define __NEEDS_FEAT_2(m, f, w, fun, dummy)		\
-	{						\
-		.w	= (m),				\
-		.flags = (f) | CALL_FUNC,		\
-		.fval = (fun),				\
-	}
-
 #define __NEEDS_FEAT_1(m, f, w, fun)			\
 	{						\
 		.w	= (m),				\
@@ -100,9 +91,6 @@ struct reg_feat_map_desc {
 #define NEEDS_FEAT_FLAG(m, f, ...)			\
 	__NEEDS_FEAT_FLAG(m, f, bits, __VA_ARGS__)
 
-#define NEEDS_FEAT_FIXED(m, ...)			\
-	__NEEDS_FEAT_FLAG(m, FIXED_VALUE, bits, __VA_ARGS__, 0)
-
 #define NEEDS_FEAT_MASKS(p, ...)				\
 	__NEEDS_FEAT_FLAG(p, MASKS_POINTER, masks, __VA_ARGS__)
 
@@ -1303,19 +1291,12 @@ static struct resx compute_resx_bits(struct kvm *kvm,
 		if (map[i].flags & exclude)
 			continue;
 
-		switch (map[i].flags & (FORCE_RESx | CALL_FUNC | FIXED_VALUE)) {
-		case CALL_FUNC | FIXED_VALUE:
-			map[i].fval(kvm, &resx);
-			continue;
-		case CALL_FUNC:
-			match = map[i].match(kvm);
-			break;
-		case FORCE_RESx:
+		if (map[i].flags & FORCE_RESx)
 			match = false;
-			break;
-		default:
+		else if (map[i].flags & CALL_FUNC)
+			match = map[i].match(kvm);
+		else
 			match = idreg_feat_match(kvm, &map[i]);
-		}
 
 		if (map[i].flags & REQUIRES_E2H1)
 			match &= !e2h0;
-- 
2.47.3


