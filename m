Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF29C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 23:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOJrNSZnWFFH5J4dwHmV6D8vBWbRR9KvhgDVwhWrHFY=; b=ZkcagDA3CV2gwqLXPYLtYLv/hJ
	Z4hqRUWggLO+DW0TtjqoVHG/xQu77z55qBSjpHVPnTcJxCGPx+D0rr4w0WICmS1t65Fu2ZAcQ9sSJ
	njFgf12QT1+fcKSUcgRV4t+TR81lQWfOE4fYEDZ1Ys8Zk0ebgcgPZ/aySZrs5tKKATOBi/7GznX5S
	0SgydcIT7dRcJV7BShxeZYcjQKiJSej6a77E5mP6zz/Ja7agXD4TMgAeme71Sx4H3V3DNEq4wguQ3
	tMH5f9xCi7Yn+1HlI5b4bfty15X6wfVXDqBlbpaL7A43yaOpyagEgzr/DiEFl/+pFMBWoEfy8Wtju
	fj3XrC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiiTU-0000000CvrO-395v;
	Thu, 13 Feb 2025 23:18:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiiS3-0000000CvfE-067O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 23:17:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3C795C3BED
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 23:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3898C4CEE2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 23:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739488618;
	bh=PbaotEZP+m8XRdqTM1LVCryKI8mpwAv32w3xxrZJ6bY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q4DX/p8YgONWF7jft3QA2zVg9bpHaWiEjzj1Lk5a7HJTwGrMuSN5ZSk7axKPE5pSO
	 Gg6k34cRunocqRdktHghHjD8KEAf7VXXbuQMAYjvpf/60/ME3MDH660qBhLO1MM7p7
	 fuULtg3lCK9tUr8UP9j+E8Yum/wP6+i3XYXfCDHCEKKzuFQXnFjW3Jc3GIHSiWEMJV
	 qr5bJANPiopabQ9YXQrMzXriIXaI+6/kaMHRln48X5ZJuH8txC5dZy5MKwH0WkmlxB
	 iXXbkHdEBcFuBQdNR37Uo3Gd7dmD2aqT8XWxnMwhGpL8L4haCQDUElZ1TNSe4yTJNf
	 TRrvnSauK5k9g==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7ee6f54faso173931466b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 15:16:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYGCGnHCemSZdAl39+i84D6zwbwblIEhmPeA+i4kuHIWIhOBJM8y3HCDOCnQf2yPUKEG430YfUJ9Vr6j5kFLhq@lists.infradead.org
X-Gm-Message-State: AOJu0YyLsJGP7PRbEHi1Wsq8MEIb2znnjZJ9R2jmyjWUr1goC67l6n2/
	HwZGO2ZhbJqY5RJAo4EEMd+oC3OS6p+RMZk6O5WAbhpyZmwnOnU+z8l5gpMrztkj9W4HvVT8JCh
	PxhkcTgVJe9BCHfL6XH1sZDvHNw==
X-Google-Smtp-Source: AGHT+IGLrIInhW0p35GiI23AsyVIN74+uSLw8U4olfJQyjWCTit8hu/L8OG/iKoT6DsuxRq4cMhDCBZc2Okeg3yqD4I=
X-Received: by 2002:a05:6402:194b:b0:5de:b947:b22a with SMTP id
 4fb4d7f45d1cf-5dec9d393e8mr13551333a12.11.1739488616517; Thu, 13 Feb 2025
 15:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-10-1c1300802385@kernel.org> <20250213170316.GG235556@e132581.arm.com>
In-Reply-To: <20250213170316.GG235556@e132581.arm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 13 Feb 2025 17:16:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLG4gu6c6=x_wG6XT0WaCC_ahH5eWHk3K9RcF0ZQrDR=A@mail.gmail.com>
X-Gm-Features: AWEUYZlrsV2jIVl8kJ5LHYnXDNpl0R31s2FyNrbBoqdloE1Gq92xxV4Cm7lY0Lg
Message-ID: <CAL_JsqLG4gu6c6=x_wG6XT0WaCC_ahH5eWHk3K9RcF0ZQrDR=A@mail.gmail.com>
Subject: Re: [PATCH v19 10/11] KVM: arm64: nvhe: Disable branch generation in
 nVHE guests
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
X-CRM114-CacheID: sfid-20250213_151659_177620_F970C2A4 
X-CRM114-Status: GOOD (  19.24  )
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

On Thu, Feb 13, 2025 at 11:03=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Sun, Feb 02, 2025 at 06:43:04PM -0600, Rob Herring (Arm) wrote:
>
> [...]
>
> > +static void __debug_save_brbe(u64 *brbcr_el1)
> > +{
> > +       *brbcr_el1 =3D 0;
> > +
> > +       /* Check if the BRBE is enabled */
> > +       if (!(read_sysreg_el1(SYS_BRBCR) & (BRBCR_ELx_E0BRE | BRBCR_ELx=
_ExBRE)))
> > +               return;
> > +
> > +       /*
> > +        * Prohibit branch record generation while we are in guest.
> > +        * Since access to BRBCR_EL1 is trapped, the guest can't
> > +        * modify the filtering set by the host.
> > +        */
> > +       *brbcr_el1 =3D read_sysreg_el1(SYS_BRBCR);
> > +       write_sysreg_el1(0, SYS_BRBCR);
> > +}
>
> Should flush branch record and use isb() before exit host kernel?

I don't think so. The isb()'s in the other cases appear to be related
to ordering WRT memory buffers. BRBE is just registers. I would assume
that there's some barrier before we switch to the guest.

> I see inconsistence between the function above and BRBE's disable
> function. Here it clears E0BRE / ExBRE bits for disabling BRBE, but the
> BRBE driver sets the PAUSED bit in BRBFCR_EL1 for disabling BRBE.

Indeed. This works, but the enabled check won't work. I'm going to add
clearing BRBCR to brbe_disable(), and this part will stay the same.

Rob

