Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689AFE9A779
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 11:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XVfIz4hkdoymTquMjXHanjSruiJ69GdhvzHvsOMtTyY=; b=dnLyLZSdfWv52EAsChogjPVmOM
	cdha6KaJUJrsjO1di2xOBYLP9MK97IQJE8jxLGADgTIseaELwaFjIdoyN+2antJr0oIOCgGXgpOit
	zP2ynYyy+4HTD2lxole12JG5z9VCSRvnllmveJf4KdNWEA9VqKtDZI/XsuShIgZ2XtwO42vbuP1x6
	o6waNKnRrwHr7eAQo9+FD5XxpXFPpvFePmGy7V8KOaOwScDzHbQjtf5FkfIJRmV434Pd7IOopS7Ih
	MgxUWN7kTPPcK2Fh0k7YJnqFhIEPt8yZkWIWWkP+8CSGNO0tJz1DrC8DHPVoNaRqhqMvYn3Iu9SzA
	CrBKlR2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Ld-00000001K35-2kRh;
	Tue, 24 Mar 2026 11:55:01 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50LU-00000001Jyi-3vkS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 11:54:55 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fg7jk1947zKHML1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 19:54:02 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 38D1B40591
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 19:54:39 +0800 (CST)
Received: from k01.k01 (unknown [10.67.174.197])
	by APP1 (Coremail) with SMTP id cCh0CgAXGdl7e8Jpv2M5CA--.508S2;
	Tue, 24 Mar 2026 19:54:36 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
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
Subject: [PATCH bpf-next v10 0/5] emit ENDBR/BTI instructions for indirect jump targets
Date: Tue, 24 Mar 2026 20:20:47 +0800
Message-ID: <20260324122052.342751-1-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgAXGdl7e8Jpv2M5CA--.508S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuryrZF47Ar17Kr15Zw48tFb_yoWrtr4DpF
	s3Zw13ur4vgr4fXr1fJa18Gryaqw4rJ3W7ZF13K3yfA3WY9rnruF4Sgw4FvF98Ary0k34Y
	qr4a9rykG34DX37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAa
	w2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a
	6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUIF4iUUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_045453_343368_BA47CC85 
X-CRM114-Status: GOOD (  11.64  )
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
in env->insn_aux_data and pass it to the JIT as new parameter, so the JIT
knows which instructions are indirect jump targets.

During JIT, constants blinding is performed. It rewrites the private copy
of instructions for the JITed program, but it does not adjust the global
env->insn_aux_data array. As a result, after constants blinding, the
instruction indexes used by JIT may no longer match the indexes in
env->insn_aux_data, so the JIT can not lookup env->insn_aux_data directly.

To avoid this mismatch, and considering that all existing arch-specific JITs
already implement constants blinding with largely duplicated code, move
constants blinding from JIT to generic code.

v10:
- Fix the incorrect call_imm restore in jit_subprogs 
- Define a dummy void version of bpf_jit_prog_release_other and
  bpf_patch_insn_data when the corresponding config is not set
- Remove the unnecessary #ifdef in x86_64 JIT (Leon Hwang)

v9: https://lore.kernel.org/bpf/20260312170255.3427799-1-xukuohai@huaweicloud.com/
- Make constant blinding available for classic bpf (Eduard)
- Clear prog->bpf_func, prog->jited ... on the error path of extra pass (Eduard)
- Fix spelling errors and remove unused parameter (Anton Protopopov)

v8: https://lore.kernel.org/bpf/20260309140044.2652538-1-xukuohai@huaweicloud.com/
- Define void bpf_jit_blind_constants() function when CONFIG_BPF_JIT is not set 
- Move indirect_target fixup for insn patching from bpf_jit_blind_constants()
  to adjust_insn_aux_data()

v7: https://lore.kernel.org/bpf/20260307103949.2340104-1-xukuohai@huaweicloud.com
- Move constants blinding logic back to bpf/core.c
- Compute ip address before switch statement in x86 JIT
- Clear JIT state from error path on arm64 and loongarch 

v6: https://lore.kernel.org/bpf/20260306102329.2056216-1-xukuohai@huaweicloud.com/
- Move constants blinding from JIT to verifier
- Move call to bpf_prog_select_runtime from bpf_prog_load to verifier

v5: https://lore.kernel.org/bpf/20260302102726.1126019-1-xukuohai@huaweicloud.com/
- Switch to pass env to JIT directly to get rid of copying private insn_aux_data for
  each prog

v4: https://lore.kernel.org/all/20260114093914.2403982-1-xukuohai@huaweicloud.com/
- Switch to the approach proposed by Eduard, using insn_aux_data to identify indirect
  jump targets, and emit ENDBR on x86

v3: https://lore.kernel.org/bpf/20251227081033.240336-1-xukuohai@huaweicloud.com/
- Get rid of unnecessary enum definition (Yonghong Song, Anton Protopopov)

v2: https://lore.kernel.org/bpf/20251223085447.139301-1-xukuohai@huaweicloud.com/
- Exclude instruction arrays not used for indirect jumps (Anton Protopopov)

v1: https://lore.kernel.org/bpf/20251127140318.3944249-1-xukuohai@huaweicloud.com/

Xu Kuohai (5):
  bpf: Move constants blinding out of arch-specific JITs
  bpf: Pass bpf_verifier_env to JIT
  bpf: Add helper to detect indirect jump targets
  bpf, x86: Emit ENDBR for indirect jump targets
  bpf, arm64: Emit BTI for indirect jump target

 arch/arc/net/bpf_jit_core.c      |  41 ++++-------
 arch/arm/net/bpf_jit_32.c        |  43 +++--------
 arch/arm64/net/bpf_jit_comp.c    |  87 ++++++++---------------
 arch/loongarch/net/bpf_jit.c     |  61 +++++-----------
 arch/mips/net/bpf_jit_comp.c     |  22 +-----
 arch/parisc/net/bpf_jit_core.c   |  75 ++++++++------------
 arch/powerpc/net/bpf_jit_comp.c  |  70 +++++++-----------
 arch/riscv/net/bpf_jit_core.c    |  63 ++++++-----------
 arch/s390/net/bpf_jit_comp.c     |  61 ++++++----------
 arch/sparc/net/bpf_jit_comp_64.c |  63 ++++++-----------
 arch/x86/net/bpf_jit_comp.c      |  73 ++++++-------------
 arch/x86/net/bpf_jit_comp32.c    |  35 ++-------
 include/linux/bpf.h              |   2 +
 include/linux/bpf_verifier.h     |   9 +--
 include/linux/filter.h           |  27 ++++++-
 kernel/bpf/core.c                | 118 +++++++++++++++++++++----------
 kernel/bpf/syscall.c             |   4 --
 kernel/bpf/verifier.c            |  79 +++++++++++++++------
 18 files changed, 392 insertions(+), 541 deletions(-)

-- 
2.47.3


