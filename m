Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23067FF6E91
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 22:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nN6UoGSW/zXcVW7MmaetqvCjQQfu8902IYuOlMtwbNo=; b=Bkhyek0xApqlP8dfNuHbe+vjuS
	rM4eZPjEkd92NqRa0mjGEsh5R2+r8V83dN00VnLNEjk4IB3DsDdSTyfw5I8ELgNTt2zkB1Cad6eb5
	0Gy26YMjMK58GTjwsL+Z0Gjd5zwEMJgPsUjCf5UHPVpFPPBInuBjKcCTSJSOALjyNtbcwvNa13+N3
	6DheAwGOQuabf5w62/SRvihKCY2iX/Z7jn0nh712M1VGTmcGzfdY6kHefr5z/iuCvot8snXuozBX6
	vZ9WNPaQjbdfdg3Xs1MZqljUGLotOpXc+zX/Qe9odTXbs8pEY6LCqVgDBuWe86cB43jqSscye6Adr
	s0amb7iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGC-00000007KWm-2plX;
	Tue, 17 Mar 2026 22:51:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGB-00000007KVK-0ZH9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 22:51:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35CA260054;
	Tue, 17 Mar 2026 22:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6F1C19425;
	Tue, 17 Mar 2026 22:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773787893;
	bh=XnVKZDr9XXzDhXGeIbv+VTsNo7kWr53t2t9B4bwhIjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jIXLFcFbAMraX2atbcW3r9Z+fs4ZD/daKD8AiV3tBTBKJ1S50NTymLNUxoszu+aLq
	 kqTLzEm7y//QxjgVbCsaQO8IxziAFguXcL2rNdNo/gaTNkDq9sG3hguBy6NADJgEP2
	 D69XncXOdQ9oMSsDXXkbS38LaQzJGchph9+WgLAGf9GdoGO1EOVRh3ke0CqflRSWnB
	 yapgHfMLJDPcKDFO8lWba2fVQVYqP1DbzSatQ31xhZVCoYHhvSZry6tqy+M/A6pRiY
	 UJaSR73MsQOgP9ueUx8Bvio4GHNWHeUSoWlnBuXxwmEoAjbvS57p9A0c9K0PAkr/RG
	 0QyVKkZYbsSUw==
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
Subject: [PATCH v2 03/12] arm64: Fix EFI linking with -fdata-sections
Date: Tue, 17 Mar 2026 15:51:03 -0700
Message-ID: <a0dcf72b74fadc91ffa2e683c4cdb5e8e2993d44.1773787568.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773787568.git.jpoimboe@kernel.org>
References: <cover.1773787568.git.jpoimboe@kernel.org>
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

Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 2964aad0362e..f825e6a26918 100644
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


