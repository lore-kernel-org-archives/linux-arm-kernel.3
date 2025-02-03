Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C28C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 10:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqpNjfnw7iMi+gWoBv0avsygAJN2y4ykdULl/ADYxb8=; b=tGH2yADwiEZ9DXvMyNGKdJ7wyJ
	hD/YY0cse2Mbmy3WnewRDWyNDcPI519BOWyjzl40Q2/TK9uKNswm2MevixfqwTaT0JarjqAau6rHy
	srFiai1s3aEwO0V/V7kj/0OwWyb7dtJVsuO/YXM0JgVKg2RaCszoAmPiAVnJm3qemD7SJao6vw/Fp
	/3LqRteZIErSz0qmiHHKadrN64KVGNlu5mqs/LQHvGAosbpQgktRiB3gu5w33P6VEuOh+FLus7TaW
	0/mLIL5SAE4BwJ2H5z+HHuYVi7quIlAIJ+shezRpCiBq8qmHmlzqtXNkThO4icKCG5wGWcr74kg7i
	LGDvmkYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teu4u-0000000FAAl-0FPp;
	Mon, 03 Feb 2025 10:53:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tethD-0000000F7T3-1GVL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tqpNjfnw7iMi+gWoBv0avsygAJN2y4ykdULl/ADYxb8=; b=dIW2Kww47pVIM+wdmlgTiLv2fv
	Lfa3lnfVJqCH/T9s+MEJF8jXqxGGbAMEseUkEjKz0oVA6KN3wWZ4AgK276pXLJiMiXlP87lmcaEoa
	L7LP6ZLpqGK5PMN86LY4DKgmfIGSwUYxDzX3PzlisOCuXkrb2NZlDgz6VWEWtVvFKNruLIKhaQMep
	SoXRQ8tPfQuBCJAdiTswVtB08aNc09UoD/YlxoQB5FGix0ctsnapcY277a6kZE/i8jD0pHaujB6L+
	6K+xEdzVarNiMEt1PTRTuXeqMEJGqMhE26JjW/6QZARoTmVrSaC2WrimBWF3vysYzfLQaMXauqLra
	CnvX0VMw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tethA-0000000G3ut-1fG9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:28:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23BF31BB0;
	Mon,  3 Feb 2025 02:29:12 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E99793F63F;
	Mon,  3 Feb 2025 02:28:43 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Howells <dhowells@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH 5/8] mm: kpkeys: Introduce cred pkey/level
Date: Mon,  3 Feb 2025 10:28:06 +0000
Message-ID: <20250203102809.1223255-6-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250203102809.1223255-1-kevin.brodsky@arm.com>
References: <20250203102809.1223255-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102848_710029_19BB3D4C 
X-CRM114-Status: GOOD (  12.16  )
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

We will need a separate pkey to protect struct cred. Allocate one as
well as a new kpkeys level that grants write access to that pkey,
and add a guard that switches to that level.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/kpkeys.h | 4 ++++
 include/asm-generic/kpkeys.h    | 4 ++++
 include/linux/kpkeys.h          | 9 ++++++++-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kpkeys.h b/arch/arm64/include/asm/kpkeys.h
index ab2305ca24b7..f5797e579fb9 100644
--- a/arch/arm64/include/asm/kpkeys.h
+++ b/arch/arm64/include/asm/kpkeys.h
@@ -22,6 +22,10 @@ static inline u64 por_set_kpkeys_level(u64 por, int level)
 				 level == KPKEYS_LVL_PGTABLES ||
 				 level == KPKEYS_LVL_UNRESTRICTED
 				 ? POE_RW : POE_R);
+	por = por_set_pkey_perms(por, KPKEYS_PKEY_CRED,
+				 level == KPKEYS_LVL_CRED ||
+				 level == KPKEYS_LVL_UNRESTRICTED
+				 ? POE_RW : POE_R);
 
 	return por;
 }
diff --git a/include/asm-generic/kpkeys.h b/include/asm-generic/kpkeys.h
index cec92334a9f3..56a2fc9fe4a6 100644
--- a/include/asm-generic/kpkeys.h
+++ b/include/asm-generic/kpkeys.h
@@ -2,6 +2,10 @@
 #ifndef __ASM_GENERIC_KPKEYS_H
 #define __ASM_GENERIC_KPKEYS_H
 
+#ifndef KPKEYS_PKEY_CRED
+#define KPKEYS_PKEY_CRED	2
+#endif
+
 #ifndef KPKEYS_PKEY_PGTABLES
 #define KPKEYS_PKEY_PGTABLES	1
 #endif
diff --git a/include/linux/kpkeys.h b/include/linux/kpkeys.h
index c5d804c1ab7b..a478eaf2e14f 100644
--- a/include/linux/kpkeys.h
+++ b/include/linux/kpkeys.h
@@ -10,7 +10,8 @@ struct folio;
 
 #define KPKEYS_LVL_DEFAULT	0
 #define KPKEYS_LVL_PGTABLES	1
-#define KPKEYS_LVL_UNRESTRICTED	2
+#define KPKEYS_LVL_CRED		2
+#define KPKEYS_LVL_UNRESTRICTED	3
 
 #define KPKEYS_LVL_MIN		KPKEYS_LVL_DEFAULT
 #define KPKEYS_LVL_MAX		KPKEYS_LVL_UNRESTRICTED
@@ -160,4 +161,10 @@ KPKEYS_GUARD(kpkeys_rcu, KPKEYS_LVL_UNRESTRICTED)
 KPKEYS_GUARD_NOOP(kpkeys_rcu)
 #endif
 
+#ifdef CONFIG_KPKEYS_HARDENED_CRED
+KPKEYS_GUARD(kpkeys_hardened_cred, KPKEYS_LVL_CRED)
+#else
+KPKEYS_GUARD_NOOP(kpkeys_hardened_cred)
+#endif
+
 #endif /* _LINUX_KPKEYS_H */
-- 
2.47.0


