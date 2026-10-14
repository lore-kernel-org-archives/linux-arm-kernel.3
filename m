Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68EAC3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 20:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kvH9a/W89tZJwkWJJfa80zFGn++eJmb59weeXs/8uuU=; b=LcipbixI9GUiQo4plMv7mfQuGi
	Da/lPjJM9zvQ7SUqLLv4FB0oaecyJo6juXQ4oOJhPZDtNNW3QNGfsFxVRGHGDR7aJJLQOKa9AgqGi
	qQVflaTqpe/cVsXjewB9YGMHG1+eNUbNpNHBVLNSP/54vK1sPyGkRi/IL0jSGPFEFS9u7dfnWpAQd
	NGKdsc7zJkUu+masnBwgvPqst6/3P+GAF7DlL4wuAdmG+amrAHfvJXV5s8mficMBQLxzK+16b8tEK
	KWlJEBC7yYgTYsEvCtCYpEl2NvHYRwfNgPvmy4bvA5FJS+82mUS7AnNftIloNlvvQt6nYbDQI8/OE
	y5/xy36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5AX-0000000GEkS-49cl;
	Wed, 14 Oct 2026 20:01:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5AV-0000000GEj0-2PqQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 20:01:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B6F7B60A75;
	Wed, 14 Oct 2026 20:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7FD1F000C4;
	Wed, 14 Oct 2026 20:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008102;
	bh=kvH9a/W89tZJwkWJJfa80zFGn++eJmb59weeXs/8uuU=;
	h=From:To:Cc:Subject:Date;
	b=bzWATHB6HSA28GRD/qm5bsV1FMCHzOzRoDkZ2kjxBjGX8jrn8Z0kDjFh/OdsVCOZz
	 3WQwRMs2XLPqgG6Fua94ELep1HkGBbxnuqC2VjrH30DL/l8oVBQCBBJwh6WGUkVmkR
	 o5kijjef0BgAFGpSK8alQyNzUt5TdSiyjlBFWWTGjgWoWaI6yzou+9yjEvt6T/CgZ9
	 BdQ2JiBrOIftEUL187otPtjH3e7Nu10/nA7jYtzsC3r/cjyfA39hfEHGO3NZVpSUVm
	 ZMN2WTp5lnTwWrWf1LkR8MKktI/Ubp2evsykersbwlbI58aku36XJ35yUeIKGCBI7M
	 nS+eh5QAxzPQg==
From: Sasha Levin <sashal@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kselftest/arm64: signal: copy each test binary only once
Date: Wed, 14 Oct 2026 16:01:40 -0400
Message-ID: <20261014200140.1364282-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The signal tests are built in testcases/ and then copied to the output
directory. The copy rule lists every generated program as a target and
copies all of them in each recipe:

  $(TEST_GEN_PROGS): $(PROGS)
          cp $(PROGS) $(OUTPUT)/

In a parallel build make runs that recipe once for each program, so
several cp processes write the same destination files at the same time.
cp then fails with "cannot create regular file ...: File exists", which
fails the arm64 build even though every test compiled. A cross build of
the arm64 signal tests at -j8 hit this in all of 8 runs.

Use a static pattern rule so that each output depends on, and copies,
only its own binary.

Fixes: f96bf4340316 ("kselftest: arm64: mangle_pstate_invalid_compat_toggle and common utils")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/arm64/signal/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/signal/Makefile b/tools/testing/selftests/arm64/signal/Makefile
index 1381039fb36f9..c4df4be41636c 100644
--- a/tools/testing/selftests/arm64/signal/Makefile
+++ b/tools/testing/selftests/arm64/signal/Makefile
@@ -17,8 +17,8 @@ TEST_GEN_PROGS := $(notdir $(PROGS))
 # the toplevel makefile
 include ../../lib.mk
 
-$(TEST_GEN_PROGS): $(PROGS)
-	cp $(PROGS) $(OUTPUT)/
+$(TEST_GEN_PROGS): $(OUTPUT)/%: testcases/%
+	cp $< $@
 
 # Common test-unit targets to build common-layout test-cases executables
 # Needs secondary expansion to properly include the testcase c-file in pre-reqs

base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
-- 
2.53.0


