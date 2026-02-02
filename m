Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C6DE7DF11
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiS+plVbUf2K64SinIdWV8ITV3nbrJMRnoKHEhkJZJM=; b=K7fgVKeZw+I7oV+aLiBHFh1uXw
	esUQCi6QLMkP38xKkPprSekhSsxe9XjW0N3F1iwuV6B0V7FNjW02yBBYTDFydmv5TZ426h6KtKc8o
	/da1jIGneqVIgLTKuOz9gAM4MSiXy98y34m68BtfjaOkE3NfKAXGQGgAD0e4NLifrn7+4Hs/go3C3
	1WOA97NYLZbT16UdDcwxW6xrCTlQFKR2Plz8dGmVwYhdGi/OiJcwl7l/jLTnM8lMGpmTzejwSqfrL
	PkH31w/QSk+WGTe3Yr98id0fgbBwSSclCAad0MVjkRQzje5qAqMiiN6oY8ykd73KKGfRDffQkP75s
	vn3v8nPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyty-00000005RJE-3qvc;
	Mon, 02 Feb 2026 18:43:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytk-00000005R0k-3MEb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75AA2444C1;
	Mon,  2 Feb 2026 18:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 569D3C2BCAF;
	Mon,  2 Feb 2026 18:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057823;
	bh=Dz14TSpshifTs7bgDsWKmZsA4vb8qx2yLv+5O8xrkLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t1JyTk6UrnEKe88Z/FWYYIEAopVWGHvaxWO7WVSX4Pnfl0b62FsOgqJlot6Jih4WI
	 6pWYnJ16HnKsefbY+KYvgDwFbgND2qlOyKlWpeZXCRojVa3MbsESLWnjTGNQvN3Arn
	 opEARE+EDDhtMJ8ySCDssg2cpgCUCUzKgWxvfXd3PhtdgcsTEPe5Wv6jtxAbldOzxj
	 BTN/1yTId8IgNzTcvCZq0ya+TmbTXz2YwBUUgp5t4LbanPhx4MimndomUZs6/HG7Mf
	 4jmFX45qw2GJRzLtx4k5JOxwWkRp8/X9PN27OQzGph3DtLQwSDN26GD/VXQRLn1dwj
	 oKnaWfUvu3qEQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmyth-00000007sAy-1viU;
	Mon, 02 Feb 2026 18:43:41 +0000
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
Subject: [PATCH v2 12/20] KVM: arm64: Add RES1_WHEN_E2Hx constraints as configuration flags
Date: Mon,  2 Feb 2026 18:43:21 +0000
Message-ID: <20260202184329.2724080-13-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260202_104344_963076_CC3B5939 
X-CRM114-Status: GOOD (  15.09  )
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

"Thanks" to VHE, SCTLR_EL2 radically changes shape depending on the
value of HCR_EL2.E2H, as a lot of the bits that didn't have much
meaning with E2H=0 start impacting EL0 with E2H=1.

This has a direct impact on the RESx behaviour of these bits, and
we need a way to express them.

For this purpose, introduce two new constaints that, when the
controlling feature is not present, force the field to RES1 depending
on the value of E2H. Note that RES0 is still implicit,

This allows diverging RESx values depending on the value of E2H,
something that is required by a bunch of SCTLR_EL2 bits.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 7d133954ae01b..7e8e42c1cee4a 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -26,6 +26,8 @@ struct reg_bits_to_feat_map {
 #define	MASKS_POINTER	BIT(3)	/* Pointer to fgt_masks struct instead of bits */
 #define	AS_RES1		BIT(4)	/* RES1 when not supported */
 #define	REQUIRES_E2H1	BIT(5)	/* Add HCR_EL2.E2H RES1 as a pre-condition */
+#define	RES1_WHEN_E2H0	BIT(6)	/* RES1 when E2H=0 and not supported */
+#define	RES1_WHEN_E2H1	BIT(7)	/* RES1 when E2H=1 and not supported */
 
 	unsigned long	flags;
 
@@ -1297,10 +1299,14 @@ static struct resx compute_resx_bits(struct kvm *kvm,
 			match &= !e2h0;
 
 		if (!match) {
-			if (map[i].flags & AS_RES1)
- 				resx.res1 |= reg_feat_map_bits(&map[i]);
+			u64 bits = reg_feat_map_bits(&map[i]);
+
+			if ((map[i].flags & AS_RES1)			||
+			    (e2h0 && (map[i].flags & RES1_WHEN_E2H0))	||
+			    (!e2h0 && (map[i].flags & RES1_WHEN_E2H1)))
+				resx.res1 |= bits;
 			else
-				resx.res0 |= reg_feat_map_bits(&map[i]);
+				resx.res0 |= bits;
 		}
 	}
 
-- 
2.47.3


