Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A35CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTHenELavdixkpehBZtgo0+fqBfXPK/qvE1tJsk4MnM=; b=quH/qF1w56foZByQmyPfhz1JRj
	dfStQ4vPcV0eVxKNrt4CIMOGS93zipx9rPrhbYHx8VQWhH1fjw0uLmoyUXVbwUXSOdNUIWkw+bddK
	2pWy1ptlcUwKyhAXjSyhYKJ/jatTymRKk8ES6X/2jL9vWWbbpJbaSZLZnSKWhGW2MFFyvAVfx4ErP
	YCZIoGdjZgamNgMEjDssuVHtS6pkehPv2/bjD87Wg4AGwVo/2cdpFg7Ak+mVqfvObR4UFn8IZc20A
	nMgitvJzlR5mvRIHhUtR6aUNnYvR73No9CNlrUo1R6aV0LxyN7pqYzWK3Gvp0HPgvijf56dnXz+GS
	DZA9FZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfaW-00000008qE5-0lnv;
	Thu, 25 Jun 2026 08:37:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfaU-00000008qDw-3xKZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 08:37:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1EC560217;
	Thu, 25 Jun 2026 08:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930531F000E9;
	Thu, 25 Jun 2026 08:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782376649;
	bh=DTHenELavdixkpehBZtgo0+fqBfXPK/qvE1tJsk4MnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FGlFrAQy6E1uz0C3XgqICgDtpY4DNdRjgthseoT8MOaduXl+SL2fHnjmBcTYDYVoi
	 aahon87kV8Efqxe2wgajqSOfG+M8UjxNNxFsy+F5zI+k++5To0Lok2H3O3Rv1rReCc
	 4GdaD1AQG03Ev/h+Ut1+huKOcnbWktK3QkMVU8PbwQ/NT4ysLrtbHE2zVbir4hs4P/
	 NrVHnpV8HVagJwIgz0sIcJXup1HvAIrniYojkT3EXswnjYmA8WlxJbIWl1GTzV1Wo9
	 uiKQORFPHRADJs5La5tVBgIZquUTMYRVkk8GBfS+6AZVOCWadOU7XYgpssTnjgx/Gv
	 Xi0QONQ3Fwmug==
Date: Thu, 25 Jun 2026 11:37:18 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	tgopinath@linux.microsoft.com, bboscaccy@linux.microsoft.com,
	kees@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
	bp@alien8.de, rdunlap@infradead.org, peterz@infradead.org,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	elver@google.com, enelsonmoore@gmail.com, kuba@kernel.org,
	lirongqing@baidu.com, ebiggers@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Message-ID: <ajzovhWHcFQZ9d3l@kernel.org>
References: <20260619062331.348789-1-shyamsaini@linux.microsoft.com>
 <aje-nY6QbwZP9XLG@kernel.org>
 <ajyC2eX9MKSU84Z8@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajyC2eX9MKSU84Z8@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
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

Hi Shyam,

On Wed, Jun 24, 2026 at 06:22:33PM -0700, Shyam Saini wrote:
> On 21 Jun 2026 13:36, Mike Rapoport wrote:
> > On Thu, Jun 18, 2026 at 11:23:31PM -0700, Shyam Saini wrote:
> > > reserve_mem relies on dynamic memory allocation, this limits the
> > > usecase where memory is required to be preserved across the boots.
> > > Eg: ramoops memory reservation on ACPI platforms
> > >
> > > So add support to pass a pre-determined static address and reserve
> > > memory at a specified location. This enables use case like ramoops
> > > on ACPI platforms to reliably access ramoops region with previous
> > > boot logs.
> > > 
> > > Also skip the parsing of <align> when static address is passed.
> > > 
> > > Example syntax for static address
> > >  reserve_mem=4M@0x1E0000000:oops
> > 
> > reserve_mem is best effort by design because such hacks as well as memmap=
> > cannot guarantee this memory is actually free.
> > 
> > If you want to preserve ramoops reliably, use KHO with reserve_mem.
> > The first kernel will allocate memory, this memory will be preserved by KHO
> > and could be picked up by the second kernel.
> 
> ok, On ARM64 DTS systems, we can reserve ramoops memory in the device tree during
> the warm reboot.

The cc list actually implied x86 ;-)
Added arm64 folks now.

> For an equivalent ARM64 ACPI platform, what is the recommended way to reserve
> and preserve that memory across the boots? 

I don't think it exists, but a command line option (be it memmap= or
reserve_mem=) does not seem the right way to me.

Most of the arguments that were made against adding memmap= to arm64 [1]
apply here.

If kexec is an option, KHO provides a reliable way to preserve memory
across boots.

If kexec is not an option, we should look for a generic way to specify
something like DT's reserved_mem for ACPI/EFI systems.

[1] https://lkml.kernel.org/lkml/20201118063314.22940-1-song.bao.hua@hisilicon.com/T/

> Thanks,
> Shyam

-- 
Sincerely yours,
Mike.

