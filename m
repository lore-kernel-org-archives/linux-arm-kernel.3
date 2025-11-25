Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2579FD0E6C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 11:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GHs616mr7dTyieWIVUhqR8ZeVc35qwPIJKCi+VXq9s=; b=gzE7KlQVztMi1mdzbtvQnRYJxU
	43MpjAsL6eyDrSB1W1FsaO829hhTvvwSIHXIHn+l94lO9fS8LbQb+BIK/AdVweFOfSrSKdcPWdY2N
	ENhsaIZXrJcuK+ViCS2Tnu6WYiNgpWqgQZ7QYJY5emU+QAaovQxLXbU+6TBT15C0XpWP9N9i9FMkx
	qq++yZBAy2ltV5GKCXtvk7Z//5iRe1a73HFKU57Z/bxqRk4sR43Lfqjy5RY5C7XCLGQRHMd5VicNN
	Swm1TjMj3KNfR3OdpDGARuJd1czgftRn2/coVpDgSCDAdzbcx4ZCpHdT5QpzeycSG1QBGyVUUlUlL
	7dmNXiRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNr82-0000000DD2s-1RQR;
	Tue, 25 Nov 2025 11:22:38 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNr7z-0000000DD25-1gLf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 11:22:36 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42b2dc17965so5088647f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 03:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764069753; x=1764674553; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/GHs616mr7dTyieWIVUhqR8ZeVc35qwPIJKCi+VXq9s=;
        b=thV6y0tTGxCv0KPLVa8wxo6x71EsfzoBM54Qqy4JEDR0ontXQRP325FlNqufQBgVl0
         6oEhdoIsTBdcG7KOVR0jh9ALrTOfTso0FR3H8FnMyDGgu/OGFVUAbUc6rzG4PFn00OEk
         pkqUAnQJ8n9KG/OrLKnory+AqNkylTf3qlfRrxaar6dbbywvVJWlqVe+7v6fpUIzkYK5
         gw/wuj3Aewnn6utp8c07SB14WC/ykWygbVZOa2iV+bksFWwmBfGn63no23LInO9Krmjz
         NPvBp6jOSW/u2Xn54Zk+5QigtZODJiQj9MRcvNkw7lENnwzOsl6xy94eveWtii4YVpzR
         9jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764069753; x=1764674553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GHs616mr7dTyieWIVUhqR8ZeVc35qwPIJKCi+VXq9s=;
        b=loOLpKwnfhbJ/DyvjiP7o8K+LeGpdBEjrn085TAycBIt3Y1Lk5OdtL+VOxSD6oARYF
         dIjvGBC0LsjwX7kEB2c0UJtb8sNsPs7Giqv2Imua2W5xeA+ao6hgj2ZwrWcGdaXoIgOt
         vxb063ZKh7Qhr7k0T1+QO7WXy6qXdBgZfQeo4s5EXzVtZO+hdVs4jIf8ye3cmwqKOWe6
         rrV663I3MqO0izqs1g5r3Vh0OoQy4WDql/A7zsoGJlbI0o0csRVfEcbH/Xt4jt2aqkoX
         TKXaXcrOcv9eFvyVH9qQo4N3f7Htgosba7zW8GcT1OMxDh+c7xHfh2C6q62IUae5OOzB
         D+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUbXkxRkxgt575KbFR1Wk5OnnCVsiISUHQuSiifVYqHKGb49dmGTpYd3EfvVzuAIKsBYpTxjJczjvy875eJCtDj@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ1QLLy4GFGnJqWighlu4eRzXHMMDPf+NsljbH0qE1j54kbn/e
	n0Mk7pAReZXyzSUxUmSijU+DyOk6BRyNEBGiEp7kWr/S0mJkLAhiv9b8bsg8KH3/vg==
X-Gm-Gg: ASbGncsKnEAaoFkfs1yBnqhnmKFI4g7B1yeSkzRprZM7d2ozOwwUg315e6PxjVhcISo
	i5JwGOMofviJeph9NdUSzYXdPuIApQc39PF90Ec98uSVyUkbsDQz3n5viBBLAESpyiyEK5cccko
	TaXTOM8fZD4qDgalQNWCqtJ4XXFoW1wkmWBEwTyDdeRJPKkUYXcCCTMUYa15NA91CcHGbq4sRoB
	wqkazIzhuX3od8mnaOKTuhS7Co3KgTMIMlUhvlp/WJxw9ThW8bHexQ2N8GKFXFsckxYKJ/HNrGg
	e6no6asxyP5Ivnp2AHWK8/+1ePHwgQWOuBJq5o59JFLrCYbVeANA+gJjdb0RlSKz7VeuJRo1Zcb
	Su0DQvYHtu3dbDZggdkquuwnB4mI+zOiSgJT1nGeR8Wb+ggMlUjLQphOks2uwkF1DoxsjAim6Dy
	0hUeI5/PXkfNuLYNZR35HuP4vJd1nqdCUs2uo+ttQRhx7d3E3qsw==
X-Google-Smtp-Source: AGHT+IGTMkYeA9p+ckKB04IyPeZJ4YUR/HSDsAZGnoL2ifU24s5TxikwdtgZkZDiTjUCKMsk8yADHg==
X-Received: by 2002:a5d:5f94:0:b0:42b:3b55:8917 with SMTP id ffacd0b85a97d-42cc1d0cd7dmr15814872f8f.36.1764069752552;
        Tue, 25 Nov 2025 03:22:32 -0800 (PST)
Received: from google.com (120.54.38.34.bc.googleusercontent.com. [34.38.54.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e598sm33172639f8f.4.2025.11.25.03.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 03:22:32 -0800 (PST)
Date: Tue, 25 Nov 2025 11:22:29 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 21/28] KVM: arm64: Add tracing capability for the pKVM
 hyp
Message-ID: <aSWRdSELuYpAXCM8@google.com>
References: <20251107093840.3779150-1-vdonnefort@google.com>
 <20251107093840.3779150-22-vdonnefort@google.com>
 <86bjkyrly9.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjkyrly9.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_032235_472752_4D8940E4 
X-CRM114-Status: GOOD (  13.59  )
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

[...]

> > diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> > index f55a9a17d38f..504c3b9caef8 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> > +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> > @@ -29,7 +29,7 @@ hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
> >  	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
> >  hyp-obj-y += ../../../kernel/smccc-call.o
> >  hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
> > -hyp-obj-$(CONFIG_PKVM_TRACING) += clock.o
> > +hyp-obj-$(CONFIG_PKVM_TRACING) += clock.o trace.o ../../../../../kernel/trace/simple_ring_buffer.o
> 
> Can we get something less awful here? Surely there is a way to get an
> absolute path from the kbuild infrastructure? $(objtree) springs to
> mind...

Because of the path substitution below, I can't simply use $(objtree) here. I
suppose that's why all other paths above are relative.

However, I could probably simplify by including simple_ring_buffer.c into trace.c:

  diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
  -hyp-obj-$(CONFIG_TRACING) += clock.o trace.o ../../../../../kernel/trace/simple_ring_buffer.o
  +hyp-obj-$(CONFIG_TRACING) += clock.o trace.o
   hyp-obj-y += $(lib-objs)
   
  +# Path to simple_ring_buffer.c
  +CFLAGS_trace.nvhe.o += -I$(objtree)/kernel/trace/
  +
  
  
  diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
  -#include <linux/simple_ring_buffer.h>
  +#include "simple_ring_buffer.c"

> 
> >  hyp-obj-y += $(lib-objs)
> >  
> >  ##
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c

[...]

