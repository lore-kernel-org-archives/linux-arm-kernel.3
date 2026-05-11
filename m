Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5B0CD484E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 20:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j2a0GzlUre0cQo5MmedKBieEh3coSeRT2BQuTVbwA6E=; b=nRu5i+wi7Tjm8nzscy4pbKYLsz
	x65f+wOk3PNWUnKvkOPDDuUh1BmsVIBgHVYcDlRv7hWdX3w5G7wqvGDgpMiDSMmPenmYaUu4DXaw2
	fFc3Q6Kf71YwdBllDqASDZQPGOBIZu/VD1i4xj90fbcSK9l1n440jZ8L/GaghVHWYwy4NAwO0F2pK
	Q4OpAc5XETI7SMtkIbhOBfnfBcfkR7r1QfKluOHchTIAQJScuEbCKn0VKxA9jEq1HplSxb4cGDT9E
	K7eZ1Xa1bvPSYuGCDHVI2nex0lz92emZbunBzxMxKaO35Mvx9kv45czJtmIQ+tjz4aP7djosaMswR
	lKZaWfCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMX5L-0000000Egll-0IlY;
	Mon, 11 May 2026 20:18:39 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMX4l-0000000EgjU-0tQo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 20:18:37 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48e5eecd0aaso26701625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 13:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778530680; x=1779135480; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j2a0GzlUre0cQo5MmedKBieEh3coSeRT2BQuTVbwA6E=;
        b=I8nbeHhPgbrfpf0EUJs6TpWf3/H5B/81DNGtYKf+8R/h2wfR8c9VZQAwEcMRz8x5lf
         YgWtKUDCVC1KVFcjLAuAgg3vEyY4Tz/fHZQ4EcHf7MFY5qbcoA2KlU5jeniabvhUAQ01
         KsbT14fogj9PqmRu4rpDsOM2ecVfanIwKmtuJlUWBJdGrBLCXFY+0hl18RgZppme/ucU
         mRJTrXXUln5oT8y9xukKSAZBv/kpHkSTg6HulxUtRYUY/sBLBYkP1c2yLgkOaprQKo0Q
         hEgNdtcPNAGOx/ewl7RisB3BHaPkWwLREHdvMWYkOAa0+nTJyw1jYASw+0YNqSSz2uL4
         BNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530680; x=1779135480;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2a0GzlUre0cQo5MmedKBieEh3coSeRT2BQuTVbwA6E=;
        b=oS8bcGJKhb6NMPdoO0ApkB9gg2et8uVvBcm6HFOM8g6S+xJ1C70Hs0SsJrUcX/0Rgq
         DkVPmUGNyH9j65zwmyaBLoqJ9sVfClGI62oMAI6v7tbhfCTcSxazAmfdzi/JOeIU6DHk
         Ug2il/KJYYaAAcB0p+dDTv66bG5Z7pC/q4S+jHBcDnI0leKg9x8Mok9WUlVvF2M3GnxB
         cuBlNmYSU7pCH4CFSzzx107aRtoCkuGQXByByHpPqFFoUx0tKaV1qaybFUqQRrkjytZa
         vZ5SYXmtu8YpA10Y7bUNy1dnaup7chvxZk1TxplJ5QjJmINJthFu2tJQOJFZp8uueI7Y
         5TpQ==
X-Forwarded-Encrypted: i=1; AFNElJ83imObTE8moUoPsYT0i4v9KrMU2Hwgbvq9ZNNt1lSexvIFRPbfwW18ZifwNY/64SQVOY4Cga77FtNqBcA0CPNm@lists.infradead.org
X-Gm-Message-State: AOJu0YwlnoHF4zECVx9bNsLRDP0grDE6XdHU/ubdmSpqrD9z1CqkfTjC
	ingY8pgAUDFeJPsv7QJtp5yzIpKAcLP4uZDtMVswQGiFlKeZp4+BurVpUiqFb3Zva92qJDYc8Ap
	20w==
X-Received: from wmco8.prod.google.com ([2002:a05:600c:a308:b0:485:4f4a:bd84])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d19:b0:48e:5990:9698
 with SMTP id 5b1f17b1804b1-48e8fe84846mr707415e9.24.1778530680153; Mon, 11
 May 2026 13:18:00 -0700 (PDT)
Date: Mon, 11 May 2026 22:16:59 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260511201711.3249121-2-elver@google.com>
Subject: [PATCH] arm64: Implement _THIS_IP_ using inline asm
From: Marco Elver <elver@google.com>
To: elver@google.com, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Thomas Huth <thuth@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_131803_260938_0CF4DA79 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

Both GCC [1] and Clang [2] consider the generic version of _THIS_IP_ to
be broken:

	#define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })

In particular, the address of a label is only expected to be used with a
computed goto.

While the generic version more or less works today, it is known to be
brittle and may break with current and future optimizations. For
example, Clang -O2 always returns 1 when this function is inlined:

	static inline unsigned long get_ip(void)
	{ return ({ __label__ __here; __here: (unsigned long)&&__here; }); }

Fix it by overriding _THIS_IP_ in <asm/linkage.h> (which is included by
<linux/instruction_pointer.h>) using an architecture-specific inline asm
version. Additionally, avoiding taking the address of a label prevents
compilers from emitting spurious indirect branch targets (e.g.  ENDBR or
BTI) under control-flow integrity schemes.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
Link: https://github.com/llvm/llvm-project/issues/138272 [2]
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/arm64/include/asm/linkage.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/linkage.h
index 40bd17add539..73eabc82a6bb 100644
--- a/arch/arm64/include/asm/linkage.h
+++ b/arch/arm64/include/asm/linkage.h
@@ -43,4 +43,6 @@
 	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
 	bti c ;
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("adr %0, ." : "=r" (__ip)); __ip; })
+
 #endif
-- 
2.54.0.563.g4f69b47b94-goog


