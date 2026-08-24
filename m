Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D9AC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HODHgPFWcmpM4OrWXnRIwysDZ/R1pibvtBSqDnsLNw=; b=3V3cc+lHMip3fdPERN/X4Bfrdv
	Uh8hjJAh3xr7iuzOKlqQtCKQKFrz2LHvPlFW1sTb1CVbxKSBi75CHwCefKFcjQa3XWSzy3sHAHHez
	eOsxw+uWXu5j+cI9SqdMnXjG7ctPtmYTBr+MlvOEL6kFFvanikVewjXf9cuqNwf7SfXfPHXSW0z1C
	t/460udIZkab7ov565Z/pqNnwwZLJv/OzdTxJZJCpo0UipOS5c1YrjXV5k0ju0YaYxudlNcKpbOej
	gfHDvTGWGnUHJNCZ2ShRw8EkJpPc+2IEpxZ41iX7yXHZgys5P6Ae1uOrBb89YEQSCXXS3J1k9DO0D
	sxJ7tYgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXBY-0000000H0I8-1Lly;
	Mon, 24 Aug 2026 16:06:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXBR-0000000H0EY-2z4T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:06:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66CAC1BA8;
	Mon, 24 Aug 2026 09:05:57 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0779D3F85F;
	Mon, 24 Aug 2026 09:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787587561; bh=nodn3/K9trBK+2wWrkLJGeFqd0INql6u2EHBqnLbWuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mNGt+rmw+m3ruCwnhja8afWvDAIEG0qPzwe79zxnTqszfW0fgkmn7kM6QqJS5/+ej
	 jNIvAv0fF2vEvSYW8xIbW03slFbzO7/T4PlF0kwnb3MRc3Itdj++wKmSqG7vbSAzpV
	 QanHuh35qBM3KtYjRoJ5HgcXGbly8RHUXJTfOLGQ=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kernel@vger.kernel.org (open list),
	bpf@vger.kernel.org (open list:BPF [GENERAL] (Safe Dynamic Programs and Tools)),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT - CORE)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH 4/7] maccess: Use a scoped guard for page faults
Date: Mon, 24 Aug 2026 17:04:49 +0100
Message-ID: <20260824160523.3907021-5-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824160523.3907021-1-usama.anjum@arm.com>
References: <20260824160523.3907021-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_090601_846525_7932D017 
X-CRM114-Status: GOOD (  10.65  )
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

Kernel nofault copy and string paths open-code page-fault disable and
enable around label-based loops, duplicating cleanup on success and
failure.

Use a page-fault scope guard instead. Leaving the scope now re-enables
page faults on both paths without separate cleanup at the fault label.

No functional change.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 mm/maccess.c | 53 +++++++++++++++++++++++++---------------------------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/mm/maccess.c b/mm/maccess.c
index c59a0e092d24a..f695ceefe6fcc 100644
--- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -38,18 +38,17 @@ long copy_from_kernel_nofault(void *dst, const void *src, size_t size)
 	if (!size)
 		return 0;
 
-	pagefault_disable();
-	if (!(align & 7))
-		copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
-	if (!(align & 3))
-		copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
-	if (!(align & 1))
-		copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
-	copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
-	pagefault_enable();
+	scoped_guard(pagefault) {
+		if (!(align & 7))
+			copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
+		if (!(align & 3))
+			copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
+		if (!(align & 1))
+			copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
+		copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
+	}
 	return 0;
 Efault:
-	pagefault_enable();
 	return -EFAULT;
 }
 EXPORT_SYMBOL_GPL(copy_from_kernel_nofault);
@@ -73,18 +72,17 @@ long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
 	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
 		align = (unsigned long)dst | (unsigned long)src;
 
-	pagefault_disable();
-	if (!(align & 7))
-		copy_to_kernel_nofault_loop(dst, src, size, u64, Efault);
-	if (!(align & 3))
-		copy_to_kernel_nofault_loop(dst, src, size, u32, Efault);
-	if (!(align & 1))
-		copy_to_kernel_nofault_loop(dst, src, size, u16, Efault);
-	copy_to_kernel_nofault_loop(dst, src, size, u8, Efault);
-	pagefault_enable();
+	scoped_guard(pagefault) {
+		if (!(align & 7))
+			copy_to_kernel_nofault_loop(dst, src, size, u64, Efault);
+		if (!(align & 3))
+			copy_to_kernel_nofault_loop(dst, src, size, u32, Efault);
+		if (!(align & 1))
+			copy_to_kernel_nofault_loop(dst, src, size, u16, Efault);
+		copy_to_kernel_nofault_loop(dst, src, size, u8, Efault);
+	}
 	return 0;
 Efault:
-	pagefault_enable();
 	return -EFAULT;
 }
 
@@ -97,18 +95,17 @@ long strncpy_from_kernel_nofault(char *dst, const void *unsafe_addr, long count)
 	if (!copy_from_kernel_nofault_allowed(unsafe_addr, count))
 		return -ERANGE;
 
-	pagefault_disable();
-	do {
-		__get_kernel_nofault(dst, src, u8, Efault);
-		dst++;
-		src++;
-	} while (dst[-1] && src - unsafe_addr < count);
-	pagefault_enable();
+	scoped_guard(pagefault) {
+		do {
+			__get_kernel_nofault(dst, src, u8, Efault);
+			dst++;
+			src++;
+		} while (dst[-1] && src - unsafe_addr < count);
+	}
 
 	dst[-1] = '\0';
 	return src - unsafe_addr;
 Efault:
-	pagefault_enable();
 	dst[0] = '\0';
 	return -EFAULT;
 }
-- 
2.47.3


