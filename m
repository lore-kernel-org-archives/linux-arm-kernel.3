Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3803FCD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 17:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zv/ru0QR6grpm7KNdBiLatfgWhf7D3FKLR22CUG+sp4=; b=3oc+WX7lPpL8qXhT5/EsqLlRer
	Ql4q9IH1+QkmpYs0xbk+o8KBrEBwwM/l7YijAuMCnwJsCrbT//JNMuJZpt5dUObCDoMlXxDPzvuwJ
	/iQaei9D4AuWXLxmJ/X0CKBvjkqKdcPgCzheMwdfQN9DKGthxp7g4Lj0SeJQfVnUA9Lv5N3bHhsx9
	1rQio6LWyvzkkIFQCbGs14eWt3+2FUHXjybotw1dG5coE8r8gykJb78AY7d0DkBVpSI2hj2OKZ+TO
	TPfZ4cFgdDznNb/CsjpTdmwEAsNJow+JIdkBQJjf5YxGbgDFnuFC+uV0o8bMFoszCUvF3eb3q07YN
	/Gn3oeTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM89D-0000000BHTz-1Ghi;
	Sun, 10 May 2026 17:40:59 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM89B-0000000BHT3-09Ze
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 17:40:58 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so3219804f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 10:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778434854; x=1779039654; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zv/ru0QR6grpm7KNdBiLatfgWhf7D3FKLR22CUG+sp4=;
        b=mp1LnfT9jQQW7rPlj8tD+RxQhUAkYpspCAtJIdHpjXznnncgnj/yYEzmC7+X9RJ60K
         g+dgn1oRpS3ZLFKZ5z5ghXiJaj2K02y/7xV1jmTwaA0i/aCk0PhlDK9ErrQD72i2B3ju
         CFs4lHSx9j3d8KSB2WhkKt94GnUKJ7eOQ4l2ZSyAB9O/sbJOaSJjS3nsuhnHahUquMqu
         XIubpTM7MMf6Dz/itsJAmvafNJzyA0/i4FTwM9q4086Crf9RuXHMwlgX8UiJuHCfRL+c
         53H4+P5/uYcY1qmdWZbprfFgZT3M4PFPupKuC+F822dl7LCokeK53mDK/7rOPkj0cRRi
         JvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778434854; x=1779039654;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zv/ru0QR6grpm7KNdBiLatfgWhf7D3FKLR22CUG+sp4=;
        b=epdGqGF+n40yrNZB5wdrIKam+9WinT7WeWCK09ZetMGUUqQ1yn1DgSsgJLadY/EXV7
         aZcROt7m+IViiRFYG+tdA1x04rj2LrGsGhG0qXGW0ny13wNv4WVLeCF31WYHWQdz4ntq
         babE2jt2lKhMIoizS16uKmoiEt43pICbt4/6qpQFfcA/Rij3g+xkcA1ZhUd6j6KWVKpH
         BhiB5EDt7h32ahShE75XmzLlEhci3gVZEOzj7QiLmG5LuM5wpTkgI8Dx9ce19OeVAQYo
         5ZQNBXg2dyins3ESpgwPNNXdFphLBQClBCtIEjyfdUyGNsh6RF7FbYiSvQQdHFCKFYNb
         83IA==
X-Forwarded-Encrypted: i=1; AFNElJ/VhO5Of+GqbY80AMOi8MYytI9qhrbDlj4KdZS1B2u+KSRUupyWAoEVCjUGR0eiGFReU3SQ6jTugnb3M3D/TpIw@lists.infradead.org
X-Gm-Message-State: AOJu0YwrAWPXL9P9Tg1ZoYEtomphd0UC1zodL8d4j6iPkQXsguriO5TD
	nAlvjhAye35Im3vAt3RKYzRN1ZmbORbUpCt67HaTDDPfuXLmqRoBKpoy
X-Gm-Gg: Acq92OG9EmGG4tBNDgUl1XCxBYt3B9cJX7j7KxgFMfNLcyJ5RvAla9ErcH+sAA0kC5D
	4/14t3wL41Y3lX1PWdsnmqS+Xopie/41VIB50paozFou/jMsMBqEoRyOnQcHhNt46w9qEUyn/Oi
	mO60OGecC3QhvQKHg+ocvLkKllEoim6ByVszp9oNpsEPNf4ulSYnAe8buPoNuiPrT0WqVJLPO5u
	GQmPtSw9QfxDjAcO6aQRl5I38A9n80BOpgqNANPcHNjuyK/fCZKC8aNb1zQk2Ka6gjiV+20JLA4
	3kCYYFYqbv9yjS+unw4/chn66Ob2+wrFZDDu86ewdiI0MPGErQJ6AAJUIYhiLxTp8fzeOCAxeRx
	hcIiG4LPdjxGvZP79GV1uqLyAKCysBlywxOFPVmAlAUySLGs9KlZvFifoewU3EkvbuMx6di7GH6
	55l+kJX/hVYhH9rgRLDz7T0pT83chBIMBAbXJvjSibWO9rUog86/zhI9cBxgMuxi2nfN2eEFMd3
	+0iFec=
