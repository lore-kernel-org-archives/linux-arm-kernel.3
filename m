Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26DBC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycHIlbN80aDrhRI33AkYpQIydmmp+2V+yfufC70UMYM=; b=AVEa+r23FMFpvAJQ2HLfWz+Q77
	AbekLtqg2+UDr1Sephss3q8Ho6CDwOI59XO2OMaTf5URv1mvYhUBPZijw8/uU4RB2oEwxOhuKrSwo
	LMDZnzWqH6faZ6VE+BmeyxibPwQmRP/ivVJM7+akX6mGZ6ht45xA+jnAekoxndzABEjlSpXczcnTR
	MemDAJw33xl3KCvNnzV7/tLZE4/kKz4AsdBq6xVPEGC8tfAwG9lA5YlXStXkEYmlj5q3XXFmFMAjc
	IUuK80RifEJMnZ78AdfRIodF5p7WBL4+wXC4iT+q5mDVOLs2psGo2tw78C0LHGrkqIW05ejr2zKOA
	hmTymUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udou2-0000000HA5s-3DyK;
	Mon, 21 Jul 2025 11:41:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoIy-0000000H20I-0xjp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 11:03:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38986153B;
	Mon, 21 Jul 2025 04:03:29 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34E1F3F6A8;
	Mon, 21 Jul 2025 04:03:33 -0700 (PDT)
Date: Mon, 21 Jul 2025 12:03:30 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, ardb@kernel.org, frederic@kernel.org,
	james.morse@arm.com, joey.gouly@arm.com,
	scott@os.amperecomputing.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/7] arm64/futex: add futex atomic operation with
 FEAT_LSUI
Message-ID: <aH4egvxnbQPu1XzE@J2N7QTR9R3>
References: <20250721083618.2743569-1-yeoreum.yun@arm.com>
 <20250721083618.2743569-6-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721083618.2743569-6-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_040336_306273_795F5AFF 
X-CRM114-Status: GOOD (  19.56  )
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

On Mon, Jul 21, 2025 at 09:36:16AM +0100, Yeoreum Yun wrote:
> Current futex atomic operations are implemented with ll/sc instructions and
> clearing PSTATE.PAN.
> 
> Since Armv9.6, FEAT_LSUI supplies not only load/store instructions but
> also atomic operation for user memory access in kernel it doesn't need
> to clear PSTATE.PAN bit anymore.
> 
> With theses instructions some of futex atomic operations don't need to
> be implmented with ldxr/stlxr pair instead can be implmented with
> one atomic operation supplied by FEAT_LSUI.
> 
> However, some of futex atomic operations still need to use ll/sc way
> via ldtxr/stltxr supplied by FEAT_LSUI since there is no correspondant
> atomic instruction or doesn't support word size operation
> (i.e) eor, cas{mb}t But It's good to work without clearing PSTATE.PAN bit.

That's unfortunate; have we fed back to Arm's architecture folks that we
care about those cases?

> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/include/asm/futex_lsui.h | 132 ++++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 arch/arm64/include/asm/futex_lsui.h

This logic is introduced unused, and TBH I don't think this needs to be
in a separate header.

I reckon it's be better to keep all of this in <asm/futex.h> and rework
the series to:

(1) Factor out the existing LL/SC logic into separate LL/SC helpers in
    <asm/futex.h>, with an __llsc_ prefix, called by the existing
    functions.

(2) Add the new __lsui_ futex operations to <asm/futex.h>, along with
    code to select between the __llsc_ and __lsui_ versions.

We split the regular atomics different becuase there are *many* generic
atomic operations, but I don't think it's worthwhile to split the futex
logic over several headers.

Maybe it's worth having <asm/lsui.h>, but for now I reckon it's best to
also fold that into <asm/futex.h>, and we can split it out later if we
need it for something else.

Mark.

