Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7631DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 19:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEU3y3lXMNFSsQ9hphclmAmUhcp5miEUyosWJijgi/Q=; b=TFSZsN4xzIhrRHEsdXyF70btm1
	i3FmchGYut47omMw4iigHTvkhrYlnW4hdRlpswTSKsQjFoT8iLep1g31+jckID7xhJ8BCICECUk6q
	xJrFis+65gbi3oZaIVaLeBRuT42NElQTeJCIxr1eaKtpnlG6DzsNPRRsGWQHbafYNs/6u83V7DmPX
	Yhyd1CW/mS1EW10Qzy0OhHz6O7Ya+haV0+SLMFTvSpdg1tAgBIEqt++AtqCik71H92O+pi4CJSahA
	c02r9Og+jj9fpkK7TaNN8/GhDUcGx5fERumkb5QtcsH0gTEVl+nzj8MvN44aY0z7PjVPs/IqpxnzA
	+nRp4NvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiziL-00000007hXT-34wE;
	Sun, 12 Jul 2026 19:19:45 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiziJ-00000007hX8-1Rsx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 19:19:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493b8d92a4eso53955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 12:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783883981; x=1784488781; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vEU3y3lXMNFSsQ9hphclmAmUhcp5miEUyosWJijgi/Q=;
        b=jhWcqz609TaqtKTkLvgfAT/wqjZ3UOhcUBGOCu3TMq2BppTUDkuWeZohGbcE/QowLA
         2Z7spY0vlAHGSpJz6Ls0ZjHpTu07450X8rDoqlYUuf3OlgkKqtiCDXcYDp8wCMpIoqsK
         wsMt3XCQcBdD9RP+di44ibXzy2+8YwGFUaZyKC5fYyVx49P1oumYIGCh6LKf6wHHnpRg
         uum3/EFp3nF12lBWjveNNmhS8tixBgHTyRp6ZlZQpGroQyHx0N1n7/E8S/7ycXkV86RZ
         6Xyku3WFeNtCIkI+wFnOdxg/oxxfDh8VTqAui/i3PNJ+Lp4LWXdLPHg4SYl5nm69sAya
         tj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783883981; x=1784488781;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vEU3y3lXMNFSsQ9hphclmAmUhcp5miEUyosWJijgi/Q=;
        b=o7Ci1ri3706+8KYwfY7aKfFR00rC8q1oN5bp+MUTA3Dd2e5FUwclFOIrKSJtXfNZHb
         NqGUzvE+zdzZleGKTSffPoGWh4I8/3Q5lDgAi+PYa+el5Q7IhUMhOMWe5LbXLWaoEjLv
         5CExUvrUfDlJc39AUQXMl/ltvvbxx1SkCaBZzE9S5PXwPl30s9qs7CbQ/34xE3opy0s8
         Sg/scYfqY+ssQl5oHIa+DiP4rCxb1+UfqTRXzJqx8KyQNV83V3sbL9PuntdoiS/UDQvj
         GgZeGnc95G36Y+DYmi/hWfPNqUJoryB94yQCUvPbmvhW1cCAxFqOg8NUlsds1xu4DRBP
         0ChQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXy2jW35dUUGjyUnP93ExoK1Q/MPgJ4lJMaEcM1U34q2fgymsVzrIbj8DNG4MB7syD2GnXunUpjphkSatj+/dO@lists.infradead.org
X-Gm-Message-State: AOJu0YxCVExkYaOzhWptJ/9MF84UAAtvig63WuixiyICKIWtqMVMcKQE
	b8euUnkRRQXpYMgCp6sRG+W0yhJWFnpzEExQ4Av5JaDrD74WGq/HF+SQlw0uMa4ccA==
X-Gm-Gg: AfdE7clx3DEMjKL/ZC6z/qZJoWMjKF6FqYcOsSK1MPRbv7fOUbDHVvxlsztsUNWnWkz
	6NAD05PShQWbEAFmTC1IANUAzqf4j8VjLuczAquojEW3QQwwmXLqN06KxicSmRsBSR2FIhPZGSU
	ViJGm0pU5CB9OsGOuVt7hUo9iFMooQvK+ManKQRPq1ykcISFW+VUPe002tMc3a+QHZS9yncbpta
	yFXftLHbQHUXgMjJ+tBsgiP951EsahmWeQyL4ugDXBJ21xcLEbMfW0gKWoNcF5NBC8aN7eJ1HVg
	UQBUXH3xAhcnHK9gcAHeGy+OMv3pXxD6tz/iTQZWAVbqev22EHFdjMxxSCbC/xVBIHL91RyxITI
	Cr0iQ7DV6bHjv9tWke6Pspmw1J0g5VkCQqiQehRqN6F9HEZi69EWVG5tLZwolJ+TjDIhBGNgG6U
	PdoHvgyrc7THpGySYzxrD1R14BfoUM808mcpNWbUFneAcPDizk
