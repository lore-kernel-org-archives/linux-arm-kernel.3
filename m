Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27701C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amf55tWJXben6rIQyHF/blCpD5b43dwdFfwgfK1yuhQ=; b=mv1PUsJZvWTYAgb9Ma5z0cYGFv
	6jey+6N0Nh8v/qL7zDhQDvzkrbOHlTERWh3m0Sn9g6S8rO1cHGuQ/30Dq5k90Lf8p2PyssLUK09z4
	ZEJAiiypkVOiN5P1Ztt5bG7mJTZWHA+VTzxIILZS6FEH20ubDPm7nEQqdlIuP0qHsH/tvT8dQ6UDd
	giWuBiHysYSajCUEuaTqquyfW4T0STpKLlTAfOBY+8mNo2TKiNt2R/15JDq6/4rXzu/NLkceDdFB+
	fwyz75+STGCNpcNL7f/2uViItGqM2Gx91DYBwvKX9AgwuB94mxHG7eWTR9nGosf9TT9yrDGKdDl68
	k7lx65EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBzx-00000008ZrJ-3rJa;
	Mon, 13 Jul 2026 08:26:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBzv-00000008Zou-0MOa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:26:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so82105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 01:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783931201; x=1784536001; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=amf55tWJXben6rIQyHF/blCpD5b43dwdFfwgfK1yuhQ=;
        b=uXVvOuQpLGh7MY/aIfBYcSfAJbE3HStnU50JSZuVO+ruFFncu4mPGV0Uni1h0O/V+y
         LFXLD3StLDXg4ThTnYvx1tKpD3HdN2SOZMTAtD1zrm5QBkJTU5R3vLCm+zkY0X87hwAf
         PMYyJht6VPuknZaD4ZPrUw/p1Lgt/Pz6L7RoJX9GOKcs38gBJ4p5sL2f6LBg+mleVKN5
         /TWIa2rZiFoMEP8JNs3a41CN0VAaDBU5yr5HOoo/2xc+fl+rTyyRPcc43ce8g6kHZKz6
         AC/zZ7Ewqk06BSUIcIg3FJ/W+JcKQsrZ/OopB7lW0VHl5+BVq1FiJCuudDtiSzlxnOZ9
         Lb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931201; x=1784536001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amf55tWJXben6rIQyHF/blCpD5b43dwdFfwgfK1yuhQ=;
        b=np3+LuvLP53zXkeCpUG7zdElBKyE1H7nhnlwvIeQL5c5RhiES4GeID/32R9909b1bV
         rlQsxc5e8kbCJVPapbGF8Ct5Z0u9zylPJS8pjnyIp1uW/s4z6TkjXPz/ERHRA36e/x5J
         4Ik4sHaofMu+MzHIzRmugJWLoTT89G1ZLGvv9W1EiOplfNPde7h9jf2DMAjAL0GjQSTT
         LbiQ5ICEL9D3NOm/8qY5k0lrx2z+kyN5AhJCflkt8UeqdURMiH+EqyMxR8EFrzGgvH7t
         1vveOT1qYxICD8BKSbhZmSuHnU9BmpJzia5h5LS07fft/h/bjWZXjxR113OvAhx/VhcU
         QqRg==
X-Forwarded-Encrypted: i=1; AHgh+RohBjT1YoqDia52W3h86qSY3fKMBv4000ixV/RAU34X2ZfXorPd+FN/wCLPaoUk0FUKNeaCvQ0ed5FjOcSN/J3f@lists.infradead.org
X-Gm-Message-State: AOJu0YwknoRsIvVSIICdWZWTr9MtwWubbr0Fh7AphxhxonDgmDjphyoS
	mm51ZMc8mt0t5tOLS/sNUBICO0BDjwQsxYeE2PrcQr5p3U+mSOI+K1nHN2qaChsd/Q==
X-Gm-Gg: AfdE7cmrvXguw7yQar4L2fU5GOb5Zs01YYAFSTrXnh0CFDj7mksdKQEVUfikJFZkkdZ
	sHqVF01MUYZ6ykPS+Dtq5Xk7FIZ/eQdaSckV/47pUIlbMilqYYTvJ4Pt5SguKCB2ntrmGGmKiQ8
	Fc6ry9A684Qv/yFMub0iPZX6CK+I8+d0SSF1ko0EgE2efz1IudjNlFiYY+s08AW4I4eljvsMFNC
	ww/OfHAND70AcpiD3Fjc31lKh3UXy0ApDKM8WPbr5/qE2n4+FY4PFs7ul4xdpx320IH91YkCgZD
	iKgKiT1LivmJpYV+SaGrwsNfRKLUrvyHQte9EqbXGxOFWBBOyA4sjSa1nTxhBFMpiBKiS9Vf9Fq
	6htzBbLpn/zytvnGOOSHhMWwaurTTRrsC/w5jDHijKzNf1vLRcJIMu5DDUQnSRIzVs7eBFPN1Wl
	z22tn2ahQHYBYVGEMba6vHmbUn6/PAqkEOfIVROEsKNZCy8y5zGEiBKfEuMSo=
