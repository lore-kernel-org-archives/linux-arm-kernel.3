Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F3DD3B7E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 12:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1AKViozsStBxwLtUBZPeJaX5HSHZd2TSRi1KWc2XeA=; b=VvAK5SbfUx0e4dUzjOWp6MMlQq
	9GqH970kUXePBTlW5396Z15yUyF+vjPckukUc02fK5TrTD7kogAR9+O5MzNYmGX62sJcxOpfsGmzq
	9hqzWR4FtrkOKh2MUs+2gIwixwAHeGGgBWgf4CuoLWwyyD1w9WPIoZRNLA1JUUSc5yyrXJ5FQpxH+
	xQZNAUx7C1hfCNB0kloVVfJXkXqV2fuezycBchqU8A12YowUs56yuHW95mwaIJt24OskgUMqRBukg
	48CvtFcu84sOCeJuNhOZfOtH2L/3LE8mJFxMAhoKuGPXNmQColtwmPMqoNEvqy0HC8v6eVyyFurHk
	pdtIGwqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSaSI-0000000D4qQ-2d3y;
	Mon, 08 Dec 2025 12:35:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSaSF-0000000D4oq-2NaD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 12:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z1AKViozsStBxwLtUBZPeJaX5HSHZd2TSRi1KWc2XeA=; b=sFNDV0A+s7A2eGwKTOj4RFcRod
	rQ9fYA8EvGpj1hM1JKUuOn2dJSJDa+Bsl9JdIrRkXg44lmpjXYlQFow8P4DLJAcnjaxKWFXurtlbD
	xg6TPitLSwYteXWvebOrrqQWGY6X1IaUNPWsbMu01+d6xpBaZmXsme6Z0FdbtRbae/Glbukukquo2
	/u+ofDlnhjETcbNKc1ZjJtRTaYDOOFcevHGZgWKSO1qaiHao7YKuZPuAhzeZRk7lfM1Hmm/uEQuEi
	Mt+YRlH1PyLtmkHXt4HjV60XI+ibqEgPa3zGK8Nk6tH4hWLkfH3n7rmpMNYm/eFCjhiWmOYxn0Jhb
	l++snEOA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45020 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vSaS7-000000007jd-0Gsc;
	Mon, 08 Dec 2025 12:34:55 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vSaS6-00000000Ni7-1FDb;
	Mon, 08 Dec 2025 12:34:54 +0000
In-Reply-To: <aTbF009476Iufory@shell.armlinux.org.uk>
References: <aTbF009476Iufory@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	torvalds@linux-foundation.org,
	viro@zeniv.linux.org.uk,
	will@kernel.org
Subject: [PATCH 1/3] ARM: allow __do_kernel_fault() to report execution of
 memory faults
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vSaS6-00000000Ni7-1FDb@rmk-PC.armlinux.org.uk>
Date: Mon, 08 Dec 2025 12:34:54 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_043503_608070_D311B75E 
X-CRM114-Status: GOOD (  10.44  )
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

Allow __do_kernel_fault() to detect the execution of memory, so we can
provide the same fault message as do_page_fault() would do. This is
required when we split the kernel address fault handling from the
main do_page_fault() code path.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm/mm/fault.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 2bc828a1940c..f0884bf91dfa 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -162,6 +162,8 @@ __do_kernel_fault(struct mm_struct *mm, unsigned long addr, unsigned int fsr,
 	 */
 	if (addr < PAGE_SIZE) {
 		msg = "NULL pointer dereference";
+	} else if (is_permission_fault(fsr) && fsr & FSR_LNX_PF) {
+		msg = "execution of memory";
 	} else {
 		if (is_translation_fault(fsr) &&
 		    kfence_handle_page_fault(addr, is_write_fault(fsr), regs))
-- 
2.47.3


