Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF213F51416
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 22:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBmD4NXPUsxxTTp0OSGawp+IRgdUVfl5iOS8JR3dK/A=; b=pTzrB/YHVRfxgBnucVsP3OPMRV
	dCTBjJkKUQiyiqa4Kgmm7Nd5ZhhjUlU07+0At1oXwceyC7rxyFXzIM0uzFJxjFtS4CukHSh+yKWta
	VP6us2xikbwjGUNDSyzCu6EUYXXsd+jUKHp+nwqztcPBLJyYvI/uX9+lRIY3EEBX8mcNd6FWAzCUc
	ZaBWDhsGVFHNxMtEkznXR9YYF6yUTSjU6lXwAVGTxuu/K44tezB7GGkDbtQtvN4+S91oaYfbUYO0n
	Bg1iZC3qy0bEQdpfvdz+PIzNj5yYJdFxf8YEttlQFnN+uwoOcGp/4VsQm3PIZ8M7FAc5dRYFcHZYl
	DAtfWGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydQa-00000004ZRJ-1ypX;
	Fri, 06 Mar 2026 22:13:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydQX-00000004ZPu-1fUb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 22:13:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6127175D;
	Fri,  6 Mar 2026 14:13:37 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 69CCA3F7BD;
	Fri,  6 Mar 2026 14:13:41 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	puranjay@kernel.org,
	xukuohai@huaweicloud.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	richardcochran@gmail.com,
	a.s.protopopov@gmail.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 3/3] bpf: arm64: fix BTI exception when execute gotox instruction
Date: Fri,  6 Mar 2026 22:13:30 +0000
Message-Id: <20260306221330.630971-4-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306221330.630971-1-yeoreum.yun@arm.com>
References: <20260306221330.630971-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_141345_524313_89BBD275 
X-CRM114-Status: GOOD (  14.16  )
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

On systems where FEAT_BTI is enabled, running the verifier_gotox testcase
triggers a BTI exception:

  [  257.920598] Internal error: Oops - BTI: 0000000036000003 [#1]  SMP
  [  257.920740] Modules linked in:
  [  257.920860] CPU: 4 UID: 0 PID: 239 Comm: test_progs Not tainted 7.0.0-rc2+ #602 PREEMPT(full)
  [  257.921061] Hardware name:  , BIOS
  [  257.921160] pstate: 161402c09 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=j-)
  [  257.921337] pc : bpf_prog_0a2b4e44c75a3cb4_jump_table_ok+0x40/0x60
  [  257.921491] lr : bpf_test_run+0x1e8/0x460
  [  257.921639] sp : ffff80008435b7f0
  [  257.921736] x29: ffff80008435b800 x28: ffff80008435b858 x27: ffff80008435b870
  [  257.921991] x26: ffff80008435b7f0 x25: f8ff000803478000 x24: 0000000000000001
  [  257.922243] x23: f0ff8000839bd000 x22: f4ff000801f7f200 x21: ffff80008435b9a4
  [  257.922498] x20: ffff80008435b9a0 x19: 0000000000000000 x18: 0000000000000000
  [  257.922743] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
  [  257.922992] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
  [  257.923232] x11: 000000000000dd86 x10: 0000000000000000 x9 : ffff8000814f06f0
  [  257.923480] x8 : ffff800083d9d888 x7 : ffff800083d9d8c8 x6 : 0000000000000000
  [  257.923731] x5 : 0000000000000000 x4 : ffff80008435b9a0 x3 : 0000000000000000
  [  257.923976] x2 : 0000000000000000 x1 : f0ff8000839bd060 x0 : f4ff000801f7f200
  [  257.924226] Call trace:
  [  257.924307]  bpf_prog_0a2b4e44c75a3cb4_jump_table_ok+0x40/0x60 (P)
  [  257.924481]  bpf_test_run+0x1e8/0x460
  [  257.924644]  bpf_prog_test_run_skb+0x424/0x708
  [  257.924820]  bpf_prog_test_run+0xf4/0x218
  [  257.924978]  __sys_bpf+0x3c4/0x498
  [  257.925124]  __arm64_sys_bpf+0x30/0x58
  [  257.925312]  invoke_syscall+0x68/0xe8
  [  257.925490]  el0_svc_common+0x94/0xf8
  [  257.925668]  do_el0_svc+0x28/0x48
  [  257.925840]  el0_svc+0x40/0x100
  [  257.925998]  el0t_64_sync_handler+0x84/0x140
  [  257.926172]  el0t_64_sync+0x1bc/0x1c0
  [  257.926359] Code: f28bea07 910020e7 f94000e7 d61f00e0 (d2800027)
  [  257.926489] ---[ end trace 0000000000000000 ]---
  [  257.926612] Kernel panic - not syncing: Oops - BTI: Fatal exception in interrupt
  [  257.926755] SMP: stopping secondary CPUs
  [  257.927208] Kernel Offset: disabled
  [  257.927300] CPU features: 0x0000000,00040f05,dffb65e1,976ff727
  [  257.927437] Memory Limit: none
  [  257.927540] ---[ end Kernel panic - not syncing: Oops - BTI: Fatal exception in interrupt ]---

