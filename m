Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC96D13569
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=90TbkQToyaIIp8wtsz9zjfvHhI1P8wFuLM/XlwUgLjE=; b=1FdRkH3BzBhs5+zIe/1VlDhx0T
	A2DW0A2v7cnLaFcH1vsTosY+lZBGVjaqmFet+X5nrnbd81e82PaNa53CyBawdhhDYw5Cj5cKHe131
	Qtn/YdMfyafeenlFclZq2yZ7sLlZMDv/DOWoN9pWoWqHhkgXlj11z9gNkiqk3focVQmDx48CfULjG
	OivD3tLR8UJTNkIaQiXb0D9CXjLR2R8y2OoKTlNzRAS7OdqXRdw52xSaeNLu+JPr3enxZP+xQhVn6
	hQYRHtZ1TAO/xmH+nD/5cRb3etsPZWPB+XidqUJU/XyLyxtXpOQzG1GdwFp5pqIcOrniP80+RIlNH
	IdfGSUEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t54EM-00000008Mpd-1ueH;
	Sun, 27 Oct 2024 14:26:58 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t54Cg-00000008MHm-2cQC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 14:25:17 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730039109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=90TbkQToyaIIp8wtsz9zjfvHhI1P8wFuLM/XlwUgLjE=;
	b=FTlfTqoTAEHECs/qbgOUYTMkQnjc1H5HS1P8c/ip8pGcDEbEOLBTO4JQcV7ecfvTuSHBap
	4OEidYx+LPbhgy5bXUPkZgv0f6K0UyB40gJNO7A1Wqp3di20sHM0xT3weZxXsFN+i+3MbR
	VGOhV+V589dPdvelnnv79Ie9PhqLIYA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Russell King <linux@armlinux.org.uk>,
	Kees Cook <kees@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Yanjun Yang <yangyj.ee@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arch: mm: Use str_write_read() helper in die_kernel_fault()
Date: Sun, 27 Oct 2024 15:24:16 +0100
Message-ID: <20241027142417.75809-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_072515_139544_0B2A0A26 
X-CRM114-Status: GOOD (  10.20  )
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

Remove hard-coded strings by using the str_write_read() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/arm/mm/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index ab01b51de559..b2d59d260a1f 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -136,7 +136,7 @@ static void die_kernel_fault(const char *msg, struct mm_struct *mm,
 	pr_alert("8<--- cut here ---\n");
 	pr_alert("Unable to handle kernel %s at virtual address %08lx when %s\n",
 		 msg, addr, fsr & FSR_LNX_PF ? "execute" :
-		 fsr & FSR_WRITE ? "write" : "read");
+		 str_write_read(fsr & FSR_WRITE));
 
 	show_pte(KERN_ALERT, mm, addr);
 	die("Oops", regs, fsr);
-- 
2.47.0


