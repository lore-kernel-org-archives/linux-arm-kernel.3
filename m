Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8499CC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 20:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rA58PSq59ct6hyQRhMEzlraWcFyA2/zxWUU6GgU+788=; b=BmUjRrKPkiOYsQtFDoPJ+fxYQB
	L+3Krr38e2gaeePiq9Ie4IDfogiBWpXTtmGNpcVPgafU2Mhyo2MScbFMRKH+BW0MiiZJuLjiQWCsN
	60kPfJLl8mU0sfiOhoAUXqGSXko4sQLOSPTz/CxtftBRUvdVXzq/lcA7puMCQqOxmccvciBcU8nRl
	fsL2xl9GmoUFpb0ZmWoeTpPpS67868R/jVKwqBadTbHDkT4nUReaRrryPnv8szRq+mKoVDlAqBuyM
	cpx0yYdEJDVjnzjZG9YwUPcikY95hWEWSf86w2HINU59I9goyinWLg3MhIRbSInyIWBzux979HzPo
	EQ+PTCtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5AD-0000000GEbw-2Ypw;
	Wed, 14 Oct 2026 20:01:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5AC-0000000GEb5-16eT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 20:01:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B60D7447A8;
	Wed, 14 Oct 2026 20:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6511F000C9;
	Wed, 14 Oct 2026 20:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008083;
	bh=rA58PSq59ct6hyQRhMEzlraWcFyA2/zxWUU6GgU+788=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U6jHo78e72z2xYPYD5ffo2o4IhU2p9EYuHvk1szfldPP2qD5DbpzmUx77WUQYLT/x
	 tHTEOgNDtKxDXMooe4WsZ1VxS/H7OpVDqsX3NmUts14zSNB+syl3VTjH4WexpLYGTk
	 uWDkvCsyBSRWTuqcJupKDP236eN9O0IwqLakRjSY6evQZoNAytL80ugjyrKPmZn85w
	 kHsrmB6VBuALEuyQFIKXmyKCZuHpsHfOpkARVtDrm9qe4+syOmXKVQy+VNk5tT8XsN
	 zVIqi5TmF9H0giqEB3Pn70IijK5lXLVHSvThJfosysipf3VcfgZic6YcGmtw2WMWRn
	 UxKg67QWUcDZw==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ricardo=20B=2E=20Marli=C3=A8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] kselftest/arm64: keep building and installing after a subdirectory fails
Date: Wed, 14 Oct 2026 16:01:12 -0400
Message-ID: <20261014200115.1363363-5-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014200115.1363363-1-sashal@kernel.org>
References: <20261014200115.1363363-1-sashal@kernel.org>
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

The arm64 suite builds and installs its subdirectories in shell loops
whose status is that of the last subdirectory. A failure in an earlier
subdirectory is therefore lost unless FORCE_TARGETS is set, while a
failure in the last one fails "make all" and, through "install: all",
drops the installation of every other arm64 test as well.

Make each loop fail only when no subdirectory succeeds, which matches
how the top-level selftests Makefile treats its targets, and keep
stopping at the first failure when FORCE_TARGETS is set. When a build
report is requested, record each subdirectory as arm64/<subdir> so that
a partially built suite is visible even though make succeeds.

Invoke the subdirectories with $(MAKE) rather than make. The command
line variables already reach them through MAKEFLAGS either way, but
$(MAKE) lets them use the parent's jobserver and makes -n, -t and -q
apply to them.

Fixes: 313a4db7f338 ("kselftest: arm64: extend toplevel skeleton Makefile")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/arm64/Makefile | 43 +++++++++++++++++---------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/arm64/Makefile b/tools/testing/selftests/arm64/Makefile
index e456f3b62fa13..c787e848d4718 100644
--- a/tools/testing/selftests/arm64/Makefile
+++ b/tools/testing/selftests/arm64/Makefile
@@ -26,38 +26,53 @@ OUTPUT ?= $(CURDIR)
 export CFLAGS
 export top_srcdir
 
+include $(top_srcdir)/tools/testing/selftests/build_report.mk
+
 all:
-	@for DIR in $(ARM64_SUBTARGETS); do				\
+	@ret=$(if $(ARM64_SUBTARGETS),1,0);				\
+	for DIR in $(ARM64_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		mkdir -p $$BUILD_TARGET;			\
-		make OUTPUT=$$BUILD_TARGET -C $$DIR $@		\
-			$(if $(FORCE_TARGETS),|| exit); \
-	done
+		mkdir -p $$BUILD_TARGET &&			\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
+		status=$$?;					\
+		$(call ksft_record_build_status,all,arm64/$$DIR); \
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;			\
+	done; exit $$ret
 
 install: all
-	@for DIR in $(ARM64_SUBTARGETS); do				\
+	@ret=$(if $(ARM64_SUBTARGETS),1,0);				\
+	for DIR in $(ARM64_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		make OUTPUT=$$BUILD_TARGET -C $$DIR $@		\
-			$(if $(FORCE_TARGETS),|| exit); \
-	done
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
+		status=$$?;					\
+		$(call ksft_record_build_status,install,arm64/$$DIR); \
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;			\
+	done; exit $$ret
 
 run_tests: all
 	@for DIR in $(ARM64_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		make OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
 	done
 
 # Avoid any output on non arm64 on emit_tests
 emit_tests:
-	@for DIR in $(ARM64_SUBTARGETS); do				\
+	@ret=$(if $(ARM64_SUBTARGETS),1,0);				\
+	for DIR in $(ARM64_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		make OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
-	done
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
+		status=$$?;					\
+		$(call ksft_record_build_status,install,arm64/$$DIR); \
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;			\
+	done; exit $$ret
 
 clean:
 	@for DIR in $(ARM64_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		make OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
 	done
 
 .PHONY: all clean install run_tests emit_tests
-- 
2.53.0


