Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85456D13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 10:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y78a7K1MzjAQDxd2KKQetl6hiq708QDKPsOuaPB4jJE=; b=zxbndft1LcDgjHrlxXj5A/pzbr
	BMKytP2/NzEUhpTq9fkYtMtaYySiUcQJrRyShJFPuH/nNQgWrA39gKWBE3xWS+IwezIqEp0Y6hKKA
	YFw7WDewiQ+tfBTHRignev/FCxBoceMBLnVzOofGvhjGAYNkfba/tyyolZlk2EVT2ahzUpbP+D7UR
	t7CUbXPNUhUGOfhrdGMNCtYyHf75yYivzVKiglkq6Vfqs2GXKzz/h87qHeew5Yh6TFXz6yjhc27go
	9TtTt3v4JBODNbQb/WHbrF18kmwZ1CmYuh9xE+orGX2FRSBd2Vj9Cc8VAtnWOlDxVTX+LE2aap8bK
	N461W69g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NQ8-0000000AU9h-3oPl;
	Mon, 28 Oct 2024 10:56:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NMZ-0000000ATEz-1UVf;
	Mon, 28 Oct 2024 10:53:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87500497;
	Mon, 28 Oct 2024 03:53:09 -0700 (PDT)
Received: from e126645.nice.arm.com (e126645.nice.Arm.com [10.34.111.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2C7E73F73B;
	Mon, 28 Oct 2024 03:52:35 -0700 (PDT)
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Steffen Persvold <spersvold@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH] ACPI: CPPC: Make rmw_lock a raw_spin_lock
Date: Mon, 28 Oct 2024 11:51:49 +0100
Message-Id: <20241028105200.1205509-1-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_035243_515421_EC50A0A5 
X-CRM114-Status: UNSURE (   9.53  )
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

The following BUG was triggered. sugov_update_shared() locks a
raw_spinlock while cpc_write() locks a spinlock. To have a correct
wait-type order, update rmw_lock to a raw_spinlock.

Also save irq state.

=============================
[ BUG: Invalid wait context ]
6.12.0-rc2-XXX #406 Not tainted
-----------------------------
kworker/1:1/62 is trying to lock:
ffffff8801593030 (&cpc_ptr->rmw_lock){+.+.}-{3:3}, at: cpc_write+0xcc/0x370
other info that might help us debug this:
context-{5:5}
2 locks held by kworker/1:1/62:
  #0: ffffff897ef5ec98 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2c/0x50
  #1: ffffff880154e238 (&sg_policy->update_lock){....}-{2:2}, at: sugov_update_shared+0x3c/0x280
stack backtrace:
CPU: 1 UID: 0 PID: 62 Comm: kworker/1:1 Not tainted 6.12.0-rc2-g9654bd3e8806 #406
Workqueue:  0x0 (events)
Call trace:
  dump_backtrace+0xa4/0x130
  show_stack+0x20/0x38
  dump_stack_lvl+0x90/0xd0
  dump_stack+0x18/0x28
  __lock_acquire+0x480/0x1ad8
  lock_acquire+0x114/0x310
  _raw_spin_lock+0x50/0x70
  cpc_write+0xcc/0x370
  cppc_set_perf+0xa0/0x3a8
  cppc_cpufreq_fast_switch+0x40/0xc0
  cpufreq_driver_fast_switch+0x4c/0x218
  sugov_update_shared+0x234/0x280
  update_load_avg+0x6ec/0x7b8
  dequeue_entities+0x108/0x830
  dequeue_task_fair+0x58/0x408
  __schedule+0x4f0/0x1070
  schedule+0x54/0x130
  worker_thread+0xc0/0x2e8
  kthread+0x130/0x148
  ret_from_fork+0x10/0x20

Fixes: 60949b7b8054 ("ACPI: CPPC: Fix MASK_VAL() usage")
Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
---
 drivers/acpi/cppc_acpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index 1a40f0514eaa..e7e4bf932e28 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -1127,7 +1127,7 @@ static int cpc_write(int cpu, struct cpc_register_resource *reg_res, u64 val)
 			return -ENODEV;
 		}
 
-		raw_spin_lock_irqsave(&cpc_desc->rmw_lock, flags);
+		raw_spin_lock(&cpc_desc->rmw_lock);
 		switch (size) {
 		case 8:
 			prev_val = readb_relaxed(vaddr);
@@ -1142,7 +1142,7 @@ static int cpc_write(int cpu, struct cpc_register_resource *reg_res, u64 val)
 			prev_val = readq_relaxed(vaddr);
 			break;
 		default:
-			raw_spin_unlock_irqrestore(&cpc_desc->rmw_lock, flags);
+			raw_spin_unlock(&cpc_desc->rmw_lock);
 			return -EFAULT;
 		}
 		val = MASK_VAL_WRITE(reg, prev_val, val);
@@ -1175,7 +1175,7 @@ static int cpc_write(int cpu, struct cpc_register_resource *reg_res, u64 val)
 	}
 
 	if (reg->space_id == ACPI_ADR_SPACE_SYSTEM_MEMORY)
-		raw_spin_unlock_irqrestore(&cpc_desc->rmw_lock, flags);
+		raw_spin_unlock(&cpc_desc->rmw_lock);
 
 	return ret_val;
 }
-- 
2.25.1


