Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6B5C5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lhzQ8Ef5dV1+hHioph425Pq7Ajue7QfcmG8Lv/yNuk=; b=Naw4bLFUH8xhkXDh7w/jYGiFsC
	q/WVqVsb27JZ/XyA9HheobMqD3bTAkdKIIHASuBVPIpuAMAxrjcSyb+tQQfaxcMmg28eNs2vGgtnW
	Ta+N5x7kT7BkBqo4aMNIozHuPxZlAQS4fvvmM3CUCtE8FHAysAAAAU3feunWpnPcXOxCi5vrEj8Nu
	g0uS5Z+o4UbcggMX9u33rHUI9h0MbuZVOPt0hdFTi3omEQ+GCzHHUHfxN08chcWEzzs/AP/w0R1kg
	bjqASkGsWJWTaiksz8qrV8ln7Mun5GZADPFNo2VorjySrVNJba9E2FhXzEyjdx9pAcoTa+cKPHiaj
	/PDH9VSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXBY-0000000H0Hv-0tdB;
	Mon, 24 Aug 2026 16:06:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXBP-0000000H0D6-03tL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:06:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC93A1AC1;
	Mon, 24 Aug 2026 09:05:53 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 769D03F85F;
	Mon, 24 Aug 2026 09:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787587557; bh=m2SBTQpkWSQqtHWMxAh9TvwsKocaEw70262S7IijE4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IJ4nzVehS8Hj4+HT2oldjrWLZfDgo41bmtZTUlst4kclYjz6JGUKaYe6MBCCvzi8t
	 7KG05+LCjlzm0mxwo5U1+zEPCt1LJnfci69d5G/n9XN09VbrmnvKqGB7eAhMcCqd+S
	 ZBYO+C1F8Knznuik3pACO1Cht3v7ezOhwpBKTvfg=
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
Subject: [PATCH 3/7] maccess: Skip setup for zero-sized kernel nofault copies
Date: Mon, 24 Aug 2026 17:04:48 +0100
Message-ID: <20260824160523.3907021-4-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824160523.3907021-1-usama.anjum@arm.com>
References: <20260824160523.3907021-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_090559_100429_40643520 
X-CRM114-Status: GOOD (  10.23  )
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

A zero-sized kernel nofault copy does not enter an access loop, but it
still disables and re-enables page faults.

Zero sizes are valid. BPF probe-read helpers accept them, and KGDB memory
packets may carry a zero length.

Return before changing page-fault state when there is nothing to copy.
For reads, keep architecture-specific address validation before the fast
path so its behavior is unchanged.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 mm/maccess.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/maccess.c b/mm/maccess.c
index 486559d688583..c59a0e092d24a 100644
--- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -35,6 +35,8 @@ long copy_from_kernel_nofault(void *dst, const void *src, size_t size)
 
 	if (!copy_from_kernel_nofault_allowed(src, size))
 		return -ERANGE;
+	if (!size)
+		return 0;
 
 	pagefault_disable();
 	if (!(align & 7))
@@ -65,6 +67,9 @@ long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
 {
 	unsigned long align = 0;
 
+	if (!size)
+		return 0;
+
 	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
 		align = (unsigned long)dst | (unsigned long)src;
 
-- 
2.47.3


