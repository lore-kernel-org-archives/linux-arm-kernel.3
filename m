Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E4CD10375
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 06:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=Qv72eaRmqkaycHNsibcCq6bjdrJSSd7d60nyQyGqTZs=; b=CCS0CacZCl+M0869fsJQ16JhSF
	iXz9dEEOP/4R6XCY6llN8+fleLIjPkganAl7iox++y9/6aG+q6oXGGaHgrzj64SY7OlvoYlqvW7JU
	6ZHCpA/XJTanw9qCeW7FLqEFl/bXQyl4q9oD/oEKemjQfMpX73I902hjp6K9kCHxLJRbDWZGFgqxu
	gGTNaHyHCymRD/fJSHhRXIX9JITViSlStWOj1adgaNT6rXiPcEGG24uhD/bXKl8Tj1w52UPEtUDtt
	ZwY/8gf5tjjZeBCqhwnrhK3+9qeFsTDoEmijizcmQUQY2olL2KR6/X5nXWbidaPFzljAR8BodRgph
	+/BMc9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOV5n-0000000G1Y2-3suw;
	Thu, 27 Nov 2025 06:02:59 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOV5k-0000000G1XS-23TG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 06:02:58 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251127060247epoutp0259e719ca8a479774b23c3c3fc674ab5a~7x85QLV9m0481104811epoutp02h
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 06:02:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251127060247epoutp0259e719ca8a479774b23c3c3fc674ab5a~7x85QLV9m0481104811epoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764223368;
	bh=Qv72eaRmqkaycHNsibcCq6bjdrJSSd7d60nyQyGqTZs=;
	h=From:To:Cc:Subject:Date:References:From;
	b=V7R/StFtmBdjyXAwoc8kMz8y2BfkICw+SaaIeKfiRbQ3gwt4pQ9Wv7vEBJRngi0Lh
	 AGFv1K0KE3GFlgTY7Io/q9ofnbUR0Ijl4jB/6NhvayXa/hYV/SHF+0qBNyJLpWaPfk
	 1P4H3fK0oH9mLCW3smazBBxyA2tGmLeObVhpIi+0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251127060247epcas5p15ae952aea1de396692c29ad82e3c4588~7x84mc_Oa2012320123epcas5p1h;
	Thu, 27 Nov 2025 06:02:47 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dH5SR1hD8z2SSKb; Thu, 27 Nov
	2025 06:02:47 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20251127060246epcas5p3f7b044dec5c4860399801a811a04155d~7x84VQZRf0400104001epcas5p3V;
	Thu, 27 Nov 2025 06:02:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.109.224.44]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251127060243epsmtip2e34c82509ef4b8fd806cddaa6f922a3e~7x803uInl1215212152epsmtip2C;
	Thu, 27 Nov 2025 06:02:43 +0000 (GMT)
From: Onkarnath <onkarnath.1@samsung.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	ada.coupriediaz@arm.com, thuth@redhat.com, onkarnath.1@samsung.com,
	broonie@kernel.org, song@kernel.org, yeoreum.yun@arm.com,
	kevin.brodsky@arm.com, ryan.roberts@arm.com, jeremy.linton@arm.com,
	maz@kernel.org, smostafa@google.com, leitao@debian.org,
	bigeasy@linutronix.de, kees@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maninder1.s@samsung.com, r.thapliyal@samsung.com, Sarvesh Kadam
	<s.kadam@samsung.com>
Subject: [PATCH 1/1] arm64: Print slab alloc and free paths for addresses in
 registers
Date: Thu, 27 Nov 2025 11:32:27 +0530
Message-Id: <20251127060227.3575956-1-onkarnath.1@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251127060246epcas5p3f7b044dec5c4860399801a811a04155d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20251127060246epcas5p3f7b044dec5c4860399801a811a04155d
References: <CGME20251127060246epcas5p3f7b044dec5c4860399801a811a04155d@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_220257_198788_948B46A3 
X-CRM114-Status: GOOD (  15.84  )
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

When debugging use-after-free kernel oopses, knowing the allocation and
freeing paths of an object is crucial. Like arm this patch enhances arm64
debugging by checking if register addresses belong to a slab and printing
their corresponding alloc and free paths.

For example x21 prints alloc and free path:

pc : crash_init+0x44/0x64 [crash]
lr : crash_init+0x34/0x64 [crash]
.....
Register x21 information: slab task_struct start ffff0000c3cc7000 data offset 64 pointer offset 0 size 3904 allocated at copy_process+0x1ac/0x14a4
    kmem_cache_alloc_node_noprof+0x208/0x4a8
    copy_process+0x1ac/0x14a4
    kernel_clone+0x70/0x380
    __arm64_sys_fork+0x40/0x7c
    invoke_syscall+0x48/0x104
    el0_svc_common.constprop.0+0x40/0xe0
    do_el0_svc_compat+0x1c/0x34
    el0_svc_compat+0x2c/0x90
    el0t_32_sync_handler+0x88/0xac
    el0t_32_sync+0x19c/0x1a0
 Free path:
    kmem_cache_free+0x3c0/0x430
    free_task+0x54/0x80
    __put_task_struct+0x100/0x15c
    __put_task_struct_rcu_cb+0x14/0x20
    rcu_core+0x264/0x680
    rcu_core_si+0x10/0x1c
    handle_softirqs+0x100/0x244
    __do_softirq+0x14/0x20

Co-developed-by: Sarvesh Kadam <s.kadam@samsung.com>
Signed-off-by: Sarvesh Kadam <s.kadam@samsung.com>
Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
---
 arch/arm64/include/asm/system_misc.h |  1 +
 arch/arm64/kernel/process.c          | 11 +++++++++++
 arch/arm64/kernel/traps.c            |  2 +-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/system_misc.h b/arch/arm64/include/asm/system_misc.h
index d316a804eb38..9cb9749d8853 100644
--- a/arch/arm64/include/asm/system_misc.h
+++ b/arch/arm64/include/asm/system_misc.h
@@ -27,6 +27,7 @@ void arm64_notify_die(const char *str, struct pt_regs *regs,
 
 struct mm_struct;
 extern void __show_regs(struct pt_regs *);
+extern void __show_regs_alloc_free(struct pt_regs *regs);
 
 #endif	/* __ASSEMBLER__ */
 
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index fba7ca102a8c..7738ec8e5cd5 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -199,6 +199,17 @@ static void print_pstate(struct pt_regs *regs)
 	}
 }
 
+void __show_regs_alloc_free(struct pt_regs *regs)
+{
+	int i;
+
+	/* check for x0 - x31 only */
+	for (i = 0; i < 31; i++) {
+		pr_alert("Register x%d information:", i);
+		mem_dump_obj((void *)regs->regs[i]);
+	}
+}
+
 void __show_regs(struct pt_regs *regs)
 {
 	int i, top_reg;
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 914282016069..3b01379b8880 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -189,7 +189,7 @@ static int __die(const char *str, long err, struct pt_regs *regs)
 
 	print_modules();
 	show_regs(regs);
-
+	__show_regs_alloc_free(regs);
 	if (user_mode(regs))
 		return ret;
 
-- 
2.25.1


