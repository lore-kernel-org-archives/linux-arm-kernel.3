Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F728CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzVFhaCJ4tPvEzjzVh2/FLJsOENJe5tM82eV69ICp3w=; b=JMwOQNU7yuHJGjbeS4qCC0ruZi
	XKhW4WspZqEDWXdxZglIA5JHzES3KipOjQj1WtrcslYeaE6RwN+/vXINoli6R0u5Fdlp4x7CCsQNj
	tMhEAfuk/p+nc3h7TJrGCtV+e1Rp2li2N0CKtMpKnv4tZoJCNLtXjtJt3FQ9NQ8ECbWRTR0reBk/S
	XzvcifTv85tbFK7mFL4HmbI+jITyc1LmbpvufDbnMJgtoSgqrd4SatU/9sJ1Rk4lkINKaWYqNrVVl
	lWfx6ltWR8yp0swub9MTKTrSV2uxLjuWsf4cXAobe9dBuTA/u27IH69j54hZu28LHD2zzx2kSPgVm
	Ohpc1gAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYDQ-0000000GHgg-1n4g;
	Thu, 27 Nov 2025 09:23:04 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYDK-0000000GHbZ-398b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:23:00 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-429c5da68e5so499999f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 01:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764235377; x=1764840177; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wzVFhaCJ4tPvEzjzVh2/FLJsOENJe5tM82eV69ICp3w=;
        b=e4c7Ng65fg4kVvn1YBvBFdtiXPkIToeRJH5GrOc+dhkSs7dxekgAGS5Wh3pjaQ3hAz
         9craiypUAHt0JV493R50w65kYg+4oEO/xoX9zvEjnVCEdd1tiiyEB/z55AyOWTDTpi+h
         nH5qKPP9sJBlKeZJrzRUYiZTLj7z7XpR3AAeth/U2bhM7+iFDLg+e7+xODSycdhoGJjs
         FAIYvAZNpMG/Sl+xIV46ziwHvAr0iKY09H3MFJ/2uyf01Gs8IwO1fJ5LuWVi/Gap+BYt
         KSPfJo/SBoQW4CVFH6xRop/oJenjdLi/RedLv4XprlztuseMVPsbf1FJmbd+qUYJOsWf
         OlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764235377; x=1764840177;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wzVFhaCJ4tPvEzjzVh2/FLJsOENJe5tM82eV69ICp3w=;
        b=nVTgM5Qdck1H86FOt5RCmnn3Hr8E4k+7xDQwD94r9H1wgeNsWyz3lLBSgbN7ZBUQeW
         9ryjQTBLSx08HSoT4bq8lb9RpW2f36HEuiWd3BUliB31cnVQ1MZgJbKhFLAvrM8xpRpR
         rwLBUOYdzTwAqWwyXBtlQGiTPXE5tXqXDSSQhBkO/bmuCrm3I7hwIXdLTHFTE6zOxd75
         FxC4zlSo66iTl8z1vniD1OFZmgWBBerXxpvhJQIkyx/728uoJvjr/JNm9815sN47THwD
         wgf4XWRzkKsqs4YxPLD/cLHTbFlYCZ/ZxWRNGq4HzIolFZqSt6KTU34+RSqnwobiObI8
         PAqA==
X-Gm-Message-State: AOJu0YwiRmkgFssjXJfkCm5t/Vlm3HJlqAfwqdgWFTmXpjpsor4Ga2J7
	zXtIv2YzLZojCBIyXlgZo//Qw24czieacbF4KKOciDef0jixpv+qD6fjoCzWhKZK81Y0WoyLzg=
	=
X-Google-Smtp-Source: AGHT+IGd+iJrVyefWu9xcpdYdKEXoxro/lG9n2ewRU/WJbCL+3bUle2bLSXZHjm1+EN52LuTQiG20BfQ
X-Received: from wrqr7.prod.google.com ([2002:a5d:4987:0:b0:42b:b28a:6746])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4010:b0:42b:3dbe:3a37
 with SMTP id ffacd0b85a97d-42cc1302285mr26345067f8f.10.1764235376919; Thu, 27
 Nov 2025 01:22:56 -0800 (PST)
Date: Thu, 27 Nov 2025 10:22:31 +0100
In-Reply-To: <20251127092226.1439196-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20251127092226.1439196-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4605; i=ardb@kernel.org;
 h=from:subject; bh=2kdRtRT+6jrXGVJpTsN6JRllZWlsEfiMzJMbIKIwLig=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIVNDItKrV2/nxk2T1FL2Pt6aq6pVO+2PRuinE8KPNTo6a
 3nj3j3uKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPp8mFkuDohVFskVsdiR1zu
 wmdCi5KUPl1VU7Fe/dFZccnmV/sc3jEynJLJaUjTW3hYn2F3RubPpNRt29cIn9B6cfPQJ+dKTzk BPgA=
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251127092226.1439196-12-ardb+git@google.com>
Subject: [RFC/RFT PATCH 4/6] random: Use a lockless fast path for get_random_uXX()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-hardening@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>, 
	Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_012258_825273_316F6B65 
