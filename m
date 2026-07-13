Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11696C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aajWRHDOthkA/KlC0AepuzgzDYNF7pkxm830mYVcHJI=; b=3UAfE5lSaC7HBsrWVPa6Rct0Lx
	DNEhRHOP88Oz6Zicmm2e0h8JA66IS8GcDsRKVzJLYvwidxUZiysXA7RqoXC/yxTtn46FcJbUa6Zpd
	9w0fkGBxOncsiFWZBdu0dcfexXn6sxBWdhQbKZHyfsanZM2tc1+jH7aq03/OrvJG3rYd2uchNpor6
	Q0PPvWzNMnzzDzjNp7/yjfWLOGS+UPWznP6KoIwybAUEbJNI71DikUg0sBU+c29OmtFsSPkGEvFFw
	ciopM/79BTAurfTNaFdFb5f1I/VVzi4UTuJtI2wL0Z2h9otPxLQcf8EcEoS+iyLHFfkzdjKEhF3EF
	/yvUqUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBlK-00000008XVM-1VPm;
	Mon, 13 Jul 2026 08:11:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBlH-00000008XSz-0kHc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:11:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493b77b150aso23918125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 01:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783930293; x=1784535093; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aajWRHDOthkA/KlC0AepuzgzDYNF7pkxm830mYVcHJI=;
        b=js+UbJF8P0ujblVshwGvw4kQJlmuuAoMNsPOYLK0nzwvVzwrhSMtrMaYeTzB88LOin
         Ztmq+BwIEvfolcJU1Az5lNjPzKDOZekFBEU6pDPLYBZBmx4EFZIDJJH5lKqoDW+IEJOm
         gTOEarTHWAOvEKwe9wa9gqzgr8Q9CUU8QeXYFLaZv7paWQjCwb6sUy89aWR26+YPGvNz
         VIr5ImwUvhKat+KNtCIjCXQ49SA5Y0uLpXfm8DDc0kiQU5y+qSW604fujk8YQ8vy9aBW
         1DnJJhGEJgall93tHmWBfKpMdfHaAOHGnbTrYEYQ3A9GqsD0TGNbDTqrvegEurujjgkQ
         rFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930293; x=1784535093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aajWRHDOthkA/KlC0AepuzgzDYNF7pkxm830mYVcHJI=;
        b=PV8Lxop7ZPo5CRHxT17g1JVTQcglGUkIMVD4WUYq3NY2iBeT8lpnx+WpPmPw/6/eIg
         73+KPtW/7+7G0I8L7LlRII3RS7k+U2IZWTxZr/tBvpED6QDaa0iM4hgoURsMSoZGP3kW
         ZX1bIo5QC5VMesfBSzDLdrlc34WWIwZi/lHeNBcir+WAySvyvYU6vZrTuvZHGGIZUb75
         8G2CWK9sq95KJPifeO/U9KI24NB89SSxowSJejjh1vdFuOs4H4RhtFN9qUNv8+C7x9Zd
         aYzckjo4jkRrU8qITZikc6VXldO0cinWSdoHsKuuf7jwY1glGS2BRYKOtXmXfTAMkwIK
         J9xw==
X-Forwarded-Encrypted: i=1; AHgh+RoGvIs2y9rby2ETqDdajdnvNgIFFFHzOE1JyEVr6RE9Jdp6yFsgiKK+vsD4KVUaHfVba9vDQpTYK3pwM625SfLG@lists.infradead.org
X-Gm-Message-State: AOJu0YyzMqRrrbtoMMfwr0wAYPazEb10EBG5pOHi0OQYqwt0Ocp8Z5Fu
	mvRzN9XjwHVOoPK+/O+Sicveg+Ptusv9jjKNDdM4hNFo49c5012VBImrtiDWP3Qaow==
