Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4504AC55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuhrvZmLbWjXu0qJ6YVWB/ry73Tij4VZl1t95NSM/eA=; b=VWQGiDLw9eY2Fw9Z0xE+ztjIDT
	VS8InCB+si61nJYowE1IDoqZjkgFKbTzUAbGfEUHi8qFf0Wm2VcVg9FNjNZUdCr6y+aGNYLySGzT1
	qmyHG+knmt68QoCXvIbbYEgqzML3lMkQLozZosKW5aouYRgRUIGsoG3xzn91GrzrVliZ6xmgP+okq
	mxIWuEkgalFijbqwBEo6JKiKBZ91FYi1Z5QiteNvgW+Lk2/cPruDThYX4zPAmuGzrLgai+2PcPtPo
	iN+bNiTMjALzS6/4vxgRmGQ6ZwZjRwGUp5EWyWDriEZWAK7Y50gio4MEAzWfJoVxss5Qw8pEc1d3s
	0UMPQUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMnp-0000000DVPS-050k;
	Fri, 20 Feb 2026 09:28:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMnn-0000000DVOB-04vv;
	Fri, 20 Feb 2026 09:27:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C32C61843;
	Fri, 20 Feb 2026 09:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70999C4AF0D;
	Fri, 20 Feb 2026 09:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771579677;
	bh=FpYf/Yzczcf4tEFC1kjBsEmpa/YzVd1pXhcZ6yjPTiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B/pnUe2Csc8sf4nePbeD8HOLkbhporccdV2gXzpFBwFl8bIIkz59+hExV3Lf6wc7n
	 5jwRljJiVEzlgRuxSNCkmMB/S8QZ8E0o9cY2PN/tNv8tgW6MSxiRM02W732ECLr/hT
	 dx3Pm5WYwBSz0u2GEl5tTcIwZGZNO1nQxdjTsl3akqYfZYrYIi4Ifvn0epsmPF9NXJ
	 UNc13112JN8SQQx5pX6EYq+qDsEXtyURVXTESGlrSc8PJg5/JLTVqbl5W4yPab30xY
	 ZTbv+qSqn1z9a3CyfUKfbDvFsizqh7JH/CRHquLzJXI1+AIBqnpA4/IwRPSCkTdLWG
	 TRfVEQ1zmVeWA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org
Subject: [PATCH 1/3] vmlinux.lds.h: add _handle_arch_irq RUNTIME_CONST section
Date: Fri, 20 Feb 2026 17:09:20 +0800
Message-ID: <20260220090922.1506-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220090922.1506-1-jszhang@kernel.org>
References: <20260220090922.1506-1-jszhang@kernel.org>
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

We will use the runtime constant to optimize the handle_arch_irq
accessing. This is preparation patch.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 include/asm-generic/vmlinux.lds.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index eeb070f330bd..c4af2c7d0eed 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -973,7 +973,8 @@
 		RUNTIME_CONST(shift, d_hash_shift)			\
 		RUNTIME_CONST(ptr, dentry_hashtable)			\
 		RUNTIME_CONST(ptr, __dentry_cache)			\
-		RUNTIME_CONST(ptr, __names_cache)
+		RUNTIME_CONST(ptr, __names_cache)			\
+		RUNTIME_CONST(ptr, _handle_arch_irq)
 
 /* Alignment must be consistent with (kunit_suite *) in include/kunit/test.h */
 #define KUNIT_TABLE()							\
-- 
2.51.0


