Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDF8CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 07:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6Ap3YJUEuoJTFxCbawQ11i/jSYqTs+DIopPqv2NeZw=; b=KX86yNGOxf2FDb3abjp1+ddDmh
	Xhw52rr7bTeWHpDlc9rcr5ECa4N/icd2d++KZrbs9LzyPMjYr0WY6FxEOgUEOmGCBhB4kGdpF2/rf
	S2MVbMr49XbGtPK1gtSMIMCPN2FeE5gaXL1AXi1uFE2Pwz3xSt90CyKX1z/UyH1Hk1y13ZsFyd2pW
	gydQ/q7ziaGPAGwsgkB84pClOABCMZdleD+RCBApwoCb2UuU9IGZWF73kfWhVgm89s63zbQOvrBMK
	kFJtg2VCT98rwWydYs4DJt3x6duYBcLSC8BZSmRNCFEmdxWko5kJaVHS70LbVUKUUPxESniK6J9Dj
	HS0VG0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbv8F-00000005nOr-1z6Q;
	Tue, 23 Jun 2026 07:01:15 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbv8C-00000005nOD-3qPZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 07:01:14 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-139a71baa35so8553383c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782198072; x=1782802872; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d6Ap3YJUEuoJTFxCbawQ11i/jSYqTs+DIopPqv2NeZw=;
        b=MhASbAvlY+n/3oI65P9fNY7EkQ/CdjDF/baW1akH7jO5Bt/VsCinI9luMZvE0ZHEVU
         dv947pCAMVNic9GyxpXIX4y+ofsPz6TBoZUnPGUbnErs7ayNjoNTkmnd3y527dGtEKrd
         CGyItepaZ+as19+yuP5G3DRyl3JlkkCD18C8R2W9y8kMCwvC37JccAOjvYit0z/BrXt0
         eLQx2DJ7T05lG2XKAftY0/3nfeVMZvNMbTJfnl1hr8NVSqpK+O/8TkecZlq5P0zDpb1+
         5uCFZOJOLUu+usz4rgx8PPrPseZCg31RSz1uQUQcCEhwLEEm44qdTI/oLNx/WsZg1mLc
         2+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782198072; x=1782802872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6Ap3YJUEuoJTFxCbawQ11i/jSYqTs+DIopPqv2NeZw=;
        b=B6+N6KLGIG0N6rr05K5NMaCI//z8u0AO8bhPtnWgObJZWmRvlx5pR/KLtloh2lEzrW
         ZH94n1RjgCJ5bgT0k0SsKALgQJLWd54WKy32109ILgdEsBjxPnMHjAkstEx1Eor4FrLK
         aCBWmhBoMnHbVS23OHdoLCsJqpqB5c4iI8naVsPWw3cLap/YbX2KzG8GYgplQ0oONvui
         lNZJeCH3RuZP3rOb/TLAGnfo1doDsZWQV3AKDreE5KByQTEu6WBHYETE+9duo9SmeIuw
         q0lt6+L7Q6szAWcSKYxNQi3wPkLCyg6SdIoMYib4/db+tQ5sH1TSfLuDXYdCUKzPi7N5
         RJJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrE74tfb8t4wBVlXAHLDJe4NhE7gb0qG2Z6Mkgvc28Lj1nEx7/QKO2u03zCG8wvxHk/gL/r6OE7fWwIKBGxqtmN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfmp+A7VC1qyhDvl/ZzzoMnZ1PSxFL7NkCw5c65QQZ53KUza81
	thFvZqMpUP8ieMzeAD6V/2lI1dxn4RnXEwgx6sqV2OvsxeyhHRhTFLZW
