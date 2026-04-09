Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421A6F31E5B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdR0QNkKUEj8potMrpqRX2L2epmUbghe6igep+A9Bbw=; b=d74mwL4d+kRl1SKM25Nd9slJFP
	Q1WGZ6oAt7/P5LHjdbILYtlAu2L1zHzt9ywaqpMcVemPVzfsEwDvZpkew0LyxXXi3RBefgTbn2jUD
	OwuG4AHCyeMGLWmuMQIcKlNK+V+XeSrjQ8LqER/kEl0PZuhTgqzAJx4L93FZm0Nbn74TfyFh8gr0g
	+q9tzdy3f8cO6rHWMrC9mjb5KkBL4m8/vYYYIXheIPAQX8iTWdSriJzXx9vvrjocSqWHAXmZnGFmZ
	9prVQn/J1D3n3A4RZwIzfB+r4NF3T01tbHbKmOhFhM9h6gcDRwzEnIrASaF+DZGd9KxEDUKzlfZZE
	1T5xQfgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAs1H-0000000Au1u-0Nf6;
	Thu, 09 Apr 2026 16:14:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAs19-0000000Au0X-2oZd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 16:14:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DAB060103;
	Thu,  9 Apr 2026 16:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437EDC116C6;
	Thu,  9 Apr 2026 16:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775751246;
	bh=nNEalYGkObrBpLChg77VOGw1IGjWphGUuVKtHAliBfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwzGtKmwoFRayh3XRWE38wTLU15luyTL8xi7r2dp4/fQJRZV4/vtgYgXbNIDoksjF
	 LjGMzUNnPvhlggkKfYiK4H3PMF42/WaWtCtLXjPycowQY23E9AofdKkEOwwe8iYPFa
	 3qV/T7WAwhqcwLtGjOoSvhNpfpwuGEC79aBSgKAWLedp0Aw5FrBDUXnvslH5Y2uEjR
	 UcHHKDkrQXOro/H3nil3tLEYXqIjCR3wARwphbLcXVy8BSWDX6aZLEx5OUkRrVWMC+
	 JqG0X6Rd3s406+TEvFCuzNYZB/F8jPx2RHbPAg9hHfAaO/RedhXVV42Mtu3fukfv2M
	 qktYcYC8Ntgcg==
Date: Thu, 9 Apr 2026 09:14:05 -0700
From: Kees Cook <kees@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v14 00/10] arm64: entry: Convert to Generic Entry
Message-ID: <202604090906.28EA71F63@keescook>
References: <20260320102620.1336796-1-ruanjinjie@huawei.com>
 <174e6d08-4922-f42f-2899-4c5b0df13469@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174e6d08-4922-f42f-2899-4c5b0df13469@huawei.com>
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, edumazet@google.com, will@kernel.org, mingo@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, arnd@arndb.de, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, mathieu.desnoyers@efficios.com, luto@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, song@kernel.org, linusw@kernel.org, oleg@redhat.com, linux-kernel@vger.kernel.org, tglx@kernel.org, liqiang01@kylinos.cn, yeoreum.yun@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Apr 09, 2026 at 02:29:04PM +0800, Jinjie Ruan wrote:
> On 2026/3/20 18:26, Jinjie Ruan wrote:
> > Currently, x86, Riscv, Loongarch use the Generic Entry which makes
> > maintainers' work easier and codes more elegant. arm64 has already
> > successfully switched to the Generic IRQ Entry in commit
> > b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
> > time to completely convert arm64 to Generic Entry.
> > 
> > The goal is to bring arm64 in line with other architectures that already
> > use the generic entry infrastructure, reducing duplicated code and
> > making it easier to share future changes in entry/exit paths, such as
> > "Syscall User Dispatch" and RSEQ optimizations.
> 
> Just a quick ping to see if this series is good to go. Do I need to
> provide a new version rebased on the latest arm64 for-next/generic-entry
> branches, or is the current version acceptable?

One thing I see is Sashiko's comments on seccomp:
https://sashiko.dev/#/patchset/20260320102620.1336796-1-ruanjinjie%40huawei.com
where "ret", when not 0 or -1, will override the syscall number. While
that's not currently possible, it'd be better to catch that, or rather,
avoid the "ret ? : syscall" logic which isn't useful here. "ret" should
probably be local to the "if (flags & _TIF_SECCOMP)" scope.

-- 
Kees Cook

