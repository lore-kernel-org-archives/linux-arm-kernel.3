Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE4CCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFk8vv08503AHLbsZbQi6q6SkykCXmgwWLOF/vnD+Cc=; b=y8HeCtlRu7Bf1F9lVxz4TUrKOR
	0+nPhUIszEJ8r1boUj2v+38DLOX2GoWSIl3Y1DO2GLWuvMBpYWgDaidFxBZoRs+ROSD8X3zcqncO/
	iT+3FgweiyZFO60XBT2wuuwZgt+6Io8OiXs8lGlKVXxLjoAMGR/Xgheb+qKE2QNcSiDRBEu/y3wff
	ENs07/iZSe4r19n/vMO7k3+OfuH94itXezq/VJAklOsP2SIL7ZG7wra8XMc+8WZShDvxtoPYkHAgC
	33y0nPLzuoN39jyWPiJgRBiIbY3GL+89jC7OaBvf5VRTxURXQt9clWVpLS8w2lom32sUupsvrz7Rh
	UkGL9U6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorZr-0000000F7eH-0aii;
	Wed, 20 Aug 2025 22:46:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonYx-0000000EgRb-3BHi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 18:29:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F2C5E5C6AB7;
	Wed, 20 Aug 2025 18:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F287C116B1;
	Wed, 20 Aug 2025 18:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755714570;
	bh=xFa+NeJG2jF6wE7Joj16Oc51n2//5XUYYYZ0eG8q3lU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L/E5hUdy/Zq7DwlSV0lPuwRI4qKR/gShAYBuHGCXtWSw1T+zi3r4KS/3B3e9ZKCuZ
	 Lu6er1KZgxXNzYBURZeBKIMtXwAAZTnpwv6K8fop1co5id4aR+W/s2WVibsyXdLFmQ
	 cHhv2l+O3IyvE0NFtWnRNwOH+uY7jRnIURC6wSFe047cetUW+W8YwQeu3CMhTuqSVd
	 OePOrOfoH4nn9KXTrR5S+AXxd9fKu88FheFdmfxzUdDSt1+LNU0btTkDI4ACpJ03mG
	 RqeOlQAOHKADvzKpES6vvcX4mTsUM15tvGPX7CNFuWZ+aNBhtuaMte7JznQNFRNwip
	 +cEcPTGiCUTHQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 20 Aug 2025 19:29:03 +0100
Subject: [PATCH 1/5] kselftest/arm64: Verify that we reject out of bounds
 VLs in sve-ptrace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-arm64-sme-ptrace-sme-only-v1-1-f7c22b2871f8@kernel.org>
References: <20250820-arm64-sme-ptrace-sme-only-v1-0-f7c22b2871f8@kernel.org>
In-Reply-To: <20250820-arm64-sme-ptrace-sme-only-v1-0-f7c22b2871f8@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Oleg Nesterov <oleg@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 David Spickett <david.spickett@arm.com>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Luis Machado <luis.machado.foss@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=2329; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xFa+NeJG2jF6wE7Joj16Oc51n2//5XUYYYZ0eG8q3lU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBophQBBnrnyJoBRFW07hBrEL9iNoVV/fdd5wyni
 /xIOYEjiUWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKYUAQAKCRAk1otyXVSH
 0PvRB/9HIoad8JkWcAcMr/vzFQGFNApVF/Y7Cxbekiy2xFDCnzN5ih7L//v6ELI/8AqffCg8lkG
 XGBWKHeOkxxLwgd1ZluEFrH3NmdwvvGJbsuGaryl4oqje3yoaLtOJo6Dq0AI2/f45CY8JNRdwcA
 2+WIlTGpFcy4ikG0o/jBeoMd7k5WNsmU7Tl4cB6l1s/gXmdY2pHzg8S5SsJKuY/j86aUQ1UREo+
 VVqoaZ37uymnkTgcVFcOGxGyYCwXQd1ejXjEfYKQi3V7ADTlJoh9k7pKJOcJ44kgSNGVmaSyPCc
 NMDy7iHNt0auoOQveAajjJ1ADUmHNfguB10Eyc1SEV7eHG6O
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_112931_889430_A001807C 
X-CRM114-Status: GOOD (  14.78  )
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

We do not currently have a test that asserts that we reject attempts to set
a vector length smaller than SVE_VL_MIN or larger than SVE_VL_MAX, add one
since that is our current behaviour.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-ptrace.c | 32 ++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
index b22303778fb0..a9b2377c46b8 100644
--- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
@@ -66,7 +66,7 @@ static const struct vec_type vec_types[] = {
 };
 
 #define VL_TESTS (((TEST_VQ_MAX - SVE_VQ_MIN) + 1) * 4)
-#define FLAG_TESTS 2
+#define FLAG_TESTS 4
 #define FPSIMD_TESTS 2
 
 #define EXPECTED_TESTS ((VL_TESTS + FLAG_TESTS + FPSIMD_TESTS) * ARRAY_SIZE(vec_types))
@@ -270,6 +270,25 @@ static void check_u32(unsigned int vl, const char *reg,
 	}
 }
 
+/* Set out of range VLs */
+static void ptrace_set_vl_ranges(pid_t child, const struct vec_type *type)
+{
+	struct user_sve_header sve;
+	int ret;
+
+	memset(&sve, 0, sizeof(sve));
+	sve.flags = SVE_PT_REGS_SVE;
+	sve.size = sizeof(sve);
+
+	ret = set_sve(child, type, &sve);
+	ksft_test_result(ret != 0, "%s Set invalid VL 0\n", type->name);
+
+	sve.vl = SVE_VL_MAX + SVE_VQ_BYTES;
+	ret = set_sve(child, type, &sve);
+	ksft_test_result(ret != 0, "%s Set invalid VL %d\n", type->name,
+			 SVE_VL_MAX + SVE_VQ_BYTES);
+}
+
 /* Access the FPSIMD registers via the SVE regset */
 static void ptrace_sve_fpsimd(pid_t child, const struct vec_type *type)
 {
@@ -703,6 +722,17 @@ static int do_parent(pid_t child)
 					      vec_types[i].name);
 		}
 
+		/* Setting out of bounds VLs should fail */
+		if (getauxval(vec_types[i].hwcap_type) & vec_types[i].hwcap) {
+			ptrace_set_vl_ranges(child, &vec_types[i]);
+		} else {
+			ksft_test_result_skip("%s Set invalid VL 0\n",
+					      vec_types[i].name);
+			ksft_test_result_skip("%s Set invalid VL %d\n",
+					      vec_types[i].name,
+					      SVE_VL_MAX + SVE_VQ_BYTES);
+		}
+
 		/* Step through every possible VQ */
 		for (vq = SVE_VQ_MIN; vq <= TEST_VQ_MAX; vq++) {
 			vl = sve_vl_from_vq(vq);

-- 
2.39.5


