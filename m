Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1596D29C4F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBgoCJWQszf6tS+8ZaJDs7NoP141U8d8f9HGXrFmMMU=; b=3D5qYUijMCegvj2o4W7pe2rzj8
	FN6CodEAINdIgAN+9c01sqVomBf2WQEtRvCZd5jpZI0Fj1ZsdCJGJmd4rgFP2crC6EF6janjCCb6Y
	XKQSwDdnGuxZ/OwPLNTq2fREmsqLw9b2kO60cIQld0BvW1SuPCXvimbMlJyRREi9n+TGekoYoKrjg
	0sKDuAQhOBZO153dQTzPeSyT/U+gsVPNgReibpza7JufhBcyfwkwC163Zbk/b61w/iVJTCO9+6NB+
	CMP7nx6nJ9v72pHRjM5Auq5ezrPixjl5d7vFXWbKds7qx7IHhl36+Vd/VscEPix9mjKKDt33+DWfj
	0J7bY+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vht3p-00000002eEi-34Hy;
	Mon, 19 Jan 2026 17:29:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vht3n-00000002eE8-0K9s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:29:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9123D40A01;
	Mon, 19 Jan 2026 17:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E04DC116C6;
	Mon, 19 Jan 2026 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768843742;
	bh=VSaRBPhMwDUDvys3EnSvaAtLjqimGoG5C1rbWN41zss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQQViHD3Omr6dYepJRuFBaBqjCLsKYGcd4a4bTlRtVMELBDHhMA91ANBQANlFcoFV
	 hgIWgykCS2f3erLk0fpWpiC4klD/+2p5UFne9yCt4YzKgcBhKSfFeRVuIWg+cJ2rVV
	 yvgSi2eFzPxyEuoD0A+KBSGbiWJ8qDcBW+xCUDQGJ+UdUuhh3l4UfAkad7ecVecLND
	 XkNI35ireWIn7D66fFHmF5O9FktztlY4gXeXfMDt7qrC1TKoMg9SwE8TCb+qCF07Eh
	 92zYn7/qNa3efLLc66ad6PodMRWdOTV0K/rQSw4S9U7Qmk55isDPGLRcMkeMqj+7Cj
	 s7O2mWA6IA+bA==
Date: Mon, 19 Jan 2026 17:28:55 +0000
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, catalin.marinas@arm.com,
	ryan.roberts@arm.com, akpm@linux-oundation.org, david@kernel.org,
	kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
	lorenzo.stoakes@oracle.com, ardb@kernel.org, jackmanb@google.com,
	vbabka@suse.cz, mhocko@suse.com
Subject: Re: [PATCH v5 2/3] arm64: mmu: avoid allocating pages while
 splitting the linear mapping
Message-ID: <aW5p1ylQBNXTEmmq@willie-the-truck>
References: <20260105202328.2418990-1-yeoreum.yun@arm.com>
 <20260105202328.2418990-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105202328.2418990-3-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_092903_143742_40BAC152 
X-CRM114-Status: GOOD (  16.62  )
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

On Mon, Jan 05, 2026 at 08:23:27PM +0000, Yeoreum Yun wrote:
> +static int __init linear_map_prealloc_split_pgtables(void)
> +{
> +	int ret, i;
> +	unsigned long lstart = _PAGE_OFFSET(vabits_actual);
> +	unsigned long lend = PAGE_END;
> +	unsigned long kstart = (unsigned long)lm_alias(_stext);
> +	unsigned long kend = (unsigned long)lm_alias(__init_begin);
> +
> +	const struct mm_walk_ops collect_to_split_ops = {
> +		.pud_entry	= collect_to_split_pud_entry,
> +		.pmd_entry	= collect_to_split_pmd_entry
> +	};

Why do we need to rewalk the page-table here instead of collating the
number of block mappings we put down when creating the linear map in
the first place?

> +	split_pgtables_idx = 0;
> +	split_pgtables_count = 0;
> +
> +	ret = walk_kernel_page_table_range_lockless(lstart, kstart,
> +						    &collect_to_split_ops,
> +						    NULL, NULL);
> +	if (!ret)
> +		ret = walk_kernel_page_table_range_lockless(kend, lend,
> +							    &collect_to_split_ops,
> +							    NULL, NULL);
> +	if (ret || !split_pgtables_count)
> +		goto error;
> +
> +	ret = -ENOMEM;
> +
> +	split_pgtables = kvmalloc(split_pgtables_count * sizeof(struct ptdesc *),
> +				  GFP_KERNEL | __GFP_ZERO);
> +	if (!split_pgtables)
> +		goto error;
> +
> +	for (i = 0; i < split_pgtables_count; i++) {
> +		/* The page table will be filled during splitting, so zeroing it is unnecessary. */
> +		split_pgtables[i] = pagetable_alloc(GFP_PGTABLE_KERNEL & ~__GFP_ZERO, 0);
> +		if (!split_pgtables[i])
> +			goto error;

This looks potentially expensive on the boot path and only gets worse as
the amount of memory grows. Maybe we should predicate this preallocation
on preempt-rt?

Will

