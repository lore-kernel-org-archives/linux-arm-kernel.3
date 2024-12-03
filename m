Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2302EE64A8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZlmU/G+wakOkyEyRTtPjfs9QlPYZyjbDhy4avsfNck=; b=QLRTXJxqdS+wUGp2gzaBkgbWkI
	tJr53JrsURWdK9rBTbkJfndCiahmmYhpL5gQg9p+iv4BzqwNNSfeqA34/V7zZGGzzE6fQ/uS8HQiS
	AaSTcnKYTw6n4+QhSRv9eM0kybJdArB3tuBIT1sZtvSvN8PRK99KQqJBSvAAqjgdFy58Thv04Gdny
	3KF0/lThC94a9VZ1lIPAoQjg3gvBpwJpZnbAyVyiOIHedUTZCNNNp5sItaMBM8pj2eakirUMdEfkc
	CJ5Qs1VguS9WLYFGFCcrqF6sJ4jaMkHPzNWGqDUeS47Cptsvj4Rk6nZuRS3AVXKmlIq6DhmrmhR4P
	FZNNnjUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISTD-00000009WEo-2uH7;
	Tue, 03 Dec 2024 12:57:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISGA-00000009TAo-3zsr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:44:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C4A05C6CE3;
	Tue,  3 Dec 2024 12:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694D1C4CED6;
	Tue,  3 Dec 2024 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733229850;
	bh=iv/w/FqsQC6tPqMPucMTK26kMUPc3meLY49LgS4Xj9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F1TrMhZA//7W42VJd9r6UioyoTxbSoJC6THEev5d41JEGx5NzAVPMlPQ3ClWtnzWN
	 /9K/AzbhW+YzSwytURaLyjNxb5ivA+byZPDyomew6OxyWDi28GgYsDgn9qb6dtyWiv
	 1EXkIu26TPHQlYTTy+3QRmcRNh4yKQ6KOUdB5j0rK/ZvqDsOA1aGP1gIXsJ5RonvmO
	 aMPI6CKTHUE6uIMy2u16+SJrJwG2djddivHZFYVd3QhEqUZP2CRmhis4TowRD3y4tL
	 UBDQ/0970m4AYVVpk0MZq/08eqwSmHJDdtHpmKHigJx1atBSBtAev03md81D40QBQu
	 qjfrRPLYTwV7A==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Dec 2024 12:39:28 +0000
Subject: [PATCH v3 9/9] kselftest/arm64: Add 2024 dpISA extensions to hwcap
 test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-arm64-2024-dpisa-v3-9-a6c78b1aa297@kernel.org>
References: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
In-Reply-To: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=10054; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iv/w/FqsQC6tPqMPucMTK26kMUPc3meLY49LgS4Xj9U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnTvz6UgEkXFDjSj5XiHq/qzkCEh4xJzB3vc8x+CUh
 /N4HRYSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ078+gAKCRAk1otyXVSH0G/eB/
 sERZZVCmoFv+505IMyxk1dFkBDSxarIKVZE+liAty2jSeikULu1ovWtFhyW5Btl6rG6DHlElXT6e61
 PMRnmMJCu1Wb1ZXNuXxGxHC3FFiFq6quXBXPLRXtGbTUB6J14+l44RAScGM+UV4DqR30VY3Sj28lz7
 A4yHTeel3xy1TmMbL3Mzmq68EGS17o0daXFnlvbGQslWRMFA7EdUXiSiPWqYCEbg5Pz1bLKS9LAo16
 4yOIjLWLSvKcd0bvlSGUei1FSB8i5sKHhavzI3c1MeYBAK2wkS9zmdnylgo/0U1XLxYX5m2Hqnw0R0
 OnhAwc+dxyPSpPmYG1eCwAetSapuGt
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044411_086026_2958F87B 
X-CRM114-Status: GOOD (  15.04  )
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

Add coverage of the hwcaps for the 2024 dpISA extensions to the hwcap
test.

We don't actually test SIGILL generation for CMPBR since the need to
branch makes it a pain to generate and the SIGILL detection would be
unreliable anyway. Since this should be very unusual we provide a stub
function rather than supporting a missing test.

