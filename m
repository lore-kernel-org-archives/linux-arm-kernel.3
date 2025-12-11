Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4C9D41C36
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaEmQHvGSI2x2gLiYB+bj+2e+ulZAo6jhqvSHW6UxLU=; b=2JUaU9hLRB/HdvNHwHBcaOVzvz
	2elxsnAQJsyKoOAEOHP3v5vI8n1MHh+4SlGpK51Jsd6sBIxUMgJ0XjDOzuPraLCl0jYuqwWeD81Yo
	TYNFFy9CTX9gYBRO3P9OQgzuS6vu7CZ7wwmVfPrAtVoayfXIgDT94uBut6nrDr1xShIGJ/fwF2Fkd
	WRhVfjvREnxuS/Ro2hKdzH3dpim4fZ9stzN0Hy8/KzRSl0OXfBR21zL+lQmij0U08grx0RdmzHMJN
	QpHMYuK8Wfhh8G5oaCapYa92FbCEpcefKwU26APOlwROOW3zmkyWKC2O70+au2cFMthp8qIHikNiL
	uGJKI2XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTglz-0000000Ge3c-07Ti;
	Thu, 11 Dec 2025 13:31:59 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTglw-0000000Ge3C-3hy6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 13:31:57 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-649820b4b3aso131607a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 05:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765459915; x=1766064715; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaEmQHvGSI2x2gLiYB+bj+2e+ulZAo6jhqvSHW6UxLU=;
        b=IOPHQz6bjyM+MWZYKITaI7eXaGnh3VHVwVrLw1Tibj3hLByoEuttPA6bObebCzVlY/
         WhbShldGu6khLm53TNpANU6xTUoEXZ7Hsa/ndNDlP/H854bivhUrjYWMRRVf1nfS30rb
         stebuj4Mwhzrw3asGz42TCDpCZo1FcpplyZEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765459915; x=1766064715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JaEmQHvGSI2x2gLiYB+bj+2e+ulZAo6jhqvSHW6UxLU=;
        b=aCS2JQF4Rk2f8VPA9vGXXuaS5ayOK+qxF9TcsC2ecrQNC1J+s4dJQ8GK0fwHRpzKkN
         8pcEFYrKJ8rD5gFy689hpWz1D4syO98uMKL9SgD+7cn6qkr0hKTuHfAR1hd/rqEWxzvW
         RDD4Ih1TQw9W6eVmjsKXBlmWM1hlzFcpVG5DybJJFz6NHuMqXr37cmgmA1n8fL9Owolj
         4Chulu1NgbUVcLhlerdhIIx0D/i3jUkn85HTtFr7vH+UwD5oVsjHxHOnRdnzgPyaTLQt
         D41s4Zk/UDTyp40sIHGyVFNfGOducD1x3Zp1bwAk4d+RejyIKOJtBloqoWzOIUZ6NMtJ
         LOtg==
X-Forwarded-Encrypted: i=1; AJvYcCWOEzPlPsjscUS1ik+5DoUoZpJbNEhoxhWyKoJO0VlVyKlhwGN1BZzWywbuRKF7e1RFzt/ZGLStKyHOYao8oIS0@lists.infradead.org
X-Gm-Message-State: AOJu0YzBpfy1tWKkJMe3fyM+ap+7GksSzhZBuDz2LxXcka7Ag5nj6FNc
	ZlPQ5/gFBfjs5xDblcps7MxYHlp5nQ3cemnLW7PMkTxqCo/P2NQmbSj014UWfjD4WloxoQZoLXc
	mhCgCxJ8+WhBeDreRU4wB2VcnK2qFcp+NA/pN7uRo
X-Gm-Gg: AY/fxX5FYqfLFTYTRsk4l8xNgXMxcVdc66t/xIrYgRBeH7zykwn30Nmb0o0AUO9wzh9
	g81tupGZl9cPQpYN/ZK6gL7pDr8cSQVIWYG4tjSktAVNY4MMW1T26yQFB/nel6PqQYKPKS20i/K
	fiV2TBpkF2VdVSYLBMRfsaY8XNhkbVEHVHhZKzKvwn6zi1Gl6iit27XjdALTDzJUt1dlpEz8FqB
	UAGi/Ndw51GITcHXFwOkWDhmCaYX+cnAbDsWyjgYXX2SaNz7YvWykV1ObTDWnnAlpkXBQ==
X-Google-Smtp-Source: AGHT+IFaqY7OCdXtwT3KVg3u/conwzCT1yxeCEixjiz94w9/B3FO353YXzCOf6sA/xKAT/ScJz6kIyVHLfEhIOk6pUY=
X-Received: by 2002:a05:6402:144d:b0:640:ca0a:dc1c with SMTP id
 4fb4d7f45d1cf-6496cb6b889mr6159928a12.7.1765459915034; Thu, 11 Dec 2025
 05:31:55 -0800 (PST)
