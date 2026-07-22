Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C43C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2u+YmL3O7mDZg1oLXMa5OhmXTCMV452YGb8AVhTqv5A=; b=OtG5oPt1CdIkNwjFmK8LXw/b8m
	oCc4JpEJ9dVqbnY3aoE14XpE8uKF3yZ5TDO77BfbRE5WK3jxE3st6lYCXF8IDtagv1Jxw0gGoITA1
	o/J68fSGXz6e1NRHur43PssfLNLJmG2wRQqcngQN/kJbCHf6EoqgNDAGmxbYqaLFERcLQ6gBWbqoa
	eUhFgzggXt7HyznnA+vDFYhnxE9auM0JcRCGP0b6H8qwBjAw8ys8ZCzqnNQf95E+K8I9xqulVNw6r
	AHLywZD3emEsyI4ce4nj8LoYJDx/INLuAQU5T8zJFVnMH6svtdhR12EXQja+4PLya7UrJgMvfRAuB
	IVnUbxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVVB-0000000BgYk-2rok;
	Wed, 22 Jul 2026 11:52:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVVA-0000000BgYS-1ubi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:52:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3984E60A64;
	Wed, 22 Jul 2026 11:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779D91F000E9;
	Wed, 22 Jul 2026 11:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784721158;
	bh=2u+YmL3O7mDZg1oLXMa5OhmXTCMV452YGb8AVhTqv5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IsbXT4SEjVnkwnCXzJY0T8cBl50BCSrCVGmwo9Gs3OAFL2HC7CMfLRTz+kXbHM+7u
	 +TRC1/3Wj1Vtu8B027gT6rpfd6xraxlmp6/frHM92cIjrOqKI/W8uhmkW0CA1+BuGc
	 LH/JD5egHL5o5LeOzFq0FxEMgPAaBVOIgqYsGSldxCIw6WZCTxTn/IEIVm7xi+aV3Y
	 bkZULNGGTO1WdMjMmYK2M4kUik3xFZb0Vhyp/ovpdVvWTE3hjV2AY2pKylyN8I0bD1
	 ahInEjp8GrtjzJqlw8gqwZAFNB8cAPZ6Lf63qQZmM130cQK/Y5UdMF70oeXuFfTkcN
	 iW7ODO9zjcEXw==
Date: Wed, 22 Jul 2026 12:52:29 +0100
From: Will Deacon <will@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, muchun.song@linux.dev,
	osalvador@suse.de, ljs@kernel.org, david@kernel.org,
	liam@infradead.org, catalin.marinas@arm.com,
	kernel-team@android.com, riel@surriel.com, vbabka@kernel.org,
	harry@kernel.org, jannh@google.com, lance.yang@linux.dev,
	kas@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	apopple@nvidia.com, rcampbell@nvidia.com, ziy@nvidia.com,
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
	ak@linux.intel.com, nao.horiguchi@gmail.com, mel@csn.ul.ie,
	j-nomura@ce.jp.nec.com, pfalcato@suse.de, tglx@kernel.org,
	dave.hansen@intel.com, jpoimboe@kernel.org,
	linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
	anshuman.khandual@arm.com
Subject: Re: [PATCH v3 0/6] Fix incorrect access of hugetlb pte entries
Message-ID: <amCu_ei3B3-2OPTB@willie-the-truck>
References: <20260703114202.365553-1-dev.jain@arm.com>
 <178464737122.1305746.12295190523058911270.b4-ty@kernel.org>
 <20260721133636.df1a012df895054d3fd34a2e@linux-foundation.org>
 <4bb234f7-5f3a-452d-92dd-a1e62b6f39aa@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bb234f7-5f3a-452d-92dd-a1e62b6f39aa@arm.com>
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

On Wed, Jul 22, 2026 at 10:03:04AM +0530, Dev Jain wrote:
> @Will if you could edit the commit message with the following userspace visible
> effect:
> 
> "On systems where CONT_PTES != CONT_PMDS (meaning page size is 16K), we could collect
> excess a/d bit state, meaning extra work for the kernel. Even worse, we may iterate
> beyond the PTE table and dereference a garbage ptep pointer to access physical
> memory we don't own. Since the ptep pointer is a linear map address, we may run off
> the end of the linear map, dereference a VA not mapped into the kernel pgtables and
> cause kernel panic."

It's sitting on top of for-next/fixes so I can fold that in, thanks.

Will

