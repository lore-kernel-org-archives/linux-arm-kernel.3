Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB27C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IY2m2ey8ZprxeXCeFi5qViLre80OB0BxgZ9ZCI0maBs=; b=mF9soJzTLyweh5+rXkhUT3/Y0N
	8tIP4o5iq285HGd/qY7+FZk4aQxVaMRCRlqH1dsQK3zKrXY4bT3vCl0g9elz+zovzCiL+10X8y/7B
	o39gGvVe/n8lr8IWrkWvVgtT1HCLYJB4OA9zXd5owxuoEYnIaveuHeGlDOl2M2PTOdf2MXZANFxhY
	he0Xa8lAAn/UJFF15nYGSLM4ZI1ba1uOyOjAdA20uG6zbiEegSDF6GiIQ5c/RFicN7myJYVSu37Sh
	lcU5Zyn+QJQ5/s79Nfotr8VW+2qUnPQcjYoEmnDPfJHQjwBJBE9IjbPUjlMDj/AIqzhLxjpiv6vNU
	4IWE/gJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSYc-00000009d8I-44np;
	Sun, 05 Jul 2026 19:31:14 +0000
Received: from confino.investici.org ([93.190.126.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSYa-00000009d7a-3zyh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1783279418;
	bh=IY2m2ey8ZprxeXCeFi5qViLre80OB0BxgZ9ZCI0maBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hv02HQZWmCuBTHfJFhvqmXiH5SKCpGNo7McfgpddZNtl/IQdhVgK2AcxE9+82FKa0
	 JAEgERuhKnOXcI7K+ZZPP/B8SZirxfZ/cQdCKuNEq7x7N15db7Hs0L/wziokm1z1St
	 ps1YzznStRcHi97umffoJIOTPMuSxQBnGomNU7TM=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4gtcpy1v2Xz10xb;
	Sun, 05 Jul 2026 19:23:38 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4gtcpx5NJ9z10wg;
	Sun, 05 Jul 2026 19:23:37 +0000 (UTC)
From: Bradley Morgan <include@grrlz.net>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bradley Morgan <include@grrlz.net>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: sleep: assert compute_mpidr_hash registers are distinct
Date: Sun,  5 Jul 2026 19:23:30 +0000
Message-ID: <20260705192331.23150-2-include@grrlz.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260705192331.23150-1-include@grrlz.net>
References: <20260705192331.23150-1-include@grrlz.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_123113_142900_7A59230D 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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

Turn the documented register distinctness requirement into an error
at build time instead of silent corruption.

Signed-off-by: Bradley Morgan <include@grrlz.net>
---
 arch/arm64/kernel/sleep.S | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
index f093cdf71be1..e112b8537f10 100644
--- a/arch/arm64/kernel/sleep.S
+++ b/arch/arm64/kernel/sleep.S
@@ -35,8 +35,22 @@
  * Output register: dst
  * Note: input and output registers must be disjoint register sets
          (eg: a macro instance with mpidr = x1 and dst = x1 is invalid)
+         This is enforced at build time by the assertions below.
  */
+	.macro mpidr_hash_assert_distinct reg, regs:vararg
+	.irp	r, \regs
+	.ifc	\reg, \r
+	.error	"compute_mpidr_hash: register arguments must be distinct"
+	.endif
+	.endr
+	.endm
+
 	.macro compute_mpidr_hash dst, rs0, rs1, rs2, rs3, mpidr, mask
+	/* \dst is written before any input is consumed */
+	mpidr_hash_assert_distinct \dst, \rs0, \rs1, \rs2, \rs3, \mpidr, \mask
+	/* \mpidr and \mask are clobbered while other inputs are still live */
+	mpidr_hash_assert_distinct \mpidr, \rs0, \rs1, \rs2, \rs3, \mask
+	mpidr_hash_assert_distinct \mask, \rs1, \rs2, \rs3
 	and	\mpidr, \mpidr, \mask		// mask out MPIDR bits
 	and	\dst, \mpidr, #0xff		// mask=aff0
 	lsr	\dst ,\dst, \rs0		// dst=aff0>>rs0
-- 
2.53.0


