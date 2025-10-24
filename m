Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BEDCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 11:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qr8VI2WDLpClCnobZqQ04jtUbm8hJFOmR+11wkVoEH0=; b=K53r1JACMnP2dbhtNMK37nIueu
	Nk2GLvicGupAFpssHCQ1A+ugUHl/OgxrC+yrek0mjCR6oobwR1sRe9qM0by9vFqhX1nIE8kv1XzVW
	3ULODSVxWvrvpD33CD0qmvMq8pHah/vfQbjpNT7XcTp4XQNPYGwVpe09QqD8vs9ZMpRr907Yroko6
	/aqzWZPzpFOPHj+Zqayd/qtc1PfL8ngcj+Scn5JG4EXn1dEcTNqpkZEfgqAg7iKM1bCgw5kQCoYo3
	FWT0dNUDCA0lF6JKOs+yzibLflBFXa2bOLL4x7An++uowgeMOb4m+cRxCJDCQGw8tPlHKm4wYPKmJ
	cBTLncQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFeh-00000009824-1OKw;
	Fri, 24 Oct 2025 11:08:23 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFee-00000009817-1yLo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 11:08:21 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-73b4e3d0756so19643237b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 04:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761304099; x=1761908899; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qr8VI2WDLpClCnobZqQ04jtUbm8hJFOmR+11wkVoEH0=;
        b=pn9QZIJ99LLfs3SuEpA08a98zy6pd0WNic42eOwmMKT01QtcVRK6vgVkj4wtD4s4iW
         ztP8JgMbLZdbruVAli2Owy/jINMMMK0vOOi+RpMLYsJONs4GsSvy7hMtiafdBfrhhTH2
         jifUlCtsy6Fzy1wcjc+zcrjSv44SlAtF0IhV4HRwXFjDi4rx88/gQKI/876w+wA8agF2
         o36LlVfYHf/Iuyv71BdNumjTwauB6Im61K5/B02icTkuki4SfypFd1VF5fnqmNCiwGAu
         G5FY76gnFts95RVFBASHnzqPvbXrqWhs3lUqQKDXrf9MY0Fx7p9OdPHX7V2qd6qglA8H
         x0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761304099; x=1761908899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qr8VI2WDLpClCnobZqQ04jtUbm8hJFOmR+11wkVoEH0=;
        b=Dyg4bOsX0Sno4cGTN12kdFg3rMKOz2sKchYdv3b1+bPA+mPVCATQsT9KBiqBpzWGKx
         hEc9o0TCPjeuJf4WcP4cR2C0TtmCl5spJRnxo41aXe+LnUoPnx6JVjDl8iRf+jTl6FJE
         Tul8sW/TRvwYZF/YMwOpgjOVSbACaWpKy1Pk31Y0+yEOUIMMSJVWCH5aqdllur1AyQ3K
         25cA/2bD3aChFJqMjhx4AjlaRD6FONheRfVSMpiJd8XidCf69PBDvvy2+GsyO8d3Mw5w
         piypr2kMYxtft3vpcWU1W+W/cTkZ5IScinuDkKCmF1o9tGAN0wNXiZiAHFXMDGwq2tqg
         D+Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUsFtoJ35yFFzJq1ILPmTsDbQ24m5cww7sxonyGKUR3hRt1qxbcqSr6PymJhbn3yH1C/jI+vwdkLi6PbAARyUOS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2q18GhSHUdrBaCMEM6jxXR7MAHtWD5fTD2fVWddJgrJtZjyXg
	fBcDaP1UtKGvH7jf7n9whIEIbhtl6Yh4UbOhWGkFOs+now05e2p4/09bqPQLfZAz9THvYv4EKd1
	FiOGd3e3VNNjFSVn+DAA3435oNJu1huJUkG/MXV6Ucg==
