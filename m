Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDA7C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qs7QPM7Iq7ofG6+IQT5lNEOnIRwzWkCqSmgxaxPRMwo=; b=Y8Wds0XllQHyBJJIh8a0ju1Mro
	rY/O2ZBeo/2o6qT88/8F+qeJOBquAb0EF7v9LnUkOplDwYZqLELZwHei/qEsAA1cFQ0RJRciSXprj
	fOaKXlJbFKADolYw+AoYhSPTCdRMZh91SdU1fi9CS0fWQ6hBDRhMCOwMvpbw1alm36QpCBYL3cjsP
	XBHI3urVnohoSC8bo7G2CRojFyF5SDQN8GK0lBq7TEfESp8sVPPIXr1X9/99uj7qrvSIsk1ZsOoTK
	yChXzgMIUG14i404cSJ5HyctR/gZn00TLkz+4Mb9gcgTvYUgoACVFAqA9HHmBMIf+ojPItG+IfQC+
	XrZVqqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUe0-00000004Id0-2z3M;
	Fri, 23 May 2025 15:49:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUJk-00000004FX3-3iOQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 15:28:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B8004A815;
	Fri, 23 May 2025 15:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F316C4CEF1;
	Fri, 23 May 2025 15:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748014096;
	bh=7qPuzgw0bn3QpiAY8R1qChXrcf2gq10ANDQmt+B1bVE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lnclN2YVgjbXlaCUpmnfEGix2NPLg2Cu2qrZkH0MRI8aj1/ZkOnM/aBYdVSoJ1HCf
	 mIdCiHcTaE2XX/dbT+2VGu/u6V1rQQl05pa7WZzJ4eRWqA+mW5d5iNHg4+UUFyi8Fu
	 sUjrJBZnWFdNtxGozFWcYKiG76g88kD7DdcHkdVh9YKJ9b7YNwivorY59rF17jJv8R
	 VV+vY0197+JIBqid9x44tJggS3npfPqJfmCaX+FZWt5i2z6tYyXIH7tGu022HW1G6s
	 KL/quD9rY05T7tQO4ZirVa+KdA1Cf1u4x/bhteHgwEaNSKbNETs2i6VGV4TO43it+5
	 oE+FLOtENJsHw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 23 May 2025 16:27:14 +0100
Subject: [PATCH 3/3] kselftest/arm64: Specify SVE data when testing VL set
 in sve-ptrace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-kselftest-arm64-ssve-fixups-v1-3-65069a263b21@kernel.org>
References: <20250523-kselftest-arm64-ssve-fixups-v1-0-65069a263b21@kernel.org>
In-Reply-To: <20250523-kselftest-arm64-ssve-fixups-v1-0-65069a263b21@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7qPuzgw0bn3QpiAY8R1qChXrcf2gq10ANDQmt+B1bVE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoMJQFGYi9rGbF8w0qTU6qYFovn3AABE/NB8RyD
 EYawPnIr7uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaDCUBQAKCRAk1otyXVSH
 0PrBB/wN0FmdQUosY4F0ELo5Y70/0OwxSXRQpwwNsaHyw0J3yI6F5zScuTW82gkJ96P5ZJUeGxp
 xYK/ozDDRzAx9EqOirNEVxPJpyNsHNr+N3MRE2F765o9mlk49X096nE0MhOtXMZBmC4fGMZZaa+
 BzPalcgYEpEiF3x7aD2zJYRJqtWWeuriH7YvuMHqK6tlqmOaGZx+6xJrrRlgs1exhDq20yxXyKL
 p1dvp8awOan24B5SgIfj06vjDc5lBNmDLxFKJbBW6kmybAMiIAir/vttxxBIv1sug0J45hPkavS
 r0HSTC5HyUASaTyRa/GOzbbukPwF6zzqMD7SYswtK1ULgznk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_082816_953477_370E4CEB 
X-CRM114-Status: GOOD (  11.48  )
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

Since f916dd32a943 ("arm64/fpsimd: ptrace: Mandate SVE payload for
streaming-mode state") we reject attempts to write to the streaming mode
regset even if there is no register data supplied, causing the tests for
setting vector lengths and setting SVE_VL_INHERIT in sve-ptrace to
spuriously fail. Set the flag to avoid the issue, we still support not
supplying register data.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-ptrace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
index 7e259907805b..7f9b6a61d369 100644
--- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
@@ -170,7 +170,7 @@ static void ptrace_set_get_inherit(pid_t child, const struct vec_type *type)
 	memset(&sve, 0, sizeof(sve));
 	sve.size = sizeof(sve);
 	sve.vl = sve_vl_from_vq(SVE_VQ_MIN);
-	sve.flags = SVE_PT_VL_INHERIT;
+	sve.flags = SVE_PT_VL_INHERIT | SVE_PT_REGS_SVE;
 	ret = set_sve(child, type, &sve);
 	if (ret != 0) {
 		ksft_test_result_fail("Failed to set %s SVE_PT_VL_INHERIT\n",
@@ -235,6 +235,7 @@ static void ptrace_set_get_vl(pid_t child, const struct vec_type *type,
 	/* Set the VL by doing a set with no register payload */
 	memset(&sve, 0, sizeof(sve));
 	sve.size = sizeof(sve);
+	sve.flags = SVE_PT_REGS_SVE;
 	sve.vl = vl;
 	ret = set_sve(child, type, &sve);
 	if (ret != 0) {

-- 
2.39.5


