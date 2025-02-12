Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE93EC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 21:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgvxYCwgxvQ5OvtIGJQt8r51cfsgEt1TnpNn51ueELk=; b=laGsadGB+u3u6rX8Oxa7+IthAk
	epZYtL8ydX4EA/N3PeVPKOxDJtuBrMoATjQwR57xF9fZuYB0Kt88llIoWJdXvIWu84iEcZVVX9SY5
	oQiDNzeHSmtLY3igzIwpigbVsvCaGjoU8qQ0xzURA7MgnuQ69ZSDiAPpimdO9I5nutRY/xMmLcMzx
	yJaCNfOXQSEPLwDDjVZdopr/r4bpXbI6KTnT2krvRqB4jFJxAMahNejERzYoK/tRJjkk6HaTMd0S0
	Da3crdVIRjM2QNYTMXVjHwHy3YVItwzUQN0o7UrWmpfwekKq0EQyyzHMcuZLdm6H0Ly5Zb271b7f0
	ghZjqc3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKCe-00000008tBC-2feD;
	Wed, 12 Feb 2025 21:23:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKBD-00000008szp-33WE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 21:22:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 97A865C6236
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 21:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90D1C4CEE8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 21:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739395318;
	bh=SDZa3yUm8eMdJ+DopChXzTIddTJbX082smra7ftQugI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f6bdEUdfML2EJLLPqg7oaAXEjreiiaxpuZdeZWIxWkX5BmnlI0Ns759BlRI74/ghp
	 vlVgph/ATbAjK77TQBzVlecxO6C+iWWMxveBRLtx607UZaZxPtPTghFa2NGlDWHUIB
	 qcaQUxIFE1+Eopk2tEOQdBGiAnFTTtVcchpWQJI2h87vRfPIlURe3eS+kCY2rZ0sHn
	 /bLEGnqFEIAdBU3scK7hpgMC7d8tgl8sURqolclfRY/kVirYBXYiIHglR3FIUy4aph
	 vjLaGBIfbBictiI7k5kzzI9clvUha/7xwGMCLwfsWcNEpNDV9QBnAubXIVDChjE5sE
	 diLydIzy/k5UQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dccc90a52eso221155a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 13:21:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUq6jS3Qb6YjcAELkqksQKgrLzu0YMCbS4s124LcA6TneQOt8ZjNvFe+JsuZhRd0s7RMeDPeLN5sWSuMpNXuOy1@lists.infradead.org
X-Gm-Message-State: AOJu0YyvCiq29a4K9GXSX8UojIfLKNwueb51F2WbT9+h+J1KvOMM3jXS
	/pLeS7bF49PhNKtMaTuR1O5y58RP6TmuERukFDlS2uCylSPV55AFmRTiLUMVfQQixfh50h83S0c
	4lujIP+JbIjkYgRhIrZ7NXnil4Q==
X-Google-Smtp-Source: AGHT+IFzNMN/u5YAaysblVxEg4Q+YFw5JVxdjuFd8OWB8P+QVfyf5SOjL1mYN6bjNAiily+WW5rOwbdgh3DBkVg+tMY=
X-Received: by 2002:a05:6402:34c3:b0:5dc:c943:7b6 with SMTP id
 4fb4d7f45d1cf-5deadd7bca4mr4791826a12.3.1739395317322; Wed, 12 Feb 2025
 13:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-9-1c1300802385@kernel.org> <20250212121046.GB235556@e132581.arm.com>
In-Reply-To: <20250212121046.GB235556@e132581.arm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 12 Feb 2025 15:21:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK7eBmRKL0AC99hj5AipL4jki5rrhSvbZCbUxa0vnEKMg@mail.gmail.com>
X-Gm-Features: AWEUYZnpE68nyNL9FKHPUcQGBCYNpGz2uQm3i3tX-PhnGVffxXGKE7Ii1zlyHSc
Message-ID: <CAL_JsqK7eBmRKL0AC99hj5AipL4jki5rrhSvbZCbUxa0vnEKMg@mail.gmail.com>
Subject: Re: [PATCH v19 09/11] arm64: Handle BRBE booting requirements
To: Leo Yan <leo.yan@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	James Clark <james.clark@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_132159_859000_89810CD6 
X-CRM114-Status: GOOD (  33.57  )
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

