Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05D5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyY6y6D9mzZJEerW/Rbo/gzzpD8ruopg3Z6AtyKjKbs=; b=UyF6mDuEyQM8HbXzQFs27CF9F8
	SOUE3FC/77pQgDKaYRHwAxMUb5DeJVa8ExJSvFwmqetllEoKXQEesjUsRtvlvuZgaiAO6iHZD9K90
	Fhinv86zkMGR2C6b/R0EpUOFwSp+GidSbdQM7GQQn9nPMYlC5G8bRlF5zFuj9Wx+P9Mj2XYauWp9I
	blJ8lr0QQliHBbVyN3NajdoCeEnHkJyzQuuo+wfX/fLQaGKccsv/xZuhwyOCoKyqX7/e+L2FVnBuG
	AmXxzpS20agCwahOxh0OwPdQuCpIXfX/qG2RBrOF6Yjf56K1WdE5Y8hGKbn/4owg7Un0iMrGfNeJU
	bo9Wzcsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCDr-00000008ceR-1CZs;
	Mon, 13 Jul 2026 08:41:07 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCDp-00000008cdu-2mii
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:41:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493c556ada3so81215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 01:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783932063; x=1784536863; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyY6y6D9mzZJEerW/Rbo/gzzpD8ruopg3Z6AtyKjKbs=;
        b=M9EX1u0jd+ePA5AXIbDHk/Gi/zEzWYOzUkkhddrXd9yJjXJhGE7MxCP51v2z2KtpBw
         OJsnShaky1RE6d9WbosceW6WqzH8DBa1upSZjZO6ad+LnyOygJPOx2d3R4HqGW9GM8JX
         JfAh20yHEH49qitWWBJ2sUkIaYDm+0nQmlfbBGSq0923cjxK81n5JSrvUr+Wk5+lunD7
         vXBjPwxEisCS4aJRakQuGwTQk/HpcLFtZFpJpv0ezmj0wHa99SgnNhPlfVpCrIe2aRVX
         /AnVmV+pj8lwJB8ZkaDPmyRFGiF6vIFzFalKZ4pHKKQI1UrmehCZcfdLM+f0QzuIYsUo
         Z9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783932063; x=1784536863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyY6y6D9mzZJEerW/Rbo/gzzpD8ruopg3Z6AtyKjKbs=;
        b=h8vQKIbp/Mykj/ZuDrkUFvLhmS0hOnpuJl4cD3nk5ARTLlyrvJVomgP332UB0TTMJw
         x1yk7lXfMf56DcLT3ngeLwMqfm9nRnrcK7H/CUCzCNcVjeAQRTU5+H4ITAhbpy785irw
         QlDUZwHGYP8pHP+Ejn052hVFKdy99J6tz7EcnA9bqmSNmSCArsS7XKJ/KP0l79IIgH8x
         Q12N/d5tAvhzPPjS2CRs2HNmzO2cCWuDfmPYdguzfhhsOsz2x72RgR4lqzAlHYkBppbc
         mMVzvnT555rUgnttz2gTmmXsr/LQKVLBPAqyFboud8R/9kEGGx+1qeO+hMdw0sgnx6cz
         6Oow==
X-Forwarded-Encrypted: i=1; AHgh+Rr2iq1vN7vutHCQ0Eqs6HXaObbZzy//0Xd5i/u0n1MboTDBRPon1XS0QKBPExQygdIwKEEaFW2Noaluazz9ElL+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/kG7+Numylm/GiGfUJ4CA2FhgnQN/0ZKIanh3wTXHMo5My2Jr
	ZZHlCN82zgddQLunlxC1uFp7x0SW035h2DIralrztHKJeivUgiipYEmLvB/k/ZC2qA==
X-Gm-Gg: AfdE7cl+vBt5UgTxj55q4l7Rx8x7IMlCDo2A8GU9BTP1kd1CjK0730S2/fD42IpJGUw
	Bv6qssjAAQ4cX5mjVNqqfqVvHE35XZP5COFkcqVu5fq3TgjxuIWrLIpzJ8ZoyRSl+eh64btkKh5
	xlUpyiIbpIcFgmwHQaEcuYf5YyiI35ZF6JShpYdc7mDA9M2q7Y/i4uqzBO/BrP8dfLyS/AmYpyY
	1aLF6/bYcXUfd9gACTjDL/vKP77Bue/z6la49zVaOu2INVc7sYPLoJlYe8d31Hp7g2AiqNCtB8w
	dNRdXbPvUZTI3xX0ZXW2+fBTMVaY2EAJF3oePc02JHIbQ5AXph4UtrXXB0J+5+cLz1l12TDd1XQ
	kAP7jlD6HXcIE4fNY9TRY3b5MC8QBteNRyrzQGzb63NwKLLCJZPvWSkkvg3lbx08SrimrrloPfk
	1pItjHgup0BIOA+lmyO8Ps1GOMGWiXg8EcalGucav/d2hcBSvA
