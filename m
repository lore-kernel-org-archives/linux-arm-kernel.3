Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99878C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w3HOSI3zFFAhuRrpbyp55rDjrlgveKVuwRkI45bt6pc=; b=Xsv58CunKR6L3tZ2HW1lmAb/Dy
	5Gv9UwZ5JASx51os5VtshprI39lgEoDoHRAzEwod6KEkUTyPniV0uEUe5PwZ1mo6iD7AYxFNfo8gX
	4p+SJ4N2XxDLmpH3CgJzS1Nf6ke7nCQ+C0R0FANMs8LUM3AyD2+ox8OfOv4peqFGJEKqOhJuC51Ir
	v5RHQJEVOpeUPspC4muHs/ARB3T6Rw0IUSwpTdtvORNhYKJ1qrUZ8cJzXdNZnK7pPbbqodww74a44
	p/8EHK2hC9wKDfH/l9u+zbs3O839doKmk5KDxvwhsEsrGIHeAs/EkiZW26LmxAQvpXvS6RUYgp34b
	huWl1BGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCigT-0000000GMNS-1nj0;
	Wed, 07 May 2025 17:35:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiGv-0000000GFyV-1OS7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 17:09:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EFE03A4DAE4;
	Wed,  7 May 2025 17:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689C9C4CEE9;
	Wed,  7 May 2025 17:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746637767;
	bh=LKN9UrZmkZDWKM6V8K9YPnMN6DJF323WVpBAQbD5AK8=;
	h=From:To:Cc:Subject:Date:From;
	b=mNHSRgAHSslqnTQD/UlvWhDv6WRD6vsEYR8EBO1DuzOZyzQKIEPYTNw+LIxWj7x67
	 Ld7tYgEk54SKHQGmrUWl96y5V9xwnLmHM3BJDUgEcl1cHiecC8fqlXb2PHQ3V8nWDm
	 c8MSRqKBQXpaNApyqgpmeGzsIj4/HuaY9aOVqA7/rvaYE7C+wfl+ug8My0Rc6osmkD
	 VV/3HY5LzTJvxVxX9D8wKrdXSHLnJxmQrAQzWGZPTMAgcHO8zK8gbBmHqCMM55ZTzq
	 LBGjhxLqdiuC/0sUcDSr2IPdwVRkCKBmvq2LWEXtaDWWS7/DwaM4m0rWkrn4GV+HcX
	 JFTlDXnzx2fXQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] crypto: arm64/sha256 - fix build when CONFIG_PREEMPT_VOLUNTARY=y
Date: Wed,  7 May 2025 10:09:01 -0700
Message-ID: <20250507170901.151548-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_100929_440524_05E2595E 
X-CRM114-Status: GOOD (  10.31  )
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

From: Eric Biggers <ebiggers@google.com>

Fix the build of sha256-ce.S when CONFIG_PREEMPT_VOLUNTARY=y by passing
the correct label to the cond_yield macro.  Also adjust the code to
execute only one branch instruction when CONFIG_PREEMPT_VOLUNTARY=n.

Fixes: 6e36be511d28 ("crypto: arm64/sha256 - implement library instead of shash")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505071811.yYpLUbav-lkp@intel.com/
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/crypto/sha256-ce.S | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/lib/crypto/sha256-ce.S b/arch/arm64/lib/crypto/sha256-ce.S
index a8461d6dad634..f3e21c6d87d2e 100644
--- a/arch/arm64/lib/crypto/sha256-ce.S
+++ b/arch/arm64/lib/crypto/sha256-ce.S
@@ -121,14 +121,15 @@ CPU_LE(	rev32		v19.16b, v19.16b	)
 
 	/* update state */
 	add		dgav.4s, dgav.4s, dg0v.4s
 	add		dgbv.4s, dgbv.4s, dg1v.4s
 
+	/* return early if voluntary preemption is needed */
+	cond_yield	1f, x5, x6
+
 	/* handled all input blocks? */
-	cbz		x2, 1f
-	cond_yield	3f, x5, x6
-	b		0b
+	cbnz		x2, 0b
 
 	/* store new state */
 1:	st1		{dgav.4s, dgbv.4s}, [x0]
 	mov		x0, x2
 	ret

base-commit: 20e9579f11b6cbdf0556d9cd85a0aa7653caf341
-- 
2.49.0


