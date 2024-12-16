Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA5AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+X6YFpq2hPlq2zytbOuG7IndNMje9dbLylp0yNgLumw=; b=JXFY5MxGeieQo5I7AJK714qew2
	PmBhkEdUeyKfbTrCJeNZ1lsflSwtv+in39Rcw2ig00fLyOnrkIf1xqOB+/BmJacQIpQJHWP9x4DMr
	wKyoEAA4AQdnAGN0hPj6KDX/DcZEoqsXD6e3j8P7taPdj3pPR+ATlzInedvktw5jWnMuCbc8w0/dC
	lqOmL/qzvJ2+LF1Hivd5MxBqxQOb3PMYH2GXd5+u1Yl2f/YNN6n+fBrMlPxp7n55PrXgSZKhqE7RA
	YQu+XU3PtvFDQ9+OWebypAuobslKMX8G2PvnQuviX8sn2Zr5p9w8LkoXV7e6k39fR2j6jwa86ItOl
	kxTmdR0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDCK-0000000AQyI-3V5t;
	Mon, 16 Dec 2024 15:39:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBoU-0000000ABbp-31mD;
	Mon, 16 Dec 2024 14:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+X6YFpq2hPlq2zytbOuG7IndNMje9dbLylp0yNgLumw=; b=lof5eg78FPeaNwj84ooBQXKPd+
	iCrgrorZhuW+Mwl5g+pMm/pxvkp9w8Vgd1JQNM2dl+hMjhSQQY2D1/Xw3YXCY2x6aNEyYjQ58EvR2
	ZEYGFxVHC2nineEB/8E+DneRl77bZpiIrvjjub41szjwON0GHGFagDXNh9Hmx5v/7lZvytEyDTrw7
	AhafmbtmktItisJxEc0fsIVxQVLQsZpTwn0LAb9KRubZDzEuWnBSUZfFWPq+F8h98VMw5wAOWtVX8
	Bm2IFLbq1WdPTYenHGhyOlS/W9A2c3rpVEbo3+hatIYYsp8jsBkSjS7gfZApnvGVM91s4TJwViSBg
	IYFx6eeg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBoO-00000004qzG-2J3A;
	Mon, 16 Dec 2024 14:11:09 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734358261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+X6YFpq2hPlq2zytbOuG7IndNMje9dbLylp0yNgLumw=;
	b=AvGSP8Vwrugo0+sWSRdWIdUjMGMPGixEOFXnsGNm/2ObSCVT55Cm1k1FdxbwBtifNhgzuP
	HBJ9Z7HkFYPxx6SBg9qhdauOdENrM+UtUSopJiHKxdZ+8CM+XqHupZWYjiDXpc/mNQLhTx
	6wa5t5NmBQDGVBbQ4FDNh3O25nt3kt3+sXSycD25Leek54u2kY9QiOzxlbwD4wgRtjqJuz
	yCMK9EbDEXlMcdPanMLn6fF8/EuqVqxgAtGSG+03QOs9tKXGfcbY3lFzWKkrMH1orQQSXc
	Tpcn6HCIp9o984qMnjoLz69jxRDRZ8NoubqU2QRmd6u1TQYrzqXhKIbPegUe3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734358261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+X6YFpq2hPlq2zytbOuG7IndNMje9dbLylp0yNgLumw=;
	b=TokoK/DRb6/6eK4cCLk9S0VuypXKh5WoL2LK69A1xhz0H9QuClCz46TdGdEBAeJ1I0aX7i
	RCot+PJD2JpkKPCQ==
Date: Mon, 16 Dec 2024 15:10:11 +0100
Subject: [PATCH 15/17] vdso: Remove remnants of architecture-specific
 random state storage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-vdso-store-rng-v1-15-f7aed1bdb3b2@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
In-Reply-To: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734358247; l=4459;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MvA1FZBKdQc7iqER+HGfETL8kJGgorbHDXmM2tDCu+A=;
 b=Zr3xRYbCcw/UO3x7DwLfDqF5D1DrgaT+ruGfbEEhYCjU6h/tg+VN3P/RMcP7buU5FAN5votq8
 97qrRNVioYMC0E20AHyDs0dMoBu1Wvr3yEaegeIwSyuNNXT/YyznjG7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_141104_869805_C1EA3B24 
X-CRM114-Status: GOOD (  14.79  )
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

All users of the random vDSO are using the generic storage
implementation. Remove the now unnecessary compatibility accessor
functions and symbols.

