Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32851CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 18:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKklzTl7XZxkfVb3PCGSM8TNNNKDFlBKHCbNE13T0aE=; b=HGBL6CU6DAbU0bHrx0sJPYEGVZ
	+TRuibcniighm10VywOzZBYBbZ8j73Bk2RUeBOrIfT12qZgWRyM9MoeXURGPW1akGkfZRNbo05+9t
	PszPhHHEM0O2ndMq48JIxMCaI88uodbJVxx+4nwEzdRKuHGsbd3GdnuVSjPafbeWgezComEXeZJkr
	hKh9Kb9/44v1QcdvoJjh/h5OUwlLDyqtz5hVxUjxDaYJXXut4y57xyaE9Xm7Bw5eGOxfUqUu+d3e0
	TuwrGnpUJlFDxZxpIqY+8FFq7pbrg0G8Zlw/0olRUjNF7l8wcERNAoxD9BNRaAjS277r+Dz+weLnk
	2kIBC9Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMCf-0000000ACKt-2G39;
	Fri, 24 Oct 2025 18:07:53 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMCd-0000000ACKW-1lRF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 18:07:52 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7c280d27ea7so1260050a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 11:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1761329270; x=1761934070; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OKklzTl7XZxkfVb3PCGSM8TNNNKDFlBKHCbNE13T0aE=;
        b=RlEEeQsDBvvhWg1gttGr7ltZTrjE2XIVeHOeN1ePCi6ScgmTRP3E2QC/S5bn77d0xH
         ONl7Y0PYvs6ZcN8h1TlLvryDnT/lE+m/A134LPnMkea3x6XqxTzMMx9bPH8Fx+LobMWq
         oKn6IQrcu7pNo+7EsZ6Js61Wr4t4MMCeRWmP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761329270; x=1761934070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKklzTl7XZxkfVb3PCGSM8TNNNKDFlBKHCbNE13T0aE=;
        b=qWWLD91Szs9HkJwS0ZQ97SrPWwKNzn+DbJmXxTttVIjt0jEIiBEK9BQQjKYh7W544Z
         m9o/6g6IZBpluUQYYM4xOTyVNg1bWvPIX/5qHBSOnWSxBDgt7Z/ZGpf4PrZHGc58ysF4
         FfZUKqBmugxw3G3AgMRC2v1LBs5Zo2tlp+MGIrHCPBNbRc6BURhv0FtIIt3ZsFq+HpXY
         yqt/5cm0gOoggLfksU1BqqbkDgDRpIS3O3h6kF/6ucQXEfKosuU6VGjzq7mfEQrWsjEp
         /tafLLLqpbFZ8v0ndx0sbEqt4qxblV0u0fVqEF/SNlANL1NTk0BPZf8B8C1pMziyq1gq
         c2Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVpacZujxnAnX7NiqvLDAv1AE0ehzE4+ONQyXI7X2x5giR/OR+2HnEfQK1x2NLqbZaXMBKWXTVvL7zo8MdQPH7S@lists.infradead.org
X-Gm-Message-State: AOJu0YwKL1P8l32LG9whWdOSyIpXlT0nC6GCyDiHtt3HH3fUpGg9XX+u
	7tkouPfCYPn9isAOl6ClztBFntaJr5S1mMFO/Qg+nqqcLBf2TyWP6nqdTX6rE+wcFfw=
X-Gm-Gg: ASbGncusV3A3Dafw/KHp8n9xIlo+sY4zDnRTaHpVyT+pMF3nS9rGJKkQTMiyLhdLAiH
	KMYff8pm9YgFUS8smQOEE3HNsgyHO8bb8Y03gCXBBIcHKj5KSeqK/BpOChlQVxxmarFA2LKN8bj
	twsREF+N4FRtJnLTPYR5cSr7lg7YZkkpd+PgCEd336vwThiOCpIczJYYI4hwgEhUlAFwJK2pja7
	IAdpmClUaj1JXaA934CYJ74vHzMBAXSFklVTiHQcl6gJstM+fxslP0xcBaccxsk3XdinbfyOIZt
	El9qMIDB4AiTEDsytm9ZYy4P1m20w+5RiuId7DKxnRg31xvkHv6pYaew/vyt6thQ0cSL/P/7vhi
	1XtFjVCf6Xzh16Xe520ZdFJcODTeptcw0D/2QLGMx+7m+mEBChhWdG14VJaQT7M+sl1eT1nUM/O
	iEUE/BFr7LOp9QZRYhCt1SVusTu2ZtYNfd0rxOm+rASDgdchTrLw==
