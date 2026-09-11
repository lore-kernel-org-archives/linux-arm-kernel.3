Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1BEC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35qTFGciq12kEJU+EMJ4woELZzEj6I4YMtoPAd4aNAQ=; b=bIJNgVx2EcT7vyH0389cbZ4Fhv
	s1gDLM8Cq8XydVI5lJnkaJFaBBhfIMP32LhkdA2GCBYlcTzii4CVvXF27R7cg8xlIfKiKhvOvw45T
	Rw7njT296oNeqw6WhGqYoTxcLlQF6Navh6LRAGKykd7l6G8f6zKk2B9UTIF/3rCW2NbNt8ordX7pc
	aSxmXn/EzoTDw7k1Tz9IiEmIi81oDuV3sa8FQBN3EjQOXmq6/wL4C3hlc8oGFM1Luc7iIHTEcLW27
	l0DDS2fi+eHqA+3SdAUX12ZMHteMycpEtejnkY+33tJUUqIs/oI+/BDRA7kWmNY7mN/HpHcip4BI5
	jwgXJHHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51Ym-0000000Gmcs-1mWz;
	Fri, 11 Sep 2026 13:44:56 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51Yj-0000000GmZi-0FFH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:44:55 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so1114119a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134291; x=1789739091; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35qTFGciq12kEJU+EMJ4woELZzEj6I4YMtoPAd4aNAQ=;
        b=OwvzWeWs4bAfAC2UbV3pRD9EkBvM4zmQsCQodxTxNeL9716y16NQKjiPFR2YKGuBus
         XEu1gq9/lTNY3T1ndpYYtT0OR1Dp8HY1xjLeQnP8KhJGGPYpLTk5tmRlGxA5w+yS0BVA
         JX7tRiXffPG2I/mCuo+NA3pnhU9QFlwop2Gbop8w2/r7nHLMLE11WMsh3HYc6B6pBBZX
         JsGpv4qwiQ3+2AWoNiHBHtc3v3cf9eLDRZFL05tsyeTqAc70hcA7LVjXQ5FyYslUH9GE
         g853OLEfo4PojMZK1KrfJBjgN67EGYty50OGbWgbrsAgDfLE1oenCWJf+iMYh/4p8Nt5
         yvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134291; x=1789739091;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35qTFGciq12kEJU+EMJ4woELZzEj6I4YMtoPAd4aNAQ=;
        b=O3zseEp3MfB3WmeyFg99U7k0FPQUqq6fC4uEpOWBUC80649WfbNniZj6d4FbiW3ewM
         17b5rUO++OYg05/zPwak0av0l+S1EW49CzcAV/ADz+FXiWF9Q8sCD6CAKc0eNcU0xff2
         9XwIf4Sv5b1Vg2Eew8CPIDP2YRWATTZzO6CKEJJpZ141JqHQd6BxRsGxZS8VuSDbqVPn
         Y3uJ3U+2xvRFhFOMHCxVTp8quIwFSr5bbNg47Xy188CKHKWoxxTs+jSqzQ0h6G/dAcpZ
         L9lt/MmaypLd2UbkqBUIuEJjAB1KP1BbVVXiUrCaBiqxMaIOZTAR8bzbHeMYNJbWr0Ux
         3+KA==
X-Forwarded-Encrypted: i=1; AKwUvBwmJFySjRZ8Eyl604Dubmip8l5j1PaXdUfUksrxHbD8c+3x+8unpXFnDStMnPbY0aw3x/1KZFRuoDwrJ6jtiAwn@lists.infradead.org
X-Gm-Message-State: AFuF++nZErJHabbqAm2AZR6TdorHvi7dMiqMoVDaXLVrTogMZhQODeL6
	Kr+m4/g4fkPz/TTWa7uNg0uAswx0z14gO6FCn1y9tLsekbrpdkLkeabJKVvP4X5qG9WIjGobY5b
	evUGZig==
X-Received: from pgjj10.prod.google.com ([2002:a63:230a:0:b0:cc4:5907:21e9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:b08d:b0:3c6:61b9:917c
 with SMTP id adf61e73a8af0-3daed1fd3cfmr8633653637.11.1789134291123; Fri, 11
 Sep 2026 06:44:51 -0700 (PDT)
Date: Fri, 11 Sep 2026 06:44:50 -0700
In-Reply-To: <20260910225728.GB857650@nvidia.com>
Mime-Version: 1.0
References: <aptFFYqcSiBdMLE8@google.com> <20260905012403.GX4157646@nvidia.com>
 <aqIAtOoew-_6jw29@google.com> <20260910143448.GD3968357@nvidia.com>
 <aqLOWkuVKccR-I7W@google.com> <20260910171210.GF3968357@nvidia.com>
 <aqMgjXfTJ8u3n7Kj@google.com> <20260910221832.GH3968357@nvidia.com>
 <aqMyXE-fD-UN6w5L@google.com> <20260910225728.GB857650@nvidia.com>
Message-ID: <aqQF0gz3Q2weDyEd@google.com>
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
X-CRM114-CacheID: sfid-20260911_064453_103699_0AD00469 
X-CRM114-Status: GOOD (  20.39  )
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

On Thu, Sep 10, 2026, Jason Gunthorpe wrote:
> On Thu, Sep 10, 2026 at 03:42:36PM -0700, Sean Christopherson wrote:
> > On Thu, Sep 10, 2026, Jason Gunthorpe wrote:
> > > Sean's initial email was asking for strict never-break ABI compatability
> > > rules on top, and that is what I've been reacting to.
> > 
> > No, I was never asking for that.  I think we just have a different interpretation
> > of ABI, or rather are talking about different pieces of ABI.
> > 
> > I am still asking for never-break serialization format compatibility, i.e. the
> > more literal save/restore ABI.  I'm not asking for full backwards/forwards
> > compatibility across all kernels version, i.e. the higher level "kernel" ABI.
> > 
> > To phrase things differently: I am a-ok if kernels are inherently incompatible
> > because they fundamentally operate differently and/or support different features.
> > I am not ok if we end up with incompatible kernels because the save/restore
> > interfaces and payloads are poorly designed, lack abstraction, etc.  
> 
> I can more agree with this, it is mostly what I thought we'd end up
> doing anyhow with version numbers and growing the structs not
> replacing them.
> 
> So you still end up with a version label (string I guess?) because we
> can break it from time to time, 
   
Why bother with a label/string?  I don't understand what it buys us; I see only
pain.  Make the features discoverable and punt on all of the "is this pile of
insanity my company has created compatible with this other pile of insanity?" to
layers above the kernel.

IMO, trying to capture compatibility in a version string is doomed to fail.  To
be useful, the version would have to be extremely sensitive to changes, otherwise
userspace will have to do its own compatibility analysis/checks anyways.  And at
that point, a verson string will be too restrictive, e.g. will mismatch due to
changes in features the deployment isn't using.

> just the version should have the feature mechanism layered under it? I'm fine
> with that
> 
> Jason

