Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA84C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 00:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgzlS1uxnCbzGMH5pUkXS6DY1hZkFu32UCS9PdpFsuk=; b=C4BsQ+/5Qkmi7nI0cmq9inT+k7
	CG+f/9w62Vj9od/yTIVyEr98p6oMlzoqzVJ+h0RJxoikStIhwE1jb2wGLfvkj11qjU3fPZUE6gM0X
	+CMZe2YZnEiDWDs/YJJqeaGHLXyv/hEqxguiX0dYACovKEuqUaDVE/5XGhUzZiJQnd/bt6MY3urMg
	PHATRoXSuWLvdJg0FqnIY6QsiB5OQYRBXKZob03mbuws/y/81e/GRH7mqLvu6mX/gKKxaabTH7TZo
	KC5yH3EU7Yb/IUKYi6WRARShjq3VVBwKu3NK60C/9IlhBWcvNC2SCi5eJnAZXZjhflTvNgDVvPwwH
	uTxpaoaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4T7d-0000000D9YD-1PU8;
	Thu, 10 Sep 2026 00:58:37 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4T7X-0000000D9Wk-15Al
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 00:58:32 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2db3b126c9fso65366065ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 17:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789001910; x=1789606710; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgzlS1uxnCbzGMH5pUkXS6DY1hZkFu32UCS9PdpFsuk=;
        b=IlxvGvnS4+Qcq4ME/V6q19fMeqpQH4DeFE8e3wPKdoW0n7GA550iKxthGpZEBW5scc
         av2cTQjd7FHZGl3LyzsPUL8p96iOPqtsGE732z008IMTwcCOrx9wsj8cH671SrcH7GZs
         80Fqvur0aIwtTFfzKMnys1SBNGe6v1iiw8Gcna59QuLwudXjUWICnY5aNOheonv0Z0bc
         aQrnzKXKI5OfVEC8jWub4l7W8R/F65REeWE9H/3CfonfdLZaylvstQ/2xZAC44QZFjlT
         0TsTCNbBjg6OrH2cWpIguuuMq4uyH7hrtfr3BihbrmkvXqE8qfjjt5J09ISH0ZJB0rRl
         NOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789001910; x=1789606710;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgzlS1uxnCbzGMH5pUkXS6DY1hZkFu32UCS9PdpFsuk=;
        b=UyffPtR5HWuKWV5foH+bhRsT+8BzIGfTMyPi8vyDd6HpF+9T77yuwDGWDSIiDFZkX4
         VkBLcqJTeBGjZB+eBYODlLeQFH2hCUDdtU+LWdQfQARuBKa4ghBmNgIL9mY5Tba8Ahc/
         lCDrPTH7DY8T/XY43xeWmQzagkgzUYUfcyW1pGW9eIFh4bkK2KgP5v5sHE0NHbhtkjPz
         BDGuUnJToKzxNIbhtX3k7yRMw4UMRQlsK+FEsdJNTDx2Vtmi9GG/on3czf8+mWIQpwqi
         QEhY+JPi8d9xmYPrfoqxoQuzA+tEU3daBfQU+YJJpZwFjQ71silf6Cjtbnp7Ha0CXd0b
         g+FA==
X-Forwarded-Encrypted: i=1; AKwUvBxjqioSJG8YLA4Jcubpqfasu2xZCddQCtMtIQ/5kxORxn7OrDtPLtxVMHws8Ai/oxNE/CYX6x73Tk2hx4/3o2ic@lists.infradead.org
X-Gm-Message-State: AFuF++mHn6NrQTNGAcjQLdoU9vG3NCIaHmXYPdZ2kvLc5zgD62k2eLKm
	RTfsK9xbEfaOQaXvXlKXzJO1SQSG37I1hLejX+LlKIkc7aZJTdxllCarykxueh2ZbHqEpvz48rB
	9SGvvCg==
X-Received: from plsk18.prod.google.com ([2002:a17:902:ba92:b0:2d2:c22c:7b8a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf10:b0:2d9:3636:d01a
 with SMTP id d9443c01a7336-2db126669d3mr557854145ad.15.1789001909390; Wed, 09
 Sep 2026 17:58:29 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:58:28 -0700
In-Reply-To: <20260905012403.GX4157646@nvidia.com>
Mime-Version: 1.0
References: <20260903023452.721732-1-loganodell@google.com>
 <20260904160009.GV4157646@nvidia.com> <aptFFYqcSiBdMLE8@google.com> <20260905012403.GX4157646@nvidia.com>
Message-ID: <aqIAtOoew-_6jw29@google.com>
Subject: Re: [RFC PATCH 0/3] liveupdate: Move to feature flags for LUO and
 memfd ABI compatibility
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Matlack <dmatlack@google.com>, Logan Odell <loganodell@google.com>, arnd@arndb.de, 
	pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org, 
	graf@amazon.com, akpm@linux-foundation.org, pbonzini@redhat.com, 
	maz@kernel.org, oupton@kernel.org, bhelgaas@google.com, alex@shazbot.org, 
	kevin.tian@intel.com, dwmw2@infradead.org, baolu.lu@linux.intel.com, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-pci@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_175831_294076_6ED2B6F9 
X-CRM114-Status: GOOD (  26.03  )
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

On Fri, Sep 04, 2026, Jason Gunthorpe wrote:
> On Fri, Sep 04, 2026 at 10:24:21PM +0000, David Matlack wrote:
> 
> > The proposal here (which is inspired by the KVM UAPI) is to ensure every
> > LUO ABI struct has 2 properties:
> > 
> >  1. A field to encode options/features (e.g. u64 flags).
> >  2. A way way to grow without breaking backward compatibility (e.g. so
> >     we can add new fields).
> > 
> > Each flag can mean whatever it needs to. e.g. It can indicate the
> > precence of one or more fields (i.e. new fields in the struct), or it
> > can mean a field now has a different meaning (i.e. union in the struct).
> > 
> > This would enable adding support for new features without breaking
> > backward compatibility. Downstream users would have to ensure their
> > kernel does not start using a new feature while it can still rollback to
> > a version that does not support the new feature.
> 
> This was never the biggest problem. The main issue was the functional
> behaviors of the kernel that cannot be represented simply as data in a
> struct with some flag bits.
> 
> Like for instance kernel A supports memfd folio sizes far larger than
> kernel B because we fixed MAX_ORDER. You can't fix that just with
> simplistic flags.

Can you elaborate on why the folio sizes matter?  Honest question, because I don't
understand why the serialization format wouldn't express things as "N contiguous
pages starting at PFN X".  Then the implementation would rebuild its folios as
appropriate.

I could see things like HugeTLB not working if someone booted the kernel with
support for only 1GiB pages and then tried to feed it payload with sub-1GiB ranges.
But to me, those sorts of things fall into the "well yeah, don't do that" category.

