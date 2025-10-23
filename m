Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB52ACCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCbQ9XxHJbLX+gMA3bCythVrgdQkz4B5n1RY+AXyRAo=; b=PVQAUeRvgq2y/KTfj+eLa5OtaS
	4Hp/e4JLBKKSN3B1kXMo4Ika26jUjvNxb9S3hWrQtzvBVRi/pKrO9O6ARggZ5gCfbPwnnfCBcbyoC
	G8kh/pgB09Yb/YlBT9bflqDYA3E5qfhRrk/Aljv+ZYyXHJ2ajEZMywTWQbry17y6hbNaalyKMFT3T
	jiGT9dap8pzOOBpXcNV/ldLw4HsRvIgtPlTfG7D6fu4hwquEFbnfwxcs9nNLArADbQwDHh7+YWfju
	nxFRTou65GznO/nYbf0Mw7v/TTE7htgHXBd7TdTem1lOmbjJ+Mv8rFADX3SD9M3/inynNIyVVgBpv
	DKJxfuSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwbo-00000006dwW-3iR3;
	Thu, 23 Oct 2025 14:48:08 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwbl-00000006dvo-3yMK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 14:48:07 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-3c982e954f8so55202fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 07:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1761230885; x=1761835685; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCbQ9XxHJbLX+gMA3bCythVrgdQkz4B5n1RY+AXyRAo=;
        b=GGgjJ6abR2HkGmd1FYDYsSD7Wu/QEb8WRz2vOnLfdK0Sxl3ssPJXmRaqr7WcaXuSiI
         HPugfmbr96dsvCZx4NhHKJL5HPK/1W/q+v2c8m21dXT73Fc0qWpmu0NxDwPzXmx1/8DY
         4YDSyuLfmIVU+Imb+Czrzr6FJ+Z3JAH+BKZyh0IDzBT80/kkvnyd/8zVS46DdibA/1Uq
         ss4SFvREWRlczWd/0gChntUMMVSqCeY/N252PbnNRLNIOuTRiWCTVzRNyFAJDoJ2m5ke
         WTlhdb4v8oHXN6y0pZt15GMRmxG+a+hJgf47EKGz8r/YRBDTPQtqZ1WoJriopZPFvJgE
         gzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761230885; x=1761835685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCbQ9XxHJbLX+gMA3bCythVrgdQkz4B5n1RY+AXyRAo=;
        b=UzlY6oOJ59ZNNb5aS4gSymITrztQzwnuo0/Uakttjfn4MszgFIzQljXnd2JTYPahDV
         p0szi66Yuj2LnWdsq1xBjtRUD7JC1/s2R2qG+n1Y7AP+pXNPj6UdZLTVS4Fdu3vkSoL/
         loKoC0pDUtt+sxtiz/8qJy42pYkw1SgyybanXDjgycehUZYIqS6AlTomy8F2ArH/AWjo
         IDOaYoGsFP5jVdcDuuPdH7rF3lycxZaGmMPPm21fjFlyMzGDI1COnyVaMkIUebS9+5wv
         cVwk+gxaSZEydUtwjKCBH3xo4rADsspHOTC1caSOCIuv4LZelNYqj5YLv+a+9L95lbjD
         gWow==
X-Forwarded-Encrypted: i=1; AJvYcCXlw+n9wUVByK3YA2f/kDroa+BSXI2ggXzpXTaBVUy1PQBOIa7rtNHMqsl75+kiVQ6Fc2KBO0i2n3Ce92CtiVlC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5SpkEMYxhkEyn2BTUzQw8Ys9MJYEc/TO2/2+dxS6tkE4hJcio
	cMoW4XVzmEeWZm9aSbfMg3HhLZam3pYc5hrNx822egVp1RQzNhYMP4R+0e60vC9Rv3q+HFHt0q9
	4Yy1KmhwcXFIHc2mrpp7Zh5Pr0N1Vsu0Assxv1Nsb
X-Gm-Gg: ASbGncv5WxigDIGc1+5kiZwyFM4r28wjMMCaI/WVXTQfrLrcmRf4DlEUdoYSEkKkn08
	cOHDMackb7r7hFZkBgunmMFcIn2Nv8eXZgXl7254lyYDRYYo5T7V4IKd7tnXczBUJJgb1bXhe24
	nqwTdM693OaKADRSM0pfWrvpwo46KGQ+KTH7+4ICB6LasrhxZ9nLMlXMA1Z0tagwGCcFpUZU55L
	2Kk/2rAkUhsQELDd1LWw7rA/nYToK+hI6Y7E049DV6RBwqxcGdHhOPewdhc1z1zDBzHBIIMlqj7
	smltcGVU1kee/S3jmNrFvq+VQ8DQQg==
