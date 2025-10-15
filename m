Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFB9CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4DiBH4L2zFebqfEoDk29CwM1Bc3n2gl1Oz2cKH7YPo=; b=ZSkHqTcQnYdfOgqnfo3rA/57xa
	AEpOoOJU8g5HFtphTN6+VhEWRKL9yJ2gNSOwQP64CRdQ//JQJP5usovyk/0Gc4HEfTbxZ9Jtb9BtY
	H+wvAxij548xQ47Haj9AQGyX5mMR3zseV939YKMBIlOgTpF/teO830TaAX2AbRKnB91gICh+ZxMas
	N1byhMKfLpUMo+wtL2Uum9JGlHh5cReX/iXJMc7flnL36gVT8u3HrVPs4B3P4xaJfkX61iCQ0xHb7
	KAosqGmRwmjYcU3KVayFA98+sSgt8DGStvJp1tYczbZH1KXmnsFb4W7GJF1GH9Dr91keJy9xNAFSM
	8fiw9SuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v927d-00000001oHR-0FXM;
	Wed, 15 Oct 2025 14:04:57 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v927a-00000001oFZ-1LQw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:04:55 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3352a336ee1so21957450a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760537093; x=1761141893; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4DiBH4L2zFebqfEoDk29CwM1Bc3n2gl1Oz2cKH7YPo=;
        b=srwr5nMWfo8sxODBrh/7rIt0S603EUFDe8w8elXwF8WEGU6ju5dc2se9BgPCowpiSR
         qePedg2ZMpHL+0YgTbRAIAL6OL0jBrcsF1zlgWLhJyW3xFvs7zTAV4Eq73GatQnCkL3q
         2ppo7FOPh7h1zHUlGkUKu/APbP+mYCDsVScgmWkzBMFEFpk0LEVBQNFqxqHIfptVtgfu
         1V6NKVVpO4zi3KKBLAYh2OaRjNG6door8q6Yrg7aiy3FiqHrNG7mEQXbGgx7FwvG17+J
         d0JlFIL6Rojn1fOH+dK3avhcd1GsCF708vARZFG1NfGk0Wy20/SApcsJ4Bwqcr+ffEYn
         eDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760537093; x=1761141893;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4DiBH4L2zFebqfEoDk29CwM1Bc3n2gl1Oz2cKH7YPo=;
        b=rWZXNxdeY1Mk8jLdP/6n1K0IFymnbP7SkwT0Z7Da9TsVX1PuDdh8x9IyBSzw7ACSa8
         BMF3UmZhZ5cAdD90M9kJIyiAJix81wNZb3paSDuvXzqq+gOi+ImMtWyJRsGRFmfEc8LS
         hSkmZ6355zQvkWATz4bwmIoQ4aYelZqRV7PKB8/KH/64c1uNHV9U9AdVJrpWhotn2Eb1
         pLifv1JsHihno8EYJ94nOqiQ0PdobSF8gxVwdUJ+D45MS9UxZ+DyVDh3xGjA+BnT7DyH
         3qsa2/u5LB2JUF9+lYQw47yOVw4Bw6HgB2EEOQjkQ4zmKW/hs5D0JJhKIroCX5eYYpQJ
         MB0g==
X-Forwarded-Encrypted: i=1; AJvYcCVg1nL1fN7LBgf0h14cx1ZO63KAWoNYyCEIXnLzTg5QGXlRVYKywMMCgkkEuuMDzakxSc3OTl4M5Sh5zIDHAgzn@lists.infradead.org
X-Gm-Message-State: AOJu0YxuPL7ejYosrkgNBWIKeuGw5VoMTYya0afF1w9h4LAsX7ZI5Jp/
	Pc8rpi/AfIf+tIhDtb6i4NhBstCESPxdtZS6dPD4cb9fpOhoM6OuQhoykVD37POxGZdJaf835Ia
	zL8G3XA==
X-Google-Smtp-Source: AGHT+IE1+td5soWF05Hoahm6Hvpema7mHvLUqdyQlzOJZyQi5z9/sZLyyXRWNTOg3FlzXOK9GExt35QwxNQ=
X-Received: from pjbkx5.prod.google.com ([2002:a17:90b:2285:b0:327:c20a:364])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3ec4:b0:32e:d16c:a8c6
 with SMTP id 98e67ed59e1d1-33b5111bd79mr42350202a91.16.1760537092984; Wed, 15
 Oct 2025 07:04:52 -0700 (PDT)
Date: Wed, 15 Oct 2025 07:04:51 -0700
In-Reply-To: <81af1654-5cb1-405a-bd42-670058dd22b6@redhat.com>
Mime-Version: 1.0
References: <20251014122857.1250976-1-maz@kernel.org> <81af1654-5cb1-405a-bd42-670058dd22b6@redhat.com>
Message-ID: <aO-qA0oz5PyqPtGj@google.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 6.18, take #1
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jan Kotas <jank@cadence.com>, Joey Gouly <joey.gouly@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Osama Abdelkader <osama.abdelkader@gmail.com>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Sebastian Ott <sebott@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Zenghui Yu <zenghui.yu@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_070454_359495_BD0EB258 
X-CRM114-Status: GOOD (  24.27  )
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

On Wed, Oct 15, 2025, Paolo Bonzini wrote:
> On 10/14/25 14:28, Marc Zyngier wrote:
> > You will notice that, just like I did with the main pull request, I'm
> > adding message-ids to the tag instead of putting them into the
> > individual patches. It looks rubbish, but I don't have a good
> > alternative, and I'm not prepared to remove provenance information
> > from the stuff I ferry upstream.
> > 
> > I'd welcome any guidance that would make things suck less for people
> > reporting bugs and backporting stuff, despite the "Link: is bad"
> > nonsense. Preferably something that we can adopt across architectures
> > supporting KVM.
> Because you're already unusually meticulous in tracking tags, I'm going to
> say whatever floats your boat.  If you want to add it to each patch, I'm
> certainly not going to be the one to complain, and/or to make your life
> harder, because of something like "Link".
> 
> Personally I think that there's a different between adding something
> mindlessly as a cargo cult, and adding it *unconditionally*.  Link is the
> latter, it's unconditional because it may be needed *later*.  In some cases
> it may not be strictly necessary (for example the tip bot used it to send
> replies, and that is served by notes just fine), but overall I don't get the
> hate either.
> 
> In fact, I'm very adamant about *needing* Link trailers for each patch in
> the RISC-V pull requests, which are the ones I look at most closely since
> the code is still in relative infancy.

FWIW, adding Link to every commit is a hill I'll die on (and Paolo has confirmed
that he doesn't object), it's simply far too valuable.  And as Paolo has mentioned
off-list, I don't think Linus will ever notice, so long as we don't send him
garbage and thus give him cause to see what lies behind the Link.