X-Google-Smtp-Source: AGHT+IFRDulQPC2WfvWC6MHNbG8ZjN3lKhCb3bn+Uo7GV5yUHZ45PDvygNs6SdpFx/7sNDoXiJFqQw==
X-Received: by 2002:a05:6830:f8f:b0:78b:8caf:4906 with SMTP id 46e09a7af769-7c5240679bcmr2004161a34.13.1761329270173;
        Fri, 24 Oct 2025 11:07:50 -0700 (PDT)
Received: from bill-the-cat (fixed-187-190-202-235.totalplay.net. [187.190.202.235])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c51b059913sm1751074a34.32.2025.10.24.11.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 11:07:49 -0700 (PDT)
Date: Fri, 24 Oct 2025 12:07:46 -0600
From: Tom Rini <trini@konsulko.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Adriana Nicolae <adriana@arista.com>,
	Rob Herring <robh@kernel.org>, krzk@kernel.org, jdelvare@suse.com,
	frowand.list@gmail.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, vasilykh@arista.com,
	arm.ebbr-discuss@arm.com, boot-architecture@lists.linaro.org,
	linux-efi@vger.kernel.org, uefi-discuss@lists.uefi.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] DMI: Scan for DMI table from DTS info
Message-ID: <20251024180746.GT6688@bill-the-cat>
References: <0f006338-e69b-4b3f-b91f-0cc683544011@kernel.org>
 <20251022114527.618908-1-adriana@arista.com>
 <20251022201953.GA206947-robh@kernel.org>
 <CAERbo5z6BzHqQxXdxPxmxE_eDR7GGGbt3A8kB0gQiWFBE-28Ug@mail.gmail.com>
 <CAMj1kXGYinTKiyYhNYWJvoJeUJScCGnyq=ozLgjKAm7_wzG8QA@mail.gmail.com>
 <CAERbo5waY-=6BLZ2SiJSFAXzvU57mJdM9q05vAZw8zR2yExQ5w@mail.gmail.com>
 <CAMj1kXHin5YacS98ttzHqFqy6HMukXKoLZtr-+bLwVRsWZUugQ@mail.gmail.com>
 <CAERbo5zgS8XoGcFB3wejqDpx14-SBr5oWn7pu3=PE0djRiKZqg@mail.gmail.com>
 <CAMj1kXEnSKF4VcMdOvUUuM-pOEWB38qPhWvUm13rnkQiZXp6SA@mail.gmail.com>
 <CAC_iWjKQ5Smx5hOM9Lgyq_KD6D7OXyDsfJ4mcEnfw4JuRtxy-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9oR5kehjwfSOVgAj"
Content-Disposition: inline
In-Reply-To: <CAC_iWjKQ5Smx5hOM9Lgyq_KD6D7OXyDsfJ4mcEnfw4JuRtxy-g@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_110751_497333_9BDEA74B 
X-CRM114-Status: GOOD (  50.15  )
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


