Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FBCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 19:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErBKgtp+mZ9BxO2ANkGEg2e2c554PPZZFYhSFk8hs4c=; b=2UmH6O7J7aqkc8d2/rLuecvl4/
	7yVVJefrqMzv7mg8lU26qekb3u5kgvJvWNHuhFYR+n39jdCp0qKy7th6DEn7cs1OTW300MR3HUbf+
	zNtY8rUyuaUX1yEjcD1hlRKrRTA1rX8fCv+KU/FWXVPevZlyf7dp7NMiiCQU6tVpEQ06vpthuyt+d
	v5kQ9pXRkQjy8YVheSy2YARFhvp+B3U5/Njx3+CatMPKLHb6jKBT0oed0qhTwg9KWZOQweV6Z4PeH
	APTXwwcIi5j/Q9NBEmaJnfSUkDgU4WEo/pE+LVKG6LPfVg70WZ7+HB65A0Z/7LrjqFDBPIX4GCCSJ
	YoudSr9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiztC-00000007hvP-33Cg;
	Sun, 12 Jul 2026 19:30:58 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wizt8-00000007huQ-2XoG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 19:30:56 +0000
X-Forwarded-Encrypted: i=1; AHgh+RryMX/B5l+REcFJgEDCsXE6Eo7YyWSm+8phSBrdB4QUDIs6duM+0Xikfk3iGBwvn9Zjj6Cj8oJ4FtC/NKFFJtcf@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783884645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErBKgtp+mZ9BxO2ANkGEg2e2c554PPZZFYhSFk8hs4c=;
	b=ZKW7yhz25K/l90tFfJ32JE+A3scCVExklXCKtsPBwp36lLqCTl+WbuYZ/5tjQjLHxTXZtx
	eOQcXHN3T5cllcoStKFzlLBXcJ8DUv9n+bnlOgzb4uESWZ7vHYlYyRa+Mftc6MtEUYvq4o
	sj9MjHEQLk/Es3rdq5grdd9r2VxgIvg=
X-Gm-Message-State: AOJu0YwU3ZzbkFzrGaq+zWDxxrvuQV6W+S+LsCwje7P80bWPioM2jq+C
	qaUG9LVz0ZU1kxLVpvVNg1j6f5cGMKBNOxUn9+9KJaKxd0gtT7dmq0h7teonjJ9x3mFdtsfQH/f
	Y5SkwDcQGcSUkgPY+EgZSPi7NrqHg5axREqWFUWT/
X-Received: by 2002:ac8:5a47:0:b0:51c:97f:83a9 with SMTP id
 d75a77b69052e-51cc046e6fbmr9964881cf.1.1783884639780; Sun, 12 Jul 2026
 12:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260712153835.2264905-1-smostafa@google.com> <CA+EHjTxN1fcBVRi+yK18UgReGsX8Evu1GsijSQC61dY3XrjCtw@mail.gmail.com>
 <alPox2BDk4Il0s9t@google.com>
In-Reply-To: <alPox2BDk4Il0s9t@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 12 Jul 2026 20:30:02 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzvzcV8Cxw+VHK9Fxv7Y-7m84XbzUFU+4sXZXNrM8y7dw@mail.gmail.com>
X-Gm-Features: AUfX_mxsRm47NFDH8jthhba-6RAh8a8HdvP8KKBSTLBL_9PSzFB7aArWc0wKLI4
Message-ID: <CA+EHjTzvzcV8Cxw+VHK9Fxv7Y-7m84XbzUFU+4sXZXNrM8y7dw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Avoid naming collision in tracing
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oupton@kernel.org, 
	seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	vdonnefort@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_123055_012210_8F7B222A 
X-CRM114-Status: GOOD (  35.93  )
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

