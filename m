Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A91CF65E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZm3enw18zg6euDcXwI0ZPBNmb90dUk80zvPY1sAxik=; b=TLZj2iLlySU/fb0ZBd+ZWBaQk7
	B9M97g+g/vL+wrSZClx+OxmlhSDFdwRSP05mrid7NxHvVEDPySXYc+ik6XcsbASUDnWYnJHGHgQk7
	k9sFSsv/SOtKGA1dwwmPTBDlD4gdSTAYRZfUSm02bbrhrByCjG/rCXRp1CemF2HFkOQd0DTBjTEie
	DDGzhht3VU8usDvJG/JmIYSow/z/gC5SC+cNtK2P4khzooA1m6fxmCJPS2s6u4T4jGBL9ouj3rULX
	inrAqeLb6thStCPtvFHgQPNJMzmbI1FLAZNfPWUSOPTcD27TZDGv3k3uwbc85KXqf6u5wbjdYuBnf
	42bHMqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXS-0000000CV2F-1cHB;
	Mon, 26 Jan 2026 12:17:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXF-0000000CUtk-3Yjg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F57D600C3;
	Mon, 26 Jan 2026 12:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7AABC19425;
	Mon, 26 Jan 2026 12:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429856;
	bh=xlNMm973YUYr0KXNcgVj9AWk0zIimNd+U2AAd/Xm6Lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fUl0abXC6EqroxahkpFF4kxZLsYhN2E4yfQ9ukN8qzMy7UTOgjqgDppPsD2EnKtrz
	 hA5YhMFTb0RvL3EhH9ixzSNVpfylaL6zwl/XbByyaqZrLoDUS2KpBLBANBm+0F5/OQ
	 HLHUwA5IrwGV2nE8z2OVBdfp+rdgacxVa8pd2W+ozBqvnbouCLemCEZjmctEpjV5hg
	 LAsXpQItY7eAm379/J05mJnGS/FU/y60r1HsIWV20aorQ7cz2QurMzYHQClc55QzHb
	 0wGnJfGiTCstd+0ioFZODONCzVThQCqr/9GhmSBAbZhryLCH8aD42B0AmINmd4laH/
	 odgE+fOFaBEig==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkLXD-00000005hx6-0dL6;
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
Subject: [PATCH 15/20] KVM: arm64: Get rid of FIXED_VALUE altogether
Date: Mon, 26 Jan 2026 12:16:49 +0000
Message-ID: <20260126121655.1641736-16-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126121655.1641736-1-maz@kernel.org>
References: <20260126121655.1641736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
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

We have now killed every occurrences of FIXED_VALUE, and we can therefore
drop the whole infrastructure. Good riddance.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 187d047a9cf4a..28e534f2850ea 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -22,7 +22,7 @@ struct reg_bits_to_feat_map {
 
 #define	NEVER_FGU	BIT(0)	/* Can trap, but never UNDEF */
 #define	CALL_FUNC	BIT(1)	/* Needs to evaluate tons of crap */
-#define	FIXED_VALUE	BIT(2)	/* RAZ/WI or RAO/WI in KVM */
+#define	FORCE_RESx	BIT(2)	/* Unconditional RESx */
 #define	MASKS_POINTER	BIT(3)	/* Pointer to fgt_masks struct instead of bits */
 #define	AS_RES1		BIT(4)	/* RES1 when not supported */
 #define	REQUIRES_E2H1	BIT(5)	/* Add HCR_EL2.E2H RES1 as a pre-condition */
@@ -30,7 +30,6 @@ struct reg_bits_to_feat_map {
 #define	RES0_WHEN_E2H1	BIT(7)	/* RES0 when E2H=1 and not supported */
 #define	RES1_WHEN_E2H0	BIT(8)	/* RES1 when E2H=0 and not supported */
 #define	RES1_WHEN_E2H1	BIT(9)	/* RES1 when E2H=1 and not supported */
-#define	FORCE_RESx	BIT(10)	/* Unconditional RESx */
 
 	unsigned long	flags;
 
@@ -43,7 +42,6 @@ struct reg_bits_to_feat_map {
 			s8	lo_lim;
 		};
 		bool	(*match)(struct kvm *);
-		bool	(*fval)(struct kvm *, struct resx *);
 	};
 };
 
@@ -76,13 +74,6 @@ struct reg_feat_map_desc {
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
@@ -96,9 +87,6 @@ struct reg_feat_map_desc {
 #define NEEDS_FEAT_FLAG(m, f, ...)			\
 	__NEEDS_FEAT_FLAG(m, f, bits, __VA_ARGS__)
 
-#define NEEDS_FEAT_FIXED(m, ...)			\
-	__NEEDS_FEAT_FLAG(m, FIXED_VALUE, bits, __VA_ARGS__, 0)
-
 #define NEEDS_FEAT_MASKS(p, ...)				\
 	__NEEDS_FEAT_FLAG(p, MASKS_POINTER, masks, __VA_ARGS__)
 
@@ -1306,16 +1294,10 @@ struct resx compute_resx_bits(struct kvm *kvm,
 		if (map[i].flags & exclude)
 			continue;
 
-		switch (map[i].flags & (CALL_FUNC | FIXED_VALUE)) {
-		case CALL_FUNC | FIXED_VALUE:
-			map[i].fval(kvm, &resx);
-			continue;
-		case CALL_FUNC:
+		if (map[i].flags & CALL_FUNC)
 			match = map[i].match(kvm);
-			break;
-		default:
+		else
 			match = idreg_feat_match(kvm, &map[i]);
-		}
 
 		if (map[i].flags & REQUIRES_E2H1)
 			match &= !e2h0;
-- 
2.47.3