X-Gm-Gg: AfdE7cmuPExAUyrauTpyMeFL3bCxgEr4qp9ysyHkHBTs5vHAVu0MD+S0b2hj16IUhQy
	imijKp0UMNf78eQEQpCBcG12Haa03f5xuKOenzrOF3uHbRWytF7k6glQ4o6Gcf3xQubsiC+JvVI
	i9PzC3Rvo9VcN8aAkHxbZ1cpOM1IhqgwJNxmOUGxXgcbJDF/4EaTS/mmRX662HZOYS0oipmdR6f
	0LmXLiE2TIV9+hAxAtATuL1g7KV7ubeUz8ZLLLYSXGkOQ+cZBhM7fEwOa9TrMaXtNrM54U++A6m
	PZVV3slbQtjk+C1PvNM6Gk+PvtiEP8GrJR+yhxfGJ/VZZwO6BUDpdoJ5JwOxcPmdKZr/wlBEVMt
	k2aS6Hsa2sXSIEOwcggzR06hk6sf0OQijTdtndAtGfchmQppXW0NhnUtZ+KCpyBbEjeIqnEJEh2
	z/
X-Received: by 2002:a05:7301:3f09:b0:30a:e52f:9bcf with SMTP id 5a478bee46e88-30c06e2e675mr12844078eec.10.1782198071896;
        Tue, 23 Jun 2026 00:01:11 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bdffa83sm18003870eec.23.2026.06.23.00.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:01:11 -0700 (PDT)
Date: Tue, 23 Jun 2026 00:01:08 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Charles Mirabile <cmirabil@redhat.com>
Subject: Re: [PATCH v4 5/8] riscv/runtime-const: Introduce
 runtime_const_mask_32()
Message-ID: <ajovNDH2uo6V4NJx@blinky>
References: <20260430094730.31624-1-kprateek.nayak@amd.com>
 <20260430094730.31624-6-kprateek.nayak@amd.com>
 <178219229643.10927.7189200920480581019.b4-review@b4>
 <ff9678fb-4cca-4849-8ffb-7cb76db60e1a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff9678fb-4cca-4849-8ffb-7cb76db60e1a@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_000112_948877_816B1345 
X-CRM114-Status: GOOD (  31.02  )
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

On Tue, Jun 23, 2026 at 11:43:39AM +0530, K Prateek Nayak wrote:
> Hello Charlie,
> 
> On 6/23/2026 10:54 AM, Charlie Jenkins wrote:
> > On Thu, 30 Apr 2026 09:47:27 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> >> Futex hash computation requires a mask operation with read-only after
> >> init data that will be converted to a runtime constant in the subsequent
> >> commit.
> >>
> >> Introduce runtime_const_mask_32 to further optimize the mask operation
> >> in the futex hash computation hot path. GCC generates a:
> >>
> >>   lui   a0, 0x12346       # upper; +0x800 then >>12 for correct rounding
> >>   addi  a0, a0, 0x678     # lower 12 bits
> >>   and   a1, a1, a0        # a1 = a1 & a0
> >>
> >> pattern to tackle arbitrary 32-bit masks and the same was also suggested
> >> by Claude which is implemented here. The final (__ret & val) operation
> >> is intentionally placed outside of asm block to allow compilers to
> >> further optimize it if possible.
> > 
> > If the mask fits in 12 bits, we can nop the lui and the addi and just
> > patch an "andi" instruction with the 12 bits of the mask. We already do
> > this with the lui+addi block and nop the lui if val fits in 12 bits. I
> > would be happy to help draft that optimization.
> > 
> > But I think the better solution would be to take the power of 2
> > assumption since that will also benefit arm. We should still only emit
> > an andi if val fits in 12 bits, but if it doesn't we can patch in
> > shifts:
> > 
> > slli    a0,a0,x
> > srli    a0,a0,x
> > 
> > Where x is the constant (arch_size - _futex_shift - 1)
> 
> I can do that for the next version and use ubfx for ARM. I can just put
> in a BUG_ON() at the arch/ specific __runtime_fixup_mask() and if a
> new use case arises which hits that, we can perhaps move on the dynamic
> nop patching scheme that you mentioned earlier.
> 
> Let me know if that works and I can pivot to that scheme in v5 and send
> it out post -rc1 after some testing.

That sounds like a great plan :)

- Charlie

> 
> -- 
> Thanks and Regards,
> Prateek
> 

