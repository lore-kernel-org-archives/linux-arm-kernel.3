Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E35C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4+qE4ZoohVYF/j3isYgupSr93BAAzyHcaf7DgfjxBs=; b=joizUCblDTs2uVgxVYIhlNep+J
	mK13BAfR5guP5ntIbYqyKJaWrJhPq80ZupfcYK2czoSUTMUPgeS2D2dIpWCvBET5SSTlJJuu8B8Uq
	NwQhtfGRr4ufY3v/OMs3gmvyKrmrV81wPm90xtMfpm9SG9kYx/lZxtAkvCTZ1ZrVuA2zZxuUgj/q0
	8goj8tDZ0Iw0vwp0bKRUgSDqbX8W+ZBclOXlXql+mcm2E42i6TDtyBDR2+fS9hogrdj+4wv3tYR9p
	Vd0I18LSfOrt4sqtN+2ayKtpBuIgrc87lCZht+oNEg9Lqzk6atTn+XtsIdqwuuIwWztHSW+o/s4Tj
	quTVsnKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmadj-0000000CRdP-2824;
	Wed, 22 Jul 2026 17:21:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmadh-0000000CRcx-3Gvp;
	Wed, 22 Jul 2026 17:21:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FC3960051;
	Wed, 22 Jul 2026 17:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30691F000E9;
	Wed, 22 Jul 2026 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784740907;
	bh=n4+qE4ZoohVYF/j3isYgupSr93BAAzyHcaf7DgfjxBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AHXpKMkO2HaiOLjQtij21gEqEeLylpNpBFJ5KyxuzWUbJsESp3qJ+AGg5XBVCzzcS
	 CiLE8BAwjLbx4FNVDfE8IM1EQDFTS6VUv9AZSAlBoYae6xUcLLpZX0oUGpSmSpW/BN
	 kxLInKY8s8iYTEqmEWlZDMBiWUMgbU6TawTUpKkEHJsJ8lSR0w4uo4yD7J9N9T7O8r
	 nqg7isqUOL3kWu8OgnEN7EW1X42MVptnquDBqHtLfa+J+zXv/8Hn+EJjIIqfw0DGE/
	 bMzHj40KOtPobKR5ISocxtNdU6XGTwGpvQzJnFyiXit1GzhhJkjMcrrRiluIqzfyUe
	 4+Yn7UsdVn5nw==
Date: Wed, 22 Jul 2026 10:21:40 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Subject: Re: [PATCH v3 1/7] kbuild: support generated asm-headers in
 subdirectories
Message-ID: <20260722172140.GA2947455@ax162>
References: <20260722-vdso-arch-clockmodes-v3-0-4c5753191cc4@linutronix.de>
 <20260722-vdso-arch-clockmodes-v3-1-4c5753191cc4@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722-vdso-arch-clockmodes-v3-1-4c5753191cc4@linutronix.de>
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

On Wed, Jul 22, 2026 at 09:53:27AM +0200, Thomas Weiﬂschuh wrote:
> Extend the asm-header stub generation to also handle subdirectories.
> An upcoming vdso/ header refactoring requires this.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  scripts/Makefile.asm-headers | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/Makefile.asm-headers b/scripts/Makefile.asm-headers
> index 8a4856e74180..772b53ffdeb4 100644
> --- a/scripts/Makefile.asm-headers
> +++ b/scripts/Makefile.asm-headers
> @@ -48,14 +48,13 @@ syscall-y   := $(addprefix $(obj)/, $(syscall-y))
>  generated-y := $(addprefix $(obj)/, $(generated-y))
>  
>  # Remove stale wrappers when the corresponding files are removed from generic-y
> -old-headers := $(wildcard $(obj)/*.h)
> +old-headers := $(shell test -d $(obj) && find $(obj) -name *.h)
>  unwanted    := $(filter-out $(generic-y) $(generated-y) $(syscall-y),$(old-headers))
>  
> -quiet_cmd_wrap = WRAP    $@
> -      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
> +filechk_wrap = echo "\#include <asm-generic/$*.h>"
>  
>  quiet_cmd_remove = REMOVE  $(unwanted)
> -      cmd_remove = rm -f $(unwanted)
> +      cmd_remove = rm -f $(unwanted); find $(obj) -type -d -empty -delete

There appears to be a stray '-' in the find command ('-type -d' instead
of '-type d').

>  
>  quiet_cmd_syshdr = SYSHDR  $@
>        cmd_syshdr = $(CONFIG_SHELL) $(syshdr) \
> @@ -74,8 +73,8 @@ all: $(generic-y) $(syscall-y)
>  	$(if $(unwanted),$(call cmd,remove))
>  	@:
>  
> -$(obj)/%.h: $(srctree)/$(generic)/%.h
> -	$(call cmd,wrap)
> +$(obj)/%.h: $(srctree)/$(generic)/%.h FORCE
> +	$(call filechk,wrap)
>  
>  $(obj)/unistd_%.h: $(syscalltbl) $(syshdr) FORCE
>  	$(call if_changed,syshdr)
> 
> -- 
> 2.55.0

-- 
Cheers,
Nathan

