Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C61606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 07:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aZs9YQeL;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ipervbUn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P3hdhOQZUT2FZ6Hh3e1FpgfLP6uVmzP7OGnEQtYKL48=; b=aZs9YQeLE6JIUV
	dfCiV+CoQghOTg0AP5POHCn9yDa03xhC4XcCLcdThkEOSWal8EmQlHl9wzMo35DoRBh+k1IjzHG1x
	dQzhlVwF5WQv0qqp1ELFPG7buKuKgUbEoUKITYQ9O2YvB2HOgEgQMr0T4CKN/qaZcufCvvGcOUzo7
	BAc5robWN11HYoI5ejSXizSt/98kk6fOD0l2+8A4iAZ3aFWEGHP+Qdo/+gaLSPpHczBtyasUnrnXG
	L+Exm40jBbQzWfoOdx8s9eetamXWekyrl/HDtLxGvIh1Fz3k51JBdqlxGSgK2ZZACN4lJhdDes1W4
	4TxP4bvmWIbiCavD46sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKt1o-00000000rBR-2RMk;
	Sun, 25 Oct 2026 07:52:28 +0000
Received: from out-77.mta0.migadu.com ([2001:41d0:1004:224b::4d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKt1l-00000000r8P-3EpO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 07:52:26 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=9tdQc3XLASUSgtohD1Zmp8zbuiOyq7kuHVLMF2vvkJs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792914743; v=1; x=1793519543;
 b=ipervbUnrzjwf6Sk2LT0ZYsSAmZCf4nZQ/SMcmVXK73Sw8GgcCvmFAbC3tJMzAtkNTfnvbpW
 5BRRKM6vl34yLhmvxfR+r5dvGvBHDHxvd6YIhjEBSLi4gBo9V2xQinRNMtjrTNbe/IvTHzq2x1W
 gEWJmxqhabe7axdoTqdsV8hs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c302dc059e47d3f9;
	Sun, 25 Oct 2026 07:52:23 +0000
X-Mizu-Trace-ID: c302dc059e47d3f9
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] KVM: arm64: selftests: Add ACCDATA_EL1 to get-reg-list
Date: Sun, 25 Oct 2026 07:51:38 +0000
Message-ID: <20261025075138.2919734-6-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025075138.2919734-1-fuad.tabba@linux.dev>
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_005225_953784_1308269B 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

KVM exposes ACCDATA_EL1 to userspace when the guest has
FEAT_LS64_ACCDATA. Add it to get-reg-list, conditioned on
ID_AA64ISAR1_EL1.LS64, so that the test still passes on hosts that
implement the feature.

Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/arm64/get-reg-list.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index 533994687b5d8..912590f9b0c2b 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -49,6 +49,7 @@ static struct feature_id_reg feat_id_regs[] = {
 	REG_FEAT(POR_EL1,	ID_AA64MMFR3_EL1, S1POE, IMP),
 	REG_FEAT(POR_EL0,	ID_AA64MMFR3_EL1, S1POE, IMP),
 	REG_FEAT(POR_EL2,	ID_AA64MMFR3_EL1, S1POE, IMP),
+	REG_FEAT(ACCDATA_EL1,	ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA),
 	REG_FEAT(HCRX_EL2,	ID_AA64MMFR1_EL1, HCX, IMP),
 	REG_FEAT(HFGRTR_EL2,	ID_AA64MMFR0_EL1, FGT, IMP),
 	REG_FEAT(HFGWTR_EL2,	ID_AA64MMFR0_EL1, FGT, IMP),
@@ -517,6 +518,7 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 12, 1, 1),	/* DISR_EL1 */
 	ARM64_SYS_REG(3, 0, 13, 0, 1),	/* CONTEXTIDR_EL1 */
 	ARM64_SYS_REG(3, 0, 13, 0, 4),	/* TPIDR_EL1 */
+	ARM64_SYS_REG(3, 0, 13, 0, 5),	/* ACCDATA_EL1 */
 	ARM64_SYS_REG(3, 0, 14, 1, 0),	/* CNTKCTL_EL1 */
 	ARM64_SYS_REG(3, 2, 0, 0, 0),	/* CSSELR_EL1 */
 	ARM64_SYS_REG(3, 3, 10, 2, 4),	/* POR_EL0 */
-- 
2.47.3


