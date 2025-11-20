Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52857CF884C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 12:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HhtSTqCGLLrH7sfkvwPKz4oo0QSbD9ECCA73kZYpvQ=; b=bf4Z/DoqMCL5Gy1kwJPICx8xmr
	i3ZZQCAlWt8XVFnGEIXcADPgUcXycrGC96wICGKEal088jbMZ9VKE7hPENCyA/Vl86wztZQJIcJ4K
	/pZ43nUlTJGim1+tSnQyic6Svdo9X6UkXjIIcBOzHYeJ73lOBiqUpGHhef092QMTvLNedgEJZWZX+
	MQ+/3cnW42Tr/SZtSRQOsncsdbDaaCeTkDyYgp6gDAAPmHP2c/tAxLJtjcIjSfUbRUlfQhLWG+WcY
	lA/XUEI/qmYlVB679x+OYUqQUOEz77Xbkw8Ga+xYghwtTnmTBjKHejnpAglDSRKWVoS1+r2kGQAxH
	zdk0EiNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3lP-00000006fSl-26c6;
	Thu, 20 Nov 2025 12:27:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3lN-00000006fSJ-0HWs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 12:27:50 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so6383155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 04:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763641667; x=1764246467; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4HhtSTqCGLLrH7sfkvwPKz4oo0QSbD9ECCA73kZYpvQ=;
        b=BoqL/4gUTRhcWDlS1x6YqPEnr1+2sKhNpSwH61JPP5/3uAyRvtU99kkord56mZK/Ut
         Zi7zOfIIspmbY4q3bUydx+Yqj3Ecj6Yalk9aKw1AV3VAgMo9BT4Xq5vfzbiZZsur/P66
         dkgvuNwVsnUZcBoaEWgtZ/373A2SnjItGn5go+Wylqqv5tGslKqetEtr423lXkxshYBT
         RHQEYPejPcbFazbBvSLYUKhz86wWHCIoQB3J+BK7Bk4Yj+P0ZRHa7u36cRMfI5PPAQl5
         G6ilXnDn9QGidvkc0x8NIunWlyJwUTpdJqHfEhFP0SJQwHCBoUd4nk4pLjmwdmMzEJJo
         jYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763641667; x=1764246467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HhtSTqCGLLrH7sfkvwPKz4oo0QSbD9ECCA73kZYpvQ=;
        b=qJ8U+pxSvja37TwsMWlgbizi/1UcNFqmYpb3VxifKkB77lKoE8Xdwu1HRJ+nFAeIUP
         hxC07zxB2TKjJrSbDNK2w/3g/lknqdb+zzKj0FSFDxbRf9gXoP/8CPPxuRQM0FxgTfDE
         yGVhdk4mu6EbjZlciLqvz4s8WEVAeUMRVg05PWQ6dxqPo2zDpLAFlicssWQXlH9Ayvr9
         kD02T+8zfGXCUtXfbNDLJUocFN0k4+KeFP1t8FgEr09hHFlhejEXEs5nGcehG7WQWWsu
         u3OoeLn+UbkAba8t8wUMzhHn7We2JCdUITmlphh8pInmnuQgyNB2H5ce90KCS0RLt79Z
         mMWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAoJdEGySvyehcjjqQeUF6i2A5HreJY7OrQC79mR+uZeL2hR6wwuOiyfxxAiCy78sCLAzqDnPtzB74HuX0BQ0u@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+cidBek9WpPnoiNTWQla8qBVU8VoFd0RkbsyuV+sLAbahshEx
	xE7Eiivyyyer1p8AOhdkXLmht+sfMCGsTsMkne6SSWmcqsfx1HAzPdGJ58FGq7zrCQ==
