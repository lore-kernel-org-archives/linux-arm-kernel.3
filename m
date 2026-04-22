Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88930F9EDF3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xXIulcq0fte+sXNZGPN0UhIfhukdE/KMp3fhtnexjI=; b=Ssi/lUARhZjK5wvHCnLlIRIYzC
	0QDBgrI/AdX3Wf4A4ZtNzPd+gJsRL/yoSY1v5UFIhaLbNQKJzmfZLJDwiS78FyMwoPSPnSn0GyD7i
	I0Vs+XNiTHUBLIH1hitSM9X1ZOrrg52LvDt7UW1op+R2dN7Be1DKYCtZZKpacfjvcfKdkCKf1oLAj
	27CPmkmwDEjwAOs78go5Ee2lNrLeMhxfuJezx3T+uTITp+UH155cNcGK01xEDTNUbPFFToa/cgj8f
	E3bGxOpTG1m1jgf4XkFv1p4IAw0SxHZySy3VyVpf6OcfPJzwqTWAPx7+DvmFx4U1ido132KASJKAk
	RVcydFDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZKA-0000000AQBW-2zw8;
	Wed, 22 Apr 2026 15:17:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZK1-0000000AQ7X-0jWL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 15:17:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49ADE1F91;
	Wed, 22 Apr 2026 08:16:54 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6B8B3FD88;
	Wed, 22 Apr 2026 08:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776871019; bh=is7cxhJlVLded2ZLMSS+IvUViROU730IKILupbj7wo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f26MVB5bIq1vmZaS9GBkOn6c0U1QrIqSx4lli8yfL3RzLdfcMWWEJLoyU3B5p2de5
	 9FTvwyJfEqWfxFkff5Xu4mM8+qLuOi6NVYfHQCN5lnxgyNPA0geWvn+6hCW/wISIgW
	 qH3p+2CvsE6tu4Qr7aRoFRFy1pJs4Eoyj6q5EhMI=
Date: Wed, 22 Apr 2026 16:16:53 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH] arm64: traps: Add a macro to simplify the condition
 codes check
Message-ID: <aejmZUdyJcgr8GYQ@J2N7QTR9R3.cambridge.arm.com>
References: <20260320082846.1235016-1-ruanjinjie@huawei.com>
 <dd2f076b-976c-480d-8414-e6685cad40dd@huawei.com>
 <fbd9268f-ace7-42d8-b920-8b6f9b97cf6d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbd9268f-ace7-42d8-b920-8b6f9b97cf6d@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_081701_343795_BF7CFD8D 
X-CRM114-Status: GOOD (  23.26  )
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
Cc: smostafa@google.com, kees@kernel.org, catalin.marinas@arm.com, Jinjie Ruan <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org, mrigendra.chaubey@gmail.com, maz@kernel.org, leitao@debian.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Apr 22, 2026 at 03:43:39PM +0100, Vladimir Murzin wrote:
> Hi Jinjie,
> 
> On 4/22/26 04:06, Jinjie Ruan wrote:
> > 
> > On 3/20/2026 4:28 PM, Jinjie Ruan wrote:
> >> Add DEFINE_COND_CHECK macro to define the simple __check_* functions
> >> to simplify the condition codes check.
> >>
> >> No functional changes.
> > Gentle ping.
> > 
> >> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> >> ---
> >>  arch/arm64/kernel/traps.c | 59 ++++++++++-----------------------------
> >>  1 file changed, 15 insertions(+), 44 deletions(-)
> >>
> >> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> >> index 914282016069..6216fe9e8e42 100644
> >> --- a/arch/arm64/kernel/traps.c
> >> +++ b/arch/arm64/kernel/traps.c
> >> @@ -49,45 +49,21 @@
> >>  #include <asm/system_misc.h>
> >>  #include <asm/sysreg.h>
> >>  
> >> -static bool __kprobes __check_eq(unsigned long pstate)
> >> -{
> >> -	return (pstate & PSR_Z_BIT) != 0;
> >> -}
> >> -
> >> -static bool __kprobes __check_ne(unsigned long pstate)
> >> -{
> >> -	return (pstate & PSR_Z_BIT) == 0;
> >> -}
> >> -
> >> -static bool __kprobes __check_cs(unsigned long pstate)
> >> -{
> >> -	return (pstate & PSR_C_BIT) != 0;
> >> -}
> >> -
> >> -static bool __kprobes __check_cc(unsigned long pstate)
> >> -{
> >> -	return (pstate & PSR_C_BIT) == 0;
> >> -}
> >> -
> >> -static bool __kprobes __check_mi(unsigned long pstate)
> >> -{
> >> -	return (pstate & PSR_N_BIT) != 0;
> >> -}
> >> -
> >> -static bool __kprobes __check_pl(unsigned long pstate)
> >> -{
> >> -	return (pstate & PSR_N_BIT) == 0;
> >> -}
> >> -
> >> -static bool __kprobes __check_vs(unsigned long pstate)
> >> -{
> >> -	return (pstate & PSR_V_BIT) != 0;
> >> -}
> >> -
> >> -static bool __kprobes __check_vc(unsigned long pstate)
> >> -{
> >> -	return (pstate & PSR_V_BIT) == 0;
> >> -}
> >> +#define DEFINE_COND_CHECK(name, flag, expected)			\
> >> +static bool __kprobes __check_##name(unsigned long pstate)	\
> >> +{								\
> >> +	return ((pstate & (flag)) != 0) == (expected);		\
> >> +}
> >> +
> >> +DEFINE_COND_CHECK(eq, PSR_Z_BIT, true)
> >> +DEFINE_COND_CHECK(ne, PSR_Z_BIT, false)
> >> +DEFINE_COND_CHECK(cs, PSR_C_BIT, true)
> >> +DEFINE_COND_CHECK(cc, PSR_C_BIT, false)
> >> +DEFINE_COND_CHECK(mi, PSR_N_BIT, true)
> >> +DEFINE_COND_CHECK(pl, PSR_N_BIT, false)
> >> +DEFINE_COND_CHECK(vs, PSR_V_BIT, true)
> >> +DEFINE_COND_CHECK(vc, PSR_V_BIT, false)
> >> +DEFINE_COND_CHECK(al, 0, false)		/* Always true */
> >>  
> >>  static bool __kprobes __check_hi(unsigned long pstate)
> >>  {
> >> @@ -131,11 +107,6 @@ static bool __kprobes __check_le(unsigned long pstate)
> >>  	return (temp & PSR_N_BIT) != 0;
> >>  }
> >>  
> >> -static bool __kprobes __check_al(unsigned long pstate)
> >> -{
> >> -	return true;
> >> -}
> >> -
> >>  /*
> >>   * Note that the ARMv8 ARM calls condition code 0b1111 "nv", but states that
> >>   * it behaves identically to 0b1110 ("al").
> > 
> 
> It looks like we now have a mix of checks implemented via macros
> and others written out explicitly. The existing approach has the
> advantage of being consistent and easy to follow, whereas
> introducing macros here, even if it reduces some duplication,
> adds a bit of cognitive overhead when reading the code.
> 
> This may come down to preference, but I think sticking to a
> single, consistent style would make the code easier to scan and
> maintain.

FWIW, I agree. I think it'd be better to leave this as-is for now.

Mark.

