Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8055D5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VazzIxTchgTBtt4oACKb7Tf22G+1fZfdHpSxA0Q2Uug=; b=qmu+K6nqKRDlIpb82tJRGAUcrB
	AzF/Gmv21vTRQ52gCp97Z2AEmS7LjvbCBozO/9YNLhUEBsFe6UrHo4hG0XCML9pKmdj7+LvTQgC8Y
	hr5nfzEgUSHunvdmn27gduqhFuM+0PSPbF5ltcGouVIYryIcPesTaZsTq0KkFcE4qbYEfNcxyomdm
	FLGDLT9LCaUGrTGNE8wtk+yNhDgF/8Fg62iHV69626LISlTwsxsV9+rQe4HXwiZZOv2eq7Wp6zVqy
	cjU6qTEwSIiqmPL+QU4UtRpnBJXx+csANBbVt7iUJOxKEH8RchVPYaDgr4YXYhdPwp6B4n22tG96d
	sLfL/L+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PTd-0000000Alzp-3ASt;
	Fri, 08 Nov 2024 13:56:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PMf-0000000AkOr-1pMt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:49:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42D745C5B94;
	Fri,  8 Nov 2024 13:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5867AC4CED3;
	Fri,  8 Nov 2024 13:49:27 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/4] kselftest/arm64: Fix printf() compiler warnings in the arm64 syscall-abi.c tests
Date: Fri,  8 Nov 2024 13:49:19 +0000
Message-Id: <20241108134920.1233992-4-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108134920.1233992-1-catalin.marinas@arm.com>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_054929_603879_51E303F6 
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

Fix the incorrect length modifiers in arm64/abi/syscall-abi.c.

Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---
 tools/testing/selftests/arm64/abi/syscall-abi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/syscall-abi.c b/tools/testing/selftests/arm64/abi/syscall-abi.c
index d704511a0955..5ec9a18ec802 100644
--- a/tools/testing/selftests/arm64/abi/syscall-abi.c
+++ b/tools/testing/selftests/arm64/abi/syscall-abi.c
@@ -81,7 +81,7 @@ static int check_gpr(struct syscall_cfg *cfg, int sve_vl, int sme_vl, uint64_t s
 	 */
 	for (i = 9; i < ARRAY_SIZE(gpr_in); i++) {
 		if (gpr_in[i] != gpr_out[i]) {
-			ksft_print_msg("%s SVE VL %d mismatch in GPR %d: %llx != %llx\n",
+			ksft_print_msg("%s SVE VL %d mismatch in GPR %d: %lx != %lx\n",
 				       cfg->name, sve_vl, i,
 				       gpr_in[i], gpr_out[i]);
 			errors++;
@@ -112,7 +112,7 @@ static int check_fpr(struct syscall_cfg *cfg, int sve_vl, int sme_vl,
 	if (!sve_vl && !(svcr & SVCR_SM_MASK)) {
 		for (i = 0; i < ARRAY_SIZE(fpr_in); i++) {
 			if (fpr_in[i] != fpr_out[i]) {
-				ksft_print_msg("%s Q%d/%d mismatch %llx != %llx\n",
+				ksft_print_msg("%s Q%d/%d mismatch %lx != %lx\n",
 					       cfg->name,
 					       i / 2, i % 2,
 					       fpr_in[i], fpr_out[i]);
@@ -294,13 +294,13 @@ static int check_svcr(struct syscall_cfg *cfg, int sve_vl, int sme_vl,
 	int errors = 0;
 
 	if (svcr_out & SVCR_SM_MASK) {
-		ksft_print_msg("%s Still in SM, SVCR %llx\n",
+		ksft_print_msg("%s Still in SM, SVCR %lx\n",
 			       cfg->name, svcr_out);
 		errors++;
 	}
 
 	if ((svcr_in & SVCR_ZA_MASK) != (svcr_out & SVCR_ZA_MASK)) {
-		ksft_print_msg("%s PSTATE.ZA changed, SVCR %llx != %llx\n",
+		ksft_print_msg("%s PSTATE.ZA changed, SVCR %lx != %lx\n",
 			       cfg->name, svcr_in, svcr_out);
 		errors++;
 	}

