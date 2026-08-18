Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5C5C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ieTc8zqPFtmFNNjhBMlJd/5jle3qn0pe0b/QCQdWow=; b=fU839V6dfg+7Tzw2dI3ui2FyF5
	cb1c8AGQuAgG9ptMw0CrKBfmCjXD17p1oqNF8eWGz/WytaHC80gcr2pMKzX08H1nV8OvrzQVlk0rG
	1P8i0K5RR3bKqYLJPD5+18lbA192WAlhJG/Ehw2lG7g442Zrp0L8ThRwlJkC3tk4NVukDoKUv4fCA
	3gEHZGip2CkiPKvlFGOJGcPiwi+MVGR89kikT8Qy94hGC7L1NwvdAqkV4EJ4JydhmBAsTIAmylkki
	bdut38//wgtUStaplF72x/koRUIi6IFdvoDYsc4QlSGYjY0tqENFBVVAJEtC/zBWJxqlcE6ztsxL+
	Y5wOP7Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGMp-00000007eS6-2vem;
	Tue, 18 Aug 2026 09:44:23 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGMn-00000007eRZ-2GYd;
	Tue, 18 Aug 2026 09:44:22 +0000
X-UUID: 5d1545b29ae911f19a56ed5b684f684d-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:5e3649a9-619a-4f11-998c-1d6a987acbfb,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:7da53ff264321fd8d04a5d2fc576adea,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5d1545b29ae911f19a56ed5b684f684d-20260818
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 288946168; Tue, 18 Aug 2026 17:44:10 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: linux-riscv@lists.infradead.org
Cc: atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v2 0/2] perf: RISC-V: fix SBI PMU masks for RV32
Date: Tue, 18 Aug 2026 17:10:00 +0800
Message-ID: <cover.v2.1786434000.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.1786092600.git.liuxixin@kylinos.cn>
References: <cover.1786092600.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_024421_889476_222D5DB8 
X-CRM114-Status: UNSURE (   7.47  )
X-CRM114-Notice: Please train this message.
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

Hi,

Thanks for the review, Paul.

v2 for 1/2: add Fixes and Assisted-by. Overflow masks are u64. On RV32
an unsigned-long bit at index 32 is 0, and BIT_ULL at index 32 is
0x100000000.

v2 for 2/2: same as v1, but do not pass only the first bitmap word into
CFG_MATCH. Walk each word like the stop-all path, with the counter base
set to i times BITS_PER_LONG. Share one helper for the 32-bit argument
split. Also add Fixes and Assisted-by.

Tested on qemu-system-riscv32 with CONFIG_ARCH_RV32I=y: 34 counters,
second word 0x7, CFG_MATCH retried at base 32 when the first word fails.
qemu-system-riscv64 still uses one word. A legacy-only RV32 kernel sets
cycle and instret bits and opens a cycles event. Overflow IRQ was not
taken on this QEMU virt guest, because sscof was not available to Linux.

Thanks,
Xixin Liu

---

Xixin Liu (2):
  perf: RISC-V: use BIT_ULL for u64 overflow masks
  perf: RISC-V: store available counter mask as bitmap

 drivers/perf/riscv_pmu_legacy.c |  5 ++-
 drivers/perf/riscv_pmu_sbi.c    | 88 ++++++++++++++++++++++++++++------------
 include/linux/perf/riscv_pmu.h  |  2 +-
 3 files changed, 66 insertions(+), 29 deletions(-)

-- 
2.43.0


