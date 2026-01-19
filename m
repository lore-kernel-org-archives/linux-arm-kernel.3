Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12B8D29C26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7ig3Va+cgJWyxLk2AjzSNcEnc0SV+kvjb8+9+gGOlY=; b=xMRbbQplywBY746DKtAejs4YHw
	RNHtNPxx8UEyQ7bMj0yKQWgqdiNBNTJHtqw719No03Ku8mSoDZNpTVkWIXu895vqj0TZ7+VuxR9CW
	xuTarcLK2SiphLpKmlGAWFVpPinvXGAm+5n+2uh4lQrLcTDI9+CV3TU/xVAnzgCR9eU0YOkh+Ae2t
	t6paloiPXDs//fDeAxFnZjfYXqey4ztoE8c1hnXiRZFhQVz7ZNcCfKLqr2Znwsn6112y3E/Racqi6
	ja27c6IyCE2/siwhn88vh+p4RuOirRvfmE+b7LjuQHETt4hmH37IXKXVugz+OmEkrGZ0sxqycgRYe
	p9bmElOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhotK-000000027WG-0i4i;
	Mon, 19 Jan 2026 13:01:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhot4-000000027Qd-1rLd;
	Mon, 19 Jan 2026 13:01:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 431E11517;
	Mon, 19 Jan 2026 05:01:35 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74ECD3F740;
	Mon, 19 Jan 2026 05:01:38 -0800 (PST)
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
	Jeremy Linton <jeremy.linton@arm.com>,
	David Laight <david.laight.linux@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v4 2/3] prandom: Add __always_inline version of prandom_u32_state()
Date: Mon, 19 Jan 2026 13:01:09 +0000
Message-ID: <20260119130122.1283821-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119130122.1283821-1-ryan.roberts@arm.com>
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_050146_820116_00F7437C 
X-CRM114-Status: GOOD (  10.95  )
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
context. So let's implement prandom_u32_state() as an out-of-line
wrapper around a new __always_inline prandom_u32_state_inline(). kstack
offset randomization will use this new version.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/prandom.h | 20 ++++++++++++++++++++
 lib/random32.c          |  8 +-------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/include/linux/prandom.h b/include/linux/prandom.h
index ff7dcc3fa105..801188680a29 100644
--- a/include/linux/prandom.h
+++ b/include/linux/prandom.h
@@ -17,6 +17,26 @@ struct rnd_state {
 	__u32 s1, s2, s3, s4;
 };
 
+/**
+ * prandom_u32_state_inline - seeded pseudo-random number generator.
+ * @state: pointer to state structure holding seeded state.
+ *
+ * This is used for pseudo-randomness with no outside seeding.
+ * For more random results, use get_random_u32().
+ * For use only where the out-of-line version, prandom_u32_state(), cannot be
+ * used (e.g. noinstr code).
+ */
+static __always_inline u32 prandom_u32_state_inline(struct rnd_state *state)
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
 u32 prandom_u32_state(struct rnd_state *state);
 void prandom_bytes_state(struct rnd_state *state, void *buf, size_t nbytes);
 void prandom_seed_full_state(struct rnd_state __percpu *pcpu_state);
diff --git a/lib/random32.c b/lib/random32.c
index 24e7acd9343f..2a02d82e91bc 100644
--- a/lib/random32.c
+++ b/lib/random32.c
@@ -51,13 +51,7 @@
  */
 u32 prandom_u32_state(struct rnd_state *state)
 {
-#define TAUSWORTHE(s, a, b, c, d) ((s & c) << d) ^ (((s << a) ^ s) >> b)
-	state->s1 = TAUSWORTHE(state->s1,  6U, 13U, 4294967294U, 18U);
-	state->s2 = TAUSWORTHE(state->s2,  2U, 27U, 4294967288U,  2U);
-	state->s3 = TAUSWORTHE(state->s3, 13U, 21U, 4294967280U,  7U);
-	state->s4 = TAUSWORTHE(state->s4,  3U, 12U, 4294967168U, 13U);
-
-	return (state->s1 ^ state->s2 ^ state->s3 ^ state->s4);
+	return prandom_u32_state_inline(state);
 }
 EXPORT_SYMBOL(prandom_u32_state);
 
-- 
2.43.0


