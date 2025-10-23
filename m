Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7951ECCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGypRWtRH4GCCLjVOjdaAYR1rBxJQZZWkASDRYy047w=; b=ao9AdR13rpNPpJ5RyMqqFpec0R
	wJuJlCimRDugUVOugRZFQd7jgte1UpJIDNFrlmgOB+Lfh0giVAVVXNItUl5dVpMzpwcwg0jue7rkL
	tEQ3UqT//QQjHxY3xtclJ33cwvtEYgbNpP8fB/KRZ7+M4Bym5WT4o+FykbWRyqTJHygXmIRNpS3l4
	Ztgubdpd3FUGqUY93PKFsv4mdffR+GelVVnHGeIPHHY70+Shk1Ln9iCq5LDvYo5zdxaWvKcDjAI3w
	m3Gc+1NEkbkLc34ZPBJr0ZQgRNH1N4RpneSp8JedUVKB33dcmKDUoWRd+9Di8uR5U8DKFgAz08sO2
	e9pCWnfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvSh-00000006QpB-1HXV;
	Thu, 23 Oct 2025 13:34:39 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvSd-00000006QoP-2Wzs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:34:37 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6536323e4d5so31255eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 06:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1761226474; x=1761831274; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGypRWtRH4GCCLjVOjdaAYR1rBxJQZZWkASDRYy047w=;
        b=GxN9bLnVJ8g90y5qyukmphIIx4R0NMu/6Vwbk6VJlY0u2jkzxkcxalQ3B/SFUmxRD4
         5tteaeJuIW0SQkKEZyrV6imIzQ7dtHixuyN+wM8dFRfLW/MXr2b4Ggct29P6tgeT2KL6
         CQiWFyGCy5rm4UMIr8HBblOF/Q5N7Xvit4R2rz154X8t1GZTVqGkRzAYwhOEsDpGAYrM
         xIUo8xXO2WnIGQK4uXHBLro+fnXcLqVrNgh6KuZBfrHQzCAPGuUE2zPXp3Drr1wY3d6C
         mIwWJCZm+gSAYV68oTuKN67mPwZPDZfibhFwyuCvZn+P1ygYr28WmWoZuvKCALVx67gm
         gblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761226474; x=1761831274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGypRWtRH4GCCLjVOjdaAYR1rBxJQZZWkASDRYy047w=;
        b=Cpr7U57iuT6QoO2NfKvWWoVnASVYMM4v3YoTLi/3Lau7vyHapheGyYmRxR8c90vgMa
         r4795kkUL3C8AF0HOJ6kWcpfRpDzXhbDyI2duZ2rYmpCbb/SUWuzAV/tPqMhfoRwKzRg
         D8SN+7LnscJaOt3ZI9Rau+tqELFHUlr3WjIMt0PwN4NNyY4xoJdwem8IsX9PCggxUmYg
         SAlp3tjpYDJ/ym8xeyUwiRSlMiqSN0IWIRy9vlU56qeawEfNe3sKkJ2+Ag76iCVCJIwg
         VdyWYZ0SOboSsblxAvuwaArPqj6p3JqvKlxaovbWRH4nZKMAbYJcdXibjXl5iHcjqxJA
         TAtw==
X-Forwarded-Encrypted: i=1; AJvYcCUxfr/fRbuTMJLHwZkqqDXs6ZhgTrHmIulfjYh3bXKem0rOHNBQ2L1JhYgKxAetH0kTYuXERM1iBVpHH7unVJ54@lists.infradead.org
X-Gm-Message-State: AOJu0YxvfdfpVep6l8nWPy5TpNGv0WFp9v4jfJr2iVIN2vDN6jyOKLE6
	9RRLNlyEEjycO9c+vztnKdYN7di7t6EVBKmgJ0raD2K9z9tu54LEJ1D/9hft1RWIz4J65erLAQf
	WFj2OXNpfhoDkhJ+fY3kM3y3okAx1Sv0MSWqi8g9O
X-Gm-Gg: ASbGncuFCHvO0dC1hYoxSzPBY5UJjoohvlnP5K2ahTJh0xGacrtQrGqUzJv8pjlGQXh
	t4McNOiDtV4+i0yTWOOZXsX2CgamN78Niv26QCyoKrtd9/mThVqWKN3Qe7YIhhzHUfJvsbFRgta
	ialobOKzT6drfUl0qJXBoHci/st+54dHiBHjKqMboua2Km5ksXDvCpSzjDcakxH9HgIywDHIjQC
	0vHwlavacSD6l7fK2Pqk3D/sMZLGEEVcMr6/6jiTyJ4ql/fOIbcUGHUzS3MLV/AgTkihgO7iZlT
	IunQY+GKyGYCokXabwhSTdLTLVtlyw==
X-Google-Smtp-Source: AGHT+IFbCH1wMJbHft6KCFRjWJmRFnsdT6NCdLjJearbDRj4mpBcZOH6HHk1KJKlPqzTm3qoTE++x2VsPguqGpd+ivA=
X-Received: by 2002:a05:6871:a90b:b0:3c9:88eb:39ba with SMTP id
 586e51a60fabf-3cd88b2efabmr2240846fac.2.1761226473911; Thu, 23 Oct 2025
 06:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <0f006338-e69b-4b3f-b91f-0cc683544011@kernel.org>
 <20251022114527.618908-1-adriana@arista.com> <20251022201953.GA206947-robh@kernel.org>
 <CAERbo5z6BzHqQxXdxPxmxE_eDR7GGGbt3A8kB0gQiWFBE-28Ug@mail.gmail.com> <CAMj1kXGYinTKiyYhNYWJvoJeUJScCGnyq=ozLgjKAm7_wzG8QA@mail.gmail.com>
