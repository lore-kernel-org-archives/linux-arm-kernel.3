Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FE3FCB637
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlkWFyl1qzwf6g93LhzBLwEpn8LGt/0V45tWNZ1lVJg=; b=EAdRj+5RKfeQ3+nlJmPs6LbZL3
	0Du3Ut5lUNP0uOCa9igpFawAfTRV7KP+x8pN8me6liar7CCtEDgKr2GDrvQXA+M9pjwpsZR02b7GM
	waIAqJR68I2W8wRsAHCwySXznqTBmvJyo30hkMDgy+UV/cWvQs2XIUrwjOCRvtjgJs/qee8WyOD3u
	7YlkwlL1/0YUmLwTGm9LZo19f3WD6IjTn/rh8f7Et5NkXDqXPPmpuLD5RUdQ2YZcSqf8iMeIKeq8+
	+5I4VbweMsbi4YSQ1loLKPRKE56GI+QNvdID/2lEz7kwRM3Rk5mVQL5+gBvwE4cG1O3yOPqslfzTF
	stKowQug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgL-00000004CjR-2Y6M;
	Fri, 06 Mar 2026 17:09:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgJ-00000004Cht-1j2L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:09:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 071A643735;
	Fri,  6 Mar 2026 17:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCDF6C2BCB3;
	Fri,  6 Mar 2026 17:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772816982;
	bh=sxGE8ds7O7e2xiqhxdLSPHlYvj4uo9nY+mVtuvgP/7Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y2Z2u0cfWixgxUHkakeXFpwx2rRQQ060MUQV/HtgY0/WPCC8pAIr9c831ZLfYfTkR
	 dsFmYToYkUZdwBugz3YJufa/tu4u0uNNQrOIiYZRj+bEpV6DBWmb7zOWtiwJ4/vfmj
	 n/cRNtCJapIa8Ni3tHJRYh5utp8FD+wdVz8G4S1pmc72vFu4STp4Hv7AyJ3120D7S8
	 0LIxxMOVKgG1PUyILsHovKvbHT8Oyz3/0RBuIHmb0GDh2+gIaOsQlMXpdofIP+Eop8
	 eZe0YyhNzNFCFnXFaQ1xYLvWEp5IKhY6v0zZcuHcpOieggeKCXiC51UUta+Pmair7p
	 2jHlsD/CeYYFA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:00:56 +0000
Subject: [PATCH v10 04/30] arm64/fpsimd: Determine maximum virtualisable
 SME vector length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-4-43f7683a0fb7@kernel.org>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
In-Reply-To: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-6ac23
X-Developer-Signature: v=1; a=openpgp-sha256; l=2807; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sxGE8ds7O7e2xiqhxdLSPHlYvj4uo9nY+mVtuvgP/7Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpqwor0zNBUzB9WNxy4RgcdBBPLU7P1PPQxFqYF
 6wVUbMPFnuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaasKKwAKCRAk1otyXVSH
 0CXWB/oDaxzGIoAF7C6ZU1ssTeUidjJB1twTqQ6/6Wm38rt2CX4D5G5FP217toFJybD2sadvy/u
 M8akLGgOI95eUfOA5nluGwDGRB4Ry+2rzGJCxgidUmPzeExMkls9UFU+OlCp2333wy24399YDtD
 ProNtda5Ahobw7kErxQ5PKZXn9wOm+R3d0+M4EeioNzMO/NzPn51OXetLA/hstwBBy0caMB9LDD
 eq4BFlZFTmnfNrhMytwIqliDuDpBFm6lBprrKPqsnWTTPoguOli53Lxx4iWFNDfnil277UQlvuB
 ZlCVXWklzMQzPh1oBiblUjyUqFmEqvJN8nBoMWam7kAfw5iI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_090943_504848_4C78D6BB 
X-CRM114-Status: GOOD (  12.82  )
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

As with SVE we can only virtualise SME vector lengths that are supported by
all CPUs in the system, implement similar checks to those for SVE. Since
unlike SVE there are no specific vector lengths that are architecturally
required the handling is subtly different, we report a system where this
happens with a maximum vector length of SME_VQ_INVALID.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |  2 ++
 arch/arm64/kernel/fpsimd.c      | 21 ++++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index e97729aa3b2f..0cd8a866e844 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -69,6 +69,8 @@ static inline void cpacr_restore(unsigned long cpacr)
 #define ARCH_SVE_VQ_MAX ((ZCR_ELx_LEN_MASK >> ZCR_ELx_LEN_SHIFT) + 1)
 #define SME_VQ_MAX	((SMCR_ELx_LEN_MASK >> SMCR_ELx_LEN_SHIFT) + 1)
 
+#define SME_VQ_INVALID	(SME_VQ_MAX + 1)
+
 struct task_struct;
 
 extern void fpsimd_save_state(struct user_fpsimd_state *state);
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 2af0e0c5b9f4..49c050ef6db9 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1218,7 +1218,8 @@ void cpu_enable_sme(const struct arm64_cpu_capabilities *__always_unused p)
 void __init sme_setup(void)
 {
 	struct vl_info *info = &vl_info[ARM64_VEC_SME];
-	int min_bit, max_bit;
+	DECLARE_BITMAP(tmp_map, SVE_VQ_MAX);
+	int min_bit, max_bit, b;
 
 	if (!system_supports_sme())
 		return;
@@ -1249,12 +1250,30 @@ void __init sme_setup(void)
 	 */
 	set_sme_default_vl(find_supported_vector_length(ARM64_VEC_SME, 32));
 
+	bitmap_andnot(tmp_map, info->vq_partial_map, info->vq_map,
+		      SVE_VQ_MAX);
+
+	b = find_last_bit(tmp_map, SVE_VQ_MAX);
+	if (b >= SVE_VQ_MAX)
+		/* All VLs virtualisable */
+		info->max_virtualisable_vl = sve_vl_from_vq(ARCH_SVE_VQ_MAX);
+	else if (b == SVE_VQ_MAX - 1)
+		/* No virtualisable VLs */
+		info->max_virtualisable_vl = sve_vl_from_vq(SME_VQ_INVALID);
+	else
+		info->max_virtualisable_vl = sve_vl_from_vq(__bit_to_vq(b +  1));
+
 	pr_info("SME: minimum available vector length %u bytes per vector\n",
 		info->min_vl);
 	pr_info("SME: maximum available vector length %u bytes per vector\n",
 		info->max_vl);
 	pr_info("SME: default vector length %u bytes per vector\n",
 		get_sme_default_vl());
+
+	/* KVM decides whether to support mismatched systems. Just warn here: */
+	if (info->max_virtualisable_vl < info->max_vl ||
+	    info->max_virtualisable_vl == sve_vl_from_vq(SME_VQ_INVALID))
+		pr_warn("SME: unvirtualisable vector lengths present\n");
 }
 
 void sme_suspend_exit(void)

-- 
2.47.3


