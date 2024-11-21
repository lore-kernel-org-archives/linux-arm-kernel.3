Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF3BD6ED2B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8uJwMTi4570DKam76I3XnvJS8bhpJu1dkIBLmqzP84=; b=qoXozu0X3o8BbgFFZU8JKgtkl9
	DnILPAPg5ffsIvpnnIij6f9+YpN+X9B+3putPLC4t7QTwD/ShWHBOXvnZjNBOWhrMwJ0GoJr8YmEA
	UdjWLoBHWG1Sa5uOtC38fKtdee0WlFaBYe1C+NWlXQL3Tf23IF8Xrxdi5CXTZA00FHrcGXgHfbJFP
	wZowdeOHR9J8bwwOpyTPLPA8UhLlPPgnma7zbEek/ZLmhcpEbckdQWwKFo9n9hFdoFooEWvJJlwY6
	jbrc4yXEGENPw1+tgL3lfoF8Mrh8IE5cCIaJEkSSmDEFaPWWDV7RZDUOODxSpEAiWgzdC0GRfIBti
	03d0gA+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE7Hx-000000007Yy-3ZID;
	Thu, 21 Nov 2024 13:32:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE7H1-000000007WF-2XJv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 13:31:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43150ea2db6so53695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 05:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732195864; x=1732800664; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w8uJwMTi4570DKam76I3XnvJS8bhpJu1dkIBLmqzP84=;
        b=VqTjl4mflYUJ5jTDeWAd+0pNFc5ZSTNeEn1TayE3sEfea10gFsqZ8I8tvKZQt+Qv0l
         VUDeED2mQTD9/peDoWA7FJdQXnRIMYYi0POwKm88rZDKHQPbto9zFBBVsytgEDayDLzC
         Sjd5yHeKsXPjPKbrW5/ujlBZmYnKInoe+chBYqAjhhIslhzaDWBkA9pDmcS0+rUIYEcl
         DjVBlv5glnZEadUrkUt5/m/nVIW0MgbnsHjMlxaV0OsuBym3j4w6mACZbrg0tHviac50
         vcaW1qJi5TzB9uU4ffS4BnjNiSEx2cDgyqLvAdvx1L8sbeMqksvEj3C0+B+iYHDyPrSh
         7QNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732195864; x=1732800664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8uJwMTi4570DKam76I3XnvJS8bhpJu1dkIBLmqzP84=;
        b=P/sABDJWbrNs2Gn57J/Uf2MqMZEDELjzYWewlHjrVe9+lMfFZxHNBCIExLpVpcQ9gn
         GXKK6JvmuI2V1Amq1tp+cQog/BIrEPQTtmeZGt2OncdxIU11ZcwOjDnwTUvBbtN206pC
         iY3oIuMhyFJJUyUM9fBle2dIe8TDtNB6WoD7xLBu4WM5e3tg+ooP6Fm1Bt8Dq0jfULL0
         J6cwqqSDRr5q0VFwQY3T8KDSTpO4Wl1If2pS6TY7P/GSKauLq5Y7p+UWmeApcuBgAum5
         6DBnTVCaV0W0MrMQWz4UIfEznu2E/y4b2EzdTLxvZV/4CKxXSqXFF1eg3MIRwWCB0/9R
         vtgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn4KVDlA48mD/DkQJtFfEjT+K73azS50h5CYjkKTd6lhXxS9BPXk/PME+oFrOERwvCLxWzLBLtnTuvUQrIkmIC@lists.infradead.org
X-Gm-Message-State: AOJu0YznGH1PhqUAbCtB1a+tNpIYLDWdojPI4tx8gcPHMDkZ1TZilee0
	Xq3vJ6zWEb0h0uf7ZytFiQd1kRJn79fvJrRFZ/95qkd1MEikv17WffOV3SCBtqZPZ9e5DoYCnic
	9Ppt23kY9gMzrL9VCxiz0DA+eBMw2rjASNO9f
X-Gm-Gg: ASbGncvQUpJQvhedO+hK4gGMzGK/pWfK39DuqFjQC/xSjaf0GXc5P0h8cmMnN4EqYWO
	tKLb7Gxbv7uSDS1F56buwhnPJi9G6ImQEOLiAqq+Oy6qpVUaMIYChdE3Nc+Ns
X-Google-Smtp-Source: AGHT+IHrCfsQJARtvkGlSoORtXQ3uMbNnDwXIN5CoAh+JYQ8yNM3CL0C4nm/6GPxscmGMtMCji9BQilfxicJnaQd/q8=
X-Received: by 2002:a05:600c:3b9c:b0:431:43a1:4cac with SMTP id
 5b1f17b1804b1-433c6ce6ad9mr927095e9.3.1732195863680; Thu, 21 Nov 2024
 05:31:03 -0800 (PST)
MIME-Version: 1.0
References: <20241120105254.2842020-1-tabba@google.com> <20241120105254.2842020-11-tabba@google.com>
 <Zz7wBU3BHW-XNnbr@google.com> <CA+EHjTyGzjOnVnyqfS6LO5=_EhQY3CS18HyrnSmnfNF483yz6w@mail.gmail.com>
 <Zz8HB8KQtUyj8d9O@google.com>
In-Reply-To: <Zz8HB8KQtUyj8d9O@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 Nov 2024 13:30:27 +0000
Message-ID: <CA+EHjTw_NjrN63LXebPRha3tR6KjfXN-eh+eUeX7v5ksuVEG5g@mail.gmail.com>
Subject: Re: [PATCH v1 10/12] KVM: arm64: Calculate cptr_el2 traps on
 activating traps
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_053107_659604_5B7E41A3 
X-CRM114-Status: GOOD (  17.34  )
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

Hi Quentin,

On Thu, 21 Nov 2024 at 10:10, Quentin Perret <qperret@google.com> wrote:
>
> On Thursday 21 Nov 2024 at 09:41:46 (+0000), Fuad Tabba wrote:
> > Hi Quentin,
> >
> > On Thu, 21 Nov 2024 at 08:32, Quentin Perret <qperret@google.com> wrote:
> > >
> > > Hi Fuad,
> > >
> > > On Wednesday 20 Nov 2024 at 10:52:52 (+0000), Fuad Tabba wrote:
> > > > -static void pvm_init_traps_cptr(struct kvm_vcpu *vcpu)
> > > > -{
> > > > -     struct kvm *kvm = vcpu->kvm;
> > > > -     u64 val = vcpu->arch.cptr_el2;
> > > > -
> > > > -     if (!has_hvhe()) {
> > > > -             val |= CPTR_NVHE_EL2_RES1;
> > > > -             val &= ~(CPTR_NVHE_EL2_RES0);
> > > > -     }
> > >
> > > To be on the safe side, should keep the RES1 stuff for nVHE?
> >
> > Sure. My thinking in removing this is that, once consolidated, it
> > would be easy to spot whether we could be clearing the wrong bit. But
> > I could reintroduce this when I respin.
>
> Actually, my bad, while checking how this worked for nVHE prior to your
> patch I've realised kvm_get_reset_cptr_el2() was already setting those
> bits correctly, which is arguably the right place to do it.

Actually, _my_ bad :) This patch is still not quite right,
kvm_get_reset_cptr_el2()
gets the reset value for the host, not for the guest, which the code
in this patch just works around. I'll respin this before the end of
the week, with a fix for this.

Cheers,
/fuad


>
> Thanks,
> Quentin

