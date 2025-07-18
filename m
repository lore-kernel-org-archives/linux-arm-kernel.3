Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1D5C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 22:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EpqkSmuFmnnpPZrlnGj1lPi0kyTi7OoJJlEwf8dmKsM=; b=jUgregoXrXHGUu7K7BgnryLWt5
	ykqcfvSCEGg3a+kis1q1x5SyogKTvOQwbxdQiiQuqyA6f8bRU0jJaAD7EX/lb6LlX9XePbfGrBfKx
	aQbvxZM1qcwqYUN+oBIZejBufD/LklEU8cT/QWZmpsu3WcaFWVoBCtHNTTZL+mU5EUY12utNzV9TI
	TcCR3+Kg7ALriLatgDXBee41etW+nHE1n2Wamzt0GhJG18IrcE5g+KdfcYXHjY0A6CQ3czA9beAH8
	vfbZb0u/L2ms/kYYHwrrS96D+HgBslDiRmK3MjuX+QlVcsnR/NtKoyKTM/BiHNAPgFmJtuY7qN/A4
	UtTJHX/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctK1-0000000DWlN-3MWu;
	Fri, 18 Jul 2025 22:12:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctFv-0000000DWOT-2X5l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 22:08:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7822A576F3;
	Fri, 18 Jul 2025 22:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FDDC4CEEB;
	Fri, 18 Jul 2025 22:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752876518;
	bh=F5/QLPUJ8iOh0MNjRblQiroPNgVbwr67pg8I2vsaUwc=;
	h=From:Date:Subject:To:Cc:From;
	b=PpCxttTG/MzcWW+7qwzT+/hXKR+eajmXu801OXQSiboosc3HsDsw9mFbAL0H+F4na
	 yiqHh+QEBE59hb40Mv/tuUYiDT7xRXN55UqMe4uTPv0JTKFpKIDxZwZTqpBRc1nk+Z
	 ZgcNYb3tn0zmkOr5wLuTCWS8hPsC9U7m46vJ2133KETM4622t5w/ss6XQMZ6h6UT5+
	 lzU76Fpyg39xm8/ux+nLbG3whpz+zmT2sJobJQzTAV8siJEuySfeRqkaUhxC91IHym
	 Y81LeSneEMmcEEckeRVaNrsnzCSzpUwnYY8PzTL5n7T6E7rODb13hC4zDDjwkzdqNJ
	 YE5Ezp03plztw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 18 Jul 2025 23:03:26 +0100
Subject: [PATCH] kselftest/arm64: Test FPSIMD format data writes via
 NT_ARM_SVE in fp-ptrace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-arm64-fp-ptrace-sve-fpsimd-v1-1-7ecda32aa297@kernel.org>
X-B4-Tracking: v=1; b=H4sIAK3EemgC/x3MSwqEMAwA0KtI1hNo63fmKuKi2qhZ6JREiiDe3
 eLybd4FSsKk8CsuEEqs/N8z7KeAafX7QsghG5xxtWlth162psI5YjzET4SaKEt5C0jemTGEry2
 7EXIQhWY+37wf7vsB4BCF/mwAAAA=
X-Change-ID: 20250718-arm64-fp-ptrace-sve-fpsimd-ea20bdd9138b
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=3710; i=broonie@kernel.org;
 h=from:subject:message-id; bh=F5/QLPUJ8iOh0MNjRblQiroPNgVbwr67pg8I2vsaUwc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoesXk6mt2YZo1Q93Tplhxwa+Qui59UC8SChAMF
 CryT8sRavOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaHrF5AAKCRAk1otyXVSH
 0NIKB/9OthvPFt7wTCxyiHwY++LwIqJtzv/nIkaOToM5ieo9DETPvelz1udvHvqeUvGONCnoV/E
 Pdg/fINA40Ah0QV2XtOAsOqJmxWadBInDt0om2w3m08oEnOdkjPPTp9gr69TGpx/xG+y7r0BxsZ
 Jqa0bMkCLKobNgiPBNWiYuXKseA34sGtvKLXo49oyWEGf2fVBT8QwJK7M2Nc2CkFFfLZzs3NodO
 d26qenkY1omvJuos7hH/mwaAYyZLiO1yyak3bPFHHroTU/A2n/AFHDA1V1WRJ/7/2qdGJIa6SBH
 1sC/3wgg6NkVyrJNNZ/fF3zIwApIdS/6vV4joWfVpQrX4H5a
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_150839_781443_63706D4A 
X-CRM114-Status: GOOD (  14.83  )
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