X-Gm-Gg: AfdE7clurSHEB+0ciBVQeTGV5kjYPBFgAUlwZaSyuT4Tmr4uZDGMOYkqWOdFQs6YSSv
	SUb6CyqllcTOMk5wq70ZOwyFoMd29FkOsBpL64s0qS29c+m18oysTsXuKPOdIITYxzVwt38Byog
	48DNKrA1dpXP6bVVaezXJZoHIZMt9QU6sJl50V0iRMaqug+noPvsO1fttWhKqF1FfjIdEEZDjNc
	7Ihix+U27YiegVcXI8n5Us6SUvuwGRDbkU0/aY2INUgijAfRhxYFkulvPtN56SgK5Sno1E2HuYy
	xWyOWMXtsvTS4FDGqV4yTznbwX4vzovisaaN1WbdWEIs+hYIGgd4yo/EuwLde1XmgVe8nRh80nC
	kELN78gQEfWFoeKcPmnAwaKHHljEUVqXumqeefjUe3vTW0aiomhMCSQd3rJsqpBO4poDcH7c9sd
	gADZZvzuDLbYTZBLEhpvX6kl+cIMdb3y0gm9LxRkuM58ZIETIptttGP5LRARZ8rg==
X-Received: by 2002:a05:600c:6387:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-493f87d89d2mr74807055e9.1.1783930292492;
        Mon, 13 Jul 2026 01:11:32 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2c8de2asm255552645e9.1.2026.07.13.01.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:11:31 -0700 (PDT)
Date: Mon, 13 Jul 2026 09:11:27 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Mostafa Saleh <smostafa@google.com>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH] KVM: arm64: Avoid naming collision in tracing
Message-ID: <alSdr9wNyyPiHmbt@google.com>
References: <20260712153835.2264905-1-smostafa@google.com>
 <CA+EHjTxN1fcBVRi+yK18UgReGsX8Evu1GsijSQC61dY3XrjCtw@mail.gmail.com>
 <alPox2BDk4Il0s9t@google.com>
 <CA+EHjTzvzcV8Cxw+VHK9Fxv7Y-7m84XbzUFU+4sXZXNrM8y7dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzvzcV8Cxw+VHK9Fxv7Y-7m84XbzUFU+4sXZXNrM8y7dw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_011135_259517_9DFC6B2C 
X-CRM114-Status: GOOD (  25.46  )
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

> >
> > > > I did not add Fixes tag as this is currently dormant and not breaking
> > > > anything.
> > > > ---
> > > >  arch/arm64/kvm/hyp/include/nvhe/clock.h | 8 ++++----
> > > >  arch/arm64/kvm/hyp/nvhe/clock.c         | 4 ++--
> > > >  arch/arm64/kvm/hyp/nvhe/trace.c         | 4 ++--
> > > >  3 files changed, 8 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > > index 9f429f5c0664..c2ccd0e8bf22 100644
> > > > --- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > > +++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > > @@ -6,11 +6,11 @@
> > > >  #include <asm/kvm_hyp.h>
> > > >
> > > >  #ifdef CONFIG_NVHE_EL2_TRACING
> > > > -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> > > > -u64 trace_clock(void);
> > > > +void hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> > > > +u64 hyp_trace_clock(void);
> > >
> > > hyp_trace_clock overlaps the host side: arch/arm64/kvm/hyp_trace.c
> > > already has a struct hyp_trace_clock and static helpers
> > > hyp_trace_clock_enable() / hyp_trace_clock_show() for the debugfs view
> > > of the same clock. No actual collision, so this is only a readability
> > > point, but a reader grepping hyp_trace_clock now gets two unrelated
> > > things. Maybe you'd want to consider a different name, but naming is
> > > hard :)

If we were to rename: the clock is a "hyp_clock" so probably trace_hyp_clock()
is the right thing here.

while the "hyp_trace_" is the prefix for hyp_trace.c file content.

Although I would like to see why we pull trace_clock() from the kernel into EL2.
That bit sounds wrong and if we have a way around perhaps that's better?

> >
> > Yes, that shouldn't be a problem,  I just added hyp_ prefix, but I
> > am ok with any suggestions!
> 
> Didn't I say naming is hard? :) How about, el2_? Not really happy with
> that either tbh... but can't think of a better one...
> 
> /fuad
> 
> >
> > Thanks,
> > Mostafa
> >
> > >
> > > Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> > > Tested-by: Fuad Tabba < fuad.tabba@linux.dev>
> > >
> > > Test: builds fine with the different config enables.
> > >
> > > Cheers,
> > > /fuad

