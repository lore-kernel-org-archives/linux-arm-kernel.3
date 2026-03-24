Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D2EF54ADB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imA4hBFgRxEV6K6PxesH3aFI8Gk9es7sFYCGiASF9lc=; b=cy5e5T0DADLy/2v1EdagBdYIQR
	lgHzCrCCa07mubYyV0GAf0H5eUfXl6v5fibaxodGzp+a+BJagszUO+AxBysnlketVdHuuaKgoq2VF
	t6Ii6yCPVIIOiZFxrCqhL1Ri9/jn6rvAtbwdc4rQrj9zrweaZ/S28MlCT/0qYeuKYOX+LxwhxEyo7
	uU0hrehmsKhg/N5bjKNOYcmxoWlM9znNX5hKU8y/MF/BVuxx9MMtHMB/kekqvRk3b/WK5jlmQz/Hl
	ez9sx7T0VCjiDGo41oKqXmIDZZUf2CjAHmO2QCNIK/7Wf/GGL44wKY1w9HkQgKVlgina9AKPLGSjd
	gF6MzQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55DH-00000001yOU-2zyu;
	Tue, 24 Mar 2026 17:06:43 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55DF-00000001yNo-2CBH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 17:06:42 +0000
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-950c41532e1so3016521241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 10:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372000; x=1774976800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imA4hBFgRxEV6K6PxesH3aFI8Gk9es7sFYCGiASF9lc=;
        b=CG2XHbd/9T1pcnfs/HGibkR6t07GK4b2/jguzS2jMxMqbZLSLiesa1IJ7aXg5dUEfo
         HxguWSWj9tV4lrv2ji2/FGxbJEqX+YD95g51zkrTLcxGwoinOKM9ABHfOWrau7j3f7yF
         eG2UoLlGwlC11OoOXmQ9WWQ4iNHBmea/UmSZ8SLrhJsZlwJ5HzOCaJT734HGUzk15BpA
         toSArspZGMJSTaTDjhcO5qUiYJCt1SoYk2EZ3fJk/SpOE9Aatzdf+gUo6ui5x9IhfI7U
         SZaMC8y9WdOV0JQxWHv1gVLRIs9hBeqln+GG9ix24DvMKL1piFCE+9O/zJv4Nba/1dWK
         htJA==
X-Forwarded-Encrypted: i=1; AJvYcCWHitflPqUFU5X1i+DVyydbURip2xYDtJmrT/Zqe0E3q6R+unFnTDqvu/f9TO1t0IwY1Sza2aNH7MQZkNP4WYXk@lists.infradead.org
X-Gm-Message-State: AOJu0YzyOuSoAHeoku0Y2dY+7FMcTecgdPpb9E3PHoFgh46+xlfe5imK
	7+xV86+CXjoIWc66V+a4F0qddgXo9L+eTbCJRMw6/rsEVWkB6s+Y8wzsOe69DsJNEq0=
X-Gm-Gg: ATEYQzxiaR+YeI7dl8bPRSR7WaGhtJYSpwBJHZfhjp/N1nc3yI4dk9OUjdFWfytCtOr
	pRhDtlMxMqW1egjXvIaYPRKYy5M+5B2DHunubQvL2elXekaQTbrLkalFUc8ZL1yOEsQXaaggm4z
	jNu04jqSe6rUU0XcnBO3xHQBUg7xOW9txXcvGbgEeh9KiuwfF/HMuchrv4e8j2Z6ahwqPjvaBgx
	5/+ZitzbdepAn4mtkQJbPNqmdRf3+guZYba62F6UOxgNTVKMRwd9/IddOI8zX1Un9yNEZAActyT
	JHreCihT0M2B0szq1DL7z9mC9NR47XKO50qfitP4owEwoWdqRvDCe4N4HpGUnUSIB9xMl/IPz1i
	EWBna1shP8qhQ/YpkDGk3Am42gKL/q5KRh3h8pKKspiG/8s5fShS2RkXd358uaIBBSQADZD7x1A
	IWiVam/FXx3uxI5BKmxfCitTwB5ws7SUazwiww+arJF2KySDmc5nDukfETEq3t03PlbDPvUfJ09
	Ew=
X-Received: by 2002:a05:6102:9d8:b0:5e5:6eee:8adb with SMTP id ada2fe7eead31-60378fe5955mr362129137.4.1774372000018;
        Tue, 24 Mar 2026 10:06:40 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95199278ecdsm1831132241.13.2026.03.24.10.06.35
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 10:06:36 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5675d609621so4230650e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 10:06:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrDfVrjBYk+YOgMoyEGUjrapMmrI7IJWhp/wRT7JbBOZBSehd0LyHwY1Fu6Kiiffx+oCNqtfQzcM+9C1atJluv@lists.infradead.org
X-Received: by 2002:a05:6122:1da4:b0:56b:5978:22f5 with SMTP id
 71dfb90a1353d-56d220a8b85mr416671e0c.12.1774371994638; Tue, 24 Mar 2026
 10:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com> <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 18:06:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXX16=pih34yehj=3bJkg2H3ivGUj_34JDg31ABheLE5Q@mail.gmail.com>
X-Gm-Features: AQROBzA3vydAXwvxX7mNaSzU55R-3eBg9lznDuFtNbFYtRdYd66gsLQKONTytjo
Message-ID: <CAMuHMdXX16=pih34yehj=3bJkg2H3ivGUj_34JDg31ABheLE5Q@mail.gmail.com>
Subject: Re: [PATCH 05/10] am68k/PCI: Remove unnecessary second application of align
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	linux-kernel@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_100641_564577_D07F4462 
X-CRM114-Status: GOOD (  17.25  )
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

CC gerg

On Tue, 24 Mar 2026 at 17:59, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Aligning res->start by align inside pcibios_align_resource() is
> unnecessary because caller of pcibios_align_resource() is
> __find_resource_space() that aligns res->start with align before
> calling pcibios_align_resource().
>
> Aligning by align in case of IORESOURCE_IO && start & 0x300 cannot ever
> result in changing start either because 0x300 bits would have not
> survived the earlier alignment if align was large enough to have an
> impact.
>
> Thus, remove the duplicated aligning from pcibios_align_resource().
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  arch/m68k/kernel/pcibios.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
> index 1415f6e4e5ce..7e286ee1976b 100644
> --- a/arch/m68k/kernel/pcibios.c
> +++ b/arch/m68k/kernel/pcibios.c
> @@ -36,8 +36,6 @@ resource_size_t pcibios_align_resource(void *data, cons=
t struct resource *res,
>         if ((res->flags & IORESOURCE_IO) && (start & 0x300))
>                 start =3D (start + 0x3ff) & ~0x3ff;
>
> -       start =3D (start + align - 1) & ~(align - 1);
> -
>         return start;
>  }
>
> --
> 2.39.5

