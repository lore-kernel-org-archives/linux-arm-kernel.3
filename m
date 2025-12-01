Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AED1D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 16:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9hMtV3PXrMhCjLem0M5KT+SZ8RXBResg7Pv80Fl+Ng=; b=V4fDLYXc8R+CxUPp9KQgZMRPzU
	//pdNRVnSi3KSW3Slo/mpetq2Y6jhgGbCqPzYgid55f6xXwfbsNes/iGtQq8Y513bWu5NFcUqretl
	3ofLsvv44x7XDR3XhtSgm/iFF6A77uMn8A0aWtUMGPpsNL5e9R/cDvPMKCbClahNcIR+Xh1YQhfCT
	8MHY2xVKmfm/2VGseaaGJuBpwTagE8+L96UxvlslytlWBVo2Vn5bIu1pVUHW+gj/3k4d+yJt3JYlo
	gFZnP0gRgWTk8wjOCoyfVYRmqSKQGXkJ50k8onDLr9IHIQx6xTRJZn1dQKuvdoM4jfWeXUybxW29K
	+W5v5Z2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6Nt-00000004EkG-0l1N;
	Mon, 01 Dec 2025 16:04:17 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6Nr-00000004Ejj-0Fay
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 16:04:16 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5959b2f3fc9so4235924e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 08:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764605052; x=1765209852; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b9hMtV3PXrMhCjLem0M5KT+SZ8RXBResg7Pv80Fl+Ng=;
        b=A8ky9KOE8YdjnjJOmq2cxyeOSRh5bXCoKYsVO7It6zug5ofuTFW0n4CZj1K+d6b/rV
         uRcEbuYw7wMGquv/yYHYhuCT0KnBRL6rjTERR1bbQzAKKAuztdsqVw6z6wMqHS9oP3MY
         6sqdxN2dtX9IRqBj+ONs+oMMPD38dpBkTucXCC9O8T6zf/yZuO84Taqy5+c3pMPovphA
         iknanTNM8DlrHptVvFs561gUsRv6vByFFUaP0U8KixxPeMv4xombG2yEQNzEanPgHqXh
         16+eIRCOlK+cUu/P4m5s/EChdl9/uQGkuDTU8BFIj7rH0dDL6CH8k97SeTd84YvW9pgQ
         F2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764605052; x=1765209852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9hMtV3PXrMhCjLem0M5KT+SZ8RXBResg7Pv80Fl+Ng=;
        b=YUdjE/59hzhZEq3LiMJb51ikxA9BhBml8IPgQvhAtYgidMKFli7TbWbq1WlFL40tW3
         idyUJKQplBP5TDhI8awL+HbTwpuTmXhtogwe3WYlknlQ7exnVUgXlC7+eP4EYO3rTbyM
         ZT/Ua5v34kBa9hdNA297Vxq1cL4OEurQikYmLnO5/AcEMu0WvIs5XGfwmTl17RzEKBEX
         fA6syIi7eEPOVEuvGuZxTmLkm9JkwNKwYllHXM4carmp0sWlgQ/m+AVyIbzPNlBMHhCO
         OnnEj4pYFF81jU9r+kwTms5F8oPx0kCj96M4VvsA4uKRTpwkVoYFRRczC75k3ojqYg8v
         MjtA==
X-Forwarded-Encrypted: i=1; AJvYcCWjdpm3ode9rDZidw5fHdIyMyL7IbbKPuxdj8kW2O91HCYBNiq5SDQplyXjeUkJYVtS0OylpaOeVkftKzLqsTmJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Eyq4bjY7WRY42h6XEd33lCeVFxf+8obT5Qln5pTqfj7inwDq
	jfi4IgUGUzU2ILFppvPeljXqGwyMt7lejjFM6/9eFAB4+eUvfA1eG/RBHvGePBSIvg==
