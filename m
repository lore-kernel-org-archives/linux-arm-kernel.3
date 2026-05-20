Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F07CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYOJ9GFvOFI2LL52SOYreIR2jRncnDyPiCnAUZkvQc4=; b=VjH/vEPuAHIyDaRQpqg8PfEdya
	JWXmjzOySSRbR3Ne8ymHwJyc87BpFqF4LirRgdZGOEYuCbIopAp6IyVRTA/lk0LV5bftGdNYZ1Sd5
	OUn1cltxDoOpPCv6uGaPZKtOVVhPrKVO9t44FdeCps1hTftxFgeImEebVzGNgaokzN5tpteXuvswJ
	lEgljiGOhh66CZ8YQ/AY7GHt1FpMTD8Nu2Vba6zbvR7RBirM8LLtQwZKE3UmnfSLsRE83bfhCXTdW
	2NB2RDhdoYOzoDpu9wuAbbh7OSDIP3kIFormkpololrcxi9BNpGS1OlxsBRTY/hexobR9EvW7DDhE
	PFNICRug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPb9B-00000003lf3-21XJ;
	Wed, 20 May 2026 07:15:17 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPb96-00000003lcz-22XK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:15:15 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so4835822e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 00:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779261308; x=1779866108; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tYOJ9GFvOFI2LL52SOYreIR2jRncnDyPiCnAUZkvQc4=;
        b=cicIYQnXo30Wh81SfQdesHFtDUxmN3VTwRZ0wi3/axNrxYT1V40avrnkj9UizsqfK8
         vTLHw1cS9KQs+uWdPFD55AEbMgceenRMlquh59TE+GLdymc4ryES1/x4FouhyAb4rIac
         7+cTydm9GD7JvmRxxp1tyQ97XLIIYJ+a6FeRvJS67KvbieJ5Agsc6LnBZSWdXv4ajdBT
         Pz6MGeGfRbtUQdZ56YwnkzrYGNrBrSnDms/eHqAAZ2FcVrLzynAafqEVbIwD6tNDxV8r
         NWyHsoZD5H7E1fWwu8Jnj0/C5arGVYWCypMIm4PRKNtIbiu1CWc8eF/cb5blbQBAUAPg
         WeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779261308; x=1779866108;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tYOJ9GFvOFI2LL52SOYreIR2jRncnDyPiCnAUZkvQc4=;
        b=ETzZGdwJI0059SO6tWNIlaabMr7F3L89JZN7UFx5FYXijEO+httU2WxH2J6eEZt4fY
         HN0SUtCxhQUGJUPPBaxSlWOEPrW68+XN8hRPK7VlYyMxNLR4tpD5xmeDtah8AnNyjhV8
         MliWmkSqgm9ovG2eAABZj8xId5WSgtK9rO9EI2+yeDNso60drVqE5Fu0cm6Xu8z7yoNb
         8d6xqvn1lOnMyrNtDVTroDcyzhfp3hn6MAzXzpdPWu7iEkcaUP36pTFavGKoOpURWiBr
         kL4fZKhilV7kC3Iu8hVW5Tx7UXbjNWhh0xFaU7u99ejLYpNymHYga+M32lKhlZUvMTZt
         hjQw==
X-Forwarded-Encrypted: i=1; AFNElJ/t9leP8bPfZDDwhum2TlJePd275846NksOEeS4LYdvL0sMs5gYDaNyTd+XxtinG3iaq8sqHA8Ux0c7WxcTaSTV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1mq//qf7jF8F11+0gcky7VYAF1MWZyMGWeZmJgAQj8/+BHF9L
	IMzqawgUOeCZ+D9IEaHfxl0rYnuuHbNvzIMYPAWbWeYR0JmgsBMlrRC1
X-Gm-Gg: Acq92OFYJCGJeanYHt5lGfDtR0eXasRCiRfuZa0A8Ed/K0GUp7Iq5ArDi77pNRrCC2w
	yqNbcr7xVoVGKqFTkb4s+73x6adWtTX8xfqk9uhg51lQ84DSJu5u4WyBoX/4gOzXWfidorE58AI
	wih5WjAIFbbBgOTnSoJ7PzM80vSxeBsoV2TuLdqU3n/4+NW/wBpYg7MNOCH5Xii2agxR6a7XLrV
	Jzrr7RNvuheFwuBjBpPI8idJ9s6JgPvbLh4HX9FKH1XJefqFPodsYqYOU3LT33bBvw2dY18nFOO
	MNs4KAOXggXR41tvYY4QqNUYbkKLVFWiW9isVsJfcsWqzTCl/uadsEU31sRFJhgLyiLGPWMZVqi
	nz6DQM7QzZdN0pOXlV8EtrWn516nRKAkZFDc539hsOftkqVAkt3fiZumCmcGrVpitg771PdNA1w
	k=
X-Received: by 2002:a05:6512:695:b0:5a8:f984:1541 with SMTP id 2adb3069b0e04-5aa0e7640c7mr6248441e87.37.1779261307775;
        Wed, 20 May 2026 00:15:07 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c944sm4837460e87.6.2026.05.20.00.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:15:07 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 20 May 2026 09:15:05 +0200
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, urezki@gmail.com, baohua@kernel.org,
	Xueyuan.chen21@gmail.com, dev.jain@arm.com, rppt@kernel.org,
	david@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com,
	ajd@linux.ibm.com, linux-kernel@vger.kernel.org,
	Wen Jiang <jiangwen6@xiaomi.com>
Subject: Re: [PATCH v2 0/7] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
Message-ID: <ag1feQwK38vd9i72@milan>
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
 <20260519131738.11a78ba88e1be28ba5cb26eb@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519131738.11a78ba88e1be28ba5cb26eb@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_001512_549070_694A46B3 
X-CRM114-Status: GOOD (  15.99  )
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

On Tue, May 19, 2026 at 01:17:38PM -0700, Andrew Morton wrote:
> On Thu, 14 May 2026 17:41:01 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
> 
> > This patchset accelerates ioremap, vmalloc, and vmap when the memory
> > is physically fully or partially contiguous.
> > 
> > ...
> > 
> > On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
> > the performance CPUfreq policy enabled, benchmark results:
> > 
> > * ioremap(1 MB): 1.35× faster (3407 ns -> 2526 ns)
> > * vmalloc(1 MB) mapping time (excluding allocation) with
> >   VM_ALLOW_HUGE_VMAP: 1.42× faster (5.00 us -> 3.53us)
> > * vmap(100MB) with order-8 pages: 8.3× faster (1235 us -> 149 us)
> 
> Nice.
> 
> AI review found a bunch of things to ask about:
> 	https://sashiko.dev/#/patchset/20260514094108.2016201-1-jiangwen6@xiaomi.com
> 
> It doesn't appear that you'll be getting any more review on this
> series, so please check the above questions and resend?
> 
Actually i keep an eye on it and i have done some stability testing.
So, just need some time. Fixing AI sounds good.

--
Uladzislau Rezki

