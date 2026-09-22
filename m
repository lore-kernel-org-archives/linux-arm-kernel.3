Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095D2C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 18:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pMy9Rk3KbQyrH+qkFBTnaqCBL7b3XGUmEw1jNxFww0s=; b=wdJ9lWjRGHMl/oE1DO2T8r57iz
	4U4zncwwIzcgNO/hm6zx2pUnG7YadC5SljLjd080WBsu568MFAjAqFVDf3xYgiJwbwTKcMlVpnw1k
	Rb8/dTrtkF8RRxsZ27dcZPCaz5nAVrotSfVuAGJpjuF9lrvMjkojNH8W1AHWQG8XIGIVsx7aKFVXx
	+n8M7kUY5EzPN4bTgnZBKaPedg8dStA9jzXILoP841NkaxKQ43yuANkrAJ3Yd7Da2lVlwkkXGG+/n
	A9X+3cZVPQfzGWu+L9tK3sagHE00LZzTgjxIvPbSQVQkugBzDr4vjmhL9UD1khJKwQFamHuUvX5up
	w/725S4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95Ge-00000006J17-2x68;
	Tue, 22 Sep 2026 18:31:00 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95Gc-00000006J0Z-0mLK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 18:30:59 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4b37a3ed714so162947b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 11:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101857; x=1790706657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMy9Rk3KbQyrH+qkFBTnaqCBL7b3XGUmEw1jNxFww0s=;
        b=j5bcSZ9H/aRpGT2nF6p6bCz/K5F/HaiP0v7ehex756TGpxBSSg6V2dCPsQFf8KHunl
         k4yK3/IDVFlrG0yVNuieiW5JYthg0wJCQp33X3kUB+gQGUWXRyB1Ig8Y46RjcKwreU5X
         BT8wNdU6aG5bnoo8Nx6ohpvyS029/73nuLhabr5mguo7Pozzy413vA3fvCiprG/3aiIo
         8mxYtaYtjUzSf1bqqwf6QkX8zN07qFyN44YLwPTEk1Vnw1c7fv+cZYqw+BBKU1BRg4VE
         DJdk/bd3cRBAy3ZGeE41c/Yvumve1RNbFDNBwnOd/bDfoaI7bsW8FVUynpRPXPacj9BX
         lrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101857; x=1790706657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMy9Rk3KbQyrH+qkFBTnaqCBL7b3XGUmEw1jNxFww0s=;
        b=VAX+EiyeT1VXFbHkKCUsaFoRl8GOzoHhGHOyRHU5V2MQg47UE7jF/vk0cxTeGvJioJ
         xqoPzBxabogJ4UywENKBvi2mHM7vPdv52W8V1lxB0INTMFNJYlb8UfAHmA0JPqckCd4C
         rIwWpxzbQ9p/Iacr0HpY4cbr6uKhAQQmuCKloB5x2MOh7gDXZP1TK/+L/Xd0+WBEw0NZ
         FKvtxAt97K01Ug9XQGYPwaELOdNO9P+aKWOlcc/6QDEopN/rMsJmn1eYR46Je1TFaG7g
         e9915KBvztjg23FYCLOeTagXcmX+Z68pT0ZDvhoDaBw+Nwou8I/u0t3P5mNX2vsOIVis
         PMvA==
X-Gm-Message-State: AFuF++l5U3YdlRBb3lX6O1AdAv1yNEKwPuXco+a4MwkXuWUOSG1BkaOv
	bJAvihkchHQkjaTXX1aUlaURD1ALsMe+569SqQlw2ig8CS9H3CCDJNrI
X-Gm-Gg: AYBFou29zSucrirNdbqf8VOzwoKcPQWqeojurTjuNtuqIHONHljpnZntrEzwHvGGnLN
	OTB9zmkhUSFXcvyJit9i3UtnyLLQ06/iFYdlP3eDxvoDCeoqA1BWFFTDvIXgqtomrKDFm2Z40hu
	0K/H4Kr2pVN0XV9L78ZSq16+tpKx/oQ8G2B7460GwPwA28lOGYi3z483dkk4btVNqeq1POEB1th
	vksaZvWX0+G70D6THhfm0YZDDH5DqM0atJcIG1d6TZV+HdhimwzPkGCtZlTTx0uvTzIZ8bYJeCF
	KTRbdgrK5Kr6O7Ax7YQI2KYk3BA+E6WH+MYoWeVxcEu3HrTJoS/wih5NcTB/5cuRCvgRwpb91rW
	R3Uc4uCApwxaq2DILNxZPHm1yRjJmjT38Jlj+beY8SxwYPxK8Urhc9fFteK9LgTigM0JHHDG5AI
	LtU+8WChZhkjej6WXFt7RntH+tzDCd9AIslWlON4TlesXDDJUNIAIAyHh36C/DvrqFyqFLDYyDY
	OWLAV5PRhCsXCuzdnzXb9/BSmgVvsyP2y0/4kRN
