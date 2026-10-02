Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D41CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 04:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+aNuBHrd5RMEXmJ5WPHyWr9jcSxnvnt7cywTSQ93A8M=; b=Mmn1sAWDKe7ccPk/b/ndpcY+qP
	V80UZw9nlhBnReowI61IeaylHAY0vbEMiVNeXl15iwyjGxXopSiNs1YvdRfzigX3KRSFb4Z0TSWEC
	88B0NiW4kgjaG+bYthxND+VpdBqS8y3DSginjbJyADsIyiZYUYRyOrrpfIlaSWVxAFsyldk7Piz0m
	b3vEeGarsVyZpZv2rdMwScixGSYD0vLSnJ7ZNGdKkkzWQBIQmafvD7W52zKISzG6P1IitYY+bhdEP
	lCeevGxQVOp15J1w1rztLCKq5HyTwnKnvOWFtZjI31gooB40AyeRPkiLwFZWQAmWII9rFH1LbNQ9p
	aHvaMqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV4r-0000000AccD-2PRd;
	Fri, 02 Oct 2026 04:40:57 +0000
Received: from mail-oi2-x0e.google.com ([2607:f8b0:4864:32::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV4o-0000000AcbH-2gNj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 04:40:55 +0000
Received: by mail-oi2-x0e.google.com with SMTP id 5614622812f47-4e667873c38so3006297b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 21:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790916053; x=1791520853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+aNuBHrd5RMEXmJ5WPHyWr9jcSxnvnt7cywTSQ93A8M=;
        b=ksglgx9inAdkCnqvcI1zU3+qPYi6X4mgfKce4sZe0u8V8IfmqByjina+oklPVUi3CS
         yOc3PXgQZcEhXLfO2RVKy0mi4dcSWzI18108j0z+vPd/FcKSs0hy1pNTCzwl1NLlJcZV
         y13/8IQdyTxBqaPGLB6cIF11jmUKxXYaBUe9/8Bzx3jsq17bHViXoCv/NQlexqAjrAPF
         VC4T9HxuMSZqTPsmeEK1jRRod+Lnn+6yNiAPQXf/KUoKkHHiSAAksHV2XNDONk3e1Zna
         IkiEQ5BJ0G5QFybYec/trQUA6RoYpISlRfTuVRFbLbh9g4Wuj3l7FJL3n+2u1HHzUiAz
         YHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790916053; x=1791520853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aNuBHrd5RMEXmJ5WPHyWr9jcSxnvnt7cywTSQ93A8M=;
        b=BDm88dQCHV7SG251PsCn32CTmy6fo8z1uHOKr2sc4m6zvoVz82Df7uEoTHY6SM2uYA
         K+Fe/CKkIgJcDwmkES838cN6aQUhD50OKuf6HekrUp8PMTIXMziWr8gWqHyu5HrHedxL
         JYMooWOnLdYsris5oBJLJ8kKiw5RK9Z5m1YvMdMuUBt+06HbYfCY4qGIN49TBBCjDjcz
         Wy+48V+sRT3PyjL4XvkaK9SMVcLulCHzWFbU6zqI4etTn3azR8o1+jwec07f4hc+pgXx
         1W+Ng98Y21Pnc0/EZfoaTkiyeCQ7W0sEaf6GY6vJJnPP9AdnuEs+cOsukbQVoCtYFz4S
         u13w==
X-Forwarded-Encrypted: i=1; AKwUvBwmsf7p/sVTdITNGv+OwjjWwHQpWdhOb2mmffDVNw5+cJTXSPANCjRnxVOUCRS301/Kgz/C8hT7BFkZmv8mBfiA@lists.infradead.org
X-Gm-Message-State: AFuF++n9S3Zl0ovcJbI6iorY7ErqhkX85VHh18dHVkh6gaJkYw+LY6bH
	yBt8yoQbGGGwI2W0KwZ9CzkJD5HceeRFCNJZdKuOpzbjvmLIiMA/N2ov
X-Gm-Gg: AYBFou1BcjXNvY2iK7+MZXf/Jg0Q+1eCuZsK4BIQ82xQvnxMSSRlsAZKFseTdmkbYyH
	T8jY5RWmo9oUVOSc7mxiX+wrVSJtaU1p+Ua3McAtHq7dD0pEhdXXXGK43D90UofrfwA8ObHBwEb
	KtB5GrR4Nvj2wJlu1hK7uVAengCxq+ZhSbt+8DA1o2Z5G4PGlqn3LfkWhO1WD4MbwGgVSMoC/8P
	nLL+sOGVq4eC6jGGTF5AcwL4lFB7d31NmAQIZrlf7gylfz1ZbhOfgYbucvMaWCbCv36YV0gn328
	NaCSebhRmWffKFotgMdjT51h6l3pLBMG88lalmYAMzjRhs6IXa78/W4ich+bHm9vHXOfR/eMfT4
	6XMdDrFcZDYYZQPYf9IM4GP8MZc/TxtNpVArWj7Cyu26uFol5H5oIO2mRtGmwZ60OhlIYkVfGUW
	ZTUz2PQgMUgHOsSlcMOV5SE6i4cywNf4r1iVreB7UrgRqAdpEocmXWVTRBw4DY+fWVEKTu
X-Received: by 2002:a05:6808:13c2:b0:4ea:bd4e:5cc5 with SMTP id 5614622812f47-4f52ab8b76amr1425589b6e.46.1790916053267;
        Thu, 01 Oct 2026 21:40:53 -0700 (PDT)
Received: from localhost ([2a03:2880:12ff:3::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f523da65c2sm1217527b6e.5.2026.10.01.21.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:40:52 -0700 (PDT)
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
Subject: [PATCH] bpf, arm64: Fix text_mutex critical section in bpf_arch_text_poke()
Date: Thu,  1 Oct 2026 21:40:48 -0700
Message-ID: <20261002044050.1277356-1-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_214054_689985_220A3817 
X-CRM114-Status: GOOD (  18.10  )
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

Widen the text_mutex critical section in bpf_arch_text_poke() to cover
the page permission changes made while updating a bpf prog's plt target.
When a long-jump trampoline is attached to or detached from a bpf prog,
the plt target at the end of the prog is currently updated before
text_mutex is taken, by temporarily making the page writable:

	set_memory_rw(page);
	WRITE_ONCE(plt->target, plt_target);
	set_memory_ro(page);

Leaving this outside text_mutex assumes the page belongs only to the
prog being poked, whose pokes are already serialized by its trampoline
lock. Commit 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory
management") broke that assumption; it switched the arm64 JIT to the bpf
prog pack allocator, which packs programs into small chunks of large
shared allocations, without updating bpf_arch_text_poke(). Since then,
unrelated progs (and their plts) commonly share a page. Two CPUs
attaching to or detaching from different target progs in the same page
hold different trampoline locks, so their permission changes can
interleave:

	CPU A                           CPU B
	set_memory_rw(page)
	                                set_memory_rw(page)
	                                WRITE_ONCE(plt_B->target, ...)
	                                set_memory_ro(page)
	WRITE_ONCE(plt_A->target, ...)  <- permission fault

This was hit on a 64K page arm64 machine:

  Unable to handle kernel write to read-only memory at virtual address ffff80008f46d5f8
  FSC = 0x0f: level 3 permission fault
  pte=00c00200ea5a0783
  pc : bpf_arch_text_poke+0x214/0x238
  Call trace:
   bpf_arch_text_poke+0x214/0x238 (P)
   __bpf_trampoline_link_prog+0x1c8/0x470
   bpf_trampoline_link_prog+0x64/0x90
   bpf_tracing_prog_attach+0x318/0x4a8
   bpf_raw_tp_link_attach+0x104/0x258
   bpf_raw_tracepoint_open+0x6c/0x90
   __sys_bpf+0x134c/0x3e10

Fixes: 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory management")
Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
 arch/arm64/net/bpf_jit_comp.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 475e70653454..66fab0bfd3da 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -3338,12 +3338,20 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type old_t,
 		 */
 		plt_target = (u64)&dummy_tramp;

+	/* pages of the bpf prog pack are shared between progs, so the
+	 * set_memory_rw()/set_memory_ro() window below must be serialized
+	 * against other pokers too.
+	 */
+	mutex_lock(&text_mutex);
+
 	if (plt_target) {
 		/* non-zero plt_target indicates we're patching a bpf prog,
 		 * which is read only.
 		 */
-		if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), 1))
-			return -EFAULT;
+		if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), 1)) {
+			ret = -EFAULT;
+			goto out;
+		}
 		WRITE_ONCE(plt->target, plt_target);
 		set_memory_ro(PAGE_MASK & ((uintptr_t)&plt->target), 1);
 		/* since plt target points to either the new trampoline
@@ -3357,10 +3365,11 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type old_t,
 	/* if the old target and the new target are both long jumps, no
 	 * patching is required
 	 */
-	if (old_insn == new_insn)
-		return 0;
+	if (old_insn == new_insn) {
+		ret = 0;
+		goto out;
+	}

-	mutex_lock(&text_mutex);
 	if (aarch64_insn_read(ip, &replaced)) {
 		ret = -EFAULT;
 		goto out;
--
2.53.0-Meta

