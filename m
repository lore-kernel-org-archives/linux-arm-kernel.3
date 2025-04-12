Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5C1C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 01:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWDHpUBhtTe2FgO8fryMDFRusp4rjFHy5/tTaSl+b7o=; b=x/4VMEEfIAKIHLkHdfT/5p2iuV
	GpCftWD3XlV1IaeR3lqlWG/IhwEEr4IP2y+/GbBup61A2BWjUQ+grHJUWbtDALg0dr9Og8AfV1UtP
	XTt+XW/ijsvzyjxBgu7SylgyV8Rxvz/O+dLiEvyQOAiej7ALk/3BVURAEMAQ8eJ5isHp4Oeiav8hG
	mAO4SQAEd/VVfl4fMTGbl/7cCx+m0AU8bY8aS6va+iRwmlUOvwEkO6ptTikFKucrcmlxZbpp6//J3
	cJVRyqhg6v7uwOV09t6S2RTm6fq5eSUzIJ7Wd+yp60azfGYaE+sMvDAM7mREz9czjxYxW3ElDLWpb
	juQ7VfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3PRP-0000000FEAE-3awU;
	Sat, 12 Apr 2025 01:13:51 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3PNx-0000000FDqj-1J7f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 01:10:18 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-224191d9228so30707725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 18:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744420216; x=1745025016; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bWDHpUBhtTe2FgO8fryMDFRusp4rjFHy5/tTaSl+b7o=;
        b=I2bSrzekmgOsakRc02JlSD32kAF0Kx6nYHgKg2e++F2FQVAAecJKdPmXu9DMGe3dO9
         bcVy+Mm38H0ASzSHRGuXoq36n0Wl1UN68XWBmNxqDpd8rV+fegJH2eLP4oOP4i/h/dBw
         wK2HkuFpIwMmfZ9ioxd/G0fJ8/61AgDe7whLq9d0RQ6BxMGeuQgWshTvj1WSuxt6tEjB
         G2TORCkTMXRmhDrBieCVWeqqLCb2iQu4/n1AQIl5JDXVNbaBOW3diDocqEYoqmXRTRM0
         eOA25DeHBpJknhShVH0H6QMUy/qgnt6EDrl6IOOW5ML0E6IYIt7cNPhosHiX02vvesJt
         s+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744420216; x=1745025016;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bWDHpUBhtTe2FgO8fryMDFRusp4rjFHy5/tTaSl+b7o=;
        b=TOs0lw7Fvf3wN7lySUa0eiX0hE4SUh+9ceA4L3s34EWF7rg2HcYgzQ1DW3Syam5JUv
         9VdBQVsTVivrUIcAXj7H1ELC3DBKTh8RhUNaVURXPUBWkJdxibE1BbPDYsa1xWk6Vgu9
         aFLew5a6HLkldzT03yzGDsehMb5vzfXTocCncbAbIWyYyUzdjXM7xQmuPBAWd6cx25Wr
         /OL/LPpugXQOmlZvV5sAQlsVoKY/SKu0x5j/XJNxHz2MizVhRNjKIrfFTe+79lKezMDR
         o75XUAuFCkZ06Tce+CslDl+AMbrZSg9qEoIuoCb4I+P9b0kQYJP0QOBM9woVdfaScEfz
         7Dzw==
X-Gm-Message-State: AOJu0YxfeUXotc4b4mpnc3Nf1YSYuvf5pdiCktDSGp7cxwwle0tgQBO4
	VV9K3THJoopyXI+AsFKUwZOVwIeM6llqOxGwQ757Kc7txfFvboIIgSwmgpxJikQOuRK6izVEsnz
	J9MDc11+dn7SSnnZnXal5Xg==
X-Google-Smtp-Source: AGHT+IHVLYuzqpZRTCktPu5rFIJT1KD3DgXm1NNnlt3I7puZQhJBEjVGAwIu34AVxzFmVqO3ENhw/4jf261UUYOPSg==
X-Received: from pltf12.prod.google.com ([2002:a17:902:74cc:b0:224:2ae9:b271])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1aa5:b0:223:377f:9795 with SMTP id d9443c01a7336-22bea3de1a8mr72996465ad.0.1744420216287;
 Fri, 11 Apr 2025 18:10:16 -0700 (PDT)
