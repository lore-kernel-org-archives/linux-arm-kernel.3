Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD949D78770
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 15:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4AxrLrQ3wiMF7/0/1o1CXVglcPjLOtxphS7AyzeRczw=; b=fnTppXLXvpvbRE1yo5Xi09VHAC
	5RQ+9KGPQalw5U2u/qBIWa9pwZO+663Z14HfDA4cryt4sBkN/FvutgRozKLkPP7xukX3DghRupl7I
	Do+EQxBnBi81f1EZsLM/XgoQyl58SODVFbCvuWOFbS/qJHODJkIFsO1BF5dkHLZvoMnNc77PyMLJq
	2syGpvC9ddbuUHCGgZTvNNbA8fyaVqA5LN9951QZ2zfdSmLivlIeePxDuGD0ZmJqiNayRdFpRBPUs
	JW2fVawAs+zpYfeZd/Mix2iJ+jTPA0EcYH/twsmbHA5hh08dXG+QvrwT/DBmXzEO0W5emVTMOmjmW
	3YOD+R6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcQb-0000000AVtF-1szu;
	Fri, 19 Dec 2025 15:30:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcQa-0000000AVsl-2nAa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 15:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CEA560177;
	Fri, 19 Dec 2025 15:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0CFC116C6;
	Fri, 19 Dec 2025 15:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766158199;
	bh=CkxlXN4DXTzDhcNxrzGsCReBqOAWuvkB7mMRlPoHBDc=;
	h=From:Date:Subject:To:Cc:From;
	b=TJoWBw4bMaTID367gbGeuEJ03a+J5jIu8VpiwfgU3GKE+AoTYaYyRQtmxHP3W1Sxy
	 PoP3FrXQc0nD6ieRqMnmfb1FE28/FNjdO9CfuyEHbjQCBlYKKeROeNfxlLGuzlRUg3
	 VN3c8wmsaA5iCsh5hEhmXybZaAb6CsgfwUmqJKgauLrEN0vPw03DMMgSPa6zpNGt1X
	 1NeDn2WJ/W5e7Nvocy7b/J15XKozXcIXLir7fKIVu8To6qrKXdjE95lM2RK69EKD1C
	 Dq84vWHIzo/7i7kdubGowH9NdKofu3pW8WKNyXWDJ3S8acMGJUzJM2pZjChf2l4k98
	 5OdP0XU+qhvbQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 19 Dec 2025 15:29:42 +0000
Subject: [PATCH] kselftest/arm64: Support FORCE_TARGETS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-kselftest-arm64-force-targets-v1-1-cf72d6d27e99@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGVvRWkC/yXMTQrCMBAG0KuUWTtgQtXqVcRFkn6p408rM1GE0
 rsbdfk2byaDCowOzUyKl5hMY4VbNZTOYRzA0leTX/uN827PV8MtF1jhoPdty3nSBC5BBxRjH0O
 XEHu3azuqx0OR5f37j6e/7RkvSOWb0rJ8ACAOg9OBAAAA
X-Change-ID: 20251219-kselftest-arm64-force-targets-2ba8cebd1748
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CkxlXN4DXTzDhcNxrzGsCReBqOAWuvkB7mMRlPoHBDc=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhkzX/NKopvqTPQH281mLNgkXO9nEmM9uzoywvHxk9TrdD
 X8s73l2MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQAT2fCL/b+T+eOw5y77hdfM
 vf7SnSlJ1/Tv8+6aFx86zK+fUMir3Kr1W+6Ah2a9bOSub5McLLnKHtR+P3mWt8rqDfcKX2UVd5+
 qnrfxtYY2f3zKfjRy6Ah8VjSzOpxm2pC0bqoQt/PaBxNmmAloN0kxOfa6/doQIBUY1b0p9l9A9Q
 Wp+9MdEloUinkjol2Knwc0+Ivej1HK+5TNUTLZ9OjzDSEq944+yFGTuJd1S6vXvYTLJqmh8ln10
 4U/D7i+n5Q1s/KI6v9Tvs6Zt/VePOO9eOqRlHnIQ8HigOraJ0sCXN4sEvX3Xp4S2ibhWesolPJ1
 5iF1jumBizhO22itaLgzp8c1/NyKQ8e0isrenj+rO7sIAA==
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

The top level kselftest Makefile supports an option FORCE_TARGETS which
causes any failures during the build to be propagated to the exit status
of the top level make, useful during build testing. Currently the recursion
done by the arm64 selftests ignores this option, meaning arm64 failures are
not reported via this mechanism. Add the logic to implement FORCE_TARGETS
so that it works for arm64.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/Makefile b/tools/testing/selftests/arm64/Makefile
index c4c72ee2ef55..e456f3b62fa1 100644
--- a/tools/testing/selftests/arm64/Makefile
+++ b/tools/testing/selftests/arm64/Makefile
@@ -30,13 +30,15 @@ all:
 	@for DIR in $(ARM64_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
 		mkdir -p $$BUILD_TARGET;			\
-		make OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+		make OUTPUT=$$BUILD_TARGET -C $$DIR $@		\
+			$(if $(FORCE_TARGETS),|| exit); \
 	done
 
 install: all
 	@for DIR in $(ARM64_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		make OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+		make OUTPUT=$$BUILD_TARGET -C $$DIR $@		\
+			$(if $(FORCE_TARGETS),|| exit); \
 	done
 
 run_tests: all

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251219-kselftest-arm64-force-targets-2ba8cebd1748

Best regards,
--  
Mark Brown <broonie@kernel.org>


