Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D16E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 17:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EweIqVkLNnWFWe8flY8+DqF+grjHk/rnTSJtRHjg6VQ=; b=zK0Q1L/x1FxbAL5zrKt3j5FS9e
	gLpfb2Pw1g5n/p48Rxu/m5/oHN4Jn/RAlkTp+pj8I/gkQt+OikdRuj0EfczybkcYYCumcBYYioIzc
	TGby4Edi3kc0AwatW2Jt7KLOjVqfO7lgqFhFicSj6twj1CjodCe1aXVwbKRkNZ3zeSD1CIcciOrbC
	Ut66CH5aVf/FrYq7LCBfI/gtAzEkQrcwOgc2vnGW8QGY3t/CbI3dtmfmcsu52cTxnC9fImz1TDTbm
	6ldXk4KRWWqPluoRe6usjHcluEX09uosXOcx0njOq1xH3X4uVECIRCHThY/qLsDxCRZjxuWCo+qCS
	ELBn/hRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbvB-00000002Ilh-40F6;
	Fri, 06 Dec 2024 17:15:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbtB-00000002ISW-2PAW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 17:13:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59F7C5C6404;
	Fri,  6 Dec 2024 17:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9357C4CED1;
	Fri,  6 Dec 2024 17:13:09 +0000 (UTC)
Date: Fri, 6 Dec 2024 17:13:07 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
	mark.rutland@arm.com, joey.gouly@arm.com,
	dave.hansen@linux.intel.com, akpm@linux-foundation.org,
	chenfeiyang@loongson.cn, chenhuacai@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: mm: vmemmap populate to page level if not
 section aligned
Message-ID: <Z1Mwo5OajFZQYlOg@arm.com>
References: <20241121071256.487220-1-quic_zhenhuah@quicinc.com>
 <20241121071256.487220-2-quic_zhenhuah@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121071256.487220-2-quic_zhenhuah@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_091313_654952_A7113E1A 
X-CRM114-Status: GOOD (  15.64  )
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

On Thu, Nov 21, 2024 at 03:12:55PM +0800, Zhenhua Huang wrote:
> Commit 2045a3b8911b ("mm/sparse-vmemmap: generalise vmemmap_populate_hugepages()")
> optimizes the vmemmap to populate at the PMD section level.

Wasn't the above commit just a non-functional change making the code
generic? If there was a functional change, it needs to be spelt out. It
also implies that the code prior to the above commit needs fixing.

> However, if start
> or end is not aligned to a section boundary, such as when a subsection is hot
> added, populating the entire section is inefficient and wasteful. In such
> cases, it is more effective to populate at page granularity.

Do you have any numbers to show how inefficient it is? We trade some
memory for less TLB pressure by using huge pages for vmemmap.

> This change also addresses misalignment issues during vmemmap_free(). When
> pmd_sect() is true, the entire PMD section is cleared, even if only a
> subsection is mapped. For example, if subsections pagemap1 and pagemap2 are
> added sequentially and then pagemap1 is removed, vmemmap_free() will clear the
> entire PMD section, even though pagemap2 is still active.

What do you mean by a PMD section? The whole PAGE_SIZE *
PAGES_PER_SECTION range or a single pmd entry? I couldn't see how the
former happens in the core code but I only looked briefly. If it's just
a pmd entry, I think it's fair to require a 2MB alignment of hotplugged
memory ranges.

-- 
Catalin