Date: Sat, 12 Apr 2025 01:09:38 +0000
In-Reply-To: <20250412010940.1686376-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250412010940.1686376-2-dylanbhatch@google.com>
Subject: [PATCH v2 1/2] arm64: patching: Rename aarch64_insn_copy to text_poke.
From: Dylan Hatch <dylanbhatch@google.com>
To: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_181017_352025_BEE24563 
X-CRM114-Status: GOOD (  14.82  )
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

Match the name and signature of the equivalent in the x86 text-poke API.
Making the src pointer const also allows this function to be
interchangeable with memcpy().

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/include/asm/text-patching.h |  2 +-
 arch/arm64/kernel/patching.c           | 12 ++++++------
 arch/arm64/net/bpf_jit_comp.c          |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/text-patching.h b/arch/arm64/include/asm/text-patching.h
index 587bdb91ab7a6..450d806d11109 100644
--- a/arch/arm64/include/asm/text-patching.h
+++ b/arch/arm64/include/asm/text-patching.h
@@ -9,7 +9,7 @@ int aarch64_insn_write(void *addr, u32 insn);
 
 int aarch64_insn_write_literal_u64(void *addr, u64 val);
 void *aarch64_insn_set(void *dst, u32 insn, size_t len);
-void *aarch64_insn_copy(void *dst, void *src, size_t len);
+void *text_poke(void *dst, const void *src, size_t len);
 
 int aarch64_insn_patch_text_nosync(void *addr, u32 insn);
 int aarch64_insn_patch_text(void *addrs[], u32 insns[], int cnt);
diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 1041bc67a3eee..e07dc32620053 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -102,9 +102,9 @@ noinstr int aarch64_insn_write_literal_u64(void *addr, u64 val)
 	return ret;
 }
 
-typedef void text_poke_f(void *dst, void *src, size_t patched, size_t len);
+typedef void text_poke_f(void *dst, const void *src, size_t patched, size_t len);
 
-static void *__text_poke(text_poke_f func, void *addr, void *src, size_t len)
+static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t len)
 {
 	unsigned long flags;
 	size_t patched = 0;
@@ -132,12 +132,12 @@ static void *__text_poke(text_poke_f func, void *addr, void *src, size_t len)
 	return addr;
 }
 
-static void text_poke_memcpy(void *dst, void *src, size_t patched, size_t len)
+static void text_poke_memcpy(void *dst, const void *src, size_t patched, size_t len)
 {
 	copy_to_kernel_nofault(dst, src + patched, len);
 }
 
-static void text_poke_memset(void *dst, void *src, size_t patched, size_t len)
+static void text_poke_memset(void *dst, const void *src, size_t patched, size_t len)
 {
 	u32 c = *(u32 *)src;
 
@@ -145,14 +145,14 @@ static void text_poke_memset(void *dst, void *src, size_t patched, size_t len)
 }
 
 /**
- * aarch64_insn_copy - Copy instructions into (an unused part of) RX memory
+ * text_poke - Copy instructions into (an unused part of) RX memory
  * @dst: address to modify
  * @src: source of the copy
  * @len: length to copy
  *
  * Useful for JITs to dump new code blocks into unused regions of RX memory.
  */
-noinstr void *aarch64_insn_copy(void *dst, void *src, size_t len)
+noinstr void *text_poke(void *dst, const void *src, size_t len)
 {
 	/* A64 instructions must be word aligned */
 	if ((uintptr_t)dst & 0x3)
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 70d7c89d3ac90..b5be90edff410 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -2047,7 +2047,7 @@ bool bpf_jit_supports_kfunc_call(void)
 
 void *bpf_arch_text_copy(void *dst, void *src, size_t len)
 {
-	if (!aarch64_insn_copy(dst, src, len))
+	if (!text_poke(dst, src, len))
 		return ERR_PTR(-EINVAL);
 	return dst;
 }
-- 
2.49.0.604.gff1f9ca942-goog


