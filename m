Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9523CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 09:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rEgbmUg/T/QmQbXAyRzjpFQS6FK3emL01RgLGpF4yk=; b=w1uo3kkirv2ZT20Ivsk6pSEAby
	Lw2iA7hqhxUiuigdyFaMMGzJe2ABF7j7UVGg3puGRguAdRtI0av6LlwgRjZqeu787u7XJkA5RWI9F
	a30TRk4I6PLrc1EKLPoc7N2XcejjlhrxFZfZT7n4DPax4OgfkJOJFR22vFxUmD2sWRF0bhBewNH/V
	7Y+QHyfBo1/bt8v/is2wjD9x5flg/+rHJP65Mr2hVq12XnZEMoaDXbeDJPNs0mZTBaLH40UenY9NQ
	/qEyFbKgMN3aLb/05lCX+jKOgC/5Ngjv1sqAlVmmh5hMcVmCSJNV8X56iwNQ3ZBVzhFTbpshGZkLd
	7unCqs5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEQL-00000008vWI-1yHK;
	Fri, 24 Oct 2025 09:49:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEQK-00000008vWA-1iwA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 09:49:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1F5E601BA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 09:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81924C4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 09:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761299367;
	bh=+rEgbmUg/T/QmQbXAyRzjpFQS6FK3emL01RgLGpF4yk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OmfdGp0vNDyyWrNqh8CtsTUNPmZLqV6R707YIIfKgGhPnZpWEKpextUGVrTueOP9o
	 0dsQoAHP1u0qmDvoxSr6GYJxhvZY77E6bkpKcX5Aa0mN2a48N6E1fTvulvkjBJj6GD
	 LpMmFl5r462BaXgcHmIa6/r0affuIuU0zfmdNsrWOFt+Z+82revkTYRbleGx5+cIGR
	 yx1tkMgmBLQVb9BHky+yWmWhXRk6B1d2v+hbPDGqb9x+vYTMbBHDOBkl3vXAIyslXB
	 E1QgcqkFkiFqAziJco7CxLJQ/MoL8jrCoI8creFMlo4yoBIkbXO3mOn/Re78+x6VlC
	 445zPB50o3MCw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-592ee9a16adso3044012e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 02:49:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTsrUHX031G3D7uwYJTIMUsh4ThMFjpzj0tmoAhfBOluvAf6vqB4YnZghH5O8qSYFsSTyT9naMzBxfJHCczw7u@lists.infradead.org
X-Gm-Message-State: AOJu0YwSRh6YOm8CljSk0b8gtNolxXPpld+GCEY3T6vJbHKO9NmNZunX
	buCxbOYvgrPuFMc5GB76ZcMPRqbdFkfOuWEbZyHI2sDltMiamuP6Z2JO9IyN5IXZCHvD+MIbzmq
	5T/06oxLvDWlahxsDf0BAIF3OYQudxTo=
X-Google-Smtp-Source: AGHT+IEM8ITtLMS8DxeBvT6/RmBya3PWaa0XUPnlbL99EeYraeRDcyolno2BS9TfqpcJNo0wZQGPxHyvlXA2cEsbcOw=
X-Received: by 2002:a05:6512:318b:b0:57d:6fca:f208 with SMTP id
 2adb3069b0e04-591d856642dmr9077716e87.45.1761299365868; Fri, 24 Oct 2025
 02:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <0f006338-e69b-4b3f-b91f-0cc683544011@kernel.org>
 <20251022114527.618908-1-adriana@arista.com> <20251022201953.GA206947-robh@kernel.org>
 <CAERbo5z6BzHqQxXdxPxmxE_eDR7GGGbt3A8kB0gQiWFBE-28Ug@mail.gmail.com>
 <CAMj1kXGYinTKiyYhNYWJvoJeUJScCGnyq=ozLgjKAm7_wzG8QA@mail.gmail.com>
 <CAERbo5waY-=6BLZ2SiJSFAXzvU57mJdM9q05vAZw8zR2yExQ5w@mail.gmail.com>
 <CAMj1kXHin5YacS98ttzHqFqy6HMukXKoLZtr-+bLwVRsWZUugQ@mail.gmail.com> <CAERbo5zgS8XoGcFB3wejqDpx14-SBr5oWn7pu3=PE0djRiKZqg@mail.gmail.com>
