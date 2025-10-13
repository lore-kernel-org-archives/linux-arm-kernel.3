Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FB2CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 07:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJf7xLipisHImEFHEU39LT6SyCTlQl1jbbC0qWu2PoE=; b=nRxJjjq7bEpXkkzGvA3Qyz5upx
	iL+Op/MrAXaF/3up7zUIr8raDDkW+xdaAHrv6BdWLzJ6PGZFWzsGx2Tc/byjPPXN3Nkhx0Dh8WMwV
	MhjJRSmjq6Z6N1HE6p7H6RUlL0uvs1iHX+9Wq4WyWpTHM/WjLaXqivwqBzbceRBqrxDEisYTfPKaj
	W3nliUTCnLTc+ZcBkBy5/tie5rv/XUS0Gu5TCAnRv1jPAzCKSx1osSBOr6AZ8mbtJ3bIkKrs33Ham
	NhP3fhPDi+0T2TXQDKYePXYyVoqVPSDQh7MUu6eQ6l57SyBcwTPl/R1F3WsGfmhBy35lahyPbdG40
	0Ho1fEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ci1-0000000CSg6-14sD;
	Mon, 13 Oct 2025 07:11:05 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Chv-0000000CSfD-2OWg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 07:11:00 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-78e4056623fso51022226d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 00:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760339458; x=1760944258; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJf7xLipisHImEFHEU39LT6SyCTlQl1jbbC0qWu2PoE=;
        b=FvfUn4gsr2KMVImzG35O+4JyZ7nSRUrK6KU1ndQEKhAQX1uGLo5TZ8+djRhoUMCcM3
         RNbTn0BukPDen9fBrATKx0GxZMlva62DF9cQAUXyOiW0Od7bXiUAmGpsbMRlOihckrW9
         knqOhtqgOIxBuF711r1+cZ3wBlsV0OuGz6+6ZQU+XGE4oErYwo7OmzS+J4T24YSX7FZ1
         wiS9rc5b1NUM1/Fe5XYY2+yXq8TH47WnV7fKiEaxzcEBTmmynrWtJPsuITFo0odA4b6C
         jXf1iXqpcGhmmVFmUiV8jkpBySJLoYxIviPaXoU9x/IW0uW2EsUhmygEjdD7MXbB2lS7
         JgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760339458; x=1760944258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJf7xLipisHImEFHEU39LT6SyCTlQl1jbbC0qWu2PoE=;
        b=RAugG3YiPvP5lNuMt6wjKVrRm0+gImdM01bqah2YT4iR4SHBl0ACkUKstk1ioCuLef
         8VT7fB/4wtfrLCmTW/lacszAO29w1bdR/yb4PdpZidwGyEYy13Z+VBBaFYnwlbmZnE8P
         Vchspm4GDtyUwRnCUreOGk/FhNYystvjzUxKjH+ZRyIQfTKOspxR+93RLG5prcVetLmJ
         tEevGl34pOwOMkjWRNwGLRsRATlSEyU+KaeMBnyIs5h/setV6vciMwX7dcbryrBGvmdM
         U97dAt9ZNb3TiQLNy9ze1kbBDjIB6SC2BNQvHx8CipLvGtXYVEL1DT1gGB5cfrCEGpHR
         o+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhKlg2ZBd8fvEAVdr+xI/fpSDlnZafBg1wJQSsfx7stbxEROcbPv70myCJAj28BACai6ASaxtnaSn6THXdk4Iu@lists.infradead.org
X-Gm-Message-State: AOJu0YwtpdklbWsxmAg5d0phsI4lB8HD6n78n0bII0ZW/8XnAyT8ZtH3
	4PMxYYCwJLeTqIZ26Lhzt/cW7xzABgePM3atce2heUbPiMAlO5NbU6eQIzEb+ZKjzxv7O4DcgUd
	R9k8UzL/4yWMCpioICTU4U8s8H5aQAbBedHqcnDI8HQ==
X-Gm-Gg: ASbGncsk85TyOCg/N7MsbLVw+SyLvsGvNTLPRP7uus6uO2soKZ2WBuIYoufpvn1/E75
	+JGsx9B0roZMk5BP3MOcZ6DvoSEuWlOIOJyKCyCmCB5bUqFeEi/DTUGJ4ACxPwVtAEE5/5pag1p
	FtnWt6vf3pxg0Si1NciAH2hjBA5VHs9ZuXgyGgRxs26xeiZimMYSB64Z/BX+eQr6JoYf+kjueiV
	RaEYnz407qjZz6mhVGvS1cMRw1IieESBiDpQ+q3Bre8HD8DSmFIZcajp7M+HDWFBgXmJA==
X-Google-Smtp-Source: AGHT+IHlYmvSPHRRe5m0EkFR5aoK4WfWi+0MJgO2GyIhsHuhKt7Wi0a0UcJqCLk0ZaLHRfD+MX/KxQLvwg+1sKXpILI=
X-Received: by 2002:a05:6214:410:b0:7f2:5aa8:6655 with SMTP id
 6a1803df08f44-87b2ef33b40mr312076176d6.31.1760339457993; Mon, 13 Oct 2025
 00:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250908181717.1997461-1-cleger@rivosinc.com> <86817f9a-c601-81e8-b95b-0f2396275f95@kernel.org>
 <628d357c-f462-4dc8-92f2-99006b73e0c7@rivosinc.com>
