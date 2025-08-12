Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6196BCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MVJKMQ0cW5p3ptZvbF80xRW1H3SMr4A4L7C/Rxrh9v0=; b=Sld0U+7FANd11mnVTdsMkw4iVQ
	nh/PWvrcwTuNj7u/euElmyGh8vbT4e7hCjo9QZFAWlaJKY1xiqjZlwVTYRrlpe1h9to8IhmGzyxB8
	Mm0N4t5K4eathpqfsC9fOh51L0SJ5LE2OOdEjYiZuF3nB+V1m5XhnSqqMM9A6/tL4c0BuL/j80Eip
	2zzVp/lXvm7jY2GYhFatSdnd1ouL/1GyvL3DhPXx34RYTgfCB3E7+WLBmrOeh+H5KZkrIqEF3b8GH
	HHoL+kDKIBerdaygHxqD5oLQ/OD2BiZOZTmSg5q2V7WUXCQN0f5Aujvn0pDQqAJUfpIbbGAeZ2SOc
	5A5jzgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluag-0000000BmtM-1K7J;
	Tue, 12 Aug 2025 19:23:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulqRF-0000000B825-012o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 14:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B37D45441;
	Tue, 12 Aug 2025 14:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2A6C4CEF0;
	Tue, 12 Aug 2025 14:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755010640;
	bh=3ExZLAzsZqIFtZW4qLdpfIumHDDWHM/OVOaO+t5xwD8=;
	h=From:Date:Subject:To:Cc:From;
	b=cdm63OSKyAumMKM6PCfP17B8WJbcbLNZqkLBaoaKUKgvjaekp+vAnYoRkGgPlV7Sv
	 SsmDm6UqvNrqtS90D2sc6m/1AQYkda0YcVmEUtgF2eRPaXuMohYKaR5p+C1NbcyhaO
	 UeVx7/6HzFg/b+N1UMyvOspdB/QggbpP06LO+feuZ6m/ZPlJd8ODIpMymYyhrjuMOK
	 yG+cgsTv03vx1PLEpHXO9D3BGFDXOyHdpByucJEW5iNFY5oIsQNKmazjH2hvpHAuyB
	 CCH+YUgxuzgEdWr1VsHO096HOx5ZO4hEIbwH8E263F74IeL0E4p/c9uW9V3FRlvefW
	 57Zct/Kjk2QWQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 12 Aug 2025 15:49:27 +0100
Subject: [PATCH] kselftest/arm64: Don't open code SVE_PT_SIZE() in
 fp-ptrace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-arm64-fp-trace-macro-v1-1-317cfff986a5@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHZUm2gC/x3MSQqAMAxA0atI1gZiHSheRVyENmoWDqQignh3i
 8u3+P+BJKaSoC8eMLk06b5lVGUBYeFtFtSYDY5cS548sq1dg9OBp3EQXDnYjuQkCvk6cltBTg+
 TSe9/O4zv+wGh42QXZgAAAA==
X-Change-ID: 20250808-arm64-fp-trace-macro-02ede083da51
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3ExZLAzsZqIFtZW4qLdpfIumHDDWHM/OVOaO+t5xwD8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBom1ZNDQMMXonLuVFMnkDp3HEVYBhXFQEQ3AW8K
 IWmG5NbDQCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaJtWTQAKCRAk1otyXVSH
 0C8mB/4gwEJmywOJjkmFNyrn/IILJtVCnzWPLvrJJCDLdQnFFA/DrVVoXJrpKAN6y6n7o8wX+W5
 8yrWfK2pfDSD0l21NxKiWeV7yddCPQuFlCydL1HqeN3k6P0iTB/p+dKMMZCNYySyzH4tRGjFET3
 XILQqxcUoUiX/ynWShooJgW/n+d6G1QHZD6Na6+JDFQ99avzsTLy7sk8I17hs5i3Aeb00Q9ceMG
 CxRtOCXcMP8GNr3pVL05VxWo+PC/ozvH0ewSvcypX0bnUbjH3FaUqm/wQqYoH7eDXTPKdEEZGso
 a6EBQf74yQL//qVaeNmXJYekmu/gUGamG9QEQDzo/k312huE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_075721_089768_A90F100A 
X-CRM114-Status: GOOD (  11.72  )
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

In fp-trace when allocating a buffer to write SVE register data we open
code the addition of the header size to the VL depeendent register data
size, which lead to an underallocation bug when we cut'n'pasted the code
for FPSIMD format writes. Use the SVE_PT_SIZE() macro that the kernel
UAPI provides for this.

Fixes: b84d2b27954f ("kselftest/arm64: Test FPSIMD format data writes via NT_ARM_SVE in fp-ptrace")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index 124bc883365e..cdd7a45c045d 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -1187,7 +1187,7 @@ static void sve_write_sve(pid_t child, struct test_config *config)
 	if (!vl)
 		return;
 
-	iov.iov_len = SVE_PT_SVE_OFFSET + SVE_PT_SVE_SIZE(vq, SVE_PT_REGS_SVE);
+	iov.iov_len = SVE_PT_SIZE(vq, SVE_PT_REGS_SVE);
 	iov.iov_base = malloc(iov.iov_len);
 	if (!iov.iov_base) {
 		ksft_print_msg("Failed allocating %lu byte SVE write buffer\n",
@@ -1234,8 +1234,7 @@ static void sve_write_fpsimd(pid_t child, struct test_config *config)
 	if (!vl)
 		return;
 
-	iov.iov_len = SVE_PT_SVE_OFFSET + SVE_PT_SVE_SIZE(vq,
-							  SVE_PT_REGS_FPSIMD);
+	iov.iov_len = SVE_PT_SIZE(vq, SVE_PT_REGS_FPSIMD);
 	iov.iov_base = malloc(iov.iov_len);
 	if (!iov.iov_base) {
 		ksft_print_msg("Failed allocating %lu byte SVE write buffer\n",

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250808-arm64-fp-trace-macro-02ede083da51

Best regards,
--  
Mark Brown <broonie@kernel.org>


