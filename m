Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6C4C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIlXgd92q5l3WMeJYxjd8gakHUDLPPBJ4dZQ2jzM1q8=; b=rrj/lu8QBOpqnYYESmxnJujyRT
	bg92dwZoehZeijaJOqUMxPKaR9oU/1ss9Okgz2PbB2tYyVu3lvWn1ikXRswbuIIFPuO1ajdBQ9mDZ
	UyBoF4x/Ed+ZE02mO8telchep2GM72PooC3mAWQQLhOY8U9VofzCaq5KEdMm9ktpzSkhcZXURoaiI
	O4j7NebHMJMroG92p8Hc/wUC5AZ7+t143VjxvMwWUi8N57+H6+mb+8/eSoQfbgnmZiOZr4gi8hdPz
	zSg9mO0wi85Glge6XBtvbttbXjo5Fh77qZk7SRyZD5A7plX0SWoi7p9LEbSeH1dhwtjMf/H7hr2bV
	yA3SMbTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJVZ-000000080Cg-1Rpm;
	Fri, 07 Aug 2026 12:17:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJVX-000000080Ca-3Z45
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 12:17:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 57FA5404AA;
	Fri,  7 Aug 2026 12:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D221F000E9;
	Fri,  7 Aug 2026 12:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786105023;
	bh=iIlXgd92q5l3WMeJYxjd8gakHUDLPPBJ4dZQ2jzM1q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aQ609VhWKoMxZV5B/k6aZXcTx4TL+yj0Oqv8Ck2VatM/sFQ9XfAtp8nCCiwVKXg68
	 4N0urObXCmDTjzXq7U8NuPXV9wzCUtZzg0jVJlxlD61SifrXsSqX65UF1dRto4y3Q1
	 Ms4YJsWHspDH+ggcTif6ddzNYWDhG65x5vbLYHWzY19sy1TGbL2J83IPiqFV9W4clY
	 aC+XzW+fcZxpLC8Z6M4GYqTgNed07yzMeqblP0bVIZk1bnZXNO2MLfWTqlx3JwAhJ/
	 z2+CNj713VWnuA5jBTNo6QklxSsIqmzVSbTbBhZYl7ZwTmHAejYx2D7st1yPux15dR
	 /tFvcjva2sAYA==
Date: Fri, 7 Aug 2026 13:16:58 +0100
From: Will Deacon <will@kernel.org>
To: gus bourg <gus@bourg.net>
Cc: ardb@kernel.org, catalin.marinas@arm.com, ilias.apalodimas@linaro.org,
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64/efi: Do not call EFI runtime services preemptibly
 under SW PAN
Message-ID: <anXMug2_-vZl_pZ7@willie-the-truck>
References: <20260806000144.3388823-1-gus@bourg.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806000144.3388823-1-gus@bourg.net>
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

On Wed, Aug 05, 2026 at 05:01:44PM -0700, gus bourg wrote:
> From: Gus Bourg <gus@bourg.net>
> 
> When PAN is emulated by switching TTBR0_EL1, arch_efi_call_virt_setup()
> installs the EFI mm into TTBR0_EL1 via uaccess_ttbr0_enable(), and only a
> return from exception ever puts it back: check_and_switch_context() skips
> the register write by design ("Defer TTBR0_EL1 setting for user threads to
> uaccess_enable() when emulating PAN"), and __switch_to() does not touch it
> either. switch_mm() updates only thread_info->ttbr0.
> 
> Since commit a5baf582f4c0 ("arm64/efi: Call EFI runtime services without
> disabling preemption") the runtime call is preemptible, so the EFI worker
> can now be scheduled out inside that window. An involuntary preemption is
> harmless, because __swpan_entry_el1()/__swpan_exit_el1() save and restore
> the state around the exception. A voluntary reschedule is not: it performs
> no return from exception, so the worker resumes with another task's
> TTBR0_EL1 - or reserved_pg_dir - and the next efi_mm access takes a level 0
> translation fault.
> 
> There is such a preemption point in arch_efi_call_virt_setup() itself,
> immediately after the TTBR0 install: __efi_fpsimd_begin() ->
> kernel_neon_begin() -> put_cpu_fpsimd_context() -> local_bh_enable() ->
> preempt_check_resched().

Hmm, can we move the ttbr0 toggling until after __efi_fpsimd_begin() so
that this preemption point doesn't interfere?

Will

