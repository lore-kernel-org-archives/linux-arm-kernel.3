Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F809CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 09:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70zvkE3bB7cmZPuDeaKwadOTmazE00TZ9JEFPyMgvYg=; b=liQOyds9pTTThxQ4m+zwZGrNFg
	eYM6cw6d5EDZDaVg2subkn3EYUNXTX4EaKt18W+KYe9tOWx4g41icM1kv9+QWf+OKAAoZCCZqmaUl
	aSO3DlpfSmDX/e84lgDihDYEbREstxzrr8TzxdCu30uB40KBu+a7AqGgWseQVMGXKC9N5zpWLoG2d
	daLDQCVFd03RYQeGTKXIGbA7mZUIP2ivt4nlAufedJ9oULRZVBp1Qr7xhMKJbC5jUfwkvwb8HXv71
	Jv1pBI7uRM7oIA+sf7g9aLAizT+GIaYMjmmCWqZsB8rqd8ZoCSEv/rK6gsY70uDTCPPrECeen3IFi
	oXPGdRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvC2N-0000000AVkc-1kwo;
	Sun, 07 Sep 2025 09:50:19 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBxX-0000000AU3I-38ny
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 09:45:21 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-54492cc6eb1so2409006e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 02:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1757238315; x=1757843115; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=70zvkE3bB7cmZPuDeaKwadOTmazE00TZ9JEFPyMgvYg=;
        b=TK6ynMb2gNMhQBMuv2FXm4qJX/UfndXbmzty+U6ApzOYlwTAvD5IXcVWSzTDO870YI
         kGosZ2JBb/j+1SakBZ6Sr48BIvXeESk4h1uPhJWuLjGACVGVYCZ0Jy/UEB1ObxQbCKGk
         ByRBQi8ekj9pfCYCnYsm9Ecv8tOh6VP7uxAYZBo3t4cyL6gilsJCHZzHYcMbnPqvJt1b
         dHwPjHdLnY6TgQAdaud/2BUACQ97g2V2tdmWtyY9168ZdVX6kH1rU2v0FzqScXIQDD4y
         B3Zov8Q+NE7yOp/8WdDOOUWDR7wgVcxf1vO94FlMv+8RfAKLzO9OCQJ0pPSgnSQShQTa
         nuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757238315; x=1757843115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70zvkE3bB7cmZPuDeaKwadOTmazE00TZ9JEFPyMgvYg=;
        b=LmYdz20kvEDTaMDymvDmNohR0DyhgLpg0AOvJ8pm1UfceL0I9dViNQbnfGwOHSRxK7
         VMw+WazHHP1RYCAJrREhxu4y0lT5gfQdr4fOxcX2qyo2lnRa+yIw8PVDlDX90pgOOQov
         2GK1oLMMxzxumAQ3f9vEpHR8yRcVLaZw3r2qR1ejfnKri8rFxvbbLvO33e2QmL9aIBVU
         QG+ViqVUcIPIhud4M27OIjZn11pxFFNKSrIDsjH21/esa/KcSgfTI1skfx7SQi3GzbwS
         AA5HWKA2Pn4DK3XgMPa0lJDQRvSWeSe+IQLYwXnIlpftyBThypkSg3YFH0xt/b5I0LSh
         Z7QQ==
X-Gm-Message-State: AOJu0YwKhmEYRRjXx4s0+pdEALA3o06PZ1esPCA0vNndjkHANiofehtt
	fuVgYaqhoh2Y8YYsH5/EvPjuF8ns+hUJYXf75o9Gk8tM5s85d2nCoow+873uvH6ZslHcdod+cEd
	riJ9Pu+Ug8jqLRoRbsIKIqI/+s7dovnDN6Kx4kqNQjVPdtcdSayk4wNm9/J/JpA1R7ca7yBl65+
	I5Dko2vu3+qQ==
X-Gm-Gg: ASbGncsG9bt2uCNNL4jyyM0jrXKI0VL8R4U2LmU/pUSuKFDe3a8qKREjVUYoAMdTUst
	EAsgimCAa9KGdc0mHcY5NqPAi5oHU7jbFean+hw/s46Wf1JlgONJwmwUGH90fkHNQx18syOMWdX
	9CKkxZKBkP6vF/sLCA3wnnLK9qB4nCZmBH4HBRuBfVJlsOGGXInbX4+2YreFLGIwl9YQ6Mqt6Pl
	6paYn124kEitO4ItLwYV9v4lvZATnTZoT2gQWM1qv4wwROjzFcYza1gDhyiAFDlW8DJD0n2PrSM
	wtpzNufZclij4x0NI6SfoImea3anJAYeMfprIluiSah8YR8I1pE04g/yjG9t8O/8YrUHHoteCr+
	G3YU7Rav5m0hrQ++rjDzMI4/UGTL7HilNZgg6QNv3wunMODqOHJUu1mNDNFljBOTF9bLb
