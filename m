Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF67C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oG0eZ9V4Bwd/qY1bBi+2nFmOgXnSQnG8OPQi7dEDnw=; b=oakMjsxlaHimQBRmxvQjZcKmzf
	7vlK3jc9NT/hd4Fw+GYFMuKCBdz+F27D+OpZukAB56xyJGVZ9ZyNjGc8l9RHE3fAi+EfBWSkWNWEe
	ksYgaOJHsRHa2iMGwqz0bqgx3Wao28s6u0QuR3fh55hp6IrUI4d6CuloPDypURmU/P+26Zr2R5NWG
	QVgI0YIbf1kuQm001CMHvB576SOBHZVD2NnBJXNtlJobDZfzCHqUc4/LR0qtzonvJMxacd+bl15sr
	Rx339ooyJDeZZeRWXn7dMBrBxeIl3wSxSHhfrDOabmZjB9A0IFRO2P9Tmr97BQA1+ovXn4ajTWTN+
	FBw6Aw2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn3K-0000000E9To-0GAt;
	Tue, 11 Aug 2026 14:02:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn3I-0000000E9So-3f2o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:02:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FDE1405E4;
	Tue, 11 Aug 2026 14:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22AEF1F000E9;
	Tue, 11 Aug 2026 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456920;
	bh=+oG0eZ9V4Bwd/qY1bBi+2nFmOgXnSQnG8OPQi7dEDnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A54poN27vD0zAP7BbJsRw9L7rjpRNJudut3Z4uf3wKxg2t1Av0zJnWeQUFjkNd8mC
	 DjaJ/NX/UqnxKWKjunyigPq94uSNCW1FQ/vrm08BFjey0VUS9pGDKiQN9ipVsHAtcI
	 vQcju18vW2Q0MTLeM9mExEdZW5U6qbRTMl3N4UgiFtbJ71Z1+RdPYGw7Eqxkzwea1N
	 r60nhbMvZ1GGUCR3+ZMZEilSo7sr4FszKGuwjEMiceFiu+DMftf7qn7JIf54xVLJDd
	 u2Uqatcv0ggEu6C0l5SBpxfkovzV/B3darlLwiy5C7tF2cXGvDM/b973n1/CvBFN7J
	 4Wb63iSqnivng==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 07/12] arm64: vdso32: Always build compat vDSO object as little-endian
Date: Tue, 11 Aug 2026 15:01:26 +0100
Message-ID: <20260811140132.22778-8-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260811140132.22778-1-will@kernel.org>
References: <20260811140132.22778-1-will@kernel.org>
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

Big-endian support on arm64 depends on BROKEN. In preparation for
removing the dead code altogether, remove support for building a
big-endian 32-bit vDSO.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/vdso32/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index bea3675fa668..00efdc5d2354 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -45,11 +45,7 @@ endif
 # From arm Makefile
 VDSO_CAFLAGS += $(call cc32-option,-fno-dwarf2-cfi-asm)
 VDSO_CAFLAGS += -mabi=aapcs-linux -mfloat-abi=soft
-ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
-VDSO_CAFLAGS += -mbig-endian
-else
 VDSO_CAFLAGS += -mlittle-endian
-endif
 
 # From arm vDSO Makefile
 VDSO_CAFLAGS += -fPIC -fno-builtin -fno-stack-protector
-- 
2.55.0.679.g6767b8d81c-goog


