Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF81C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1AXWpDbuwot7e/IsmprnSM8i9vxDyXshC7OCwJGDTM=; b=sqaEWTZMnow9R0TJKd9Twiw2eG
	F1pgtdYJ5FO7e+xCafZyHqDMRxDXmFOyD1V2vckdPwYT38hGtFIqxPvcnQIgDXNSMgOe84mYoZaq/
	oHrFlCoUh5SrI5WrKlnyDSAfSwGNEjzqoj1h9p2Q9bvD/8bMhM2PzvP1nHxOCW/uEYHgm+5dNJi+B
	SQGiTtwDEmRaGJtVOLekVDHKW68ob6v7JKwrIzKUhEOiaOKDCuO0Zk/Znog9VtChjWL8eeu2mRt1Y
	nTruTEJ7imiR5UmdcuCCNzHDmXHyU77PjvdFbK/ophZnGBzC2L1/YY4uMJ/PHDmRMevu/gVHc0c6x
	scGOIaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr8i-0000000Dfs4-3o8u;
	Mon, 06 Jul 2026 21:46:08 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr8f-0000000Dfrj-3Sl1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:46:06 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so2977932a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783374365; x=1783979165; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1AXWpDbuwot7e/IsmprnSM8i9vxDyXshC7OCwJGDTM=;
        b=vANBWipIkT+w/aOu5ZgMab0WiizE/hqY7XItVFgwKC6WQggmltiGI5Od7KJbJZ2AZu
         Vbz0wtcOjFRF9jJC+vGdK0QamPa9zYVK4SNJl8tMAcrqcB87TtUEP3ZtrmVHxTVWehkf
         Ij5h5E3dVEf1Mq5FIObxp3uwvUKRDNuxBbknt5nTg3cOidReSlVJYLST1VonQWCu0B19
         6mTUxxvTRPg+tBUf/CK7ZEHKjtDM5xlTSuJA6UviZc/88DqWyDNEwnxH9VCASMCtRAkm
         qCVO+VemazNRsWGCiUp5puZMvWHbJKeD1bAj7uoHVgO38eByQBFtSqAqRYYXoOLaTqN1
         qgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374365; x=1783979165;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H1AXWpDbuwot7e/IsmprnSM8i9vxDyXshC7OCwJGDTM=;
        b=WqFqsdz/RajMEplL5MvS/NKxfRxCqWm0tAowTuD/SwKGb4hVTpC3xPYISJ1OdpDQKf
         uz/y/8wUzZmhs+EZjEwyyhxHwHApsBlJQf/U5jRp/LjPjuIEewiuoRRN3p5Pck+qOzI/
         CMFdZHTXVEoAUOFAjQBBL5+ECM+y/9uXXWXDX+Ca+JKS8jJV63vgjXiSQgTRnnULEySv
         xylvjL5SVm5IYH9WE8VAAohRREvHLH50RWJaus6e+lW2cxOQdRD9RtSxoqoSdKErxPi1
         wPLoCqLzd0R2AWdfbnNPMSFvJtaodEdUZjoQiC1+WJ8XZXGqBqXawVzHrKz5tOVMaSBv
         k+Qw==
X-Forwarded-Encrypted: i=1; AHgh+RpVlH3wcePAEUzkMmwk4SpvXliwqeOEcyw++pZASWgd6oaxirrcgQlh27vrT2AU8UxbMcpDYkrgB4E438y3PMus@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+qpt4Oo6d0u7dwCXIU4UVwIeFIxpY80FgLFvudhRs7gpbSBXw
	6OfPNkMfJEE8WcC8RTxYgdZNrkzylVJYUANFU+ah3hivdcdIQ3BE576SNFZ7VAopr4uLI2wHuuk
	R1x9tyg==
X-Received: from pgbeu10.prod.google.com ([2002:a05:6a02:478a:b0:c85:a528:228f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:220c:b0:3b7:9c18:c681
 with SMTP id adf61e73a8af0-3c08ec8da6fmr2781635637.9.1783374364514; Mon, 06
 Jul 2026 14:46:04 -0700 (PDT)
Date: Mon, 6 Jul 2026 14:46:03 -0700
In-Reply-To: <akuxjY-VRrmcybjZ@raptor>
Mime-Version: 1.0
References: <20260702142912.6395-1-alexandru.elisei@arm.com>
 <20260702142912.6395-2-alexandru.elisei@arm.com> <8a24f016-6f0f-4322-b646-d843f6fa481e@arm.com>
 <akuxjY-VRrmcybjZ@raptor>
Message-ID: <akwiG_tDu5Eyyc0-@google.com>
Subject: Re: [RFC PATCH 1/3] KVM: guest_memfd: Use memslot id to keep track of
 associated memslots
From: Sean Christopherson <seanjc@google.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: David Hildenbrand <david.hildenbrand@arm.com>, pbonzini@redhat.com, kvm@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	fuad.tabba@linux.dev, mark.rutland@arm.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_144605_867603_FBE92458 
X-CRM114-Status: GOOD (  21.15  )
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

On Mon, Jul 06, 2026, Alexandru Elisei wrote:
> On Mon, Jul 06, 2026 at 09:14:59AM +0200, David Hildenbrand wrote:
> > > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > > index db57c5766ab6..43ef8e908aaf 100644
> > > --- a/virt/kvm/guest_memfd.c
> > > +++ b/virt/kvm/guest_memfd.c
> > > @@ -25,6 +25,7 @@ struct gmem_file {
> > >  	struct kvm *kvm;
> > >  	struct xarray bindings;
> > >  	struct list_head entry;
> > > +	bool found_memslot;	/* Used for balancing invalidations when punching a hole */
> > 
> > Probabably best to document what it means, not only what it is used for (and
> > maybe document above the member if you end up with more text).
> 
> Sure, this is how I changed it:
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 210bdd76f0aa..3cee64047bce 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -25,7 +25,13 @@ struct gmem_file {
>         struct kvm *kvm;
>         struct xarray bindings;
>         struct list_head entry;
> -       bool found_memslot;     /* Used for balancing invalidations when punching a hole */
> +       /*
> +        * Keeps track of whether memory has been unmapped during secondary MMU
> +        * invalidation, to keep the invalidate start and end calls balanced.
> +        *
> +        * Accessed while holding the inode->i_mapping lock in exclusive mode.
> +        */
> +       bool memslot_invalidated;
>  };
> 
> Hopefully the new name is better.

Why add a boolean?  It's not _needed_ to balance updates, or rather it shouldn't
be needed.  filemap_invalidate_lock() prevents modifying bindings while an
invalidation is in-progress.  It might be a performation optimization, but if so,
it's a premature one and belongs in a separate patch.

