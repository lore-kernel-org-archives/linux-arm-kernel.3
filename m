Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D10CFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yQbiiv0Vf+2505Xy7ivR6FqbF/Y+NWBphkmMi6/ATIs=; b=VTOm7Opj8DjK5e
	4VN6QKjJl72irS5wVlXdVd1Bonku4yyi+3hnOH2njLM6AGJGXUXcOIc9XVK3/oo5266qmaB+cSGsM
	UlwEWOKK9Rz10NwKZmJiac0h3zvb3Yw9x4u/fuqiD9ZAfcsg6YYXMNwzg7GyXhFSNA9I10LxRDhkt
	/YHjfBsq3qOZ24LEImIcNSW3ko+FIH5Nt7hDosI6P0jgyiH9RJ3hlssxJhpao/aNvJEgWn76f2ruE
	s4g/Fth8+eVQK1Hjy30otg7gpLLx49hYx2/QxaGuBTejx0mWZJyie9C5LDWsl61JWgFfPoOwSPv7P
	Xvh+Q1wjHKX+JH0ar1aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINEt-000000054F0-0tPb;
	Thu, 30 Apr 2026 08:59:19 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINEp-000000054DE-1lbx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 08:59:17 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 63U8wKQk074189;
	Thu, 30 Apr 2026 16:58:20 +0800 (+08)
	(envelope-from zhaoyang.huang@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX01.spreadtrum.com [10.0.64.7])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4g5p0V5Trhz2MHhwM;
	Thu, 30 Apr 2026 16:55:22 +0800 (CST)
Received: from bj03382pcu03.spreadtrum.com (10.0.73.40) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Thu, 30 Apr 2026 16:58:18 +0800
From: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Zhaoyang Huang <huangzhaoyang@gmail.com>, <steve.kang@unisoc.com>
Subject: [PATCHv3] arch: arm64: fix KERNEL_SEGMENT_COUNT error
Date: Thu, 30 Apr 2026 16:58:08 +0800
Message-ID: <20260430085808.2951417-1-zhaoyang.huang@unisoc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.73.40]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL: SHSQR01.spreadtrum.com 63U8wKQk074189
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
	s=default; t=1777539513;
	bh=yQbiiv0Vf+2505Xy7ivR6FqbF/Y+NWBphkmMi6/ATIs=;
	h=From:To:Subject:Date;
	b=th3+sdgl4EPjhpTnWjOdQaPClbAEnADwWLbDiO/4ld9Sqw66BMWkH4HtlcGIVxXI9
	 /a8jQ+Cmc6wts7kLTr+4AJhK+ZNnjtShlrWOBy0q9wv21oF+R7QzvG37dWa52374yh
	 sRwpwbYkK5fwF31NZ/sZ3iJ4BN05rVj4u7gg59Y3XURE7b9f5fmnx/tXOdHrmIPpt/
	 GG/sUd6TVXffbfy2igYW7UA2/6SCc3BjvyV2Nuf12+VdOQtc6opmiBXujvvcicIKlE
	 IQDglw3ly2PtKmaUd23GVko40Hrw568LVKgCthWhJqIFNXF2ua8M6U8zRtCPv7dlob
	 YtJiiRjiUmsPA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_015916_084693_18F161AA 
X-CRM114-Status: GOOD (  12.82  )
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

From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>

During debug of a kernel panic, we find that the pte_t of the final
part of [data, end] segment got overflow to the next page of
init_pg_end[1] which is the gap page before early_init_stack[2].
This should be introduced by the KERNEL_SEGMENT_COUNT's value is 5
which should be 6 as map_segment are called 6 times for the segments
of (text, stext, rodata, inittext, initdata, data+bss)

[1]
crash_arm64_v9.0.1> vtop ffffffed00601000
VIRTUAL           PHYSICAL
ffffffed00601000  83401000

PAGE DIRECTORY: ffffffecffd62000
   PGD: ffffffecffd62da0 => 10000000833fb003
   PMD: ffffff80033fb018 => 10000000833fe003
   PTE: ffffff80033fe008 => 68000083401f03
  PAGE: 83401000

     PTE        PHYSICAL  FLAGS
68000083401f03  83401000  (VALID|SHARED|AF|NG|PXN|UXN)

      PAGE       PHYSICAL      MAPPING       INDEX CNT FLAGS
fffffffec00d0040 83401000                0        0  1 4000 reserved

[2]
ffffffed002c8000 (r) __pi__data
ffffffed0054e000 (d) __pi___bss_start
ffffffed005f5000 (b) __pi_init_pg_dir
ffffffed005fe000 (b) __pi_init_pg_end
ffffffed005ff000 (B) early_init_stack
ffffffed00608000 (b) __pi__end

Fixes: 5973a62efa34 ("arm64: map [_text, _stext) virtual address range non-executable+read-only")
Assisted-by: TRAE: GLM-5.1
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
---
Patchv2: make the size of vmlinux_reg[] more reasonable
Patchv3: use extra value of 2 to meet the final segments count
---
---
 arch/arm64/include/asm/kernel-pgtable.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kernel-pgtable.h b/arch/arm64/include/asm/kernel-pgtable.h
index 74a4f738c5f5..f6aed326e1ce 100644
--- a/arch/arm64/include/asm/kernel-pgtable.h
+++ b/arch/arm64/include/asm/kernel-pgtable.h
@@ -68,7 +68,9 @@
 #define KERNEL_SEGMENT_COUNT	5
 
 #if SWAPPER_BLOCK_SIZE > SEGMENT_ALIGN
-#define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 1)
+
+/* [_text, _stext) is mapped separately which consume 1 extra page */
+#define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 2)
 /*
  * The initial ID map consists of the kernel image, mapped as two separate
  * segments, and may appear misaligned wrt the swapper block size. This means
-- 
2.25.1


