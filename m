Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADCEE6F075
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 18:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Mime-Version:Message-Id:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JxYbm1Z4z7V0LtD/KQxdWvQCPGBeV+dM1tmtZ4XSNhI=; b=AYHozP2AIICWL+iW6exLeXKTEC
	kAKL3bheXa7MpQniX+rRubDw8HFsYkR2bHL2jY5n0H1RdbN2nmlV3Ng6+16VRpw3eRAaquXyH1I9g
	j3Q3awal+J24d4isuYVTGufSitczkSersZkNjppqGS7wZNxiDlzCtflaoM11xT4dZsH8/40STpLYc
	pOBNpebDrrAH3/fJR+zAR+lsTlSBPzzNUrIc+Dl+Rnbcpzaq6qETzEOrU6J71vSvSyDR0VWfQS7K/
	ommgN81TW+2uI7GgbWniaBKYaYO7KL86GvEYz3VUNq3uLf0YNE6QKfr4eq243eVQpPLSqGXwMzQie
	94BjCrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6wBH-00000007wvT-2Pn5;
	Fri, 01 Nov 2024 18:15:31 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6w9b-00000007wjH-3bbh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 18:13:49 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e3497c8eb0so29758267b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 11:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730484826; x=1731089626; darn=lists.infradead.org;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JxYbm1Z4z7V0LtD/KQxdWvQCPGBeV+dM1tmtZ4XSNhI=;
        b=PFL9ypBltti3BFG2e1qchdvj8W0ajR6kBK1b4hTpWwS5Fb3wfvByavqsQ04q9ca1/y
         Lq5lA5KKcKRs0LRxQYxO5Q5+mfsKp4h+UdHNPBz46IcwLm+Fl7vuqPFn9C9VKMNIRdHO
         2aLBZocj2MCW2w/nZNOzflP7Bi6Pr4hMxTqDO5/NLgW1qKk2/JpPLHHRGDxpaZqC3/P0
         llUs7mQ65HMQZNIVLZwelpTQpHvgGBA3DojJCnMMapcERCXzldf/PR3CavJYSqs4hP2k
         0zfpAwVZrURmG4pPji1Sy1JxVUUMbCnqN5B2MRi4APL5q0GUrSC6N9i3oBaeFma8bHks
         fshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730484826; x=1731089626;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JxYbm1Z4z7V0LtD/KQxdWvQCPGBeV+dM1tmtZ4XSNhI=;
        b=R1i1N8xMVxLCUCacawjpl6OFu/0DCSaPSWRGZ0UH0+S4+CR9j7nqmc6P8ym+bYOBxg
         BUjr3K6YsdLsQpBOpQucP58kDr+BOrT55whY2S9CJ6ZejN3r0sLIkfVGNMo4QK4u2FCw
         k/rbhK80vIijI6L7wsw4YbQdvvhCEHOHvqN1574XVoX3xPEbT6E73vTnmZScxorF1nuQ
         ML7stO/hVRnFwnGcw588lo6nVFVpTxF0MaFAw976C+w6Drf6FTPQkEDYt6LVp++UV9zg
         mTHlTVmLT4JzWZqjB1AhOKx5WpTF5DPSixtBa0f/qNXTIcRUq/RGLfM2rjKP94ZZUGv/
         nILA==
X-Gm-Message-State: AOJu0YxDbhpVG94r7WL/6AnB4bwcgtVGQu8qBkXJSgniwSNJ7XkBZ4Fd
	KL4bKUPRCu4J+CNoY492RezQNu6YfQraqmNdHzTiX3nHqwWeI7bx3HgTzGKMiMRHnwwawNhpT5j
	7/vneKrICuflM+SyOaLQsvqKOA1nLTYwCrnw2eKcTNKW5OHylOFO5BlrEe+FcdjMGLtblpSSkGH
	DOcEHhP9fQfYWDaqHXJ6w9jIUGkwjO//ROSyg=
X-Google-Smtp-Source: AGHT+IHSZa5WResS50zFavRgUXsuIvO8Cm70xBB3z56TbSbTiJjK7u50UhmD+mgJBRLpEZseI+B3Csk=
X-Received: from pcc-desktop.svl.corp.google.com ([2620:15c:2d3:205:cd32:25bb:7cee:e41c])
 (user=pcc job=sendgmr) by 2002:a05:690c:6c03:b0:6ea:4b3a:6703 with SMTP id
 00721157ae682-6ea64411b8fmr722057b3.5.1730484826239; Fri, 01 Nov 2024
 11:13:46 -0700 (PDT)
Date: Fri,  1 Nov 2024 11:13:24 -0700
Message-Id: <20241101181325.2755536-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Subject: [PATCH v2] arm64: symbolize user-space stack on SIGSEGV
From: Peter Collingbourne <pcc@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Peter Collingbourne <pcc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_111347_920500_CDABF3BA 
X-CRM114-Status: GOOD (  18.56  )
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

On arm64, dump the userspace stack to the console when a SIGSEGV
occurs. Print filename+offset to allow symbolization.

This is a patch that I frequently need to apply locally in order to
debug segfaults that occur in environments where attaching a debugger
is infeasible.

Although I don't expect this patch to be applied to the mainline
kernel, I am posting it in case anyone else would find it useful
(and because I almost lost track of it recently, and I don't want to
have to write it again).

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
v2:
- rebased to 6.12-rc5

 arch/arm64/mm/fault.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 8b281cf308b30..9391a0d44a99f 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -518,6 +518,38 @@ static bool is_write_abort(unsigned long esr)
 	return (esr & ESR_ELx_WNR) && !(esr & ESR_ELx_CM);
 }
 
+static void symbolize_addr(const char *prefix, unsigned long addr)
+{
+	struct vm_area_struct *vma = find_vma(current->mm, addr);
+	if (vma && vma->vm_file) {
+		char buf[1024];
+		char *c = d_path(&vma->vm_file->f_path, buf, 1024);
+		printk(KERN_ERR "%s = 0x%lx (%s + 0x%lx)\n", prefix, addr, c,
+		       addr - vma->vm_start + vma->vm_pgoff * PAGE_SIZE);
+	} else {
+		printk(KERN_ERR "%s = 0x%lx", prefix, addr);
+	}
+}
+
+static void symbolize_stack(void)
+{
+	int i;
+	unsigned long frame = current_pt_regs()->regs[29];
+
+	symbolize_addr("pc", current_pt_regs()->pc);
+	symbolize_addr("lr", current_pt_regs()->regs[30]);
+
+	for (i = 0; i != 64; ++i) {
+		unsigned long ret_addr;
+		unsafe_get_user(ret_addr, (unsigned long __user *)(frame + 8),
+				end);
+		symbolize_addr("ret_addr", ptrauth_strip_user_insn_pac(ret_addr));
+
+		unsafe_get_user(frame, (unsigned long __user *)frame, end);
+	}
+end:;
+}
+
 static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 				   struct pt_regs *regs)
 {
@@ -722,8 +754,10 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 		/* Something tried to access memory that out of memory map */
 		if (si_code == SEGV_PKUERR)
 			arm64_force_sig_fault_pkey(far, inf->name, pkey);
-		else
+		else {
+			symbolize_stack();
 			arm64_force_sig_fault(SIGSEGV, si_code, far, inf->name);
+		}
 	}
 
 	return 0;
-- 
2.47.0.163.g1226f6d8fa-goog