X-CRM114-Status: GOOD (  19.21  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Currently, the implementations of the get_random_uXX() API protect their
critical section with a local lock and disabling interrupts, to ensure
that the code does not race with itself when called from interrupt
context.

Given that the fast path does nothing more than read a single uXX
quantity from a linear buffer and bump the position pointer, poking the
hardware registers to disable and re-enable interrupts is
disproportionately costly, and best avoided.

There are two conditions under which the batched entropy buffer is
replenished, which is what forms the critical section:
- the buffer is exhausted
- the base_crng generation counter has incremented.

By combining the position and generation counters into a single u64, we
can use compare and exchange to implement the fast path without taking
the local lock or disabling interrupts. By constructing the expected and
next values carefully, the compare and exchange will only succeed if
- we did not race with ourselves, i.e., the compare and exchange
  increments the position counter by exactly 1;
- the buffer is not exhausted
- the generation counter equals the base_crng generation counter.

Only if the compare and exchange fails is the original slow path taken,
and only in that case do we take the local lock. This results in a
considerable speedup (3-5x) when benchmarking get_random_u8() in a tight
loop.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/char/random.c | 44 ++++++++++++++------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 0e04bc60d034..71bd74871540 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -496,6 +496,12 @@ static ssize_t get_random_bytes_user(struct iov_iter *iter)
  * should be called and return 0 at least once at any point prior.
  */
 
+#ifdef __LITTLE_ENDIAN
+#define LOHI(lo, hi)	lo, hi
+#else
+#define LOHI(lo, hi)	hi, lo
+#endif
+
 #define DEFINE_BATCHED_ENTROPY(type)						\
 struct batch_ ##type {								\
 	/*									\
@@ -507,8 +513,12 @@ struct batch_ ##type {								\
 	 */									\
 	type entropy[CHACHA_BLOCK_SIZE * 3 / (2 * sizeof(type))];		\
 	local_lock_t lock;							\
-	unsigned int generation;						\
-	unsigned int position;							\
+	union {									\
+		struct {							\
+			unsigned int LOHI(position, generation);		\
+		};								\
+		u64 posgen;							\
+	};									\
 };										\
 										\
 static DEFINE_PER_CPU(struct batch_ ##type, batched_entropy_ ##type) = {	\
@@ -522,6 +532,7 @@ type get_random_ ##type(void)							\
 	unsigned long flags;							\
 	struct batch_ ##type *batch;						\
 	unsigned int next_gen;							\
+	u64 next;								\
 										\
 	warn_unseeded_randomness();						\
 										\
@@ -530,21 +541,28 @@ type get_random_ ##type(void)							\
 		return ret;							\
 	}									\
 										\
-	local_lock_irqsave(&batched_entropy_ ##type.lock, flags);		\
-	batch = raw_cpu_ptr(&batched_entropy_##type);				\
+	batch = &get_cpu_var(batched_entropy_##type);				\
 										\
 	next_gen = (unsigned int)READ_ONCE(base_crng.generation);		\
-	if (batch->position >= ARRAY_SIZE(batch->entropy) ||			\
-	    next_gen != batch->generation) {					\
-		_get_random_bytes(batch->entropy, sizeof(batch->entropy));	\
-		batch->position = 0;						\
-		batch->generation = next_gen;					\
+	next = (u64)next_gen << 32;						\
+	if (likely(batch->position < ARRAY_SIZE(batch->entropy))) {		\
+		next |=	batch->position + 1; /* next-1 is bogus otherwise */	\
+		ret = batch->entropy[batch->position];				\
+	}									\
+	if (cmpxchg64_local(&batch->posgen, next, next - 1) != next - 1) {	\
+		local_lock_irqsave(&batched_entropy_ ##type.lock, flags);	\
+		if (batch->position >= ARRAY_SIZE(batch->entropy) ||		\
+		    next_gen != batch->generation) {				\
+			_get_random_bytes(batch->entropy, sizeof(batch->entropy));\
+			batch->position = 0;					\
+			batch->generation = next_gen;				\
+		}								\
+		ret = batch->entropy[batch->position++];			\
+		local_unlock_irqrestore(&batched_entropy_ ##type.lock, flags);	\
 	}									\
 										\
-	ret = batch->entropy[batch->position];					\
-	batch->entropy[batch->position] = 0;					\
-	++batch->position;							\
-	local_unlock_irqrestore(&batched_entropy_ ##type.lock, flags);		\
+	batch->entropy[batch->position - 1] = 0;				\
+	put_cpu_var(batched_entropy_##type);					\
 	return ret;								\
 }										\
 EXPORT_SYMBOL(get_random_ ##type);
-- 
2.52.0.107.ga0afd4fd5b-goog


