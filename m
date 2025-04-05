Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB88C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 07:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XX7bM7smVAeMPEyjLjvRTNRXt7yjh/9WIZIsi5RXZB8=; b=Jx9c3fG/+OPK9jf4SkkZN/hpDh
	6Jqs8dwJUpa5wnNmmzffk6LPvuuo1U1vZw8nmrJx/HUfowV0brFHf9m7D5CW01fdYOXJ4DypnvelV
	Xuuq5zJIkqpPppNiNnu8TEvrk9s4Qt5K6jJzfpG8SGjGcQF2I9L9BA0T4j2TSCGgbdTN8emYcyYv5
	IMxnAZsUGeX+hEdJrNbvSOJ0jEL76v6nykQd631a7s2yfEWlmZ+d3PVmQV5NceOveYG/K5o8yOyWr
	GTxWVG6P8jDipm07jA4hc4WGyna8TLYLckElckVGYB+LQwO8HePGbhcGoEiLhyjyq/GKICLU2xggy
	dfplLE6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0xve-0000000DcUd-3dPS;
	Sat, 05 Apr 2025 07:26:58 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0xtu-0000000DcNb-0oK3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 07:25:11 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6ecf99dd567so30417496d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Apr 2025 00:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743837908; x=1744442708; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XX7bM7smVAeMPEyjLjvRTNRXt7yjh/9WIZIsi5RXZB8=;
        b=dBhumU2fvZmtresqScUH/Nm1z5F9cthHyhs8YNaDgm/CBacW654AiPYT6u0m7QpF5s
         /cTo7ALYx7AUvBkpL7ebDj5awSfGtfIDgKOzL9dvH8XHMi15rYvFEINu3/MhkuHKvvl0
         sq4thwgry7kPRmqVKKxcRjpCKoOLbwzUVpgzXTVVY5iFgtNce4acN2OHnZVInysAntFb
         Re3otSGp8zYEABzAQ6gk+lm5hvZM90k4k5vcB0dAh45OmJrXXJxuTnBLUOfyC9ROVXkT
         TcrIpZjR/jKjw2rS0SSxPeulKmWEt9hh9FhfZtjBasyi3AO2DuT5LCh+CvDHbmaPtZxw
         bCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743837908; x=1744442708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XX7bM7smVAeMPEyjLjvRTNRXt7yjh/9WIZIsi5RXZB8=;
        b=Zb2mHuvJiQrvw2way7rlqzTSGDsb5c5fvA81fb9QTtBo/HK9k9OVU6iD36HFCWGkhi
         6enyck8tyZ4epthAllujQGCslnxBRl5OuibVSzRYCRqVvJfYDKCwCYAhxruYXFvcFyaL
         c7gCfvaaIR80Zof/kMPcB6ZBaMVuRKnnJoIShBbqXEvBGDgg16gZ33rgIXrIZUhdAg9Z
         CMpbG0OmlWlK/MzGOw1T0Pfn7FmV2/MTXgc0ecFuuS9zBamXK3yM+nnJmaW111VvN/3L
         vJYINj22/epVTexiELui+spIDkJsOZ6pbFOvvdjloNShKw6H9gzVT1Sg13zWalp8GSng
         ZUQw==
X-Forwarded-Encrypted: i=1; AJvYcCVEF7qkR++CqFSPJY5EvVaD4cPCABzR8+2TLDxsfxJIA8x4HgUWxKmFB4jEu8tnYpkmHNeMnlUBPTiyTBtVbZ2s@lists.infradead.org
X-Gm-Message-State: AOJu0YyUn5cNjFosBcMIHOIh7xa/vWvhnS6UcFN1RvkKEN9nXPB8P1et
	l4X6+3WOSKMPm+xSYLH0AnO9Xjv9kJ1eTzI2ScRr8iuEdA+Wk0a0bG9wgG2u/01z0GJM4IpwVWQ
	XZQGDpaSnqVT3CDNOYR3V6T+zbnfJJH5fBuGl
X-Gm-Gg: ASbGncu9pC05n0mAZ7HnfaOaizvK1rx36HTWP13hf6qPED7Sgz2X2bfuhhYbEy2Cw+V
	bU3rJAlLp5s5QrIgmRVJnyKzFTK8UxN1azIi16Iv3B/Y4+VUSLptZ2EHmBJue3gZ4Gf3mN0YkAU
	Mxm6omzOB7qsmnTjehWXHDPBulphkJ
X-Google-Smtp-Source: AGHT+IEBa0i9vPf6f61GmMvD/z+/H4ytphtU5TfuJkfc666vsFTrSVQNYgEVIEFGNoq5dLW5dX8oZPwKczqMDob6pwE=
X-Received: by 2002:a05:6214:1942:b0:6e6:5efa:4e01 with SMTP id
 6a1803df08f44-6f0584992abmr98688636d6.20.1743837907386; Sat, 05 Apr 2025
 00:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250405001042.1470552-1-rananta@google.com> <20250405001042.1470552-3-rananta@google.com>
 <CAL715WKaAHSgUhtMMT3Ztw90mMoHpVLdKUgVM15xx6yoUws9+Q@mail.gmail.com> <Z_CaiKsi42ho8DoK@linux.dev>