X-Received: by 2002:a05:600c:6092:b0:490:b3cd:fc4d with SMTP id 5b1f17b1804b1-4946216ff53mr65255e9.9.1783932062990;
        Mon, 13 Jul 2026 01:41:02 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f16cfsm349445955e9.12.2026.07.13.01.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:41:01 -0700 (PDT)
Date: Mon, 13 Jul 2026 08:40:58 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH] KVM: arm64: Avoid naming collision in tracing
Message-ID: <alSkmhpjNCYFnUmO@google.com>
References: <20260712153835.2264905-1-smostafa@google.com>
 <CA+EHjTxN1fcBVRi+yK18UgReGsX8Evu1GsijSQC61dY3XrjCtw@mail.gmail.com>
 <alPox2BDk4Il0s9t@google.com>
 <CA+EHjTzvzcV8Cxw+VHK9Fxv7Y-7m84XbzUFU+4sXZXNrM8y7dw@mail.gmail.com>
 <alSdr9wNyyPiHmbt@google.com>
 <alShO27MLsNqgBws@google.com>
 <alSjGAqmB7HX1jYB@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alSjGAqmB7HX1jYB@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_014105_742303_EEC2B624 
X-CRM114-Status: GOOD (  29.17  )
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

On Mon, Jul 13, 2026 at 09:34:32AM +0100, Vincent Donnefort wrote:
> On Mon, Jul 13, 2026 at 08:26:35AM +0000, Mostafa Saleh wrote:
> > On Mon, Jul 13, 2026 at 09:11:27AM +0100, Vincent Donnefort wrote:
> > > [...]
> > > 
> > > > >
> > > > > > > I did not add Fixes tag as this is currently dormant and not breaking
> > > > > > > anything.
> > > > > > > ---
> > > > > > >  arch/arm64/kvm/hyp/include/nvhe/clock.h | 8 ++++----
> > > > > > >  arch/arm64/kvm/hyp/nvhe/clock.c         | 4 ++--
> > > > > > >  arch/arm64/kvm/hyp/nvhe/trace.c         | 4 ++--
> > > > > > >  3 files changed, 8 insertions(+), 8 deletions(-)
> > > > > > >
> > > > > > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > > > > > index 9f429f5c0664..c2ccd0e8bf22 100644
> > > > > > > --- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > > > > > +++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > > > > > @@ -6,11 +6,11 @@
> > > > > > >  #include <asm/kvm_hyp.h>
> > > > > > >
> > > > > > >  #ifdef CONFIG_NVHE_EL2_TRACING
> > > > > > > -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> > > > > > > -u64 trace_clock(void);
> > > > > > > +void hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> > > > > > > +u64 hyp_trace_clock(void);
> > > > > >
> > > > > > hyp_trace_clock overlaps the host side: arch/arm64/kvm/hyp_trace.c
> > > > > > already has a struct hyp_trace_clock and static helpers
> > > > > > hyp_trace_clock_enable() / hyp_trace_clock_show() for the debugfs view
> > > > > > of the same clock. No actual collision, so this is only a readability
> > > > > > point, but a reader grepping hyp_trace_clock now gets two unrelated
> > > > > > things. Maybe you'd want to consider a different name, but naming is
> > > > > > hard :)
> > > 
> > > If we were to rename: the clock is a "hyp_clock" so probably trace_hyp_clock()
> > > is the right thing here.
> > > 
> > > while the "hyp_trace_" is the prefix for hyp_trace.c file content.
> > > 
> > > Although I would like to see why we pull trace_clock() from the kernel into EL2.
> > > That bit sounds wrong and if we have a way around perhaps that's better?
> > 
> > Most include path look like this:
> > In file included from ./include/linux/ftrace.h:11,
> >                  from ./include/linux/kprobes.h:28,
> >                  from ./include/linux/kgdb.h:17,
> >                  from ./arch/arm64/include/asm/cacheflush.h:11,
> >                  from ./include/linux/cacheflush.h:5,
> >                  from ./include/linux/highmem.h:8,
> >                  from ./include/linux/bvec.h:10,
> >                  from ./include/linux/blk_types.h:10,
> >                  from ./include/linux/writeback.h:13,
> >                  from ./include/linux/memcontrol.h:23,
> >                  from ./include/linux/resume_user_mode.h:8,
> >                  from ./include/linux/entry-virt.h:6,
> >                  from ./include/linux/kvm_host.h:5,
> > 
> > Although, some files have ./arch/arm64/include/asm/cacheflush.h
> > directly.
> 
> Ha sad, no way around that... 
> 
> So about trace_hyp_clock() / trace_hyp_clock_update() ?
> 

Makes sense, I will respin with that.

Thanks,
Mostafa


