Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57405C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXGe7X0iZgUmvVFaQXoM7fBhG4zn/0blC4O6KCudJRU=; b=NL56sHDdgDDJOaNQ9hvd56wQ/t
	AM1yM6STJNbXExMkuuG41vs4h4fgEotH4yyYxyRCVcT97Wns044OhU/ZkbU9oahbZUHUOlpAl31fk
	x5FEMRNAZqS3iCQOCcbSMQYgo7PKyJs+MLrPpcCbhwestnIEI7+2VjhKmwo5aNkY1pHhWOQiWvmSm
	GGlXvF9GBvegJlibie5tA9eNB3O99hHPzwPF0eg1AEwiQvCKcHa02zU9i3hK7v12hRDpxEDgx6Sfu
	SF6Cs/R7d177isgSPIsT31TYSuchdTG6iQD0P+EWOOAGf/ECXRzC/u3OPe9sLHt6yj7TU9b8VqRun
	Gg9QoprQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBSg-00000001qJh-2Bsg;
	Mon, 30 Jun 2025 10:10:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBID-00000001oc8-1wdy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 09:59:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4531e146a24so24199145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 02:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751277555; x=1751882355; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XXGe7X0iZgUmvVFaQXoM7fBhG4zn/0blC4O6KCudJRU=;
        b=duyu2PL8BwYK2EyHRd/lYyqf3N7s8ikt5LtyvTwbgQ3FK9qgTBXHxbtStQn1jNrQNh
         T9Jbiq0T5w/mSrijFm5i/nbwM23tUDXnYge3sMPoninQORZiXL4UtAMivwWfIAOO+pra
         p0X7PPL5ZYdqOkQmKA7bN2SxV7Y49GlpRqrjXeuqj2339AViQHxGPm8aIva3dEkE7MXK
         WUC54uxvZR5s9202Rv31UaobwgPmJJXWUb8gOrKWGY4Uqg9QO2Ttga5RJdGF59jazzzV
         caDlkFyW+Vq8LA5h6N76/R/5Lx7+WRBnsDVFzawMq6Z+ArUU9B/iyVazz3y/RFvxniVR
         a40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751277555; x=1751882355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXGe7X0iZgUmvVFaQXoM7fBhG4zn/0blC4O6KCudJRU=;
        b=QnETaR12JRzXBqUCm3n/A5+nICxa6yQKMlXNoZSsxl3SuOkHYZweaqoHMDwwEvwm0Z
         QvsCHs8u3W6urdivykF3YSXEg/kJlhzx4uWJsVK0jKAhRssfkTGFzdM9xJnTKE/4EosL
         hirqYsz0qG8Ll3TlED9uo5zPDt0SeWDrBvgpj8bKnTrh64wcSRMHK5inBREE4bE62Wcg
         g3RFqgQd5DnHk5ippQXcRZC2II3llMHqtmnYRMUp1OdfJMsR+SOV6NIxi8ogQL6m04GX
         l16cmX9BhdSzNjOME7G8rLNHfJWDLrZMgPCfrDnyGDQQXgsYFHxxdUy++vwCrvmTz2z3
         UX3g==
X-Gm-Message-State: AOJu0YxwFBJLFTRoPFCiMdNUU8XyvodBpUKl35KtEhlR6gzk29d0bj8N
	7I3MPvM9gSLmsSua+nyoW/HGawL2KhcLnhyJ1Pd4XSki9s4FtFC9GDCi/S3ZKh8qMA==
X-Gm-Gg: ASbGncsAUYKoCwcj45kLNB9nfTp0VruvNr6BEOpr6MiCCbQESW9G3vZKFXZ2U5WkPvh
	OyP4k6VlMPDg4n5tIqbSzM2+asQa/FTphNalBLRWJTPN3hUlaylHy+1AclaIlT6caNX3kV+hoKm
	Vp1Ls0owM9EjJOyg6yHix19zcepO8HOAR75Wdk3902dmRbzbK1G7J2pnh4X9pPzWcPvFaNmnwua
	tYNmxlNMl0WdfeC4W2qf/Xqc+RAxpXQnfw9FYrU61+4iUAEsRWMQW6nY6KEyLtRuLNDl2b6uqfM
	PrQUEmkoUvNl2aZ7i1lE0qDhUpKpuSdsxCIEEWP+XSUgHL6X7c+i2pQKe0qjx/+0GEIvm2K4MnR
	PvJjy9US8iE7v1Pg=
