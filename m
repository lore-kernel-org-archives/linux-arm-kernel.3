Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D9FC79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 04:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UWVKgjlpVvo+EoPOXvCFd6amsMMPLnh3+oXB0HxW/2I=; b=cqeaP+SnhClLSWhv7MNcXa8MX6
	Bz/q4B9h7IIC55eC6zfZ1URgI/vOHw9BHCYOwo4A35ggu+9NELvLtG52SD22ehQusW+KwGmWPy9wA
	TUPkv27r82sJdZC2A+f6gMVLf5UksdEgMlOJYH9uqU8swRGG0vSChqySRjySLlnlrniAUZNMUvZl6
	MBUW7aI9Kkk7JYEbCyrhDycurMuYynncdqFYXmheK98FY2pxG5JbRioycWn6USzKbhtAuTMJZomk+
	TZBrYBnfXQmD5CQba6bpwJoUsbGyMOdLd/milUsiOUhascLDrPIyxFTJGXM4HdYovYyuIGg/5HFRK
	plCsWKGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x34Vk-00000004gCp-1ykc;
	Sun, 06 Sep 2026 04:29:44 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x34Vg-00000004gCM-3DFX;
	Sun, 06 Sep 2026 04:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=UWVKgjlpVvo+EoPOXvCFd6amsMMPLnh3+oXB0HxW/2I=;
	b=HJKyoCj+XA9m0I+UsFXeya5l9M5/x6UxV8Kgv6YUvxpe7UrSObDDTKYKxIrjfb
	+MdvBjxzcKrSYjMnrYX2WMs17tE9sT20PM11Q08RmXL5pb187JLinol7k/t+3yQQ
	0RMq/d5mjH21lI3OUnQ5eGbNJ/0aPICrVyrCk7PRffui8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCnYyDh65xqP0cBQQ--.256S2;
	Sun, 06 Sep 2026 12:28:19 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] perf/riscv: clear snapshot setup state when a CPU goes offline
Date: Sun,  6 Sep 2026 12:28:14 +0800
Message-ID: <caplitmus-rv.75b0e9ee82984422ba17d833767912a8.d33@163.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgCnYyDh65xqP0cBQQ--.256S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tryfGw4UXw15ur47ZFWxXrb_yoW8Zr47pr
	4fCayYkF4FvF10q348AF48XFyrArs3W39rtr98CwnxZ3W3AF4fCFs5JFy5Zrn8JrW8Z3y2
	yr4avrW5CF4jgFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UzE__UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxgP0vWqc6+NrcgAA3r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_212941_252657_E5FC5AD9 
X-CRM114-Status: GOOD (  10.11  )
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

pmu_sbi_dying_cpu() disables the calling hart's SBI PMU snapshot shared
memory but leaves snapshot_set_done set. When the CPU comes back online,
pmu_sbi_snapshot_setup() returns early without registering the shared
memory again.

Snapshot operations on that hart can then fail because the firmware no
longer has a snapshot area, while the driver still follows its snapshot
paths.

Clear the per-CPU setup flag after snapshot disable succeeds. Retain the
flag and the existing error return if disable fails, so a failed teardown
does not claim that the firmware registration has been removed.

Fixes: a8625217a054 ("drivers/perf: riscv: Implement SBI PMU snapshot function")
Assisted-by: GPT-5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
The issue was found by our static-analysis tool and manually reviewed.


diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 50220f7b..f38a64c7 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1175,6 +1175,10 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 
 static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
 {
+	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
+	struct cpu_hw_events *cpu_hw_evt = per_cpu_ptr(pmu->hw_events, cpu);
+	int ret;
+
 	if (riscv_pmu_use_irq) {
 		disable_percpu_irq(riscv_pmu_irq);
 	}
@@ -1182,8 +1186,12 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
 	/* Disable all counters access for user mode now */
 	csr_write(CSR_SCOUNTEREN, 0x0);
 
-	if (sbi_pmu_snapshot_available())
-		return pmu_sbi_snapshot_disable();
+	if (sbi_pmu_snapshot_available()) {
+		ret = pmu_sbi_snapshot_disable();
+		if (ret)
+			return ret;
+		cpu_hw_evt->snapshot_set_done = false;
+	}
 
 	return 0;
 }

base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c


