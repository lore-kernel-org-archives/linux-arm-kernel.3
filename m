Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992AD10AB82E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/TN6HvQ+xTPSDaAAvSPHxdODsPl8D/3Jbr6LOu1F6E=; b=4DeUxOWpyY8FrinRSChFiQN2y8
	jOPRzkMctczS5OrGxEqPgEFMAPD1sS9ZHWPQPZ8dDtlkFLP2LcbbA7QmdAzRYHMBBDqQEfQGFIEnE
	2aXryAPocYBqg7Etq0M3qR/6qYAyN5BGe5UFp9Ozw80O4/gm9L8npdyv/EvmN3BNNIMjWIs3ymTKh
	MV47Zr1yIHfY0jyFFweYV4YI4gUHdSOPjOGc/CnteiFuBzxaQ6jwwh0/ss/0NGPRT4jDW6NFsBe/8
	jvxSg+iVv09JfpibArS4jgLMPtJsjDE5ln7RmV8JfKXMgcvvxen4Gzq3cT3DV1R/uxgGUcudgq04q
	/fByiOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tjn-00000006MMa-04Xp;
	Thu, 26 Mar 2026 23:03:39 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tjk-00000006MLr-07Qm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 23:03:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so13325045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 16:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774566214; x=1775171014; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R/TN6HvQ+xTPSDaAAvSPHxdODsPl8D/3Jbr6LOu1F6E=;
        b=BVm/R1lDGzuZBlP2u1dQ/1QOmehMu+ebpdK6y5+jbaDYCfZLAiiaAZV/juJeGQLb/i
         xQj1ahXSDywnib10atKt2C/eUpgs6LXnWGBYcV8opcI95xaDqe5ActgOvneVw7Hr6VFT
         52pDsfZxwd+YJO2h7ONwVzIdO8MMrz9nUD0uNIs9b5PtKbOWWIIYBir9VVPtWY2SF2cD
         qgCtRlTPSK9UK39eUmH8ONCEBcp4EFjmb6kL/C8ckQAtS+FfAp3/wFniJJYZZyogF5Ic
         SikDEwt+LV2a/wzAPT724kDkRtkTNAZQIc/Ye21IPlB+pY+LXJJM/at32VuZKXfKYi6S
         bD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774566214; x=1775171014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/TN6HvQ+xTPSDaAAvSPHxdODsPl8D/3Jbr6LOu1F6E=;
        b=JrCWSz85fG7eW6vxN0/psiFDvBl/Y317NB81tfVG//BAJ1JbwmDazSH4fccxdXoo9l
         QahLvgZhP2+W5OMSVRfj+BFlYIBjo299U4K57UE2MCmZNuZpTEOWbp80uw79tITq1kxD
         kKGmf6+HNghCfsbG8jeToVR1jjfU2944nqhE1efHHJtMr/KwGNWOlDJktLvANEHdOpc/
         ZQ1fA20HswVOepdKtwjGeCmdFY+b2j82PImc1DMEPYlKFLpjQsSTuqT5memxDYJ8Jz/0
         oYuiXS6NeN2CUdbcny3V+KpCrOnaPCBAQtDG+eBsrH6oTaU86aIw9bpaahjHazBJWMMX
         omsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/PqWpVahLwZm4dXNngqnrovAfYqvh5+TMexLtYj9S6ZpK6DZn1tSxVDeJ+a9l/FRnyfRXGTYbaj+FFWpDSEJO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgosurec1DvNyzMEdh7SRsCgOFPiBHEQRdZiFXiyMHPOw9zNS5
	gLcQGeLL4lUeDTy7vH4RHg0mMSSaMAKid8twoYvsmnN/2U324wblbV06
X-Gm-Gg: ATEYQzxpYF4WHG97R4vpy36lDdloEnScU951oWo1nOKdil9hgZpK+K3RRy+tLRVNr70
	fAtF/bt9EpvtVfcyZ8Eypnl3qXTk56XbwyhsmDdoN49x8nqDP9T96WcNh4LMaOjP0HA4mLJ8rBi
	bXEvQG0Cbci0nxQsWC5DfU/2eBfnrvNRjX+diuX0h4jeRo5mTqxhsEmmXFmJslQ2jW1yNdPdXg9
	zk+ZgRl9kxZu/4VEYznmiDdk09rSaY4FelPvUAT3o5OWh+ZEKve/QIsqZ16cJVOMJd9SHkIvrxu
	/YD7mzUXiEU3oCGPst368Ak8xwUKfm+18LGdydKpyUQK+kf7363qowE+tgaEUHzE7iga8MA9OzC
	fuGIFxot3Qz4/pZtYk7QR2hoDk3EZRGy1ZhjQI6ynidVyT5jSqQguewnCdBikzvkt1GO14m1c+M
	vnHx+ApalphC3i574+hUk6rGW9Zw09xp3v9G5X7lpFTPPUmue7DkBZzyssacRQecsu/TKt
X-Received: by 2002:a05:600c:45cd:b0:486:fbc4:8fe2 with SMTP id 5b1f17b1804b1-4872912dd2bmr1429515e9.15.1774566213812;
        Thu, 26 Mar 2026 16:03:33 -0700 (PDT)
Received: from osama ([2a02:908:1b6:8980:8cd6:6329:c43d:2fcb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727161bb2sm3519395e9.23.2026.03.26.16.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 16:03:32 -0700 (PDT)
Date: Fri, 27 Mar 2026 00:03:30 +0100
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, Breno Leitao <leitao@debian.org>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: panic if IRQ shadow call stack allocation fails
Message-ID: <acW7QqjoF_e0Fdxl@osama>
References: <20260324161545.5441-1-osama.abdelkader@gmail.com>
 <acQO16dmw0v6pzu8@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acQO16dmw0v6pzu8@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_160336_083930_C76C0E6B 
X-CRM114-Status: GOOD (  22.02  )
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

On Wed, Mar 25, 2026 at 04:35:35PM +0000, Will Deacon wrote:
> On Tue, Mar 24, 2026 at 05:15:41PM +0100, Osama Abdelkader wrote:
> > diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
> > index 15dedb385b9e..b32ed7ef8e00 100644
> > --- a/arch/arm64/kernel/irq.c
> > +++ b/arch/arm64/kernel/irq.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/init.h>
> >  #include <linux/irq.h>
> >  #include <linux/irqchip.h>
> > +#include <linux/kernel.h>
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
> 
> I don't especially see the point in these panic() messages given that
> presumably all sorts of other things will go wrong if we fail simple
> allocations this early during boot.
> 
> If you really want to check this, then we should at least do the same
> for the IRQ stack itself, otherwise it's all a bit academic. So maybe
> have init_irq_scs() and init_irq_stacks() return -ENOMEM so that
> init_IRQ() can panic?
> 
> Will

Thanks for the review, I just did that in v2:
[PATCH v2] arm64: panic from init_IRQ if IRQ handler stacks cannot be
 allocated

Best regards,
Osama

