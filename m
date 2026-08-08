Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F7BC5AD48
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 23:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyozvoBnjvSrjbOXhKp9IQG5F3ojaiPlP82IjEqib/U=; b=HDrmmyr8ob/ILmJTAF/abfIqfB
	Pag3n9viBRAFGzRx1BMqDKFMpkiyZFdAJLe7Ev0tA8Trmwj8funeAZ/E7dMBgxx6dNrbhjwrZ5ShP
	PrkAU7t9bvSgyQ3nCrlKG2iQmqqc0NKjy40VdfjOGc1wiSPzXE9ed8SStJ9Mw22d1SwYVgsnn6Sn2
	19TXThWKwiRlJcguWTGj6kqSq7fPiyZlg3MiwAJi6z+bAvNHdUGbEK9IfRGkpJpWnRa9hTIqe2WQi
	iuigzJPRVLvO9GXrXkYN6P6AJVx31meYnexd2EHnFrxLtie00h1Uc5Q32YYeih9GQW9LPm4cz9vWI
	5GlwwSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJ5-00000009m4Z-0CnC;
	Sat, 08 Aug 2026 23:18:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJ0-00000009m4D-3uAC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 23:18:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FE536001A;
	Sat,  8 Aug 2026 23:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769DC1F00A3A;
	Sat,  8 Aug 2026 23:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786231097;
	bh=oyozvoBnjvSrjbOXhKp9IQG5F3ojaiPlP82IjEqib/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IS5JcHGdxxKfN7iks17rbx3r/JWSLEtBi45P786gDtjuKue1BGcRHzuIVpwlRMVMx
	 5HiUi8xZg3g6yPKzBvkJBemUv79cPcqWGxZhOKuDiaIKTH6FlN2sEInJ/sZvkuy5hL
	 K5eGEoncdXqi+eIKmquGRsCfELrPPIl8nsfdpFm3OskfT1qmLm0kHoEtzMcXLBDFZk
	 sVc5sgyRpqtWUod7T0BrJMOD3zBPlxWA7S5F9SMCXlf1cKjYTmEGLOU65NCycsdYcH
	 P4k3pUi55LSO3O5UT+dKKPVzFydTNyrK0PhQKPEDqllCOG3x/3ttdhuvq646cEhJFA
	 NDklV1Pz+ai2g==
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
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v4 02/22] klp-build: Reject patches to init/*.c
Date: Sat,  8 Aug 2026 16:17:06 -0700
Message-ID: <35e3cba998d143183562f76ec47d159e31424146.1786230311.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1786230311.git.jpoimboe@kernel.org>
References: <cover.1786230311.git.jpoimboe@kernel.org>
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

Acked-by: Song Liu <song@kernel.org>
Acked-by: Miroslav Benes <mbenes@suse.cz>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 scripts/livepatch/klp-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
index b52a8489d9f67..b311f290b1406 100755
--- a/scripts/livepatch/klp-build
+++ b/scripts/livepatch/klp-build
@@ -365,7 +365,7 @@ check_unsupported_patches() {
 
 		for file in "${files[@]}"; do
 			case "$file" in
-				lib/*|*/vdso/*|*/realmode/rm/*|*.S)
+				lib/*|*/vdso/*|*/realmode/rm/*|init/*|*.S)
 					die "${patch}: unsupported patch to $file"
 					;;
 			esac
-- 
2.54.0


