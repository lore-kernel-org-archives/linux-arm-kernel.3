Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3A9CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 12:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymzV+PvlZ6Qlp2rp7tv8nLpG+Mbi+vrxYO8uUghQlNw=; b=EXBrASIiUy5ef1kjrrJQ2Dld6j
	KBN43/+4LDIeL10TVp72ocRJWbpN1+ifjcQcDQLuuaInmnTmPYTn55dXVM1dsmxXeBRE/+B6CvISv
	MWT1aGLdXU5m6zFaRXXZH2dT6Jx6DI3Xsyoxun6gmvRKgN14ivSOqW9V9GDNxQ6UkrHhxPuC3JqoR
	CSNcZdQVjndgA80Rt/GmK6I2FUbsfXR1ObNYZOE1GKjpBP4a4vCwvHi7ZUNGtDdPSsJuuT5OV9Fo8
	3oWx/kl86GntDmVPaARkQDgqHDGoztMdowc2LKeHBxzqr/UW2D/XyWCcx/30lgRTb/Kt5fzHaZisD
	HgfwQ7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgx7-00000002rL0-0wMu;
	Fri, 16 Oct 2026 12:22:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgx5-00000002rKP-2Lyb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 12:22:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE4C914BF;
	Fri, 16 Oct 2026 05:22:18 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1F923F871;
	Fri, 16 Oct 2026 05:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792153342; bh=NULbTvIQZ/oHcmP/aTrGATa4IJHfneiO9zb4SUFhYOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=shhqUlli7w1Npoly5BGrBS9Jy9AZY2n6Qb6sU26nBEEnyq71sbkEQEBxvCyhG8TkX
	 g9tiyckxqyXXZraYz+0AqS9HqbmBj0vPQm+YEl3Fp3yPWsjb16Hsdua5atbQo6HLCb
	 /BewOKm9GMLZuErY0jpDtTffJNkkLeQHDbyrauGg=
Date: Fri, 16 Oct 2026 13:22:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, will@kernel.org,
	peterz@infradead.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@kernel.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, rdunlap@infradead.org,
	david.laight.linux@gmail.com, broonie@kernel.org,
	boris.ostrovsky@oracle.com, ashok.bhat@arm.com,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Christoph Lameter <cl@linux.com>
Subject: Re: [PATCH v16 03/16] arm64/delay: move, fixup usecs_to_cycles()
Message-ID: <atIW-GIWaN6-w44R@arm.com>
References: <20261016070837.440748-1-ankur.a.arora@oracle.com>
 <20261016070837.440748-4-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016070837.440748-4-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_052223_647823_31E7CF6A 
X-CRM114-Status: GOOD (  14.52  )
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

On Fri, Oct 16, 2026 at 12:08:24AM -0700, Ankur Arora wrote:
> diff --git a/arch/arm64/include/asm/delay-const.h b/arch/arm64/include/asm/delay-const.h
> new file mode 100644
> index 000000000000..6ccdfe0a4130
> --- /dev/null
> +++ b/arch/arm64/include/asm/delay-const.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _ASM_DELAY_CONST_H
> +#define _ASM_DELAY_CONST_H
> +
> +#include <linux/math64.h>
> +#include <linux/types.h>
> +#include <asm/param.h>	/* For HZ */
> +
> +/* 2**32 / 1000000 (rounded up) */
> +#define __usecs_to_xloops_mult	0x10C7UL
> +
> +/* 2**32 / 1000000000 (rounded up) */
> +#define __nsecs_to_xloops_mult	0x5UL
> +
> +extern unsigned long loops_per_jiffy;
> +static inline u64 xloops_to_cycles(u64 xloops)
> +{
> +	u64 loops_per_sec = (u64)loops_per_jiffy * HZ;
> +
> +	return mul_u64_u64_shr(xloops, loops_per_sec, 32);
> +}
> +
> +static inline u64 usecs_to_cycles(u64 time_usecs)
> +{
> +	return xloops_to_cycles(time_usecs * __usecs_to_xloops_mult);
> +}
> +
> +static inline u64 nsecs_to_cycles(u64 time_nsecs)
> +{
> +	return xloops_to_cycles((time_nsecs) * __nsecs_to_xloops_mult);
> +}
> +
> +u64 notrace __delay_cycles(void);
> +
> +#endif	/* _ASM_DELAY_CONST_H */

The bot reports are valid, moving these into headers pulled elsewhere
will clash with existing functions with the same name. You fixed one but
there's another. Isn't it easier to just add an arm64_ prefix to these?

Alternatively, I think we only need nsecs_to_cycles(). We have an out of
line call to __delay_cycles() already, so can we not just add a new
function to use directly and avoid polluting the headers:

u64 arm64_wfet_deadline(u64 timeout_ns)
{
        return __delay_cycles() + nsecs_to_cycles(timeout_ns);
}
EXPORT_SYMBOL_GPL(arm64_wfet_deadline);

I prefer the latter if it works.

-- 
Catalin

