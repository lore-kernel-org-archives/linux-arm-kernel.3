Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A254E73143
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYpcxqGvRxhYG0QsuE4f34xWVpveWhzLe6Nra9Z+A9M=; b=gB28qDhcSDvtIluA6KS3I1ScVg
	/cIdj9xchxycfDINJPsZlQDzKFs82qkToTkX/ql18hJI7Tyg8kUaTwMjxI6mMiOK+/VNEDCUbJUrR
	s/KwPUyamC0uicYL2WZK3VC+uSL8aW3VlRqnzsoYh0IzueTK4m7PCSWsSVIKbVq52fT0dvQY7UudP
	ZBd6jllWW2pizH0oVWcEV3lvfIxxK/53v4hORKeXXjDHdAauy61FSQsRYVHtH0bkpV1TnK2YOKBYj
	A7V/47wDWK+pdKAt6JMUSXlblila9clHhtZ7doWtDKitHexCCbTnRa4mui2xx7P3fIqk7lVoWLuU2
	p8Jw0Fbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyu2-00000005RPv-1nK9;
	Mon, 02 Feb 2026 18:44:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytl-00000005R1b-1B5t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 811FC444DD;
	Mon,  2 Feb 2026 18:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A45C2BCB3;
	Mon,  2 Feb 2026 18:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057824;
	bh=flpwAOTJ4OOyVy4Gw7W9QK7+pIUWmW+MlDECJb84DtY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XfE48p2o7ScQ3aug//mIG05qV0SrsKUrVIvwjjGTKDUXJMFAnUlRHo+ee8vXVhsyp
	 aBZ+uiUasmhh+wubzuQqf7Zp/XB7WCITbnideD7OD8PMG5lpCUB7GqWFDXAUUlxN9H
	 QH5uUOEmD8ZuhXXxkRDuAKRCSzqqKrm+dmNr9pYfAV8Irh7vvk2fAPa08wDGk1IBCQ
	 6HXFRn+c6Q8cfdoodvBvau977U17gq75tVXUZrqAoqsJmLIJ7tNddcnaBYlSjtyOKK
	 iMhR2aPehuu83glEJ0RYl+XoXqk9p0x+VLdgPTJ8t0vEReE996FILFjrwEPahMsT+5
	 +jLMBIsw1BhUQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmyti-00000007sAy-1jkE;
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
Subject: [PATCH v2 16/20] KVM: arm64: Simplify handling of full register invalid constraint
Date: Mon,  2 Feb 2026 18:43:25 +0000
Message-ID: <20260202184329.2724080-17-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260202_104345_583301_27DEFEAA 
X-CRM114-Status: GOOD (  13.35  )
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

Now that we embed the RESx bits in the register description, it becomes
easier to deal with registers that are simply not valid, as their
existence is not satisfied by the configuration (SCTLR2_ELx without
FEAT_SCTLR2, for example). Such registers essentially become RES0 for
any bit that wasn't already advertised as RESx.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 274ae049c4b33..b37b40744db94 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1321,7 +1321,7 @@ static struct resx compute_reg_resx_bits(struct kvm *kvm,
 					 unsigned long require,
 					 unsigned long exclude)
 {
-	struct resx resx, tmp;
+	struct resx resx;
 
 	resx = compute_resx_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
 				 require, exclude);
@@ -1331,11 +1331,14 @@ static struct resx compute_reg_resx_bits(struct kvm *kvm,
 		resx.res1 |= r->feat_map.masks->res1;
 	}
 
-	tmp = compute_resx_bits(kvm, &r->feat_map, 1, require, exclude);
-
-	resx.res0 |= tmp.res0;
-	resx.res0 |= ~reg_feat_map_bits(&r->feat_map);
-	resx.res1 |= tmp.res1;
+	/*
+	 * If the register itself was not valid, all the non-RESx bits are
+	 * now considered RES0 (this matches the behaviour of registers such
+	 * as SCTLR2 and TCR2). Weed out any potential (though unlikely)
+	 * overlap with RES1 bits coming from the previous computation.
+	 */
+	resx.res0 |= compute_resx_bits(kvm, &r->feat_map, 1, require, exclude).res0;
+	resx.res1 &= ~resx.res0;
 
 	return resx;
 }
-- 
2.47.3