In-Reply-To: <628d357c-f462-4dc8-92f2-99006b73e0c7@rivosinc.com>
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Mon, 13 Oct 2025 12:40:46 +0530
X-Gm-Features: AS18NWCt2iy9V0_v7KjFmtjkYMcjvPsZs4IHA_HWv-2SfKnKV8vVHkmqZQbY-so
Message-ID: <CAPd4Wez7eLunDbCmKs19S=q-DM3-kUs0=wwjxRi+pq1waq1RqA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] riscv: add support for SBI Supervisor Software Events
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <pjw@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>, 
	Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_001059_627323_3BBEB1CB 
X-CRM114-Status: GOOD (  43.57  )
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

On Mon, Oct 13, 2025 at 12:23=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@ri=
vosinc.com> wrote:
>
> Hi Paul,
>
> Thanks for caring about this series ;)
>
> On 10/10/2025 03:32, Paul Walmsley wrote:
> > Hi Cl=C3=A9ment,
> >
> > On Mon, 8 Sep 2025, Cl=C3=A9ment L=C3=A9ger wrote:
> >
> >> The SBI Supervisor Software Events (SSE) extensions provides a mechani=
sm
> >> to inject software events from an SBI implementation to supervisor
> >> software such that it preempts all other supervisor level traps and
> >> interrupts. This extension is introduced by the SBI v3.0 specification=
[1].
> >>
> >> Various events are defined and can be send asynchronously to superviso=
r
> >> software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
> >> as platform specific events. Events can be either local (per-hart) or
> >> global. Events can be nested on top of each other based on priority an=
d
> >> can interrupt the kernel at any time.
> >>
> >> First patch adds the SSE definitions. Second one adds support for SSE
> >> at arch level (entry code and stack allocations) and third one at driv=
er
> >> level. Finally, the last patch add support for SSE events in the SBI P=
MU
> >> driver. Additional testing for that part is highly welcomed since ther=
e
> >> are a lot of possible path that needs to be exercised.
> >>
> >> Amongst the specific points that needs to be handle is the interruptio=
n
> >> at any point of the kernel execution and more specifically at the
> >> beginning of exception handling. Due to the fact that the exception en=
try
> >> implementation uses the SCRATCH CSR as both the current task struct an=
d
> >> as the temporary register to switch the stack and save register, it is
> >> difficult to reliably get the current task struct if we get interrupte=
d
> >> at this specific moment (ie, it might contain 0, the task pointer or t=
p).
> >> A fixup-like mechanism is not possible due to the nested nature of SSE
> >> which makes it really hard to obtain the original interruption site. I=
n
> >> order to retrieve the task in a reliable manner, add an additional
> >> __sse_entry_task per_cpu array which stores the current task. Ideally,
> >> we would need to modify the way we retrieve/store the current task in
> >> exception handling so that it does not depend on the place where it's
> >> interrupted.
> >>
> >> Contrary to pseudo NMI [2], SSE does not modifies the way interrupts a=
re
> >> handled and does not adds any overhead to existing code. Moreover, it
> >> provides "true" NMI-like interrupts which can interrupt the kernel at
> >> any time (even in exception handling). This is particularly crucial fo=
r
> >> RAS errors which needs to be handled as fast as possible to avoid any
> >> fault propagation.
> >>
> >> A test suite is available as a separate kselftest module. In order to
> >> build it, you can use the following command:
> >>
> >> $ KDIR=3D<build_dir> make O=3Dbuild TARGETS=3D"riscv/sse"-j $(($(nproc=
)-1)) -C tools/testing/selftests
> >>
> >> Then load the module using:
> >>
> >> $ sh run_sse_test.sh
> >>
> >> A KVM SBI SSE extension implementation is available at [2].
> >>
> >> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download=
/v3.0-rc7/riscv-sbi.pdf [1]
> >> Link: https://github.com/rivosinc/linux/tree/dev/cleger/sse_kvm [2]
> >
> > I updated these to apply on Linus' current master, commit 5472d60c129f,
> > cleaned up the checkpatch.pl --strict issues, applied Anup's pr_info()
> > suggestion, and pushed them up here to make it convenient for folks to
> > integrate and test:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/pjw/riscv.git/?h=3Dri=
scv-experimental-for-v6.18
> >
> > Am assuming you didn't have other changes that you wanted to make; let =
me
> > know if that's not the case.
>
> Indeed, I do not have pending modification for this series. The KVM SBI
> SSE support will be submitted later that year.

I am testing this series with my RAS patch set. Will update on this.

Thanks
Regards
Himanshu

>
> >
> > I noticed that you asked for folks to do additional testing, particular=
ly
> > of the SBI PMU driver integration, but didn't notice any additional
> > Tested-by:s.  It would be great if other folks on the list could do som=
e
> > focused testing now, particularly since we're on v7 of this series, and
> > I'm sure others care about this.
>
>  I would have prefer a bit more reviews and testing before going through
> since SSE can be quite intrusive at execution time (even though the
> classic IRQ path should not be impacted, I expect mostly feedback/bugs
> from the SSE handling path itself). We'll see in a few days if people
> find such problems.
>
> Thanks,
>
> Cl=C3=A9ment
>
>
> >
> >
> > thanks,
> >
> > - Paul
> >
>