X-Google-Smtp-Source: AGHT+IFvw0XTgABjFJsYXYpUudxoEkAHEEP01CdUdwp3L8Qx0ZBVOSdQx/inF8LNyXBTTOZmTqpehickro9B2Kz6m7g=
X-Received: by 2002:a05:6871:d10b:b0:345:ecd6:8b7 with SMTP id
 586e51a60fabf-3cd88db4df9mr2532709fac.11.1761230884387; Thu, 23 Oct 2025
 07:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <0f006338-e69b-4b3f-b91f-0cc683544011@kernel.org>
 <20251022114527.618908-1-adriana@arista.com> <20251022201953.GA206947-robh@kernel.org>
 <CAERbo5z6BzHqQxXdxPxmxE_eDR7GGGbt3A8kB0gQiWFBE-28Ug@mail.gmail.com>
 <CAMj1kXGYinTKiyYhNYWJvoJeUJScCGnyq=ozLgjKAm7_wzG8QA@mail.gmail.com>
 <CAERbo5waY-=6BLZ2SiJSFAXzvU57mJdM9q05vAZw8zR2yExQ5w@mail.gmail.com> <CAMj1kXHin5YacS98ttzHqFqy6HMukXKoLZtr-+bLwVRsWZUugQ@mail.gmail.com>
In-Reply-To: <CAMj1kXHin5YacS98ttzHqFqy6HMukXKoLZtr-+bLwVRsWZUugQ@mail.gmail.com>
From: Adriana Nicolae <adriana@arista.com>
Date: Thu, 23 Oct 2025 17:47:53 +0300
X-Gm-Features: AWmQ_bmwEubJ_qHzUAOArVDKuoamgdMa0FuM6IkzPxP77akzotjC48951wOss6E
Message-ID: <CAERbo5zgS8XoGcFB3wejqDpx14-SBr5oWn7pu3=PE0djRiKZqg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] DMI: Scan for DMI table from DTS info
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Rob Herring <robh@kernel.org>, krzk@kernel.org, jdelvare@suse.com, 
	frowand.list@gmail.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, vasilykh@arista.com, arm.ebbr-discuss@arm.com, 
	boot-architecture@lists.linaro.org, linux-efi@vger.kernel.org, 
	uefi-discuss@lists.uefi.org, linux-arm-kernel@lists.infradead.org, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_074806_201752_2DABB79C 
X-CRM114-Status: GOOD (  53.62  )
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

On Thu, Oct 23, 2025 at 4:54=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> (cc Ilias)
>
> On Thu, 23 Oct 2025 at 15:34, Adriana Nicolae <adriana@arista.com> wrote:
> >
> > On Thu, Oct 23, 2025 at 11:21=E2=80=AFAM Ard Biesheuvel <ardb@kernel.or=
g> wrote:
> > >
> > > On Thu, 23 Oct 2025 at 04:21, Adriana Nicolae <adriana@arista.com> wr=
ote:
> > > >
> > > > On Wed, Oct 22, 2025 at 11:19=E2=80=AFPM Rob Herring <robh@kernel.o=
rg> wrote:
> > > > >
> > > > > On Wed, Oct 22, 2025 at 04:45:25AM -0700, adriana wrote:
> > > > > > Some bootloaders like U-boot, particularly for the ARM architec=
ture,
> > > > > > provide SMBIOS/DMI tables at a specific memory address. However=
, these
> > > > > > systems often do not boot using a full UEFI environment, which =
means the
> > > > > > kernel's standard EFI DMI scanner cannot find these tables.
> > > > >
> > > > > I thought u-boot is a pretty complete UEFI implementation now. If
> > > > > there's standard way for UEFI to provide this, then that's what w=
e
> > > > > should be using. I know supporting this has been discussed in con=
text of
> > > > > EBBR spec, but no one involved in that has been CC'ed here.
> > > >
> > > > Regarding the use of UEFI, the non UEFI boot is used on Broadcom iP=
roc which
> > > > boots initially into a Hardware Security Module which validates U-b=
oot and then
> > > > loads it. This specific path does not utilize U-Boot's UEFI
> > > > implementation or the
> > > > standard UEFI boot services to pass tables like SMBIOS.
> > > >
> > >
> > > What prevents this HSM validated copy of u-boot from loading the kern=
el via EFI?
> > The vendor's U-Boot configuration for this specific secure boot path
> > (involving the
> > HSM) explicitly disables the CMD_BOOTEFI option due to security
> > mitigations, only
> > a subset of U-boot commands are whitelisted. We could patch the U-boot
> > to include
> > that but it is preferable to follow the vendor's recommandations and
> > just patch U-boot
> > to fill that memory location with SMBIOS address or directly with the
> > entry point.
>
> And what security mitigations are deemed needed for the EFI code? You
> are aware that avoiding EFI boot means that the booting kernel keeps
> all memory protections disabled for longer than it would otherwise. Is
> this allowlisting based on simply minimizing the code footprint?
>
From the information I have, it might be just minimizing the footprint
but the vendor's U-Boot configuration for this specific path
explicitly disables the CMD_BOOTEFI option. While the vendor cites
security mitigations for this configuration, the specific details
could be a set of mitigation removing different boot methods and some
memory access commands.

