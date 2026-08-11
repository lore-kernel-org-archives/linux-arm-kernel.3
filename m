Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3B2C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 03:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzLQVcGZ5l2XVUGPdqbb3e7Oajp0X5+/MxQRIPlN0dE=; b=MSXFuAg9ByK8MV2H63aB81eJyj
	vkXg4EI40QQBcA0Zx5Qz8jj/2DKQTwV9a4xRndMjTxADEVraAsqgh04Mo8Cd+CibjV1KHhcS0Of0B
	8f4B6aufQX4Z9NDu6Md9OMkap0vJJe4z23+/k2HtEYpomBHWripNboe+gb9ntknvURJpbWYUWII5i
	ixB2VF4TOHjWnlnNxBMwBTf4GVG9OOyyxEo6RrVskQiyz/aUQW/yIuqjcubD4mHj28YvPs4n16sLo
	2sWMrSmnl08aCrXY7BCiWtqzJhQSh1KjOGrGHv8YwNaGQwo18FhjuW3JCXA/DraT5fCUk3OT6drGe
	QfgGvSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtdVe-0000000DE9l-3Ne9;
	Tue, 11 Aug 2026 03:50:38 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtdVc-0000000DE96-3IPh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 03:50:37 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2d032846c95so33158505ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 20:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786420235; x=1787025035; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UzLQVcGZ5l2XVUGPdqbb3e7Oajp0X5+/MxQRIPlN0dE=;
        b=rFOvE++MQwIdvY6XMkf+GbeAuzX3Im1QSebDmt3hM2Wl6xN2zV0ue8WotPYeqvSHjs
         vYf7mmZr/cAssSFJ/ebkPV8NXuF8r2fraUhqVNtEcNYiusjvWyc2D6FivOeM5et7r/wv
         wB4BOFsPDzx94SfY2+7DxTsmY28eNk19tj4yta3HDv7AYuzRZhBKkhBTBE9fhnxgTej5
         HLarqgVOHQo1Q9gJ3OZT5kXL/hSj5rBryQ2li5qGxsDIVNOU7w798aGGpIAxPPKBEDNY
         Le59+amECi3NhEzXDHicY76a4H9GabANnwCMjzApEWaD64PuJ+nmkHWKjRQE7Du6oGRo
         5eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786420235; x=1787025035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UzLQVcGZ5l2XVUGPdqbb3e7Oajp0X5+/MxQRIPlN0dE=;
        b=peVhHrFn7roYIx5CtfxFpltLjFGb824D8+mHnMuwQ/KBFRub5jKdtdwVauikI1zCiS
         tVwxpl6VhoriQvjkWqW+ku3SeO7rABgkXywnF8ghgoZbtO5geatZl6Rb9Fwg9bFF+y4y
         tk8ojxP6gC1pMJ2rF0RR1r44IB/rhDj0BkUEzhprab7RavXyPl7txN+ClRlR8meHNVzl
         8EoMQYzhwpN169z+nQ//fF7BISd3WHlw1oB6RyLUNK2zc+pnHP+J4/yCwP5q57i3b1ES
         Gyep0U3pTZNyLfKnvR/QwfKPkDXmeOjAcG/Bg8TLfnzrPQsWHBRypvhdscryLSpubwOe
         Jd4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqHxuRdoanOQItCRWTPYXSSKi2APqBFIORQtPVfOCylZZTJ82hJ/iN1IN5hX2AMYNNjSEmkYoxS8xg+1QcNcNiE@lists.infradead.org
X-Gm-Message-State: AOJu0YzEX9vBe85MBXAYQ76HVVCEUkCzdCwea06EnyPZj+dsELU7r7uz
	8oSkvQb2cYDlXnkGDGXR0VlH0aKpxuyfchqwgtbC5czQWgGtBHzVz7G+
