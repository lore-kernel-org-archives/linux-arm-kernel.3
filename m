Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1775C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsa4Nj6eUiql1WJUgdAiYQg2lVGVXOu6vO8Di8EV5FU=; b=PblPBjLTOn/wBSfmSty2A7s5C6
	CW/lXPJjpSd1GHmu1RJGu2UOHt+xKyN7ABK4XlMLFeShkiF+NBUMWil+0lYHf1hZIqPo1i0hdYQM8
	AI4iSJUah998D+11vs9WiGUHLQUeELgV76Y8ca4B6jlXAHRTy/Je+ek1hzpJW5Kz47oagJgEElqYS
	yn8fm1LZXbVZ0z7oHrr4K2CYgejN2BOTTyFeG7oy3ssuNq4H/lgvE9TFkuelKkFsOI9qnOzq4HNWZ
	QuQMQuRNZZQHkpr+uLRKcHxL56mwACSsFAoNgA3pNhNXfn8IqK6jVRjtejiMQ6bIfTwajHWI6dMvx
	GpgX9I6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gO5-00000002kUb-1cpt;
	Mon, 21 Sep 2026 15:57:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gO2-00000002kU1-0lfE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 15:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bsa4Nj6eUiql1WJUgdAiYQg2lVGVXOu6vO8Di8EV5FU=; b=EUPYsqApcW0UZDp8DzYI9Evc+e
	lRDDG/60skACLGD1hL/VdJHYqAguDWgDXCXcnTket27B0Oy4pkKyxmH4i1Ryz1b5w0UlPRcNyPpFK
	w4FOpdi1UF04YfzUMpUmiRWNK7XUnPRIeRPI+AJnDkgTouZezMLODlvvjUknbjeAkMzddmxDRDKdO
	Lgbju5e7f3yiav+RGI+i0mk6LXF2Zw+SdeXiXwiiAVWZOHE9bFEP/4/AdQmBIzx4KL28C34yFewwZ
	YkVRm9yweMzQzDSJTlcYbFBfIzahjknK/Z5RHAjhMOjlvhufPBgtS6HMEdrIGyl8fcA+LQpvDZbFD
	JGr5R/fg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8gNy-0000000CW4E-2Sjg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:56:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AAA8176C;
	Mon, 21 Sep 2026 08:56:49 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A8743F632;
	Mon, 21 Sep 2026 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790006213; bh=5/vliXgkiiHsQkGUS0MaWY2+lozGLpOlJnlU0M6q24Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q4pcOp7SfkiLg0TPGmeGWp0IXKA3kwKxa8a4umwl+d0uWarRQdGofLCbsejE82F8F
	 FWzDonyXO3r3x1e9DibZxCHS4B6hpD2iQqZl7AAp6D65zQBQTV+smk96tKN5YNEDum
	 +lKJgVHWdVVIdrConkKNS+CX6jiNkXS09Ex7PlXw=
Date: Mon, 21 Sep 2026 16:56:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 15/21] arm64: entry: Point SP_EL0 at the overflow stack
Message-ID: <arFTvxg2FJQUV7qt@arm.com>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-16-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918161407.2300-16-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_165655_097131_8338B8F1 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 05:13:59PM +0100, Will Deacon wrote:
>  static void __init set_boot_cpu_offset(void)
>  {
> -	asm volatile("msr tpidr_el1, %0"
> -			:: "r" (per_cpu_offset(0)) : "memory");
> +	u64 ovf_sp = (u64)raw_cpu_ptr(overflow_stack) + OVERFLOW_STACK_SIZE;

raw_cpu_ptr() is using tpidr_el1 and we haven't initialised it yet.
Actually, I think we get away with it because in head.S we initialise it
to 0 (__per_cpu_offsets[0] is still zero at that point for the boot CPU).

> +
> +	asm volatile(
> +	"	msr	tpidr_el1, %1\n"
> +	"	add	%0, %0, %1\n"
> +	"	msr	sp_el0, %0" /* Update the overflow stack pointer */
> +	: "+r" (ovf_sp)
> +	: "r" (per_cpu_offset(0))
> +	: "memory");

Even if this is intentional and we rely in TPIDR_EL1 to be 0, it feels
weird to add the offset to raw_cpu_ptr().

Could we just do (untested):

	unsigned long ovf_sp = (unsigned long)per_cpu_ptr(overflow_stack, 0) +
		OVERFLOW_STACK_SIZE;

	asm volatile(
	"	msr	tpidr_el1, %0\n"
	"	msr	sp_el0, %1"
	:
	: "r" (per_cpu_offset(0)), "r" (ovf_sp)
	: "memory");

with no further arithmetics in asm.

-- 
Catalin