The core issue is that this non-EFI boot path is the vendor-validated
configuration. Enabling EFI would deviate from this setup, require
significant revalidation, and could impact vendor support. Modifying
U-Boot to populate the DT is a contained change without modifying the
U-boot vendor configuration.

Beyond our specific vendor constraints, this DT method might be used
by any other non-UEFI arm system needing to expose SMBIOS tables to
the kernel.

> Introducing a non-standard mechanism means that others will now have
> to maintain it and coexist with it, rather than simply using the
> existing code which already fully supports what you are trying to
> accomplish (both on the bootloader and the kernel side)
>
> IOW, in my opinion, simply enabling CMD_BOOTEFI for your bootloader is
> a much better choice here. I'm not a u-boot expert but as I understand
> it, loading/authenticating the image and booting it in EFI mode are
> two separate things, and so the secure boot path would change very
> little.
>
> > > > Because there's no UEFI configuration table available in this boot =
mode, we need
> > > > an alternative mechanism to pass the SMBIOS table address to the ke=
rnel. The
> > > > /chosen node seemed like the most straightforward way for the bootl=
oader to
> > > > communicate this non-discoverable information.
> > > >
> > > > I wasn't aware of the EBBR discussions covering this. I've added th=
e
> > > > boot-architecture and arm.ebbr-discuss lists to the Cc. If there's =
a preferred
> > > > EBBR-compliant way to handle this for non-UEFI boots, I'm happy to =
adapt
> > > > the approach.
> > > >
> > >
> > > For the record, I don't see a huge problem with accepting SMBIOS
> > > tables in this manner, but it would be better if a description of thi=
s
> > > method was contributed to the DMTF spec, which currently states that
> > > the only way to discover SMBIOS tables on non-x86 systems is via the
> > > SMBIOS/SMBIOS3 EFI configuration tables. Doing so should prevent othe=
r
> > > folks from inventing their own methods for their own vertically
> > > integrated systems. (Other OSes exist, and from a boot arch PoV, we
> > > try to avoid these Linux-only shortcuts)
> > >
> > > However, the DT method should *only* be used when not booting via
> > > UEFI, to avoid future surprises, and to ensure that existing OSes
> > > (including older Linux) can always find the SMBIOS tables when bootin=
g
> > > via UEFI.
> > >
> > > Also, I would suggest to pull the entire entrypoint into DT, rather
> > > than the address in memory of either/both entrypoint(s). Both just
> > > carry some version fields, and the address of the actual SMBIOS data
> > > in memory, and the only difference between SMBIOS and SMBIOS3 is the
> > > size of the address field (32 vs 64 bits)
> > I understand the points raised about UEFI taking precedence and the
> > preference for standardization (DMTF). If this DT method is accepted
> > as a fallback only for non-UEFI boots like this one, the kernel impleme=
ntation
> > will respect that precedence.
> >
> > Regarding the alternative to place the full SMBIOS entry point structur=
e into
> > a DT property (as a byte array) instead of just its memory address. Bot=
h
> > approaches seem feasible from the U-Boot side. I opted initially for pa=
ssing
> > the address to reuse the existing kernel functions (dmi_smbios3_present=
 and
> > dmi_present) which already handle mapping and validation of the entry p=
oint
> > read from memory (as done for the EFI case).
> >
>
> Actually, it appears that dmidecode expects the entrypoint data in
> /sys/firmware/dmi/tables/smbios_entry_point, and so you will need to
> populate that file in any case, and so pulling it into the DT node is
> not as useful. But having both SMBIOS and SMBIOS3 is pointless, so
> please only bother with the latter.

