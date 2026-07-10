Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51480C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdDxVJG3g3cF+//c3YLjvRJpMQRofYl0dq+wVTYwMio=; b=vApMwsxc1AnxjwHaSDC6jEr7cj
	1rzd2zdByHJAyRmVe05o2jdFxKnll5efpFxoq5WlYOZczxG4TvjRDmpWOI4EEn9KLFhdTn8wZNBtc
	LhdSQtAJnYpFXLKSqyrPxIUaiCJANZy0jtSoC+zyLgaMhilRXgpdGJa2lZOyWw5rgrsEOz2PmST4+
	DSZmk+O/0evKuG+z/T7f5/5b65XraX/iO+x6sq22UhsARFt2Cc/+jjCxASIywEVplx+oPNyHO4+Zl
	BILSDO6LeuS4HGqw2ZuGXrC1n1TDnE+ZVSCZPPIEw8y6Vofldc7RkhciinDlzIGv+VahEDZBjCVSt
	KeKKHG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiC9r-000000054rZ-47Fs;
	Fri, 10 Jul 2026 14:24:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiC9k-000000054pN-2Yae
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:24:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493b27c7451so25956505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783693483; x=1784298283; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gdDxVJG3g3cF+//c3YLjvRJpMQRofYl0dq+wVTYwMio=;
        b=E/MOYpK0UOVzeE1b6KxOqxiFp+sABaff4GcvOV1J/oOMdJnxUQDzYvsFb4NAV9olAz
         FBBJwNfEFg95TbmCKNC+0KTt9zPl839AcL2Cwws0KeeFvkylgZZifO5l69wQ3GieQcev
         sSR8iVPG1TiqVy05NfpBXGPIARz6nnNzp9BZYdr1inEC5hNOiql0dlDi6aGk38Id18yL
         rdChOztqmZC7QZqPte2hb82Gjp9cS/ywK493m7ZCO7Rjvk1vHrTbngXbW43+7HnWshOI
         5ygGVQtcT7JHEzZ+IWH8FD/utm0MUVUoUDDFoS/PnF0J33u5At4MfalgElH8UyjhxWEH
         A5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783693483; x=1784298283;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdDxVJG3g3cF+//c3YLjvRJpMQRofYl0dq+wVTYwMio=;
        b=JqyqqxSlFy/nHgLCzHrd/UG6gVrt65IVgeIuFLd5Zro/iZLJQ3O6tX7GNsYvj+cKIR
         c96EKbfqbwZ7unXYUOMeeHuQWUCEOioAJits0Dmu9/JPmr9qZVzFpbYH8w0wr4gXs1B7
         CQXk8zCjBB12aYbVHX1oNWKASWXwD+4uWdtGspFkweejNWLY3jEpWNWPIgFUADbjV+Vb
         izGpU+h4GQGgYWEbGpT0NShnDxD54oai7LiaIHW+j4S7gFpeuYBe4JcrUVOcUoBGY0DD
         MkYuMsfyNr4dHhO4jw7gBz/VQmN2Z+AEuP9i4vWmrLjsMIzJW0B1izNSnAfHhRJT4FYl
         l0/g==
X-Gm-Message-State: AOJu0Ywd5nDbWJ1mifhsqgNUnNOfVqN5EqTe6K4dtEWg4pXsfBh0NY5m
	FNr713Ey918in6gevqMAAfEdDqyAcSLmV+N/Ltcm1TBoKP7fI/j33U2y6wYE8hBa0UVCihNgySb
	kleV7gw==
X-Gm-Gg: AfdE7clSk4ionm4vb+vaW8+VD7KTGEFXeH/KdI5OecIK3qS3UJuGsz/naWP1jxSth/h
	gUK0ItasNwvbggYeDXLg2T/Z3PIvP24ofxL1My4cE6/wcS9nCDpIq6WmJ7ZNWrxptyqnGV0Skze
	YcEBLPX2TChzRzMwPYjoG+GVgSKinWHH9VluChr2HkyISGO4WQRH6inxnoFzEL7n9De8kvSFwbB
	KrUFBOMVWPqsu3b+cPpV6bEhoZ0bGFAR9/GLprTWIC8dXrgtVuVZMzlBhGsGy8qOUSYRylhETdC
	r4s8gJ/pY76gnOeiaB3YCpe0wyx02zgyJXuA0MZs1p4EY18jFirPIXTAlLSDy0LruoRXhDBuJNS
	qnST2cFs7vKyy6qiTadqWBiuoWRQ1iyin0jyNSUMsgHxcy+Vg+dUrsDMn8YNpgc/7MkQ1dpajlC
	A0QqRpAP225aMHycW3wLYZSdRBkmyYQnPjHVyrW7XcFdb3vq1N5h0=
X-Received: by 2002:a05:600d:6401:10b0:493:d117:18a8 with SMTP id 5b1f17b1804b1-493f2b3376emr29088265e9.9.1783693482178;
        Fri, 10 Jul 2026 07:24:42 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2dad65fsm41770845e9.1.2026.07.10.07.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 07:24:41 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:24:36 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 01/25] KVM: arm64: Generalize trace clock
Message-ID: <alEApHcFnkUwnce8@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-2-smostafa@google.com>
 <alD_hwRhUZ0IPTte@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alD_hwRhUZ0IPTte@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_072444_650425_4384C42A 
X-CRM114-Status: GOOD (  14.24  )
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

> > diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
> > index a6ca27b18e15..e30de840e6c2 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/trace.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/trace.c
> > @@ -35,7 +35,7 @@ static bool hyp_trace_buffer_loaded(struct hyp_trace_buffer *trace_buffer)
> >  void *tracing_reserve_entry(unsigned long length)
> >  {
> >  	return simple_ring_buffer_reserve(this_cpu_ptr(trace_buffer.simple_rbs), length,
> > -					  trace_clock());
> > +					  hyp_clock_ns());
> >  }
> >  
> >  void tracing_commit_entry(void)
> > @@ -285,7 +285,7 @@ void __tracing_update_clock(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
> >  	}
> >  
> >  	/* ...we can now override the old one and swap. */
> > -	trace_clock_update(mult, shift, epoch_ns, epoch_cyc);
> > +	hyp_clock_update(mult, shift, epoch_ns, epoch_cyc);

And also in any case we have two behaviours: one when tracing is running
(sync'ed hyp_clock) and one when it is not (floating hyp_clock)

So we might well do floating all the time.

> >  }
> >  
> >  int __tracing_reset(unsigned int cpu)
> > -- 
> > 2.54.0.545.g6539524ca2-goog
> > 