MIME-Version: 1.0
References: <20251119181333.991099-1-sjg@chromium.org> <20251119181333.991099-7-sjg@chromium.org>
 <20251120084201-53a3c98f-6a3c-4116-8635-be67d58fd57b@linutronix.de>
 <CAFLszTjsgkPV_-Si79RY5T_Fxd5+f-b1VbpG11uS3E9Lk4Ofmg@mail.gmail.com>
 <20251126080620-921e6880-cacf-44c5-bd8b-f380fbb8090a@linutronix.de>
 <28e18785-1336-4fbc-9f2b-69aa6bb06375@pengutronix.de> <20251202112039-b03af7ec-ae06-41ab-914b-703940cc98a2@linutronix.de>
In-Reply-To: <20251202112039-b03af7ec-ae06-41ab-914b-703940cc98a2@linutronix.de>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 11 Dec 2025 06:31:43 -0700
X-Gm-Features: AQt7F2qH4HrZCRqWeMpn2CN38Ll3uZiYfTCxiVjKfBmcJrFAqbKfniV1G2JLLk4
Message-ID: <CAFLszTh3sM3AEW2MVvR-3szkEtvgnNMsWUcwH6AgBa+KThNF7w@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] kbuild: Allow adding modules into the FIT ramdisk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	=?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, Chen-Yu Tsai <wenst@chromium.org>, Nicolas Schier <nsc@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Rong Xu <xur@google.com>, 
	Tamir Duberstein <tamird@gmail.com>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_053156_972721_578E63FA 
X-CRM114-Status: GOOD (  44.13  )
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

Hi Thomas,

On Tue, 2 Dec 2025 at 03:31, Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Wed, Nov 26, 2025 at 12:26:49PM +0100, Ahmad Fatoum wrote:
> > On 11/26/25 8:16 AM, Thomas Wei=C3=9Fschuh wrote:
> > > On Tue, Nov 25, 2025 at 02:58:12PM -0700, Simon Glass wrote:
> > >> On Thu, 20 Nov 2025 at 00:49, Thomas Wei=C3=9Fschuh
> > >> <thomas.weissschuh@linutronix.de> wrote:
> > >>>
> > >>> On Wed, Nov 19, 2025 at 11:13:27AM -0700, Simon Glass wrote:
> > >
> > > (...)
> > >
> > >>>>  quiet_cmd_fit =3D FIT     $@
> > >>>>        cmd_fit =3D $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os li=
nux \
> > >>>> -             --name '$(UIMAGE_NAME)' \
> > >>>> +             --name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
> > >>>
> > >>> Remnant of a previous revision?
> > >>
> > >> The flags are there to allow extra options to be passed if needed.
> > >
> > > Are they necessary for the module functionality added here?
> > > If not I'd put them into a dedicated commit.
> > >
> > >>>
> > >>>>               $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
> > >>>>               $(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> > >>>> +             $(if $(FIT_MODULES),--modules @$(objtree)/modules.or=
der) \
> > >>>
> > >>> I am wondering how module dependencies work without the depmod invo=
cation
> > >>> and modules.dep file.
> > >>
> > >> We have a mechanism to place a pre-build initrd with the filesystem,
> > >> etc. into the FIT. But for this particular feature (suggested by Ahm=
ad
> > >> Fatoum) we are just providing the raw modules. Presumably another
> > >> initrd would be needed to provide the startup files?
> > >
> > > modules.dep is more than optional and generic startup files but an in=
tegral
> > > part of a module tree. Without it, any module depending on another mo=
dule's
> > > symbols will fail to load. Also the modules will be unsigned, potenti=
ally
> > > making them unloadable.
> >
> > I'll use the occasion to elaborate a bit on why I thought adding module=
s
> > is a good idea.
> >
> > - You have a system boot from FIT and maybe even a r/o rootfs
> > - You want to boot a different kernel without any userspace changes,
> > e.g. to bisect
> > - Fortunately, you have a build target that generates you a FIT with
> > kernel, enabled device trees and all modules (including deps and such)
> > - In the bootloader[1], you specify that a CPIO with a minimal init[2]
> > that bindmounts /lib/modules in the initramfs over the rootfs modules
> > before pivot_root
> >
> > and that's it, you are running your new kernel with the old rootfs
> > unchanged. I believe this would be really handy, which is why I
> > suggested it.
>
> The idea sounds good.
>
> > > Ahmad's patch does produce a complete and fully
> > > functional module tree by means of 'make headers_install'.
> >
> > I originally thought that we could generate the CPIO normally as part o=
f
> > the kernel build and then we can readily depend on it in the rule that
> > invokes make_fit.py.
>
> That works, but it is not what the patch under discussion does, or did.
>
> > If this proves to be too cumbersome, I think it's already an improvemen=
t
> > if the user can manually run make modules-cpio-pkg and then make
> > image.fit with the initrd specified. A single target would be neater of
> > course, but I didn't intend for this to stall the series.
>
> The single target idea would require 'modules-cpio-pkg' to not be a PHONY
> target anymore but to properly track dependencies. Otherwise the CPIO and=
 FIT
> image will be rebuilt even if no sources change. Proper dependencies are =
always
> better than PHONY targets, but it will be a bit of additional work.
>
> > It can always follow later.
>
> Yep. But for the patch as it is proposed I am still wondering how it will=
 work
> without modules.dep and friends.
>
> (...)

I'm going to send a v7 and perhaps Ahmad can help to refine this.
Unfortunately the modules generation has turned into a significant
detour. We can either drop it, or continue to try to resolve this.

Regards,
SImon

