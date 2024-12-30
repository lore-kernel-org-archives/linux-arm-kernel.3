Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8273CE77194
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 04:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLPKLeCfQ1ijGlwaEdWBBWtId0IsiPV7Gw+/VyTOg0k=; b=JYmd/BkzZ4hIOERwkLmOJ9Fzgm
	wgLAiA+kYwaGfcV/yTS0jBFv+7trtiHIptnPhKA4ucrMJTQytyXr332dgMjNcIwoaGM8EDlWz3/8i
	JRVIRk3xp0oaTsAtKdlb48OQuotzd4+lkhd64beAZan3mRuTUOsYZk1B8CBwuYv9s9O141gn2Cxpj
	cbQf9RWwyEGtsvABRp+f99CPrf49ASL7yymCW7e8te28ec/f/vruE7zsSIwK5sWiqRJIR+2iG0hrS
	sD0eaM1tjshc0AId5s+SpgFbmhxPadFNvd6tF17THKRntI2HGsrKlo/S5ICUwi7yLORmMAawXS6U2
	Ho06YP6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS7pr-00000004Xsl-3j2x;
	Mon, 30 Dec 2024 04:56:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS7oj-00000004Xj7-0jOX;
	Mon, 30 Dec 2024 04:55:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB418A40336;
	Mon, 30 Dec 2024 04:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0FAC4CED0;
	Mon, 30 Dec 2024 04:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1735534547;
	bh=AJswIJAQd5FETiIh0u+rfDfZfqamfQp06InUDAPDuXA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rhe3QlxDLrSSLi3sUiu8VVb+GHWge7MOiJcFxtA8oK28fW9HmGNW19VjrwSTcCGgb
	 r2YmGYGxTSfcYGqg8CrarFXVALRtvCpH5QUm8X8Dcox5YzUhoHoyUwOYqQ6lnY9L2Q
	 H2PY79bq6wwE7WdNlWq8aScHu3jsSCDF3yqMjhok=
Date: Sun, 29 Dec 2024 20:55:45 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Mike Rapoport <rppt@kernel.org>, kevin.brodsky@arm.com,
 peterz@infradead.org, agordeev@linux.ibm.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
Subject: Re: [PATCH v3 15/17] mm: pgtable: remove tlb_remove_page_ptdesc()
Message-Id: <20241229205545.e4fa797886f30cb20c38ad06@linux-foundation.org>
In-Reply-To: <9cac5690-c570-4d43-a6bc-2b59b85497ae@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
	<b37435768345e0fcf7ea358f69b4a71767f0f530.1734945104.git.zhengqi.arch@bytedance.com>
	<Z2_EPmOTUHhcBegW@kernel.org>
	<9cac5690-c570-4d43-a6bc-2b59b85497ae@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_205549_666019_9B155C65 
X-CRM114-Status: GOOD (  12.55  )
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

On Mon, 30 Dec 2024 11:12:00 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:

> > For now struct ptdesc overlaps struct page, but the goal is to have them
> > separate and always operate on struct ptdesc when working with page tables.
> 
> OK, so tlb_remove_page_ptdesc() and tlb_remove_ptdesc() are somewhat
> intermediate products of the project.
> 
> Hi Andrew, can you help remove [PATCH v3 15/17], [PATCH v3 16/17] and
> [PATCH v3 17/17] from the mm-unstable branch?
> 
> For [PATCH v3 17/17], I can send it separately later, or Kevin Brodsky
> can help do this in his patch series. ;)

I think it would be best if you were to send a v4 series.  Please
ensure that the changelogs are appropriately updated to reflect these
(and any other) changes.


