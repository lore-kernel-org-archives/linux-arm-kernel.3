Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024D4CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbNa63ylOcOjNuTnGmvSwLMvWLi8dwarAKo8xXH6Ul8=; b=uVm5Hmhmp1PW1v42r1D0p6/LwI
	bM7gkCB3axsuUcrfAui/Hd6FLnALMfIxDJTlXIAf+pe5EeX5tF9T9PN75kV4BPc/og3oebMsHXZ6h
	GbfTJK+BUwUThoJWnLkISrgaXhhS4AHBk5vXffuRpy80vDK0YjZZvyrWO7H21tLrqw0JfrDpnjRCq
	1tB28yDJWn3sfJ55mGZszOpn/fUaKfoU7DzCewUnYzVE8Hoje0EelgFivoi8LYJn1w4qZemlshHqj
	KQYapdj/vhxF1R/KxZuC53mynU7vtFhRgP2zqp6eSSfPysvRPFWPLrmDkPQTu+4GA9K6FB65l92V6
	9pYHPIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mr-000000013kq-02MB;
	Wed, 13 May 2026 03:34:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mi-000000013eS-3yvR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B06960123;
	Wed, 13 May 2026 03:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8992C2BCC9;
	Wed, 13 May 2026 03:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643272;
	bh=LhHK0lCryH3GfUbhtNycvw/+YpO/Fwf9dWZJEbuG8Pg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jNxtfagASYgYVYf1umkw+kM2WaikjdPtSOls1zGgc03ZsJiT9PFu2l8y1CWdDS/r0
	 KcYXbYeQkvoNFIDyvxRqbSmKa5kaQDL2+94KzG1ZqzDTQ2iNFMDb3ytwVxz0fzTFbT
	 w9OtedfmjwJHTR2cDz+vJCJ9BJw+IY32/pHZvo+RqOZ2U9kFwHQl9gpSZRS8AQ7WXk
	 x+Y7Cf198wdLgHWYjrQnrpKCGy3dmLOnlYhEX1PSis/Cd1b0EWkOgtCrs5axbGf1LB
	 UJNEOIkwyzk6MMDhbieMpPa4BsUO8llqizoEIWXfZ02sNUxy/vU8uTb430nzBeENMh
	 jNVc0uQ70vviw==
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
Subject: [PATCH v3 03/21] arm64: Fix EFI linking with -fdata-sections
Date: Tue, 12 May 2026 20:33:37 -0700
Message-ID: <1e5281cfb9a7daec8283e46e2879be8ec468713c.1778642120.git.jpoimboe@kernel.org>
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

When building with -fdata-sections, the .init.bss section gets split up
into a bunch of .init.bss.<var> sections.  Make sure they get linked
into .init.data.

Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index e1ac876200a3d..1ad7e3dba460a 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -281,7 +281,7 @@ SECTIONS
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


