Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2FECCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/SRRF9O63pbHgjotOPw9FoaRhCzY9WZbEnNDKc15+s=; b=kmlN0qUl3XcDUHMCVNfQiykJfg
	1JIxUAvh5G/6/2T8NO30K0XgRbEwBAkeJbg7qd9HCz1fnVd6DguHMbJDmvnQDxCb4nVMFqBOC2tSS
	K5OrxE7zRfX0zM1S3+l3ulh4FvTyCpc4razIyqwidEFMcUPQfuynsDgd6/jAxL3NCnCYcPRQQJdxI
	alSveuRdb4tc7a91wsESUgW5Mm6tYzMH8MJpIUxsPZ67LcAacDBWM3Y6WKwrADqYLw9WTM/MB3eTe
	9VYPyW4k2bVJGPVBXDcOoOGbnGjmLlRmJsuV8wTWmYsGvaXx2mJrqEo2XW2LHaK7LjeD55hFcdcKm
	85MXGy9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkqr-00000005hIT-0A2y;
	Fri, 31 Oct 2025 08:51:17 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkqo-00000005hHi-1hw7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 08:51:15 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-3d87103b16aso356612fac.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 01:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1761900673; x=1762505473; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/SRRF9O63pbHgjotOPw9FoaRhCzY9WZbEnNDKc15+s=;
        b=bNHuH5sEFIUpRrx5lK1PAIO7z39XtLmtYDbOQzK/CP3DoZmM3BJLgZyspS90f2398c
         ipIY7SES+eiy3tgMVZANUt7X7ciJnNMi2KiSOf3ORSklCywbOj5p6+000zjj9JCUhOof
         4sojKE6pCdu9AZj7MLpLHLqr0wDPt3lqYZ53SZqII/sq/lzKNYxo/sTVxJ+QKkhkDWnJ
         PhcNNKyPOviLznH9hGD3pOCG4+RXPY9dz4E2FKltcgkQlbF4WZ3NLkMcSlUdv+V+UzYn
         cyiM+3atqJWr7Dp1NA3ljC++W94KDdp+lTBW3zOBjhZmkd7/45Ym7T/fQe5IVxhhqh3v
         4X4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761900673; x=1762505473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/SRRF9O63pbHgjotOPw9FoaRhCzY9WZbEnNDKc15+s=;
        b=IsrekSsmCT+20nkJcJ7t2xruduLTkYUQ/hrcuthncCOqjwgFKRXCMHFaunSHS/vCHQ
         woNilF+cMy6NSiYMStInPPuOReBVyc7Df75agM1AY9RFK8Z919emY/s5Bd7wFKZnHORL
         8zev/GZ6bbCiFIu6o0btAWOuQnDHhjJbJjCe0kMRHIO6Af2lHpotAuRKmhPaVRDyHNEp
         UMki5aImBuHYjlgDwDUa4UssDXU98K8g9j+B6JPHEIJtLBVF+59rtz9KfgUdrcNg+0qx
         fsBuP3FcqW545IV4Lz1VsqCUFmQqLwBp7Lq9DpT0FleH2ZkAkB0SKX52NhCTAVQm5I6z
         NbTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX42hbkTz/8NXJ+PTSPQl98MuhgrBp4zTMBVji7t2/dFdvLrGWnsoUF919Ea63uO436D7q/s7Jkie3yzNnB16AW@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjyg0R/n2Mcu1bTRUpRdug6PaX7udDBkeLNO3sHgjt+C2wnaKy
	F0S4rxRdHxERXCVJLOb0iF2dKYvrh3ecDYJuaGEqxWyu72HYVwC1WfFnz9DomthAR7SPl4xbnEn
	HvrtJ6vMGZT72pzeyQqJEaw3JSp/hCrR08NWiZ8ig
X-Gm-Gg: ASbGncuGjR5yWtRujc1DVwaoXCpQP8ngQNlNqMYGohVGuo3iMGInt65gcWDGhdEV823
	xVgajeJNUUtX4bJtySvFdal8ugT3FpH4Dlizk8gBo1QLUpaiUnmWlt8+h/NVdMxMvsICSmqBEBw
	krUpy9dIK5eWMaidqnyv70JsFGYHPFJBr4BSOv6ldIBeVqmgenyhIbSBOOz2qo72zjhXIZbKNO6
	MKNN3L1HZMYLigGIKH/8BPJEMZ7O+4TDe4mSRzcoHIKsHogj+Euv/nYm6EJwOhUbMOOjvu30epu
	7B8ErMC4BuoM7WjSQ8ne8zUON4M=