The sigill functions aren't well sorted in the file so the ordering is a
bit random.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 273 +++++++++++++++++++++++++++++-
 1 file changed, 271 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 0029ed9c5c9aa4451f3d0573ee672eca993fb2f4..2a230cfa4cb4108580a16161e2df03a513710dbc 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -46,6 +46,12 @@ static void atomics_sigill(void)
 	asm volatile(".inst 0xb82003ff" : : : );
 }
 
+static void cmpbr_sigill(void)
+{
+	/* Not implemented, too complicated and unreliable anyway */
+}
+
+
 static void crc32_sigill(void)
 {
 	/* CRC32W W0, W0, W1 */
@@ -82,6 +88,18 @@ static void f8fma_sigill(void)
 	asm volatile(".inst 0xec0fc00");
 }
 
+static void f8mm4_sigill(void)
+{
+	/* FMMLA V0.4SH, V0.16B, V0.16B */
+	asm volatile(".inst 0x6e00ec00");
+}
+
+static void f8mm8_sigill(void)
+{
+	/* FMMLA V0.4S, V0.16B, V0.16B */
+	asm volatile(".inst 0x6e80ec00");
+}
+
 static void faminmax_sigill(void)
 {
 	/* FAMIN V0.4H, V0.4H, V0.4H */
@@ -98,6 +116,12 @@ static void fpmr_sigill(void)
 	asm volatile("mrs x0, S3_3_C4_C4_2" : : : "x0");
 }
 
+static void fprcvt_sigill(void)
+{
+	/* FCVTAS S0, H0 */
+	asm volatile(".inst 0x1efa0000");
+}
+
 static void gcs_sigill(void)
 {
 	unsigned long *gcspr;
@@ -226,6 +250,42 @@ static void sme2p1_sigill(void)
 	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
 }
 
+static void sme2p2_sigill(void)
+{
+	/* SMSTART SM */
+	asm volatile("msr S0_3_C4_C3_3, xzr" : : : );
+
+	/* UXTB Z0.D, P0/Z, Z0.D  */
+	asm volatile(".inst 0x4c1a000" : : : );
+
+	/* SMSTOP */
+	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
+}
+
+static void sme_aes_sigill(void)
+{
+	/* SMSTART SM */
+	asm volatile("msr S0_3_C4_C3_3, xzr" : : : );
+
+	/* AESD z0.b, z0.b, z0.b */
+	asm volatile(".inst 0x4522e400" : : : "z0");
+
+	/* SMSTOP */
+	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
+}
+
+static void sme_sbitperm_sigill(void)
+{
+	/* SMSTART SM */
+	asm volatile("msr S0_3_C4_C3_3, xzr" : : : );
+
+	/* BDEP Z0.B, Z0.B, Z0.B */
+	asm volatile(".inst 0x4500b400" : : : "z0");
+
+	/* SMSTOP */
+	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
+}
+
 static void smei16i32_sigill(void)
 {
 	/* SMSTART */
@@ -334,13 +394,73 @@ static void smesf8dp4_sigill(void)
 	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
 }
 
+static void smesf8mm8_sigill(void)
+{
+	/* SMSTART */
+	asm volatile("msr S0_3_C4_C7_3, xzr" : : : );
+
+	/* FMMLA V0.4S, V0.16B, V0.16B */
+	asm volatile(".inst 0x6e80ec00");
+
+	/* SMSTOP */
+	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
+}
+
+static void smesf8mm4_sigill(void)
+{
+	/* SMSTART */
+	asm volatile("msr S0_3_C4_C7_3, xzr" : : : );
+
+	/* FMMLA V0.4SH, V0.16B, V0.16B */
+	asm volatile(".inst 0x6e00ec00");
+
+	/* SMSTOP */
+	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
+}
+
 static void smesf8fma_sigill(void)
 {
 	/* SMSTART */
 	asm volatile("msr S0_3_C4_C7_3, xzr" : : : );
 
-	/* FMLALB V0.8H, V0.16B, V0.16B */
-	asm volatile(".inst 0xec0fc00");
+	/* FMLALB Z0.8H, Z0.B, Z0.B */
+	asm volatile(".inst 0x64205000");
+
+	/* SMSTOP */
+	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
+}
+
+static void smesfexpa_sigill(void)
+{
+	/* SMSTART */
+	asm volatile("msr S0_3_C4_C7_3, xzr" : : : );
+
+	/* FEXPA Z0.D, Z0.D */
+	asm volatile(".inst 0x04e0b800");
+
+	/* SMSTOP */
+	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
+}
+
+static void smesmop4_sigill(void)
+{
+	/* SMSTART */
+	asm volatile("msr S0_3_C4_C7_3, xzr" : : : );
+
+	/* SMOP4A ZA0.S, Z0.B, { Z0.B - Z1.B } */
+	asm volatile(".inst 0x80108000");
+
+	/* SMSTOP */
+	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
+}
+
+static void smestmop_sigill(void)
+{
+	/* SMSTART */
+	asm volatile("msr S0_3_C4_C7_3, xzr" : : : );
+
+	/* STMOPA ZA0.S, { Z0.H - Z1.H }, Z0.H, Z20[0] */
+	asm volatile(".inst 0x80408008");
 
 	/* SMSTOP */
 	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
@@ -364,18 +484,42 @@ static void sve2p1_sigill(void)
 	asm volatile(".inst 0x65000000" : : : "z0");
 }
 
