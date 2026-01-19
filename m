Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67820D29C33
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYsVoAK29P6ovmL28x+FAsIzovbuL5nOaJ5bkgJGsIk=; b=JJH419wjSe93AfNFelN0IU9zrv
	DkaLnni7HY4Y6KlCSOqd+UJALx6bzuI54wRFSxj4Z5X4c9q2unUi/DaICBp3T0YuWAAwWc4gu7jeP
	vcHX2V2LZqpfRIbyktyOG9HL/Acb7TjU7Ud5OV9p3oALqDeylLBr9d4NoCXW70Q+66AU3Z4oxZv39
	XrWsnvrqA0jM7ibnmKGurroCVabdSl1D00k95hvEU1cd4wRIXlwPIpiLgX9lmx/aMI7ivIhqydK2Q
	z7ZnU8VyIiqxdcQAkhVDocuFoeUes85gwPgfenF/jY+H2TKSU3ke+CO4rsS0tB8u9Gulp+jC1xEwI
	WKBiRxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhr1f-00000002Kj4-14rO;
	Mon, 19 Jan 2026 15:18:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhr1a-00000002KiF-3ike
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:18:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F16E260055;
	Mon, 19 Jan 2026 15:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E447FC116C6;
	Mon, 19 Jan 2026 15:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768835917;
	bh=benepdXqNFJJEGYtUD5CAZxKsTPdNw8vQHTJ883YUNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BhYb55LgL1oZEx4gsNlbv798YZOwcEyMN16YeS1tf4ZXEiU/A6sdcoYrHTAgV/oUz
	 vRU085H0zS++xpxfUFKpmYaPkV219IXvTbEthZLmPIMHbFr0nchYytnsng9aoy1fpU
	 Tvt4rHlVYvfB7jcj9UxYlIohH4dQgPW8pwicuZTRNck9VLlW7p/cn9GadLvvLijGEc
	 bUiPgpvd9PShBJDbw5SGPuE+pRFEZy77kW3n9zQMR8Nha2MctCpX5QNeTYBFBTXmsm
	 L1IhHI0T95vQ6ts4+IMrs3seviNs7JGiqExbwjt4gfEjxNTdHmJHfke6Un5QBY9EN+
	 O4uSv0Uigo9gw==
Date: Mon, 19 Jan 2026 15:18:32 +0000
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
	mark.rutland@arm.com, catalin.marinas@arm.com, kees@kernel.org,
	Liz Prucka <lizprucka@google.com>,
	Seth Jenkins <sethjenkins@google.com>
Subject: Re: [RFC PATCH] arm64: Bring back linear map randomization using
 PArange override
Message-ID: <aW5LSNqClja6MUo2@willie-the-truck>
References: <20251211040935.1288349-2-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211040935.1288349-2-ardb@kernel.org>
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

On Thu, Dec 11, 2025 at 05:09:36AM +0100, Ard Biesheuvel wrote:
> Commit
> 
>   1db780bafa4ce ("arm64/mm: Remove randomization of the linear map")
> 
> removed linear map randomization from the arm64 port, on the basis that
> a prior change to the logic rendered it non-functional on the majority
> of relevant CPU implementations.
> 
> As has been reported numerous times now, the upshot of this is that the
> virtual addresses of statically allocated kernel data structures are
> highly predictable if the kernel is loaded at a known physical address.
> Any bootloader that still adheres to the original arm64 boot protocol,
> which stipulated that the kernel should be loaded at the lowest
> available physical address, is affected by this.
> 
> So bring back the most recent version of linear map randomization, which
> is based on the CPU's physical address range, but this time, allow this
> PA range to be overridden on the kernel command line.
> 
> E.g., by passing
> 
>   id_aa64mmfr0.parange=1 # 36 bits
>   id_aa64mmfr0.parange=2 # 40 bits
> 
> the CPU's supported physical range can be reduced to the point where
> linear map randomization becomes feasible again. It also means that
> nothing else is permitted to appear in that physical window, i.e.,
> hotplug memory but also non-memory peripherals, or stage-2 mappings on
> behalf of KVM guests.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> Cc: Liz Prucka <lizprucka@google.com>
> Cc: Seth Jenkins <sethjenkins@google.com>
> 
> This is posted as an RFC because there are obvious shortcomings to this
> approach. However, before I spend more time on this, I'd like to gauge
> if there is any consensus that bringing this back is a good idea.

I'm a bit worried about knock-on effects of restricting the parange,
especially for guests, although I admittedly haven't had a chance to
investigate it properly.

If we instead made the cmdline option specific to memory hotplug (e.g.
by providing a ceiling for the maximum physical address of memory that
can appear dynamically), would that give us what we need? For Android,
we could then pass a value of '0' in the default cmdline (effectively
disabling memory hotplug) and the onus would be on the few platforms
that care about hotplug to set the value correctly.

We already have "mem=", so maybe it's just a question of special-casing
0 for that (assuming that memory hotplug respects the memory limit).

Will

