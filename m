Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62A2EB363C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 22:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWalVExBTGjZPEBLfABFI3EH7NjGM21DkQKBzKtktzA=; b=o9G13oN3maIXGywbeoKNEgMvdw
	p6KSHRw1oi1yaOwkbqdT2mTBkFMvGqtS01hLK30asr5lGco8Tv9CmUbYEw14IuyzDg99Y948WjXs8
	SoEHe85Njjva69Zx+q0rluOhxXAEcn4hspdwdXLR4tpJ/75wxsaFzXKPaq7HT/9PQ+pQ8OB8dv3He
	044SpdAvhrT8qLQFExgNRtWsFzDyDuPRRz3WFEugu0GHY011RoeFiyFoDCnEOfxlkYwHyLK6CziTE
	q0BQbxaJ7tzWJOeDtlz1A8EiszCztMeg2k7K9l2TYJQx5dRynkDa5EEGpDIqp405zK5gskCYX5Pe7
	l0HqRmcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCF0-0000000EAFS-26vT;
	Mon, 02 Mar 2026 22:59:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCEy-0000000EAC5-04Gd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 22:59:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B414040210;
	Mon,  2 Mar 2026 22:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC58C2BCB2;
	Mon,  2 Mar 2026 22:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492391;
	bh=k28xlv3oqLuHGwNR19fusA0RoHT8v5EmRNzuxn2QGlU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k8Nb7BfDOuhfHjfQAMn2RzA9+DFR0vjbh5Uv5CpQFIF737318k9SCnol82uTqZQTg
	 F1O7+vjxEQ46MoVUDcBOxjIfUf23gyDouY6c9Kj8aazUlQqhVwUQs59MBkn+WpArPG
	 NZBcERNmvsnuvccGek6jtN9yz+lVAawsHFEBJsoTBafwWj9ElQO+UWmNs+2/uHSA3T
	 Q/fZwpswTbuHKvcuqZLHYo5lbXvlRfGUKwlPHSqq4RD0SIa66zB0BpQQ7uNZR/p1T/
	 ndnENqy/uj4M5uAPvdh20y84YoD1vVB2Jj5/GDMepR7SYWguKEEe8YqlMdngjacOwY
	 e/FMKY5lKyC2g==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Mar 2026 22:53:23 +0000
Subject: [PATCH 8/8] kselftest/arm64: Add 2025 dpISA coverage to hwcaps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-arm64-dpisa-2025-v1-8-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5080; i=broonie@kernel.org;
 h=from:subject:message-id; bh=k28xlv3oqLuHGwNR19fusA0RoHT8v5EmRNzuxn2QGlU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpphZU7oC8QDO2MV5R+ciPpTV9RuVrZ00VY0ySE
 QFZ8dwzDumJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaYWVAAKCRAk1otyXVSH
 0AgWB/0W2H9qyDm1/Hh2fBseSJgT62ZDZcnq6WbxOSLC7jcizLb+9K9rZI/Um4UFrt2YsI0dK+S
 TqKgp71KDtpFYqoRkPQuyBMKrXLZdPnsD5zhfDHCz2ny9clsi3hpPW2tkNYsyCCtUCtwA7LVqUL
 wF+CXVMWMgtEU2A50W5gJva8K+tVsWvc+rpDxdLaE/VOkZnFPPiBC9QRICMidRjbAdPPXVK0DUE
 EMorjxB9OAmwtbs2SB/hSRI0qs+j8mVj3XkbHHN9KpsYUGjpKrvouEaY6m1vsqZ0TDZihFKQY4l
 SMkDSHu7vbU2Urzwr0JWcHSKrYdU6ENdBP+/k/9iESMVyMJk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_145952_110408_CCF72DA4 
X-CRM114-Status: GOOD (  11.13  )
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

Add coverage of the new hwcaps to the test program, encodings cross checked
against LLVM 22.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 116 ++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 9d2df1f3e6bb..fbb5563ac7ac 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -107,6 +107,24 @@ static void f8mm8_sigill(void)
 	asm volatile(".inst 0x6e80ec00");
 }
 
+static void f16f32dot_sigill(void)
+{
+	/* FDOT V0.2S, V0.4H, V0.2H[0] */
+	asm volatile(".inst 0xf409000");
+}
+
+static void f16f32mm_sigill(void)
+{
+	/* FMMLA V0.4S, V0.8H, V0.8H */
+	asm volatile(".inst 0x4e40ec00");
+}
+
+static void f16mm_sigill(void)
+{
+	/* FMMLA V0.8H, V0.8H, V0.8H */
+	asm volatile(".inst 0x4ec0ec00");
+}
+
 static void faminmax_sigill(void)
 {
 	/* FAMIN V0.4H, V0.4H, V0.4H */
@@ -190,6 +208,12 @@ static void lut_sigill(void)
 	asm volatile(".inst 0x4e801000");
 }
 
+static void lut6_sigill(void)
+{
+	/* LUTI6 Z0.H, { Z0.H, Z1.H }, Z0[0] */
+	asm volatile(".inst 0x4560ac00");
+}
+
 static void mops_sigill(void)
 {
 	char dst[1], src[1];
@@ -281,6 +305,18 @@ static void sme2p2_sigill(void)
 	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
 }
 