X-Gm-Gg: ASbGncusiZ8s/1Df5jsVNeWBeCQEAfmEpU+tvThBTufivXl1XIofGdNL9DTPXRzTKzA
	lyAs5h8F4webi3nTz0ZaIBm/1y2udMMbtYdCsj5es/7Fob7rq1MsREBwcHfmfJG/QjB7ICSpKKH
	j/kdFuQeHPRsbH+28zqVnHBoSgyGNcBmCSXZnyW5EvOG4nN0hSazFs8y3cXm3fkWI58p65mmr5U
	PuJrHFJVvy0m0SEMjGaWJQMn+SCFA++MWflH9DDyU5cZy0TQNHSstKBHVES5WnI4DqkJUrtT6y6
	KwXQiFNwYY/GwfOTh1on58fCagiUTNgJN7JgBagP
X-Google-Smtp-Source: AGHT+IFOV3V8o2HZhqqETlepYcrBmej0YD+DE4piL9lAUn6eKlq7J5U55V3yx6LRy0lafFZakyuR4ta00/fEgft/O94=
X-Received: by 2002:a05:690e:4188:b0:63c:f5a6:f2fd with SMTP id
 956f58d0204a3-63f435a7561mr1131720d50.63.1761304099000; Fri, 24 Oct 2025
 04:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <0f006338-e69b-4b3f-b91f-0cc683544011@kernel.org>
 <20251022114527.618908-1-adriana@arista.com> <20251022201953.GA206947-robh@kernel.org>
 <CAERbo5z6BzHqQxXdxPxmxE_eDR7GGGbt3A8kB0gQiWFBE-28Ug@mail.gmail.com>
 <CAMj1kXGYinTKiyYhNYWJvoJeUJScCGnyq=ozLgjKAm7_wzG8QA@mail.gmail.com>
 <CAERbo5waY-=6BLZ2SiJSFAXzvU57mJdM9q05vAZw8zR2yExQ5w@mail.gmail.com>
 <CAMj1kXHin5YacS98ttzHqFqy6HMukXKoLZtr-+bLwVRsWZUugQ@mail.gmail.com>
 <CAERbo5zgS8XoGcFB3wejqDpx14-SBr5oWn7pu3=PE0djRiKZqg@mail.gmail.com> <CAMj1kXEnSKF4VcMdOvUUuM-pOEWB38qPhWvUm13rnkQiZXp6SA@mail.gmail.com>
In-Reply-To: <CAMj1kXEnSKF4VcMdOvUUuM-pOEWB38qPhWvUm13rnkQiZXp6SA@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 24 Oct 2025 14:07:43 +0300
X-Gm-Features: AS18NWCWgWLVov8ueny0nkngqHk4IxEbg4f6wBusDI4Ru3Cin08S3Jv6tCbD0eM
Message-ID: <CAC_iWjKQ5Smx5hOM9Lgyq_KD6D7OXyDsfJ4mcEnfw4JuRtxy-g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] DMI: Scan for DMI table from DTS info
To: Ard Biesheuvel <ardb@kernel.org>, Adriana Nicolae <adriana@arista.com>
Cc: Rob Herring <robh@kernel.org>, krzk@kernel.org, jdelvare@suse.com, 
	frowand.list@gmail.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, vasilykh@arista.com, arm.ebbr-discuss@arm.com, 
	boot-architecture@lists.linaro.org, linux-efi@vger.kernel.org, 
	uefi-discuss@lists.uefi.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_040820_533219_B67311CC 
X-CRM114-Status: GOOD (  41.92  )
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

Hi Ard, Adriana

Thanks for cc'ing me.