X-Google-Smtp-Source: AGHT+IEFsWxw95ytjOxiVtq9eExQa0umqrN5dvl/ZX3mASj+jN68RLW/a3TijRIKLRi/zBLZ0nKoZjlEyZzn4jIh/98=
X-Received: by 2002:a05:6808:18a1:b0:438:1b55:9fd9 with SMTP id
 5614622812f47-44f95fe6ac7mr606925b6e.6.1761900672908; Fri, 31 Oct 2025
 01:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <0f006338-e69b-4b3f-b91f-0cc683544011@kernel.org>
 <20251022114527.618908-1-adriana@arista.com> <20251022201953.GA206947-robh@kernel.org>
 <CAERbo5z6BzHqQxXdxPxmxE_eDR7GGGbt3A8kB0gQiWFBE-28Ug@mail.gmail.com>
 <CAMj1kXGYinTKiyYhNYWJvoJeUJScCGnyq=ozLgjKAm7_wzG8QA@mail.gmail.com>
 <CAERbo5waY-=6BLZ2SiJSFAXzvU57mJdM9q05vAZw8zR2yExQ5w@mail.gmail.com>
 <CAMj1kXHin5YacS98ttzHqFqy6HMukXKoLZtr-+bLwVRsWZUugQ@mail.gmail.com>
 <CAERbo5zgS8XoGcFB3wejqDpx14-SBr5oWn7pu3=PE0djRiKZqg@mail.gmail.com>
 <CAMj1kXEnSKF4VcMdOvUUuM-pOEWB38qPhWvUm13rnkQiZXp6SA@mail.gmail.com>
 <CAC_iWjKQ5Smx5hOM9Lgyq_KD6D7OXyDsfJ4mcEnfw4JuRtxy-g@mail.gmail.com> <20251024180746.GT6688@bill-the-cat>
In-Reply-To: <20251024180746.GT6688@bill-the-cat>
From: Adriana Nicolae <adriana@arista.com>
Date: Fri, 31 Oct 2025 10:51:01 +0200
X-Gm-Features: AWmQ_bk3DM9Rh8pQQ3OaBowRnbz49GJWMYEBUlC4tjTu1tfNVolHtIKrCeoiufU
Message-ID: <CAERbo5xYExnnF7BosjEsevDsZXs6yRg+PmYTPzZQJqAJno3Gtw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] DMI: Scan for DMI table from DTS info
To: Tom Rini <trini@konsulko.com>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Rob Herring <robh@kernel.org>, krzk@kernel.org, jdelvare@suse.com, 
	frowand.list@gmail.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, vasilykh@arista.com, arm.ebbr-discuss@arm.com, 
	boot-architecture@lists.linaro.org, linux-efi@vger.kernel.org, 
	uefi-discuss@lists.uefi.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_015114_771432_A90E6C74 
X-CRM114-Status: GOOD (  54.07  )
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

On Fri, Oct 24, 2025 at 9:07=E2=80=AFPM Tom Rini <trini@konsulko.com> wrote=
:
>
> On Fri, Oct 24, 2025 at 02:07:43PM +0300, Ilias Apalodimas wrote:
> > Hi Ard, Adriana
> >
> > Thanks for cc'ing me.
> >
> > On Fri, 24 Oct 2025 at 12:49, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Thu, 23 Oct 2025 at 16:48, Adriana Nicolae <adriana@arista.com> wr=
ote:
> > > >
> > > > On Thu, Oct 23, 2025 at 4:54=E2=80=AFPM Ard Biesheuvel <ardb@kernel=
.org> wrote:
> > > > >
> > > > > (cc Ilias)
> > > > >
> > > > > On Thu, 23 Oct 2025 at 15:34, Adriana Nicolae <adriana@arista.com=
> wrote:
> > > > > >
> > > > > > On Thu, Oct 23, 2025 at 11:21=E2=80=AFAM Ard Biesheuvel <ardb@k=
ernel.org> wrote:
> > > > > > >
> > > > > > > On Thu, 23 Oct 2025 at 04:21, Adriana Nicolae <adriana@arista=
.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, Oct 22, 2025 at 11:19=E2=80=AFPM Rob Herring <robh@=
kernel.org> wrote:
> > > > > > > > >
> > > > > > > > > On Wed, Oct 22, 2025 at 04:45:25AM -0700, adriana wrote:
> > > > > > > > > > Some bootloaders like U-boot, particularly for the ARM =
architecture,
> > > > > > > > > > provide SMBIOS/DMI tables at a specific memory address.=
 However, these