Co-developed-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/char/random.c   | 6 +++---
 include/vdso/datapage.h | 8 --------
 lib/vdso/getrandom.c    | 4 ++--
 3 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 23ee76bbb4aa728274bf9980a60b863216d88797..84efda7bede348401db2ed1c443e5ab2bc5dbd2b 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -278,7 +278,7 @@ static void crng_reseed(struct work_struct *work)
 	WRITE_ONCE(base_crng.generation, next_gen);
 #ifdef CONFIG_VDSO_GETRANDOM
 	/* base_crng.generation's invalid value is ULONG_MAX, while
-	 * _vdso_rng_data.generation's invalid value is 0, so add one to the
+	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
 	 * former to arrive at the latter. Use smp_store_release so that this
 	 * is ordered with the write above to base_crng.generation. Pairs with
 	 * the smp_rmb() before the syscall in the vDSO code.
@@ -290,7 +290,7 @@ static void crng_reseed(struct work_struct *work)
 	 * because the vDSO side only checks whether the value changed, without
 	 * actually using or interpreting the value.
 	 */
-	smp_store_release((unsigned long *)&__arch_get_k_vdso_rng_data()->generation, next_gen + 1);
+	smp_store_release((unsigned long *)&vdso_k_rng_data->generation, next_gen + 1);
 #endif
 	if (!static_branch_likely(&crng_is_ready))
 		crng_init = CRNG_READY;
@@ -743,7 +743,7 @@ static void __cold _credit_init_bits(size_t bits)
 			queue_work(system_unbound_wq, &set_ready);
 		atomic_notifier_call_chain(&random_ready_notifier, 0, NULL);
 #ifdef CONFIG_VDSO_GETRANDOM
-		WRITE_ONCE(__arch_get_k_vdso_rng_data()->is_ready, true);
+		WRITE_ONCE(vdso_k_rng_data->is_ready, true);
 #endif
 		wake_up_interruptible(&crng_init_wait);
 		kill_fasync(&fasync, SIGIO, POLL_IN);
diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index b3227f1cf62895aa60ce0ca96afa42259f4771f9..0fc240c08e0f7cf596135eed18dd6f06011917d5 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -152,7 +152,6 @@ struct vdso_rng_data {
 #ifndef CONFIG_GENERIC_VDSO_DATA_STORE
 extern struct vdso_time_data _vdso_data[CS_BASES] __attribute__((visibility("hidden")));
 extern struct vdso_time_data _timens_data[CS_BASES] __attribute__((visibility("hidden")));
-extern struct vdso_rng_data _vdso_rng_data __attribute__((visibility("hidden")));
 #else
 extern const struct vdso_time_data vdso_u_time_data[CS_BASES] __attribute__((visibility("hidden")));
 extern const struct vdso_time_data vdso_u_timens_data[CS_BASES] __attribute__((visibility("hidden")));
@@ -211,13 +210,6 @@ static __always_inline const struct vdso_rng_data *__arch_get_vdso_u_rng_data(vo
 {
 	return &vdso_u_rng_data;
 }
-#define __arch_get_vdso_rng_data __arch_get_vdso_u_rng_data
-
-static __always_inline struct vdso_rng_data *__arch_get_vdso_k_rng_data(void)
-{
-	return vdso_k_rng_data;
-}
-#define __arch_get_k_vdso_rng_data __arch_get_vdso_k_rng_data
 #endif /* CONFIG_VDSO_GETRANDOM */
 
 #endif /* CONFIG_GENERIC_VDSO_DATA_STORE */
diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 938ca539aaa64bc46280ef6dd17aa661126699eb..2ed019a76abca099de33326ef45101cf50f2f778 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -152,7 +152,7 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
 
 		/*
 		 * Prevent the syscall from being reordered wrt current_generation. Pairs with the
-		 * smp_store_release(&_vdso_rng_data.generation) in random.c.
+		 * smp_store_release(&vdso_k_rng_data.generation) in random.c.
 		 */
 		smp_rmb();
 
@@ -256,5 +256,5 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
 static __always_inline ssize_t
 __cvdso_getrandom(void *buffer, size_t len, unsigned int flags, void *opaque_state, size_t opaque_len)
 {
-	return __cvdso_getrandom_data(__arch_get_vdso_rng_data(), buffer, len, flags, opaque_state, opaque_len);
+	return __cvdso_getrandom_data(__arch_get_vdso_u_rng_data(), buffer, len, flags, opaque_state, opaque_len);
 }

-- 
2.47.1