X-Google-Smtp-Source: AGHT+IGCHHE7WPoHAdx0Afz3qTyhSNNdcVu6Tz20xUb804a780XJjxvmzRwAbnAKyBU5edUDUB3dlg==
X-Received: by 2002:a05:600c:1906:b0:450:cabd:160 with SMTP id 5b1f17b1804b1-453948fceabmr105823845e9.3.1751277554978;
        Mon, 30 Jun 2025 02:59:14 -0700 (PDT)
Received: from google.com (65.0.187.35.bc.googleusercontent.com. [35.187.0.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5979dsm9915422f8f.75.2025.06.30.02.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:59:14 -0700 (PDT)
Date: Mon, 30 Jun 2025 09:59:10 +0000
From: Keir Fraser <keirf@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Li RongQing <lirongqing@baidu.com>
Subject: Re: [PATCH 3/3] KVM: Avoid synchronize_srcu() in
 kvm_io_bus_register_dev()
Message-ID: <aGJf7v9EQoEZiQUk@google.com>
References: <20250624092256.1105524-1-keirf@google.com>
 <20250624092256.1105524-4-keirf@google.com>
 <aFrANSe6fJOfMpOC@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFrANSe6fJOfMpOC@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_025917_503116_C7A72895 
X-CRM114-Status: GOOD (  25.34  )
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

On Tue, Jun 24, 2025 at 08:11:49AM -0700, Sean Christopherson wrote:
> +Li
> 
> On Tue, Jun 24, 2025, Keir Fraser wrote:
> > Device MMIO registration may happen quite frequently during VM boot,
> > and the SRCU synchronization each time has a measurable effect
> > on VM startup time. In our experiments it can account for around 25%
> > of a VM's startup time.
> > 
> > Replace the synchronization with a deferred free of the old kvm_io_bus
> > structure.
> > 
> > Signed-off-by: Keir Fraser <keirf@google.com>
> > ---
> >  include/linux/kvm_host.h |  1 +
> >  virt/kvm/kvm_main.c      | 10 ++++++++--
> >  2 files changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 3bde4fb5c6aa..28a63f1ad314 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -205,6 +205,7 @@ struct kvm_io_range {
> >  struct kvm_io_bus {
> >  	int dev_count;
> >  	int ioeventfd_count;
> > +	struct rcu_head rcu;
> >  	struct kvm_io_range range[];
> >  };
> >  
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index eec82775c5bf..b7d4da8ba0b2 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -5924,6 +5924,13 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
> >  }
> >  EXPORT_SYMBOL_GPL(kvm_io_bus_read);
> >  
> > +static void __free_bus(struct rcu_head *rcu)
> > +{
> > +	struct kvm_io_bus *bus = container_of(rcu, struct kvm_io_bus, rcu);
> > +
> > +	kfree(bus);
> > +}
> > +
> >  int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
> >  			    int len, struct kvm_io_device *dev)
> >  {
> > @@ -5962,8 +5969,7 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
> >  	memcpy(new_bus->range + i + 1, bus->range + i,
> >  		(bus->dev_count - i) * sizeof(struct kvm_io_range));
> >  	rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
> > -	synchronize_srcu_expedited(&kvm->srcu);
> > -	kfree(bus);
> > +	call_srcu(&kvm->srcu, &bus->rcu, __free_bus);
> 
> I'm 99% certain this will break ABI.  KVM needs to ensure all readers are guaranteed
> to see the new device prior to returning to userspace.

I'm not sure I understand this. How can userspace (or a guest VCPU)
know that it is executing *after* the MMIO registration, except via
some form of synchronization or other ordering of its own? For
example, that PCI BAR setup happens as part of PCI probing happening
early in device registration in the guest OS, strictly before the MMIO
region will be accessed. Otherwise the access is inherently racy
against the registration?

> I'm quite confident there
> are other flows that rely on the synchronization, the vGIC case is simply the one
> that's documented.

If they're in the kernel they can be fixed? If necessary I'll go audit the callers.

 Regards,
  Keir

> https://lore.kernel.org/all/aAkAY40UbqzQNr8m@google.com

