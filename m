Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3198710AB82E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 23:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jv9aN6G6rns4dN5LD+yA48hndk4jnLP3GApNEZEmMg=; b=kFLhekDOcAQzuxV2AifoDTelZd
	xt1eQ9xWFIR10axKKZFyBTHQDRIS3S84qIVI6J6Ih5DPVKTcgNLkmMXseAbB0SxaYGMc7fn35cF4v
	/uf5u/VnTCLQu45DRYjxsUBOJGXc87rOl0VrBYxw+BbbK7DfvkGpHKsposstBZzFFr0vc9g7JOF0R
	n/bQphx00INiAdTkF67SgjXah3PUk9dtfG2pZOVYjdQtowzpc5NJBB7qiWk1veYMmJe89LLaJ065N
	/0z1yVWs9kd4V2YHVUO7gOCmLcu0hoLUj6oh1W081ySaIcNdWRtEqC6PLya6TXVc9R8xVVSJTbKgm
	/APQj8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tib-00000006MEq-2SZc;
	Thu, 26 Mar 2026 23:02:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tiW-00000006MEF-20FQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 23:02:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso11773745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 16:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774566138; x=1775170938; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/jv9aN6G6rns4dN5LD+yA48hndk4jnLP3GApNEZEmMg=;
        b=gZHtv3vwzXs2U/pRqUjbhKvqfKiTLXM64vrGYIqJOLshOo9fmGfEgme6GwcnKhRIsp
         9K0wl9gqYhbUVu9MBTQdh2iONZB5RLvkNJ5rjwX8v9FgrZ1I6agb9DWiX3Adh7CrZ5q/
         VroNqTSBdA470qNp/k3QOzOomScz8zD1txlu6YTxktEDNsDHn8cQyoWsaIU+3Z2sbuR5
         AvS8w63wMklx+EajZ8uwtIDluaMUaSQle6FY9HKyqVq1t7NnSiiARqxrHT0mETomTPSE
         VOdatyE3xFagD0r71/0AtdYK1CSaHyaGDuwmyfEUG6McEAB/Cnv+RjWgHXA5+P2EqgZ3
         RKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774566138; x=1775170938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jv9aN6G6rns4dN5LD+yA48hndk4jnLP3GApNEZEmMg=;
        b=r1KKJY6gFuZQEDdxl3hxntYygTKfDKNu6Lykd2YaApxzpIq6mRz9pAHh7Lj2Ta+4L5
         pTGpLz2mfwEucz5KPzR5tVMsvinV5jSKfgt5aQppLO5OD52YmI1LdDO5zhfIOkJpLdcX
         Saf4jVjHn0MbWkgbDMMoRTu+QPwb3Nr0w41VKkSiJJIkMUU6pOHW4iFSc+Gx4LdVDdas
         ur9h22Vd8Th4za2s9J9JlR4H5Un0B4MR3oGm6IOXMuv9DA9E4K2UDyZuRurBB3QW9knj
         9P5estFkQ5dO/Vw0RPBs7AAWCPRVRIuzrtIIHme8krWttAziEUMX91+c3S8EmYG7gew+
         3kqw==
X-Forwarded-Encrypted: i=1; AJvYcCVUn6xKzavfrwq2sWfFQ7nh9l6hXK7ueZtneLcU09uOJi4KNi9kTSgta3DLID3qPkbsNp/N+L/vxKp4lV4m37M1@lists.infradead.org
X-Gm-Message-State: AOJu0YyPKgKbHYlOVHybL8McYVV+bz4a7LI/LGcJJpkl79qj7/eR0UTc
	/xIfE6PI5IgsucIN5CJS9T+COnarAIRG06eo8SqthUvX2d+i7ZO7yD4U
X-Gm-Gg: ATEYQzy5t6gOzkkxBQZkDe3lvpDg35ZHVVDPnrA+Klxu7nqF8aeNLUImTehyCDGFsOJ
	WSdxvtKifgHIT9PZaPfH4gkQRPgQumIeD2j5lgVdyUXa/z8WO4cq5/ndMqlK1WX6t3TWw1QHH5C
	wHhxa+I9PA/CTWFOIQOcIF4ZmdHVHiJ52mokC7MKnaAx9d6wJS1AkyWgJBFPW7vADnY77Ixs1r5
	xajUlZBUqGi1rikQhxE1S45Gvc88vIvcVXBYtC/X7Vw27FEDWrIbd8Ap95JNiqVsNlFPRA1fuAJ
	DtbdZafpHO9zwohOVGYv0fSOSb/l6Tm6iwxQRmYnb+5AA4OmNjMmZtEOP/rNfYVFI1xP2m7e7sd
	Ot8po3DcRp2q4sV5iHelbYVAXhR8WEEnQCzJ6l8PDBwWrGI4CocPIofaxPfOKMHDEC+TUA+aQlG
	IBij9dn6i9Dh5C1OMsNh1iFrS16JDNExYVaBJNY1qr9pet4bSzokYSPk2OWA==
