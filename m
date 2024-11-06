Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86703D59F55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 17:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CiZDEO6L0bu7QoqlmPEC3QRYLljflMLrkPIYFoXNYFo=; b=bK/WWEPaqchsbks9LOnlc5/NbV
	1hb9L/oCs6dKzxdINkPBybPYr9WT1F81ec6koP+QZ6M+0pfGa88VZ9/s9ygXH2ilnLYtdJFwXRHiG
	TTq8X2fXZEOiqHMzcTCSQmP8iMcDz3Og0sNIzbB6yotoePmm0fUxWjq20zJcTWJit2+ZkwEK9RBFQ
	nEakztCQNwEGiYDagJYwN/mXv3xruM5HhIEBkM+dPww5x8iEiLWfhzxt4paUs7sKarAp/96boERs7
	c+U2tDpz5jK2XY/jR63CV3Vcg0qpxImnVhRLhIdSjqYCLbyxXO/pABXAAYebrmt2QQPDZ4OsApnUN
	1ncIEOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jd3-00000004AGo-1one;
	Wed, 06 Nov 2024 17:15:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jVn-000000048o1-2LUf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 17:08:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CFFC0A4416C;
	Wed,  6 Nov 2024 17:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0E1C4CEC6;
	Wed,  6 Nov 2024 17:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730912886;
	bh=RvQnEtV8Mg7m4PiUUGqAJHzKfykaMnUeLxanj8XBb88=;
	h=From:Date:Subject:To:Cc:From;
	b=bH7afEYmmFzgQrhCdFISW4fVzk1/qQASxU7hpEvH5CIktMz4IWmchHfzAlFJN0Gv3
	 lWptnw7fs+G0n3pnFOSUCcZ3e+smHfxdmNzQx19k4m6iMMtjTDNxN9LLrdrpSEC8A0
	 dn0f9La3G2ld3VKQI/eLhjU/6sOHcadaN8Mxsl3TVFIJcmpcYqmqsQy64RaKxxrib+
	 aD9QVMfs/Uqsiu1TjA0GHeGaHyc1DNzUCvbgKV2u2amypTTk6xiKNloff+1Ddvbpcy
	 dxkyriVMSyjMdN/3E+APhWRCfLjg54mbrDxX7qaRHnKQggsIlZnya1Bs/dNWeC1due
	 l5+u5NN+fS7xQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 06 Nov 2024 17:07:51 +0000
Subject: [PATCH] kselftest/arm64: Check that SVCR is 0 in signal handlers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-arm64-fpmr-signal-test-v1-1-31fa34ce58fe@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGaiK2cC/x3MwQqDMAyA4VeRnBdIpVbYq4wduprWgHaSiAzEd
 1/x+B3+/wRjFTZ4dicoH2LyrQ3u0UGaYy2MMjVDT713jgJGXYPHvK2KJqXGBXe2HRNFSsMnkxs
 9tHhTzvK7x6/3df0BsNtNpmgAAAA=
X-Change-ID: 20241106-arm64-fpmr-signal-test-c0a0c5bf0174
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2527; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RvQnEtV8Mg7m4PiUUGqAJHzKfykaMnUeLxanj8XBb88=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnK6J0FNSRVwvQyvp7AdBVppeCP00LI4e3lhe2d0eV
 bFuvv3OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyuidAAKCRAk1otyXVSH0Ll9B/
 9fqWoycHjyPVfNACHQpdTKiWUo8wwpnvLIKZWgG1cEChaIPzaCLd9z6rrc4Wyx7iwFwwYskiUW9V6P
 oMChZ6F6YnncZ/kfOLieaGy0WkOLQcRMMGJjc1Kd3cwMV19hwuEPglL3fUv9VwIqAEUbQxRQyP8tX5
 SfLCt9UIcaAEAHikWj/NUC9Dv5mj9RUJaX080rojMwRNnTbHXLSoZxmy73T5seuZaZlbpChduwn3HK
 BbtvE6ufpDQxqiwl+rrN2SSfcUwIhUhzK1ZkC5OpsqjKX2ho6h6e/R3bew6Em4QsOhT3KEHcO74MIE
 r6kuqtvivxckQpFAY+sET42YZVJC24
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_090807_766454_1EF391ED 
X-CRM114-Status: GOOD (  10.68  )
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

We don't currently validate that we exit streaming mode and clear ZA when
we enter a signal handler. Add simple checks for this in the SSVE and ZA
tests.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/signal/sve_helpers.h         | 13 +++++++++++++
 tools/testing/selftests/arm64/signal/testcases/ssve_regs.c |  5 +++++
 tools/testing/selftests/arm64/signal/testcases/za_regs.c   |  5 +++++
 3 files changed, 23 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/sve_helpers.h b/tools/testing/selftests/arm64/signal/sve_helpers.h
index 50948ce471cc620118a0c7c8df70d66dbdfbb160..ca133b93375fa587b5e02cd76b2f2fcd92591723 100644
--- a/tools/testing/selftests/arm64/signal/sve_helpers.h
+++ b/tools/testing/selftests/arm64/signal/sve_helpers.h
@@ -18,4 +18,17 @@ extern unsigned int nvls;
 
 int sve_fill_vls(bool use_sme, int min_vls);
 
+static inline uint64_t get_svcr(void)
+{
+	uint64_t val;
+
+	asm volatile (
+		"mrs	%0, S3_3_C4_C2_2\n"
+		: "=r"(val)
+		:
+		: "cc");
+
+	return val;
+}
+
 #endif
diff --git a/tools/testing/selftests/arm64/signal/testcases/ssve_regs.c b/tools/testing/selftests/arm64/signal/testcases/ssve_regs.c
index 6dbe48cf8b09ed8b7a5ab47690bd87e39e18e1e6..3dee68fa36d1cf2716f54d5f328b3f4077493c3b 100644
--- a/tools/testing/selftests/arm64/signal/testcases/ssve_regs.c
+++ b/tools/testing/selftests/arm64/signal/testcases/ssve_regs.c
@@ -85,6 +85,11 @@ static int do_one_sme_vl(struct tdescr *td, siginfo_t *si, ucontext_t *uc,
 	fprintf(stderr, "Got expected size %u and VL %d\n",
 		head->size, ssve->vl);
 
+	if (get_svcr() != 0) {
+		fprintf(stderr, "Unexpected SVCR %llx\n", get_svcr());
+		return 1;
+	}
+
 	return 0;
 }
 
diff --git a/tools/testing/selftests/arm64/signal/testcases/za_regs.c b/tools/testing/selftests/arm64/signal/testcases/za_regs.c
index b9e13f27f1f9aaf55db2a5e391f360993561d0b7..9fff4c50030414d06157e0da0c29fd794f707309 100644
--- a/tools/testing/selftests/arm64/signal/testcases/za_regs.c
+++ b/tools/testing/selftests/arm64/signal/testcases/za_regs.c
@@ -91,6 +91,11 @@ static int do_one_sme_vl(struct tdescr *td, siginfo_t *si, ucontext_t *uc,
 		return 1;
 	}
 
+	if (get_svcr() != 0) {
+		fprintf(stderr, "Unexpected SVCR %llx\n", get_svcr());
+		return 1;
+	}
+
 	return 0;
 }
 

---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241106-arm64-fpmr-signal-test-c0a0c5bf0174

Best regards,
-- 
Mark Brown <broonie@kernel.org>