+static void sve2p2_sigill(void)
+{
+	/* NOT Z0.D, P0/Z, Z0.D */
+	asm volatile(".inst 0x4cea000" : : : "z0");
+}
+
 static void sveaes_sigill(void)
 {
 	/* AESD z0.b, z0.b, z0.b */
 	asm volatile(".inst 0x4522e400" : : : "z0");
 }
 
+static void sveaes2_sigill(void)
+{
+	/* AESD {Z0.B - Z1.B }, { Z0.B - Z1.B }, Z0.Q */
+	asm volatile(".inst 0x4522ec00" : : : "z0");
+}
+
 static void sveb16b16_sigill(void)
 {
 	/* BFADD Z0.H, Z0.H, Z0.H */
 	asm volatile(".inst 0x65000000" : : : );
 }
 
+static void svebfscale_sigill(void)
+{
+	/* BFSCALE Z0.H, P0/M, Z0.H, Z0.H */
+	asm volatile(".inst 0x65098000" : : : "z0");
+}
+
+static void svef16mm_sigill(void)
+{
+	/* FMMLA Z0.S, Z0.H, Z0.H */
+	asm volatile(".inst 0x6420e400");
+}
+
 static void svepmull_sigill(void)
 {
 	/* PMULLB Z0.Q, Z0.D, Z0.D */
@@ -394,6 +538,12 @@ static void svesha3_sigill(void)
 	asm volatile(".inst 0x4203800" : : : "z0");
 }
 
