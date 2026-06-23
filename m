Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF00CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=egV2Cj27OGtBaELQk+zCjLaNq17lbZGojv4n+pNUxY4=; b=FxKViWiQCesV7iMx9D7WFDNREq
	wU5WNyYc37rXwN64xKYm/vnHsKRVWTmeJPNGyHyYD6RL+4SBRFVWeUFu5kLWdIXZyiVWYfdwcUf0Z
	VX1vfuy67Y6r3f+fv0VYmp05h/RADErU7zvzJoHSrfA/8D4WsOph/fNyBYblgf5KiceXfPSeYyiJP
	rYIUpMBEKcwDzS9DqeGJ6epgU8SVxJcZm/T81MO/e9CBg8towyHFrGagUmYO6bm0k0sqPBbHZ46Ow
	uwRVZonISdtSxoavIl/1vE6k+pnUHEvJ9cF/Okszh0HMO/yc5HjNrdmO7UzQTZJ5Ar91JCw52qeyT
	wVEboW1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7jT-00000006qf1-0QCS;
	Tue, 23 Jun 2026 20:28:31 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7jQ-00000006qeV-11mT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:28:29 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490b2f22ea2so1960875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 13:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782246505; x=1782851305; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=egV2Cj27OGtBaELQk+zCjLaNq17lbZGojv4n+pNUxY4=;
        b=HWhPxKQqzHf/e0ta9q3TcvL9Kf9/ulxNL5LJc0dmDDzb2jTdPJGGRop80uLnxNew+/
         3OZvao3+1mLTaI2FSJUkVZrd8NPWi6H11PDLkLxAPhjtgiAwfsMcLqeCBBCJDulrZlNu
         yANBZ5W7m+i3u57F+ZiNFr3Xetpf+xaLpURgDbc1ZQ0Ky3lnSXl914Kd1jP/VZ6wWuAr
         zoPCsfP1tSjknm20y8+BCPtjbvx5blavgyQgRlfqtEVrVAz9R0CuiDCEL9lPnCcZ+jj+
         KcBEQ94Yj/6C+LdJQT2hn7Qr2ND/4IOTstqe7QtASHJFQLT1051yUpAwLgXtCUqSssAb
         DCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782246505; x=1782851305;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=egV2Cj27OGtBaELQk+zCjLaNq17lbZGojv4n+pNUxY4=;
        b=fNtSL9AmAzouENLcWVjsQdS+jFmdQFIBl/blvYE9BCRQ9ydaOfV/0nMivZ9ajGj9xY
         8BnEZ5A13J8Iu5BTZVvbiby8aCmycrVgBRP2zpVu36LIZfixEyS+2HBuIuEeSIIEMGYi
         eodEZrAzb2DlyKckGZRYGUUjT7jT/675LQi0abI4NikQ/wGC0A1zkr5//DlRmVjSnsMH
         EOw2pY8OexVAFRwxfhbRZvl6/wxNPIH6XDZSQqLS7HPijaqlpBeQjZA/yDc/jGn7FMFA
         8YhGJgUSLMWyioyBs25Iv1uRDxUF+qxW0zNaG2p3lgB/p+wOYTPdWNapvUXaod92G/k7
         3V4Q==
X-Gm-Message-State: AOJu0YxAJbj36ZKRZe4GXIFv/LiOoVdWPXcpDnjx8GvzajwP8gYiyuKH
	v/AIjwk5YGY4tmUvnCGgZ0TBs1myvJkHGM6jdsvDrh5DOJKeOMyj8WeuEwOOMoCgGbO3VPxlQNZ
	Qmne5rK89OfctR649BHMkyq0NHo8sWtn+6bgJ3HFsetho5mv1YOuRCCSFn6MBO++TAPzuawaUDs
	4Lvd0JGBxcIMSk7oErGbv2G3B42tYB8XTRFmOXI9Ps1xEe
X-Received: from wrbfr5.prod.google.com ([2002:a05:6000:2a85:b0:468:7f36:9f66])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4ec8:b0:492:5e21:458b
 with SMTP id 5b1f17b1804b1-4926084aad6mr3025575e9.8.1782246505129; Tue, 23
 Jun 2026 13:28:25 -0700 (PDT)
Date: Tue, 23 Jun 2026 22:28:18 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520; i=ardb@kernel.org;
 h=from:subject; bh=BHcLpzq4nDfnEcAf94/iXBUylDTH/0C5UUQpTrqyW+8=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIcvqTVLFl+23LVfnaEyRF9F2EeHYcvTqYZmm10vfTRLb2
 9fLfrexo5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzE5SfDL+Y/zRfe1rCmTZDa
 zsymlaP37MDNHXd2zBZ6FfZr3c+SlGsM/xMuHo8+J67xUso/ztnrklrR7ykPKla8ZkkpuBJ3bS9 7GxcA
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260623202817.2225495-2-ardb+git@google.com>
Subject: [PATCH v2] arm64: mm: Defer read-only remap of data/bss linear alias
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_132828_302758_855DBEDB 
X-CRM114-Status: GOOD (  15.62  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Since commit

  f2ba877402e5 ("arm64: mm: Map the kernel data/bss read-only in the linear map")

the linear alias of the .data and .bss regions is remapped read-only
early during the boot. (Note that a subsequent patch to unmap this
region entirely was reverted just before the v7.2 merge window, and will
be brought back in an improved form for the v7.3 cycle)

Fuad reports that in some cases, the KVM init code may apply relocations
to variables that reside in .data, and does so via the linear map. This
means that remapping .data read-only beforehand is a bad idea, and
results in an early boot crash.

These variables in .data are only present when CONFIG_NVHE_EL2_DEBUG or
CONFIG_NVHE_EL2_TRACING are enabled, which is why it was not spotted in
testing.

So move the remap to mark_rodata_ro(), which is a reasonable place to
put this, and ensures that it happens much later during the boot. It
also means that rodata=off is now taken into account, and so the linear
alias will remain writable in that case.

Fixes: f2ba877402e5 ("arm64: mm: Map the kernel data/bss read-only in the linear map")
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
v2: improve changelog, add Fuad's R-b

 arch/arm64/mm/mmu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 9f354971b7e4..1f7eca86b5c1 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1198,11 +1198,6 @@ static void __init map_mem(void)
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
-
-	/* Map the kernel data/bss read-only in the linear map */
-	__map_memblock(init_end, kernel_end, PAGE_KERNEL_RO, flags);
-	flush_tlb_kernel_range((unsigned long)lm_alias(__init_end),
-			       (unsigned long)lm_alias(__bss_stop));
 }
 
 void mark_rodata_ro(void)
@@ -1221,6 +1216,12 @@ void mark_rodata_ro(void)
 	update_mapping_prot(__pa_symbol(_text), (unsigned long)_text,
 			    (unsigned long)_stext - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
+
+	/* Map the kernel data/bss read-only in the linear map */
+	update_mapping_prot(__pa_symbol(__init_end),
+			    (unsigned long)lm_alias(__init_end),
+			    (unsigned long)__bss_stop - (unsigned long)__init_end,
+			    PAGE_KERNEL_RO);
 }
 
 static void __init declare_vma(struct vm_struct *vma,
-- 
2.55.0.rc0.799.gd6f94ed593-goog


