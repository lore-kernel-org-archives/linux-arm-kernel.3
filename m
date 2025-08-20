Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1DDCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFRXhY/i98Q89j9uDpvWY9kErnXND+VerRknZkuAoYM=; b=HA6mBT17LUIB8TFQsfMdie9N07
	lq36h2veAYtS4RTX8cDEun/B4KiHMih3BvEXEPtB6e6X+iHma0xecPl9MY2NlGd02IQ3RdIiskX9P
	qR99xVggnAypOAFpdby8OBsO+vjqo6SM9vYbymy7MqHpR0WAxKbtB2KApafnuMOG/REc+Ov/5lXbR
	si0nOS5s/DwG7N54KMfPYuHcaTUCPvOWwvk6N2T65c1tdBH76YsgcESped/6l4JqUUODNe2V5dlps
	CCX5SWAxP+s7rnPx/aXyK+EmHScuPLvUyncFoczQlE3KKZHCTkP0kBTN2vklZsfw8n8WxRjYcxDZr
	3ICapWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uork8-0000000F8fB-1nt7;
	Wed, 20 Aug 2025 22:57:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonZ6-0000000EgVo-2Q4w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 18:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EEB93601D7;
	Wed, 20 Aug 2025 18:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A900C116C6;
	Wed, 20 Aug 2025 18:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755714579;
	bh=7yYQgVpvwR50FjsSjL4YhMM/gAvl6YUZb0wor5dneuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MgHvn3WbTwCQyqYCVGAUi1nOpKIIYwqfk2QqGPUzrFMYPOgDYvpwA4cawpaV+oT5l
	 8Iy4qDlUfBAsWBKGHLkqt3OL56fGoaDfO1dLA5npQO5FV8l+C1Xj/bJVYogzk/Sb2e
	 jiYVed9+cSVfdIVHpn1JvkbCxKGiDBsXx7z8nnFyaEmI88EH0AI5ufGYhJEe+SOGCS
	 EwZjA57ubwKm5RUEt1x4QbEojF+DY8J2fKZCcc9CV5w3H/3q0I8eJ+tcwXaoMdohvU
	 UX+siKVjqePcl39RV1b5+/tw8NHicJQRbJifyPmVWe7F030UQz0ZGw/tpuOdBOtQdh
	 qGFLedDq0Wbrw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 20 Aug 2025 19:29:06 +0100
Subject: [PATCH 4/5] kselftst/arm64: Test NT_ARM_SVE FPSIMD format writes
 on non-SVE systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-arm64-sme-ptrace-sme-only-v1-4-f7c22b2871f8@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2876; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7yYQgVpvwR50FjsSjL4YhMM/gAvl6YUZb0wor5dneuY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBophQDBCnwEb501FLky81u9LBxHlAhDWR4gmn9k
 mEJosS/c1OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKYUAwAKCRAk1otyXVSH
 0LfPCACA73choIeRJkU3n15ARoQsj6wSJ4dWK3BIH5qL6LaiyaCFmR9pGo90ITc9K3MQI3R5RuD
 NfWln+t4vCHrrbV4FJzo0vH1EJC8k70J8ZVAJT+AoYbBEejdXeyZGJEPd+NJP1YgPKNDblzKEcq
 IORUZ5vmvUP5EU2lMpoiWQPwvH7pYPZ0kbOykQ4Rwh385LX4VrkMzyX9Fw7FvLisz5Y7NJiaG2v
 9uBw37OjcjKxKDK+TXLth7oBqzpeEQXfxqTTZ7shCMdU2KKdHaj+aoZZi7g8p2UCFJJ3bv/zeE9
 3aGX0zOsm1hbyBolt4ecosh8w9aoJsWGsEM6fpBNU/NLezP2
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

In order to allow exiting streaming mode on systems with SME but not SVE
we allow writes of FPSIMD format data via NT_ARM_SVE even when SVE is not
supported, add a test case that covers this to sve-ptrace.

We do not support reads.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-ptrace.c | 61 +++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
index 5f39ca0b4194..fe43fb07ee6c 100644
--- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
@@ -378,6 +378,58 @@ static void ptrace_sve_fpsimd(pid_t child, const struct vec_type *type)
 	free(svebuf);
 }
 
+/* Write the FPSIMD registers via the SVE regset when SVE is not supported */
+static void ptrace_sve_fpsimd_no_sve(pid_t child)
+{
+	void *svebuf;
+	struct user_sve_header *sve;
+	struct user_fpsimd_state *fpsimd, new_fpsimd;
+	unsigned int i, j;
+	unsigned char *p;
+	int ret;
+
+	svebuf = malloc(SVE_PT_SIZE(0, SVE_PT_REGS_FPSIMD));
+	if (!svebuf) {
+		ksft_test_result_fail("Failed to allocate FPSIMD buffer\n");
+		return;
+	}
+
+	/* On a system without SVE the VL should be set to 0 */
+	memset(svebuf, 0, SVE_PT_SIZE(0, SVE_PT_REGS_FPSIMD));
+	sve = svebuf;
+	sve->flags = SVE_PT_REGS_FPSIMD;
+	sve->size = SVE_PT_SIZE(0, SVE_PT_REGS_FPSIMD);
+	sve->vl = 0;
+
+	/* Try to set a known FPSIMD state via PT_REGS_SVE */
+	fpsimd = (struct user_fpsimd_state *)((char *)sve +
+					      SVE_PT_FPSIMD_OFFSET);
+	for (i = 0; i < 32; ++i) {
+		p = (unsigned char *)&fpsimd->vregs[i];
+
+		for (j = 0; j < sizeof(fpsimd->vregs[i]); ++j)
+			p[j] = j;
+	}
+
+	ret = set_sve(child, &vec_types[0], sve);
+	ksft_test_result(ret == 0, "FPSIMD write via SVE\n");
+	if (ret) {
+		ksft_test_result_skip("Verify FPSIMD write via SVE\n");
+		goto out;
+	}
+
+	/* Verify via the FPSIMD regset */
+	if (get_fpsimd(child, &new_fpsimd)) {
+		ksft_test_result_skip("Verify FPSIMD write via SVE\n");
+		goto out;
+	}
+	ksft_test_result(memcmp(fpsimd, &new_fpsimd, sizeof(*fpsimd)) == 0,
+			 "Verify FPSIMD write via SVE\n");
+
+out:
+	free(svebuf);
+}
+
 /* Validate attempting to set SVE data and read SVE data */
 static void ptrace_set_sve_get_sve_data(pid_t child,
 					const struct vec_type *type,
@@ -810,6 +862,15 @@ static int do_parent(pid_t child)
 		}
 	}
 
+	/* We support SVE writes of FPSMID format on SME only systems */
+	if (!(getauxval(AT_HWCAP) & HWCAP_SVE) &&
+	    (getauxval(AT_HWCAP2) & HWCAP2_SME)) {
+		ptrace_sve_fpsimd_no_sve(child);
+	} else {
+		ksft_test_result_skip("FPSIMD write via SVE\n");
+		ksft_test_result_skip("Verify FPSIMD write via SVE\n");
+	}
+
 	ret = EXIT_SUCCESS;
 
 error:

-- 
2.39.5


