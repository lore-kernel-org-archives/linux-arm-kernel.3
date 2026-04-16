Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CEDF88092
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 07:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7gUuPybTTmA941iE/vuyOunYlg/kFNuORoheUm9jbzk=; b=qbybbM3IMYebuF/FI2DUCk+mpR
	JszTtJa3H//kh7+0KImieuW/t+AUIwA0L7Z8paaI7iSpRbkFMeIWvY3BzvfSAfiBuHhAgWghndjvJ
	+IEmKD2KKCjAaXB6bcjbwNCzBkwDaMBXTd6PRSSqsdggByRHap4tq3IBx2CROoa9kCbjA+U7NDC1F
	oJk8zFu6hIgeiuSoJg4XN6+N/1zY1hutTv9VmPbAL0sTRJjtr5C6nWC3hMJzSrPlnV3srwSrPO+eF
	980jv2EoIn22vvLQzhoWaNqoXwnOGs7IMdW3cQEPyDiSvCQjXqZ4JHB+bg/dPrKo+z6ryTL/4HkyV
	M1Qa3TAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGn8-000000025Zq-17xo;
	Thu, 16 Apr 2026 07:05:34 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGn3-000000025Ws-2ykP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 07:05:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fx8Ch1b2SzKHMSF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 15:05:04 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 1F65E4056E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 15:05:15 +0800 (CST)
Received: from localhost.huawei.com (unknown [10.67.174.243])
	by APP1 (Coremail) with SMTP id cCh0CgDHawYniuBpdFBbAg--.51915S2;
	Thu, 16 Apr 2026 15:05:12 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Shahab Vahedi <list+bpf@vahedi.org>,
	Russell King <linux@armlinux.org.uk>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Johan Almbladh <johan.almbladh@anyfinetworks.com>,
	Paul Burton <paulburton@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Wang YanQing <udknight@gmail.com>
Subject: [PATCH bpf v15 0/5] emit ENDBR/BTI instructions for indirect
Date: Thu, 16 Apr 2026 06:43:36 +0000
Message-ID: <20260416064341.151802-1-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgDHawYniuBpdFBbAg--.51915S2
X-Coremail-Antispam: 1UD129KBjvJXoW3AF43Kr4xCF1DAr17Cr4DArb_yoW7tF1rpF
	4fZw1a9r4DKr4fXr4xAF4xGrWaqw4rJ3W7Zr13K3yfC3WY9Fn7uF4S9w4ruF98Zry0k34Y
	qr4a9rn5u34DX37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0E
	n4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8
	ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU04xRDUUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_000530_113067_0A37937C 
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

On architectures with CFI protection enabled that require landing pad
instructions at indirect jump targets, such as x86 with CET/IBT enabled
and arm64 with BTI enabled, kernel panics when an indirect jump lands on
a target without landing pad. Therefore, the JIT must emit landing pad
instructions for indirect jump targets.

The verifier already recognizes which instructions are indirect jump
targets during the verification phase. So we can store this information
in env->insn_aux_data and pass it to the JIT as new parameter, allowing
the JIT to consult env->insn_aux_data to determine which instructions are
indirect jump targets.

During JIT, constants blinding is performed. It rewrites the private copy
of instructions for the JITed program, but it does not adjust the global
env->insn_aux_data array. As a result, after constants blinding, the
instruction indexes used by JIT may no longer match the indexes in
env->insn_aux_data, so the JIT can not use env->insn_aux_data directly.

To avoid this mismatch, and given that all existing arch-specific JITs
already implement constants blinding with largely duplicated code, move
constants blinding from JIT to generic code.

v15:
- Rebase and target bpf tree
- Resotre subprog_start of the fake 'exit' subprog on failure
- Fix wrong function name used in comment

v14: https://lore.kernel.org/all/cover.1776062885.git.xukuohai@hotmail.com/
- Rebase
- Fix comment style
- Fix incorrect variable and function name used in commit message

v13: https://lore.kernel.org/bpf/20260411133847.1042658-1-xukuohai@huaweicloud.com
- Use vmalloc to allocate memory for insn_aux_data copies to match with vfree
- Do not free the copied memory of insn_aux_data when restoring from failure
- Code cleanup

v12: https://lore.kernel.org/bpf/20260403132811.753894-1-xukuohai@huaweicloud.com
- Restore env->insn_aux_data on JIT failure
- Fix incorrect error code sign (-EFAULT vs EFAULT)
- Fix incorrect prog used in the restore path

