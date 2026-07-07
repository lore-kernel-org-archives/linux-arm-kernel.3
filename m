Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B864C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 17:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjL5lkh4mRywMsy9wb/JKlBVu6SpNdiAeQ5oUXhs6l4=; b=WFzzh3T8Pa7xs4rKnKQQFliFN2
	d8maRfOnSNdcwxoIy3sqn7LqwCEubW65ZumVmEb+04aVkqCYPTf+AjrYsBr4+OWLuUw02D6o1Qjzt
	3cmpv+3wP/Fi4x9SOzuYU4ICYZNKO1X0MDyeCccYMDwhTGjFIr4cGqFZDNXk2qqc/dVLOmj08y1f3
	8mIeMKzdpzEe24eNMRFxcChwQ1C1aWqfVzbgTXEv/lSoEmHWKGgaeO2cNJlQ7ByAz/1j1GSfFBmtr
	k8EWXGuXjF4mxMq8qr3Pfa5T2yml3LGMgrgGN+QGWutIhx8pFfGoqGhYO+nQSTY+o3/sRuAbMA1wT
	vn7VtB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9Lj-0000000FXNF-0Y1a;
	Tue, 07 Jul 2026 17:12:47 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9Lg-0000000FXML-212R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 17:12:45 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso4062296a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 10:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783444363; x=1784049163; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjL5lkh4mRywMsy9wb/JKlBVu6SpNdiAeQ5oUXhs6l4=;
        b=ogWpRn83kmPHhhtbOaxkBVc9cQEEl3y+Y/oYxD1J6Cn9M5Fb0sePE9yh3jRKCkwsEk
         M3PsUCaLkEkvABOJdO2mkyUNID3RW7Hy3YxKZ8FROsyaVyKrtm2rjtzLvrt+gRLMyox7
         Sy/ZHm/gEtZ+xLdFiKLKcliCS/vkB0kFReetoJVF75A/aVjWa1W7oOxjcXXjdDmcRZdl
         8/u9JnTZIW7kU9r47ZghEHrYRzCO0OCGkl7+s131/AifBVc9nt27V19SDGMWz4foGj3x
         jeWejouFcfQwrcJMJcaWfipD8famhXZDfp5owIwNhT60d8IG6P0Nz5JOfrF20q8zqYgo
         y5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783444363; x=1784049163;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjL5lkh4mRywMsy9wb/JKlBVu6SpNdiAeQ5oUXhs6l4=;
        b=Yqv1GxVVL5drN0TKt7N8WJGX42BRbrdYcovuHm53JB/+hX9OO+wmNEQXymc7xUgI+1
         yM1MNctyslMN74JtuSj2aZj+nhtRIHiit7FogO3HnN6yFXIXUrxMARjXbnZNH6jh28v1
         FJvDOqahdTkofvSXpT3yV2yCvl1/NvLh+YGGm7CzKcJ2iqVGg9uwtVvkluhCm4qlMLyf
         S2I/K1mx/G6Mok2i1YEi/E4b+cYBsI3Frq96XIKkUDhs1ycj9xQMNLPbN9RaL03jcwJY
         x/+OrxmILHNvU8ghdlmd7O8dXTcahZsKBARdclX0P/WAuTnNVdxEPL6hAFv4nt0QIud4
         AY9g==
X-Forwarded-Encrypted: i=1; AHgh+RogEr9jR7RDjfvF/sN93IVb18bxjQEreaHlxdiIRirOLFLZBb8D2czfJ/9L9g8I6eWGsPYr4s8334vVhgdTJi8E@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Jclw9Qshi6yZT/6P/E2X2e0jnTHmJ1G+C7EGXOEoZn8X0qEr
	R+NpSyS7Lnn1YovBOz3d/t6y7T5pI0MdJupzwF6BY6f/NyT1w1U+/HOTPX7uhgPmtMiktpz6oYd
	6pHQQPg==
X-Received: from plrs4.prod.google.com ([2002:a17:902:b184:b0:2cc:6ddb:debc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e74a:b0:2bf:7b62:a038
 with SMTP id d9443c01a7336-2ccbe616766mr60096485ad.9.1783444362422; Tue, 07
 Jul 2026 10:12:42 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:12:41 -0700
In-Reply-To: <ak0wSQ1133O7B96D@raptor>
Mime-Version: 1.0
References: <20260702142912.6395-1-alexandru.elisei@arm.com>
 <akxOrMnlNga-vtQv@google.com> <ak0wSQ1133O7B96D@raptor>
Message-ID: <ak0ziUcCXUlDdcla@google.com>
Subject: Re: [RFC PATCH 0/3] KVM: Dirty page logging for guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, david.hildenbrand@arm.com, 
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	fuad.tabba@linux.dev, mark.rutland@arm.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_101244_521632_120B53BB 
X-CRM114-Status: GOOD (  29.72  )
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

On Tue, Jul 07, 2026, Alexandru Elisei wrote:
> Hi Sean,
> 
> On Mon, Jul 06, 2026 at 05:56:12PM -0700, Sean Christopherson wrote:
> > On Thu, Jul 02, 2026, Alexandru Elisei wrote:
> > > The memory represented by guest_memfd-only memslots
> > > (kvm_memslot_is_gmem_only() is true) is shared with userspace, which can
> > > freely mmap it and access it. The only thing that is preventing dirty page
> > > logging for such memslots is that KVM doesn't allow slots backed by
> > > guest_memfd to have their flags changed; they can only be created and
> > > deleted.
> > 
> > Please (publicly) document *why*  you want to add dirty-logging support.  It's
> > all but impossible to review new uAPI without knowing the use case.
> 
> Of course, my mistake, I was so deep in this that I didn't realise that
> there might be different perspectives.
> 
> My thinking was that since guest_memfd created with GUEST_MEMFD_FLAG_MMAP +
> GUEST_MEMFD_FLAG_INIT_SHARED is extremely similar from a userspace point of
> view to using an anonymous file (created with memfd_create()), that
> supporting dirty page logging and migration would be a natural next step
> and would expand the usefulness of guest_memfd. It has nothing to do with
> confidential compute.

Sure, but just because userspace usage *might* be extremely similar, doesn't mean
the logic is technically solid.  There is simply no requirement that guest_memfd
be mmap()-able.  And that's the one of the main selling points of guest_memfd:
the memory doesn't need to be mapped into userspace in order to map it into the
guest.

> As to why I'm working on it now, it's because of an arm64 feature that
> requires that memory remains mapped at stage 2, called Statistical
> Profiling Extension (SPE), similar to Intel's PEBS or AMD's IBS. Exposing
> the feature to a guest requires that memory remains mapped at stage 2
> outside of userspace explicitely unmapping it, and guest_memfd, with the
> patch to ignore the MMU notifiers [1], has this property.  I wanted to
> expand the functionality of guest_memfd to support migration of virtual
> machines when that arm64 feature is exposed to guests.

I'm all for adding dirty logging support for guest_memfd, but for SPE I don't
think relying on guest_memfd always being mapped is a good idea.  guest_memfd
is "pinned" purely because adding support for page migration is (very) low
priority for SNP, TDX, and pKVM.  guest_memfd page migration might play nice
with SPE?  Probably depends on whether KVM is forced to do break-before-make?

And at some point guest_memfd may support userspace-driven swap, but I suppose
we can cross that bridge when we come to it.

From a uABI perspective, forcing userspace to use guest_memfd to get access to
something like SPE isn't ideal.  While I have aspirations of using guest_memfd
much more broadly, I don't know that banking on guest_memfd replacing "everything"
is a winning strategy.

