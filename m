Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAC9C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 07:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K2tuHcrzTCjC6XtZmOmGV8ku7xQicRREc1BpWHeDuik=; b=j2JR96z/VWFFrAGoOzTODfAkF0
	eD6Eg7jc9dqvhKQI4ygkE+c7Kah2YriZSwarkgqFS+CQmA7iazGEL4KinjZHYOaOr4EgPtMu4NX01
	whuaAPRk5rIlfia37Se8l8vSWE8y373jT564zYzxEDfJU7/N60gWqJdT8FBOv06+Vgm5UAMTbeXyv
	ujNNnIaX8XBNGo590A5E9YXtlyFJvYIRgsvAIeR0BWMjff5wSG1U/nBqwqm9XfnKKfZCvK/MsnDiL
	rnc8gueMOslqmUPLYcQiULlsEQHmc7BrFmlVdHMNgPvKoTMg8aZvoFytE4kwB/meGXZh4SzPl8UKf
	Jvfgi2xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvEB-0000000HTwQ-0NnN;
	Thu, 07 Aug 2025 07:39:55 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujv20-0000000HSlT-2o1k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 07:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=K2
	tuHcrzTCjC6XtZmOmGV8ku7xQicRREc1BpWHeDuik=; b=p1n8lpg7453JSnznV9
	ZweXVC461jhN3EXL1EYmTYWR7AlJXCOwDGfvHZRm5Vba+E8clLzrBupRyhTX4Ms4
	mwx+mFtYoH4frMFyQpyxTNj8cbEUV31bdP9eRAlfIbtkIx3EI3KaIAlZiADfrPTx
	M+Q2w2Ix3DrHAmhafz+doUSlg=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnOhxGVZRoUEhPDA--.562S2;
	Thu, 07 Aug 2025 15:27:03 +0800 (CST)
From: fanqincui@163.com
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	fanqincui@163.com,
	Fanqin Cui <cuifq1@chinatelecom.cn>
Subject: [PATCH] arm64/module: Support for patching modules during runtime
Date: Thu,  7 Aug 2025 03:27:00 -0400
Message-Id: <20250807072700.348514-1-fanqincui@163.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgDnOhxGVZRoUEhPDA--.562S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFW7GF1kXryUKFWUAry7Wrg_yoW8trykpF
	n8Crn5GrZ5Xwn3Cay8twn8WF15C398Can8KFy8W3sFyw1Yqr98AF1DKry5CFyUGr45Z3y8
	WF18Gw1jq3WUA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UD73PUUUUU=
X-Originating-IP: [123.112.16.66]
X-CM-SenderInfo: 5idq1xpqfxxqqrwthudrp/1tbiOgqipWiUUrpNrgAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_002721_096663_167B1F1F 
X-CRM114-Status: GOOD (  12.03  )
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

From: Fanqin Cui <cuifq1@chinatelecom.cn>

If use the ALTERNATIVE_CB interface in a kernel module to
patch code, the kernel will crash. The relevant log is as follows:

 Mem abort info:
   ESR = 0x000000008600000f
   EC = 0x21: IABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x0f: level 3 permission fault
 swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000013cfbed000
 [ffff80007b0b0000] pgd=0000000000000000, p4d=10000013d0d03003,
pud=1000000103175403, pmd=1000000115804403, pte=0068000116b77703
 Internal error: Oops: 000000008600000f [#1]  SMP

 Call trace:
  0xffff80007b0b0000 (P)
  apply_alternatives_module+0x48/0x7c
  module_finalize+0xc0/0x134
  load_module+0x15c0/0x1c08
  init_module_from_file+0x8c/0xcc
  __arm64_sys_finit_module+0x1c0/0x2d4
  invoke_syscall+0x48/0x110
  el0_svc_common.constprop.0+0xc0/0xe0
  do_el0_svc+0x1c/0x28
  el0_svc+0x34/0xf0
  el0t_64_sync_handler+0xa0/0xe4
  el0t_64_sync+0x198/0x19c
 Code: 00000000 00000000 00000000 00000000 (d503233f)
 ---[ end trace 0000000000000000 ]---

To avoid this problem, this commit supports add a new section.
When the module is loading, this section will be found and the
page table attributes will be set to executable state in advance.

Signed-off-by: Fanqin Cui <cuifq1@chinatelecom.cn>
---
 arch/arm64/kernel/module.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 40148d2725ce..2160b2877935 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -24,6 +24,7 @@
 #include <asm/scs.h>
 #include <asm/sections.h>
 #include <asm/text-patching.h>
+#include <asm-generic/set_memory.h>
 
 enum aarch64_reloc_op {
 	RELOC_OP_NONE,
@@ -477,6 +478,9 @@ int module_finalize(const Elf_Ehdr *hdr,
 	const Elf_Shdr *s;
 	int ret;
 
+	s = find_section(hdr, sechdrs, ".text.alternative_cb");
+	if (s && s->sh_size > PAGE_SIZE && PAGE_ALIGNED(s->sh_addr))
+		set_memory_x(s->sh_addr, s->sh_size >> PAGE_SHIFT);
 	s = find_section(hdr, sechdrs, ".altinstructions");
 	if (s)
 		apply_alternatives_module((void *)s->sh_addr, s->sh_size);
-- 
2.27.0