X-Received: by 2002:a05:6000:61e:b0:44f:f2d5:a401 with SMTP id ffacd0b85a97d-456a4ac9619mr9575531f8f.37.1778434854250;
        Sun, 10 May 2026 10:40:54 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6c221sm20183334f8f.13.2026.05.10.10.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:40:52 -0700 (PDT)
Message-ID: <26be9a11b5f2a7d196904d9a97306d2aafb9bf1c.camel@gmail.com>
Subject: Re: [PATCH] arm: boot: ep93xx: don't rely on machine_is_*() for
 removed board files
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Hartley Sweeten
	 <hsweeten@visionengravers.com>, Nikita Shubin <nikita.shubin@maquefel.me>
Date: Sun, 10 May 2026 19:40:54 +0200
In-Reply-To: <20260509223820.50347-1-enelsonmoore@gmail.com>
References: <20260509223820.50347-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_104057_104108_ED5E9FCE 
X-CRM114-Status: GOOD (  19.14  )
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

Hi Ethan,

On Sat, 2026-05-09 at 15:38 -0700, Ethan Nelson-Moore wrote:
> Code in misc-ep93xx.h relies on machine_is_*() macros for several
> boards that no longer have legacy board files. They were removed in
> commit e5ef574dda70 ("ARM: ep93xx: delete all boardfiles"). This
> prevents the removal of machine IDs no longer used by the kernel from
> mach-types. To resolve this issue, create local copies of these macros.
> (The checks themselves are still valid because the IDs are still passed
> in by the bootloader on these machines.) Also take the opportunity to
> remove three repeated checks for the same ID.

I most probably miss something, but what is the reason for removing
the machine IDs from the mach-types, especially if they are still used
by the kernel (though only in its decompressor code)?

> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
> =C2=A0arch/arm/boot/compressed/misc-ep93xx.h | 20 ++++++++++++++++----
> =C2=A01 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/compressed/misc-ep93xx.h b/arch/arm/boot/compr=
essed/misc-ep93xx.h
> index 65b4121d1490..b0a1b42aab31 100644
> --- a/arch/arm/boot/compressed/misc-ep93xx.h
> +++ b/arch/arm/boot/compressed/misc-ep93xx.h
> @@ -3,7 +3,22 @@
> =C2=A0 * Copyright (C) 2006 Lennert Buytenhek <buytenh@wantstofly.org>
> =C2=A0 */
> =C2=A0
> -#include <asm/mach-types.h>
> +/*
> + * These machine IDs are no longer used by the kernel since EP93xx was c=
onverted
> + * to DT booting, but they are still passed in by bootloaders, so we use=
 our own
> + * local definitions of the relevant macros.
> + */
> +#define machine_is_bk3()		(__machine_arch_type =3D=3D 1880)
> +#define machine_is_edb9301()		(__machine_arch_type =3D=3D 462)
> +#define machine_is_edb9302a()		(__machine_arch_type =3D=3D 1127)
> +#define machine_is_edb9302()		(__machine_arch_type =3D=3D 538)
> +#define machine_is_edb9307a()		(__machine_arch_type =3D=3D 1128)
> +#define machine_is_edb9307()		(__machine_arch_type =3D=3D 607)
> +#define machine_is_edb9312()		(__machine_arch_type =3D=3D 451)
> +#define machine_is_edb9315a()		(__machine_arch_type =3D=3D 772)
> +#define machine_is_edb9315()		(__machine_arch_type =3D=3D 463)
> +#define machine_is_ts72xx()		(__machine_arch_type =3D=3D 673)
> +#define machine_is_vision_ep9307()	(__machine_arch_type =3D=3D 1578)
> =C2=A0
> =C2=A0static inline unsigned int __raw_readl(unsigned int ptr)
> =C2=A0{
> @@ -60,14 +75,11 @@ static inline void ep93xx_decomp_setup(void)
> =C2=A0	if (machine_is_edb9301() ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 machine_is_edb9302() ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 machine_is_edb9302a() ||
> -	=C2=A0=C2=A0=C2=A0 machine_is_edb9302a() ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 machine_is_edb9307() ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 machine_is_edb9307a() ||
> -	=C2=A0=C2=A0=C2=A0 machine_is_edb9307a() ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 machine_is_edb9312() ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 machine_is_edb9315() ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 machine_is_edb9315a() ||
> -	=C2=A0=C2=A0=C2=A0 machine_is_edb9315a() ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 machine_is_ts72xx() ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 machine_is_bk3() ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 machine_is_vision_ep9307())

--=20
Alexander Sverdlin.