+static void sveeltperm_sigill(void)
+{
+	/* COMPACT Z0.B, P0, Z0.B */
+	asm volatile(".inst 0x5218000" : : : "x0");
+}
+
 static void svesm4_sigill(void)
 {
 	/* SM4E Z0.S, Z0.S, Z0.S */
@@ -469,6 +619,13 @@ static const struct hwcap_data {
 		.cpuinfo = "aes",
 		.sigill_fn = aes_sigill,
 	},
+	{
+		.name = "CMPBR",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_CMPBR,
+		.cpuinfo = "cmpbr",
+		.sigill_fn = cmpbr_sigill,
+	},
 	{
 		.name = "CRC32",
 		.at_hwcap = AT_HWCAP,
@@ -523,6 +680,20 @@ static const struct hwcap_data {
 		.cpuinfo = "f8fma",
 		.sigill_fn = f8fma_sigill,
 	},
+	{
+		.name = "F8MM8",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_F8MM8,
+		.cpuinfo = "f8mm8",
+		.sigill_fn = f8mm8_sigill,
+	},
+	{
+		.name = "F8MM4",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_F8MM4,
+		.cpuinfo = "f8mm4",
+		.sigill_fn = f8mm4_sigill,
+	},
 	{
 		.name = "FAMINMAX",
 		.at_hwcap = AT_HWCAP2,
@@ -545,6 +716,13 @@ static const struct hwcap_data {
 		.sigill_fn = fpmr_sigill,
 		.sigill_reliable = true,
 	},
+	{
+		.name = "FPRCVT",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_FPRCVT,
+		.cpuinfo = "fprcvt",
+		.sigill_fn = fprcvt_sigill,
+	},
 	{
 		.name = "GCS",
 		.at_hwcap = AT_HWCAP,
@@ -691,6 +869,20 @@ static const struct hwcap_data {
 		.cpuinfo = "sme2p1",
 		.sigill_fn = sme2p1_sigill,
 	},
+	{
+		.name = "SME 2.2",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_SME2P2,
+		.cpuinfo = "sme2p2",
+		.sigill_fn = sme2p2_sigill,
+	},
+	{
+		.name = "SME AES",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_SME_AES,
+		.cpuinfo = "smeaes",
+		.sigill_fn = sme_aes_sigill,
+	},
 	{
 		.name = "SME I16I32",
 		.at_hwcap = AT_HWCAP2,
@@ -740,6 +932,13 @@ static const struct hwcap_data {
 		.cpuinfo = "smelutv2",
 		.sigill_fn = smelutv2_sigill,
 	},
+	{
+		.name = "SME SBITPERM",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_SME_SBITPERM,
+		.cpuinfo = "smesbitperm",
+		.sigill_fn = sme_sbitperm_sigill,
+	},
 	{
 		.name = "SME SF8FMA",
 		.at_hwcap = AT_HWCAP2,
@@ -747,6 +946,20 @@ static const struct hwcap_data {
 		.cpuinfo = "smesf8fma",
 		.sigill_fn = smesf8fma_sigill,
 	},
+	{
+		.name = "SME SF8MM8",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_SME_SF8MM8,
+		.cpuinfo = "smesf8mm8",
+		.sigill_fn = smesf8mm8_sigill,
+	},
+	{
+		.name = "SME SF8MM4",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_SME_SF8MM8,
+		.cpuinfo = "smesf8mm4",
+		.sigill_fn = smesf8mm4_sigill,
+	},
 	{
 		.name = "SME SF8DP2",
 		.at_hwcap = AT_HWCAP2,
@@ -761,6 +974,27 @@ static const struct hwcap_data {
 		.cpuinfo = "smesf8dp4",
 		.sigill_fn = smesf8dp4_sigill,
 	},
+	{
+		.name = "SME SFEXPA",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_SME_SFEXPA,
+		.cpuinfo = "smesfexpa",
+		.sigill_fn = smesfexpa_sigill,
+	},
+	{
+		.name = "SME SMOP4",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_SME_SMOP4,
+		.cpuinfo = "smesmop4",
+		.sigill_fn = smesmop4_sigill,
+	},
+	{
+		.name = "SME STMOP",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_SME_STMOP,
+		.cpuinfo = "smestmop",
+		.sigill_fn = smestmop_sigill,
+	},
 	{
 		.name = "SVE",
 		.at_hwcap = AT_HWCAP,
@@ -783,6 +1017,13 @@ static const struct hwcap_data {
 		.cpuinfo = "sve2p1",
 		.sigill_fn = sve2p1_sigill,
 	},
+	{
+		.name = "SVE 2.2",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_SVE2P2,
+		.cpuinfo = "sve2p2",
+		.sigill_fn = sve2p2_sigill,
+	},
 	{
 		.name = "SVE AES",
 		.at_hwcap = AT_HWCAP2,
@@ -790,6 +1031,34 @@ static const struct hwcap_data {
 		.cpuinfo = "sveaes",
 		.sigill_fn = sveaes_sigill,
 	},
+	{
+		.name = "SVE AES2",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_SVE_AES2,
+		.cpuinfo = "sveaes2",
+		.sigill_fn = sveaes2_sigill,
+	},
+	{
+		.name = "SVE BFSCALE",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_SVE_BFSCALE,
+		.cpuinfo = "svebfscale",
+		.sigill_fn = svebfscale_sigill,
+	},
+	{
+		.name = "SVE ELTPERM",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_SVE_ELTPERM,
+		.cpuinfo = "sveeltperm",
+		.sigill_fn = sveeltperm_sigill,
+	},
+	{
+		.name = "SVE F16MM",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_SVE_F16MM,
+		.cpuinfo = "svef16mm",
+		.sigill_fn = svef16mm_sigill,
+	},
 	{
 		.name = "SVE2 B16B16",
 		.at_hwcap = AT_HWCAP2,

-- 
2.39.5


