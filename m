Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D91CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 17:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QNIlTnHi+YxWylz7AkakSHgtCnUqszk6I0tbLDOt9L4=; b=3SSCHzHYbXe07gbIXpNhsuuVM8
	oblZsemFgj9PoJlIkWlcS0+l1lK31bMELuGj6s6joTFYzUV5bmoEGEdZqUEj/SnWnHKzo4Er9/MxW
	7bgaa4YXpatwO7+HpD+X8/3p0R7dLHvA/WeamTnoZBU+oEopS7UxNL6oenupR0a/ngGpDliajW8gU
	G/nBuiqUX/HU6MvILZebxptCd/6tx/UO+aT+GtVdxUptHme9qlrB1t1OcpSz9/nNBwfMX9iqmXa41
	5SgsSw+H1GW59JcUa/eqTSPYurCELd7WS3GT3R5hFS5N9peqOkzHlA3QSCwZGK2/5jWKUcrTUa9Fx
	fxyHIAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFEXt-00000006oe9-2ILl;
	Fri, 09 Oct 2026 17:38:13 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFEXr-00000006odD-13VR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 17:38:12 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-824329dc1ecso45227a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 10:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791567490; x=1792172290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNIlTnHi+YxWylz7AkakSHgtCnUqszk6I0tbLDOt9L4=;
        b=OkXbMzzSBzb1VGXMfn0srh1yKhlUQ37Eh7jLjuzMdEsMcHgAG6MjxSPHoPAbIKZU9K
         g8srRXcJlmb7hY+fBVNhitVE3OiIwuBZcPVisLa3tiaKcU5P6rsesKA2VboA8CK+SN2e
         eJjApRSnehErKAfpsOkQudp70QPCCaun1dKpUpdzkMFEy2G+bj+4yLIyoY4ll7+B7GSB
         809oKXh7dSi8+8zWrE1oV7wqBcN63aVpZpNeCaKjNzx1w6HDKPB7MyInqMc/DolqAEbh
         AZSb+5pJi//Fb8Vr6TsEGlEouZVvDlvtFtPRH3qNXm2rNTIUQ8vinRFW4G78m1qry7cm
         Depg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791567490; x=1792172290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNIlTnHi+YxWylz7AkakSHgtCnUqszk6I0tbLDOt9L4=;
        b=OANCi//mhkPD5p5UWtWb7o8bGxc7prxcEiBceU8J0Br91GozlbUnpB0knr0S0cz10K
         W6NooHp3pOMbHSKVrD4kSEGMtcrfwhE3BtzErHNGf1zLnBxzK+f7qmxRYDtBZotaRTor
         yRzJKvLW6PTYQoGeV62tAVrsgtbFFq8824uk0Li1NOhAK5tJ+CT77rdAT2TSUP82RUx0
         pNePH9OyiXIp1Zwn9bqR2kdJAws0pWOeSGiPpTROnUYv2R3FrMn31MUsUfA1vc0vQJ2Q
         NFyDcCjgDNlM1/lV/6VqQncfjdGVJgJEtMlp56PQAb0tLNVKWDXV0In4qWkBPuxyeKnf
         rMDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJ3aTYcWeY+s/ubrN20gcjHQVmEkkBr1o2m/Bn23wdEjzNZ4VLfXB8ypOcXM8HKI9k7avwLB90gdYrFDHd0oN5@lists.infradead.org
X-Gm-Message-State: AFuF++lNBLqPA4j0Bs2DQOh2TCHIEPGBh5nqlwFpVTEoaLKCzce6PVyl
	yPhHKj1vZC+68go1leUCHUVNgxaa+QzoMaM0V7V0S528Q6ZPmJX0jcyr
X-Gm-Gg: AYBFou2mYsflNKte+A31RZ0+Hc57zHz0uxDG+yjQ7IYsh3uAy2Z6XTdUom6gTuUX0ip
	9pXWzaijb2bzTnUrFXNwjM0bbjbRc2MsD1elqCGeo0pzk0L+1j0fP8pQwhbAX1lzgJv9fvIVhB0
	KCb5vHtILa0B2PzIhpv4qXbe7jCxZbaweFhAE/s3O0cm5IZ0VXgDUSACX1JqeCddBEdfm2llnVT
	cOfZsvOhNXjEN5IUrJrRuNBohtAapJjRTfCzwl6SxsigwJq9LaGqumViKAWDheZZwbd5YIMJRqe
	7gMEfhuHYhxZcB6gaMG1cu0HZp7IyW9Ji8v9u4Jhvn7ITpCvomy68xGIJEvLkMYq8DfOoIieyCX
	aI23oCp3HpIhpNXMS9wKJyXnQIxkij6sLxjHyipIw4EwUyvi2ImlNjRyzzYHXqd67PVLexnT9Qe
	RZqi3Hbb1ycBpIGC7oKRhp3w3R1Si+c8QKOGt8KgBk9uXJE5GpjpeTqlQXrYTKrhAjf4KhGak5G
	BZpPnM=
X-Received: by 2002:a05:6830:6502:b0:81b:9d18:761 with SMTP id 46e09a7af769-83095c2c6bcmr2158334a34.12.1791567489732;
        Fri, 09 Oct 2026 10:38:09 -0700 (PDT)
