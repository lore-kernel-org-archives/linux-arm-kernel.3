Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C5DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4HlyMbyPhKCnIL3AvhZ79kxUeT3XQMJg0KjZKyp1dU=; b=egJVrJWcWVEos/WTMIxGgSwx+I
	U5udeVicaqPCHl4vWltu4pDwqxcNrAT45Esf2X8nmms64Pb2g0RnQ8yMR4BM/rFjl2l9GR8TZH8Er
	HlsaN124QkqqvYGq8Jr52SkOG4LkwvgXD5I2l7kb31o6lZYuDb7yDjOT4preEaqFU80B7nh/uu8x8
	diZOywKuFvtZ+lCGsYkZBd9MQjwcaaGIIiDCiwek/luoIelKpKoKxlpBRXYkMd5WvDtaRALGbxFjx
	sFQQCMfmMeK19IRc0kisgeypO40hLnWyl2UA/hRo6HtXdFlLR7Xkaal420iTB0j+a065utFVmkj48
	jpG4L1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtfe-00000003F0N-1tmP;
	Thu, 09 Jul 2026 18:40:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtfd-00000003Eyd-0yxX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:40:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC04061387;
	Thu,  9 Jul 2026 18:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5C51F00A3A;
	Thu,  9 Jul 2026 18:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783622424;
	bh=X4HlyMbyPhKCnIL3AvhZ79kxUeT3XQMJg0KjZKyp1dU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=F2uBsk/Vwn+HtLHg3ciBoZS0lou2xWoDVEWwYesEEGBRK7yHGSN1NZHS1Jrxbdxs5
	 IN0kMOc28tqsmUQ+bpDWnBJ7wJE6Q236/KYjpHaFYTxV9ZJXxd0OKr+tOiEBFL51sC
	 axNdt6JNehXGQEJmZc15VUCMQ9q9iBv82Rv4cTr47L/oLtaWpIoHDW/9Rec2y9+Twr
	 PMs6FXk0fv1//EBA8O1bnYEsAKwCW6VdKrEWtyeVtiz4yfgCKLUI9iCObuMkLImd5S
	 Pband2E0PPQ9+2+uijLBi6razJZCyMl/hSqIFEJ2dyDXFlraeaiq40Eto7JvxDkxYr
	 D+tUwfFbnTZYg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 19:27:25 +0100
Subject: [PATCH v12 04/29] arm64/sve: Factor virtualizable VL discovery out
 of SVE specific code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v12-4-d0301d79ef58@kernel.org>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
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
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT+rtT/m0eK9SlRIe/SGmYC9t7dpPWB9eE/M37
 +zo+6Cyb8iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak/q7QAKCRAk1otyXVSH
 0IjnB/0eRU+G2bCmOTokgdLLuZk5znuDYAEAX60xA6kEE+As+EPR4JUgTHGmvY+RTA8i1ahwURI
 bOYucBN3owHKHVfVJd3XrX/q1mWLHpaTKjEzEEJqM7DYV6rC2VUB8CSEfuf+LeDudALLTw+aFXv
 7FeWwsznBsXC0dYrWhjiQjTg48yFaQQKS/X7zgihckyIVGQF0YwLSsZSC5a7/JzOCtXWV5ZIf7C
 /Pn416eVKBHoxOyJdXIR7UcA6tqq5a4HjhL5H66uEAlaK8IK9Fmh0uT3qZl8WhesrMgFBa4a6Un
 sZ4PunDTGYt/42wYvDIOBIDq4lKlDt1pM3x+fW9TbJ7EUybX
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


