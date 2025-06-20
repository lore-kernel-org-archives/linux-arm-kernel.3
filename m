Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEE4C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 19:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5V4eEdTfLNGKvwTMu6gpmcWM1DlkOACRK3Iq7ll+QeI=; b=YZXsJvaXBspp/QU8FcemZup+nq
	EsqfhVMkBn5zHGZGLlyFVPwrxe1cWFQr7IBPt3NZFTEGC8ikCKwOIefD/1eW98b7mVGVJHK1YYmFi
	2pOCkNFfLrj2Fq3aBhGvpcqEYw07tU4dpFJUdx9SRztyYI4hJYNvZCoY4xmisxkjx28eiQsNKzJ/J
	iC6YFc9nkYuOLytx8vB/Mwi5tvmzcU48f3nIXl7T2931acM4lds83Qxkv9aBBALwrAwIBvdbRaBEm
	J8hbRd4gNLNGkyj5XH9Iu42yoQwTPs/GZQkx7P7D753/rcSc7Ta1ObVd/IWeLXuvQ3RMJcrRwCXBa
	xlcJ+PtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSh4c-0000000GQNr-1KCG;
	Fri, 20 Jun 2025 19:06:50 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSh2E-0000000GQB9-0iNy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 19:04:23 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-311ae2b6647so1494446a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 12:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750446261; x=1751051061; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5V4eEdTfLNGKvwTMu6gpmcWM1DlkOACRK3Iq7ll+QeI=;
        b=maRrJBOpDRLdoqgagZBQP0kkbDgSoc7NkcexvqDZ4SqDo0hLQTcTcFfA1AaTSu+jl3
         6ToyPNXfniK4HABp3/6RDXUvVMEi8ntZ4WFnaBzok7cYWlgKY/Rs5MZqazizLTx8h3Yq
         ip6GdpJYFVtMEvM1vEs87ptIVfmUq05aDiK70h8nT8XlOl2DuRWfwLj7dyTDpEwnnXz5
         NeSNizYsU4QXppJSmL8LZgAmqKFj+iC1i7f81FQp3k9dZKYbv7hieJ7QZzu5h49vWxu1
         hLkMGohlAefZ3A4gZqxjZMR9sKPhB/pR3zM3ESHrYdOde6MFecmuOw5WXVDosNckcogE
         +Igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750446261; x=1751051061;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5V4eEdTfLNGKvwTMu6gpmcWM1DlkOACRK3Iq7ll+QeI=;
        b=oXpdHTXhGgqATxVqxn5dwc/0P+vImeUAj4d7ghv746R/JPjvPS/kjqGXXKZgDdFWLS
         9XysXACqs6/yRfrU4ND8fswCO4OAIR4CqdaW/W0fXvO1P5k5NauwVtrzIdAv7dZ0fCCS
         HMPdIz90w5BZEeqV8S/5iYPljYdkvRmlyyflIWWal3Iy3pBigabDtX811R83wWMHTHyx
         YC1rsHN1HQM3weaPhBBwwYzY43gP/l7KO+F0n0tIYrRXi/nCD6erW4Xyx26NVebPXbzc
         tYRb/O7Jp+WzQQlLgKDQQgz/F3cKI/ikirVe03md64N5GSIB79/QmyXnwXvxQP/9nj+F
         D6LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcMPvbZ8rSPKvskWcg7IYu9orRiIm3lphTiNUTM9psATztb7F6850cqvtzAS+VS/MWtU6Z1SJCISZouTR4WeRw@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9ztf/+XWCGwrtuXaWkAZMS2cpHc3eJEXjQ0YZRTH6OcPZlqZP
	FTQj2VViAveiZZc11b1G3Xhr7J3djpxbnVwvk0+/DmWEt31xEthTP1CComWoOJ7k/a40RDJVILR
	uFgxk5A==
X-Google-Smtp-Source: AGHT+IF1HEaBNlmc+Q9tLzc6oMTF1bn1vxvg37edQgx2B9G2cFY6EZBuAhcrhbwMKilEdjhrXVyorY3eseo=
X-Received: from pjbsr13.prod.google.com ([2002:a17:90b:4e8d:b0:311:8076:14f1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5143:b0:311:fde5:c4c2
 with SMTP id 98e67ed59e1d1-3159d6361damr6100280a91.1.1750446260678; Fri, 20
 Jun 2025 12:04:20 -0700 (PDT)
Date: Fri, 20 Jun 2025 12:04:19 -0700
In-Reply-To: <aFWtB6Vmn9MnfkEi@linux.dev>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-4-seanjc@google.com>
 <86tt4lcgs3.wl-maz@kernel.org> <aErlezuoFJ8u0ue-@google.com>
 <aEyOcJJsys9mm_Xs@linux.dev> <aFWY2LTVIxz5rfhh@google.com> <aFWtB6Vmn9MnfkEi@linux.dev>
Message-ID: <aFWws7h3L-iN52sF@google.com>
Subject: Re: [PATCH v3 02/62] KVM: arm64: WARN if unmapping vLPI fails
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_120422_209530_8A60A72E 
X-CRM114-Status: GOOD (  29.99  )
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

On Fri, Jun 20, 2025, Oliver Upton wrote:
> On Fri, Jun 20, 2025 at 10:22:32AM -0700, Sean Christopherson wrote:
> > On Fri, Jun 13, 2025, Oliver Upton wrote:
> > > On Thu, Jun 12, 2025 at 07:34:35AM -0700, Sean Christopherson wrote:
> > > > On Thu, Jun 12, 2025, Marc Zyngier wrote:
> > > > > But not having an VLPI mapping for an interrupt at the point where we're
> > > > > tearing down the forwarding is pretty benign. IRQs *still* go where they
> > > > > should, and we don't lose anything.
> > > 
> > > The VM may not actually be getting torn down, though. The series of
> > > fixes [*] we took for 6.16 addressed games that VMMs might be playing on
> > > irqbypass for a live VM.
> > > 
> > > [*] https://lore.kernel.org/kvmarm/20250523194722.4066715-1-oliver.upton@linux.dev/
> > > 
> > > > All of those failure scenario seem like warnable offences when KVM thinks it has
> > > > configured the IRQ to be forwarded to a vCPU.
> > > 
> > > I tend to agree here, especially considering how horribly fragile GICv4
> > > has been in some systems. I know of a couple implementations where ITS
> > > command failures and/or unmapped MSIs are fatal for the entire machine.
> > > Debugging them has been a genuine pain in the ass.
> > > 
> > > WARN'ing when state tracking for vLPIs is out of whack would've made it
> > > a little easier.
> > 
> > Marc, does this look and read better?
> > 
> > I'd really, really like to get this sorted out asap, as it's the only thing
> > blocking the series, and I want to get the series into linux-next early next
> > week, before I go OOO for ~10 days.
> 
> Can you just send it out as a standalone patch? It's only tangientally
> related to the truckload of x86 stuff

The issue is that "KVM: Don't WARN if updating IRQ bypass route fails" directly
depends on both this patch and decent chunk of the x86 crud.  I could probably
trim some of the x86 crud by reshuffling patches around, but I can't get rid of
it entirely.

> that I'd rather not pull in the event of conflict resolution.

LOL, why not?  :-)

If I post it as a standalone patch, could you/Marc put it into a stable topic
branch based on kvm/master? (kvm/master now has patch 1, yay!)  Then I can create
a topic branch for this mountain of stuff based on the arm64 topic branch.

