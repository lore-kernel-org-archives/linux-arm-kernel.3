Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFD0C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 03:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbKYP37k7zLxmRSGbkuGEEJMcz1AsBvMEBjt1v4DxZE=; b=ihNANcXZWhQ/x0SHYnzsIDR3rM
	5YATm95I8MK6pO0AIryGrxCVSPj1AEWCIlyy78DN2c0ocYoueh7c/2n1sHrLkEDBPU8aqX2L11Z7v
	FfzKLp8whK12iW0K+H0fp0DW2TRuhlDEJi9k07SFPkq91aDonIwojPkQfElQxn+4593bCf8RWAVYt
	5K8QnvHEOUe4/BdKT1a2e6Nzi2IP2p39G9CstLtW87X74kdFooQ719pGzODGP2NKnL/n7S1dvV9Ig
	WbSJ19Fjg4cym3H+rCJaKstD1823rk0RSbm89PY1gII9olxoy/FKDsz15MI+GLZ3QNBrdXn6kUv+C
	g2laz5hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubtGA-00000006hYp-3fcZ;
	Wed, 16 Jul 2025 03:56:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubtBw-00000006hCa-2WTe;
	Wed, 16 Jul 2025 03:52:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC98061485;
	Wed, 16 Jul 2025 03:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E410C4CEF0;
	Wed, 16 Jul 2025 03:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752637943;
	bh=kbKYP37k7zLxmRSGbkuGEEJMcz1AsBvMEBjt1v4DxZE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fnbyNZ/uofGXdgO7Yr2YWSNB67zbnOFOQ+pTadx543mwEWroEHJc4Ic64pAA3Z/11
	 UGhzH/VIGx0r+EL5bHdyNhfO5qenQAGqdqQXc4sMTG4jO0oHJB6QDFPWPfsXbCmZlH
	 WLBqi80urwpHRK2uEhCd3hCdgh6UPIlGy7x1ES23qXjUPSoX9k+ltIj0Bj+U9ncrzV
	 77QMIdVHowgEY/FSjC0zrhqNhEDFdeSB2r9kmK+gvSIfE4jKLfBHdQ6Ootdl1piht0
	 uqH/qfLzgFHH1RUJtKWlIjdcG5PtZLDK0INZv9ODqbHmZUtQvuXb2pJVrnQ+w0d2FI
	 XTSf8/KvR6vrg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5561d41fc96so6494435e87.1;
        Tue, 15 Jul 2025 20:52:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgymjeFGo77rTjiaojhPjVzQOmqVro7EIdsL9B87F6b5E5/gDaudJyyjHg8U1N3OWXc44rZEqEnlJuPO8=@lists.infradead.org, AJvYcCXYZNcfzgkrnw4p7nppksime3/sAMnzmgcFscZLo2IlVihs620Fjx26+Aj+32bVApvrmNitReuMS+xlqHZveSrB@lists.infradead.org
X-Gm-Message-State: AOJu0YwNDbDAKFegLq2LcT9hBMU/vN3Qu7xfL+v/moNesNMw32+j91iA
	GGpzBBiaZ4xJp7A/W4Lmm7MG74Xw+fGpbPo3gxLv6jNnmyPxV2pTJAa/QO0LJOelc225f/R8oBy
	MtVBen1AISLwT8KrbBs1jWaTTJ12ybPQ=
X-Google-Smtp-Source: AGHT+IGsx+1eBRK7VlvwwK4lrn2tedS/8CBhSaETgUda6ZBIDw8ZzbYDB45sUI1HO8Bko2rjpL9ZJH4DB6I0F9C6dzg=
X-Received: by 2002:a05:6512:3416:b0:553:ae05:9c48 with SMTP id
 2adb3069b0e04-55a23fa8c7amr357898e87.45.1752637941719; Tue, 15 Jul 2025
 20:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com> <422e2a72-972f-41f4-a0b3-d69a6cb0c2e2@canonical.com>
 <CAMj1kXEXpBF8hPaVMU0sDgNysYT66MDRmr3JHO4Lg1sJB_Yteg@mail.gmail.com> <aHZsohPoxLYML___@sunil-laptop>
In-Reply-To: <aHZsohPoxLYML___@sunil-laptop>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 16 Jul 2025 13:52:09 +1000
X-Gmail-Original-Message-ID: <CAMj1kXF+AP-3hKb8vJQ3oCoPxmEG=udexNCxMLvGE_KHCKcZxw@mail.gmail.com>
X-Gm-Features: Ac12FXyJHyI8FNCWondq-usX0O9Wq8IR0GvzToxJvHq2L_BDfrGw4oT1HSN0fVw
Message-ID: <CAMj1kXF+AP-3hKb8vJQ3oCoPxmEG=udexNCxMLvGE_KHCKcZxw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Remove unused EFI runtime APIs
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-arm-kernel@lists.infradead.org, Feng Tang <feng.tang@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Bibo Mao <maobibo@loongson.cn>, 
	linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 16 Jul 2025 at 00:58, Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> On Tue, Jul 15, 2025 at 01:29:15PM +1000, Ard Biesheuvel wrote:
> > On Mon, 14 Jul 2025 at 18:11, Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> > >
> > > On 7/14/25 08:08, Ard Biesheuvel wrote:
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > Using EFI runtime services to program the RTC to wake up the system is
> > > > supported in theory, but rarely works in practice. Fortunately, this
> > > > functionality is rarely [if ever] used to begin with so we can just drop
> > > > it. (Note that the EFI rtc driver is not used by x86, which programs the
> > > > CMOS rtc directly)
> > >
> > > The main problem I see with firmware offering access to the RTC via UEFI
> > > services is that two different drivers, the firmware one and the Linux
> > > one might be trying to access the same busses or registers which might
> > > lead to unexpected results.
> > >
> > > Recently there was a discussion in the RISC-V technical group for the
> > > server platform specification where the same issue was discussed
> > > concerning SetTime().
> > >
> > > As a UEFI firmware should not care which operating system is booted, it
> > > should be up to the OS to disable EFI access to the RTC if it has native
> > > access.
> > >
> > > Could we disable all the EFI services for the RTC in Linux dynamically
> > > when an RTC driver is successfully probed?
> > >
> >
> > I don't think this would be the right way to do it.
> >
> > It also depends on whether ACPI or DT is being used to describe the
> > platform to the OS.
> >
> > ACPI does not support describing the RTC device, so it should provide
> > the EFI services.
> >
> Hi Ard,
> IIUC, TAD is defined for this purpose, right?
> https://uefi.org/specs/ACPI/6.6/09_ACPI_Defined_Devices_and_Device_Specific_Objects.html#time-and-alarm-device
>
> > DT can describe the RTC device directly, so I think it is acceptable
> > for such firmware to mark all RTC routines unsupported in the RT_PROP
> > table, and just expose the RTC device directly.
> >
> > The OS shouldn't have to reason about these things: it is up to the
> > platform to describe itself unambiguously.
>
> I agree. But I think even with ACPI, EFI GetTime/SetTime can return
> unsupported if there is a TAD exposed with proper _GRT/_SRT and _GCP.
>

Thanks for the pointer. This device did not exist yet when I last
looked at this stuff.

So it seems like TAD is a suitable way for exposing a RTC to the OS
without the need for a hardware specific driver. However, the existing
Linux driver does not appear to support get/set time, and is not
hooked up to the RTC subsystem [yet].

