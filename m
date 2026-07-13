Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD7EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtqEp6WILuHu3z7cOSw6EYTxyyE81/3b++ePQIGwGRA=; b=nB4SypTI3xBjkR6n3ZYBGWRRxC
	FXynzl5q1789WSWeSI21yo8J5ZFYpj2ObSebIsdeJ2x2kTrdZFkfX4tfLpjfWuvd7uZuO2fIzp6Ai
	WdRq3RSHyEpCG2e31qS2+Uzs57D/TQnjcOfS6qfCRjUgaqLyoFsCy4lSaPfXxBkbkZB7uZGHCRO6W
	MhZCsiR/N/1/XA0SjNYgXlPcZBChnMfwAwQ+m+gW4v7XyoAkbN4SchVcEtw+Hmg3eohxJkJ9bK+e0
	M3IBL/rN6ep/Py7weo1icnBItVsq0EP9EXRfPaj+yc6Grjpj9fDhXBmCPjsLqbK9GP+ISw0y/Dz/W
	u8XYL6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCRi-00000008eBu-1Fpm;
	Mon, 13 Jul 2026 08:55:26 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCRf-00000008eAL-3pew
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:55:25 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47362928f65so2828933f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 01:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783932922; x=1784537722; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BtqEp6WILuHu3z7cOSw6EYTxyyE81/3b++ePQIGwGRA=;
        b=C9BOjzK5lrcMklv3SStBAB8Ph9JDm0qgQAKBb7wOYEzQlUqbn/zVNVbiC+E9qeRwVe
         WMhfrNOYciqoVBlyd48JEu/ipwR/XcSr6hv7z+Vy2wAsFweChckrg20EsaDzjLWXqIdI
         hflWExCFWhrD+KMOkh4cHPeXGFiIOuz4Qtno67TA9ryapHBdUn6F033Y8bsMNy/54eV/
         zleAwxzeCI4bcWrQd/oQp0KmNts3Qs+F/P6VW3LxCemOf64xU6qc1f4oGlY5nf19Q6Xj
         szAE16VWJMqT2G27p/QForG1+bPKSW5Sp/OnfSQl5iXfcnD5wf5S4+feUI3/ABZLsH+d
         5wGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783932922; x=1784537722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BtqEp6WILuHu3z7cOSw6EYTxyyE81/3b++ePQIGwGRA=;
        b=k9f9HOo6yg+M7nqIdyYCDE2G6H2Q9SNqYsbB0qf6V8Rssmz2yWtEP64oK9W8++Wxg7
         Mye34I/DFe3RHOthM/lasQvnBNZOKGJ5+BVE9R2X2itbzaZ5Qa6zR3lVmopmOPSVdQX0
         jN+XT1/JmhvBD4RjjGnaVneJKeMHyA7n27fLYahLVvP9i5TOD3IQg11B2LrbMaCJqem5
         UvLIosNrPJXRk7KjpBo9RVHkwUFDW790kC81emXaDcbhQHGhON92SiIrOH0GMYtAFhkt
         CY3pdQ9QTnIaHFQWPe6aTIEtKHVa+YFleAy5NdudkEmSq/QVJEOsWKPH7VyW5QRTkeih
         cbLQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVgiiodEv5mlIXwph6XTSH/JPTT6kptX8hYtUBqgGN8UnviUjfJ19UN4p3J3iQU8cXnRyVPo+/bOnLquMAiScx@lists.infradead.org
X-Gm-Message-State: AOJu0YznYAk2UyrCngDFaYMtt9OeSx+KZplCP4WXgLCinD/OLwtf1z2a
	KgsvLk/buPl0k239C6OaQ1Maq+q8M3M3561Dl5DINRt2WN5fmQYruz2xaUd0m1nb0bQUJa+YGyJ
	qFTJ0jA==
X-Gm-Gg: AfdE7ckncztjTV9GcU2qbybiu8pRpSuLMI6UrXeWUQrdxSHpiUzzLE3APOLTrBMFhWH
	sHtwSeR/KnQXpAJvguqYSdbWX8vCMFhc36Db0gJ/1cj3CLBXvgo2s9ZlAZPX8HoOxQ3IkjpNTkt
	4jMFoHaoRwtga8G0NJGFP2Fo35P7hn5q8TkUyu0ZA23AQY7OWbxc3Oy9s4IhyhB1LKAsPi0v2pR
	KuVZhRQ+FeWoKs0pXaGROCqF25UA53MHjt/qJsY1hlMo4cql1Zi5xfKrDIU1dpkL0zLGr2DupQA
	xh/i1+WQ65+scsREHI+Zg3iDRnKMU0guYEKVJlm/jyuuyAqlQQCWUo1K9L2NM+9VVKKPdPH0MNs
	AiU9mDXSErN0aXNtwkPH7Pd5yXGQfmHkXihjK/tTgeALjkdVr5k1W+FA/vguswp56Mk0BhOtx8f
	Q5gEK4cH5j5P6cjs7inT6tvSDBd+Ow6ofblwaiDvN4dEXJcoDAZhA=
