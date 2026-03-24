Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E329DF54ADA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xpg1OOHH7W5XsLN+rucSM2WsyuBL1ulEamOIabJEn3w=; b=sp0TyK8om1XpkbEEvBbf8udupo
	YUN4Xs/aXPyhyM6DxB3vFM4gk+KVlq6eLegiPScCGYeXE12MJBweDh1GInS+fXntgr9eW0xf/D03y
	33pVG1jJoDjfiJp5u635sW7djn2DJQ6mxho1WFfYrY9V+ZsKLiMyvQCAJoywUAxT9OLE84F3DKukK
	jRAsQ3wwEWGLb36eQdy2RyHn87ZWQrdsyYwSGxaIstWKlm1sJTZyZy7xSOxasuN91Pnq4xuQfz3Pd
	2OoxlKRUNCISkVczth6HSCyt+Dqrdr7k2splOerQa6H/zOCOF1GFo1PJrNE7UcNMZtAbryUh+YAWd
	wWmryYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5577-00000001xBf-2cI9;
	Tue, 24 Mar 2026 17:00:21 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5574-00000001xAe-49il
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 17:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371619; x=1805907619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d6KLxSDgRcKiLzDY+NMiMRY2jmIC2rw/9NmZTIuAx/o=;
  b=easix1+RlY9rqMRBuoMLb2wAAfgSDz3ibtQyVj4mqKpmFLMQgTbIPCX4
   gAA2tEX3xYIEto8+AkrxOuTPGzuP2j4e4VBVuKeGGwITBZ8oflbfV8Hkp
   5VYbtgI5lBaHcrIDfpxq6mOnlCqa++w7ugTD3Nk8+ARqI+dmONSZvjXIR
   /p5fvft8c5Wa8UUJjzOkzuqezOLRv0raQAEbuHgWEc3mxJhsvClnVn1zP
   ZLy2GBHQZVVO7TOXnmjvfKgm9fv/GmNgMpWiRR/gxry7bYZfuF+hIbWXy
   vir35/haHx/+1Gs8DkkVK7Y7QH/pjiUkI44eIBNl3xTlmN+Yeovb/CpTL
   g==;
X-CSE-ConnectionGUID: KwZVc5DlSZ6+GyOTJbGkfg==
X-CSE-MsgGUID: KT7pYOe5Ra6MdhWJ0D/kbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75281420"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75281420"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:00:18 -0700
X-CSE-ConnectionGUID: ib4xzWKRSNm/cm3wyP1vbg==
X-CSE-MsgGUID: WCv5QcPyT7OGGuY23A4d9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="219540242"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:00:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 07/10] parisc/PCI: Cleanup align handling
Date: Tue, 24 Mar 2026 18:56:30 +0200
Message-Id: <20260324165633.4583-8-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_100019_077859_A63BF4F4 
X-CRM114-Status: GOOD (  12.97  )
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

Caller of pcibios_align_resource() (__find_resource_space()) already
aligns the start address by 'alignment' so aligning is only necessary
if align > alignment.

Change also to use ALIGN() instead of open-coding.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/parisc/kernel/pci.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/kernel/pci.c b/arch/parisc/kernel/pci.c
index f99b20795d5a..f50be1a63c4c 100644
--- a/arch/parisc/kernel/pci.c
+++ b/arch/parisc/kernel/pci.c
@@ -8,6 +8,7 @@
  * Copyright (C) 1999-2001 Hewlett-Packard Company
  * Copyright (C) 1999-2001 Grant Grundler
  */
+#include <linux/align.h>
 #include <linux/eisa.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -200,7 +201,7 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
 				       resource_size_t size,
 				       resource_size_t alignment)
 {
-	resource_size_t mask, align, start = res->start;
+	resource_size_t align, start = res->start;
 
 	DBG_RES("pcibios_align_resource(%s, (%p) [%lx,%lx]/%x, 0x%lx, 0x%lx)\n",
 		pci_name(((struct pci_dev *) data)),
@@ -209,11 +210,8 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
 
 	/* If it's not IO, then it's gotta be MEM */
 	align = (res->flags & IORESOURCE_IO) ? PCIBIOS_MIN_IO : PCIBIOS_MIN_MEM;
-
-	/* Align to largest of MIN or input size */
-	mask = max(alignment, align) - 1;
-	start += mask;
-	start &= ~mask;
+	if (align > alignment)
+		start = ALIGN(start, align);
 
 	return start;
 }
-- 
2.39.5


