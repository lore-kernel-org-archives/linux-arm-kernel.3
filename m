Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4BAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 13:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Fon9jg74hfJtQTNtNZd+Uj09wB/Cwtq9F9KzsKn9B0=; b=npyb4Boc3fLCFbZvuXkwNu1GeZ
	ft9fGTaIfVME4Slof/uCOMXfitcWvR/hFA7+B8u1qRfoG1umBLknj4GvDFGBFKS9o7bYIddXngxEs
	Szn9sQ4SNdwJZa6vpQLyEtTSI2Rf38K5f4sdtlgkej0gtKOHX88Tu+2QtMfsBgsglD/lNMsEnO6J8
	df8Kq8/9DZGwNQqfrdw8Ue8O6sCCN8dtjGeN0H7G5gi/Yu2VWtOG6Lbm7fBB8UZln/3+3Eaid1Lpb
	5jxq4Km3dvQamd/XNIEFanVIFmv6WM9+7wDsA9a0/YrfrM04t+3d/k3LYt34es11ExMAx5YbWy2wP
	EoiDKrrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBDL-00000005092-1gyI;
	Fri, 10 Jul 2026 13:24:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBDK-0000000508w-3Ip2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 13:24:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C438760052;
	Fri, 10 Jul 2026 13:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395931F000E9;
	Fri, 10 Jul 2026 13:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783689861;
	bh=1Fon9jg74hfJtQTNtNZd+Uj09wB/Cwtq9F9KzsKn9B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NVnYB7qshocoVxRV8CxAk3K1UiaS25s7tEAanIJNDA0I+JhoP1Fdjd3uEVUjDb36f
	 WAkdzxMki0U8Yxx7+84NqkzZYRg/fGDafcjw9CNYFfOueZcufTkoWVGJYRlmobzoKy
	 nYraqm8HB5NmLtu5MlKgLyM/1vNol7ynal2bQYMTCm/kXHbgnivt+hvgAzi3/9Vq4i
	 gs3bjvFfBU+pXvomK/gXFBg4whAGb6xa+9+JrOVyavRclkvqHHZQFI9xlERNwbUcB/
	 mTX45vQQ37tkfW1L4CdrW2xMXK/lcfHZS8UtusMYO7awfwKSvmQ55gzJnMiMD8/LOa
	 /T3YJLc8QfACQ==
Date: Fri, 10 Jul 2026 14:24:08 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: David Carlier <devnexen@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/2] mm/vmalloc: acquire init_mm read lock on huge vmap
 promotion
Message-ID: <alDyT43CLwtBtsAa@lucifer>
References: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
 <20260710-series-vmap-race-fix-v1-1-5b3794c113fe@kernel.org>
 <alDnFGncVvcjsvTg@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alDnFGncVvcjsvTg@lucifer>
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

On Fri, Jul 10, 2026 at 01:57:46PM +0100, Lorenzo Stoakes wrote:
> As per Sashiko, we need to account for x86's slightly bat... interesting
> ptdump of non-init_mm page tables.

Well it turns out arm64 also traverses EFI ranges which is kinda the saner end
of it ;)

Patch incoming in any case. Will send separately as each patch stands alone and
this series is fine as-is.

>
> The fix is to take a nested init_mm lock in ptdump_walk_pgd(), which is
> safe as nothing depends on an init_mm lock prior to acquiring an arbitrary
> mm's lock.
>
> I think this could potentially be sent as an entirely separate patch, as it
> doesn't change what this protects against, nor the x86 CPA patch, both of
> which stand on their own.
>
> Cheers, Lorenzo

Cheers, Lorenzo

