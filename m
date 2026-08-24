Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3F2C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruNSXO6+hub5hhAXwMAn+u90C58s72NfnpcMVIePf5c=; b=X8qEg2a8n6fYWwwL8cVRyD0UOV
	q5xDDbhlV0Sm3r6MvnslCKaTNHbrxhOnqadTAgNLBh8wX0qmgZLARCdieMjA4n/UJC4HGYkhbSdJ8
	OqjZGjYpUVcCaZTr+XgmkRSDDTFtguBgZhV/XbKjFqvtlH7naD67VLN0PMhz+XGiiXGwhmz3HzBso
	5zu1p88JabV355/Wn+RJMa6tA0tZiJAvhCUPmuXxPt/4mw0FUWW3eLdFgTCGyOAtck1O6n2RU7CqV
	NH0TnLJ5p87DvCJVUncjejRw78YiSdGRB8D2+Txg3sSmaSxLYDoHAs4nyQOg+6dyUtlQtnOYm6SFO
	TkD1cuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXBp-0000000H0WU-33g2;
	Mon, 24 Aug 2026 16:06:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXBY-0000000H0Is-3tOZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:06:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 684411756;
	Mon, 24 Aug 2026 09:06:04 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C5DE3F85F;
	Mon, 24 Aug 2026 09:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787587568; bh=RrebhXATXwELFIUm3sfpDdh92ACD3QNlTwQzpg9AkNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jc91idwUPeyzoMBCcMqqcJfBY/NipSip+nx0Vu2SSHMLt0GB1cy1vcJ0XIHfHuDVt
	 ZfysIhqHXV5A+RsGPMQs5ObrYLtPAo5PLdYurj6y9VDAQ+21gPimS5kpua6pOqy5p/
	 cu3IO/eY89jF1Cl+5pzRLPOStBWlPPk/3hQnsiX0=
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
Subject: [PATCH 5/7] maccess: Batch TCO handling in kernel nofault loops
Date: Mon, 24 Aug 2026 17:04:51 +0100
Message-ID: <20260824160523.3907021-7-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824160523.3907021-1-usama.anjum@arm.com>
References: <20260824160523.3907021-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_090609_092517_1004AEE8 
X-CRM114-Status: GOOD (  12.15  )
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

With Hardware Tag-Based KASAN in asynchronous or asymmetric mode, every
arm64 kernel nofault access sets and clears PSTATE.TCO. Copy and string
loops repeat that pair even though tag checking can stay disabled for the
whole operation.

Cover each non-empty operation with one bare nofault region and use bare
accessors in the loop. Leaving the region restores TCO before page faults
are enabled again, including after an access fault. Existing empty-work
checks ensure that every new region performs at least one access.

The number of dynamic MSR TCO executions therefore changes as follows:

    Work                         Before    After
    N nofault accesses          2N        2
    4 KiB nofault copy          1,024     2
    N-byte strncpy              2N        2

The 4 KiB case assumes 512 64-bit accesses. These figures come from the
control flow rather than a runtime measurement, so the time saved depends
on the CPU and workload. Generic fallbacks leave other architectures
unchanged.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 mm/maccess.c | 48 +++++++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/mm/maccess.c b/mm/maccess.c
index f695ceefe6fcc..87486bf98d15a 100644
--- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -19,7 +19,7 @@ bool __weak copy_from_kernel_nofault_allowed(const void *unsafe_src,
  */
 #define copy_from_kernel_nofault_loop(dst, src, len, type, err_label)	\
 	while (len >= sizeof(type)) {					\
-		__get_kernel_nofault(dst, src, type, err_label);	\
+		__get_kernel_nofault_bare(dst, src, type, err_label);	\
 		kmsan_check_memory(src, sizeof(type));			\
 		dst += sizeof(type);					\
 		src += sizeof(type);					\
@@ -39,13 +39,15 @@ long copy_from_kernel_nofault(void *dst, const void *src, size_t size)
 		return 0;
 
 	scoped_guard(pagefault) {
-		if (!(align & 7))
-			copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
-		if (!(align & 3))
-			copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
-		if (!(align & 1))
-			copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
-		copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
+		scoped_guard(__kernel_nofault_bare) {
+			if (!(align & 7))
+				copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
+			if (!(align & 3))
+				copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
+			if (!(align & 1))
+				copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
+			copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
+		}
 	}
 	return 0;
 Efault:
@@ -55,7 +57,7 @@ EXPORT_SYMBOL_GPL(copy_from_kernel_nofault);
 
 #define copy_to_kernel_nofault_loop(dst, src, len, type, err_label)	\
 	while (len >= sizeof(type)) {					\
-		__put_kernel_nofault(dst, src, type, err_label);	\
+		__put_kernel_nofault_bare(dst, src, type, err_label);	\
 		instrument_write(dst, sizeof(type));			\
 		dst += sizeof(type);					\
 		src += sizeof(type);					\
@@ -73,13 +75,15 @@ long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
 		align = (unsigned long)dst | (unsigned long)src;
 
 	scoped_guard(pagefault) {
-		if (!(align & 7))
-			copy_to_kernel_nofault_loop(dst, src, size, u64, Efault);
-		if (!(align & 3))
-			copy_to_kernel_nofault_loop(dst, src, size, u32, Efault);
-		if (!(align & 1))
-			copy_to_kernel_nofault_loop(dst, src, size, u16, Efault);
-		copy_to_kernel_nofault_loop(dst, src, size, u8, Efault);
+		scoped_guard(__kernel_nofault_bare) {
+			if (!(align & 7))
+				copy_to_kernel_nofault_loop(dst, src, size, u64, Efault);
+			if (!(align & 3))
+				copy_to_kernel_nofault_loop(dst, src, size, u32, Efault);
+			if (!(align & 1))
+				copy_to_kernel_nofault_loop(dst, src, size, u16, Efault);
+			copy_to_kernel_nofault_loop(dst, src, size, u8, Efault);
+		}
 	}
 	return 0;
 Efault:
@@ -96,11 +100,13 @@ long strncpy_from_kernel_nofault(char *dst, const void *unsafe_addr, long count)
 		return -ERANGE;
 
 	scoped_guard(pagefault) {
-		do {
-			__get_kernel_nofault(dst, src, u8, Efault);
-			dst++;
-			src++;
-		} while (dst[-1] && src - unsafe_addr < count);
+		scoped_guard(__kernel_nofault_bare) {
+			do {
+				__get_kernel_nofault_bare(dst, src, u8, Efault);
+				dst++;
+				src++;
+			} while (dst[-1] && src - unsafe_addr < count);
+		}
 	}
 
 	dst[-1] = '\0';
-- 
2.47.3


