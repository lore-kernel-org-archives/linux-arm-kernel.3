Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA77C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ad26VTcNBpqhCk3PDmhfWWoYWKuA+HI0eGezUmF1ovA=; b=ZkqgeXbXQfx2kRXQPpF57bzMpH
	fsD4rcGOlfnil6jl2b8gXVBZ3i3bRXaX6MACikIOdRTOCOXX4DMKHTkW6GYep3hcFLybkCP2/KLtc
	rPAO+ihZ5ZPJvKcdObd2u1DTC/SsD0vBtFa/cXTChluP8zIATXv6VO9Ti8/CvrttxjPjZBNPRdbkK
	gz7ni++LmKmsegSaeu7sM+fqt29+BXjHMtprtMmCWsAw2d6RjZCMibU5tBKGJCicomFIwfIrOmo+l
	6jmJ0N3j2rS8PkIKGZgyXGkOb9eM6HOLPe0WtIlq4amCVLv3Yd0B+sawBI5UVjrf5tYDdcLgUwc1c
	EFavuSnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCTI-0000000FLrl-1ULd;
	Fri, 27 Jun 2025 17:02:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBIL-0000000F9qs-3gO0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:47:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9043445C1F;
	Fri, 27 Jun 2025 15:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39325C4CEEF;
	Fri, 27 Jun 2025 15:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039237;
	bh=qNIoTgTbHqBRN/clD/K0osBrCJKHrHpWmTC8Yguvung=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eMGCH8yAj3Tqio02XK0YK8RmwpQ98WxJ2es1uBBNGnP/TO68LAHONccKNtA8LtNgI
	 s6or5Qvl/QeEI5IPOLYHs9ZQCA+uTzGjo3VcqYcTed3S2usko1rmMEEfgiARcxr8Sn
	 hRUAC+hBHUORRevY5Cn1ZxWig1OQgHFmro/HHhPq0o52vvYNVftTz48qMODGEhQvTe
	 QXyoBXtsEnp+TYxggpV2PSL5HeSIazEXaoQrkLtQ3YGfBLsnrY1epsAfnAOujZeLEL
	 e8pWMb6ydFqXkp/hX8f0Qzc8X79KuPbDjrJmuWWAPBrIKZSxnFwogAzgro6VPUqjcA
	 E85hkjl5UY4EA==
Date: Fri, 27 Jun 2025 16:47:13 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v4 12/13] arm64: debug: split bkpt32 exception entry
Message-ID: <aF69AWI_Ezsp2M6n@willie-the-truck>
References: <20250620211207.773980-1-ada.coupriediaz@arm.com>
 <20250620211207.773980-13-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620211207.773980-13-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084717_935135_7921FDB7 
X-CRM114-Status: GOOD (  19.14  )
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

On Fri, Jun 20, 2025 at 10:12:06PM +0100, Ada Couprie Diaz wrote:
> Currently all debug exceptions share common entry code and are routed
> to `do_debug_exception()`, which calls dynamically-registered
> handlers for each specific debug exception. This is unfortunate as
> different debug exceptions have different entry handling requirements,
> and it would be better to handle these distinct requirements earlier.
> 
> The BKPT32 exception can only be triggered by a BKPT instruction. Thus,
> we know that the PC is a legitimate address and isn't being used to train
> a branch predictor with a bogus address : we don't need to call
> `arm64_apply_bp_hardening()`.
> 
> The handler for this exception only pends a signal and doesn't depend
> on any per-CPU state : we don't need to inhibit preemption, nor do we
> need to keep the DAIF exceptions masked, so we can unmask them earlier.
> 
> Split the BKPT32 exception entry and adjust function signatures and its
> behaviour to match its relaxed constraints compared to other
> debug exceptions.
> We can also remove `NOKRPOBE_SYMBOL`, as this cannot lead to a kprobe
> recursion.
> 
> This replaces the last usage of `el0_dbg()`, so remove it.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> ---
>  arch/arm64/include/asm/exception.h |  1 +
>  arch/arm64/kernel/debug-monitors.c |  7 +++++++
>  arch/arm64/kernel/entry-common.c   | 21 +++++++++------------
>  3 files changed, 17 insertions(+), 12 deletions(-)

Reviewed-by: Will Deacon <will@kernel.org>

Will