On Wed, Feb 12, 2025 at 6:10=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Sun, Feb 02, 2025 at 06:43:03PM -0600, Rob Herring (Arm) wrote:
> >
> > From: Anshuman Khandual <anshuman.khandual@arm.com>
> >
> > To use the Branch Record Buffer Extension (BRBE), some configuration is
> > necessary at EL3 and EL2. This patch documents the requirements and add=
s
> > the initial EL2 setup code, which largely consists of configuring the
> > fine-grained traps and initializing a couple of BRBE control registers.
> >
> > Before this patch, __init_el2_fgt() would initialize HDFGRTR_EL2 and
> > HDFGWTR_EL2 with the same value, relying on the read/write trap control=
s
> > for a register occupying the same bit position in either register. The
> > 'nBRBIDR' trap control only exists in bit 59 of HDFGRTR_EL2, while bit
> > 59 of HDFGRTR_EL2 is RES0, and so this assumption no longer holds.
>
> s/HDFGRTR_EL2/HDFGWTR_EL2
>
> > To handle HDFGRTR_EL2 and HDFGWTR_EL2 having (slightly) different bit
> > layouts, __init_el2_fgt() is changed to accumulate the HDFGRTR_EL2 and
> > HDFGWTR_EL2 control bits separately. While making this change the
> > open-coded value (1 << 62) is replaced with
> > HDFG{R,W}TR_EL2_nPMSNEVFR_EL1_MASK.
> >
> > The BRBCR_EL1 and BRBCR_EL2 registers are unusual and require special
> > initialisation: even though they are subject to E2H renaming, both have
> > an effect regardless of HCR_EL2.TGE, even when running at EL2, and
> > consequently both need to be initialised. This is handled in
> > __init_el2_brbe() with a comment to explain the situation.
> >
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Oliver Upton <oliver.upton@linux.dev>
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > [Mark: rewrite commit message, fix typo in comment]
> > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  Documentation/arch/arm64/booting.rst | 21 +++++++++
> >  arch/arm64/include/asm/el2_setup.h   | 86 ++++++++++++++++++++++++++++=
++++++--
> >  2 files changed, 104 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/=
arm64/booting.rst
> > index cad6fdc96b98..0a421757cacf 100644
> > --- a/Documentation/arch/arm64/booting.rst
> > +++ b/Documentation/arch/arm64/booting.rst
> > @@ -352,6 +352,27 @@ Before jumping into the kernel, the following cond=
itions must be met:
> >
> >      - HWFGWTR_EL2.nSMPRI_EL1 (bit 54) must be initialised to 0b01.
> >
> > +  For CPUs with feature Branch Record Buffer Extension (FEAT_BRBE):
> > +
> > +  - If EL3 is present:
> > +
> > +    - MDCR_EL3.SBRBE (bits 33:32) must be initialised to 0b11.
>
> Can MDCR_EL3.SBRBE be 0b01 ?

Yes, in fact I think that should be required instead. If it is 0b11,
then recording of secure EL0, EL1, and EL2 would be allowed and
accessible to non-secure world. Though I suppose EL3 could explicitly
pause BRBE instead.

> > +
> > +  - If the kernel is entered at EL1 and EL2 is present:
> > +
> > +    - BRBCR_EL2.CC (bit 3) must be initialised to 0b1.
> > +    - BRBCR_EL2.MPRED (bit 4) must be initialised to 0b1.
>
> Should clarify BRBCR_EL2.TS to be initialised to 0b00 ?  Arm ARM
> claims the reset behaviour of the TS field is unknown value.  The
> assembly code below actually has initializes the TS field as zero.

Humm, we don't currently care what it is initialized to because the
timestamp is never used. We would care in the future if we use
timestamps. Will 0b00 be the only correct value? I'm not sure.

> Except the above minor comments, I read the assembly code and it looks
> good to me:
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Thank you.

Rob

