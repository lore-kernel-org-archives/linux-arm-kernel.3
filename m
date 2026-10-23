Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14A260A2625
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ADl+XOcW;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VIIyaJ0S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IthMuZ/X3+pBoLoIufpj4zbJGn8A/2aYhe0XUm0DWMM=; b=ADl+XOcWsk/OwY
	uI/idKk8PFaFENd4IIFwPGtbgn14Yod8fSPKvJtHRkgWI0JciS1j03R/nBvFAYB9858REitQuyjoi
	wxDREkztHSpcMu7Cnk10COm0o/eUn/JEcgqBqBoQ9OUMpTk9cPHjj90NZky6j04149nSvEjDrYVmc
	J0nkuwrDyyKL/YRa5irH0sBb95qB8YAeLfcZ8/A0dkmyeGsp8hASk/HqD5IEGe/p5HKV41zPmkUaw
	6OYgS3LrdoBU4pUbOJBezkc+I8O83djTP3Tdvh5SytdD9W9bHKPTZY2/Lk0bgo059SXMQWiaA0Hjq
	wJY85KEJYQpafGnXdytA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HP-0000000FfsS-0M88;
	Fri, 23 Oct 2026 07:01:31 +0000
Received: from out-64.mta1.migadu.com ([2001:41d0:203:375::40] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HE-0000000Ffni-0G81
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:01:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=bc/l25RHGTThA1qU58knnGQTtBxP0XgtC5Ldu46NdMg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792738877; v=1; x=1793343677;
 b=VIIyaJ0Sw52+V97m1HKFMIqSa8yNktq8sfhmwLCLfRwHTvhwV0dPleik4OXIPg2DcDAfVuTs
 yVRIUsm/0QDbsndkPZ8u3CEHzlCuhbWSoLIFMxsl3QiNzNSTJBfnt8tWlqqrFHZzL9tRocntdjZ
 bLk6ry6z00cJbZ/RFAUTs7Mo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c1557c2947e98bd9;
	Fri, 23 Oct 2026 07:01:16 +0000
X-Mizu-Trace-ID: c1557c2947e98bd9
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] KVM: arm64: Hide FEAT_LS64_ACCDATA from guests
Date: Fri, 23 Oct 2026 08:01:09 +0100
Message-ID: <20261023070110.1833446-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023070110.1833446-1-fuad.tabba@linux.dev>
References: <20261023070110.1833446-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000121_443644_2232369D 
X-CRM114-Status: GOOD (  14.01  )
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

Since commit 58ce78667a641 ("arm64: Add support for FEAT_{LS64,
LS64_V}"), a guest sees the host's ID_AA64ISAR1_EL1.LS64, but KVM only
enables the FEAT_LS64 and FEAT_LS64_V instructions in HCRX_EL2. On a
host with FEAT_LS64_ACCDATA, a guest's ST64BV0 therefore traps and hits
the WARN_ON_ONCE() in handle_other(). ACCDATA_EL1 isn't trapped or
context-switched either, so every guest on that CPU shares it.

Rather than support FEAT_LS64_ACCDATA, which requires ACCDATA_EL1 to be
context-switched, cap the field at LS64_V. The guest's ACCDATA_EL1
accesses then UNDEF. This hides FEAT_LS64WB too, as it implies
FEAT_LS64_ACCDATA.

A VM saved on an older kernel can carry any level up to the host's, so
keep accepting those from the VMM, capped the same way. One saved at
LS64_ACCDATA or above restores at LS64_V.

Fixes: 58ce78667a641 ("arm64: Add support for FEAT_{LS64, LS64_V}")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/sys_regs.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 44aae52c473d7..7801166991b12 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1958,6 +1958,9 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 				 ID_AA64ISAR1_EL1_API |
 				 ID_AA64ISAR1_EL1_GPA |
 				 ID_AA64ISAR1_EL1_GPI);
+
+		/* ACCDATA_EL1 isn't context-switched, so no FEAT_LS64_ACCDATA */
+		val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64ISAR1_EL1, LS64, LS64_V);
 		break;
 	case SYS_ID_AA64ISAR2_EL1:
 		if (!vcpu_has_ptrauth(vcpu))
@@ -2403,6 +2406,22 @@ static int set_id_aa64pfr2_el1(struct kvm_vcpu *vcpu,
 	return set_id_reg(vcpu, rd, user_val);
 }
 
+static int set_id_aa64isar1_el1(struct kvm_vcpu *vcpu,
+				const struct sys_reg_desc *rd, u64 user_val)
+{
+	u64 hw_val = read_sanitised_ftr_reg(SYS_ID_AA64ISAR1_EL1);
+	u64 ls64_mask = ID_AA64ISAR1_EL1_LS64_MASK;
+
+	/*
+	 * Older kernels let userspace set LS64 up to the host's level, so
+	 * keep accepting those values, capped at LS64_V.
+	 */
+	if ((user_val & ls64_mask) <= (hw_val & ls64_mask))
+		user_val = ID_REG_LIMIT_FIELD_ENUM(user_val, ID_AA64ISAR1_EL1, LS64, LS64_V);
+
+	return set_id_reg(vcpu, rd, user_val);
+}
+
 /*
  * Allow userspace to de-feature a stage-2 translation granule but prevent it
  * from claiming the impossible.
@@ -3428,10 +3447,11 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 
 	/* CRm=6 */
 	ID_WRITABLE(ID_AA64ISAR0_EL1, ~ID_AA64ISAR0_EL1_RES0),
-	ID_WRITABLE(ID_AA64ISAR1_EL1, ~(ID_AA64ISAR1_EL1_GPI |
-					ID_AA64ISAR1_EL1_GPA |
-					ID_AA64ISAR1_EL1_API |
-					ID_AA64ISAR1_EL1_APA)),
+	ID_FILTERED(ID_AA64ISAR1_EL1, id_aa64isar1_el1,
+		    ~(ID_AA64ISAR1_EL1_GPI |
+		      ID_AA64ISAR1_EL1_GPA |
+		      ID_AA64ISAR1_EL1_API |
+		      ID_AA64ISAR1_EL1_APA)),
 	ID_WRITABLE(ID_AA64ISAR2_EL1, ~(ID_AA64ISAR2_EL1_RES0 |
 					ID_AA64ISAR2_EL1_APA3 |
 					ID_AA64ISAR2_EL1_GPA3)),
-- 
2.47.3


