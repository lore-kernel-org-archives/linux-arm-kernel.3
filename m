Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88327C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njwl1pkRhI2somYbNv1bO155KHdaZIQ/hPytERdf23g=; b=DA08dwPxizHbEfMABkla8rWABO
	vvYB5ScV4JBUjzhFtMYUj9xhqR4TRsN0haDSHmj6Y5G4mrscgUA29cBTTUj2PVp6SdCFAZOrK6NL4
	HqYPRWD2MrMG3tSB5K+UUKdMywsjf1hcgCcmqiiWtHCLWG2CdI/jOSGa+P9qzL35YVGKZZf8ooCzw
	a0tpv7WGmwwvtDl48dc6iGscLEsXi0svd3+aQTj2H7gf4D2BLcGoFqzEL5BUyBrgcddPp12HjGw/n
	Ai6u+H1FtjflW0tRns5DSTpnbOBaYX3aSSLd4uwVejTah0wXdMsM1sy13lycCLMBW3INVWWGh5faN
	6kvpu2IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGN7-00000007eaL-1JH7;
	Tue, 18 Aug 2026 09:44:41 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGMw-00000007eRa-0dBA;
	Tue, 18 Aug 2026 09:44:31 +0000
X-UUID: 5ed1fb5c9ae911f19a56ed5b684f684d-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:092295e3-ad9c-4ed1-9bcc-d9d7a112fa11,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:ca29938179fec3bad5841664eac11a86,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5ed1fb5c9ae911f19a56ed5b684f684d-20260818
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1358875150; Tue, 18 Aug 2026 17:44:13 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: linux-riscv@lists.infradead.org
Cc: atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v2 1/2] perf: RISC-V: use BIT_ULL for u64 overflow masks
Date: Tue, 18 Aug 2026 17:10:00 +0800
Message-ID: <prpmask01bitul.v2.1786434000.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.v2.1786434000.git.liuxixin@kylinos.cn>
References: <cover.1786092600.git.liuxixin@kylinos.cn> <cover.v2.1786434000.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_024430_519839_035B60E2 
X-CRM114-Status: GOOD (  10.73  )
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

Fixes: a8625217a054 ("drivers/perf: riscv: Implement SBI PMU snapshot function")
Assisted-by: DeepSeek:deepseek-v3
Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/perf/riscv_pmu_sbi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -913,7 +913,7 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
 	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
 
 	for_each_set_bit(idx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS) {
-		if (ctr_ovf_mask & BIT(idx)) {
+		if (ctr_ovf_mask & BIT_ULL(idx)) {
 			event = cpu_hw_evt->events[idx];
 			hwc = &event->hw;
 			max_period = riscv_pmu_ctr_get_width_mask(event);
@@ -1020,14 +1020,14 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 			hidx = info->csr - CSR_CYCLE;
 
 		/* check if the corresponding bit is set in sscountovf or overflow mask in shmem */
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

-- 
2.43.0


