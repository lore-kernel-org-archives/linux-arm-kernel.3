Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B01DF531C4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIbaQ9mg0ZbtaBPZTfhJW0y4Oug6knq3Mk42IMQtkEk=; b=Nzg62HDbZ849eCH15Gl+Sku59m
	1RLYTfMWVUKxNIwsoMhMc2pRa26oNVzEq/KXZCSFxzAtDMIdTh6KUTH8O3o5ZmH0QL2J8qry366Gj
	Of0vQFpOyJFVgXymzRu7k5OIGj8XESIqWFfmCHIpSygxlRkwizlC0dJbAeAz4XMYTTtMgNI+ueb8M
	PpiM6Q8pOhyZnU9otYpzlTqCDnxu6xcRa+KmH+DISKNZJD3q7ndVzekSrgRTltOQWDTnH41RClvwi
	Hen9bkfSRnq98+Ks8+mlbiLQZ2nGRkakcGZ0H/92flZVMQptMAjEmWVujaizgyMsX9ye/wSvsgM6p
	KFdjTOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCM22-0000000GC5U-0i10;
	Mon, 13 Apr 2026 18:29:10 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCM1z-0000000GC33-2pcD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:29:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A43C0C5B1AD;
	Mon, 13 Apr 2026 18:29:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F191C5FFB9;
	Mon, 13 Apr 2026 18:29:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7044104504B7;
	Mon, 13 Apr 2026 20:28:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776104943; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SIbaQ9mg0ZbtaBPZTfhJW0y4Oug6knq3Mk42IMQtkEk=;
	b=KLIXIQrj/Dt6o6ylVSJmfcaGlqn8TQDRCQGBXVjGupGskDl9p5aoxmau6a5GMRftUxpFpP
	XXob2LzYqw709cOvxQ5a6hZGYrx/bejjqgSFQM7M3yCVGCevkepZRsrW22JHoJF1sJdmYj
	i+d3PdzlC1LjCfqZTgrnQ66Lzt9Q7VBJLIq352bEOs30qOllcgBqkwoZ+xBRxoIMSjdmbG
	2XqEp8UhjW1u3aJYbkCV4oPPq+JzqKyxPU/N6g+sv8PuS6VSbWtBmO71EcZ3QVymVhCtlo
	qjIaEb+/iC68dcXGm9wEQ/ZTOVEQ204pR+3wpucVloW80kqFyZL8TKyYRm8oKQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Mon, 13 Apr 2026 20:28:42 +0200
Subject: [PATCH RFC bpf-next 2/8] bpf: mark instructions accessing program
 stack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260413-kasan-v1-2-1a5831230821@bootlin.com>
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
In-Reply-To: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: ebpf@linuxfoundation.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Xu Kuohai <xukuohai@huawei.com>, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, kasan-dev@googlegroups.com, 
 linux-mm@kvack.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_112907_998627_FE07D424 
X-CRM114-Status: GOOD (  14.22  )
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

In order to prepare to emit KASAN checks in JITed programs, JIT
compilers need to be aware about whether some load/store instructions
are targeting the bpf program stack, as those should not be monitored
(we already have guard pages for that, and it is difficult anyway to
correctly monitor any kind of data passed on stack).

To support this need, make the BPF verifier mark the instructions that
access program stack:
- add a setter that allows the verifier to mark instructions accessing
  the program stack
- add a getter that allows JIT compilers to check whether instructions
  being JITed are accessing the stack

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
 include/linux/bpf.h          |  2 ++
 include/linux/bpf_verifier.h |  2 ++
 kernel/bpf/core.c            | 10 ++++++++++
 kernel/bpf/verifier.c        |  7 +++++++
 4 files changed, 21 insertions(+)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index b4b703c90ca9..774a0395c498 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1543,6 +1543,8 @@ void bpf_jit_uncharge_modmem(u32 size);
 bool bpf_prog_has_trampoline(const struct bpf_prog *prog);
 bool bpf_insn_is_indirect_target(const struct bpf_verifier_env *env, const struct bpf_prog *prog,
 				 int insn_idx);
+bool bpf_insn_accesses_stack(const struct bpf_verifier_env *env,
+			     const struct bpf_prog *prog, int insn_idx);
 #else
 static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
 					   struct bpf_trampoline *tr,
diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index b148f816f25b..ab99ed4c4227 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -660,6 +660,8 @@ struct bpf_insn_aux_data {
 	u16 const_reg_map_mask;
 	u16 const_reg_subprog_mask;
 	u32 const_reg_vals[10];
+	/* instruction accesses stack */
+	bool accesses_stack;
 };
 
 #define MAX_USED_MAPS 64 /* max number of maps accessed by one eBPF program */
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 8b018ff48875..340abfdadbed 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -1582,6 +1582,16 @@ bool bpf_insn_is_indirect_target(const struct bpf_verifier_env *env, const struc
 	insn_idx += prog->aux->subprog_start;
 	return env->insn_aux_data[insn_idx].indirect_target;
 }
+
+bool bpf_insn_accesses_stack(const struct bpf_verifier_env *env,
+			     const struct bpf_prog *prog, int insn_idx)
+{
+	if (!env)
+		return false;
+	insn_idx += prog->aux->subprog_start;
+	return env->insn_aux_data[insn_idx].accesses_stack;
+}
+
 #endif /* CONFIG_BPF_JIT */
 
 /* Base function for offset calculation. Needs to go into .text section,
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 1e36b9e91277..7bce4fb4e540 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -3502,6 +3502,11 @@ static void mark_indirect_target(struct bpf_verifier_env *env, int idx)
 	env->insn_aux_data[idx].indirect_target = true;
 }
 
+static void mark_insn_accesses_stack(struct bpf_verifier_env *env, int idx)
+{
+	env->insn_aux_data[idx].accesses_stack = true;
+}
+
 #define LR_FRAMENO_BITS	3
 #define LR_SPI_BITS	6
 #define LR_ENTRY_BITS	(LR_SPI_BITS + LR_FRAMENO_BITS + 1)
@@ -6490,6 +6495,8 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regn
 		else
 			err = check_stack_write(env, regno, off, size,
 						value_regno, insn_idx);
+
+		mark_insn_accesses_stack(env, insn_idx);
 	} else if (reg_is_pkt_pointer(reg)) {
 		if (t == BPF_WRITE && !may_access_direct_pkt_data(env, NULL, t)) {
 			verbose(env, "cannot write into packet\n");

-- 
2.53.0


