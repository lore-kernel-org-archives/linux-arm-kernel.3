Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895A4C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 09:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZteLwuA1bmLYzwnL2LaYDuIzt8I84fe5eenU5nTxc/4=; b=xBbBvnMZQxLVa7xKqecW78fxMJ
	Wk/c49dlgQQUowuBTTrxr1Z2f7hA34wkEEv1JHATMkzEz8EzGHI3nAgghmuedpJA2ijZvrNOsYLAN
	5fZcK9uDLyHI8h7+wNuU14pLdbLY8wS9f2jeh2dFcDKFGZ6sXVxTRcuaopcvr4l4JkYD+2bA4mGYe
	TAupt/ULzT1AGm6/B8Pc0vwiPlNiheid+s31dJfDG6JbKVmYirc8O3aCqzIln8rHWTn6GqcWc05jk
	3fz/aGsp+7nCkEwduNo+mbDpbU3Rz8m8FRh0K361vj4V+DsXYoxHWiNJJlmMgSC5aLPtBHzSfXt4g
	HLhoDgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3B9g-0000000DHFf-30W6;
	Fri, 11 Apr 2025 09:58:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Aa0-0000000DBmx-32ul
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 09:21:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88E5D44F30;
	Fri, 11 Apr 2025 09:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A46C4CEE2;
	Fri, 11 Apr 2025 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744363304;
	bh=TU38Yz0wslbhAhgiT67MgDKR2lBijTLSXefhthfuYAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SjXHwmnMOpa/T9EDIGZIX3IDPYF02ahzYO+YFFts9WBT9LzVU+sYE7lMFunEOQ6jC
	 i3wle5PIGi0XEF7KoFSrobsHG4iLPceRLhg3C6GU3Ry3UNp7hkKNQcQYQ/s4/NLn+3
	 Q0EFYQ0FW4/p5igzjZmcqVsIOYDmArkMmLPPFLrgyi5FToLl/MbdIPVJjn76QEOMPC
	 i53dzsttNM1if0JeK0UXoTKlynDInlA6vtJAPClKBzRETPL9clMN33KrpH1gQo6+bh
	 5/FPJTOH4S0Pe27UzE9YpsNYeyXYnrbnG+Ca6jrZMF65hsEqwfCPUL/tiO65R1C7rW
	 ATb6+H13FBf2A==
Date: Fri, 11 Apr 2025 11:21:30 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: Re: [RFC PATCH v4 00/18] pkeys-based page table hardening
Message-ID: <Z_jfGlOEb4Bjl3vO@gmail.com>
References: <20250411091631.954228-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411091631.954228-1-kevin.brodsky@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_022144_807084_06861D5F 
X-CRM114-Status: GOOD (  11.65  )
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


* Kevin Brodsky <kevin.brodsky@arm.com> wrote:

> Performance
> ===========
> 
> Caveat: these numbers should be seen as a lower bound for the overhead
> of a real POE-based protection. The hardware checks added by POE are
> however not expected to incur significant extra overhead.
> 
> +-------------------+----------------------------------+------------------+---------------+
> | Benchmark         | Result Class                     | Without batching | With batching |
> +===================+==================================+==================+===============+
> | mmtests/kernbench | elsp-64                          |            0.20% |         0.20% |
> |                   | syst-64                          |            1.62% |         0.63% |
> |                   | user-64                          |           -0.04% |         0.05% |
> +-------------------+----------------------------------+------------------+---------------+
> | micromm/fork      | fork: p:1                        |      (R) 225.56% |        -0.07% |
> |                   | fork: p:512                      |      (R) 254.32% |         0.73% |
> +-------------------+----------------------------------+------------------+---------------+
> | micromm/munmap    | munmap: p:1                      |       (R) 24.49% |         4.29% |
> |                   | munmap: p:512                    |      (R) 161.47% |     (R) 6.06% |
> +-------------------+----------------------------------+------------------+---------------+
> | micromm/vmalloc   | fix_size_alloc_test: p:1, h:0    |       (R) 14.80% |    (R) 11.85% |
> |                   | fix_size_alloc_test: p:4, h:0    |       (R) 38.42% |    (R) 10.47% |
> |                   | fix_size_alloc_test: p:16, h:0   |       (R) 64.74% |     (R) 6.41% |
> |                   | fix_size_alloc_test: p:64, h:0   |       (R) 79.98% |     (R) 3.24% |
> |                   | fix_size_alloc_test: p:256, h:0  |       (R) 85.46% |     (R) 2.77% |
> |                   | fix_size_alloc_test: p:16, h:1   |       (R) 47.89% |         3.10% |
> |                   | fix_size_alloc_test: p:64, h:1   |       (R) 62.43% |         3.36% |
> |                   | fix_size_alloc_test: p:256, h:1  |       (R) 64.30% |     (R) 2.68% |
> |                   | random_size_alloc_test: p:1, h:0 |       (R) 74.94% |     (R) 3.13% |
> |                   | vm_map_ram_test: p:1, h:0        |       (R) 30.53% |    (R) 26.20% |
> +-------------------+----------------------------------+------------------+---------------+

So I had to look 3 times to figure out what the numbers mean: they are 
the extra overhead from this hardening feature, measured in system time 
percentage, right?

So "4.29%" means there's a 4.29% slowdown on that particular workload 
when the feature is enabled. Maybe add an explanation to the next iteration? :-)

Thanks,

	Ingo

