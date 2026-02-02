Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6405FE7DF1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRI/B/GoKl92b3Dkm7sYt2IlxKyb1B9+rndzxArwjwY=; b=NcaWjNn0WslcGhoMDGCOUN4YF5
	zG+vTMWVKk06E/6WeKAbaONFRRbQmoVQAX6GKca9v2ICHsQgV2gePOMIAuSuPWurJpIRyxX1SRK6i
	GUpFNrxVi9j+x0BHUk4PTyZYQMimkSImRaE6eX3JRb6XpFsmqA5V+fg5jrr0p/qyCtvyov1qIl0JS
	KbjX+/ZlrO2ubQ2uty8cGje10fuwWYCwUca6vK5BKLA3N4VfwpBs2YfANQVcZBblg+ynJMCZhkbuG
	cso0dgiJ6G1E6lcKZ4AlPrbdxgWBJar93NsOUknflhH7lOR/yovyKx/vpdlYNDMDfE1mPjFRu1pQ4
	dVVOF4fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyts-00000005RA8-0WHG;
	Mon, 02 Feb 2026 18:43:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytj-00000005QzI-2i2n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 479CD44445;
	Mon,  2 Feb 2026 18:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2117FC2BC87;
	Mon,  2 Feb 2026 18:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057822;
	bh=5WRJ9oOXrDJEL69hkNzTU0wxUvuUyWon3NrR6orDMyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uwPWw5v/fHMuZzVX/pKPNvaC5m6Hbp+9W88GsIZUeuGP97ac6sSDcK+JDUet49QQy
	 h039DI2NRxWyIg23TAtz6rbmk4NbtzWMCi/FODdLwh1ZOpy1wWb7fatOHX77QuQ7D9
	 PFExbJCeOQjsU8bxeiEyZn3MZvVpuvZ4RbFxLHkxXpznYy3RQbNTwNdjSeTgDoJ7fx
	 /Sn/aLaSoBw6FalnDyG2lPXa+42Vxiap8hhgnaLviISCI0A/jzH+Prbre6tjgU1Sps
	 wijzTb0Qd6sig9S5pNrZ5URrDXcKV3I9BsnBhR3xk1Q4GezG+dfvT/mdrBlBqI5wq/
	 4liuv3Hq4//3Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmytg-00000007sAy-1OCL;
	Mon, 02 Feb 2026 18:43:40 +0000
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
Subject: [PATCH v2 07/20] KVM: arm64: Allow RES1 bits to be inferred from configuration
Date: Mon,  2 Feb 2026 18:43:16 +0000
Message-ID: <20260202184329.2724080-8-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260202_104343_739248_CC156559 
X-CRM114-Status: GOOD (  14.49  )
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

So far, when a bit field is tied to an unsupported feature, we set
it as RES0. This is almost correct, but there are a few exceptions
where the bits become RES1.

Add a AS_RES1 qualifier that instruct the RESx computing code to
simply do that.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 9ad7eb5f4b981..bc8e6460c3fb1 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -24,6 +24,7 @@ struct reg_bits_to_feat_map {
 #define	CALL_FUNC	BIT(1)	/* Needs to evaluate tons of crap */
 #define	FIXED_VALUE	BIT(2)	/* RAZ/WI or RAO/WI in KVM */
 #define	MASKS_POINTER	BIT(3)	/* Pointer to fgt_masks struct instead of bits */
+#define	AS_RES1		BIT(4)	/* RES1 when not supported */
 
 	unsigned long	flags;
 
@@ -1315,8 +1316,12 @@ static struct resx __compute_fixed_bits(struct kvm *kvm,
 		else
 			match = idreg_feat_match(kvm, &map[i]);
 
-		if (!match || (map[i].flags & FIXED_VALUE))
-			resx.res0 |= reg_feat_map_bits(&map[i]);
+		if (!match || (map[i].flags & FIXED_VALUE)) {
+			if (map[i].flags & AS_RES1)
+ 				resx.res1 |= reg_feat_map_bits(&map[i]);
+			else
+				resx.res0 |= reg_feat_map_bits(&map[i]);
+		}
 	}
 
 	return resx;
-- 
2.47.3