X-Gm-Gg: ASbGncumO6XWpEk4TEHpxO1MoIHZGzCHJTjEB+b+wo0dbKYx/P9KAagdA2b+bku6p+o
	LHFT0LdZBICMS5OQ7/VOXfUZ2PMlifZn3w6WdbAd8AGEVvNsMkpBvletQzKb6iOBA8qx7lGv4zT
	SqndHsR/TvpmnyoWv0Ldp+46mNuTxN+7PPDPZW//vH++4gvJlzNxljpV4HeLPXjjZbyHfeuuW7b
	7CrVndfKYkrBDN6rG1sEWYnhrOySghfWF8ySU69A0eXpP4XSTINO/oWXVZyrGeAElhh+o0PmQ3L
	/95V7k014Xd4gOV6FYMAKKDQVyl8yRdTh6UlPwTcxI+MUEmzXUjJPaXEfZsRo23KPPFL/Bj2Z+Q
	WzTidqfeZwMc7Xftj5gHfuoKNnJuAW0qCROPg4p0qU7Z1OGJtpuQDHyRLjvr3zvo5kQpUgR6Ara
	e8nxJ1VNJI/3S8XvKvyexoWSieo9vG+21IghR5C8NnjLjrbw3OdA==
X-Google-Smtp-Source: AGHT+IGwL72Aeg7rfy2TscsPc6xQDUxQw9XmpdcK/OUqxD4opRrcqN2Rq5mq6/N45bshnzXhV6B/iw==
X-Received: by 2002:a05:6512:1595:b0:595:831d:22eb with SMTP id 2adb3069b0e04-596a3e9fda1mr14183062e87.1.1764605051684;
        Mon, 01 Dec 2025 08:04:11 -0800 (PST)
Received: from google.com (120.54.38.34.bc.googleusercontent.com. [34.38.54.120])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48c90sm3661068e87.80.2025.12.01.08.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:04:11 -0800 (PST)
Date: Mon, 1 Dec 2025 16:04:07 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 26/28] KVM: arm64: Add hyp_enter/hyp_exit events to
 pKVM hyp
Message-ID: <aS28dyrKgZaOmMNr@google.com>
References: <20251107093840.3779150-1-vdonnefort@google.com>
 <20251107093840.3779150-27-vdonnefort@google.com>
 <87345vfiqj.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87345vfiqj.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_080415_143225_FBF09BF1 
X-CRM114-Status: GOOD (  24.30  )
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

On Sun, Nov 30, 2025 at 07:00:52PM +0000, Marc Zyngier wrote:
> On Fri, 07 Nov 2025 09:38:38 +0000,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > The hyp_enter and hyp_exit events are logged by the hypervisor any time
> > it is entered and exited.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
> > index d6e033c96c52..ce3953bc884a 100644
> > --- a/arch/arm64/include/asm/kvm_hypevents.h
> > +++ b/arch/arm64/include/asm/kvm_hypevents.h
> > @@ -7,4 +7,21 @@
> >  #include <nvhe/trace.h>
> >  #endif
> >  
> > +HYP_EVENT(hyp_enter,
> > +	HE_PROTO(void),
> > +	HE_STRUCT(
> > +	),
> > +	HE_ASSIGN(
> > +	),
> > +	HE_PRINTK()
> > +);
> > +
> > +HYP_EVENT(hyp_exit,
> > +	HE_PROTO(void),
> > +	HE_STRUCT(
> > +	),
> > +	HE_ASSIGN(
> > +	),
> > +	HE_PRINTK()
> > +);
> >  #endif
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/arm-smccc.h b/arch/arm64/kvm/hyp/include/nvhe/arm-smccc.h
> > new file mode 100644
> > index 000000000000..4b69d33e4f2d
> > --- /dev/null
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/arm-smccc.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#include <asm/kvm_hypevents.h>
> > +
> > +#include <linux/arm-smccc.h>
> > +
> > +#undef arm_smccc_1_1_smc
> > +#define arm_smccc_1_1_smc(...)					\
> > +	do {							\
> > +		trace_hyp_exit();				\
> > +		__arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__);	\
> > +		trace_hyp_enter();				\
> > +	} while (0)
> 
> Huh. No, please. Don't override existing kernel constructs behind
> everybody's back. I know that tracing folks love to play that sort of
> game, but I really don't want any of that here.

And you haven't seen what I had for arm_smccc_1_2_smc()

> 
> Just define a wrapper that is KVM-specific, and use that.
> 
> Then from a semantic perspective, an SMC call, an ERET back to EL1
> host, and an ERET back to EL1 guest are all very different events that
> you lump under the "exit" category. That's not right. Same thing for
> "enter".

The idea of those events is just to know when we enter and exit the hypervisor,
purely from a timing point of view. In ACK, we already have other separated
events that can give the "cause" for entering or exiting the hypervisor. I
haven't added them to that series because I thought it was big enough.

So happy to add now or do a follow-up, once we're done with that one?

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Jazz isn't dead. It just smells funny.

