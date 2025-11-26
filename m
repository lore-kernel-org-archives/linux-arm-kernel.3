Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2896D111B3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 22:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15uRdP8/cHAmu2xvFRuF7gS6KSSEI6PGSSoUqxRzVAk=; b=zEPvAE2qEpSv1COup0ZZyToSsR
	+dKWZtOWXmX2SKi5+4n7oIrMFD9scXKXyPLO9DixVjc/AJtRyRc9iMRlsoqPR+txt5lvCxLt1zQzQ
	qc9Eo8fLgqHz+1LWFT5y+dykFt1tEy6jE/j/HBcTh+a4TIVndCUc67At0OiGPgXvwZF2vUkfiExXR
	OfwaI9+CbzsQ5aRVjuZrcwf7csddBAo5sPVQqnz7mJeZYmR5f6QjApTTVsdcZMQ8yGU7S8dlzw63t
	QN2pbynAG3P3uE5kOIgKO5xoCOVwaS4+bnJKoyk5vu4G0Ju+mQsJOoM7RAH1mQbtmb3ttSqCV+sWX
	sAQH18SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONww-0000000FiL3-0pFy;
	Wed, 26 Nov 2025 22:25:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONwu-0000000FiKu-3Eyr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 22:25:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA9D060215;
	Wed, 26 Nov 2025 22:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286FCC113D0;
	Wed, 26 Nov 2025 22:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764195919;
	bh=vi3sXuoq8NW4X5pAcVp0cXxkzqgvDgMYVY32kpZLpT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VaMoRZ0gYufKwy89nGlnYRXsSbkvzfjN/4HSsLlH0zGOWVl+uwyAEosiAATPxNtFp
	 lfEueX4VbHiUN4/BDDnC2DFdOtackaJXgwLSTfhJU8ReCAvFFi7cg1MEep4TSRC/68
	 gQvHFBwc7153fEYeGlk4hDv0DPyr1WcI4cmLj0xpzhYuevHrROQ+uH3WLpnwivyUsq
	 AVNz578ogLHWx20x1F/GL+igi9XCcTQMBbxYmrfV7spLqv5XTDLoGL9fX5wifpXyS2
	 5t2pTO7KakTznKxIqEuBC+oY6OFvyhgQNrBlJdP9cWI3plNw56aH8hhltL4h/7QMXV
	 dnrl20kgh8ffA==
Date: Wed, 26 Nov 2025 22:25:17 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Anirudh Raybharam <anirudh@anirudhrb.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, longli@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, maz@kernel.org, tglx@linutronix.de,
	Arnd Bergmann <arnd@arndb.de>, akpm@linux-foundation.org,
	agordeev@linux.ibm.com, guoweikang.kernel@gmail.com, osandov@fb.com,
	bsz@amazon.de, linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH 2/3] irqchip/gic-v3: allocate one SGI for MSHV
Message-ID: <20251126222517.GA1387324@liuwe-devbox-debian-v2.local>
References: <20251125170124.2443340-1-anirudh@anirudhrb.com>
 <20251125170124.2443340-3-anirudh@anirudhrb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125170124.2443340-3-anirudh@anirudhrb.com>
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

On Tue, Nov 25, 2025 at 05:01:23PM +0000, Anirudh Raybharam wrote:
> From: Anirudh Rayabharam <anirudh@anirudhrb.com>
[...]
>  /* SMCCC hypercall parameters */
>  #define HV_SMCCC_FUNC_NUMBER	1
>  #define HV_FUNC_ID	ARM_SMCCC_CALL_VAL(			\
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 3de351e66ee8..56013dd0564c 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -35,6 +35,7 @@
>  #include <asm/exception.h>
>  #include <asm/smp_plat.h>
>  #include <asm/virt.h>
> +#include <asm/mshyperv.h>
>  
>  #include "irq-gic-common.h"
>  
> @@ -1456,8 +1457,24 @@ static void __init gic_smp_init(void)
>  		.fwnode		= gic_data.fwnode,
>  		.param_count	= 1,
>  	};
> +	/* Register all 8 non-secure SGIs */
> +	const int NR_SMP_SGIS = 8;
> +	int nr_sgis = NR_SMP_SGIS;
>  	int base_sgi;
>  
> +	/*
> +	 * Allocate one more SGI for use by Hyper-V. This is only needed when
> +	 * Linux is running in a parent partition. Hyper-V will use this interrupt
> +	 * to notify the parent partition of intercepts.
> +	 *
> +	 * When running on Hyper-V, it is okay to use SGIs 8-15. They're not reserved
> +	 * for secure firmware.
> +	 */
> +#if IS_ENABLED(CONFIG_HYPERV)
> +	if (hv_parent_partition())
> +		nr_sgis += 1;
> +#endif
> +

This is far too intrusive. Let's take Marc's feedback and work with the
hypervisor team to resolve this properly.

Wei

