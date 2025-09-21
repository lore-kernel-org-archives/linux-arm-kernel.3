Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE79CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 13:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=On3T9Vd07eJ1tmpzLKeAxFiS9ecRs0YZXAAVEm7bPLk=; b=v8MiCvo1AB8woFqiUQdG0KVC+x
	1Txxnb/Vk7Q9YWti45fxgahRlF0/2tnkVkGJ6im2HS51AQXNQCorB9tmCclBewba9ZzSdpxug+JsJ
	GF+6Fc3kIjknRsKU8bFZO4FDtn3XQkcSHRInxthTE+1S5jbfvHf1e81mqm6PFj0gWpLLjj90cKAkA
	xi115j1ZE4gph1KIexx1/VCE6xt0bRbq44bFGKtj0sPUhzZIYyGh8/c3bCS5DHeF/8TFu8eZxdjsy
	/VonWovjO3G5ojTpsD4U7CrEAAgmADGcVK42xlr1vA7jv0glRxhElO/PovFefI43JqDFJlTlRJIqD
	hvQBI1oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0K4I-00000007Wj1-1Xgx;
	Sun, 21 Sep 2025 13:25:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0K4B-00000007Wf6-361T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 13:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FD9A441E0;
	Sun, 21 Sep 2025 13:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546BBC4CEE7;
	Sun, 21 Sep 2025 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758461123;
	bh=s+wftv/lLO/HEynUJMSqPwVgj4JeieBXIF19Z/tEeQI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QotlogBeC2DAkXLKYM0i4uU3XzeMVEO/V05JQ1xVW2aGY2/WMgdclV3WFKlibnVf6
	 FHDIj6Rkyw3fg/XthzquvfDs24o4marNjzhn7BG7uEO8iUQeGo57iizhxK5MeVzF5F
	 AaRN3UuCvqRiV7NriPgrrdvkVuj3rDy8YWHlDY9+2+kAp+f4mSBThNfRKe8Uyb5W5H
	 MTlWepoOOL9VamUbpmdOc91g6VCaFtXuUUNnNnRCFA7vbwTBS7RwyztWsEWsR9goBq
	 JJPKgs4p8aFwmCPdL1YaFV1WmZAOK3lR/iO+NsJIH93EOeqBaUmMnGOzFZqLkEDPxG
	 F5m4323sX2+Ug==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 21 Sep 2025 14:21:37 +0100
Subject: [PATCH RFC 3/3] kselftest/arm64: Add PR_SHADOW_STACK_EXIT_TOKEN to
 gcs-locking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-arm64-gcs-exit-token-v1-3-45cf64e648d5@kernel.org>
References: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
In-Reply-To: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Christian Brauner <brauner@kernel.org>, 
 Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 Carlos O'Donell <codonell@redhat.com>, Florian Weimer <fweimer@redhat.com>, 
 Szabolcs Nagy <nsz@port70.net>, Rich Felker <dalias@libc.org>, 
 libc-alpha@sourceware.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=openpgp-sha256; l=2141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=s+wftv/lLO/HEynUJMSqPwVgj4JeieBXIF19Z/tEeQI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoz/y1M7sHRQ/XGEyodNfOn9vWhZ9M8eyHg8M9M
 BlLxc+D3NOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaM/8tQAKCRAk1otyXVSH
 0FfoCACGdjQtSrOTxShjPpSqtxWnJCMmalNBZUZgxX4Lde+8F29/Ie6usgMTZi7LgEcIB6IuMfp
 c3SsNw4PVX6daOoVIAaeyG1tuRrhnVM49m3Vs1IA7Kg1j0M95+Ptn1cUiFhB0Dja2g3LVHGhGCN
 rbhq1SDo8z0iPIfbAckPabd30aF2b4vx79KQazn7CycchrCtVhXH2/nBP+cGjNKkJ1W0ebxMYOo
 XNC94IgXeu9Eyivm5R6S3uNF+NWuK8vR8wXlwd6pyK8FtNpq+UJqWZxdkki2L7HNPNlNhHRJEPf
 NKwMfkP9asW7LwJldu8/izVUaCnDq1nDZr1bhR9HA55s3WTy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_062523_854221_ACAAE048 
X-CRM114-Status: GOOD (  11.23  )
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

We have added PR_SHADOW_STACK_EXIT_TOKEN, ensure that locking works as
expected for it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/gcs/gcs-locking.c | 23 +++++++++++++++++++++++
 tools/testing/selftests/arm64/gcs/gcs-util.h    |  3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/gcs/gcs-locking.c b/tools/testing/selftests/arm64/gcs/gcs-locking.c
index 989f75a491b7..0e8928096918 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-locking.c
+++ b/tools/testing/selftests/arm64/gcs/gcs-locking.c
@@ -77,6 +77,29 @@ FIXTURE_VARIANT_ADD(valid_modes, enable_write_push)
 		PR_SHADOW_STACK_PUSH,
 };
 
+FIXTURE_VARIANT_ADD(valid_modes, enable_token)
+{
+	.mode = PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_EXIT_TOKEN,
+};
+
+FIXTURE_VARIANT_ADD(valid_modes, enable_write_exit)
+{
+	.mode = PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_WRITE |
+		PR_SHADOW_STACK_EXIT_TOKEN,
+};
+
+FIXTURE_VARIANT_ADD(valid_modes, enable_push_exit)
+{
+	.mode = PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_PUSH |
+		PR_SHADOW_STACK_EXIT_TOKEN,
+};
+
+FIXTURE_VARIANT_ADD(valid_modes, enable_write_push_exit)
+{
+	.mode = PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_WRITE |
+		PR_SHADOW_STACK_PUSH | PR_SHADOW_STACK_EXIT_TOKEN,
+};
+
 FIXTURE_SETUP(valid_modes)
 {
 }
diff --git a/tools/testing/selftests/arm64/gcs/gcs-util.h b/tools/testing/selftests/arm64/gcs/gcs-util.h
index c99a6b39ac14..1abc9d122ac1 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-util.h
+++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
@@ -36,7 +36,8 @@ struct user_gcs {
 # define PR_SHADOW_STACK_PUSH		(1UL << 2)
 
 #define PR_SHADOW_STACK_ALL_MODES \
-	PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_WRITE | PR_SHADOW_STACK_PUSH
+	PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_WRITE | \
+	PR_SHADOW_STACK_PUSH | PR_SHADOW_STACK_EXIT_TOKEN
 
 #define SHADOW_STACK_SET_TOKEN (1ULL << 0)     /* Set up a restore token in the shadow stack */
 #define SHADOW_STACK_SET_MARKER (1ULL << 1)     /* Set up a top of stack merker in the shadow stack */

-- 
2.47.2


