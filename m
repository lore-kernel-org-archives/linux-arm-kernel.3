Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F050C61DE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 05:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i8abeE7yuo9J9DmBCNkbVrY67aO7PUOd2dMVcC0+Ats=; b=asPMpdXK3xSTSvRHWgZo3cg8iL
	fOFlyfv3sYGy3pRim/N3uAXfMEUFjTTHbWn6nq1U+MlUwcFqZ+iceSFogucN2wFWfbbtBQhMfR6o/
	4p9IOTuKfwZOUaH/xiMo8V1dVCR7harvDbq7sxFdKxTwfhzC9xAqk9M6d95eJ9jSq+YkF1MTR1xWh
	E3XmwqgW4nsbf2/OZx/nvLCjCNBfUMWawRCsAL5GCYjhYGqR0Bc0kVpPZHm5AZOj3qBzKXkoa9mMm
	yylBn1TLdKDWlVy1DirfPBDyBg4ZIVSdmyn9k103xlqUuL9Lz/3U5+FFUwmBQB2/2Vy7pdrh3niuF
	wj3taF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0unM-00000008XF0-1sMk;
	Mon, 31 Aug 2026 05:43:00 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0unJ-00000008XEd-34xO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 05:42:58 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48436216a98so523489f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 22:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788154975; x=1788759775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i8abeE7yuo9J9DmBCNkbVrY67aO7PUOd2dMVcC0+Ats=;
        b=lZj540/SbRNXVLZwxa/wlEZ8CnHCqxoqYNYFmMX4KY3G6rxH7tbEYb7NgFMFjEvEFP
         4l235v0vI/FeEBFhUZnhZ/VZ4ChWkJhr9SL+Ut7uQEqMyU7t9LsQLJmacbyzgZl/bqMW
         tEfIsfj/aRSYW5ZKgenhB3b8e20LmDNzrC59cfz1ZN3H7OJcPRoojDkvYg6GypZe2gxL
         ParaX51xp60tpa7m3rnM4iYrQH305j+SQI/P1nBW6J2FIFOYlH9tBKL0BecprBAwp7I1
         e242HkNhtcHlsB3J/saoGytOarYAUVWJ9rnVFf/RvSRgr801KquWcFvtWRcXIQdBTbh2
         ktHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788154975; x=1788759775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8abeE7yuo9J9DmBCNkbVrY67aO7PUOd2dMVcC0+Ats=;
        b=bAlbWarQz0bHBcZK6/SIZGznS7svYFSuQPyrlbcUde3tYRWEN+lxTu65LqdVEjmXMq
         1KMydDlk/YGk5o/DnhyyBd6M9eQAGCCNkCPzulqvy/TFhkhx8Sev9YPRR+2Zm3cMEihA
         dh1MSt0cvQfkXdm5Mgt+cutzr/i/hwpL+hmk8eYKZWgb9ib3VO2+35blwvVI7htFou88
         qUBtlxjMhzm5khQl5LEGB0xsywwQ/qlx2LTFcUZCEKj3Rv1voAb7lqVFCIoilUNfPLP/
         uzxLYw3A4apab8cj0amAuT8gR+TwTrWVUs9Sx+URJLA5G5kL5gbyKQbDKBke/Rs20Tiw
         CVgg==
X-Forwarded-Encrypted: i=1; AKwUvBxI8TptfGDmBIRVQramzkpcFghBm1LxIQnY+Okbx8ZdR1ISJtcwTBk9EJWDccwDPro+VEgRsQG6E7FatPYWPYGP@lists.infradead.org
X-Gm-Message-State: AFuF++mx5uYuYkZPlsZZY725Rmirgy3ygiuQ3ud5L6DPpSyQBP0Le+ea
	UVLMvWFCrxbdaTiC7SCC+cWFrvF0OtswuUb/CRl7TyeGsE4Jj+gPmc5O