X-Gm-Gg: ASbGnctW7+aweNdYY6PeQe9nC3YozkRB5xGzjf3nbf//rMHQwpCb0WVUhpV/kfYUYmw
	cV4RNCLUKEjfOf0+isi1XyVX6QV4s7uulCyzDq67nzkheJBmD0UXGBVa+H73iM4D0d5X69qaKAq
	tnipiX+kHw6vYJbx+PArPKUFDAsP6KyjHSo3iuBZEwHtr/H/4I14+u/E6J+5c5sHtvZhl4Mj/aD
	8XXTaKIt1zRBuXaWVWLtzlRCPN3IUxbxnZwtLVZ0kXTZYJudvQScM4IVPK9M41gAlpV4e/hGU/0
	8z0VNsxUGjqbvmTVGePpm84m1uru+g4xAXXDoG3d/CaDdiOmMxhwubdIc1f8LIeArT933FinwDz
	rMY6dKd60r28Ak0lBk0slZf6nh6XnTyOfHTDbjA77jXO0NRF38q+5+ctzNKmZ128IEns3U2tkRN
	eYyUNHVbJHXko9cZ5wnVUj8ecClHNLwT0pPuGSiKYdbyUroV0Lgg==
X-Google-Smtp-Source: AGHT+IHpeFeIGGZiJTmXFsR+6beF5U9qh+UXPfFDdc/PMj/YV98aLC84HYj/PIpbhK9tkAcu44ljjQ==
X-Received: by 2002:a05:600c:4e8f:b0:477:9eb8:97d2 with SMTP id 5b1f17b1804b1-477b8a511d8mr26758955e9.8.1763641667024;
        Thu, 20 Nov 2025 04:27:47 -0800 (PST)
Received: from google.com (120.54.38.34.bc.googleusercontent.com. [34.38.54.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dbec2bsm64229035e9.5.2025.11.20.04.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 04:27:46 -0800 (PST)
Date: Thu, 20 Nov 2025 12:27:43 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 22/28] KVM: arm64: Add trace remote for the pKVM hyp
Message-ID: <aR8JPxRHg7vEOME4@google.com>
References: <20251107093840.3779150-1-vdonnefort@google.com>
 <20251107093840.3779150-23-vdonnefort@google.com>
 <86a50irkst.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86a50irkst.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_042749_120837_92991492 
X-CRM114-Status: GOOD (  24.97  )
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

On Wed, Nov 19, 2025 at 05:31:30PM +0000, Marc Zyngier wrote:
> On Fri, 07 Nov 2025 09:38:34 +0000,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > When running with KVM protected mode, the hypervisor is able to generate
> > events into tracefs compatible ring-buffers. Create a trace remote so
> > the kernel can read those buffers.
> > 
> > This currently doesn't provide any event support which will come later.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > index 580426cdbe77..64db254f0448 100644
> > --- a/arch/arm64/kvm/Kconfig
> > +++ b/arch/arm64/kvm/Kconfig
> > @@ -87,6 +87,7 @@ config PKVM_TRACING
> >  	bool
> >  	depends on KVM
> >  	depends on TRACING
> > +	select TRACE_REMOTE
> >  	select SIMPLE_RING_BUFFER
> >  	default y
> >

[...]

> > +static void hyp_trace_buffer_free_bpages_backing(struct hyp_trace_buffer *trace_buffer)
> > +{
> > +	free_pages_exact((void *)trace_buffer->desc->bpages_backing_start,
> > +			 trace_buffer->desc->bpages_backing_size);
> > +}
> > +
> > +static int __load_page(unsigned long va)
> > +{
> > +	return kvm_call_hyp_nvhe(__pkvm_host_share_hyp, virt_to_pfn((void *)va), 1);
> > +}
> 
> I struggle a bit with the nomenclature here. Why is that called
> "load"? Surely this is a "map" operation, right? Is that because this
> is called at "vcpu load" time? Something else?

I called "load" the operation of getting the tracing buffer ready. But for this
implementation specific part, I can use map/unmap here. (same for
hyp_trace_buffer_map_pages/hyp_trace_buffer_map_pages)

> 
> Also, how is this working without pKVM, in a normal nVHE environment?
> Being able to trace in nVHE is a basic requirement, and I don't see
> how this works here.

I can probably make it work with nVHE as well.

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