On Sun, 12 Jul 2026 at 20:19, Mostafa Saleh <smostafa@google.com> wrote:
>
> Hi Fuad,
>
> On Sun, Jul 12, 2026 at 05:19:22PM +0100, Fuad Tabba wrote:
> > Hi Mostafa,
> >
> > On Sun, 12 Jul 2026 at 16:38, Mostafa Saleh <smostafa@google.com> wrote=
:
> > >
> > > When the hypervisor tracing (CONFIG_NVHE_EL2_TRACING) is disabled, it
> > > defines a static inline stub for trace_clock().
> > >
> > > However, trace_clock() is already declared as an extern function in
> > > linux/trace_clock.h which is pulled in EL2 compilation.
> >
> > The rename itself looks correct and complete: all three sites (the
> > declarations and stubs in nvhe/clock.h, the definitions in clock.c,
> > and the two callers in trace.c) are updated, and no other reference to
> > the old names remains under arch/arm64/kvm.
> >
> > Two small things...
> >
> > >
> > > If the file <nvhe/clock.h> is included when CONFIG_NVHE_EL2_TRACING
> > > is disabled (by including it manually in setup.c) it will cause:
> > > In file included from arch/arm64/kvm/hyp/nvhe/setup.c:22:
> > >
> > > ./arch/arm64/kvm/hyp/include/nvhe/clock.h:14:19: error: static declar=
ation of =E2=80=98trace_clock=E2=80=99 follows non-static declaration
> > >
> > >    14 | static inline u64 trace_clock(void) { return 0; }
> > >
> > >       |                   ^~~~~~~~~~~
> > >
> > > on GCC and a linker error on LLVM (it seems to change the linkage to
> > > global)
> > >
> > > Although that is not a problem at the moment, as no other files
> > > include <nvhe/clock.h>. That does not seem to be the intent of
> > > this code and that will cause issues with more users as the SMMUv3
> > > driver.
> > >
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > >
> > > --
> >
> > git am only treats a three-dash "---" line as the scissors; the "--"
> > here is two dashes, so mailinfo keeps everything above the diffstat.
> > Worth a "---" on the repost so the note stays out of the log.
> >
>
> ops, I will fix that.
>
>
> > > I did not add Fixes tag as this is currently dormant and not breaking
> > > anything.
> > > ---
> > >  arch/arm64/kvm/hyp/include/nvhe/clock.h | 8 ++++----
> > >  arch/arm64/kvm/hyp/nvhe/clock.c         | 4 ++--
> > >  arch/arm64/kvm/hyp/nvhe/trace.c         | 4 ++--
> > >  3 files changed, 8 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm=
/hyp/include/nvhe/clock.h
> > > index 9f429f5c0664..c2ccd0e8bf22 100644
> > > --- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > +++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > @@ -6,11 +6,11 @@
> > >  #include <asm/kvm_hyp.h>
> > >
> > >  #ifdef CONFIG_NVHE_EL2_TRACING
> > > -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch=
_cyc);
> > > -u64 trace_clock(void);
> > > +void hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 e=
poch_cyc);
> > > +u64 hyp_trace_clock(void);
> >
> > hyp_trace_clock overlaps the host side: arch/arm64/kvm/hyp_trace.c
> > already has a struct hyp_trace_clock and static helpers
> > hyp_trace_clock_enable() / hyp_trace_clock_show() for the debugfs view
> > of the same clock. No actual collision, so this is only a readability
> > point, but a reader grepping hyp_trace_clock now gets two unrelated
> > things. Maybe you'd want to consider a different name, but naming is
> > hard :)
>
> Yes, that shouldn't be a problem,  I just added hyp_ prefix, but I
> am ok with any suggestions!

Didn't I say naming is hard? :) How about, el2_? Not really happy with
that either tbh... but can't think of a better one...

/fuad

>
> Thanks,
> Mostafa
>
> >
> > Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> > Tested-by: Fuad Tabba < fuad.tabba@linux.dev>
> >
> > Test: builds fine with the different config enables.
> >
> > Cheers,
> > /fuad

