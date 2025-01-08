Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A45E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91AHq4UOirjKedH2U0HwqxNC2wYHKs2LbZr8JHmZz84=; b=0Mmoa7+Nx/DMsfC65z2zF9C3vI
	ygzPzPBsB6XV/lK6UWI6mYBR81gMGj5hmPRxk8tyuov1ic998AuUlY46uttouaHEcs1EQ1va21zNR
	rOSsb0rPtot2cf4TTS33I0G3YCRJfygVEXYJy+ijBmVXOq06nwkwhYxskvSVTEuVaOpmTSxFRK9Px
	ueRF9plFbtiMZCFsy+Jq7h0YxlqlLvz8lYJz80eyVrszNiViC/Qx2XenPUt55NSu7WIAfUU4Csq2k
	bBqrTQnj815zYo8TUIfTVMFTOcMkmQrmE+WE666zpXyQ/9x6NWPgCXUI/A3Iv/lOZXOeMD8JNYk+D
	NErcv8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWQP-00000008fzX-23km;
	Wed, 08 Jan 2025 13:48:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWPB-00000008flH-1IDu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:47:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C10145C46A1
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Jan 2025 13:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840F7C4CEDF
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Jan 2025 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736344048;
	bh=iDNamHCAwQl0X+MRiiBGDfWJxaI3lHejxXJi8++osIA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OCwQJlGsMGp9LcA/LF7DLK1lfm+rdDs7VdZ1pJr1MpirW3CkKJ4a+NItJt9DzgUda
	 Q1BwEfpQZofO2cpyHcjG9ajGXHbSvZO2+LW9CLBK66bjitBKNtqEd1BbfRlsCeHVdU
	 TnXP8rT61pTKOeyKeGQJX9IY2gcu33jLf64CsU2qKHnk5pMTiSmsxXVRPGLUWvpfZ5
	 8oN3pPUVpocnG1q4jd13Ggt6kbdgoQyQJnnPfjhnulhqfSK7XNwOEDVhkHz6L42hwg
	 9i5GqJ1nqvPDP4bXYCGm01x8tUVjy9zSXjvOGJZ8SRw7iZhtmWTDEICQ7scvo6LbL5
	 ISum1Txih8oOg==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e4a6b978283so1443865276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 05:47:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWktxKkTgo9VWTpOLT14B1w0N6PaPswY5DQtAUxQYZHw4hucqj0k2B86PKgRKU229WB1Fjiu+6tyKPhc8oVmN6W@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo4BWiqPV//jg60sSklS1nnX+Yw/VWTQfYqIPMg5ZeyB48f1zU
	JA7ZzuWEXZ64lu/xvIoSGADv+ltQLfxVk4A21wUZVuUc98DdKr7/Jw+LhARwshnsKnNHh0HhyVe
	pKCv9xTnxjBJa/mBJmFGZHsCzfA==
X-Google-Smtp-Source: AGHT+IH/HoCh7iApFExTgK70tS8gnK3byIgatKuJQ9XWlZYeeyUhDND3HhzQhh9e5u+mAfK0LC8FIfVT1PMhc8aUJAE=
X-Received: by 2002:a05:690c:7343:b0:6ee:6a2a:a517 with SMTP id
 00721157ae682-6f5204a0aeamr50431497b3.18.1736344047646; Wed, 08 Jan 2025
 05:47:27 -0800 (PST)
MIME-Version: 1.0
References: <20241220072240.1003352-1-anshuman.khandual@arm.com>
 <20250102160402.GB3990035-robh@kernel.org> <Z30adHnQ7ZFaU9UR@arm.com>
 <CAL_JsqLLnh1o4L1=PpNt5brBwZZCgp7mOygByOYakchrzc29Ow@mail.gmail.com> <86wmf5wo8u.wl-maz@kernel.org>
In-Reply-To: <86wmf5wo8u.wl-maz@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 8 Jan 2025 07:47:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKKiEOj=a1k6U-bB0F6-ht7QokDnh3bspHupp-QG=haSg@mail.gmail.com>
X-Gm-Features: AbW1kvawNH_g5vPEtQdvfsRHRiawZ8B5iayR8ahv4DqoIAoRSC9AWkLlkP0eoFA
Message-ID: <CAL_JsqKKiEOj=a1k6U-bB0F6-ht7QokDnh3bspHupp-QG=haSg@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_054729_431487_DC749B5C 
X-CRM114-Status: GOOD (  31.68  )
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

