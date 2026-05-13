Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F56CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ve9yUrXQ/CNWv964BYcjcbjM4iu7aPgWZJq8BqEaM8s=; b=q9yCd2NkVg/E4BmY+up3lGzeGn
	XWqq7KbUCVAFZr9No1dczgRe9WuIz2Yd+5opnHDK55+Jt52QbJ/EbrHqIAvtmZKrCvJz567IyPZ1k
	zZdZwfZzpztZkoCjmcrX8Q0BlHdwbvdsfhBEcG8uvOpnFf0YFM0HYO6CT+WJcAGyA4hJ++JDR74I1
	JyIa1OMZ6muYgxL468J8lwAEnqrXqPVP65x7JK2WIMJ2B+M5mSkX5nEFTwiSyNloGnj/BI6v43B+7
	wu4yOqugeHHJ0rLgerph0Cz9zN6+mR9iQArQosEBK0/riy5ff01xOwN9JlEBXAG+Z22ctuo53qji5
	65AG1+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mj-000000013ep-3UT0;
	Wed, 13 May 2026 03:34:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mi-000000013e9-19HW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FC2760126;
	Wed, 13 May 2026 03:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6DCC2BCFB;
	Wed, 13 May 2026 03:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643270;
	bh=E5kQ00UQ2Ef71S/+LIcd2TddRuEa4D5lUI9w03xK5Hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gb4B3NvxEeWQBQYex2qIVG/q07IFXxq/Ros9VwBboVprvxZ6nDJDx7QNaRYLvC2ft
	 yarGDNnD9uaTUycsy5iTkPGVEZOdoawaSXf3k4jl3Hro4heOf+ea6ABz8LDwRZIP8/
	 cP7+jm0oj7OT19OQqVSQpX4ad/2/McPhwFK5AhXJBvbf4iO+rAZMF2SUcbbrz4RjzE
	 2eFaGH7bKs1L1SR7i2RGRkuEudBnbXIE0to9UNE26Q5ysEH9fbDI3zj20zzkytrs+t
	 X0l8RuZm0NFwYptJG/sl5zJppSQ8D5ZeW5C3FIDggl6c7POM9DcbuIQ8xYpzhmN3Hv
	 dSx9ZgzqNuLrA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v3 01/21] klp-build: Reject patches to init/*.c
Date: Tue, 12 May 2026 20:33:35 -0700
Message-ID: <f32864b560d40894cdb70d613480d7c2ecdb55e0.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
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

init/Makefile hard-codes -fno-function-sections and -fno-data-sections,
overriding the klp-build flags needed for patch generation.

Don't allow any changes to those files; being init code they aren't
really patchable anyway.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 scripts/livepatch/klp-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
index c4a7acf8edc3f..911ada05673c2 100755
--- a/scripts/livepatch/klp-build
+++ b/scripts/livepatch/klp-build
@@ -362,7 +362,7 @@ check_unsupported_patches() {
 
 		for file in "${files[@]}"; do
 			case "$file" in
-				lib/*|*/vdso/*|*/realmode/rm/*|*.S)
+				lib/*|*/vdso/*|*/realmode/rm/*|init/*|*.S)
 					die "${patch}: unsupported patch to $file"
 					;;
 			esac
-- 
2.53.0


