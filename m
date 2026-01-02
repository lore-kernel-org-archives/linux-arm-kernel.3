Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E565FA3742
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 13:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWto1Q0kowHhw4FoeBdAHUQM9hEeAI3jz0BnUWumgVU=; b=Gp2yRYeUk0WggNEu2qopZVCMko
	rbMCCz5tU2IQUAMzPYF5LyPiHptK4EiIF5G7hBgNZ6DhD/XfHMGG8Z2aFliUv03eXNV/YjptRFPTO
	SAlO4O8ZVRdzKntTI7at/FzEtIAnKfjhHzobUGnJaAxjzXuRtg8rdlIhJg/6Em+vlXro8/AAaI0MJ
	6540YX0fao/oZ0VBEpoUAEc5CuwZ7hNd1qJtryD2rsmIKQOIyJ+sumy4OwVKNu2uMTVCRKWZSqz2n
	jeKd2pmBHzOokyXqTLuP7E0h7uH6KPTEJWQ+A4aj8silfxUiFUeDVLaQd6+GrLcNvLNXZbkdOAhGS
	swo69m6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbex1-00000008GfK-3zFu;
	Fri, 02 Jan 2026 13:12:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbewy-00000008GdC-2Sx9;
	Fri, 02 Jan 2026 13:12:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95E961515;
	Fri,  2 Jan 2026 05:12:08 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CF7F3F5A1;
	Fri,  2 Jan 2026 05:12:11 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mark Rutland <mark.rutland@arm.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to __always_inline
Date: Fri,  2 Jan 2026 13:11:53 +0000
Message-ID: <20260102131156.3265118-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102131156.3265118-1-ryan.roberts@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_051216_822260_59D0A972 
X-CRM114-Status: GOOD (  12.55  )
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

We will shortly use prandom_u32_state() to implement kstack offset
randomization and some arches need to call it from non-instrumentable
context. Given the function is just a handful of operations and doesn't
call out to any other functions, let's take the easy path and make it
__always_inline.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/prandom.h | 19 ++++++++++++++++++-
 lib/random32.c          | 19 -------------------
 2 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/include/linux/prandom.h b/include/linux/prandom.h
index ff7dcc3fa105..e797b3709f5c 100644
--- a/include/linux/prandom.h
+++ b/include/linux/prandom.h
@@ -17,7 +17,24 @@ struct rnd_state {
 	__u32 s1, s2, s3, s4;
 };
 
-u32 prandom_u32_state(struct rnd_state *state);
+/**
+ * prandom_u32_state - seeded pseudo-random number generator.
+ * @state: pointer to state structure holding seeded state.
+ *
+ * This is used for pseudo-randomness with no outside seeding.
+ * For more random results, use get_random_u32().
+ */
+static __always_inline u32 prandom_u32_state(struct rnd_state *state)
+{
+#define TAUSWORTHE(s, a, b, c, d) ((s & c) << d) ^ (((s << a) ^ s) >> b)
+	state->s1 = TAUSWORTHE(state->s1,  6U, 13U, 4294967294U, 18U);
+	state->s2 = TAUSWORTHE(state->s2,  2U, 27U, 4294967288U,  2U);
+	state->s3 = TAUSWORTHE(state->s3, 13U, 21U, 4294967280U,  7U);
+	state->s4 = TAUSWORTHE(state->s4,  3U, 12U, 4294967168U, 13U);
+
+	return (state->s1 ^ state->s2 ^ state->s3 ^ state->s4);
+}
+
 void prandom_bytes_state(struct rnd_state *state, void *buf, size_t nbytes);
 void prandom_seed_full_state(struct rnd_state __percpu *pcpu_state);
 
diff --git a/lib/random32.c b/lib/random32.c
index 24e7acd9343f..d57baf489d4a 100644
--- a/lib/random32.c
+++ b/lib/random32.c
@@ -42,25 +42,6 @@
 #include <linux/slab.h>
 #include <linux/unaligned.h>
 
-/**
- *	prandom_u32_state - seeded pseudo-random number generator.
- *	@state: pointer to state structure holding seeded state.
- *
- *	This is used for pseudo-randomness with no outside seeding.
- *	For more random results, use get_random_u32().
- */
-u32 prandom_u32_state(struct rnd_state *state)
-{
-#define TAUSWORTHE(s, a, b, c, d) ((s & c) << d) ^ (((s << a) ^ s) >> b)
-	state->s1 = TAUSWORTHE(state->s1,  6U, 13U, 4294967294U, 18U);
-	state->s2 = TAUSWORTHE(state->s2,  2U, 27U, 4294967288U,  2U);
-	state->s3 = TAUSWORTHE(state->s3, 13U, 21U, 4294967280U,  7U);
-	state->s4 = TAUSWORTHE(state->s4,  3U, 12U, 4294967168U, 13U);
-
-	return (state->s1 ^ state->s2 ^ state->s3 ^ state->s4);
-}
-EXPORT_SYMBOL(prandom_u32_state);
-
 /**
  *	prandom_bytes_state - get the requested number of pseudo-random bytes
  *
-- 
2.43.0


