Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3E9CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 22:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vl0+9f3jCVQoi+Ne0LNuPUNCZ0g/8cjvmqKfZEmdHEU=; b=nJU18Ca9xy4H9K2rPekugU+B/9
	x5gtxFC5XAF/yf6pL1MCJffn3lNyjhVr3mgo40Dx4Ypv2DedWjol+P1lMVCq56v5wnuxhKU2UHXis
	HHaUCpNLIjACjxU1TzrrhpYKq0fqZP67WpkCE65OuVGFZhCbymAPWXeC/lzygf6QZQ51/DU7eMyz/
	a52JCKJTX6AUcXxPBp7DV984+ihHynzRtY0cZDpkGTGpS1Z/yf1V0UcXbeAVHL/vBhN5NYGViOuMA
	3/gqoA19IDE7rFCbN9yDcl3AS7237XDuYYZd5fz93cJj2oBFRSS3EkkK+ko5CrTXNUZXj/Gdl78xx
	qFhf2k1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEDUi-00000001RPK-0Cyc;
	Tue, 06 Oct 2026 22:18:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEDUX-00000001RLq-0fyU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 22:18:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 809C6169E;
	Tue,  6 Oct 2026 15:18:27 -0700 (PDT)
Received: from mammon-tx2.austin.arm.com (mammon-tx2.austin.arm.com [10.118.28.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 541623FA32;
	Tue,  6 Oct 2026 15:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791325110; bh=OGA3idTNXhZROHziMCaC6ZlubDmLelD8Mc7M9kbqDt0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dVWdqd+JrjtoiHS5XWYJdUrIgfbv6H6qN0ElbsqXdILe//sCfyoNyBbZ/RBZ3GUmU
	 LaHhKDcIw3WiKB5petIKo8w0GOl5jd8OlUSvQZNY14yyX4q1obDqNrmPqeOb9YvgL6
	 f28r1Rk3s/oG7jJJ/3BrOizaj7aSOB8ez0vpv0oI=
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kbuild@vger.kernel.org,
	linux-modules@vger.kernel.org,
	broonie@kernel.org,
	jpoimboe@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	mcgrof@kernel.org,
	petr.pavlu@suse.com,
	da.gomez@kernel.org,
	samitolvanen@google.com,
	atomlin@atomlin.com,
	ndesaulniers@google.com,
	mark.rutland@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	ardb@kernel.org,
	Emanuele.Rocca@arm.com,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [RFC 3/3] arm64: bti: Drop compiler specific BTI checks
Date: Tue,  6 Oct 2026 17:18:15 -0500
Message-ID: <20261006221815.2823252-4-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20261006221815.2823252-1-jeremy.linton@arm.com>
References: <20261006221815.2823252-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_151834_140634_E8D9A9A4 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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

Now that modules with missing BTI landing pads have veneers explicitly
added, the need for compiler revision specific checks can be dropped.
The link pass will correct the specific cases that both clang and gcc
now generate.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 arch/arm64/Kconfig | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cab741a695f5..aea4c34a18bc 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2196,12 +2196,6 @@ config ARM64_BTI_KERNEL
 	depends on ARM64_BTI
 	depends on ARM64_PTR_AUTH_KERNEL
 	depends on CC_HAS_BRANCH_PROT_PAC_RET_BTI
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
-	depends on !CC_IS_GCC || GCC_VERSION >= 100100
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
-	depends on !CC_IS_GCC
-	# https://github.com/llvm/llvm-project/issues/215547
-	depends on !CC_IS_CLANG || CLANG_VERSION < 210000
 	depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_ARGS)
 	help
 	  Build the kernel with Branch Target Identification annotations
-- 
2.55.0


