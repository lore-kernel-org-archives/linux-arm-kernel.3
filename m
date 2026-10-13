Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC4FCC6B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nj1TMhPOMkYB6MWx6yQQPG1mHpG2YJ3gWeRMyW8XpyQ=; b=xPFzooTmTKUagIyCZWYTRKZdIp
	Zr4XCi8hIpqDt7F60GqNcpvRVlM+0qm3zJ5p2iu9+znOa9AYrhD7O7YXaUZBCcQ+6w0BTYa0G0PPH
	7G7BlP0OP4ZkJdZsDXBtHYiC8YKSI5GhVvGZDmjBSIt0uGe7F8I7fqRmOALZjouj3fvbRCmU+iolQ
	iUGmRJ2PjeYJ4FiSeXSCI7Y4VtxoHxCoey3PiBDNc2sMU+BM09J45fboM2AyRonzZCfRZ1L//osJm
	Mg0weDHDB3lqMnayk7I+h8qCQx2DR8ZeVLVM2SmcslfwP/1myHn/PFzAajzviL3fM5ncDj/GgnPuQ
	ORzxe+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGebr-0000000DNik-35by;
	Tue, 13 Oct 2026 15:40:11 +0000
Received: from out-79.mta1.migadu.com ([2001:41d0:203:375::4f] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGebm-0000000DNhW-1qAh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:40:09 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=wvI3yQEb1pra9snQf3HMPf0AqFlWoLGzhzZcKtUO3i8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791906002; v=1; x=1792510802;
 b=CbIVFpFzbvBZ6HFblwi9Sb2Ng2vo/5CtHr8jdpUpJfyFP0rmHhgvjF6nrCEl3FMJIiJRgIr9
 ZbTVdh9AQTmDCe9FB8/Vz8xt/XXiOxJkF47VA0MZ6d/yz2HAiJ2wybh9QD08SWvhHFaU5MWfNII
 rFg/yXiVkz6lsZ4pqqBAewts=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0335801ba07d6e44;
	Tue, 13 Oct 2026 15:40:02 +0000
X-Mizu-Trace-ID: 0335801ba07d6e44
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: zhaogongyi@bytedance.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	lance.yang@linux.dev,
	mark.rutland@arm.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: restrict transparent contpte mappings to valid PTEs
Date: Tue, 13 Oct 2026 23:39:53 +0800
Message-ID: <20261013153953.77575-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261013093600.54995-1-zhaogongyi@bytedance.com>
References: <20261013093600.54995-1-zhaogongyi@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_084006_621403_069D455D 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
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


On Tue, Oct 13, 2026 at 05:36:00PM +0800, Zhao Gongyi wrote:
[...]
>
>Fixes: 4602e5757bcc ("arm64/mm: wire up PTE_CONT for user mappings")
>Cc: stable@vger.kernel.org
>Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
>---

Good catch! Thanks!

[...]
>diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>index 0acab179f..851fa2e44 100644
>--- a/arch/arm64/mm/contpte.c
>+++ b/arch/arm64/mm/contpte.c
>@@ -463,6 +463,13 @@ void contpte_set_ptes(struct mm_struct *mm, unsigned long addr,
> 	if (!mm_is_user(mm))
> 		return __set_ptes(mm, addr, ptep, pte, nr);
> 
>+	/*
>+	 * Keep the producer-side invariant documented in pgtable.h true even
>+	 * if a direct caller passes an invalid descriptor with PTE_CONT set.
>+	 */
>+	if (!pte_valid(pte))
>+		return __set_ptes(mm, addr, ptep, pte_mknoncont(pte), nr);

set_ptes() is the only in-tree caller, and it already clears PTE_CONT
before we get here ... no? Why not fold !pte_valid(pte) into the
!mm_is_user(mm) check below and return __set_ptes() directly?

	if (!mm_is_user(mm) || !pte_valid(pte))
		return __set_ptes(mm, addr, ptep, pte, nr);

If a direct caller does pass a !pte_valid PTE with PTE_CONT set, I'd
rather add a VM_WARN_ON() to catch that. Silently clearing the bit would
hide a caller bug :)

Cheers, Lance

>+
> 	end = addr + (nr << PAGE_SHIFT);
> 	pfn = pte_pfn(pte);
> 	prot = pte_pgprot(pte);
>-- 
>2.39.5 (Apple Git-154)
>

