Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C180C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 01:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWVnHAq/YC60DHPF1u0SpqcDZKjaPRLzxsrD1nXJW20=; b=krZU4fEEuRq2MwiesSgYameiSy
	FBona2gCmL09m5p/0WmlCFlpybnoT22mi5XxLs0g9fG1WyEB2txzRgRCxn9rIs50cc1ogtUrfy9p6
	tsH16LxWDozHQOZq1OlFim2W2BculSMUbDUtgFJxah0bl35i81V41pgpTmecH+yrnAxSEagNJOIgo
	7m/sb2ljnvnItgKkRzSmhriTjpf+pLqbPSGdY+NHgTSZHxBbziVncg1HsSB6ccKwMgTwb/YNbSHuo
	7Pi8j0EFWbQg0smy4W5AjBnVlJzzjRGbC7i8tADEvXNQ1xS+M+2FPbHMvMyDuG3NYfJ/tPnrZV/wP
	GXDWdAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjRgy-0000000AdSO-3gpl;
	Tue, 14 Jul 2026 01:12:13 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjRgu-0000000AdOk-2f2M;
	Tue, 14 Jul 2026 01:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783991528; x=1815527528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tel9fKM3KABw1yaGIxyHHMHjHD11rhYnRGX4xzshVn8=;
  b=WK3N8WbQw1pDJKvdf+o6CYRGGDORBJ1a6LpxYJ0EzTKtXttThYyNrBKB
   xMkduWhDxuK3tHaad2mvdcueg/Lo/f4g/uIeWCVDL8T4R4+c9Zs22KRW4
   rUkujpZPlCGHz37no31gez2hI0d2cHCzUwMYT3jVkPek8zbo9bTdpGYVE
   LVbYLypJCz0dji2zV64mSnkrSao6mAW43rQ2HlHSOv70P1Bok7Raov/yY
   kGxd0zcbOyEuTnchzrRewIaufj+rHixYxdeBOZz3ktUb+gKYKWbHWpsCy
   1F0WRvNmTCIZriRdn2W2GQIylzachb9Vkw+nShfgJo4oqQcTg6pyY2QYc
   A==;
X-CSE-ConnectionGUID: 9Uo5Y2x0Sg+JF8s6qGC5gQ==
X-CSE-MsgGUID: DVGlUKMnTteIvl9wgGKxrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95212088"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95212088"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 18:12:08 -0700
X-CSE-ConnectionGUID: sxRmPoeVQ8+UtOaFh9510g==
X-CSE-MsgGUID: XwBhlVRWRXW+i2yWfcMNiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255212801"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 18:12:08 -0700
Date: Mon, 13 Jul 2026 18:12:07 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH 6.18.y 3/6] bpf: Restrict JIT predictor flush to cBPF
Message-ID: <20260713-cbpf-jit-spray-hardening-6-18-y-v1-3-755f60c55705@linux.intel.com>
X-Mailer: b4 0.16-dev
References: <20260713-cbpf-jit-spray-hardening-6-18-y-v1-0-755f60c55705@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-cbpf-jit-spray-hardening-6-18-y-v1-0-755f60c55705@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_181208_688091_FB0418B8 
X-CRM114-Status: GOOD (  16.76  )
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

commit 0bb99f2cfaae6822d734d69722de30af823efdf3 upstream.

Currently predictor flush on memory reuse is done for all BPF JIT
allocations, but only cBPF programs can be loaded by an unprivileged user.
eBPF is privileged by default, and flushing predictors for all CPUs on
every eBPF reuse penalizes the common case for no security benefit.