On Fri, 24 Oct 2025 at 12:49, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 23 Oct 2025 at 16:48, Adriana Nicolae <adriana@arista.com> wrote:
> >
> > On Thu, Oct 23, 2025 at 4:54=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> > >
> > > (cc Ilias)
> > >
> > > On Thu, 23 Oct 2025 at 15:34, Adriana Nicolae <adriana@arista.com> wr=
ote:
> > > >
> > > > On Thu, Oct 23, 2025 at 11:21=E2=80=AFAM Ard Biesheuvel <ardb@kerne=
l.org> wrote:
> > > > >
> > > > > On Thu, 23 Oct 2025 at 04:21, Adriana Nicolae <adriana@arista.com=
> wrote:
> > > > > >
> > > > > > On Wed, Oct 22, 2025 at 11:19=E2=80=AFPM Rob Herring <robh@kern=
el.org> wrote:
> > > > > > >
> > > > > > > On Wed, Oct 22, 2025 at 04:45:25AM -0700, adriana wrote:
> > > > > > > > Some bootloaders like U-boot, particularly for the ARM arch=
itecture,
> > > > > > > > provide SMBIOS/DMI tables at a specific memory address. How=
ever, these
> > > > > > > > systems often do not boot using a full UEFI environment, wh=
ich means the
> > > > > > > > kernel's standard EFI DMI scanner cannot find these tables.
> > > > > > >
> > > > > > > I thought u-boot is a pretty complete UEFI implementation now=
. If
> > > > > > > there's standard way for UEFI to provide this, then that's wh=
at we
> > > > > > > should be using. I know supporting this has been discussed in=
 context of
> > > > > > > EBBR spec, but no one involved in that has been CC'ed here.
> > > > > >
> > > > > > Regarding the use of UEFI, the non UEFI boot is used on Broadco=
m iProc which
> > > > > > boots initially into a Hardware Security Module which validates=
 U-boot and then
> > > > > > loads it. This specific path does not utilize U-Boot's UEFI
> > > > > > implementation or the
> > > > > > standard UEFI boot services to pass tables like SMBIOS.
> > > > > >
> > > > >
> > > > > What prevents this HSM validated copy of u-boot from loading the =
kernel via EFI?
> > > > The vendor's U-Boot configuration for this specific secure boot pat=
h
> > > > (involving the
> > > > HSM) explicitly disables the CMD_BOOTEFI option due to security
> > > > mitigations, only
> > > > a subset of U-boot commands are whitelisted. We could patch the U-b=
oot
> > > > to include
> > > > that but it is preferable to follow the vendor's recommandations an=
d
> > > > just patch U-boot
> > > > to fill that memory location with SMBIOS address or directly with t=
he
> > > > entry point.
> > >
> > > And what security mitigations are deemed needed for the EFI code? You
> > > are aware that avoiding EFI boot means that the booting kernel keeps
> > > all memory protections disabled for longer than it would otherwise. I=
s
> > > this allowlisting based on simply minimizing the code footprint?
> > >
> > From the information I have, it might be just minimizing the footprint
> > but the vendor's U-Boot configuration for this specific path
> > explicitly disables the CMD_BOOTEFI option. While the vendor cites
> > security mitigations for this configuration, the specific details
> > could be a set of mitigation removing different boot methods and some
> > memory access commands.
> >
> > The core issue is that this non-EFI boot path is the vendor-validated
> > configuration. Enabling EFI would deviate from this setup, require
> > significant revalidation, and could impact vendor support. Modifying
> > U-Boot to populate the DT is a contained change without modifying the
> > U-boot vendor configuration.
> >
>
> I'm not sure I follow why changing U-Boot's code would not require
> revalidation if simply changing its build configuration without
> modifying the source code would require that.
>
> > Beyond our specific vendor constraints, this DT method might be used
> > by any other non-UEFI arm system needing to expose SMBIOS tables to
> > the kernel.
> >
>
> Fair point. So let's do this properly: get buy-in from the U-Boot
> folks and contribute your u-boot changes as well. And ideally, we'd
> get this into the DMTF spec but if you are not set up for that (I
> think you might need to be a member to be able to contribute), we can
> find some ARM folks who are.

+1
U-Boot does offer an EFI implementation indeed, but we can't magically
force people to use it.
The problem with SMBIOS is that afaict is still widely used by various
debugging tools, so we might as well support it.
I agree with Ard here. I think the best thing we can do is
- Make the node standard in the DT spec, so everyone gets a reference
- Gatekeep any alternative implementations for the kernel until
someone gets this into the DMTF spec as well
- Send a patch to U-Boot that adds that mode dynamically if booting is
!EFI and SMIOS support is enabled

Cheers
/Ilias