X-Gm-Gg: AR+sD13Wl6R/hkoVTZrBj+Xq9NR/BdXwEuQw3ONjD8WkdRL8PloGUdFdy31kk1O9tLM
	fJgDJnXP101dDt8ZwZaEH1f6J7V2felfPU7A9ZYz4A1ZJa33J9yDYZYVwXaL2zoXp7GgzzR0XVc
	lmEahe+Dq+p64EFRtNNe/diWLgMtgF3h0NEXl6MZjOh7JObO3mbmjSlhx/8FZ00un6YrlTyr75M
	G6zpMLbkWvtcZOtPQbHoINYvbpsEwjtnXPV4MYVCwBFsfjh09kTekeAOi3PaoWFYXrDw7Dzh9eC
	/dbECRE+P0w64ugMAsCx9vb275/wg1ojUfNMDnLWdQSywnkmGXndxD9xrm+YEkZH1AwOMqHjduK
	TlIun0JMCET/szjaRAyF/KPSpf3zFSUkR9hZbDJRtWjjyr3DKknOWgy9rmF5yjYo8Af7z9VjzAN
	5e+WDeG5vIbqzMGv859IWYOxNiHVSfOYHFd5vy/+Jqxr//wYaiUcHhst8Xuy4RgG3Vlf2m2pIsE
	0J+mo7mpYBEWRr02eLvMxdEsP8hDIzsiw==
X-Received: by 2002:a17:90b:2541:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-392ec2fc235mr451558a91.4.1786420235511;
        Mon, 10 Aug 2026 20:50:35 -0700 (PDT)
Received: from blinky ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d4050557sm1740457a91.3.2026.08.10.20.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 20:50:34 -0700 (PDT)
Date: Mon, 10 Aug 2026 20:50:31 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ian Rogers <irogers@google.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v8 12/22] RISC-V: perf: Modify the counter discovery
 mechanism
Message-ID: <anqcB37PywQpMhkc@blinky>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-12-7909f863a645@meta.com>
 <178453211938.543975.7016109597042850635.b4-review@b4>
 <ba053fa1-9df5-406b-9f92-df0dcc76ff68@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba053fa1-9df5-406b-9f92-df0dcc76ff68@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_205036_834132_04A20F6C 
X-CRM114-Status: GOOD (  31.69  )
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

On Fri, Aug 07, 2026 at 01:08:31AM -0700, Atish Patra wrote:
> 
> On 7/20/26 12:21 AM, Charlie Jenkins wrote:
> > On Wed, 01 Jul 2026 01:47:00 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> > > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > > index 74d934238821..c20f1e33c65d 100644
> > > --- a/drivers/perf/riscv_pmu_sbi.c
> > > +++ b/drivers/perf/riscv_pmu_sbi.c
> > > @@ -1599,13 +1658,23 @@ static int __init rvpmu_devinit(void)
> > > [ ... skip 15 lines ... ]
> > > +	 * in S-mode via Supervisor Counter delegation.
> > > +	 */
> > > +	if (riscv_isa_extension_available(NULL, SSCCFG) &&
> > > +	    riscv_isa_extension_available(NULL, SMCDELEG) &&
> > > +	    riscv_isa_extension_available(NULL, SSCSRIND))
> > > +		static_branch_enable(&riscv_pmu_cdeleg_available);
> > This needs to not only check that smcdeleg is supported in linux, but
> > also that it is supported in the SBI implementation correct? Trying to
> > boot this on OpenSBI before 6bb6b61c27eb ("lib: sbi: Add support for smcsrind and
> > smcdeleg") will fail on an illegal instruction in
> > rvpmu_deleg_find_ctrs() while trying to access the scountinhibit csr in
> > the patch "RISC-V: perf: Implement supervisor counter delegation
> > support". The proper mstateen bits need to be set for this to work
> > without crashing.
> 
> Yeah. We can do trap/detect to identify if smcdeleg is actually available
> but that is bit ugly.
> The firmware should make sure that it doesn't advertises an ISA extension if
> that is not avaialble
> to S-mode but that model only works for newer firmware.
> 
> if you are running very old firmware with new Qemu/platform, the default ISA
> extension may have
> smcdeleg while older firmware may not even know about it.
> 
> In reality, I am hoping chances of that happening are rare as OpenSBI
> patches have been available
> from a long time and Linux kernel patches are yet to merge. I have not
> addressed this in v9 as I am
> not sure which is the best worst approach yet :)

I had an old opensbi binary laying around and ran into this. This
unfortunately crashes the kernel, but since there is not a good way of
detecting it and newer firmware has handled it for 2 years now, I think
it is acceptable to leave this as-is.

- Charlie

> 
> > 