In-Reply-To: <CAERbo5zgS8XoGcFB3wejqDpx14-SBr5oWn7pu3=PE0djRiKZqg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 24 Oct 2025 11:49:13 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEnSKF4VcMdOvUUuM-pOEWB38qPhWvUm13rnkQiZXp6SA@mail.gmail.com>
X-Gm-Features: AS18NWCrHHLzkvtAZPunKzdDM8HCcW0w6gfwr-1cHOznNZj5IAF1RRNbsGn2J3A
Message-ID: <CAMj1kXEnSKF4VcMdOvUUuM-pOEWB38qPhWvUm13rnkQiZXp6SA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] DMI: Scan for DMI table from DTS info
To: Adriana Nicolae <adriana@arista.com>
Cc: Rob Herring <robh@kernel.org>, krzk@kernel.org, jdelvare@suse.com, 
	frowand.list@gmail.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, vasilykh@arista.com, arm.ebbr-discuss@arm.com, 
	boot-architecture@lists.linaro.org, linux-efi@vger.kernel.org, 
	uefi-discuss@lists.uefi.org, linux-arm-kernel@lists.infradead.org, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 23 Oct 2025 at 16:48, Adriana Nicolae <adriana@arista.com> wrote:
>
> On Thu, Oct 23, 2025 at 4:54=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> =
wrote:
> >
> > (cc Ilias)
> >
> > On Thu, 23 Oct 2025 at 15:34, Adriana Nicolae <adriana@arista.com> wrot=
e:
> > >
> > > On Thu, Oct 23, 2025 at 11:21=E2=80=AFAM Ard Biesheuvel <ardb@kernel.=
org> wrote:
> > > >
> > > > On Thu, 23 Oct 2025 at 04:21, Adriana Nicolae <adriana@arista.com> =
wrote:
> > > > >
> > > > > On Wed, Oct 22, 2025 at 11:19=E2=80=AFPM Rob Herring <robh@kernel=
.org> wrote:
> > > > > >
> > > > > > On Wed, Oct 22, 2025 at 04:45:25AM -0700, adriana wrote:
> > > > > > > Some bootloaders like U-boot, particularly for the ARM archit=
ecture,
> > > > > > > provide SMBIOS/DMI tables at a specific memory address. Howev=
er, these
> > > > > > > systems often do not boot using a full UEFI environment, whic=
h means the
> > > > > > > kernel's standard EFI DMI scanner cannot find these tables.
> > > > > >
> > > > > > I thought u-boot is a pretty complete UEFI implementation now. =
If
> > > > > > there's standard way for UEFI to provide this, then that's what=
 we
> > > > > > should be using. I know supporting this has been discussed in c=
ontext of
> > > > > > EBBR spec, but no one involved in that has been CC'ed here.
> > > > >
> > > > > Regarding the use of UEFI, the non UEFI boot is used on Broadcom =
iProc which
> > > > > boots initially into a Hardware Security Module which validates U=
-boot and then
> > > > > loads it. This specific path does not utilize U-Boot's UEFI
> > > > > implementation or the
> > > > > standard UEFI boot services to pass tables like SMBIOS.
> > > > >
> > > >
> > > > What prevents this HSM validated copy of u-boot from loading the ke=
rnel via EFI?
> > > The vendor's U-Boot configuration for this specific secure boot path
> > > (involving the
> > > HSM) explicitly disables the CMD_BOOTEFI option due to security
> > > mitigations, only
> > > a subset of U-boot commands are whitelisted. We could patch the U-boo=
t
> > > to include
> > > that but it is preferable to follow the vendor's recommandations and
> > > just patch U-boot
> > > to fill that memory location with SMBIOS address or directly with the
> > > entry point.
> >
> > And what security mitigations are deemed needed for the EFI code? You
> > are aware that avoiding EFI boot means that the booting kernel keeps
> > all memory protections disabled for longer than it would otherwise. Is
> > this allowlisting based on simply minimizing the code footprint?
> >
> From the information I have, it might be just minimizing the footprint
> but the vendor's U-Boot configuration for this specific path
> explicitly disables the CMD_BOOTEFI option. While the vendor cites
> security mitigations for this configuration, the specific details
> could be a set of mitigation removing different boot methods and some
> memory access commands.
>
> The core issue is that this non-EFI boot path is the vendor-validated
> configuration. Enabling EFI would deviate from this setup, require
> significant revalidation, and could impact vendor support. Modifying
> U-Boot to populate the DT is a contained change without modifying the
> U-boot vendor configuration.
>

I'm not sure I follow why changing U-Boot's code would not require
revalidation if simply changing its build configuration without
modifying the source code would require that.

> Beyond our specific vendor constraints, this DT method might be used
> by any other non-UEFI arm system needing to expose SMBIOS tables to
> the kernel.
>

Fair point. So let's do this properly: get buy-in from the U-Boot
folks and contribute your u-boot changes as well. And ideally, we'd
get this into the DMTF spec but if you are not set up for that (I
think you might need to be a member to be able to contribute), we can
find some ARM folks who are.