In-Reply-To: <CAMj1kXGYinTKiyYhNYWJvoJeUJScCGnyq=ozLgjKAm7_wzG8QA@mail.gmail.com>
From: Adriana Nicolae <adriana@arista.com>
Date: Thu, 23 Oct 2025 16:34:22 +0300
X-Gm-Features: AS18NWDeHYUzE6dvFi0wYxAayb8teAidHkRUOvFoL7_vU4rg66Qd1SaXRDkvd7M
Message-ID: <CAERbo5waY-=6BLZ2SiJSFAXzvU57mJdM9q05vAZw8zR2yExQ5w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] DMI: Scan for DMI table from DTS info
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Rob Herring <robh@kernel.org>, krzk@kernel.org, jdelvare@suse.com, 
	frowand.list@gmail.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, vasilykh@arista.com, arm.ebbr-discuss@arm.com, 
	boot-architecture@lists.linaro.org, linux-efi@vger.kernel.org, 
	uefi-discuss@lists.uefi.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_063435_867906_56D02A69 
X-CRM114-Status: GOOD (  37.40  )
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

On Thu, Oct 23, 2025 at 11:21=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> On Thu, 23 Oct 2025 at 04:21, Adriana Nicolae <adriana@arista.com> wrote:
> >
> > On Wed, Oct 22, 2025 at 11:19=E2=80=AFPM Rob Herring <robh@kernel.org> =
wrote:
> > >
> > > On Wed, Oct 22, 2025 at 04:45:25AM -0700, adriana wrote:
> > > > Some bootloaders like U-boot, particularly for the ARM architecture=
,
> > > > provide SMBIOS/DMI tables at a specific memory address. However, th=
ese
> > > > systems often do not boot using a full UEFI environment, which mean=
s the
> > > > kernel's standard EFI DMI scanner cannot find these tables.
> > >
> > > I thought u-boot is a pretty complete UEFI implementation now. If
> > > there's standard way for UEFI to provide this, then that's what we
> > > should be using. I know supporting this has been discussed in context=
 of
> > > EBBR spec, but no one involved in that has been CC'ed here.
> >
> > Regarding the use of UEFI, the non UEFI boot is used on Broadcom iProc =
which
> > boots initially into a Hardware Security Module which validates U-boot =
and then
> > loads it. This specific path does not utilize U-Boot's UEFI
> > implementation or the
> > standard UEFI boot services to pass tables like SMBIOS.
> >
>
> What prevents this HSM validated copy of u-boot from loading the kernel v=
ia EFI?
The vendor's U-Boot configuration for this specific secure boot path
(involving the
HSM) explicitly disables the CMD_BOOTEFI option due to security
mitigations, only
a subset of U-boot commands are whitelisted. We could patch the U-boot
to include
that but it is preferable to follow the vendor's recommandations and
just patch U-boot
to fill that memory location with SMBIOS address or directly with the
entry point.
>
> > Because there's no UEFI configuration table available in this boot mode=
, we need
> > an alternative mechanism to pass the SMBIOS table address to the kernel=
. The
> > /chosen node seemed like the most straightforward way for the bootloade=
r to
> > communicate this non-discoverable information.
> >
> > I wasn't aware of the EBBR discussions covering this. I've added the
> > boot-architecture and arm.ebbr-discuss lists to the Cc. If there's a pr=
eferred
> > EBBR-compliant way to handle this for non-UEFI boots, I'm happy to adap=
t
> > the approach.
> >
>
> For the record, I don't see a huge problem with accepting SMBIOS
> tables in this manner, but it would be better if a description of this
> method was contributed to the DMTF spec, which currently states that
> the only way to discover SMBIOS tables on non-x86 systems is via the
> SMBIOS/SMBIOS3 EFI configuration tables. Doing so should prevent other
> folks from inventing their own methods for their own vertically
> integrated systems. (Other OSes exist, and from a boot arch PoV, we
> try to avoid these Linux-only shortcuts)
>
> However, the DT method should *only* be used when not booting via
> UEFI, to avoid future surprises, and to ensure that existing OSes
> (including older Linux) can always find the SMBIOS tables when booting
> via UEFI.
>
> Also, I would suggest to pull the entire entrypoint into DT, rather
> than the address in memory of either/both entrypoint(s). Both just
> carry some version fields, and the address of the actual SMBIOS data
> in memory, and the only difference between SMBIOS and SMBIOS3 is the
> size of the address field (32 vs 64 bits)
I understand the points raised about UEFI taking precedence and the
preference for standardization (DMTF). If this DT method is accepted
as a fallback only for non-UEFI boots like this one, the kernel implementat=
ion
will respect that precedence.

Regarding the alternative to place the full SMBIOS entry point structure in=
to
a DT property (as a byte array) instead of just its memory address. Both
approaches seem feasible from the U-Boot side. I opted initially for passin=
g
the address to reuse the existing kernel functions (dmi_smbios3_present and
dmi_present) which already handle mapping and validation of the entry point
read from memory (as done for the EFI case).

Which model (passing the address or the structure directly) would the kerne=
l
maintainers prefer if this DT fallback as an alternative for non UEFI
boot is ok?

Adriana