--9oR5kehjwfSOVgAj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 02:07:43PM +0300, Ilias Apalodimas wrote:
> Hi Ard, Adriana
>=20
> Thanks for cc'ing me.
>=20
> On Fri, 24 Oct 2025 at 12:49, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Thu, 23 Oct 2025 at 16:48, Adriana Nicolae <adriana@arista.com> wrot=
e:
> > >
> > > On Thu, Oct 23, 2025 at 4:54=E2=80=AFPM Ard Biesheuvel <ardb@kernel.o=
rg> wrote:
> > > >
> > > > (cc Ilias)
> > > >
> > > > On Thu, 23 Oct 2025 at 15:34, Adriana Nicolae <adriana@arista.com> =
wrote:
> > > > >
> > > > > On Thu, Oct 23, 2025 at 11:21=E2=80=AFAM Ard Biesheuvel <ardb@ker=
nel.org> wrote:
> > > > > >
> > > > > > On Thu, 23 Oct 2025 at 04:21, Adriana Nicolae <adriana@arista.c=
om> wrote:
> > > > > > >
> > > > > > > On Wed, Oct 22, 2025 at 11:19=E2=80=AFPM Rob Herring <robh@ke=
rnel.org> wrote:
> > > > > > > >
> > > > > > > > On Wed, Oct 22, 2025 at 04:45:25AM -0700, adriana wrote:
> > > > > > > > > Some bootloaders like U-boot, particularly for the ARM ar=
chitecture,
> > > > > > > > > provide SMBIOS/DMI tables at a specific memory address. H=
owever, these
> > > > > > > > > systems often do not boot using a full UEFI environment, =
which means the
> > > > > > > > > kernel's standard EFI DMI scanner cannot find these table=
s.
> > > > > > > >
> > > > > > > > I thought u-boot is a pretty complete UEFI implementation n=
ow. If
> > > > > > > > there's standard way for UEFI to provide this, then that's =
what we
> > > > > > > > should be using. I know supporting this has been discussed =
in context of
> > > > > > > > EBBR spec, but no one involved in that has been CC'ed here.
> > > > > > >
> > > > > > > Regarding the use of UEFI, the non UEFI boot is used on Broad=
com iProc which
> > > > > > > boots initially into a Hardware Security Module which validat=
es U-boot and then
> > > > > > > loads it. This specific path does not utilize U-Boot's UEFI
> > > > > > > implementation or the
> > > > > > > standard UEFI boot services to pass tables like SMBIOS.
> > > > > > >
> > > > > >
> > > > > > What prevents this HSM validated copy of u-boot from loading th=
e kernel via EFI?
> > > > > The vendor's U-Boot configuration for this specific secure boot p=
ath
> > > > > (involving the
> > > > > HSM) explicitly disables the CMD_BOOTEFI option due to security
> > > > > mitigations, only
> > > > > a subset of U-boot commands are whitelisted. We could patch the U=
-boot
> > > > > to include
> > > > > that but it is preferable to follow the vendor's recommandations =
and
> > > > > just patch U-boot
> > > > > to fill that memory location with SMBIOS address or directly with=
 the
> > > > > entry point.
> > > >
> > > > And what security mitigations are deemed needed for the EFI code? Y=
ou
> > > > are aware that avoiding EFI boot means that the booting kernel keeps
> > > > all memory protections disabled for longer than it would otherwise.=
 Is
> > > > this allowlisting based on simply minimizing the code footprint?
> > > >
> > > From the information I have, it might be just minimizing the footprint
> > > but the vendor's U-Boot configuration for this specific path
> > > explicitly disables the CMD_BOOTEFI option. While the vendor cites
> > > security mitigations for this configuration, the specific details
> > > could be a set of mitigation removing different boot methods and some
> > > memory access commands.
> > >
> > > The core issue is that this non-EFI boot path is the vendor-validated
> > > configuration. Enabling EFI would deviate from this setup, require
> > > significant revalidation, and could impact vendor support. Modifying
> > > U-Boot to populate the DT is a contained change without modifying the
> > > U-boot vendor configuration.
> > >
> >
> > I'm not sure I follow why changing U-Boot's code would not require
> > revalidation if simply changing its build configuration without
> > modifying the source code would require that.
> >
> > > Beyond our specific vendor constraints, this DT method might be used
> > > by any other non-UEFI arm system needing to expose SMBIOS tables to
> > > the kernel.
> > >
> >
> > Fair point. So let's do this properly: get buy-in from the U-Boot
> > folks and contribute your u-boot changes as well. And ideally, we'd
> > get this into the DMTF spec but if you are not set up for that (I
> > think you might need to be a member to be able to contribute), we can
> > find some ARM folks who are.
>=20
> +1
> U-Boot does offer an EFI implementation indeed, but we can't magically
> force people to use it.
> The problem with SMBIOS is that afaict is still widely used by various
> debugging tools, so we might as well support it.
> I agree with Ard here. I think the best thing we can do is
> - Make the node standard in the DT spec, so everyone gets a reference
> - Gatekeep any alternative implementations for the kernel until
> someone gets this into the DMTF spec as well
> - Send a patch to U-Boot that adds that mode dynamically if booting is
> !EFI and SMIOS support is enabled

This sounds like a good plan to me, from the U-Boot side of things.

--=20
Tom

--9oR5kehjwfSOVgAj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaPvAcgAKCRAr4qD1Cr/k
Cl0JAQCUcCV+kUm96vHRiAbLB20hAwcJt3oIn8U3QBbLUjGHMAEA+21ItWi4sJ9d
t7aKVsKPX8WICEe/+i8LMaUG1P0v5AQ=
=ytOr
-----END PGP SIGNATURE-----

--9oR5kehjwfSOVgAj--

