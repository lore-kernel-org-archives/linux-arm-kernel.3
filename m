Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC05CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 12:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=81uGpmP7cmZ5oefPKsTcsvoJoAO1uuBsnrj4SEE2374=; b=vV9sbUDggXKPtgbX/1tY5dTDVX
	Tly64H1koXAzGHbXWGWzhYGWJiIvqh42+cqaGertq1wgNB+cPfhomFKSHkfhufTQEe8dlg4pmnxiU
	0SunG5fX34acWVEyZxo4ELpgi5GoG0wiDm/Z3D3rb2pm9Pqwf4GZ9uwg58d8mrpDswnJhXFHa/jXl
	/5UoJcoHhXyPescr/OfqG86akKzS3TYtN/WFsO1l9WGmbFVieHHbz80VzqGD6dOrMA+Spix33+Uv6
	o7OvrGMVw7Qv5l8nEwwYNYQeVfRaJE3IXCPJ0Kc3oWj0jIcEghNl6KXS2IwDStY0RBpl/3PFpO9eh
	+OMaD55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCc7y-0000000BY1e-3qu5;
	Fri, 02 Oct 2026 12:12:38 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCc7v-0000000BY19-2qUy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 12:12:37 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4c66ba0b762so1456970b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790943154; x=1791547954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=81uGpmP7cmZ5oefPKsTcsvoJoAO1uuBsnrj4SEE2374=;
        b=E+QGpyMkYwAOr1zHrqy1E7rNwW0eKO4FdWABziPwqMRBHeAc1STus4KXGI0Yt3oQM2
         UDKg5PXknRi821cdoITDje7dmNfTnBswBzM1s3bLWrHogZRmk5H7e2OPwgKpZATY9StM
         hzJqPJ1O96scRM1kBBUK0BN3jnLve5y0fNIU78BQHb3DliU4L4zXO6wZRREt9YEEb9It
         jrG9r1Uy4Il2XAmxp1k3O7Z9CoCF8pllqm9SRLDmF2YBZV2Esk4KkU9w8QHmUDJIjCUU
         rAnBbi/Oqnnrw6dT45QwMSR7cwbnQims5ge5JETig6x782PLUQlwg+O3prNMe9TGCiIu
         v5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790943154; x=1791547954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81uGpmP7cmZ5oefPKsTcsvoJoAO1uuBsnrj4SEE2374=;
        b=BSbty2EBAuhMRhytLEHxESA6yxzljV2GyxD6Zeq2c4GX670qcXwAc+ygxw1whrNizR
         1cyFEFPcAiGSq1AuToYx6a6W7Rf38bvz/GjPJi5ur5wg0+D0FZVPMGh/ilaPoy0euHLi
         52jxSCHrS0YeqRc4+0fvxyQBUWeqChO0WOVF5fap9tym8ldtGM7Nb3nD2EDOfZTOYQ6P
         VcL+S/Tgh3h97c9nw4YS1B/yFoC9ySI1FglK/6TSZ9dCd1b/h4bS+7n6TFlXeart+LSc
         fuJG2yR0rVoAcBS2bXxS4Z0N5PfayGFkHqLxeVEZZ3XMOiY+hK27zStlbtMtKp/S55A4
         /mWw==
X-Forwarded-Encrypted: i=1; AKwUvBwwjDhBZAr9WfVQJ4qaN2ASKLMYUmmRqw1NfFszRabrEZFShBVMz9l9INmLx1hkF2n6oWYcwJDe4IONa2/JuDGg@lists.infradead.org
X-Gm-Message-State: AFuF++mbQoJMctbU4dR0ASfofO0uXckFZcVlm/a6ZEIlHxw3PFhzlyBz
	T4JSjvRdx4Yb8oByQrFc/d9PHC4jv/2X18LHz51LBfpQRTcd6d5VmTKr
X-Gm-Gg: AYBFou3pazuB3hzLaaW1r4QKhjXEHAGmj0xODXdHOwz11ryhr9s3D4EyOEOtY8PZtKo
	mzMvGfntpFUrBVgO1XWvxUIUBWeKiCNoVmNT4RcrMGtCgN6ZXW5XVhXrYc1AMv0Ajd0Oneeiv6i
	ngm7kchSnCCOK7p7DhG4AaLzCrADfaGZBmSmH4ydVdKLR1d3KoX8qSnJNwot6UwU0ZHr84XW6JB
	AT7sNSc4255w/+vCLMI6dGs1ZdMigMmdTD5V9gidkm+RUP/pVtgX/Q4Lup1Q9yYKEaEadQOU4I6
	tSnGzm3UThMiwtDxRxM4bUW5pGZbBPtO5YNK/+zQMWBi/f4+GXEsye1Q8WIApYIcLCj/kU/pvBm
	MtLEsrNtYJKnma+o9cDOpgk67LUFBS5bAg5yZuTMpak7MKukebDX2opHRh2lUOMWuuUeN1Xzx3W
	c9I1JS/+ekspLquU0EKL8WVvI6fpaNo2G+CerYqJvxcafcq4TJVOpjVbK4EqXwY1ZPW1/Mjg==
X-Received: by 2002:a05:6808:14c2:b0:4c3:cec9:fd18 with SMTP id 5614622812f47-4f528ccf57emr1327475b6e.11.1790943154581;
        Fri, 02 Oct 2026 05:12:34 -0700 (PDT)
Received: from localhost ([2a03:2880:12ff:43::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f524cd09e2sm1963119b6e.14.2026.10.02.05.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:12:34 -0700 (PDT)
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
Subject: [PATCH v2] bpf, arm64: Fix racy plt target update in bpf_arch_text_poke()
Date: Fri,  2 Oct 2026 05:12:31 -0700
Message-ID: <20261002121233.561368-1-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_051235_727553_25497936 
X-CRM114-Status: GOOD (  17.46  )
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
Changes in v2:
- Replace page permissions change with call to aarch64_insn_write_literal_u64
- Link to v1: https://lore.kernel.org/linux-arm-kernel/CADvopvZPO1gDMDhDOPcArjRJ0cPpSUZ5suMg-1kwRi+_-Xeitw@mail.gmail.com/
---
 arch/arm64/net/bpf_jit_comp.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 475e70653454..e353403cc1c3 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -3339,13 +3339,15 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type old_t,
 		plt_target = (u64)&dummy_tramp;

 	if (plt_target) {
-		/* non-zero plt_target indicates we're patching a bpf prog,
-		 * which is read only.
+		/*
+		 * non-zero plt_target indicates we're patching a bpf prog,
+		 * which is read only. The prog shares its page in the bpf
+		 * prog pack with other progs, so write the aligned target
+		 * through the text patching fixmap without flipping the
+		 * page permissions to avoid racing with concurrent pokers.
 		 */
-		if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), 1))
+		if (aarch64_insn_write_literal_u64(&plt->target, plt_target))
 			return -EFAULT;
-		WRITE_ONCE(plt->target, plt_target);
-		set_memory_ro(PAGE_MASK & ((uintptr_t)&plt->target), 1);
 		/* since plt target points to either the new trampoline
 		 * or dummy_tramp, even if another CPU reads the old plt
 		 * target value before fetching the bl instruction to plt,
--
2.53.0-Meta

