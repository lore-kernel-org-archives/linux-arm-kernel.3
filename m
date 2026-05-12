Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F509CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMZtDzw9AgLdaSSTv8chWku4pEUpPXtbY7dC10A82r8=; b=z64hpQnOVRgbNyQeekKGF+fkzG
	EqYXgQnc2FZB7CLybEAivXOZjLB5LLJgi6ywffKiTfq6L0Elrwfaytzmdufni5vRE4eAMl6O3tGws
	KUwq3CSDtbMpVeTRUULdSyHXEC/R9NBOxIYsyHrWrDT6W6l866aL+A57ZCPaFxjZ+vwCVEV7fLQkw
	L1/Wh5/31SUBWzjKSkBuycGD17S3EZ4wUXuyOy9f0NnX8rRyZUkUyy+K8MIdHQ/w8lolE2LbRNhqx
	vtr9sk2vEj+3e557MIDoKvRrmEq5kOeFTw/9nTqIOHoAujpnWH+cYXGAbXVePCwEc/1EhgoWMXuas
	JSMqeKeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoRz-0000000H6Q0-0niF;
	Tue, 12 May 2026 14:51:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoRv-0000000H6OK-3z0b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778597465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iMZtDzw9AgLdaSSTv8chWku4pEUpPXtbY7dC10A82r8=;
	b=hZXHOXgL/lx9WRYyvCqAa2Uwb7hIpKR9DZaQufXEt9jck77hUB8b6S+BbfsiNT3fg3Rd5E
	TO+WoRDXk/s+l4EZzop484QHGO4a6FwjqaWkfLLfi9ixZYfSjnfD2dlVJ96DmQYwGO0EwW
	jk1qUBEpfPfqldyBJQgc9uZGqEQMaYs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-1rQpwALqNamtlhlQxTPtDg-1; Tue, 12 May 2026 10:51:03 -0400
X-MC-Unique: 1rQpwALqNamtlhlQxTPtDg-1
X-Mimecast-MFC-AGG-ID: 1rQpwALqNamtlhlQxTPtDg_1778597463
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ae752c5273so119477696d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 07:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778597463; x=1779202263;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iMZtDzw9AgLdaSSTv8chWku4pEUpPXtbY7dC10A82r8=;
        b=d/CI2aJIusG0hkdzRZ9gerxJB4kXtlwQc2WutcMzo0PNssyYteqOvE26ieSajdgW3b
         ZmBNAuuXC15MrP8k2VafHCfdc+xF6P3GDLYKV+jWY4lu63juDBZeJzhn/WucBz7KimwU
         7Q81p2IfAGhlQQGtwqYNHy7kp6O5IX4xU8k+uLXwfm1HCFwG5iHlEk9h3i1LLKXCfdcP
         AJ+cJ93upwzzae+m8GdwriQS9X9uXiT1JZMeieGE21l3XxgJSNI4f0a8CWbrPogWkDvh
         KlsP7ZvOrOkD/rXVllmS/fzZvT/cWIEGpKFtVv/FpOh64Q8YcCTFkKelOwLMjeiTkA8c
         1p+A==
X-Forwarded-Encrypted: i=1; AFNElJ865cpZYGIDAdj3f/JSB9tVM4NJo4q8JfHpv8o1IOePMT+InGnSmOgaNVnAj6f60ePECeXf0r+MS4wmcxHMRjzH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx43hS/Cm4HHOuhpY+xztLy3L0P1SpXJ0pOlIaMjU78m/ZzIRRt
	+Qx6O3AiOwk9xBkY/nrFkqUk577N/x8FHCkY53CawI1NMWpXgkspiIgeoYM8RNw8PdCRdmlJ2y3
	jz81kCM3dXgJ/VtdKS6GBhgegJ58zr9x5RduyoyMRbkEeG+YpT9KkA9O8p7i/5b+U/KAT9SF1e0
	ui
X-Gm-Gg: Acq92OEozwJfxtpAMSJ7q/NnRGrmcYxZ2QBOTHO2QbH+nTHbhwWJwj65mAPCdkM0K9+
	bgAgCOmj3nXlvEGhpdprgq5pcvVGsX3xCH/lfATs/qu8Q7xmvEuBn2wRPyW6FU+YrroHmGaxmFP
	ba1uoYPshmX4qD1eQuFzQhheUKWnJdjuCaNcRZOMgVl19ukv8w/CHynHXVDWjDuGzUgUta4cs3t
	eErHAf8lazJuUkBGk4dYhY5a5/d3tHFK0ZBfmGKuu38ejIALlVwZHHGFXFz6bxEakLGcdNBBd2+
	QxhXegTJ1jmjaB/QA44lFhgQM91AUZDIJe675O6hrYZlSyZHoVHV0gjIjrQEKgIMhlmT+jt2sEG
	IzfZUra3bKgLDXGkPQiXcb3g9YxbWYPdWhOX7BLIH7seHpWcU1452MyRC
X-Received: by 2002:a05:6214:55c8:b0:8be:7779:d1b1 with SMTP id 6a1803df08f44-8c6636b541amr45095226d6.30.1778597462927;
        Tue, 12 May 2026 07:51:02 -0700 (PDT)
X-Received: by 2002:a05:6214:55c8:b0:8be:7779:d1b1 with SMTP id 6a1803df08f44-8c6636b541amr45094676d6.30.1778597462333;
        Tue, 12 May 2026 07:51:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c7e2e5sm126008606d6.34.2026.05.12.07.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:51:01 -0700 (PDT)
Date: Tue, 12 May 2026 10:51:00 -0400
From: Brian Masney <bmasney@redhat.com>
To: Nishanth Menon <nm@ti.com>
Cc: a-christidis@ti.com, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Randolph Sapp <rs@ti.com>
Subject: Re: [PATCH v2] clk: keystone: don't cache clock rate
Message-ID: <agM-VB-ToGFNphfu@redhat.com>
References: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
 <agHpYnkCgGfZp2-E@redhat.com>
 <20260512104848.4axgjeto6i7ejvli@retorted>
MIME-Version: 1.0
In-Reply-To: <20260512104848.4axgjeto6i7ejvli@retorted>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8DlrYhbGAmgThr2Lwz64J_iXak7sObb9kl63SGq2P5E_1778597463
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_075108_060226_01CBB18A 
X-CRM114-Status: GOOD (  20.99  )
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

Hi Nishanth,

On Tue, May 12, 2026 at 05:48:48AM -0500, Nishanth Menon wrote:
> On 10:36-20260511, Brian Masney wrote:
> > On Thu, May 07, 2026 at 11:09:34AM -0500, a-christidis@ti.com wrote:
> > > From: Michael Walle <mwalle@kernel.org>
> > > 
> > > The TISCI firmware will return 0 if the clock or consumer is not
> > > enabled although there is a stored value in the firmware. IOW a call to
> > > set rate will work but at get rate will always return 0 if the clock is
> > > disabled.
> > > The clk framework will try to cache the clock rate when it's requested
> > > by a consumer. If the clock or consumer is not enabled at that point,
> > > the cached value is 0, which is wrong. Thus, disable the cache
> > > altogether.
> > > 
> > > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > > Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> > > Reviewed-by: Randolph Sapp <rs@ti.com>
> > > Reviewed-by: Nishanth Menon <nm@ti.com>
> > > Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> > 
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
> > 
> 
> Brian,
> 
> Could you clarify if I need to take it via my tree to arnd or if this
> patch will go via the clk tree?

Sorry, I'm not sure what Stephen prefers here. An argument could be made
for either approach. I would just go with whatever you have done in the
past.

Brian