> > > > > > > > > > systems often do not boot using a full UEFI environment=
, which means the
> > > > > > > > > > kernel's standard EFI DMI scanner cannot find these tab=
les.
> > > > > > > > >
> > > > > > > > > I thought u-boot is a pretty complete UEFI implementation=
 now. If
> > > > > > > > > there's standard way for UEFI to provide this, then that'=
s what we
> > > > > > > > > should be using. I know supporting this has been discusse=
d in context of
> > > > > > > > > EBBR spec, but no one involved in that has been CC'ed her=
e.
> > > > > > > >
> > > > > > > > Regarding the use of UEFI, the non UEFI boot is used on Bro=
adcom iProc which
> > > > > > > > boots initially into a Hardware Security Module which valid=
ates U-boot and then
> > > > > > > > loads it. This specific path does not utilize U-Boot's UEFI
> > > > > > > > implementation or the
> > > > > > > > standard UEFI boot services to pass tables like SMBIOS.
> > > > > > > >
> > > > > > >
> > > > > > > What prevents this HSM validated copy of u-boot from loading =
the kernel via EFI?
> > > > > > The vendor's U-Boot configuration for this specific secure boot=
 path
> > > > > > (involving the
> > > > > > HSM) explicitly disables the CMD_BOOTEFI option due to security
> > > > > > mitigations, only
> > > > > > a subset of U-boot commands are whitelisted. We could patch the=
 U-boot
> > > > > > to include
> > > > > > that but it is preferable to follow the vendor's recommandation=
s and
> > > > > > just patch U-boot
> > > > > > to fill that memory location with SMBIOS address or directly wi=
th the
> > > > > > entry point.
> > > > >
> > > > > And what security mitigations are deemed needed for the EFI code?=
 You
> > > > > are aware that avoiding EFI boot means that the booting kernel ke=
eps
> > > > > all memory protections disabled for longer than it would otherwis=
e. Is
> > > > > this allowlisting based on simply minimizing the code footprint?
> > > > >
> > > > From the information I have, it might be just minimizing the footpr=
int
> > > > but the vendor's U-Boot configuration for this specific path
> > > > explicitly disables the CMD_BOOTEFI option. While the vendor cites
> > > > security mitigations for this configuration, the specific details
> > > > could be a set of mitigation removing different boot methods and so=
me
> > > > memory access commands.
> > > >
> > > > The core issue is that this non-EFI boot path is the vendor-validat=
ed
> > > > configuration. Enabling EFI would deviate from this setup, require
> > > > significant revalidation, and could impact vendor support. Modifyin=
g
> > > > U-Boot to populate the DT is a contained change without modifying t=
he
> > > > U-boot vendor configuration.
> > > >
> > >
> > > I'm not sure I follow why changing U-Boot's code would not require
> > > revalidation if simply changing its build configuration without
> > > modifying the source code would require that.
> > >
> > > > Beyond our specific vendor constraints, this DT method might be use=
d
> > > > by any other non-UEFI arm system needing to expose SMBIOS tables to
> > > > the kernel.
> > > >
> > >
> > > Fair point. So let's do this properly: get buy-in from the U-Boot
> > > folks and contribute your u-boot changes as well. And ideally, we'd
> > > get this into the DMTF spec but if you are not set up for that (I
> > > think you might need to be a member to be able to contribute), we can
> > > find some ARM folks who are.
> >
> > +1
> > U-Boot does offer an EFI implementation indeed, but we can't magically
> > force people to use it.
> > The problem with SMBIOS is that afaict is still widely used by various
> > debugging tools, so we might as well support it.
> > I agree with Ard here. I think the best thing we can do is
> > - Make the node standard in the DT spec, so everyone gets a reference
> > - Gatekeep any alternative implementations for the kernel until
> > someone gets this into the DMTF spec as well
> > - Send a patch to U-Boot that adds that mode dynamically if booting is
> > !EFI and SMIOS support is enabled
>
> This sounds like a good plan to me, from the U-Boot side of things.
Thank you for guiding on this change. I've just posted the v3 kernel
patch series which is simplified to support SMBIOS3 only.

I have also submitted the corresponding U-Boot patch (to add the
property dynamically for non-EFI boots) to the u-boot@lists.denx.de
list. It may be held for moderation as I am waiting for my
subscription to be approved, but it should appear on the archive soon.

Regarding the DMTF spec, I am not a member and cannot contribute
directly. I would appreciate the help to get this proposed.
Please let me know if there are any concerns with the v3 kernel patch.


>
> --
> Tom

