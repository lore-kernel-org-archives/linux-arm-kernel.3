Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2A2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 13:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FFAdI552;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=DP6Ih9JU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:Date
	:From:Cc:To:References:In-Reply-To:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J4UXRSWdp9L+slM0l5w1zWdkgLQIsp44pt/Clrth68c=; b=FFAdI552gpeduj
	ElbLflLlWsGhcBklpHM8X/ByLBy3+Pu+/SsshRIETYRqkJgSEhtKiBBjylRnzAnqjzL+Nj9pSWhU9
	RjlQLzgIIM8AtEr8HXAWEXl6LovKA5e2mrUxH9oVm1VlM9g1aHlBVUpdjY0f9EldXAEAgN9wFA1eb
	BhqcyYzwF3l3CpDokk3W8hgtMuAtgGy22SfnttmAYsYWhM5uQtr/+tH9i7uNGRE6lngvpjGITyIc4
	IpB5Ne+DElaSWXHVVCm1gcCCAlWtcxlu3dQP8EYKae675QrL+76h8bVqanocvFfsaLIJcftnw25Ik
	2cbabJdNtxhkssR84m5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKmz-00000002bi1-0rJX;
	Mon, 26 Oct 2026 13:31:01 +0000
Received: from va-1-114.ptr.blmpb.com ([209.127.230.114])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKmx-00000002bfv-01Og
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 13:31:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793021448; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=J4UXRSWdp9L+slM0l5w1zWdkgLQIsp44pt/Clrth68c=;
 b=DP6Ih9JUTFHJoJ6beHoY5BaEe7d958V6WxgXvakOnJLZXpVkQEOcM0/N0cKL8kgrOk1NQw
 cdXwr5CfUFsWgpejmChAasJS28yJSGdTRnAIRuPwr0vOkGJI2pPv5vnX7A+D7s4XKE/yMt
 LN7YPQxWeCtsu+Wzgv7ckda0sM1xuuV3AmxVUyZLbQCQaP1vCFcQm2HtQsLCNZJPxDwGjw
 JAnrx9LXT5xkjzKqaIk5+wTtR3KGbOnmfCaa+RBsQ3giDBE8rciRgjP8JhiWM51rv1ed6j
 ZsmD9MbUg1nJgkR3Xg0miLmNUxT1UN1/Z71kuoXZMxFBvevjpwLmA690gREaOQ==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] arm64/mm: restrict transparent contpte mappings to valid PTEs
X-Lms-Return-Path: <lba+26adf5606+efad95+lists.infradead.org+zhaogongyi@bytedance.com>
In-Reply-To: <1c0141e8-3033-4f59-b247-34dee14cbb1f@kernel.org>
References: <20261013093600.54995-1-zhaogongyi@bytedance.com> <daab2f45-56c2-48ad-a24f-aa4f889e4da2@kernel.org> <e0f60526-bb95-4d39-9a7a-72cdf32ca5b6@bytedance.com> <cc2e3af6-bb56-41b1-9cde-151797c3068d@kernel.org> <3b57c214-6a43-4fc7-a531-fb5eac196465@bytedance.com> <1c0141e8-3033-4f59-b247-34dee14cbb1f@kernel.org>
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, <catalin.marinas@arm.com>, 
	<will@kernel.org>, "Ryan Roberts" <Ryan.Roberts@arm.com>
Cc: <dev.jain@arm.com>, <baolin.wang@linux.alibaba.com>, 
	<lance.yang@linux.dev>, <mark.rutland@arm.com>, 
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <liam@infradead.org>, 
	<vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>, 
	<mhocko@suse.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
	<stable@vger.kernel.org>
User-Agent: Mozilla Thunderbird
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Date: Mon, 26 Oct 2026 21:30:08 +0800
Message-Id: <52e7e1f6-3535-474d-9b46-6bb62f96eefc@bytedance.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_063059_119327_368D0B43 
X-CRM114-Status: GOOD (  11.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/25/26 8:34 PM, David Hildenbrand (Arm) wrote:
> 
> Can you paste the code here for easy review if that it the right approach?
> 

Hi David,

Sure. Here is the minimal prototype I tested. It leaves
contpte_set_ptes() unchanged, so present-invalid PTEs can retain
PTE_CONT. The pte_present() check excludes swap entries, where the
same bit position can be part of the swap offset.

diff --git a/arch/arm64/include/asm/pgtable.h 
b/arch/arm64/include/asm/pgtable.h
index 6000905a2..2f89959ec 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -185,6 +185,7 @@ static __always_inline bool pte_present(pte_t pte)
   * Returns true if the pte is valid and has the contiguous bit set.
   */
  #define pte_valid_cont(pte)	(pte_valid(pte) && pte_cont(pte))
+#define pte_present_cont(pte)	(pte_present(pte) && pte_cont(pte))
  /*
   * Could the pte be present in the TLB? We must check mm_tlb_flush_pending
   * so that we don't erroneously return false for pages that have been
@@ -1704,7 +1705,7 @@ static __always_inline void 
contpte_try_fold(struct mm_struct *mm,
  static __always_inline void contpte_try_unfold(struct mm_struct *mm,
  				unsigned long addr, pte_t *ptep, pte_t pte)
  {
-	if (unlikely(pte_valid_cont(pte)))
+	if (unlikely(pte_present_cont(pte)))
  		__contpte_try_unfold(mm, addr, ptep, pte);
  }

The diff is against 24a19b953e2a. The runtime tests used the same
changes on an arm64 tree whose base pgtable.h and contpte.c blobs
matched. In a QEMU/KVM guest with KASAN enabled, the guard-marker
reproducer passed 100 iterations, and the fork and PMD-split probes
passed five runs each, without warnings or KASAN reports. The
unmodified kernel failed on the first guard-marker iteration in the
earlier A/B test.

This shows that the reported failure can be prevented by a small
change to the unfold check. As Catalin pointed out, this prototype
does not extend pte_batch_hint() to present-invalid entries or address
the other pte_valid_cont() users. I agree with taking v2 as the current
fix and considering the broader grouping changes separately.

Thanks,
Gongyi