eBPF allocations can be frequent on busy systems, only flush predictors
for cBPF programs. Trampoline and dispatcher allocations also skip the
flush as they are eBPF-only.

  [pawan: backport had various conflicts in arches bpf_int_jit_compile().
	  loongarch bpf_int_jit_compile() doesn't use pack allocator,
	  dropped was_classic hunk. ]

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Acked-by: Daniel Borkmann <daniel@iogearbox.net>
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
---
 arch/arm64/net/bpf_jit_comp.c   |  4 ++--
 arch/loongarch/net/bpf_jit.c    |  2 +-
 arch/powerpc/net/bpf_jit_comp.c |  4 ++--
 arch/riscv/net/bpf_jit_comp64.c |  2 +-
 arch/riscv/net/bpf_jit_core.c   |  3 ++-
 arch/x86/net/bpf_jit_comp.c     |  5 +++--
 include/linux/filter.h          |  5 +++--
 kernel/bpf/core.c               | 13 ++++++++-----
 kernel/bpf/dispatcher.c         |  2 +-
 9 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 873c1b784a87..c563bae8fce1 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -2117,7 +2117,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	image_size = extable_offset + extable_size;
 	ro_header = bpf_jit_binary_pack_alloc(image_size, &ro_image_ptr,
 					      sizeof(u64), &header, &image_ptr,
-					      jit_fill_hole);
+					      jit_fill_hole, was_classic);
 	if (!ro_header) {
 		prog = orig_prog;
 		goto out_off;
@@ -2754,7 +2754,7 @@ int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
 
 void *arch_alloc_bpf_trampoline(unsigned int size)
 {
-	return bpf_prog_pack_alloc(size, jit_fill_hole);
+	return bpf_prog_pack_alloc(size, jit_fill_hole, false);
 }
 
 void arch_free_bpf_trampoline(void *image, unsigned int size)
diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index e9d666508ae2..a000620ca99d 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1474,7 +1474,7 @@ static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
 
 void *arch_alloc_bpf_trampoline(unsigned int size)
 {
-	return bpf_prog_pack_alloc(size, jit_fill_hole);
+	return bpf_prog_pack_alloc(size, jit_fill_hole, false);
 }
 
 void arch_free_bpf_trampoline(void *image, unsigned int size)
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 189ef7b72081..cedab25aa3a8 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -246,7 +246,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	alloclen = proglen + FUNCTION_DESCR_SIZE + fixup_len + extable_len;
 
 	fhdr = bpf_jit_binary_pack_alloc(alloclen, &fimage, 4, &hdr, &image,
-					      bpf_jit_fill_ill_insns);
+					 bpf_jit_fill_ill_insns, bpf_prog_was_classic(fp));
 	if (!fhdr) {
 		fp = org_fp;
 		goto out_addrs;
@@ -468,7 +468,7 @@ bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
 
 void *arch_alloc_bpf_trampoline(unsigned int size)
 {
-	return bpf_prog_pack_alloc(size, bpf_jit_fill_ill_insns);
+	return bpf_prog_pack_alloc(size, bpf_jit_fill_ill_insns, false);
 }
 
 void arch_free_bpf_trampoline(void *image, unsigned int size)
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 45cbc7c6fe49..9e9e6dcfc482 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1268,7 +1268,7 @@ int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
 
 void *arch_alloc_bpf_trampoline(unsigned int size)
 {
-	return bpf_prog_pack_alloc(size, bpf_fill_ill_insns);
+	return bpf_prog_pack_alloc(size, bpf_fill_ill_insns, false);
 }
 
 void arch_free_bpf_trampoline(void *image, unsigned int size)
diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index 191bf0e66c82..e4ab5bb9c9f6 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -125,7 +125,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 				bpf_jit_binary_pack_alloc(prog_size + extable_size,
 							  &jit_data->ro_image, sizeof(u32),
 							  &jit_data->header, &jit_data->image,
-							  bpf_fill_ill_insns);
+							  bpf_fill_ill_insns,
+							  bpf_prog_was_classic(prog));
 			if (!jit_data->ro_header) {
 				prog = orig_prog;
 				goto out_offset;
diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 788671a32d8e..c3798cab3b7d 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -3447,7 +3447,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 
 void *arch_alloc_bpf_trampoline(unsigned int size)
 {
-	return bpf_prog_pack_alloc(size, jit_fill_hole);
+	return bpf_prog_pack_alloc(size, jit_fill_hole, false);
 }
 
 void arch_free_bpf_trampoline(void *image, unsigned int size)
@@ -3780,7 +3780,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 			/* allocate module memory for x86 insns and extable */
 			header = bpf_jit_binary_pack_alloc(roundup(proglen, align) + extable_size,
 							   &image, align, &rw_header, &rw_image,
-							   jit_fill_hole);
+							   jit_fill_hole,
+							   bpf_prog_was_classic(prog));
 			if (!header) {
 				prog = orig_prog;
 				goto out_addrs;
diff --git a/include/linux/filter.h b/include/linux/filter.h
index 3c4dd718bece..2469fd2e4015 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -1290,7 +1290,7 @@ void bpf_jit_free(struct bpf_prog *fp);
 struct bpf_binary_header *
 bpf_jit_binary_pack_hdr(const struct bpf_prog *fp);
 
-void *bpf_prog_pack_alloc(u32 size, bpf_jit_fill_hole_t bpf_fill_ill_insns);
+void *bpf_prog_pack_alloc(u32 size, bpf_jit_fill_hole_t bpf_fill_ill_insns, bool was_classic);
 void bpf_prog_pack_free(void *ptr, u32 size);
 
 static inline bool bpf_prog_kallsyms_verify_off(const struct bpf_prog *fp)
@@ -1304,7 +1304,8 @@ bpf_jit_binary_pack_alloc(unsigned int proglen, u8 **ro_image,
 			  unsigned int alignment,
 			  struct bpf_binary_header **rw_hdr,
 			  u8 **rw_image,
-			  bpf_jit_fill_hole_t bpf_fill_ill_insns);
+			  bpf_jit_fill_hole_t bpf_fill_ill_insns,
+			  bool was_classic);
 int bpf_jit_binary_pack_finalize(struct bpf_binary_header *ro_header,
 				 struct bpf_binary_header *rw_header);
 void bpf_jit_binary_pack_free(struct bpf_binary_header *ro_header,
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index a043fccb917e..338a806e25c0 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -924,7 +924,7 @@ static struct bpf_prog_pack *alloc_new_pack(bpf_jit_fill_hole_t bpf_fill_ill_ins
 	return NULL;
 }
 
-void *bpf_prog_pack_alloc(u32 size, bpf_jit_fill_hole_t bpf_fill_ill_insns)
+void *bpf_prog_pack_alloc(u32 size, bpf_jit_fill_hole_t bpf_fill_ill_insns, bool was_classic)
 {
 	unsigned int nbits = BPF_PROG_SIZE_TO_NBITS(size);
 	struct bpf_prog_pack *pack;
@@ -939,7 +939,7 @@ void *bpf_prog_pack_alloc(u32 size, bpf_jit_fill_hole_t bpf_fill_ill_insns)
 		 * safe because cBPF programs (the unprivileged attack surface)
 		 * are bounded well below a pack size.
 		 */
-		if (static_branch_unlikely(&bpf_pred_flush_enabled))
+		if (was_classic && static_branch_unlikely(&bpf_pred_flush_enabled))
 			pr_warn_once("BPF: Predictors not flushed for allocations greater than BPF_PROG_PACK_SIZE\n");
 		size = round_up(size, PAGE_SIZE);
 		ptr = bpf_jit_alloc_exec(size);
@@ -971,7 +971,9 @@ void *bpf_prog_pack_alloc(u32 size, bpf_jit_fill_hole_t bpf_fill_ill_insns)
 	pos = 0;
 
 found_free_area:
-	static_call_cond(bpf_arch_pred_flush)();
+	/* Flush only for cBPF as it may contain a crafted gadget */
+	if (static_branch_unlikely(&bpf_pred_flush_enabled) && was_classic)
+		static_call_cond(bpf_arch_pred_flush)();
 	bitmap_set(pack->bitmap, pos, nbits);
 	ptr = (void *)(pack->ptr) + (pos << BPF_PROG_CHUNK_SHIFT);
 
@@ -1131,7 +1133,8 @@ bpf_jit_binary_pack_alloc(unsigned int proglen, u8 **image_ptr,
 			  unsigned int alignment,
 			  struct bpf_binary_header **rw_header,
 			  u8 **rw_image,
-			  bpf_jit_fill_hole_t bpf_fill_ill_insns)
+			  bpf_jit_fill_hole_t bpf_fill_ill_insns,
+			  bool was_classic)
 {
 	struct bpf_binary_header *ro_header;
 	u32 size, hole, start;
@@ -1144,7 +1147,7 @@ bpf_jit_binary_pack_alloc(unsigned int proglen, u8 **image_ptr,
 
 	if (bpf_jit_charge_modmem(size))
 		return NULL;
-	ro_header = bpf_prog_pack_alloc(size, bpf_fill_ill_insns);
+	ro_header = bpf_prog_pack_alloc(size, bpf_fill_ill_insns, was_classic);
 	if (!ro_header) {
 		bpf_jit_uncharge_modmem(size);
 		return NULL;
diff --git a/kernel/bpf/dispatcher.c b/kernel/bpf/dispatcher.c
index b77db7413f8c..ea2d60dc1fee 100644
--- a/kernel/bpf/dispatcher.c
+++ b/kernel/bpf/dispatcher.c
@@ -145,7 +145,7 @@ void bpf_dispatcher_change_prog(struct bpf_dispatcher *d, struct bpf_prog *from,
 
 	mutex_lock(&d->mutex);
 	if (!d->image) {
-		d->image = bpf_prog_pack_alloc(PAGE_SIZE, bpf_jit_fill_hole_with_zero);
+		d->image = bpf_prog_pack_alloc(PAGE_SIZE, bpf_jit_fill_hole_with_zero, false);
 		if (!d->image)
 			goto out;
 		d->rw_image = bpf_jit_alloc_exec(PAGE_SIZE);

-- 
2.43.0