v11: https://lore.kernel.org/bpf/20260403090915.473493-1-xukuohai@huaweicloud.com
- Restore env->subprog_info after jit_subprogs() fails
- Clear prog->jit_requested and prog->blinding_requested on failure
- Use the actual env->insn_aux_data size in clear_insn_aux_data() on failure 

v10: https://lore.kernel.org/bpf/20260324122052.342751-1-xukuohai@huaweicloud.com
- Fix the incorrect call_imm restore in jit_subprogs 
- Define a dummy void version of bpf_jit_prog_release_other and
  bpf_patch_insn_data when the corresponding config is not set
- Remove the unnecessary #ifdef in x86_64 JIT (Leon Hwang)

v9: https://lore.kernel.org/bpf/20260312170255.3427799-1-xukuohai@huaweicloud.com
- Make constant blinding available for classic bpf (Eduard)
- Clear prog->bpf_func, prog->jited ... on the error path of extra pass (Eduard)
- Fix spelling errors and remove unused parameter (Anton Protopopov)

v8: https://lore.kernel.org/bpf/20260309140044.2652538-1-xukuohai@huaweicloud.com
- Define void bpf_jit_blind_constants() function when CONFIG_BPF_JIT is not set 
- Move indirect_target fixup for insn patching from bpf_jit_blind_constants()
  to adjust_insn_aux_data()

v7: https://lore.kernel.org/bpf/20260307103949.2340104-1-xukuohai@huaweicloud.com
- Move constants blinding logic back to bpf/core.c
- Compute ip address before switch statement in x86 JIT
- Clear JIT state from error path on arm64 and loongarch 

v6: https://lore.kernel.org/bpf/20260306102329.2056216-1-xukuohai@huaweicloud.com
- Move constants blinding from JIT to verifier
- Move call to bpf_prog_select_runtime from bpf_prog_load to verifier

v5: https://lore.kernel.org/bpf/20260302102726.1126019-1-xukuohai@huaweicloud.com
- Switch to pass env to JIT directly to get rid of copying private insn_aux_data for
  each prog

v4: https://lore.kernel.org/all/20260114093914.2403982-1-xukuohai@huaweicloud.com
- Switch to the approach proposed by Eduard, using insn_aux_data to identify indirect
  jump targets, and emit ENDBR on x86

v3: https://lore.kernel.org/bpf/20251227081033.240336-1-xukuohai@huaweicloud.com
- Get rid of unnecessary enum definition (Yonghong Song, Anton Protopopov)

v2: https://lore.kernel.org/bpf/20251223085447.139301-1-xukuohai@huaweicloud.com
- Exclude instruction arrays not used for indirect jumps (Anton Protopopov)

v1: https://lore.kernel.org/bpf/20251127140318.3944249-1-xukuohai@huaweicloud.com

Xu Kuohai (5):
  bpf: Move constants blinding out of arch-specific JITs
  bpf: Pass bpf_verifier_env to JIT
  bpf: Add helper to detect indirect jump targets
  bpf, x86: Emit ENDBR for indirect jump targets
  bpf, arm64: Emit BTI for indirect jump target

 arch/arc/net/bpf_jit_core.c      |  41 +++-----
 arch/arm/net/bpf_jit_32.c        |  43 ++------
 arch/arm64/net/bpf_jit_comp.c    |  87 ++++++-----------
 arch/loongarch/net/bpf_jit.c     |  61 ++++--------
 arch/mips/net/bpf_jit_comp.c     |  22 +----
 arch/parisc/net/bpf_jit_core.c   |  75 ++++++--------
 arch/powerpc/net/bpf_jit_comp.c  |  74 ++++++--------
 arch/riscv/net/bpf_jit_core.c    |  63 +++++-------
 arch/s390/net/bpf_jit_comp.c     |  61 ++++--------
 arch/sparc/net/bpf_jit_comp_64.c |  63 +++++-------
 arch/x86/net/bpf_jit_comp.c      |  73 +++++---------
 arch/x86/net/bpf_jit_comp32.c    |  35 +------
 include/linux/bpf.h              |   2 +
 include/linux/bpf_verifier.h     |   9 +-
 include/linux/filter.h           |  50 +++++++++-
 kernel/bpf/core.c                | 138 ++++++++++++++++++--------
 kernel/bpf/fixups.c              | 162 ++++++++++++++++++++++++++-----
 kernel/bpf/syscall.c             |   4 -
 kernel/bpf/verifier.c            |  21 ++--
 19 files changed, 529 insertions(+), 555 deletions(-)

-- 
2.43.0