This occurs because the target of the gotox instruction
(BPF_JMP | BPF_JA | BPF_X) does not begin with a BTI instruction.

To fix this, emit a BTI J instruction at the beginning of
the gotox destination block.

after this patch verifier_gotox passes without exception:

  # ./test_progs -a verifier_gotox
  ...
  #540/1   verifier_gotox/jump_table_ok:OK
  #540/2   verifier_gotox/jump_table_reserved_field_src_reg:OK
  #540/3   verifier_gotox/jump_table_reserved_field_non_zero_off:OK
  #540/4   verifier_gotox/jump_table_reserved_field_non_zero_imm:OK
  #540/5   verifier_gotox/jump_table_no_jump_table:OK
  #540/6   verifier_gotox/jump_table_incorrect_dst_reg_type:OK
  #540/7   verifier_gotox/jump_table_invalid_read_size_u32:OK
  #540/8   verifier_gotox/jump_table_invalid_read_size_u16:OK
  #540/9   verifier_gotox/jump_table_invalid_read_size_u8:OK
  #540/10  verifier_gotox/jump_table_misaligned_access:OK
  #540/11  verifier_gotox/jump_table_invalid_mem_acceess_pos:OK
  #540/12  verifier_gotox/jump_table_invalid_mem_acceess_neg:OK
  #540/13  verifier_gotox/jump_table_add_sub_ok:OK
  #540/14  verifier_gotox/jump_table_no_writes:OK
  #540/15  verifier_gotox/jump_table_use_reg_r0:OK
  #540/16  verifier_gotox/jump_table_use_reg_r1:OK
  #540/17  verifier_gotox/jump_table_use_reg_r2:OK
  #540/18  verifier_gotox/jump_table_use_reg_r3:OK
  #540/19  verifier_gotox/jump_table_use_reg_r4:OK
  #540/20  verifier_gotox/jump_table_use_reg_r5:OK
  #540/21  verifier_gotox/jump_table_use_reg_r6:OK
  #540/22  verifier_gotox/jump_table_use_reg_r7:OK
  #540/23  verifier_gotox/jump_table_use_reg_r8:OK
  #540/24  verifier_gotox/jump_table_use_reg_r9:OK
  #540/25  verifier_gotox/jump_table_outside_subprog:OK
  #540/26  verifier_gotox/jump_table_contains_non_unique_values:OK
  #540     verifier_gotox:OK

Fixes: f4a66cf1cb14 ("bpf: arm64: Add support for indirect jumps")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/net/bpf_jit_comp.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index adf84962d579..e54e45b35015 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1223,6 +1223,21 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 	int off_adj;
 	int ret;
 	bool sign_extend;
+	struct bpf_prog_aux *aux = ctx->prog->aux;
+
+	/*
+	 * In some cases, insn_aux_data is not passed,
+	 * and it does not need to be. For example, the embedded
+	 * program in ptp_classifier_init().
+	 * Therefore, we need to check whether insn_aux_data is present.
+	 */
+	if (aux->insn_aux_data) {
+		/*
+		 * emit BTI J for (BPF_JMP | BPF_X)'s destination.
+		 */
+		if (aux->insn_aux_data[i].gotox_point)
+			emit_bti(A64_BTI_J, ctx);
+	}
 
 	switch (code) {
 	/* dst = src */
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