X-Received: by 2002:a05:6000:2688:b0:47d:f440:fb62 with SMTP id ffacd0b85a97d-47f2dcef535mr8659990f8f.57.1783932921619;
        Mon, 13 Jul 2026 01:55:21 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47df6a31dd5sm40641410f8f.16.2026.07.13.01.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:55:21 -0700 (PDT)
Date: Mon, 13 Jul 2026 09:55:17 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH] KVM: arm64: Avoid naming collision in tracing
Message-ID: <alSn9VSa7YQZ6NFH@google.com>
References: <20260712153835.2264905-1-smostafa@google.com>
 <CA+EHjTxN1fcBVRi+yK18UgReGsX8Evu1GsijSQC61dY3XrjCtw@mail.gmail.com>
 <alPox2BDk4Il0s9t@google.com>
 <CA+EHjTzvzcV8Cxw+VHK9Fxv7Y-7m84XbzUFU+4sXZXNrM8y7dw@mail.gmail.com>
 <alSdr9wNyyPiHmbt@google.com>
 <alShO27MLsNqgBws@google.com>
 <alSjGAqmB7HX1jYB@google.com>
 <alSkmhpjNCYFnUmO@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alSkmhpjNCYFnUmO@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_015523_986253_2DFBFFFD 
X-CRM114-Status: GOOD (  30.64  )
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

On Mon, Jul 13, 2026 at 08:40:58AM +0000, Mostafa Saleh wrote:
> On Mon, Jul 13, 2026 at 09:34:32AM +0100, Vincent Donnefort wrote:
> > On Mon, Jul 13, 2026 at 08:26:35AM +0000, Mostafa Saleh wrote:
> > > On Mon, Jul 13, 2026 at 09:11:27AM +0100, Vincent Donnefort wrote:
> > > > [...]
> > > > 
> > > > > >
> > > > > > > > I did not add Fixes tag as this is currently dormant and not breaking
> > > > > > > > anything.
> > > > > > > > ---
> > > > > > > >  arch/arm64/kvm/hyp/include/nvhe/clock.h | 8 ++++----
> > > > > > > >  arch/arm64/kvm/hyp/nvhe/clock.c         | 4 ++--
> > > > > > > >  arch/arm64/kvm/hyp/nvhe/trace.c         | 4 ++--
> > > > > > > >  3 files changed, 8 insertions(+), 8 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > > > > > > index 9f429f5c0664..c2ccd0e8bf22 100644
> > > > > > > > --- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > > > > > > +++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > > > > > > @@ -6,11 +6,11 @@
> > > > > > > >  #include <asm/kvm_hyp.h>
> > > > > > > >
> > > > > > > >  #ifdef CONFIG_NVHE_EL2_TRACING
> > > > > > > > -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> > > > > > > > -u64 trace_clock(void);
> > > > > > > > +void hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> > > > > > > > +u64 hyp_trace_clock(void);
> > > > > > >
> > > > > > > hyp_trace_clock overlaps the host side: arch/arm64/kvm/hyp_trace.c
> > > > > > > already has a struct hyp_trace_clock and static helpers
> > > > > > > hyp_trace_clock_enable() / hyp_trace_clock_show() for the debugfs view
> > > > > > > of the same clock. No actual collision, so this is only a readability
> > > > > > > point, but a reader grepping hyp_trace_clock now gets two unrelated
> > > > > > > things. Maybe you'd want to consider a different name, but naming is
> > > > > > > hard :)
> > > > 
> > > > If we were to rename: the clock is a "hyp_clock" so probably trace_hyp_clock()
> > > > is the right thing here.
> > > > 
> > > > while the "hyp_trace_" is the prefix for hyp_trace.c file content.
> > > > 
> > > > Although I would like to see why we pull trace_clock() from the kernel into EL2.
> > > > That bit sounds wrong and if we have a way around perhaps that's better?
> > > 
> > > Most include path look like this:
> > > In file included from ./include/linux/ftrace.h:11,
> > >                  from ./include/linux/kprobes.h:28,
> > >                  from ./include/linux/kgdb.h:17,
> > >                  from ./arch/arm64/include/asm/cacheflush.h:11,
> > >                  from ./include/linux/cacheflush.h:5,
> > >                  from ./include/linux/highmem.h:8,
> > >                  from ./include/linux/bvec.h:10,
> > >                  from ./include/linux/blk_types.h:10,
> > >                  from ./include/linux/writeback.h:13,
> > >                  from ./include/linux/memcontrol.h:23,
> > >                  from ./include/linux/resume_user_mode.h:8,
> > >                  from ./include/linux/entry-virt.h:6,
> > >                  from ./include/linux/kvm_host.h:5,
> > > 
> > > Although, some files have ./arch/arm64/include/asm/cacheflush.h
> > > directly.
> > 
> > Ha sad, no way around that... 
> > 
> > So about trace_hyp_clock() / trace_hyp_clock_update() ?
> > 
> 
> Makes sense, I will respin with that.

Thanks. And small nit for the patch title: use "hyp tracing" to distinguish from
the kernel tracing.

> 
> Thanks,
> Mostafa
> 

