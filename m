Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878B6CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 19:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEQaWJh+9RNjFjr+WddCWW9fRUv90ZcJVBqGUtK51X8=; b=WM3WBpuJHHt3SJvg5tNbyeIWRe
	qdHC9a9avbLYr5YQT41ImyMzA4N4dAwPEJp90uWeVTC5KAvIwd284pxCU7DHEEWY3Q/j/dzyinaxn
	q4nrY0QTjV5Jrrb+te8BzyhsAMjZxPSIrbGhyPfH4UCiaAQBUQwXqiCGkUZXyK1AnHddAK/d3RrCD
	v+N95hGZ7bjyFlOPr2Z+mKAyVlRoPNc26OhLbivdDp53OU57J75FFrtivO+6o337vwDw3e6UFY8uk
	SzBB4vbP6tAI52RBp2JGGfrbA7smXoSuvoeXN/nko8M2BHPdcojTA593eunwkf5vSKBQEbheL5Ki9
	NaNBmXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM9sl-0000000BV06-0YJJ;
	Sun, 10 May 2026 19:32:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM9sj-0000000BUzq-43uW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 19:32:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85B6C6001A;
	Sun, 10 May 2026 19:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E672C2BCB8;
	Sun, 10 May 2026 19:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778441524;
	bh=oosQGewjKOseq/Zf5kpRlYqAjqUau3hSHYi43sFgkAA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JyADTMisvVNX5qwlsV0UQO/IiW9peVSs44lX9szf4Nkxsa6mNgJqBu2InpqVUUWhu
	 nqJYbyzOlwlSYlqs6SmxsJdsNVaO9vZpzb44YMH5RV8UXIB0cCpd1EeMsvue1KLoIV
	 b7O2/4EQSSJCvAHEX3k6kj+tUXoTMsCpB94Mko8Gs6E1+xC9rsbiJWewU6zAqpywFy
	 gJ7zuRiwaLPPe+iCtoE8UJsllLPSrpXvMLOqJi+XDO1fJySNyjdbCNW8S1+O6WPcxL
	 6IpObWWpKyHqZ399vvy+59K3d/NxrxQia8vhz/3TUbCD5To2e+T5ixm7gE1tjl8Buo
	 HIfAELBrUFThQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Andrew
 Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 1/2] [RFC] debugobjects: avoid gcc-16.0.1 section mismatch
In-Reply-To: <20260203162406.2215716-1-arnd@kernel.org>
References: <20260203162406.2215716-1-arnd@kernel.org>
Date: Sun, 10 May 2026 21:31:59 +0200
Message-ID: <874ikf9i34.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, Feb 03 2026 at 17:23, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> gcc-16 has gained some more advanced inlining techniques that enable
> it to inline the is_static_object() function pointer into a specialized
> version of lookup_object_or_alloc:
>
> WARNING: modpost: vmlinux: section mismatch in reference: lookup_object_or_alloc.part.0+0x1ac (section: .text) -> is_static_object (section: .init.text)
>
> From what I can tell, the transformation is correct, as this
> is only called when lookup_object_or_alloc() is called from
> debug_objects_selftest(), which is also __init.

So clearly the compiler is buggy. It creates an __init specific copy of
lookup_object_or_alloc() and then fails to attribute it correctly.

> I have not come up with a good workaround, so this simply marks
> is_static_object() as not __init. Since there are currently only two
> files where this happens, that may be an easy way out.

That's a horrible hack and while it's only two files today, this sounds
like the start of a whack a mole game.

Aside of that five weeks down the road some clever AI bot creates a
patch which marks the function __init again (rightfully so).

> If anyone has a better idea for how to deal with that, let me know!

Mark the compiler broken and wait until GCC people get their act
together.

Thanks,

        tglx

