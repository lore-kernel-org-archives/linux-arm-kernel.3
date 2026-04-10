Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236FFF44844
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 11:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAjsR4dXAz5nN/iA5znXAF8eBGinTPG8aT8GFMzcLFI=; b=G7IU7KJxvF6+Qi9gj3K8g7i/dD
	oXC4EtwCDpCt4MfLE87nkVwmQunjCH7842UQoT3jz+uHNcymuTqeYSow6sgFq4xgaxR6KuPtlT5Xc
	GlXkF7tIoGUmilvY2R2XTCZXCbne2gJjUHLdDPSnSSWZzePoC07Mfh0hRhVSCqvC9csJoMapHGBug
	QDa5fDFFA03lSkUjWQlxcPmY+B3jGJ97mT+eiP2O22XQsZwN46Mo9s7ZOiWQJQ1hPVd8N1ZT0Afvm
	dbgY8ClKL/EHHKLeW7pvCCdPN4hRIRva4xbgeSYBWQGpWW6Fz1qLIkY8pY+zIHftojiX/FEDJQy2d
	06CwV09Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAHK-0000000C659-14UD;
	Fri, 10 Apr 2026 11:44:02 +0000
Received: from mail-eastusazon11011007.outbound.protection.outlook.com ([52.101.52.7] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAHH-0000000C64L-189U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 11:44:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qn6Z6OzM3ku4U0/bM0BqscVieYXM09jDvw/wrTj2vT25wQTfxrBqle3BZKpRBZ/QVjKFktjUIRcaSv/3NwvDO7ENNVzRmm0FPQXL0bWVNAoFUVMxyBZ9juD8/5s2tk5iy44lDfWGGDeeyl//RC/qpOxlrUbvUeVKxRRPy7iAPY2Di4fPuOG1z3yL/UIi9r9Z/Hhb9ttkDETjEVshN4J8E8DjeoB1hJk7RD8Uf0Tg+cRLbA5J5mpsoNyqKtcQuZQWxLYDo5Iil2YReVfVCvJmbfcrQd36YNN1GqtseooWJEdsd1t4qk3pbyR8E7QHJ0SgqHQ3PiO9ATIsG5iNVPCpcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAjsR4dXAz5nN/iA5znXAF8eBGinTPG8aT8GFMzcLFI=;
 b=mnS7DGvU1kIf6HBgKlSHTuOYFrls4HnLxQcMX3PkSVUa99FP361XraExrvns8ipbFDPQgnoOg7TdXq2YD+HBz3l3VwfUGanH0cH5NkTduYPLZ3xSgRf+CG8P5ju+id/UbGBEtBKIGhUSXTJmQ32c88hUUhEUorpPWiUpCbz/+BHZQLTw0/Fogze57aFQnvcESlsAn4+YLC5ZKj8N+FwEBX69YZyFM0mJi4yPTy0fF93CT0Er4oB9npVquH9sB+0dTAu0CkSyA3gQgLNwFcxstkWa5Sj612U96FA9vYOfuaXX+cbNyuBeYVaK5qLzP75wgZW/4nRJ8Lx9n/LbIPtN2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAjsR4dXAz5nN/iA5znXAF8eBGinTPG8aT8GFMzcLFI=;
 b=Ouujr8qoJsLi65aJO22FY/vA6p/ulFoTL7bUU27gj8lwxCdKov7UKp2sVm7RTSk8Wi3bxUJKt3xalQ6gYWu7GLqQp7kzhnei38tBmUZvNvln++pPICcNDCBMsW1saEaIBltGPOOU901Nal2XO+q6DSwHvcHnwn1o6Vw9c3vcHZn0mygNJG9y1unJT2rNNm1iB9GSnSIZYYKkaejy5onZ1jGyJguau2OUKvMKSJZOn84bGGiRuSS0uOhsScZ2Nr9uvfcHxkmvK3dPlq5ClDgTN0NenGYut7Tfbx7g6zs6kHC9i60SZG1PiYWc87Ci163p2X5I2ofBltz1xow99sLUKw==
Received: from DM5PR08CA0060.namprd08.prod.outlook.com (2603:10b6:4:60::49) by
 SA1PR22MB5154.namprd22.prod.outlook.com (2603:10b6:806:3c7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 10 Apr
 2026 11:43:53 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:4:60:cafe::7d) by DM5PR08CA0060.outlook.office365.com
 (2603:10b6:4:60::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Fri,
 10 Apr 2026 11:43:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 11:43:51 +0000
Received: from zoo11.fihel.lab.ge-healthcare.net (zoo11.fihel.lab.ge-healthcare.net [10.168.174.93])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 4F51CD9C13;
	Fri, 10 Apr 2026 14:43:49 +0300 (EEST)
From: Brian Ruley <brian.ruley@gehealthcare.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>,
	Will Deacon <will@kernel.org>,
	Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Brian Ruley <brian.ruley@gehealthcare.com>
Subject: [RFC PATCH] test: mm/arm: pgtable: remove young bit check for pte_valid_user
Date: Fri, 10 Apr 2026 14:43:36 +0300
Message-ID: <20260410114336.983057-1-brian.ruley@gehealthcare.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <adjcc7QvquXI3G0Q@shell.armlinux.org.uk>
References: <adjcc7QvquXI3G0Q@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|SA1PR22MB5154:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cf92ac79-ee9b-4f51-4594-08de96f67029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0TRuMMSZqee/OBNC6Cqn78F9lhY0X5lCUYt01fG7AgipH9qfa5gpd3VviH/LrUQaRSuQ9blwQd9Edin+PozjH701PzKDoIJYMnUUepp7s7TJvKJ9u7eDvro801P5+mr6gmIKb0qam1q3HoTKgbX40Ps1UXvram/zupEW0tDFRE/ujkb61CKSBQD2Ye1yCO9l3no6fXct9LmCfxrQ72C72Wqh669Mc9+8e79Kd8vpVnioH/e+9m1mhwmt822hjn6Fl77zJulLTLdq3/mX2nOYGXddjRvue6FLH/fguv1qEaZUNp5LYcyvTui0yiyzwG1m1Zn1rqBmnKJICjEU0SdBHk+AiRh/tx/vnrpGvkps9qh5AENLknzRDShGkFB8hcgvpo20j1ogA/DxNVQL/DhTLfYekKG0SEa55h1xK72AH41GEW3CR/3pqJGomTBkHTAhJdmfsJbJ2AID1SBZ9YOfeu3tcD8LpjkquaHpKjVkAaBaYsO9Sjs7aqLa3Kx53RZo5m5LS9avESmTD5RGwj1zcDIJbIEj3dv0BUgvGM2w0hf0k3LJ7iBEQ2Jcg7Xc8jsIb8gLL/gPuU7oyQTabIVdxWjkk3ZekZQGZX5txcaxtWwDjJSuYUGT5nG3jcqvShezpU+Xen64/sK3Nm/iH+BD4TW2HDRjgcYYYHRi4fsvOsGY8EJ1zp1wGPLrXLnt+fopM9eSuHlRTBmpKbNVqe68tfaM3EpwVdJLmfG9Yghi46cg8feS5PxM5Vncy/9gMJ8ucLUiGcxZ5c8IrKzokeoKlQ==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tOqc36GYiraBi/TPofd+FJNbfHncyx0XAXeLw4LamtI7ulJ1UE68+5Ba5jHNpxpG4wwEalKwYYdZJ1jA38MubDbJmw005DxAsENJKK5++7IFCSeYvny4GmEFXdO2uhlLt4PksxPlXg+z4qhSMDmVxbMj+pMzguxPEYnHqowQ45KyIcvueVohc5V2BQazcypjYjhsEPC8eRREEBfWMl4KupeEq6eXq5SbMhSaAbJ9uwL7yTYSKJP8ChDRYdMdHz4IEqaXVloUGDYoP+c/X/eFNdB0N9nwOk8Lw3V9qK6MOnn71GPhdy0BPzFSZj/C6oKitimyCJSJqUf/2FpW7TdIlK77m95InuNXLvaI8JuH0hQvIFpNo/Gm4lkIzdTnKwosIS/6PtCDy9B9Gka2QbjEjCL+rUK2yTFk+6bVrYUNCC/Tv1sGjxsTlOe1CzvySzlV
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 11:43:51.9019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf92ac79-ee9b-4f51-4594-08de96f67029
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB5154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_044359_314366_96FBB44C 
X-CRM114-Status: GOOD (  12.92  )
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

Instrumentation to print recently migrated pages in undefined
instruction handler. This was used to determine if the faulting address
was migrated earlier.

Signed-off-by: Brian Ruley <brian.ruley@gehealthcare.com>
---
Not intended for integration. This is just to share the testing details.
---
 arch/arm/kernel/traps.c |  5 ++++
 mm/migrate.c            | 53 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index afbd2ebe5c39..64ef872f1555 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -28,6 +28,8 @@
 #include <linux/irq.h>
 #include <linux/vmalloc.h>
 
+void migrate_exec_log_dump(unsigned long fault_addr);
+
 #include <linux/atomic.h>
 #include <asm/cacheflush.h>
 #include <asm/exception.h>
@@ -490,6 +492,9 @@ asmlinkage void do_undefinstr(struct pt_regs *regs)
 		dump_instr(KERN_INFO, regs);
 	}
 #endif
+	if (user_mode(regs))
+		migrate_exec_log_dump((unsigned long)pc);
+
 	arm_notify_die("Oops - undefined instruction", regs,
 		       SIGILL, ILL_ILLOPC, pc, 0, 6);
 }
