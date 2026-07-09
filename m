Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AE3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4HlyMbyPhKCnIL3AvhZ79kxUeT3XQMJg0KjZKyp1dU=; b=UFV76CpKFC9bQ/b8PQ69/Qz8ka
	utX6MV05Hf9sHMlVa3GIEIYPINV6/h6xNg69mjOigTS5R/HWtuLqNCmzB0ervg/fBp4kFBXTHK3Vg
	6UVBrpA/yn616ooe/Ed/7dz9mwjQE9vUXgJxf164R/g3WfkI7+BFYmDDUeVHOk2KNS+T5aHavNJBY
	hdxu5tH09zOhMn5Bq05HKB/Ex32BOnGyqoJOVPF4EjKixdNUfdAgH8qr/9DX2a9i2lsDv0wsoY5mE
	DIP1C5zgT4IfENr39C/CP3X4L1saLvArDnoRhDbjIAVedPIBNB/nySu34KIm7sFLiVV+sS6HVoEM3
	noiefQFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd0b-00000000gLe-0IGs;
	Thu, 09 Jul 2026 00:52:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd0Z-00000000gKp-3gM2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:52:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 51AB543D45;
	Thu,  9 Jul 2026 00:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4780E1F000E9;
	Thu,  9 Jul 2026 00:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783558375;
	bh=X4HlyMbyPhKCnIL3AvhZ79kxUeT3XQMJg0KjZKyp1dU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JUMu2w8vQvMzmt9ADpIztO/PmzTnYneDyT5/F4o3erz9msnqX3P9z8fXTBB9hefcO
	 TimcoUmZWagvDEJ06ggP1wAQ4rWD+dgTPXEScAXrKiCco1TzKYI2IgCZ2f+vVn6fZO
	 hbf1Tq5GozmKATaallMSTfrvqR4qFJ0QaCAK58ExTcQ2JDNulgpHZWy9+dlVgE5l4C
	 gU9CbfOh50UD0HXSxQ1MrmGxUYys+IKzRKRggaPOcWdBKQfGSSF45BIjzctNUUbE88
	 dkjnNGci72JcbcosJACqzDqma7Sx7SZJEF4Cw8KFd1HWN/UlYee5iiT3U/V5qR60Gu
	 mLx7XHCrmy9lw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 01:51:41 +0100
Subject: [PATCH v11 04/29] arm64/sve: Factor virtualizable VL discovery out
 of SVE specific code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v11-4-32799f66db9d@kernel.org>
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2673; i=broonie@kernel.org;
 h=from:subject:message-id; bh=neew/zQKQc9VPVi7macEuVISGaMZgaNeHcW5WvUvtiM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqTvC98EPz3V9/AxA2ctVBmogPMysf+ANGUElc6
 7/1yiSJoPeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak7wvQAKCRAk1otyXVSH
 0GhLCACDfFY28B+Wo/awGJVxfMtSbkkTmZNrOlZrdlIvJ6eQMO87Ms6n3g0qMcvOC7vXYMzZS39
 cgBX2ZmVnnOdwLoEcdBaBBFkpjQ4DLlt5WmeNT8JgE+Dh1DcrO+dlq8otC3ymw4u4n7fwflzon7
 YsmNKzD478AXFIEisgACc5zZXsG6OjXy3OWxvQXIbb25AhX6jYAiaTV+rCDTu9GO8JNNguwOA2Q
 xGnJjf7p/Z0JW6eTKYzVGpiEjXfnE6KEvggu7yB+dsVpo6zx+9PVT6tNT7uYqIrloX5YSzkgS0s
 0KOioxQA4AaDKZKn26K+bK7yhXYky8q5SzPDHC/S4n+azFL6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

In preparation for reuising it for SME pull the code for discovering the
maximum virtualizable vector length out of sve_setup() into a separate
function.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index dc1ad10e39a2..5c156e2a47ea 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1114,6 +1114,29 @@ int vec_verify_vq_map(enum vec_type type)
 	return 0;
 }
 
+static int vec_virtualisable_vl(struct vl_info *info)
+{
+	DECLARE_BITMAP(partial_only_map, SVE_VQ_MAX);
+	unsigned long b_min_partial, b_max_virt;
+
+	bitmap_andnot(partial_only_map, info->vq_partial_map, info->vq_map,
+		      SVE_VQ_MAX);
+	b_min_partial = find_last_bit(partial_only_map, SVE_VQ_MAX);
+
+	/* All implemented VLs are virtualisable */
+	if (b_min_partial >= SVE_VQ_MAX)
+		return info->max_vl;
+
+	b_max_virt = find_next_bit(info->vq_map, SVE_VQ_MAX, b_min_partial);
+
+	/* No implemented VLs are virtualisable */
+	if (b_max_virt >= SVE_VQ_MAX)
+		return 0;
+
+	/* At least one virtualisable VL exists */
+	return sve_vl_from_vq(__bit_to_vq(b_max_virt));
+}
+
 void cpu_enable_sve(const struct arm64_cpu_capabilities *__always_unused p)
 {
 	write_sysreg(read_sysreg(CPACR_EL1) | CPACR_EL1_ZEN_EL1EN, CPACR_EL1);
@@ -1125,8 +1148,6 @@ void cpu_enable_sve(const struct arm64_cpu_capabilities *__always_unused p)
 void __init sve_setup(void)
 {
 	struct vl_info *info = &vl_info[ARM64_VEC_SVE];
-	DECLARE_BITMAP(tmp_map, SVE_VQ_MAX);
-	unsigned long b;
 	int max_bit;
 
 	if (!system_supports_sve())
@@ -1149,21 +1170,7 @@ void __init sve_setup(void)
 	 */
 	set_sve_default_vl(find_supported_vector_length(ARM64_VEC_SVE, 64));
 
-	bitmap_andnot(tmp_map, info->vq_partial_map, info->vq_map,
-		      SVE_VQ_MAX);
-
-	b = find_last_bit(tmp_map, SVE_VQ_MAX);
-	if (b >= SVE_VQ_MAX)
-		/* No non-virtualisable VLs found */
-		info->max_virtualisable_vl = SVE_VQ_MAX;
-	else if (WARN_ON(b == SVE_VQ_MAX - 1))
-		/* No virtualisable VLs?  This is architecturally forbidden. */
-		info->max_virtualisable_vl = SVE_VQ_MIN;
-	else /* b + 1 < SVE_VQ_MAX */
-		info->max_virtualisable_vl = sve_vl_from_vq(__bit_to_vq(b + 1));
-
-	if (info->max_virtualisable_vl > info->max_vl)
-		info->max_virtualisable_vl = info->max_vl;
+	info->max_virtualisable_vl = vec_virtualisable_vl(info);
 
 	pr_info("%s: maximum available vector length %u bytes per vector\n",
 		info->name, info->max_vl);

-- 
2.47.3


