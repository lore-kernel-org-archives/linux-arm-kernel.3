Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9D6C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwmNBtizRFJEpegbDQ4apOqpVc0Y+aqos+q+rN35xLI=; b=SptFq/9Sb5c8fO4IoQ8RgKz2r+
	K4zk7uHvkjdNforNgZN2XxXiAiii97r3Pc9Qb3PPW1BCGpTHFA6fMcepqF4Q4lynOgWrXHfKFAFgS
	QQtqhRt/1mWc1p3YnTHdwyAYY85hvlpRK25o9MzvEDZ2ty8g0o53ypGuuuik7v6W/Wt10dJSsZWhv
	ifqap83NfNHchBKr5zVt3ElkRpnqAewTyRBd8ZgxPqkrsrc94Qidcs46s7gdBZ59qdfXWHtCOUBgO
	IDloTOucEuNyzMQhET3l79nQQyCTmof+is2MjDLsNPB3LFWgNKLmXO81OabEUJDYlQL9y4pu4AZKa
	xwfj6EhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGNu-00000007T67-2hiT;
	Fri, 07 Aug 2026 08:56:58 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGNr-00000007T5D-2x8m;
	Fri, 07 Aug 2026 08:56:57 +0000
X-UUID: ed0d6dca923d11f1aa26b74ffac11d73-20260807
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1adf90be-9f8f-4d82-875a-954d73fa9df5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:6f955b953f9425a81cb56d0c364a5a04,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ed0d6dca923d11f1aa26b74ffac11d73-20260807
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1557473672; Fri, 07 Aug 2026 16:56:49 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: linux-riscv@lists.infradead.org
Cc: atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v1 1/2] perf: RISC-V: use BIT_ULL for u64 overflow masks
Date: Fri, 07 Aug 2026 16:50:00 +0800
Message-ID: <prpmask01bitul.1786092600.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.1786092600.git.liuxixin@kylinos.cn>
References: <cover.1786092600.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_015656_037462_011F9658 
X-CRM114-Status: GOOD (  11.19  )
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

Overflow status and restart masks are u64, but bits were built with
BIT(). On RV32 that is an unsigned long shift, so indices >= 32 truncate
or wrap and corrupt the mask.

Use BIT_ULL() for those u64 bitops.

Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/perf/riscv_pmu_sbi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index dfc886dee..93a31d5d5 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1002,7 +1002,7 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
 	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
 
 	for_each_set_bit(idx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS) {
-		if (ctr_ovf_mask & BIT(idx)) {
+		if (ctr_ovf_mask & BIT_ULL(idx)) {
 			event = cpu_hw_evt->events[idx];
 			hwc = &event->hw;
 			max_period = riscv_pmu_ctr_get_width_mask(event);
@@ -1109,14 +1109,14 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
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


