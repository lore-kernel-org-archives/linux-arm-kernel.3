Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366DFCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 22:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORkzaNhzQYND0OJ7hwNxMTACXc6PhBBMRkbKhdMyyXc=; b=qBcyqBW8ytnrXRB2ktGW0uavaD
	IldH+OYpGKaFKLZB5od31jBTeaKHpwLy4umtJ9Fu7w2v1f63H3M2FgvtqT7eh0tEKCCC6LYZQp76c
	0pWGxEtA6o5VxI3g/cB0J3ZQ4KVKdIwc1vudiXpFsI/qW+YyZLUvujp1XJb5SQ4o8uKQALY97ftju
	hDtbKRiVF/itcGXjLN5azgU4KZnbuASqMp32tyl1Zg6WYFrNCfkf32yWejoo9C5vrzvkij8RqA3k9
	P7J76FbDc5Fu+u+VdSCFM4QkTF27S+LKFh0cOTmDQTZAxvVMRuyJcLNsks56o5ldrulnrlRY75GiS
	RzEqND+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMCtN-0000000BmW3-2wOf;
	Sun, 10 May 2026 22:44:57 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMCtL-0000000BmVY-0SXo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 22:44:56 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-441209fb77eso2146267f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 15:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778453093; x=1779057893; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ORkzaNhzQYND0OJ7hwNxMTACXc6PhBBMRkbKhdMyyXc=;
        b=U2u7PwhfqsI2q/e9hpcUybmwyJTvy1gyDKliznPOWfXt0m39LIPZ5Bbhe5nmhT2WZT
         LHZtw5r6vLRzEvsVal9RZwVp/X71QmDSJm3F/mZo4r3hQBxW2WFJaArCVc/RdfNqFvon
         xP+p/u4EouckNbLjw3qbY720/eXZBI9IgJfzhQ5tWI9JuDNrpGsugJAvvPv1oHm4OLwm
         DVwGB9/1Mp0fzcojninoI6tSSEuoxr3YRWow2omOUT2bx9GBwZ+ME7I5vS3Q4Er5deCi
         OduoLXTmtMu6B9wmu+YObXPtBTz7TK7R7O4/3w6ck8FRcWf2XFOTL01r+pUBLQfVOnnv
         CNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778453093; x=1779057893;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ORkzaNhzQYND0OJ7hwNxMTACXc6PhBBMRkbKhdMyyXc=;
        b=hLspeJ3LtnIdMebRspYmtIp1BZWBOYdvS14D9UmpEHZt8kjCgi9FP73rCb8izIlus8
         b1n3Z/FkMotdWVx4ZiYkR2fks8aPtX+12NeiKjOT30m95R3FO7pEKdsVeVnh5DxNc3So
         6QwlzuxDX7toFqsRHh3/9cP+ajUMc6mcAWLTvm82gldg7TAa5c+F4jlb+EFxx+gfz84g
         HCB0IgC8JUSaz4omq4Dzu8UT6FTJd/kqnrBda6BaKFTPUJcu3AhKwnAoT98IxaXpA+Do
         VeePP7xzqvS5oyfl0R6PPD5pwshgcpNyDPQeoDfsNDrJP7Q3FiIX5lGM8Ne5AjIYGvgy
         K1zw==
X-Forwarded-Encrypted: i=1; AFNElJ9rbtjwiiayAPu5dXStaArwDRIelW8vkVkxShJkXZ61Jp0N10K1qNatHVO/Xm1kLhLbu4BvSmPMcto6YROsf9JS@lists.infradead.org
X-Gm-Message-State: AOJu0YwBrzgOfbKLlBgWOFEaS2//09xN4ke3yLpPXWQkVig+ILEtya2J
	S16xggXqzg8wEh0/y+4QjXuY4hB60RzjPyiUKGm/braQTvd1SsPn8IqW
X-Gm-Gg: Acq92OHWMn8tk3Ojid/Yw+LLflA1RZ8a74TkEB9ZACkXL4ndmPZJXMOlpNjSI1+KXR8
	xCZias5htZrYJG8HGPo4kwWPMhKmLh2VsceoAHq6UD2a53nO9mbmAR0FgpRvtm9WIFMoD4/D9WZ
	qLl1WDQYtJM2egK7hmFItvTsqqTK6CJjTa0dHZa0jXXF7y+q62gvzGRf+H7YW4ap5TUC32Ly0p8
	v6GSgVnVPshtvFnOwH7Oi01/p1JsijQjTCyq3l1DBxzvY+b5Hjq5opfqkNPEHcg/qKcKspVxis4
	2HBN68k6ttAWcp3hJusIoHBOJ7SkPnFzcDuprMrNCwE6kHBK4KfjL9tedMhrtJbXSYl5EXt+yh/
	EpTndQFRBMEGFA90nxuvk/OsFTkHiya+L3gilmCEID29Y+OfGmVQbaKU2i9+ijSe5KQWR2W6Bjh
	LmPfXviHJ6dITFGUmJEzwMfE+8oNzrzvv5lZtY51fzP2irsJvtGgF8e0jYYzrLCQsy0x9VQk6S9
	eMRftt4+mix/JlUdoUgS5pNBKoO
X-Received: by 2002:a5d:4573:0:b0:456:3af2:853d with SMTP id ffacd0b85a97d-4563af2887bmr7559734f8f.7.1778453092929;
        Sun, 10 May 2026 15:44:52 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a68ebsm19461175f8f.1.2026.05.10.15.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 15:44:52 -0700 (PDT)
Message-ID: <f024e4d2bcde5f5fc45dfbbc7fee171e6aed8e71.camel@gmail.com>
Subject: Re: [PATCH] arm: boot: ep93xx: don't rely on machine_is_*() for
 removed board files
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Hartley Sweeten
	 <hsweeten@visionengravers.com>, Nikita Shubin <nikita.shubin@maquefel.me>
Date: Mon, 11 May 2026 00:45:04 +0200
In-Reply-To: <20260509223820.50347-1-enelsonmoore@gmail.com>
References: <20260509223820.50347-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_154455_209752_CE18EE92 
X-CRM114-Status: GOOD (  19.67  )
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
>=20
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

I'll pick the patch and send it to Arnd if there will be no objection
during this week.

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

