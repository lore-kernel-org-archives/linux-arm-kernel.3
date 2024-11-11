Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB90D3ABEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 18:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cHYYm5p2gi666U61qSt3+Okz8u2r1M0B9lAqT+9zUwE=; b=d6aVH7JZ2QkoSaoyHXt46pzFyC
	YnsX+O1AhTN6wBnIDxlIsxgyr4pvczaoy/HC6X3M/KhPRG+5jwSGksiaaiCU45HacqQvtEMS08MEg
	lE2AAnerKZesHfHJFACWTEMUnktwTIBAOzqW0I3+rf8ywevEx6Zm+pZCc2bMQhc+RJGUn8Sd1J2yU
	2L0VhRjtkyPlLDqlH8JIdy9qeNE7epr+zYaiABbh8ZR+lBp3SoxHQOhprdico7gPHdpGP2SVfvlms
	G+jrdILwN53bqW8SLF9GYf6opVnksgaaaaufl64xZO07BI7F7z1/x92LH5lFOUzVawe5o4/gWctKU
	fM8THTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZFd-00000000vNd-3yl2;
	Mon, 11 Nov 2024 18:35:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZDr-00000000v9Q-0xwe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 18:33:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D1A7AA4180C;
	Mon, 11 Nov 2024 18:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2FFC4CECF;
	Mon, 11 Nov 2024 18:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731349989;
	bh=3B/5kUYL8W4cwhJZ8ncK+YOGBwMwcZd5A7SQVXdUjpo=;
	h=From:Date:Subject:To:Cc:From;
	b=eB7PRkM0tXHORqfiHIBcRDu5y+IkUJbJfzKwEJ51BPQxCfXaLr7PUbHsy/n+6kYcP
	 5sVWVtULEnSeAcTbFuxHYZ1BFlZ1sN3In6ADELGEEwFModnm/K58IXO6Jeqlldk9f2
	 Stj7iOodNoR2rhClQEOVXy1AaZXUqM5HlvcfnD23mIACZPvlJXYxi6zlxo6b7u5EeP
	 6oWok625A3KZ9fOmrSMEcAELv3GfTCGHPDjdfnH7dKfHKFnVkuqp4HoHQmQys3XYvP
	 fe3EYWXp/9bkK5vHxlBugJhtEojgvodqfdF+QzvSDG2rYmt5WCpC8/VDYAI63tavnb
	 ZXnveMeQwOy0w==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 11 Nov 2024 18:32:58 +0000
Subject: [PATCH] kselftest/arm64: Enable build of PAC tests with LLVM=1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-arm64-selftest-pac-clang-v1-1-08599ceee418@kernel.org>
X-B4-Tracking: v=1; b=H4sIANlNMmcC/x2MSwqAMAwFryJZG2hF/F1FXNSaasAfjYhQvLvB2
 Q3MewmEIpNAlyWIdLPwsavYPAO/uH0m5EkdClOUVkEXt6pEoTVcJBeezqNfNUQ/NmYiU7e2akH
 nZ6TAz3/dD+/7AYmktUhqAAAA
X-Change-ID: 20241111-arm64-selftest-pac-clang-cb80de079169
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3B/5kUYL8W4cwhJZ8ncK+YOGBwMwcZd5A7SQVXdUjpo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnMk3iGC0+I1ctBJ6Drd9vqX4HeZ5w93WHhdwde
 gKKAdXgreOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZzJN4gAKCRAk1otyXVSH
 0N9zB/sGxMPQGy1POFWcAZb/Bw9nz1cJKiFiWxfYnMrZeE4DTxzQXvwgAD0ZdwJKBL+WdWubUrq
 HxP9lpgZywM/WlPVh8UvOkn8aOwYfeLwzqGtw6GmDwT3ZLywgSZXYgB+/LHewyuLLxwheKgOQhK
 29iy0o4kd9SiKG2mdU2IUD2o/ODaA5aqPzE29iICx6prBe2HerBZcCk5wERHaKPlZwgq/juprJE
 zkBWNyF116RLWExxgAviOGGQuE9owohxbgteEyxkwpN6d4G+nvT7qCjvirFxsKyOTfVem0AJ2fG
 Pmr064U/ore/bqcfF0pQ4DqzlJE2jBqaKHqsHShaYsuGXdva
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_103311_436339_998256A0 
X-CRM114-Status: GOOD (  11.22  )
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

Currently we don't build the PAC selftests when building with LLVM=1 since
we attempt to test for PAC support in the toolchain before we've set up the
build system to point at LLVM in lib.mk, which has to be one of the last
things in the Makefile.

Since all versions of LLVM supported for use with the kernel have PAC
support we can just sidestep the issue by just assuming PAC is there when
doing a LLVM=1 build.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/pauth/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/arm64/pauth/Makefile b/tools/testing/selftests/arm64/pauth/Makefile
index 72e290b0b10c1ea5bf1b84232f70844a601b8129..b5a1c80e0ead6932d2441a192b9758a049e3b3f8 100644
--- a/tools/testing/selftests/arm64/pauth/Makefile
+++ b/tools/testing/selftests/arm64/pauth/Makefile
@@ -7,8 +7,14 @@ CC := $(CROSS_COMPILE)gcc
 endif
 
 CFLAGS += -mbranch-protection=pac-ret
+
+# All supported LLVMs have PAC, test for GCC
+ifeq ($(LLVM),1)
+pauth_cc_support := 1
+else
 # check if the compiler supports ARMv8.3 and branch protection with PAuth
 pauth_cc_support := $(shell if ($(CC) $(CFLAGS) -march=armv8.3-a -E -x c /dev/null -o /dev/null 2>&1) then echo "1"; fi)
+endif
 
 ifeq ($(pauth_cc_support),1)
 TEST_GEN_PROGS := pac

---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241111-arm64-selftest-pac-clang-cb80de079169

Best regards,
-- 
Mark Brown <broonie@kernel.org>


