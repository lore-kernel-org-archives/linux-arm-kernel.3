Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ABFF01815
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5wskvBRuKaeJs/emXYtwODH8GFYP+MuYeW58WpbxNs=; b=gA5Wc+RelCDkrKjg7++GiNCFge
	ZBOlJgfOs53GcK4h1teEHQTDW0y6bUOtGh6hzeXCVncFbeC2Pskje+2hYLsbTtZ51mOB49d5qP/P0
	ulQIXYEg9OMCUVpv+W725O9MP/vG7y5RFCHgaDhp1RGfGz1+loRIif+wpeU8DhOBPd6p4IMahhgOj
	3AaujRVZqTE9vk05U61EBet5SElAOuyOCyn+eq0zGbjDNQ8Yo+PCFGecrgEO3uUkYSyD24bBCn/vr
	kDoC7qJvRzh8EUxLVNzuqrKsbpxKcX+j7b5ocao9lFa3y3Sh0QnTXQ6ezzAmQi55nUra0FpNRVHB2
	uwFShLUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRUh-00000003Lkm-1rap;
	Fri, 06 Mar 2026 09:29:15 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRUe-00000003Ljq-0JsU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 09:29:13 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fS1L42yYLzJ46cD;
	Fri,  6 Mar 2026 17:28:28 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 302324056A;
	Fri,  6 Mar 2026 17:29:06 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Mar
 2026 09:29:04 +0000
Date: Fri, 6 Mar 2026 09:29:03 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Yin Tirui <yintirui@huawei.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <willy@infradead.org>,
	<david@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <luto@kernel.org>,
	<peterz@infradead.org>, <akpm@linux-foundation.org>,
	<lorenzo.stoakes@oracle.com>, <ziy@nvidia.com>,
	<baolin.wang@linux.alibaba.com>, <Liam.Howlett@oracle.com>,
	<npache@redhat.com>, <ryan.roberts@arm.com>, <dev.jain@arm.com>,
	<baohua@kernel.org>, <lance.yang@linux.dev>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<anshuman.khandual@arm.com>, <rmclure@linux.ibm.com>,
	<kevin.brodsky@arm.com>, <apopple@nvidia.com>, <ajd@linux.ibm.com>,
	<pasha.tatashin@soleen.com>, <bhe@redhat.com>, <thuth@redhat.com>,
	<coxu@redhat.com>, <dan.j.williams@intel.com>, <yu-cheng.yu@intel.com>,
	<yangyicong@hisilicon.com>, <baolu.lu@linux.intel.com>, <jgross@suse.com>,
	<conor.dooley@microchip.com>, <riel@surriel.com>,
	<wangkefeng.wang@huawei.com>, <chenjun102@huawei.com>
Subject: Re: [PATCH RFC v3 1/4] x86/mm: Use proper page table helpers for
 huge page generation
Message-ID: <20260306092903.0000268f@huawei.com>
In-Reply-To: <20260228070906.1418911-2-yintirui@huawei.com>
References: <20260228070906.1418911-1-yintirui@huawei.com>
	<20260228070906.1418911-2-yintirui@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_012912_420468_F1B481BF 
X-CRM114-Status: GOOD (  15.62  )
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

On Sat, 28 Feb 2026 15:09:03 +0800
Yin Tirui <yintirui@huawei.com> wrote:

> Historically, several core x86 mm subsystems (vmemmap, vmalloc, and CPA)
> have abused `pfn_pte()` to generate PMD and PUD entries by passing
> pgprot values containing the _PAGE_PSE flag, and then casting the
> resulting pte_t to a pmd_t or pud_t.
> 
> This violates strict type safety and prevents us from enforcing the rule
> that `pfn_pte()` should strictly generate pte without huge page attributes.
> 
> Fix these abuses by explicitly using the correct level-specific helpers
> (`pfn_pmd()` and `pfn_pud()`) and their corresponding setters
> (`set_pmd()`, `set_pud()`).
> 
> For the CPA (Change Page Attribute) code, which uses `pte_t` as a generic
> container for page table entries across all levels in
> __should_split_large_page(), pack the correctly generated PMD/PUD values
> into the pte_t container.
> 
> This cleanup prepares the ground for making `pfn_pte()` strictly filter
> out huge page attributes.
> 
> Signed-off-by: Yin Tirui <yintirui@huawei.com>
Hi. A tiny drive by review comment below.

> ---
>  arch/x86/mm/init_64.c        | 6 +++---
>  arch/x86/mm/pat/set_memory.c | 6 +++++-
>  arch/x86/mm/pgtable.c        | 4 ++--
>  3 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index df2261fa4f98..d65f3d05c66f 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -1518,11 +1518,11 @@ static int __meminitdata node_start;
>  void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
>  			       unsigned long addr, unsigned long next)
>  {
> -	pte_t entry;
> +	pmd_t entry;
>  
> -	entry = pfn_pte(__pa(p) >> PAGE_SHIFT,
> +	entry = pfn_pmd(__pa(p) >> PAGE_SHIFT,
>  			PAGE_KERNEL_LARGE);

Whilst you are here, can we make that a one liner. 
	entry = pfn_pmd(__pa(p) >> PAGE_SHIFT, PAGE_KERNEL_LARGE);

Could even do

	pmd_t entry = pfn_pmd(__pa(p) >> PAGE_SHIFT, PAGE_KERNEL_LARGE);
but that's more of a question of taste.


> -	set_pmd(pmd, __pmd(pte_val(entry)));
> +	set_pmd(pmd, entry);
>  
>  	/* check to see if we have contiguous blocks */


