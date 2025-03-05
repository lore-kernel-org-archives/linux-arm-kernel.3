Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D2CC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17Q1ePKPZtBEcl+vkrap0wJMpbpHnmXjVqjNWIZ6vhg=; b=MglDgqYcnDLD2vpkd32k5kpgow
	EWXCMiy+RCDpdg6vtNP50xO+JL93ACfyyG8MVKmpxhs2wd61Sis1lGSI7lffwqZq+rFFNPeUXezzo
	gX4X/BcWLRBGDjHwPWZ6mEj3GATrMeuOUWKPR7/ySi+vsauE0uIqqSzbLepSBtNXkT7OnfXkB0uro
	X4bfN93Wz4IZHaUF1oflakVmU9hDXs+AeGAJTldSxrJ6PGiOBPfA2Ku18x8bqTdQv/D9smaQ/T8/E
	maEFdfeiObfqS3vB8WzSVfHfF3ImO1uDUsW2lvigEpKi2JRKVELkKbTgo0TQnrhcDdJjXfDvH800K
	Jy5ansYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpux6-000000099rJ-1H4p;
	Wed, 05 Mar 2025 20:02:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuSM-000000094kx-1Sdp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 19:31:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=17Q1ePKPZtBEcl+vkrap0wJMpbpHnmXjVqjNWIZ6vhg=; b=MiHR/u0l5WWzte3RVYSWhrNqLK
	dETVteqyqPEHquevzsPbV3NjjXC5nAHASQz6P29yuenxd7ElZ+nx9y2PnLkdeAMjFGmJceiioJC+3
	c3eB6ndsGoSV4lSfAhfsofngXQepmkT4ediyjgHz3wraqJP+ATjAs5MdePDRk9doca9d9m8vwwOM/
	x0UoZ59vYD49pxTySy0SVGlIG/4F1vZIK/qVQzE+Bg7SdcuJDxU8wEhpPMFbvSv08mXDAR4LRksFj
	oHhrFbuyNkRHYEtPloIpnwDNdTxAP6cwO9rJMPYzoPQBGWs2rfh7jQpjJ/ETV4WLqlV0ay89kHQVo
	QK7Dai/g==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuSH-0000000661R-1wXY;
	Wed, 05 Mar 2025 19:30:57 +0000
Date: Wed, 5 Mar 2025 19:30:57 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v1 3/3] kernel/events/uprobes:
 uprobe_write_opcode() rewrite
Message-ID: <Z8imcXuuW6EK1aLY@casper.infradead.org>
References: <20250304154846.1937958-1-david@redhat.com>
 <20250304154846.1937958-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304154846.1937958-4-david@redhat.com>
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

On Tue, Mar 04, 2025 at 04:48:46PM +0100, David Hildenbrand wrote:
> +static bool orig_page_is_identical(struct vm_area_struct *vma,
> +		unsigned long vaddr, struct page *page, bool *pmd_mappable)
> +{
> +	const pgoff_t index = vaddr_to_offset(vma, vaddr) >> PAGE_SHIFT;
> +	struct page *orig_page = find_get_page(vma->vm_file->f_inode->i_mapping,
> +					       index);
> +	struct folio *orig_folio;
> +	bool identical;
> +
> +	if (!orig_page)
> +		return false;
> +	orig_folio = page_folio(orig_page);

I'd rather write this as:

	struct folio *orig_folio = filemap_get_folio(vma->vm_file->f_mapping,
			index);
	struct page *orig_page;

	if (IS_ERR(orig_folio))
		return false;
	orig_page = folio_file_page(folio, index);