X-Received: by 2002:a05:600c:6085:b0:493:ae5f:d29f with SMTP id 5b1f17b1804b1-493f8bc151fmr2729225e9.3.1783883980658;
        Sun, 12 Jul 2026 12:19:40 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493fbae1cdbsm124580445e9.10.2026.07.12.12.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 12:19:39 -0700 (PDT)
Date: Sun, 12 Jul 2026 19:19:35 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oupton@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com
Subject: Re: [PATCH] KVM: arm64: Avoid naming collision in tracing
Message-ID: <alPox2BDk4Il0s9t@google.com>
References: <20260712153835.2264905-1-smostafa@google.com>
 <CA+EHjTxN1fcBVRi+yK18UgReGsX8Evu1GsijSQC61dY3XrjCtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+EHjTxN1fcBVRi+yK18UgReGsX8Evu1GsijSQC61dY3XrjCtw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_121943_463837_7390F816 
X-CRM114-Status: GOOD (  35.31  )
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

Hi Fuad,

On Sun, Jul 12, 2026 at 05:19:22PM +0100, Fuad Tabba wrote:
> Hi Mostafa,
> 
> On Sun, 12 Jul 2026 at 16:38, Mostafa Saleh <smostafa@google.com> wrote:
> >
> > When the hypervisor tracing (CONFIG_NVHE_EL2_TRACING) is disabled, it
> > defines a static inline stub for trace_clock().
> >
> > However, trace_clock() is already declared as an extern function in
> > linux/trace_clock.h which is pulled in EL2 compilation.
> 
> The rename itself looks correct and complete: all three sites (the
> declarations and stubs in nvhe/clock.h, the definitions in clock.c,
> and the two callers in trace.c) are updated, and no other reference to
> the old names remains under arch/arm64/kvm.
> 
> Two small things...
> 
> >
> > If the file <nvhe/clock.h> is included when CONFIG_NVHE_EL2_TRACING
> > is disabled (by including it manually in setup.c) it will cause:
> > In file included from arch/arm64/kvm/hyp/nvhe/setup.c:22:
> >
> > ./arch/arm64/kvm/hyp/include/nvhe/clock.h:14:19: error: static declaration of ‘trace_clock’ follows non-static declaration
> >
> >    14 | static inline u64 trace_clock(void) { return 0; }
> >
> >       |                   ^~~~~~~~~~~
> >
> > on GCC and a linker error on LLVM (it seems to change the linkage to
> > global)
> >
> > Although that is not a problem at the moment, as no other files
> > include <nvhe/clock.h>. That does not seem to be the intent of
> > this code and that will cause issues with more users as the SMMUv3
> > driver.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> >
> > --
> 
> git am only treats a three-dash "---" line as the scissors; the "--"
> here is two dashes, so mailinfo keeps everything above the diffstat.
> Worth a "---" on the repost so the note stays out of the log.
> 

ops, I will fix that.


> > I did not add Fixes tag as this is currently dormant and not breaking
> > anything.
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/clock.h | 8 ++++----
> >  arch/arm64/kvm/hyp/nvhe/clock.c         | 4 ++--
> >  arch/arm64/kvm/hyp/nvhe/trace.c         | 4 ++--
> >  3 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > index 9f429f5c0664..c2ccd0e8bf22 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > @@ -6,11 +6,11 @@
> >  #include <asm/kvm_hyp.h>
> >
> >  #ifdef CONFIG_NVHE_EL2_TRACING
> > -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> > -u64 trace_clock(void);
> > +void hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> > +u64 hyp_trace_clock(void);
> 
> hyp_trace_clock overlaps the host side: arch/arm64/kvm/hyp_trace.c
> already has a struct hyp_trace_clock and static helpers
> hyp_trace_clock_enable() / hyp_trace_clock_show() for the debugfs view
> of the same clock. No actual collision, so this is only a readability
> point, but a reader grepping hyp_trace_clock now gets two unrelated
> things. Maybe you'd want to consider a different name, but naming is
> hard :)

Yes, that shouldn't be a problem,  I just added hyp_ prefix, but I
am ok with any suggestions!

Thanks,
Mostafa

> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba < fuad.tabba@linux.dev>
> 
> Test: builds fine with the different config enables.
> 
> Cheers,
> /fuad

