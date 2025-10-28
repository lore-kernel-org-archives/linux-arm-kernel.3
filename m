Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D328BCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 13:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZC9l6lFWZgxn6KrNr/Vi44bi9l9c4UuTMA6DK2iIJic=; b=vJltD3NL8hj0QbVcrTVraiznod
	ZfeEFK332OUMAIslHJpWELnABjeYvM9KSeBcr0YIXTui8JqR2iWD/9UV80rKJfdW0hSUNqQrxrlgr
	oMLDswwfy+LDrQCFVUmFf7+LYU2s9DzaJY5si8NG1yHzD8uRl6GOacH4yfKmMHLkt1KiYNNP5wbbb
	t76YR/nMWiQ2E6u/NvKL4lP9dp4rVDJuEB9+90dkqt0I5S/gGdnTMIkdmYIwnJDuxE2dZySgG/200
	AuoL9P0aLtAJQ3MfxbsIMmH91ra62XdRnVUMNIyyUOZ6Tnmw+E9mh7rk8YkZLFiYEriwyH78JeKbX
	XmesjT6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDjyk-0000000G10m-2PLX;
	Tue, 28 Oct 2025 13:43:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDjyi-0000000G109-1z3g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 13:43:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02CD143853
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 13:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D788BC4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 13:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761658990;
	bh=RqU8ooxGP3d5BGDqht1wRrVV5zKW2fpWna7YCD6BgNw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XW1JDYO5bhGuvRO+8LaNPWDiMiEqn46XlG5pAHuTYPkkUwBfTHWIAo+yXKtoSVHIS
	 QwxYFYx5WIJJEeB4g3QNRzjXzTfPYrjPG+ZwdI3xBC0Daac07Z4zohSUGonNyodnii
	 /AyQ1SnXero0WO6CulXzUwyYA6ovHLfupI2mwbWbcFKefRYy0zFCHA4sRvLQPw7W6q
	 WovyFEWAD0BLQZ02LNlTlNLYo5R2bsLc+sM8KPQ820jhB/fbIyk8YKnqZ8TMcjebhG
	 sYIERJasZzoYs1nUXRkmota1/ZmbGbMYSx9f4n/KW8tTjClw7rDR5fKA7XKgJd/aC1
	 vfHC9vKfIAtaA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-378d54f657fso5868701fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:43:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4Zb66WKFNFdPCAcIzWZrdU/c5XSYnS//B5srRFG6Ca5EwSxYYsDMcY7BJN6OpEBHZ41ZCZorudQB3Fk1Dx/g9@lists.infradead.org
X-Gm-Message-State: AOJu0YyQrNH+MgWFyt4Vq7JqNwOvqVzKF+6WfzC0J7RwywfQ6AaJrmJL
	G4HsQ9eGUrzPQZ9Hm5qsDxY/+uh2DOsKZY2rvX983Suk0eE/95MBZpop6AGx+/HlZy53H5/qLl6
	CKZYzIp5BmzUFy4ItKFwXeXc4jfy8iwk=
X-Google-Smtp-Source: AGHT+IHkIw26u7F419Pj1lh4qhYibZamlABQDX5PY5n3HBNOILBNvfOulAOIRz2raMKa11mn/73gf+9CSS24BrZo03Y=
X-Received: by 2002:a05:651c:2352:20b0:36e:ca93:62df with SMTP id
 38308e7fff4ca-3790768fa7fmr9485091fa.3.1761658989237; Tue, 28 Oct 2025
 06:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20251023082129.75612-1-maqianga@uniontech.com>
 <CAMj1kXHs3vC4TEWg1ogG=N8Dd5L0rkQ=qAFLWKiAA5yi_He3GA@mail.gmail.com> <10D9A93B0633E6BE+75720e07-b39d-452c-952e-41f8ab6aad94@uniontech.com>
In-Reply-To: <10D9A93B0633E6BE+75720e07-b39d-452c-952e-41f8ab6aad94@uniontech.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 28 Oct 2025 14:42:57 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHQ6WQWfbkMP4JUk=nKwSt7CovY25RC4JA0ZM7vRWu6dA@mail.gmail.com>
X-Gm-Features: AWmQ_bkQl15BrZRzZGKbVV0HuIh0-gITf1_INVKqu5_rHF8PwaNBiut4Akzbt3c
Message-ID: <CAMj1kXHQ6WQWfbkMP4JUk=nKwSt7CovY25RC4JA0ZM7vRWu6dA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM/efi: Remove duplicate permission settings
To: Qiang Ma <maqianga@uniontech.com>
Cc: linux@armlinux.org.uk, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_064312_556298_1F62A5B4 
X-CRM114-Status: GOOD (  19.16  )
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

On Mon, 27 Oct 2025 at 04:46, Qiang Ma <maqianga@uniontech.com> wrote:
>
>
> =E5=9C=A8 2025/10/23 16:30, Ard Biesheuvel =E5=86=99=E9=81=93:
> > On Thu, 23 Oct 2025 at 10:22, Qiang Ma <maqianga@uniontech.com> wrote:
> >> In the efi_virtmap_init(), permission settings have been applied:
> >>
> >> static bool __init efi_virtmap_init(void)
> >> {
> >>          ...
> >>          for_each_efi_memory_desc(md)
> >>                  ...
> >>                  efi_create_mapping(&efi_mm, md);
> >>          ...
> >>          efi_memattr_apply_permissions(&efi_mm, efi_set_mapping_permis=
sions);
> >>          ...
> >> }
> >>
> >> Therefore, there is no need to apply it again in the efi_create_mappin=
g().
> >>
> >> Fixes: 9fc68b717c24 ("ARM/efi: Apply strict permissions for UEFI Runti=
me Services regions")
> >>
> >> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> > No, efi_memattr_apply_permissions() uses the /optional/ memory
> > attributes table, whereas efi_create_mapping() uses the permission
> > attributes in the EFI memory map. The memory attributes table is
> > optional, in which case any RO/XP attributes from the memory map
> > should be used.
> >
> I see.
>
> Then, can it be modified like this?

No

> --- a/arch/arm/kernel/efi.c
> +++ b/arch/arm/kernel/efi.c
> @@ -65,16 +65,13 @@ int __init efi_create_mapping(struct mm_struct *mm,
> efi_memory_desc_t *md)
>                  desc.type =3D MT_MEMORY_RWX_NONCACHED;
>          else if (md->attribute & EFI_MEMORY_WC)
>                  desc.type =3D MT_DEVICE_WC;
> +       else if (md->attribute & (EFI_MEMORY_RO | EFI_MEMORY_XP))

This will be true for RO, XP or RO+XP.

> +               desc.type =3D MT_MEMORY_RO;

This will apply RO permissions even to XP regions, which need to be writabl=
e.