The NT_ARM_SVE register set supports two data formats, the native SVE one
and an alternative format where we embed a copy of user_fpsimd_data as used
for NT_PRFPREG in the SVE register set. The register data is set as for a
write to NT_PRFPREG and changes in vector length and streaming mode are
handled as for any NT_ARM_SVE write. This has not previously been tested by
fp-ptrace, add coverage of it.

We do not support writes in FPSIMD format for NT_ARM_SSVE so we skip the
test for anything that would leave us in streaming mode.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 66 +++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index 191c47ca0ed8..c479c97dea1a 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -1066,6 +1066,23 @@ static bool sve_write_supported(struct test_config *config)
 	return true;
 }
 
+static bool sve_write_fpsimd_supported(struct test_config *config)
+{
+	if (!sve_supported())
+		return false;
+
+	if ((config->svcr_in & SVCR_ZA) != (config->svcr_expected & SVCR_ZA))
+		return false;
+
+	if (config->svcr_expected & SVCR_SM)
+		return false;
+
+	if (config->sme_vl_in != config->sme_vl_expected)
+		return false;
+
+	return true;
+}
+
 static void fpsimd_write_expected(struct test_config *config)
 {
 	int vl;
@@ -1152,7 +1169,7 @@ static void sve_write_expected(struct test_config *config)
 	}
 }
 
-static void sve_write(pid_t child, struct test_config *config)
+static void sve_write_sve(pid_t child, struct test_config *config)
 {
 	struct user_sve_header *sve;
 	struct iovec iov;
@@ -1195,6 +1212,45 @@ static void sve_write(pid_t child, struct test_config *config)
 	free(iov.iov_base);
 }
 
+static void sve_write_fpsimd(pid_t child, struct test_config *config)
+{
+	struct user_sve_header *sve;
+	struct user_fpsimd_state *fpsimd;
+	struct iovec iov;
+	int ret, vl, vq;
+
+	vl = vl_expected(config);
+	vq = __sve_vq_from_vl(vl);
+
+	if (!vl)
+		return;
+
+	iov.iov_len = SVE_PT_SVE_OFFSET + SVE_PT_SVE_SIZE(vq,
+							  SVE_PT_REGS_FPSIMD);
+	iov.iov_base = malloc(iov.iov_len);
+	if (!iov.iov_base) {
+		ksft_print_msg("Failed allocating %lu byte SVE write buffer\n",
+			       iov.iov_len);
+		return;
+	}
+	memset(iov.iov_base, 0, iov.iov_len);
+
+	sve = iov.iov_base;
+	sve->size = iov.iov_len;
+	sve->flags = SVE_PT_REGS_FPSIMD;
+	sve->vl = vl;
+
+	fpsimd = iov.iov_base + SVE_PT_REGS_OFFSET;
+	memcpy(&fpsimd->vregs, v_expected, sizeof(v_expected));
+
+	ret = ptrace(PTRACE_SETREGSET, child, NT_ARM_SVE, &iov);
+	if (ret != 0)
+		ksft_print_msg("Failed to write SVE: %s (%d)\n",
+			       strerror(errno), errno);
+
+	free(iov.iov_base);
+}
+
 static bool za_write_supported(struct test_config *config)
 {
 	if ((config->svcr_in & SVCR_SM) != (config->svcr_expected & SVCR_SM))
@@ -1386,7 +1442,13 @@ static struct test_definition sve_test_defs[] = {
 		.name = "SVE write",
 		.supported = sve_write_supported,
 		.set_expected_values = sve_write_expected,
-		.modify_values = sve_write,
+		.modify_values = sve_write_sve,
+	},
+	{
+		.name = "SVE write FPSIMD format",
+		.supported = sve_write_fpsimd_supported,
+		.set_expected_values = fpsimd_write_expected,
+		.modify_values = sve_write_fpsimd,
 	},
 };
 

---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250718-arm64-fp-ptrace-sve-fpsimd-ea20bdd9138b

Best regards,
--  
Mark Brown <broonie@kernel.org>


