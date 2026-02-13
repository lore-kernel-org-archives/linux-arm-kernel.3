Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F372EDF154
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUnI+6T5xFaMCNRjMQt0zFHUYFPfSYLFKH8ymoS3U+o=; b=iX5vhgD3tQSOhAa+6WwH4DiuDQ
	/Pf7kAcNX0860WbR2Ss2cHIYT7hoiYCgNLlBqrH+oNYuAqfL8Slr8D+n+3RKPHbe+aiHUC9fwe6eF
	QGeqHABJdu5bEMWhvfs1xgFvfXBh2/f2ZpT475g34UlAnxFJmkiRIbq85EvWvc0l2ZWP7D6ELkv7U
	xHDPJzL9zsbat4Wz7qLlLrJD1XXRV1QQKK3Kkm1wLsZvDMpNZyYKALs+JFie6DYO3XybFnNpjH6i6
	oTYZHDvQhXVEAiNdl7ns4CVScn+oB53Py1e65prE/TdTzlc4K0jwpHRpCzUEzwsoggEIOzeo4Q5b/
	JCN/5MJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqrml-00000003QRd-3kHz;
	Fri, 13 Feb 2026 11:56:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqrmi-00000003QRB-1fen
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 11:56:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15DA7416C0;
	Fri, 13 Feb 2026 11:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4061CC116C6;
	Fri, 13 Feb 2026 11:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770983790;
	bh=XQNPzZWydc6p77Rgg7V3csOKfyOPpgvpVR5E6zDGYhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MKpMeL91vkzu4lrNrwMW7UCg1wpxzL496yPwACeCgxvR74/pQqKlghNhbtOJyFFwE
	 Zqgk6IQHtNf7Z7aGPt2cTuWZh4LydmHns4n1eLaX09J+LTxv1RcTzyJXOI12MknKoq
	 k8/UebDeW5KrMfg8D91SjW2g6gZQPRWlEaA6uFTuNsR6Hmr+Au0mWdOGuBwGbQr1zh
	 5T4xK9UsjscSgju7qrIn9EAvTUOw+LTNyEGJ/kdPh/jI/TKb3HVXyWEJ9s+xrgdi5N
	 tiLQuHUWzw6AVH9Rm/u4aS9DIEnBOBfyrXDKitfM+D7x/bMAS0B8qVSX8KCcWPypEt
	 C3ms6oY9DGrXw==
Date: Fri, 13 Feb 2026 11:56:25 +0000
From: Will Deacon <will@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jianpeng Chang <jianpeng.chang.cn@windriver.com>,
	catalin.marinas@arm.com, ying.huang@linux.alibaba.com,
	ardb@kernel.org, anshuman.khandual@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v3 PATCH] arm64: mm: Fix kexec failure after
 pte_mkwrite_novma() change
Message-ID: <aY8RaYnzeFxb8DLT@willie-the-truck>
References: <20251204062722.3367201-1-jianpeng.chang.cn@windriver.com>
 <73e9c019-abd8-4914-a70a-277142e4f306@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73e9c019-abd8-4914-a70a-277142e4f306@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_035632_504112_BDFF689D 
X-CRM114-Status: GOOD (  23.27  )
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

On Thu, Feb 12, 2026 at 10:51:45AM -0800, Guenter Roeck wrote:
> On Thu, Dec 04, 2025 at 02:27:22PM +0800, Jianpeng Chang wrote:
> > Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
> > pte_mkwrite()") modified pte_mkwrite_novma() to only clear PTE_RDONLY
> > when the page is already dirty (PTE_DIRTY is set). While this optimization
> > prevents unnecessary dirty page marking in normal memory management paths,
> > it breaks kexec on some platforms like NXP LS1043.
> > 
> > The issue occurs in the kexec code path:
> > 1. machine_kexec_post_load() calls trans_pgd_create_copy() to create a
> >    writable copy of the linear mapping
> > 2. _copy_pte() calls pte_mkwrite_novma() to ensure all pages in the copy
> >    are writable for the new kernel image copying
> > 3. With the new logic, clean pages (without PTE_DIRTY) remain read-only
> > 4. When kexec tries to copy the new kernel image through the linear
> >    mapping, it fails on read-only pages, causing the system to hang
> >    after "Bye!"
> > 
> > The same issue affects hibernation which uses the same trans_pgd code path.
> > 
> > Fix this by marking pages dirty with pte_mkdirty() in _copy_pte(), which
> > ensures pte_mkwrite_novma() clears PTE_RDONLY for both kexec and
> > hibernation, making all pages in the temporary mapping writable regardless
> > of their dirty state. This preserves the original commit's optimization
> > for normal memory management while fixing the kexec/hibernation regression.
> > 
> > Using pte_mkdirty() causes redundant bit operations when the page is
> > already writable (redundant PTE_RDONLY clearing), but this is acceptable
> > since it's not a hot path and only affects kexec/hibernation scenarios.
> > 
> > Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
> > Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
> > Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>
> 
> We (Google) experience this problem with servers utilizing the Ampere Siryn
> CPU. It now bubbled down all the way to v6.6.y (and maybe further),
> essentially making kexec unusable on affected systems unless the backport
> of commit 143937ca51cc is dropped.
> 
> What is the status of this patch ?

Catalin and I would prefer to treat kernel mappings as dirty, as
suggested in:

https://lore.kernel.org/r/aVgUPNzXHHIBhh5A@arm.com

If somebody sends a (tested) patch, we'll take it.

Will

