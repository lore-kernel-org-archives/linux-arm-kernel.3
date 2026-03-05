Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F3BEFCE43
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64qUsumHey4Ps+MmxtUQ0bjjwf70Jlg4HLZGwDXkgYw=; b=gtdNAj49sKQSyi68fRTPlqqWD9
	wZdOT06EeOP8omftKgCRZCf1T/Wb11L/i8OFbm/qn07ckxDKRLdf2DDx/HQmkjPBp2uizGoG77Pnz
	XyaVCIVJo+pYT4+WVqpx+nWnID2RnNX6DBIATkN88g8GL3Sv4dVFF6PnaFw0Qjbm1ATKHvMPax9AT
	tmUg3BnS/5q5z91/JaiNCu/O+INDepcVAuneCRFfvDr2GrbdfZhLXIklnewt/9xIEmQPRxtVcmsWt
	pIPQjj1r4xrNCDPnmMLWv0FhAdOE4Km+ENYttyOjwQQ59g72SgO6okg++AoPxeGH9e5fj3OzlKyD1
	fSd1rqpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRK-00000000pou-0tet;
	Thu, 05 Mar 2026 03:31:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRH-00000000pn7-06FH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:31:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B3896183A;
	Thu,  5 Mar 2026 03:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1D8C19422;
	Thu,  5 Mar 2026 03:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772681509;
	bh=5NJSqLWQvTCeEjYLw+cyVI09fAwxwdSEOs9zrhOHrJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QtaioH7ZbYcBhZZK3Jp83z+yQIQU1Phpz2iH8jV+jk6PMMMOhry84JoME+vpEjQ3A
	 AzxbTlbjEeJrRK+fkuaGKCoU/5ahlSShNuGHdFUC5mBSDjFb+qgfrQtBSPNr0ttWi/
	 y9kKrz+fYMCZ6i5nn/1EBEVhGd1Tpqo9RtxlMcTu/Kr8Btr25oPRvQbQfFw/vs2LAi
	 +MA3o6OyUeadSngMuz+CA3wlwdg52krarBeNF0WNDchwSxmYeW+QFutPtVMi4EfD0X
	 Alm0bIK9chbCzEUHwpn+q0DKpTeZJAaBNdjOkzITqAVZsdws5hNxAcQsTuOQpU8C6+
	 WTieenc6WUPQQ==
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
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH 05/14] arm64: Fix EFI linking with -fdata-sections
Date: Wed,  4 Mar 2026 19:31:24 -0800
Message-ID: <f85416e754996eeaaf158143e43eea8a81003849.1772681234.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772681234.git.jpoimboe@kernel.org>
References: <cover.1772681234.git.jpoimboe@kernel.org>
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

When building with func-fdata-sections, the .init.bss section gets split
up into a bunch of .init.bss.<var> sections.  Make sure they get linked
into .init.data.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index ad6133b89e7a..1f5e4f996a21 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -269,7 +269,7 @@ SECTIONS
 		INIT_CALLS
 		CON_INITCALL
 		INIT_RAM_FS
-		*(.init.altinstructions .init.bss)	/* from the EFI stub */
+		*(.init.altinstructions .init.bss .init.bss.*)	/* from the EFI stub */
 	}
 	.exit.data : {
 		EXIT_DATA
-- 
2.53.0


