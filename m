Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C235CC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xz99la/oDRRkYoeUQubqzsSQdycdHc1WWJfFuxUQjNE=; b=XamQ70kbMZxZSYWbVUBTqEhGfM
	9ohY0uIFtchHCxbvP6nAceoIsSjsPIm8WOfSr85IL8fwObKYWWDza34i0Fmyy/IQZtX45XC2QGeOM
	W0JESzS2f/uAe3x4uuNHVX20itFCUG3q1PTeVuIlCv9fTa/m86Dx5i1ZcqcUVdhL8sKLRNcIrQmgg
	eRKa9yBhRz2GWKCd6Akboio/Y6+5j+rXBSbBXyUtzpW8IVP1SHzybXywysYcmP/kVPp6pWSM+/UB4
	dQDMhqo1/fdo5QHceCgP+NVg2c528efu8YUDCn/vKoH+QWV8SRbHyLLdtpLkiGXW+u1N5By22I2XK
	IlCW2K0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeih-0000000CqjB-3Bqc;
	Wed, 22 Jul 2026 21:43:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeig-0000000CqiB-1bB1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:43:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CF81E600B0;
	Wed, 22 Jul 2026 21:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C3F1F000E9;
	Wed, 22 Jul 2026 21:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756593;
	bh=Xz99la/oDRRkYoeUQubqzsSQdycdHc1WWJfFuxUQjNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FkxeiJNAa3j2sMafo6jZLbRm6zFW656hfFJqR+GlR1nreROU8h74RP8Mu/dPsZI5D
	 LNR+eXELl4lSq5+Iw9KZlEvF/D9pEjHGoCQaONf1mcspup7erI+szvzhJMFzJSFUse
	 4Jj6IaVKcf2OP8HqPro9EXPSnLcMgtaxCW6ltqTl5ZBtljKN6bz7HJkHTGgWfijBU8
	 ou6aLQWpxTmJfIdEf1/Eps+jOQjBbfH3RIaIk0AL6N1T7GjUrQFg+2izwAx281Nl4Q
	 D2NUTs0WHr7an/O0c1cJO5Ai8PcsoBabISJXYvHY6glufdltLCg7aCBJnZRwRobQQs
	 RuL9+vXQTCOqQ==
Date: Wed, 22 Jul 2026 22:43:09 +0100
From: Will Deacon <will@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
Message-ID: <amE5bX0jey6WS0U1@willie-the-truck>
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
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

On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
> diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
> index e278e060e78a..2452990ed37a 100644
> --- a/arch/arm64/lib/delay.c
> +++ b/arch/arm64/lib/delay.c
> @@ -15,6 +15,8 @@
>  
>  #include <clocksource/arm_arch_timer.h>
>  
> +#include "../kernel/idle.h"
> +
>  #define USECS_TO_CYCLES(time_usecs)			\
>  	xloops_to_cycles((time_usecs) * 0x10C7UL)
>  
> @@ -49,7 +51,8 @@ void __delay(unsigned long cycles)
>  		 * Start with WFIT. If an interrupt makes us resume
>  		 * early, use a WFET loop to complete the delay.
>  		 */
> -		wfit(end);
> +		if (likely(idle == ARM64_IDLE_WFI))
> +			wfit(end);

Rather than scatter the idle implementation check across all users of
WFI*, why not move this into the macro itself? That way, the callers can
all stay like they are but the macro behaves as specified.

Will

