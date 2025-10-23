Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F98CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mq7wTbaDVrxT5aUwhMPrXpPQYEJ56iNmucEbpajeaW4=; b=f4Pv5bHTk69A7mHJjAh8L2ZoYL
	Oyq/Zhcy0aNyrI1fRcFTKC5O6GaYNcC3cba4GczYdpTAJyja4DNEt1MQLIja/Nkc6Sl1J0lfpwych
	aPmq9pb6XhCtk6grydN23cK3NSzJ+RBDn3yBmAUIMoWTvlzXWqkS8qvR2OOxcaBUFBkArpnGgail3
	SQo7EoL94SAa6Soht3s1NKyaJSR7gdn6lJXUdL4iz+7JPaQgKH62Tnebv1kpS8Z5FBVOOB5FM67v9
	09+9YdmgE9b511mojGR6EtqlVeV1X551kYlwYX/MCIVArFhcFf7MfIxlU4FPUX2iOXwr6mRFb8gpu
	4QmGE5dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqa4-00000005WOP-007I;
	Thu, 23 Oct 2025 08:21:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqa2-00000005WNi-0jPq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 08:21:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1F2A4AAF5
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 08:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5081C4CEFD
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761207713;
	bh=Mq7wTbaDVrxT5aUwhMPrXpPQYEJ56iNmucEbpajeaW4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bYb/5IzAiRYC+or/Q8dBd12Jn6lz/LZcxJEms7PXqNQjIZPbIl/TZkioFwLPQFXr5
	 ubOPwq+pvakPSbgPE0V8MA053A8LvvijWONqHCfLrQSMLiniBfemwM8JtdgobJhLil
	 damyu+Tox2rPfSL7dB+Lo1MBBjogPnN9Rg8qA5YxdiVH7eKXIicrnfE7f57G6Ib0+P
	 O0UqbBhkqiOeNJ684Sf5mk10I/nQyoENN9NLAqzWsh+TX75L5skzIzXo/evGyvpNzn
	 hLD3jsGJR6uAZsh7DpJyPZOIStyI4aQLo22WvU2JUPTC3ew2PkhU1g7buNK4A7I0LN
	 FgBcY4aBLWRZw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-591c98ebe90so481622e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 01:21:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUV+HAvakbCOZBIO2xXB9vTD8BzDeNsA8WlV/V5su6UZ476Qi8b9aidNh5lxJEeFWFaqwkz+sNEqd0sofY5cwfc@lists.infradead.org
X-Gm-Message-State: AOJu0YyUyWmDZhn9D6OI0mIQDXHSjYq5hbevnxqZOGiE5IWUV+Va0D0n
	HuxI4Dn3jycwSTq6+PrRoQtySVA1VghOJUC15UVKbd5zF7S3DjPOaV+lUlG9ecETQTcR4xvISnn
	OY8uuHmEOdJa/DRUtJ6WdzTsKERH1U/E=
X-Google-Smtp-Source: AGHT+IGXuEQHrmcpO18jgiQje5gxecX+jQhPRhIZD8/umfhj/iVRHLDn4WDCLHjK5/dO5vBUN3lPnOpu+1uaOPX8hXA=
X-Received: by 2002:a05:6512:3a90:b0:579:f4b3:bd2d with SMTP id
 2adb3069b0e04-591d8591713mr8820336e87.57.1761207712093; Thu, 23 Oct 2025
 01:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <0f006338-e69b-4b3f-b91f-0cc683544011@kernel.org>
 <20251022114527.618908-1-adriana@arista.com> <20251022201953.GA206947-robh@kernel.org>
 <CAERbo5z6BzHqQxXdxPxmxE_eDR7GGGbt3A8kB0gQiWFBE-28Ug@mail.gmail.com>
In-Reply-To: <CAERbo5z6BzHqQxXdxPxmxE_eDR7GGGbt3A8kB0gQiWFBE-28Ug@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 23 Oct 2025 10:21:40 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGYinTKiyYhNYWJvoJeUJScCGnyq=ozLgjKAm7_wzG8QA@mail.gmail.com>
X-Gm-Features: AS18NWAyqpmDp3gFCmfLNnMi4KMri802uIuHk78GHsmKD8sw7K_d0CMpt3v68sU
Message-ID: <CAMj1kXGYinTKiyYhNYWJvoJeUJScCGnyq=ozLgjKAm7_wzG8QA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] DMI: Scan for DMI table from DTS info
To: Adriana Nicolae <adriana@arista.com>
Cc: Rob Herring <robh@kernel.org>, krzk@kernel.org, jdelvare@suse.com, 
	frowand.list@gmail.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, vasilykh@arista.com, arm.ebbr-discuss@arm.com, 
	boot-architecture@lists.linaro.org, linux-efi@vger.kernel.org, 
	uefi-discuss@lists.uefi.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_012154_251541_AD7F7F4E 
X-CRM114-Status: GOOD (  26.99  )
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

On Thu, 23 Oct 2025 at 04:21, Adriana Nicolae <adriana@arista.com> wrote:
>
> On Wed, Oct 22, 2025 at 11:19=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > On Wed, Oct 22, 2025 at 04:45:25AM -0700, adriana wrote:
> > > Some bootloaders like U-boot, particularly for the ARM architecture,
> > > provide SMBIOS/DMI tables at a specific memory address. However, thes=
e
> > > systems often do not boot using a full UEFI environment, which means =
the
> > > kernel's standard EFI DMI scanner cannot find these tables.
> >
> > I thought u-boot is a pretty complete UEFI implementation now. If
> > there's standard way for UEFI to provide this, then that's what we
> > should be using. I know supporting this has been discussed in context o=
f
> > EBBR spec, but no one involved in that has been CC'ed here.
>
> Regarding the use of UEFI, the non UEFI boot is used on Broadcom iProc wh=
ich
> boots initially into a Hardware Security Module which validates U-boot an=
d then
> loads it. This specific path does not utilize U-Boot's UEFI
> implementation or the
> standard UEFI boot services to pass tables like SMBIOS.
>

What prevents this HSM validated copy of u-boot from loading the kernel via=
 EFI?

> Because there's no UEFI configuration table available in this boot mode, =
we need
> an alternative mechanism to pass the SMBIOS table address to the kernel. =
The
> /chosen node seemed like the most straightforward way for the bootloader =
to
> communicate this non-discoverable information.
>
> I wasn't aware of the EBBR discussions covering this. I've added the
> boot-architecture and arm.ebbr-discuss lists to the Cc. If there's a pref=
erred
> EBBR-compliant way to handle this for non-UEFI boots, I'm happy to adapt
> the approach.
>

For the record, I don't see a huge problem with accepting SMBIOS
tables in this manner, but it would be better if a description of this
method was contributed to the DMTF spec, which currently states that
the only way to discover SMBIOS tables on non-x86 systems is via the
SMBIOS/SMBIOS3 EFI configuration tables. Doing so should prevent other
folks from inventing their own methods for their own vertically
integrated systems. (Other OSes exist, and from a boot arch PoV, we
try to avoid these Linux-only shortcuts)

However, the DT method should *only* be used when not booting via
UEFI, to avoid future surprises, and to ensure that existing OSes
(including older Linux) can always find the SMBIOS tables when booting
via UEFI.

Also, I would suggest to pull the entire entrypoint into DT, rather
than the address in memory of either/both entrypoint(s). Both just
carry some version fields, and the address of the actual SMBIOS data
in memory, and the only difference between SMBIOS and SMBIOS3 is the
size of the address field (32 vs 64 bits)

