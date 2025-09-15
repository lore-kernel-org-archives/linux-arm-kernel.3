Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DECCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+Wo4LOKOK6vQ7K4HYgfgfOSwUdpnB4dRYCTrPRiDio=; b=FP0LTIFt4DPSCarif1oXs6eFSq
	8OkCm5vKepthxVdom6zkL2MoqD9xixQPQQ1IsQfGnYoVa41NLWRvVjIiNqNxilTE7hRgcwfYrh2rJ
	WCkz62W45LWVAFhQLmCwnYwT6Tl63NDQbVkMR3R4DkisNvcPSZdV5aSAD2dN0eP7SMVwMKutkNFaF
	V2JWC3dNMpBYIT3EQJbeDU+PhicKt4Vy4uOdEZL2LCKLRLNDCyXlUhTx2qtZvyGMzwQHBgfN+OBEl
	HoiGpD+Wlx0QrWhL8BC1Z2momGOjH6G7UsiC9L4bqfZR/Vn+1w5OZf84fax3KBoetjk75pgVh65ei
	2UnmpzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7rO-000000042hA-1Mhr;
	Mon, 15 Sep 2025 11:59:06 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7rL-000000042fu-20lU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:59:04 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-40809f7ffc7so19923915ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 04:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757937542; x=1758542342; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+Wo4LOKOK6vQ7K4HYgfgfOSwUdpnB4dRYCTrPRiDio=;
        b=ne65M2J7ZkQAwhEXxrHu00YUT4pQWDiMrP633cB3O5/GDFgviT8Qe2HFO4W51Ep1oP
         L8o4pacU3xIw4TmsDXC4aoKdZ2Y/NvYRniLXbLXxBJnto6FPgX8WbTRU2xQs0BjO7f7O
         S9ErupvpPRFfPM6EqYFoYSgWpLl33NznxF/Tg8J2SZoppiY3wlUqOJZYegJoCkExtrPh
         MBrIt4TPqsFsTCss2csdT18SIu1N9tKUIIXFN4/z/2Dv1hqoapAtmfEehWW/O8LEdPiI
         Af/4MHF34nqTVtaVBfrGOjWAsQYU0YkGahtTyw7+k5JsQYTiYCw3BTnpUn/YU6UtgseR
         Pa0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757937542; x=1758542342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+Wo4LOKOK6vQ7K4HYgfgfOSwUdpnB4dRYCTrPRiDio=;
        b=bPSLw/GAmQGhgL971iRf1F8932vlW6hbHCC9c/hc7I7QkU7sWxbl5RMC9ZTDAIs79+
         Jn6MLWp9pXIm16zzFKueNHRXddoOsjXV9lSQ6+2MRNHCz72J/G/MSIi6O1quaNzqeMK7
         ecUIP4qkZUOd9kovdyLB3cvQtyKjvscyDNj/7P9PpbbGH1V27ZgOVhtmDLN7IdOknMaC
         UxHsMjSSoqMz62ZzQx1LwUgfGPZb7XJLdSkKy4gSomamVq9JgofiTKMvOxNKsrltoyDd
         hw8t4hGRjLHSIMYjV72Wb6MplY+hesr/IHvT3MhNmz+QqCN11TqzX1C3fiKFXM0Lay8z
         f9og==
X-Forwarded-Encrypted: i=1; AJvYcCUlYD8DGYm3H26Nep2vGPK42mp1ue5eMC3wSKlZTlzUwmsf11tLZGLjGBd/TQYWRJR1YQWtD9vNgqyrbTnp3sg1@lists.infradead.org
X-Gm-Message-State: AOJu0YylYSYDB797fAwBzQqJnp7i5JshcWjS1mmgWGm+fSg8naLzcfNk
	YCI8/iIYE68cRGBKw0z3o5HFKzWDRERXaOPqwZASCElI5npa2R3gAAaS+taj01LwWDeypE06v4c
	6hvb3KcHj5lDoJuTj8MhlES+vt3xf3vcWW0TJce9sKA==
X-Gm-Gg: ASbGncuGf09ktqgGj736uVzWKj02/m6VYVF5UI4ZAOJeabP4b2MlzJdtKwkpJfiZiXs
	HxvbBwDUKjzvWqGubUg5w9Hx+Kwvs6yLfJoF0e6M4P6ey1UuDJ22MgUiG7ivbP4wqCeX3onWZ5s
	rErJXXi3xlHarrUfGtezbLNYtlsa1ueSpO0+AbS6pe789eL5vvHBnQC08iNhE7YEbWUy4ZEvWzM
	2sAH3UdXtz4aVVEEyx7aquOTji93BGF4Z26gFHJ
X-Google-Smtp-Source: AGHT+IHTDrsD99f5SQM6r2xQgpJxH71mXjBKOGQCXs9gTx5sBfVD90LiO27Njr8hwWJISfU1lWc6TvRVPNc4XTqs0j4=
X-Received: by 2002:a05:6e02:3312:b0:423:fd3b:ef72 with SMTP id
 e9e14a558f8ab-423fd3bf017mr46668695ab.0.1757937541951; Mon, 15 Sep 2025
 04:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
 <f740b716-6c8b-46a5-31ae-ecc37e766152@kernel.org> <aMftcHLgBvH76erX@willie-the-truck>
In-Reply-To: <aMftcHLgBvH76erX@willie-the-truck>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 15 Sep 2025 17:28:48 +0530
X-Gm-Features: AS18NWDM6MzdjjPsw0ij-OL-CWk_57B0_4S3ilJtO7cErapGgoLvo5MzWEvUv3s
Message-ID: <CAAhSdy3wJd5uicJntf+WgTaLciiQsqT1QfUmrZ1Jk9qEONRgPw@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] Add SBI v3.0 PMU enhancements
To: Will Deacon <will@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_045903_753137_7C756287 
X-CRM114-Status: GOOD (  21.14  )
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

Hi Will,

On Mon, Sep 15, 2025 at 4:11=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Mon, Sep 15, 2025 at 12:25:52AM -0600, Paul Walmsley wrote:
> > On Tue, 9 Sep 2025, Atish Patra wrote:
> >
> > > SBI v3.0 specification[1] added two new improvements to the PMU chape=
r.
> > > The SBI v3.0 specification is frozen and under public review phase as
> > > per the RISC-V International guidelines.
> > >
> > > 1. Added an additional get_event_info function to query event availab=
lity
> > > in bulk instead of individual SBI calls for each event. This helps in
> > > improving the boot time.
> > >
> > > 2. Raw event width allowed by the platform is widened to have 56 bits
> > > with RAW event v2 as per new clarification in the priv ISA[2].
> > >
> > > Apart from implementing these new features, this series improves the =
gpa
> > > range check in KVM and updates the kvm SBI implementation to SBI v3.0=
.
> > >
> > > The opensbi patches have been merged. This series can be found at [3]=
.
> > >
> > > [1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/=
v3.0-rc7/riscv-sbi.pdf
> > > [2] https://github.com/riscv/riscv-isa-manual/issues/1578
> > > [3] https://github.com/atishp04/linux/tree/b4/pmu_event_info_v6
> > >
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> >
> > For the series:
> >
> > Acked-by: Paul Walmsley <pjw@kernel.org>
>
> I was assuming this series would go via the Risc-V arch tree so please
> shout if you were expecting me to take it via drivers/perf/!
>

Based on offline discussion with Paul, I will take this series
through the KVM RISC-V tree.

Regards,
Anup

