Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BEAC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 14:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bKyeJkIVmCWyj53saLMAZloYbQt1nChY5+/rBnDqtnQ=; b=b1Wn0IjVVWLjh1Q62J5PKi9J9t
	7rFqP/JqXQYzn5YDuf2eztKi9wPf2Lko2VV/1dWxIPwGPTbqbUAA6/5waH3O1h/nbVHFroMcq3tgY
	eoOHooLron0KY5mODkPrPdewe3s3ldh/A5Mc36N7gqtjI/9XzheS8xUuRsCmCgS+hK1ZVoGdWIo7K
	MHFi5fEEARVD3f3I0p3HkqnHTogPhK/og8IYE7EoIfwffSWTUVqEQGrTj7w+Yx7DdaBOU0becJ7lc
	iMvl8aLBM8ylxGQZZSBLJ8LD79aPo/tQuI3jdihQp1UqUNhL1LiLJq/Mjp7OcPWguE5NefVBFOi3B
	Kefu+f4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxSg-00000005y4j-1iFG;
	Fri, 28 Aug 2026 14:21:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxSe-00000005y4U-22Vo;
	Fri, 28 Aug 2026 14:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=bKyeJkIVmCWyj53saLMAZloYbQt1nChY5+/rBnDqtnQ=; b=nMMsKDPCRE4ioXtthodfJfBui1
	8UGX3ZmrYAryGZkKwwo222fvG2ppgTWCT9J5tPqXSoJbUlVcxepgO+ioheDLR9+EU6fuLTqaMPyVF
	ehJCXe6QnWQPpd7ruGgyt6rkuQbBrvLrU0sbFKKSCUSOePwKcTmHw/Ee+FBTXOjTUHvvTs8M7LVbQ
	MK+UnTJcvvjSxqRQJedkc5o/lJE6+L0eTobf1r5X42Rv8/KNA3g8CEk0/MuVBUcFoXjG8pETglO6T
	nUtxWGGVjaXhHVLnSHfRj1Gp/sXOpZVDEEUnUOm6qf1jOIhuJjHN7sm0ua8+g6I9V/N1dDaML6XM9
	2WGQ60Hw==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wzxSb-00000008JZd-0UZP;
	Fri, 28 Aug 2026 14:21:39 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAD3zfFhmZFqhFnABg--.44541S2;
	Fri, 28 Aug 2026 22:21:22 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Atish Patra <atish.patra@linux.dev>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] perf: riscv: fix PMU overflow counter restart state
Date: Fri, 28 Aug 2026 22:21:18 +0800
Message-ID: <20260828142120.12616-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD3zfFhmZFqhFnABg--.44541S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFWDuF1fGw17XrWruFW8Crg_yoWrJr43pr
	W0kFW5trs5Xw4Ivas5Ja1kGa45Gws3JFZxKF1qkr1vkFy3tF15X3WkKr1ftr15JrWrWryj
	vF4Y9FWruF4jv37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUqeHgUUUUU=
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_152137_706706_6ABD1A48 
X-CRM114-Status: GOOD (  15.05  )
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

The PMU overflow handler keeps a 64-bit mask for all logical counters,
while SBI start calls consume an XLEN-sized mask relative to a counter
base.

On RV32, pmu_sbi_start_ovf_ctrs_sbi() applies the low overflow-mask word
to every used-counter word. Counters 32 through 63 can therefore be
classified using overflow bits 0 through 31.

The snapshot path and overflow handler also test and construct 64-bit
masks with XLEN-sized BIT(). In addition, snapshot restart uses the
completed inner-loop index instead of the outer word index to form
counter_idx_base. The latter selects an invalid counter base on both RV32
and RV64: for_each_set_bit() finishes with idx equal to BITS_PER_LONG, so
the current expression passes BITS_PER_LONG squared instead of the
expected i times BITS_PER_LONG.

Select the overflow word matching each SBI mask, use 64-bit bit operations
for global counter indices, and derive the snapshot start base from the
outer word index.

Fixes: b994cdfcdf7b ("drivers/perf: riscv: Fix counter mask iteration for RV32")
Fixes: a8625217a054 ("drivers/perf: riscv: Implement SBI PMU snapshot function")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/perf/riscv_pmu_sbi.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 50220f7b46d9..6cfb1fc0ec6e 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -962,7 +962,9 @@ static inline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
 	u64 init_val = 0;
 
 	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
-		ctr_start_mask = cpu_hw_evt->used_hw_ctrs[i] & ~ctr_ovf_mask;
+		unsigned long word_ovf_mask =
+			ctr_ovf_mask >> (i * BITS_PER_LONG);
+		ctr_start_mask = cpu_hw_evt->used_hw_ctrs[i] & ~word_ovf_mask;
 		/* Start all the counters that did not overflow in a single shot */
 		if (ctr_start_mask) {
 			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG,
@@ -1002,7 +1004,7 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
 	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
 
 	for_each_set_bit(idx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS) {
-		if (ctr_ovf_mask & BIT(idx)) {
+		if (ctr_ovf_mask & BIT_ULL(idx)) {
 			event = cpu_hw_evt->events[idx];
 			hwc = &event->hw;
 			max_period = riscv_pmu_ctr_get_width_mask(event);
@@ -1021,7 +1023,7 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
 			sdata->ctr_values[idx] =
 					cpu_hw_evt->snapshot_cval_shcopy[idx + i * BITS_PER_LONG];
 		/* Start all the counters in a single shot */
-		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx * BITS_PER_LONG,
+		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG,
 			  cpu_hw_evt->used_hw_ctrs[i], flag, 0, 0, 0);
 	}
 }
@@ -1109,14 +1111,14 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 			hidx = info->csr - CSR_CYCLE;
 
 		/* check if the corresponding bit is set in scountovf or overflow mask in shmem */
-		if (!(overflow & BIT(hidx)))
+		if (!(overflow & BIT_ULL(hidx)))
 			continue;
 
 		/*
 		 * Keep a track of overflowed counters so that they can be started
 		 * with updated initial value.
 		 */
-		overflowed_ctrs |= BIT(lidx);
+		overflowed_ctrs |= BIT_ULL(lidx);
 		hw_evt = &event->hw;
 		/* Update the event states here so that we know the state while reading */
 		hw_evt->state |= PERF_HES_STOPPED;

base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
-- 
2.43.0