X-Received: by 2002:a05:6808:f0a:b0:4b5:5bfb:f25e with SMTP id 5614622812f47-4d5b8de193fmr289621b6e.21.1790101856638;
        Tue, 22 Sep 2026 11:30:56 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c3d75355sm120805b6e.3.2026.09.22.11.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:30:55 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] ARM: mm: use kmap_local_page() in copypage-v6
Date: Tue, 22 Sep 2026 13:30:54 -0500
Message-ID: <20260922183054.254875-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_113058_250418_C5E05707 
X-CRM114-Status: GOOD (  17.74  )
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

kmap_atomic() is deprecated in favour of kmap_local_page(), as described
in Documentation/mm/highmem.rst.

ARMv6 and ARMv7 CPUs whose data cache does not alias use
v6_copy_user_highpage_nonaliasing() and
v6_clear_user_highpage_nonaliasing() as copy_user_highpage() and
clear_user_highpage(), to copy a page on a copy-on-write fault and to
zero new anonymous pages. Both map the pages, call copy_page() or
clear_page() and unmap them again, just like the generic copy_highpage()
and clear_highpage(), which use kmap_local_page() since commit
d2c20e51e396 ("mm/highmem: remove deprecated kmap_atomic").

Neither function needs preemption or page faults disabled: they only
access the kernel mappings of the pages, and do no cache maintenance.
kmap_atomic() is __kmap_local_page_prot() with page faults and
preemption (migration on PREEMPT_RT) disabled around it, so the mappings
are made and removed as before, and a highmem page is still mapped with
migration disabled.

Convert both functions to kmap_local_page() and kunmap_local(). Apart
from dropping the deprecated calls, this lets a preemptible kernel
preempt the copy or clear of a page, as it can in the generic helpers.
The aliasing variants use their own fixed mappings and are unchanged.

Assisted-by: LLM sparse
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on QEMU virt (cortex-a15, 2 CPUs, 2 GB, of which 1.25 GB is
    HighMem) with multi_v7_defconfig, which has HIGHMEM=y, plus PREEMPT,
    DEBUG_PREEMPT, PROVE_LOCKING, DEBUG_ATOMIC_SLEEP and DEBUG_HIGHMEM, on
    v7.3-rc4 with and without this patch. A test init checked every word of
    every page after:
    - copy-on-write of 8192 anonymous pages after fork(), written by the
      child and then by the parent, and first writes to 2048 pages of a
      MAP_PRIVATE file mapping (copy_user_highpage());
    - write faults, and read-then-write faults, on 16384 new anonymous
      pages each, right after 16384 pages were filled with a pattern and
      freed; 89-98% of the new pages reused one of those frames
      (clear_user_highpage()).
    pagemap showed all the source pages, copies and new pages in HighMem,
    and kprobes counted at least one call per page into each function.
    Both kernels passed with no splats. With CPU-bound tasks on both CPUs,
    a stack-trace histogram on preempt_schedule_irq() counted no
    preemptions inside copy_page() or inside memset() under
    v6_clear_user_highpage_nonaliasing() without the patch, and 9-54 and
    40-95 with it (two runs). A control that flips a byte of each test page
    in both functions made all five checks fail.
    
    Also built with W=1 for imx_v6_v7_defconfig, which builds the aliasing
    variants too.
    
    The ARMv4/v5 copypage-*.c files also use kmap_atomic(). I've left them
    alone: they do cache maintenance on VIVT caches while the pages are
    mapped, and QEMU doesn't model caches, so I can't test them.

 arch/arm/mm/copypage-v6.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mm/copypage-v6.c b/arch/arm/mm/copypage-v6.c
index 0710dba5c0bf..81d8471dbf00 100644
--- a/arch/arm/mm/copypage-v6.c
+++ b/arch/arm/mm/copypage-v6.c
@@ -32,11 +32,11 @@ static void v6_copy_user_highpage_nonaliasing(struct page *to,
 {
 	void *kto, *kfrom;
 
-	kfrom = kmap_atomic(from);
-	kto = kmap_atomic(to);
+	kfrom = kmap_local_page(from);
+	kto = kmap_local_page(to);
 	copy_page(kto, kfrom);
-	kunmap_atomic(kto);
-	kunmap_atomic(kfrom);
+	kunmap_local(kto);
+	kunmap_local(kfrom);
 }
 
 /*
@@ -45,9 +45,9 @@ static void v6_copy_user_highpage_nonaliasing(struct page *to,
  */
 static void v6_clear_user_highpage_nonaliasing(struct page *page, unsigned long vaddr)
 {
-	void *kaddr = kmap_atomic(page);
+	void *kaddr = kmap_local_page(page);
 	clear_page(kaddr);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 }
 
 /*

base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0


