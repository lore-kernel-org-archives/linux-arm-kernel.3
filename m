Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DF5103E160
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 10:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgLjZjiZAQDujWNQO4KkWHp+1oa/NVCBWzOVCA3bnuk=; b=n+etOzGNTArkF+erXpxyB2C7SQ
	mkJeTj/03qWTCJuKEelZvCUG29VMQL8BwI2URxH0V79qNJaGVMlGAJc68JVWT1YF7MIBR+WZ6Fw/n
	mKCgyjqukOgmoDIGnJTsnRlCBmrfSGsF4pphl5pVOaiwSh9h86SlK4cAH9BVjN0pXC4mMVoPfmEdi
	AngFldsr8+/ij4sKFum0SP1UnIsTJ89cUSB1OL/b1P0DEARh0VKNCKiBZZFxk/d8pdLiKL3YckgvA
	+h12ga2LvOU6gW185GPthLe2LgIqQ0R/JHPOK+4VFXs5urUyrePAJSf+sqwJUkoMYvBtyBLMl23pb
	5T9xJdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oax-00000008FJk-078k;
	Wed, 18 Mar 2026 10:57:47 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oat-00000008FJO-3qiG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 10:57:45 +0000
Message-ID: <d0c0ac64-be15-4683-89ec-e32bf4867109@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773831461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IgLjZjiZAQDujWNQO4KkWHp+1oa/NVCBWzOVCA3bnuk=;
	b=SH99kRsYhm85fHzLq0PeXe+Bmssa3uLHL41zHKFW5m1uq3oVO68YMdQA5P0yhRRb3VjGCC
	zwlkGEaEamADlJ7708FKSc+i+m9W/j3VIF8nSyB2yhNspkesHeRK3OvWgc/BXvo6Qra6Zf
	/L9tRcXOOfqx8oI1ud0jioievUKdyT8=
Date: Wed, 18 Mar 2026 13:57:31 +0300
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] arm64/mm: contpte-sized exec folios for 16K and 64K
 pages
Content-Language: en-GB
To: WANG Rui <r@hev.cc>, Ryan Roberts <ryan.roberts@arm.com>,
 David Hildenbrand <david@kernel.org>
Cc: Liam.Howlett@oracle.com, ajd@linux.ibm.com, akpm@linux-foundation.org,
 anshuman.khandual@arm.com, apopple@nvidia.com, baohua@kernel.org,
 baolin.wang@linux.alibaba.com, brauner@kernel.org, catalin.marinas@arm.com,
 david@kernel.org, dev.jain@arm.com, hannes@cmpxchg.org, jack@suse.cz,
 kas@kernel.org, kees@kernel.org, kernel-team@meta.com,
 kevin.brodsky@arm.com, lance.yang@linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, npache@redhat.com, rmclure@linux.ibm.com,
 ryan.roberts@arm.com, shakeel.butt@linux.dev, viro@zeniv.linux.org.uk,
 will@kernel.org, willy@infradead.org, ziy@nvidia.com
References: <20260310145406.3073394-1-usama.arif@linux.dev>
 <20260314095022.217231-1-r@hev.cc>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260314095022.217231-1-r@hev.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_035744_137040_889BE5DF 
X-CRM114-Status: GOOD (  14.74  )
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



On 14/03/2026 12:50, WANG Rui wrote:
> I only just realized your focus was on 64K normal pages, what I was
> referring to here is AArch64 with 4K normal pages.
> 
> Sorry about the earlier numbers. They were a bit low precision.
> RK3399 has pretty limited PMU events, and it looks like it can’t
> collect events from the A53 and A72 clusters at the same time, so
> I reran the measurements on the A53.
> 
> Even though the A53 backend isn’t very wide, we can still see the
> impact from iTLB pressure. With 4K pages, aligning the code to PMD
> size (2M) performs slightly better than 64K.
> 
> Binutils: 2.46
> GCC: 15.2.1 (--enable-host-pie)
> 
> Workload: building vmlinux from Linux v7.0-rc1 with allnoconfig.
> Loop: 5
> 
>                 Base                 Patchset [1]         Patchset [2]
> instructions    1,994,512,163,037    1,994,528,896,322    1,994,536,148,574
> cpu-cycles      6,890,054,789,351    6,870,685,379,047    6,720,442,248,967
>                                               ~ -0.28%             ~ -2.46%
> itlb-misses           579,692,117          455,848,211           43,814,795
>                                              ~ -21.36%            ~ -92.44%
> time elapsed            1331.15 s            1325.50 s            1296.35 s
>                                               ~ -0.42%             ~ -2.61%
> 


Thanks for running these! Just wanted to check what is the base page size
of this experiment?

Ofcourse PMD is going to perform better than TLB coalescing (pagefault
itself will be one less page table level). But its a tradeoff between
memory pressure + reduced ASLR vs performance. As Ryan pointed out in
[1], even 2M for 16K base page size might introduce too much of memory
pressure for android phones, and the PMD size for 16K is 32M! 

[1] https://lore.kernel.org/all/cfdfca9c-4752-4037-a289-03e6e7a00d47@arm.com/

> Maybe we could make exec_folio_order() choose differently folio size
> depending on the configuration and conditional in some way, for example
> based on the size of the code segment?

Yeah I think introducing Kconfig might be an option.

> 
> [1] https://lore.kernel.org/all/20260310145406.3073394-1-usama.arif@linux.dev
> [2] https://lore.kernel.org/linux-fsdevel/20260313005211.882831-1-r@hev.cc
> 
> Thanks,
> Rui