In-Reply-To: <Z_CaiKsi42ho8DoK@linux.dev>
From: Mingwei Zhang <mizhang@google.com>
Date: Sat, 5 Apr 2025 00:24:30 -0700
X-Gm-Features: ATxdqUFSBfa7-XbKoczeoC0dul0kdW1Dd_fQ6H4YubDg3n4C0rMG-CxZUVYFoCQ
Message-ID: <CAL715W+v-BgHr5FwgDnct5nQ3RV-FXMkuSaCG7DaDoQVnZeDpg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] KVM: selftests: arm64: Explicitly set the page
 attrs to Inner-Shareable
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Raghavendra Rao Ananta <rananta@google.com>, Marc Zyngier <maz@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Oliver Upton <oupton@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_002510_253030_A5A9104A 
X-CRM114-Status: GOOD (  37.50  )
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

On Fri, Apr 4, 2025 at 7:51=E2=80=AFPM Oliver Upton <oliver.upton@linux.dev=
> wrote:
>
> On Fri, Apr 04, 2025 at 05:31:49PM -0700, Mingwei Zhang wrote:
> > On Fri, Apr 4, 2025 at 5:10=E2=80=AFPM Raghavendra Rao Ananta
> > <rananta@google.com> wrote:
> > >
> > > Atomic instructions such as 'ldset' over (global) variables in the gu=
est
> > > is observed to cause an EL1 data abort with FSC 0x35 (IMPLEMENTATION
> > > DEFINED fault (Unsupported Exclusive or Atomic access)). The observat=
ion
> > > was particularly apparent on Neoverse-N3.
> > >
> > > According to ARM ARM DDI0487L.a B2.2.6 (Possible implementation
> > > restrictions on using atomic instructions), atomic instructions are
> > > architecturally guaranteed for Inner Shareable and Outer Shareable
> > > attributes. For Non-Shareable attribute, the atomic instructions are
> > > not atomic and issuing such an instruction can lead to the FSC
> > > mentioned in this case (among other things).
> > >
> > > Moreover, according to DDI0487L.a C3.2.6 (Single-copy atomic 64-byte
> > > load/store), it is implementation defined that a data abort with the
> > > mentioned FSC is reported for the first stage of translation that
> > > provides an inappropriate memory type. It's likely that Neoverse-N3
> > > chose to implement these two and why we see an FSC of 0x35 in EL1 upo=
n
> > > executing atomic instructions.
>
> Ok, can we please drop this second reference?
>
> This is talking about something else (FEAT_LS64) that happens to share
> the same FSC as an unsupported atomic instruction. I mentioned this to
> you internally as an illustration of how different implementations may
> behave when determining if the attributes support a particular access,
> but it isn't actually relevant to this change.
>
> > nit: It's likely that Neoverse-N3 chose to implement this option (the
> > first option) instead of reporting at the final enabled stage of
> > translation
>
> I would much rather we rely on the language that describes what the
> architecture guarantees rather than speculate as to how Neoverse-N3
> behaves.
>
> Mentioning that the breakage was observed on Neoverse-N3 is still useful
> to add to the changelog.
>
> > I have minor question here: The DDI0487L C3.2.6 (Single-copy atomic
> > 64-byte load/store) mentioned
> >
> > """
> > When the instructions access a memory type that is not one of the
> > following, a data abort for unsupported Exclusive or atomic access is
> > generated:
> >
> > =E2=80=A2 Normal Inner Non-cacheable, Outer Non-cacheable.
> > """
> >
> > So, the above is the "Normal Inner Non-cacheable", but in our case we
> > have "Normal and non-shareable" in stage-1 mapping, right? I know it
> > is very close, but it seems the situation is still only "one bit" away
> > in my understanding...
>
> This citation relates to FEAT_LS64. If you look at B2.2.6 instead, it
> reads:
>
> """
> The memory types for which it is architecturally guaranteed that the
> atomic instructions will be atomic are:
>
>  - Inner Shareable, Inner Write-Back, Outer Write-Back Normal memory
>    with Read allocation hints and Write allocation hints and not
>    transient.
>
>  - Outer Shareable, Inner Write-Back, Outer Write-Back Normal memory
>    with Read allocation hints and Write allocation hints and not
>    transient.
> """

Agree that the above should be the right place to cite. C3.2.6 seems
to discuss atomic instruction with memory attributes bits(which points
to MAIR_EL1 and MAIR_EL2?). In this case, it is more related to
shareability bits instead.


>
> and
>
> """
> If the atomic insturctions are not atomic in regard to other agents that
> access memory, then performing an atomic instruction to such a location
> can have one or more of the following effects:
>
> [...]
>
>  - The instruction generates an IMPLEMENTATION DEFINED fault reported
>    using the Data Abort Fault status code of ESR_ELx.DFSC =3D 110101
> """
>
> The memory type used by KVM selftests is *Non-Shareable*, which is not
> one of the memory types guaranteed by the architecture to work.
>
> Thanks,
> Oliver