X-Google-Smtp-Source: AGHT+IFt1zERczq0Nc2LpsPzQKax8feeqQIGI16X5GC5DFj+Af0FRNlixEjUAXqLaAAS2kFETPcSkQ==
X-Received: by 2002:a17:90b:1802:b0:32b:6820:6509 with SMTP id 98e67ed59e1d1-32d43f070e2mr5859703a91.9.1757237836296;
        Sun, 07 Sep 2025 02:37:16 -0700 (PDT)
Received: from zenbook (36-228-15-28.dynamic-ip.hinet.net. [36.228.15.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da8e5ad5sm27768393a91.18.2025.09.07.02.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 02:37:15 -0700 (PDT)
Date: Sun, 7 Sep 2025 17:39:53 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] KVM: arm64: nv: Allow shadow stage 2 read fault
Message-ID: <hzif6tde7p5q3fyrmu5got25rwuiuea5pzbf2ubbqdfc5uof4y@7waunf3d65fo>
References: <20250822031853.2007437-1-r09922117@csie.ntu.edu.tw>
 <87a53rk83s.wl-maz@kernel.org>
 <djypsyratk63ovzv3flzb2tmunqtcoryzserwhsaaq5nuogsrx@u3uuwynnafbj>
 <864itme8k1.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864itme8k1.wl-maz@kernel.org>
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_024519_788123_BE869A84 
X-CRM114-Status: GOOD (  35.34  )
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

On Mon, Sep 01, 2025 at 12:06:22PM +0100, Marc Zyngier wrote:
> On Tue, 26 Aug 2025 14:49:27 +0100,
> Wei-Lin Chang <r09922117@csie.ntu.edu.tw> wrote:
> > 
> > Hi Marc,
> > 
> > On Fri, Aug 22, 2025 at 10:40:07AM +0100, Marc Zyngier wrote:
> > >
> > > This would imply taking the guest's S2 permission at face value, and
> > > only drop W permission when the memslot is RO -- you'd then need to
> > > keep track of the original W bit somewhere. And that's where things
> > > become much harder, because KVM can decide to remap arbitrary ranges
> > > of IPA space as RO, which implies we should track the W bit at all
> > > times, most likely as one of the SW bits in the PTE.
> > 
> > But sorry, I struggle to understand this paragraph after reading it many
> > times, probably my experience with the code isn't enough for me to make
> > the connection. Why are we talking about the W bit suddenly?
> > If you don't mind, can you reword what's discussed here?
> > I only very vaguely get that there will be 2 W bits, one from what L1 set,
> > and one from the L0 memslot, if I didn't completely miss the point..
> 
> Sorry, I quickly drifted into something related.
> 
> My take on this category of problems is that we're better off always
> using the permissions that the guest gives us. This is the scheme that
> we have adopted with VNCR. It means we wouldn't have to rewalk the
> guest S2 on permission fault, since we'd be guaranteed to have the
> latest update.

Ah yes I get it now! Make the shadow S2 more TLB-like and use it to
dictate our actions instead of looking for info in the guest S2 by
rewalking it.

> 
> However, S2 management implies that a S2 mapping can be made read-only
> at any point (dirty log, for example). Which means that on a
> permission fault, you'd need to find out whether the page is R/O
> because the guest said so, or because the host decided to make it so.
> 
> Which means that somehow you need to work out why you have taken a
> permission fault. You can either
> 
> - rewalk the guest S2 as if you missed in the TLB
> - or keep a copy of the W bit in the shadow SW
> 

Makes sense. Yes with this we'll have to distinguish the reason of the fault.

> > > We'll need exactly that if we ever want to implement the
> > > Hardware-managed Dirty Bit, but I have the feeling we need an actual
> > > design for this, and not a quick hack. Your approach is therefore the
> > > correct one for the time being.
> 
> And that's why I brought this up: to support HD in the guest S2, we
> need to mark the full shadow S2 as R/O, and update the guest S2 on the
> back of that fault.

Got it! Thanks for helping me understand this!

Thanks,
Wei-Lin Chang

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

