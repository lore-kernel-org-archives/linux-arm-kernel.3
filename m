Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37856CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrVk5ShRfzGFsQahx1B0uVfDYW2vJsKK+G9rR6jNdXM=; b=fF0JLW3WXA4xu5wU6yPVskG1Fc
	qxMfYbGHxZn67NtagmWP7bGw6cmKbLCUzUtwPwHw2Hc+dK7dIjuDptlUYsos1Nrt6k7roBJzGvt7T
	2ItZ/bYGRD3X3sKKcHu2OeMZO7lNOa2Em4f0q7+gvpyFRcUtYlCAwZj0MtYwEYyONS/NF1SZ1lvEO
	HvAQYDn2CG3EvLVOlnWH96nDN2gfAU630QkJ7a9oER4Q8uUx48BMZjYwBoIK9iBpyFl/6XmEO0F8Y
	l4uXMpMRbgj4xHKuVt4P3H6HhJpHuNzXzjcgXI2lrxEUKUQumsowU1BupGK0yR2N7LpR+RiwLkYLQ
	9TSxRqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE820-000000018co-36bY;
	Tue, 06 Oct 2026 16:28:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE820-000000018bx-0t10
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 06 Oct 2026 16:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PrVk5ShRfzGFsQahx1B0uVfDYW2vJsKK+G9rR6jNdXM=; b=bVOdLSqncbthVm03huxo69u7ow
	gg+x++9x8XStKcJTymCYgiiI8K+aIjif23U4mh4Smm/6Rt6NXR4QU6bE/QKCN2U2iKlWaFcAdQYNI
	lwnEobvX6I17yPbqGeN6goClTq9165VlMsfUw5oGwm19pgUsH1S8ZceXYikx2A6UjuKO1YlisSv7v
	FFpvB6N0NpMRk1p4tw6unkyAn7dB9Z4mTQ/1vPzx4s7m0tprmkk0119JkxN6TWP30FHqyuP/aLUTN
	6y0JU57Ydl4JxKQk04pJT4ymarFfaSJOTjx66dJHpo960L+AVgsh36LqQFXkEoLBoIwQFFwz/+sNe
	b+nlHvCQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xE81x-00000008rcY-0ZL2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 16:28:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A0F11477;
	Tue,  6 Oct 2026 09:28:34 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 598203F66F;
	Tue,  6 Oct 2026 09:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791304117; bh=5eIaWvw6s0vq5IeqVoyPRN/MQcUH0B8iv4QSkb7mywg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FC8h+NaHZDgLKJGZoI7h26UscW5FKZkh5YYOz8/k5uad+9v5FSGPSR73rl8GOLLCc
	 CcDki766gxr8eVisyqwhlsHtZPLL1uWZLyf3hKt/u0NGEvSgnOfnjlVqmPRSHNYbQL
	 /FLMXCjKB4FCRRKTof3yFFZIvoU5h5njx/QmDV9s=
Date: Tue, 6 Oct 2026 17:28:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Tejun Heo <tj@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Lucas Wei <lucaswei@google.com>,
	Barry Song <baohua@kernel.org>, Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH 0/6] arm64: alternatives: switch most used alternatives
 to callbacks
Message-ID: <asUhsMhMumCwalZt@arm.com>
References: <20260928133034.243541-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928133034.243541-1-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_172841_446144_1B87239C 
X-CRM114-Status: GOOD (  14.24  )
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

Hi Ada,

On Mon, Sep 28, 2026 at 02:30:28PM +0100, Ada Couprie Diaz wrote:
> All numbers are on v7.3-rc4 building defconfig with GCC 13.3.0.
> Only the patches mentioned are applied on each line.
> 
> |   Patches    |  Size (B) |	|    Patch    | Size (B) |
> | Base vmlinux | 172826400 |	|  Base Image | 52374016 |
> |          1-3 |    -71672 |	|         1-3 |   -65536 |
> |            4 |    -71704 |    |           4 |   -65536 |
> |          1-4 |    -64712 |	|         1-4 |   -65536 |
> |          5-6 |    +68008 |	|         5-6 |       -0 |
> |  All patches |    + 3240 |    | All patches |   -65536 |
> 
> The impact on alternatives is two-fold :
> 1. As expected, all alternatives for the two I/O workarounds and
>    97% of the `ARM64_HAS_VIRT_HOST_EXTN` alternatives are converted to
>    callbacks, saving 85848 bytes (20 pages).
> 2. The raw number of alternatives *increases* by about 3% (250 new entries)

TBH, I don't think the saving is worth the additional complexity.

I wonder, could we instead move the replacement instructions to a
separate section we can drop after patching? I can see x86 uses a
separate .altinstr_replacement. Not sure what restrictions we have on
arm64, e.g. if it's placed too far.

That said, are some of the other patches worth picking up as cleanups?

-- 
Catalin

