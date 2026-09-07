Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421B1C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JfwpOYvAv8ZYnfU3oq0MU6ImzI/HXu9p9BUtiuN48U=; b=Qx0YLMxPY+64AQ7le/QtRn3/U5
	1+QepwIB0Ohf39nqPfNInB+OjKiyNEXoxtPJLhm7wyd/vJRBpN+ETidf009ihxaHaXz5Ve5hzcP+B
	gw+rPQTGKMqqi+Mh9JXZOtn5kKh/Knn4fqtKwwvcw+Fx32qZWOTbbHbOTxWm9CumZ5gSPKSgEfJh3
	joyAhivLf05JziqhL2dvcK8+g1/B1Sjv3eV9iJXjUGgkOMdx+v+F4q0gy00F5jqoEzClnA/gxdW+0
	mw22z8R+PWCbkkdmlnA0DI/lPDy1rS015zHxt7QIIY0BxLA1TKDQsizo0zeX9Owni2em5vPD6XHQE
	vhFEuGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cMC-00000007KAh-3Qrq;
	Mon, 07 Sep 2026 16:38:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cM9-00000007K6i-0Lbk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:38:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D32F5439B4;
	Mon,  7 Sep 2026 16:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9F91F00A3A;
	Mon,  7 Sep 2026 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799084;
	bh=+JfwpOYvAv8ZYnfU3oq0MU6ImzI/HXu9p9BUtiuN48U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PwXXppz8RiCXsg/CuFuJF0bBs9LDVedC1gXhgY5HBFLvAcscR8NH11AAGkm+CkuCA
	 hBq0lhTVQECU9NWzI5G1gy7A7cGRhhafyU/9l7NJpTFaP28H96V6eaQcN+3CLZqNDn
	 DcNII+pNZNz/QdNTYhYnAHmGLQma0Rk17zm4Svm4m/C9ucEZ6OlgE06YD9D08Ls0Eq
	 3xtosPAj6UlWRoIaKwnner/gYH0QdlJfmX5VNb1s6PrKLfDC45oLPfS0OJ4O7kuNOZ
	 nu53RvlGLQ1BxVPY/yWQly0VFRbe1wQrGeyHHzXqUXUrLOhOASpnj9I7IDaDol9fvp
	 GY+R/B89W0+zA==
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
Subject: [PATCH v2 08/14] arm64: vdso32: Always build compat vDSO object as little-endian
Date: Mon,  7 Sep 2026 17:37:19 +0100
Message-ID: <20260907163726.17104-9-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907163726.17104-1-will@kernel.org>
References: <20260907163726.17104-1-will@kernel.org>
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

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
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
2.55.0.979.g7e5102b832-goog