X-Received: by 2002:a05:600c:c490:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-48727e908e7mr6423875e9.10.1774566138214;
        Thu, 26 Mar 2026 16:02:18 -0700 (PDT)
Received: from osama ([2a02:908:1b6:8980:8cd6:6329:c43d:2fcb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm11024636f8f.30.2026.03.26.16.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 16:02:16 -0700 (PDT)
Date: Fri, 27 Mar 2026 00:02:14 +0100
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: panic if IRQ shadow call stack allocation fails
Message-ID: <acW69iCN8l2clhc-@osama>
References: <20260324161545.5441-1-osama.abdelkader@gmail.com>
 <acOhjkLqf2gsM-Sf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acOhjkLqf2gsM-Sf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_160222_545049_773302BC 
X-CRM114-Status: GOOD (  29.24  )
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

On Wed, Mar 25, 2026 at 01:54:32AM -0700, Breno Leitao wrote:
> On Tue, Mar 24, 2026 at 05:15:41PM +0100, Osama Abdelkader wrote:
> > scs_alloc() can return NULL when vmalloc fails. init_irq_scs() previously
> > stored that NULL in per-cpu irq_shadow_call_stack_ptr, which IRQ entry
> > would then use under CONFIG_SHADOW_CALL_STACK. Match other SCS setup paths
> > (e.g. SDEI) by failing explicitly instead of continuing with a NULL
> > pointer.
> 
> Right,  _init_sdei_scs() doesn't not assign the per cpu pointer with
> NULL, but, at the same time it doesn't panic. SDEI propagates -ENOMEM
> back up the call chain and even frees already allocated stacks via
> free_sdei_scs(). Should it panic as well?
>

Thanks, I changed it to return -ENOMEM in v2 to address will's review.
 
> > Mark init_irq_scs() __init since it is only called from init_IRQ().
> > 
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> > ---
> >  arch/arm64/kernel/irq.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
> > index 15dedb385b9e..b32ed7ef8e00 100644
> > --- a/arch/arm64/kernel/irq.c
> > +++ b/arch/arm64/kernel/irq.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/init.h>
> >  #include <linux/irq.h>
> >  #include <linux/irqchip.h>
> > +#include <linux/kernel.h>
> 
> Why do you need kernel.h in here? I initially thought it was
> for panic(), but, later I found panic() is already in use in this file.
> 
> Isn't kernel.h being included transitively?

Right, I removed it in v2, thanks.

> >  #include <linux/kprobes.h>
> >  #include <linux/memory.h>
> >  #include <linux/scs.h>
> > @@ -32,23 +33,26 @@ DEFINE_PER_CPU(struct nmi_ctx, nmi_contexts);
> >  
> >  DEFINE_PER_CPU(unsigned long *, irq_stack_ptr);
> >  
> > -
> >  DECLARE_PER_CPU(unsigned long *, irq_shadow_call_stack_ptr);
> >  
> >  #ifdef CONFIG_SHADOW_CALL_STACK
> >  DEFINE_PER_CPU(unsigned long *, irq_shadow_call_stack_ptr);
> >  #endif
> >  
> > -static void init_irq_scs(void)
> > +static void __init init_irq_scs(void)
> >  {
> >  	int cpu;
> > +	void *s;
> >  
> >  	if (!scs_is_enabled())
> >  		return;
> >  
> > -	for_each_possible_cpu(cpu)
> > -		per_cpu(irq_shadow_call_stack_ptr, cpu) =
> > -			scs_alloc(early_cpu_to_node(cpu));
> > +	for_each_possible_cpu(cpu) {
> > +		s = scs_alloc(early_cpu_to_node(cpu));
> > +		if (!s)
> > +			panic("irq: Failed to allocate shadow call stack\n");
> > +		per_cpu(irq_shadow_call_stack_ptr, cpu) = s;
> > +	}
> >  }
> 
> Reading RISC-V code, it seems it has the same problem. Is it worth fixing also?
> 
>  static void init_irq_scs(void)
>   {
>           int cpu;
> 
>           if (!scs_is_enabled())
>                   return;
> 
>           for_each_possible_cpu(cpu)
>                   per_cpu(irq_shadow_call_stack_ptr, cpu) =
>                           scs_alloc(cpu_to_node(cpu));
>   }

Yes, thanks for the check.

> 
> Other than these nits, feel free to add:
> 
> Reviewed-by: Breno Leitao <leitao@debian.org>

Thank you. I sent v2:
[PATCH v2] arm64: panic from init_IRQ if IRQ handler stacks cannot be
 allocated

To cover init_irq_stacks as well.

Best regards,
Osama