X-Gm-Gg: AYBFou0Yx0xh2QxTuNvLuY/e8qHw7wPdzweAiXVmAsrLsGmAVbNJp1rZwSHHtm50wRP
	i7gu60HWD9JsIbsarZ1grwm0D8RrhLvsh15jd8LS39WjPzyY/kcOppOwkk/xPe9XvTmENvGXahO
	GnzQVcf4fMAba0hvLwUmQv9KYdvyrD1VDOPOrHz9VOxarhPN49dcU0EbN2cF6UosjK9NxU6ZDb3
	qKpnfymgMsJ9GMmyfJX+F00DZiu8wQPpDzFCJaO3WQfXE36Ok71ha47x6wSGZDUBMRLkDmmo5wB
	Co0qkT0cbmtD+ZND1dzHzC22PofoxU6t/D0GeGOl0I7KhQTQ31FPSWfOo/GgV4X/142YIXnmMVX
	CqUvILs7YUhdvymca38TiqNFpbnC1VElEoBzmEtSkeGLoa0N91AU07Plr6FTay2zLS62chVlqDK
	QoOOI0BTESdp3lpIusEWjOGKM+T0f5vByFwQUSJVqPUGYd/OAiDqDiVHLQG0GmIeWSp5Tr5Y50y
	WpXo3CIuuaXfVyEGglibym+Gx5YT48Q0esVQzPbOeMd+bUciO/anfzPZvcx40Kvui0yDF0LwHv0
	+OnBNXLgeMhzAtvDcfjPhOGT/b2gf8XJ8/17C1ZcWeC0C+MtQTIey2HGrR0Y/Mk77w==
X-Received: by 2002:a05:6000:38f:b0:484:3317:a1a with SMTP id ffacd0b85a97d-48433170bb5mr22283097f8f.27.1788154975401;
        Sun, 30 Aug 2026 22:42:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb284cbsm20138400f8f.30.2026.08.30.22.42.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 22:42:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 6.6.y] arm64: mm: clear extra idmap level before use
Date: Mon, 31 Aug 2026 07:42:47 +0200
Message-Id: <20260831054247.33352-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_224257_809168_E87A471B 
X-CRM114-Status: GOOD (  14.54  )
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

The 6.6.y adaptation of commit 0e9df1c905d8 ("arm64: mm: Don't remap
pgtables for allocate vs populate") removes the clearing performed by
early_pgtable_alloc().  Its replacement clears allocations made by the
generic page-table walkers, but 6.6's create_idmap() still allocates an
extra root level directly when a sub-48-bit VA kernel is loaded
sufficiently high in physical memory.

memblock_phys_alloc_range() does not zero the returned memory.  The direct
caller therefore publishes an uncleared root page and passes it to
__create_pgd_mapping().  A stale nonzero entry can trip the bad-descriptor
BUG_ON or be followed as a page-table descriptor, preventing the kernel
from booting.

Clear the direct allocation through its linear alias before publishing it.
init_clear_pgtable() also supplies the barrier required before the table
descriptor becomes visible.

Mainline is not affected because commit e6128a8e523c ("arm64: mm: Use
48-bit virtual addressing for the permanent ID map") removed the dynamic
extra level before page-table initialization moved out of the allocator.

Fixes: 54322d95309d ("arm64: mm: Don't remap pgtables for allocate vs populate")
---
A deterministic QEMU A/B used 16 KiB pages, a 36-bit VA, a 48-bit PA, an
Image loaded at 0x1000200000, and test-only instrumentation that filled the
extra root with 0x02.  The affected kernel hit the expected bad-descriptor
BUG_ON.  With this patch, the same poisoned allocation survived
create_idmap() before the test stopped deliberately.

The injected contents make the allocator's permitted nonzero return
deterministic; they do not estimate real-world incidence.

Tested on:
  6.6.y a4a971135a2ff64382ae4235b3ae60503bb1036a (Linux 6.6.155)

 arch/arm64/mm/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e075792d722575d38488e8352df8947c6aaddd2b..4e9e997e08daf543e5c09799563f991a9f8a7cc0 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -777,9 +777,10 @@ static void __init create_idmap(void)
 	/* check if we need an additional level of translation */
 	if (VA_BITS < 48 && idmap_t0sz < (64 - VA_BITS_MIN)) {
 		pgd_phys = early_pgtable_alloc(PAGE_SHIFT);
+		pgd = __va(pgd_phys);
+		init_clear_pgtable(pgd);
 		set_pgd(&idmap_pg_dir[start >> VA_BITS],
 			__pgd(pgd_phys | P4D_TYPE_TABLE));
-		pgd = __va(pgd_phys);
 	}
 	__create_pgd_mapping(pgd, start, start, size, PAGE_KERNEL_ROX,
 			     early_pgtable_alloc, 0);
-- 
2.39.5 (Apple Git-154)