+static void sme2p3_sigill(void)
+{
+	/* SMSTART SM */
+	asm volatile("msr S0_3_C4_C3_3, xzr" : : : );
+
+	/* ADDQP Z0.B, Z0.B, Z0.B */
+	asm volatile(".inst 0x4207800" : : : "z0");
+
+	/* SMSTOP */
+	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
+}
+
 static void sme_aes_sigill(void)
 {
 	/* SMSTART SM */
@@ -377,6 +413,18 @@ static void smef8f32_sigill(void)
 	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
 }
 
+static void smelut6_sigill(void)
+{
+	/* SMSTART */
+	asm volatile("msr S0_3_C4_C7_3, xzr" : : : );
+
+	/* LUTI6 { Z0.B-Z3.B }, ZT0, { Z0-Z2 } */
+	asm volatile(".inst 0xc08a0000" : : : );
+
+	/* SMSTOP */
+	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
+}
+
 static void smelutv2_sigill(void)
 {
 	/* SMSTART */
@@ -485,6 +533,12 @@ static void sve2p2_sigill(void)
 	asm volatile(".inst 0x4cea000" : : : "z0");
 }
 
+static void sve2p3_sigill(void)
+{
+	/* ADDQP Z0.B, Z0.B, Z0.B */
+	asm volatile(".inst 0x4207800" : : : "z0");
+}
+
 static void sveaes_sigill(void)
 {
 	/* AESD z0.b, z0.b, z0.b */
@@ -503,6 +557,12 @@ static void sveb16b16_sigill(void)
 	asm volatile(".inst 0x65000000" : : : );
 }
 
+static void sveb16mm_sigill(void)
+{
+	/* BFMMLA Z0.H, Z0.H, Z0.H */
+	asm volatile(".inst 0x64e0e000" : : : );
+}
+
 static void svebfscale_sigill(void)
 {
 	/* BFSCALE Z0.H, P0/M, Z0.H, Z0.H */
@@ -728,6 +788,27 @@ static const struct hwcap_data {
 		.cpuinfo = "f8mm4",
 		.sigill_fn = f8mm4_sigill,
 	},
+	{
+		.name = "F16MM",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_F16MM,
+		.cpuinfo = "f16mm",
+		.sigill_fn = f16mm_sigill,
+	},
+	{
+		.name = "F16F32DOT",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_F16F32DOT,
+		.cpuinfo = "f16f32dot",
+		.sigill_fn = f16f32dot_sigill,
+	},
+	{
+		.name = "F16F32MM",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_F16F32MM,
+		.cpuinfo = "f16f32mm",
+		.sigill_fn = f16f32mm_sigill,
+	},
 	{
 		.name = "FAMINMAX",
 		.at_hwcap = AT_HWCAP2,
@@ -830,6 +911,13 @@ static const struct hwcap_data {
 		.cpuinfo = "lut",
 		.sigill_fn = lut_sigill,
 	},
+	{
+		.name = "LUT6",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_LUT6,
+		.cpuinfo = "lut6",
+		.sigill_fn = lut6_sigill,
+	},
 	{
 		.name = "MOPS",
 		.at_hwcap = AT_HWCAP2,
@@ -917,6 +1005,13 @@ static const struct hwcap_data {
 		.cpuinfo = "sme2p2",
 		.sigill_fn = sme2p2_sigill,
 	},
+	{
+		.name = "SME 2.3",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_SME2P3,
+		.cpuinfo = "sme2p3",
+		.sigill_fn = sme2p3_sigill,
+	},
 	{
 		.name = "SME AES",
 		.at_hwcap = AT_HWCAP,
@@ -966,6 +1061,13 @@ static const struct hwcap_data {
 		.cpuinfo = "smef8f32",
 		.sigill_fn = smef8f32_sigill,
 	},
+	{
+		.name = "SME LUT6",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_SME_LUT6,
+		.cpuinfo = "smelut6",
+		.sigill_fn = smelut6_sigill,
+	},
 	{
 		.name = "SME LUTV2",
 		.at_hwcap = AT_HWCAP2,
@@ -1051,6 +1153,13 @@ static const struct hwcap_data {
 		.cpuinfo = "sve2p2",
 		.sigill_fn = sve2p2_sigill,
 	},
+	{
+		.name = "SVE 2.3",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_SVE2P3,
+		.cpuinfo = "sve2p3",
+		.sigill_fn = sve2p3_sigill,
+	},
 	{
 		.name = "SVE AES",
 		.at_hwcap = AT_HWCAP2,
@@ -1065,6 +1174,13 @@ static const struct hwcap_data {
 		.cpuinfo = "sveaes2",
 		.sigill_fn = sveaes2_sigill,
 	},
+	{
+		.name = "SVE B16MM",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_SVE_B16MM,
+		.cpuinfo = "sveb16mm",
+		.sigill_fn = sveb16mm_sigill,
+	},
 	{
 		.name = "SVE BFSCALE",
 		.at_hwcap = AT_HWCAP,

-- 
2.47.3