On Wed, Jan 8, 2025 at 5:15=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 07 Jan 2025 22:13:47 +0000,
> Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Jan 7, 2025 at 6:13=E2=80=AFAM Catalin Marinas <catalin.marinas=
@arm.com> wrote:
> > >
> > > On Thu, Jan 02, 2025 at 10:04:02AM -0600, Rob Herring wrote:
> > > > On Fri, Dec 20, 2024 at 12:52:33PM +0530, Anshuman Khandual wrote:
> > > > > This series adds fine grained trap control in EL2 required for FE=
AT_PMUv3p9
> > > > > registers like PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1 which a=
re already
> > > > > being used in the kernel. This is required to prevent their EL1 a=
ccess trap
> > > > > into EL2.
> > > > >
> > > > > PMZR_EL0 register trap control i.e HDFGWTR2_EL2.nPMZR_EL0 remains=
 unchanged
> > > > > for now as it does not get accessed in the kernel, and there is n=
o plan for
> > > > > its access from user space.
> > > > >
> > > > > I have taken the liberty to pick up all the review tags for patch=
es related
> > > > > to tools sysreg update from the KVM FGT2 V2 patch series posted e=
arlier.
> > > > >
> > > > > https://lore.kernel.org/all/20241210055311.780688-1-anshuman.khan=
dual@arm.com/
> > > > >
> > > > > Rob had earler mentioned about FEAT_FGT2 based trap control requi=
rement for
> > > > > FEAT_PMUv3p9 registers that are currently being used in kernel. T=
he context
> > > > > can be found here.
> > > > >
> > > > > https://lore.kernel.org/all/20241216234251.GA629562-robh@kernel.o=
rg/
> > > > >
> > > > > This series is based on v6.13-rc3
> > > > >
> > > > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > > > Cc: Will Deacon <will@kernel.org>
> > > > > Cc: Marc Zyngier <maz@kernel.org>
> > > > > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > > > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > > > Cc: Mark Brown <robh@kernel.org>
> > > > > Cc: Rob Herring <robh@kernel.org>
> > > > > Cc: Oliver Upton <oliver.upton@linux.dev>
> > > > > Cc: Jonathan Corbet <corbet@lwn.net>
> > > > > Cc: Eric Auger <eric.auger@redhat.com>
> > > > > Cc: kvmarm@lists.linux.dev
> > > > > Cc: linux-doc@vger.kernel.org
> > > > > Cc: linux-kernel@vger.kernel.org
> > > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > >
> > > > > Anshuman Khandual (7):
> > > > >   arm64/sysreg: Update register fields for ID_AA64MMFR0_EL1
> > > > >   arm64/sysreg: Add register fields for HDFGRTR2_EL2
> > > > >   arm64/sysreg: Add register fields for HDFGWTR2_EL2
> > > > >   arm64/sysreg: Add register fields for HFGITR2_EL2
> > > > >   arm64/sysreg: Add register fields for HFGRTR2_EL2
> > > > >   arm64/sysreg: Add register fields for HFGWTR2_EL2
> > > > >   arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
> > > >
> > > > In case it is not clear, this series should be applied to 6.13 as t=
he 2
> > > > PMUv3p9 features already landed in 6.13 (per counter EL0 control) a=
nd
> > > > 6.12 (ICNTR).
> > >
> > > So is this a fix that needs backporting to 6.12 or 6.13, e.g. fix for
> > > d8226d8cfbaf ("perf: arm_pmuv3: Add support for Armv9.4 PMU instructi=
on
> > > counter")? It's pretty late in the cycle to take the series for 6.13.
> >
> > Ideally, yes. But given the state of h/w implementations, backporting
> > it later is probably fine if that is your preference.
> >
> > > But does KVM actually expose the feature to EL1 in ID_AA64DFR1_EL1 an=
d
> > > than traps it at EL2?
> >
> > As Marc pointed out KVM only advertises PMUv3.8. Regardless, guest
> > accesses to these registers are trapped with or without this series.
>
> And most probably generates a nice splat in the kernel log, as nobody
> updated KVM to handle *correctly* PMICNTR_EL0 traps, let alone deal
> with the FGT2 registers.

Isn't that this series[1]? Should that have come first, I guess I know
that *now*.

Out of curiosity, why do we care if there's a splat or not for a not
well behaved guest?

Rob

[1] https://lore.kernel.org/all/20241210055311.780688-1-anshuman.khandual@a=
rm.com/