Received: from localhost ([2a03:2880:12ff:9::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039076dc3sm2620678a34.14.2026.10.09.10.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:38:09 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf v3] bpf, arm64: Fix racy plt target update in bpf_arch_text_poke()
Date: Fri,  9 Oct 2026 10:37:59 -0700
Message-ID: <20261009173802.1248441-1-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_103811_305038_3A2FC684 
X-CRM114-Status: GOOD (  19.26  )
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

When a long-jump trampoline is attached to or detached from a bpf prog,
bpf_arch_text_poke() updates the plt target at the end of the prog by
temporarily making the page writable:

	set_memory_rw(page);
	WRITE_ONCE(plt->target, plt_target);
	set_memory_ro(page);

Since commit 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory
management"), bpf progs are allocated from the bpf prog pack, so
unrelated progs and their plts commonly share a page. The sequence
above is not serialized against other pokers, it runs before text_mutex
is taken and callers only hold the lock of the trampoline being
updated. Two CPUs attaching to or detaching from different target progs
in the same page can therefore race:

	CPU A                           CPU B
	set_memory_rw(page)
	                                set_memory_rw(page)
	                                WRITE_ONCE(plt_B->target, ...)
	                                set_memory_ro(page)
	WRITE_ONCE(plt_A->target, ...)  <- permission fault

This was hit on an arm64 server with 64K pages while attaching fentry
programs to bpf progs:

  Unable to handle kernel write to read-only memory at virtual address ffff80008f46d5f8
  ESR = 0x000000009600004f
  FSC = 0x0f: level 3 permission fault
  pte=00c00200ea5a0783
  Internal error: Oops: 000000009600004f [#1]  SMP
  pc : bpf_arch_text_poke+0x214/0x238
  lr : bpf_arch_text_poke+0x200/0x238
  Call trace:
   bpf_arch_text_poke+0x214/0x238 (P)
   __bpf_trampoline_link_prog+0x1c8/0x470
   bpf_trampoline_link_prog+0x64/0x90
   bpf_tracing_prog_attach+0x318/0x4a8
   bpf_raw_tp_link_attach+0x104/0x258
   bpf_raw_tracepoint_open+0x6c/0x90
   __sys_bpf+0x134c/0x3e10

Rather than serializing the permission changes, stop changing page
permissions altogether and write the plt target with
aarch64_insn_write_literal_u64(). It writes through the text patching
fixmap under patch_lock, the same way the rest of the prog pack is
written, and performs a single-copy atomic 64-bit store. The plt target
is naturally aligned (see build_plt()), so CPUs concurrently executing
the plt still observe either the old or the new target. This is the
same helper ftrace and static calls use to update 64-bit literals that
are loaded concurrently.

Fixes: 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory management")
Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
Changes in v3:
- Consolidate nested if statements & merge comments
- Remove no-longer-used asm/set_memory.h include
- Link to v2: https://lore.kernel.org/linux-arm-kernel/20261002121233.561368-1-thepacketgeek@gmail.com/
Changes in v2:
- Replace page permissions change with call to aarch64_insn_write_literal_u64
- Link to v1: https://lore.kernel.org/linux-arm-kernel/20261002044050.1277356-1-thepacketgeek@gmail.com/
---
 arch/arm64/net/bpf_jit_comp.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 475e70653454..cf356f0ce213 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -22,7 +22,6 @@
 #include <asm/debug-monitors.h>
 #include <asm/insn.h>
 #include <asm/text-patching.h>
-#include <asm/set_memory.h>

 #include "bpf_jit.h"

@@ -3338,21 +3337,22 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type old_t,
 		 */
 		plt_target = (u64)&dummy_tramp;

-	if (plt_target) {
-		/* non-zero plt_target indicates we're patching a bpf prog,
-		 * which is read only.
-		 */
-		if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), 1))
-			return -EFAULT;
-		WRITE_ONCE(plt->target, plt_target);
-		set_memory_ro(PAGE_MASK & ((uintptr_t)&plt->target), 1);
-		/* since plt target points to either the new trampoline
-		 * or dummy_tramp, even if another CPU reads the old plt
-		 * target value before fetching the bl instruction to plt,
-		 * it will be brought back by dummy_tramp, so no barrier is
-		 * required here.
-		 */
-	}
+	/*
+	 * non-zero plt_target indicates we're patching a bpf prog,
+	 * which is read only. The prog may share its page in the bpf
+	 * prog pack with other progs, so write the aligned target
+	 * through the text patching fixmap without flipping the
+	 * page permissions to avoid racing with concurrent pokers.
+	 *
+	 * since plt target points to either the new trampoline
+	 * or dummy_tramp, even if another CPU reads the old plt
+	 * target value before fetching the bl instruction to plt,
+	 * it will be brought back by dummy_tramp, so no barrier is
+	 * required here.
+	 */
+	if (plt_target &&
+	    aarch64_insn_write_literal_u64(&plt->target, plt_target))
+		return -EFAULT;

 	/* if the old target and the new target are both long jumps, no
 	 * patching is required
--
2.53.0-Meta

