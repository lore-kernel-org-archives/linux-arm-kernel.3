Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26736E9129C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 14:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJlqPGsXf0b6vIU1M2K8abKxS0u2azgZ2Z3SVu6tYY4=; b=pA5PdULGRhNMWIR1srIxeNzdHJ
	CnWSUvj1SutKZngrQDRhQHppSFX5+eErOzPZVAZLtHzsBgv8IT6XPBGcnGynqQLSMUaOtrukkEWSs
	5pAiGBvl7DaI16SYdbNszpaVoFTYrY66S6m50xH0oOE5THkzQ9A1cT8x6KE1Gnoredomrz/UrYkLb
	4wonpnCzl969qKhyCPmLP3Xr3ZBX5O+akmYFclk58XvcEfAAXyoq4x4CP/N5we+kW1QfSZX9hQn6d
	jvSn20W8ed0Ji9QL0TiJzWgRswynIFt3M1TFVnvKCnckdsFjWhqxy9erXpRQJ0Cv/f9og6CeOVgzN
	vKZPXDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0Oj-0000000A1lg-07OW;
	Thu, 05 Feb 2026 14:31:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0Of-0000000A1lF-3Xna
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 14:31:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8E54339;
	Thu,  5 Feb 2026 06:31:45 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 460083F73F;
	Thu,  5 Feb 2026 06:31:50 -0800 (PST)
Date: Thu, 5 Feb 2026 14:31:47 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjiang Tu <tujinjiang@huawei.com>
Cc: Will Deacon <will@kernel.org>, akpm@linux-foundation.org,
	david@kernel.org, zengheng4@huawei.com, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v3] arm64: mm: fix pass user prot to ioremap_prot in
 generic_access_phys
Message-ID: <aYSp0--x_QgyiUWL@arm.com>
References: <20260130073807.99474-1-tujinjiang@huawei.com>
 <aYC6_lSm_eJeKIcn@willie-the-truck>
 <73396cda-e12c-484f-ab84-b09e7aab8bb0@huawei.com>
 <aYG-dGzR6MuPSQBK@willie-the-truck>
 <a4ee7faa-5b0d-4ffa-bc06-939d95ef7680@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4ee7faa-5b0d-4ffa-bc06-939d95ef7680@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_063153_921205_BACDAF95 
X-CRM114-Status: GOOD (  19.78  )
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

On Thu, Feb 05, 2026 at 03:23:27PM +0800, Jinjiang Tu wrote:
> 在 2026/2/3 17:23, Will Deacon 写道:
> > On Tue, Feb 03, 2026 at 11:38:15AM +0800, Jinjiang Tu wrote:
> > > 在 2026/2/2 22:55, Will Deacon 写道:
> > > > On Fri, Jan 30, 2026 at 03:38:07PM +0800, Jinjiang Tu wrote:
> > > > > +#define arch_mk_kernel_prot arch_mk_kernel_prot
> > > > > +static inline pgprot_t arch_mk_kernel_prot(pgprot_t user_prot)
> > > > > +{
> > > > > +	ptdesc_t mem_type = pgprot_val(user_prot) & PTE_ATTRINDX_MASK;
> > > > > +
> > > > > +	return __pgprot_modify(PAGE_KERNEL, PTE_ATTRINDX_MASK, mem_type);
> > > > > +}
> > > > 
> > > > Do we really need another arch helper here?
[...]
> > My point is that we already have the helper: ioremap_prot(). Just fix
> > that for arm64 and cc the other arch maintainers if you're not sure how
> > to fix it for them. What we don't need to do is add an additional helper.
> 
> ioremap_prot() may be called outside of arch/arm64 in the future, and I think
> most of the cases will not pass a user prot to ioremap_prot().
> 
> generic_access_phys() is a special case, so I want to limit the modification to
> generic_access_phys() only.

Or we can just have an ioremap_user_prot() (or some more meaningful
name), defined by default as ioremap_prot(). It's still introducing a
new macro though, unless we go and rename it on all architectures.

-- 
Catalin

