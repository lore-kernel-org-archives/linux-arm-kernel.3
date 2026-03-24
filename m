Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068F3E9A755
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxYoyrstc5/1CgkMEtG6n6ebrZsJE/o/EqenBbaMkR0=; b=B6Svyxf5taYgJTf7YHLsICNJSD
	+g1JNvWroaz2Wgp/6YDAqMWrjMPaMduwn1KpcQpcw1aJ3VMRIt9Vd73aTgFWWv2ya7Eb8DpZnMngf
	T9XgCDaiJdDMG2Sqp9WN1PuSfPJRzYTqNgV0GRbaiGsPxYGCM0VBaiRUIJV9JrgPf2h7RHe+NL8CQ
	n0PZ7FT8FHVUCAHg9aF5BwIV3i6AJdF5dk/3JzIbZoAkFlTMFDMXZg3fjmiygRAIDSq7qkUe3qD/K
	apaQcJ3P8UzHQlNVjVlmlM5rCAMWwyxZpg7nWrdmk3Y0Zs0g7uY4zqm+vHrFmHoTwnPteUOoCPDFn
	tOWqwy0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yXi-00000001ADi-26jB;
	Tue, 24 Mar 2026 09:59:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yXh-00000001ADc-3BBW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:59:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28FA8600AC;
	Tue, 24 Mar 2026 09:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334A2C19424;
	Tue, 24 Mar 2026 09:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774346360;
	bh=lxYoyrstc5/1CgkMEtG6n6ebrZsJE/o/EqenBbaMkR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lrb7xzPEV//TYdgvsB1VGxTLu91i8UXSqD2fZxbFKrs7YMf8RA3X4VUMYgME0yssJ
	 r+sjtDkcmvqG+AUW4nVbTYb8MO0bVoCvmiNc1L0GJ6QUG8iFF+3Nv8QhJzJNVc43g1
	 joyA6zm/Za90tZB+X+OmKm+K4KCwB5k0JSrBXpwxJUzxwXP9iIw2kJSCX+G3O3ZS5O
	 xEkNV7EC7/bHCiGI40SbfUMJGV6ukfovAnxA0Vt7pEVVd+XDCbe2ku2gsy+uxDLfbo
	 nva9XDTKQ1fugw2xz6LfukbsJSmmdCFFPnCJcBN7vhPc0vdmbK5OoMC1U7l1pbgbgs
	 wC9ihikKZ8SJQ==
Date: Tue, 24 Mar 2026 09:59:15 +0000
From: Will Deacon <will@kernel.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Jeff Xu <jeffxu@chromium.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: vdso: fix AArch32 compat init allocation leaks
Message-ID: <acJgc9EVRJJOVM0S@willie-the-truck>
References: <20260323214117.241216-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323214117.241216-1-osama.abdelkader@gmail.com>
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

On Mon, Mar 23, 2026 at 10:41:16PM +0100, Osama Abdelkader wrote:
> aarch32_alloc_vdso_pages() allocates the AA32 vdso pagelist, the compat
> sigpage, then the kuser vectors page. If aarch32_alloc_sigpage() or
> aarch32_alloc_kuser_vdso_page() fails, earlier allocations were not freed.

But why should they be freed? The vectors, sigpage and vdso are
independent from one another, so we can limp along with whatever we
managed to allocate. I'm not sure how far we'll get, mind, if single
page allocations are failing at initcall time...

Will