X-Received: by 2002:a05:600c:3589:b0:492:203f:a378 with SMTP id 5b1f17b1804b1-49465abb636mr24695e9.8.1783931200485;
        Mon, 13 Jul 2026 01:26:40 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d91bsm88670924f8f.4.2026.07.13.01.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:26:39 -0700 (PDT)
Date: Mon, 13 Jul 2026 08:26:35 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH] KVM: arm64: Avoid naming collision in tracing
Message-ID: <alShO27MLsNqgBws@google.com>
References: <20260712153835.2264905-1-smostafa@google.com>
 <CA+EHjTxN1fcBVRi+yK18UgReGsX8Evu1GsijSQC61dY3XrjCtw@mail.gmail.com>
 <alPox2BDk4Il0s9t@google.com>
 <CA+EHjTzvzcV8Cxw+VHK9Fxv7Y-7m84XbzUFU+4sXZXNrM8y7dw@mail.gmail.com>
 <alSdr9wNyyPiHmbt@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alSdr9wNyyPiHmbt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_012643_148685_DCC00130 
X-CRM114-Status: GOOD (  29.17  )
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

On Mon, Jul 13, 2026 at 09:11:27AM +0100, Vincent Donnefort wrote:
> [...]
> 
> > >
> > > > > I did not add Fixes tag as this is currently dormant and not breaking
> > > > > anything.
> > > > > ---
> > > > >  arch/arm64/kvm/hyp/include/nvhe/clock.h | 8 ++++----
> > > > >  arch/arm64/kvm/hyp/nvhe/clock.c         | 4 ++--
> > > > >  arch/arm64/kvm/hyp/nvhe/trace.c         | 4 ++--
> > > > >  3 files changed, 8 insertions(+), 8 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > > > index 9f429f5c0664..c2ccd0e8bf22 100644
> > > > > --- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > > > +++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > > > @@ -6,11 +6,11 @@
> > > > >  #include <asm/kvm_hyp.h>
> > > > >
> > > > >  #ifdef CONFIG_NVHE_EL2_TRACING
> > > > > -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> > > > > -u64 trace_clock(void);
> > > > > +void hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> > > > > +u64 hyp_trace_clock(void);
> > > >
> > > > hyp_trace_clock overlaps the host side: arch/arm64/kvm/hyp_trace.c
> > > > already has a struct hyp_trace_clock and static helpers
> > > > hyp_trace_clock_enable() / hyp_trace_clock_show() for the debugfs view
> > > > of the same clock. No actual collision, so this is only a readability
> > > > point, but a reader grepping hyp_trace_clock now gets two unrelated
> > > > things. Maybe you'd want to consider a different name, but naming is
> > > > hard :)
> 
> If we were to rename: the clock is a "hyp_clock" so probably trace_hyp_clock()
> is the right thing here.
> 
> while the "hyp_trace_" is the prefix for hyp_trace.c file content.
> 
> Although I would like to see why we pull trace_clock() from the kernel into EL2.
> That bit sounds wrong and if we have a way around perhaps that's better?

Most include path look like this:
In file included from ./include/linux/ftrace.h:11,
                 from ./include/linux/kprobes.h:28,
                 from ./include/linux/kgdb.h:17,
                 from ./arch/arm64/include/asm/cacheflush.h:11,
                 from ./include/linux/cacheflush.h:5,
                 from ./include/linux/highmem.h:8,
                 from ./include/linux/bvec.h:10,
                 from ./include/linux/blk_types.h:10,
                 from ./include/linux/writeback.h:13,
                 from ./include/linux/memcontrol.h:23,
                 from ./include/linux/resume_user_mode.h:8,
                 from ./include/linux/entry-virt.h:6,
                 from ./include/linux/kvm_host.h:5,

Although, some files have ./arch/arm64/include/asm/cacheflush.h
directly.

Thanks,
Mostafa

> 
> > >
> > > Yes, that shouldn't be a problem,  I just added hyp_ prefix, but I
> > > am ok with any suggestions!
> > 
> > Didn't I say naming is hard? :) How about, el2_? Not really happy with
> > that either tbh... but can't think of a better one...
> > 
> > /fuad
> > 
> > >
> > > Thanks,
> > > Mostafa
> > >
> > > >
> > > > Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> > > > Tested-by: Fuad Tabba < fuad.tabba@linux.dev>
> > > >
> > > > Test: builds fine with the different config enables.
> > > >
> > > > Cheers,
> > > > /fuad

