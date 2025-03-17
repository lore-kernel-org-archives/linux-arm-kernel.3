Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE52C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 15:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E28zglszNSgNs5nxBqGH9ihoTQywx6FCChBvwXjU3Lc=; b=cdCGWZZXgHPG7Y0MQ7si/xGPtM
	HYDq0f8gNsW1Ezuv6rFIDNFrMnV5J3F8jgYr9vb81MifQfs6IBecEmpnvh7Kx6gp6x88z4gXhHaC1
	6lJIgrcu3YNsTX9woNtti2Nj6GIN/SR6p//BKlZQDJed6hdTTB4hlofgs95jbLMTGT5T4YCFHifQ8
	9NdATlFaeG8AbtgeT6ExHJWai7I72AxuqYeFuersuxXqVj/r6+dbz5KoP2wSU10+rZ3nWNK7i7r0T
	4TqXSBJhiXHkc5zw0OrgpKEDhfEHNun8HfscHO7JG+nPRZf+0vVQm84++D+HBNHs/7hy4KVBnbUu2
	wc4l4EHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCSF-000000039sF-32je;
	Mon, 17 Mar 2025 15:32:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCQZ-000000039Tg-0umr;
	Mon, 17 Mar 2025 15:30:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3164013D5;
	Mon, 17 Mar 2025 08:31:03 -0700 (PDT)
Received: from [10.57.84.137] (unknown [10.57.84.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 421503F694;
	Mon, 17 Mar 2025 08:30:49 -0700 (PDT)
Message-ID: <70349335-84ee-4bca-a3d6-d7cf3c05b92b@arm.com>
Date: Mon, 17 Mar 2025 15:30:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Always call constructor for kernel page tables
Content-Language: en-GB
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mark Rutland <mark.rutland@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, Qi Zheng
 <zhengqi.arch@bytedance.com>, Will Deacon <will@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20250317141700.3701581-1-kevin.brodsky@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250317141700.3701581-1-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_083055_304379_BDC42AA2 
X-CRM114-Status: GOOD (  11.93  )
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

On 17/03/2025 14:16, Kevin Brodsky wrote:
> The complications in those special pgtable allocators beg the question:
> does it really make sense to treat efi_mm and init_mm differently in
> e.g. apply_to_pte_range()? Maybe what we really need is a way to tell if
> an mm corresponds to user memory or not, and never use split locks for
> non-user mm's. Feedback and suggestions welcome!

The difference in treatment is whether or not the ptl is taken, right? So the
real question is when calling apply_to_pte_range() for efi_mm, is there already
a higher level serialization mechanism that prevents racy accesses? For init_mm,
I think this is handled implicitly because there is no way for user space to
cause apply_to_pte_range() for an arbitrary piece of kernel memory. Although I
can't even see where apply_to_page_range() is called for efi_mm.

FWIW, contpte.c has mm_is_user() which is used by arm64.

Thanks,
Ryan