diff --git a/mm/migrate.c b/mm/migrate.c
index 2c3d489ecf51..987d0376b433 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -48,6 +48,54 @@
 
 #include <trace/events/migrate.h>
 
+
+/* Debug: track recent exec page migrations */
+#define MIGRATE_EXEC_LOG_SIZE 8
+struct migrate_exec_entry {
+	unsigned long addr;
+	unsigned long old_pfn;
+	unsigned long new_pfn;
+	unsigned int pid;
+	bool flushed;
+};
+static DEFINE_PER_CPU(struct migrate_exec_entry[MIGRATE_EXEC_LOG_SIZE], migrate_exec_log);
+static DEFINE_PER_CPU(unsigned int, migrate_exec_idx);
+
+void migrate_exec_log_add(unsigned long addr, unsigned long old_pfn,
+			  unsigned long new_pfn, bool flushed)
+{
+	unsigned int idx = __this_cpu_read(migrate_exec_idx);
+	struct migrate_exec_entry *log = this_cpu_ptr(migrate_exec_log);
+	struct migrate_exec_entry *e = &log[idx];
+
+	e->addr = addr;
+	e->old_pfn = old_pfn;
+	e->new_pfn = new_pfn;
+	e->pid = current->pid;
+	e->flushed = flushed;
+	__this_cpu_write(migrate_exec_idx, (idx + 1) % MIGRATE_EXEC_LOG_SIZE);
+}
+
+void migrate_exec_log_dump(unsigned long fault_addr)
+{
+	int cpu;
+
+	pr_err("SIGILL at %lx pid %d, recent exec migrations:\n",
+	       fault_addr, current->pid);
+	for_each_online_cpu(cpu) {
+		struct migrate_exec_entry *log = per_cpu(migrate_exec_log, cpu);
+		int i;
+		for (i = 0; i < MIGRATE_EXEC_LOG_SIZE; i++) {
+			if (log[i].addr == 0)
+				continue;
+			pr_err("  cpu%d: addr=%lx old_pfn=%lx new_pfn=%lx pid=%d flushed=%d%s\n",
+			       cpu, log[i].addr, log[i].old_pfn, log[i].new_pfn,
+			       log[i].pid, log[i].flushed,
+			       (PAGE_ALIGN(fault_addr) == PAGE_ALIGN(log[i].addr)) ?
+			       " *** MATCH ***" : "");
+		}
+	}
+}
 #include "internal.h"
 #include "swap.h"
 
@@ -434,6 +482,11 @@ static bool remove_migration_pte(struct folio *folio,
 			else
 				folio_add_file_rmap_pte(folio, new, vma);
 			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
+
+			if (vma->vm_flags & VM_EXEC)
+				migrate_exec_log_add(pvmw.address,
+					swp_offset(entry), page_to_pfn(new),
+					pte_young(pte));
 		}
 		if (READ_ONCE(vma->vm_flags) & VM_LOCKED)
 			mlock_drain_local();
-- 
2.47.3


