Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C732CFC52A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 11:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzcdHab46Q//OS1klFShvUsQLmkHeRBBg8zKfHQy7yM=; b=QB5m+F0g6UOQmfs0VrZQz93o+v
	ojdMI7O+LqM8F+fH/A1FawLGimIKUl/gAjt3ffotlFBQvnJMyNrh3yrZ7d5i3Ir/LPJjS7xnovIHj
	dlH8M94EMdNHuCk4Ou7loXr+fM9ZPMUKbRh0o9ertRkHf8jGhZO+XJNdP5RvpxboEumH9nLT3Ncyb
	WMEwHS8XWxXHwYiZpWuS89oszOUo23LWBlRsBjinjwXEfgX+GRKXeZyCZaOwuh+n9s5abLWoKCgHB
	JvVri4R77rZ4Jg04/styD5Bm8AaXT5fkNIgk4mABiaPibzcFB3kQKWu98PfMqoYgrLY0kmDJTT1U6
	W9GMm0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMm1L-00000009W4Y-3Y1g;
	Sat, 22 Nov 2025 11:43:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMm1I-00000009W3b-2Knf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 11:43:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E176B44044
	for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Nov 2025 11:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C5AC116C6
	for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Nov 2025 11:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763811791;
	bh=p8H88tgM9+gXap9lRijwllIzLZu5llgC1f7xv5nwybk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ipvswz18aqd0/TPfyaDV4JwDv6OLD0cZeJIq8CrXbsMPz1VZwsapYJAtdiVIc37YT
	 P/L0lbDBumBVIGHT+mEZV/7MD9cSmtv3T3DWptmTmc9qxDrBKkyRPXa4Ae8aE0PQUQ
	 HbDVsMpuUKTcGgV/9mxXWCLrCfILdEio7MaZrfnJFLJTlc/yk47dzUsqNJjonEuNfi
	 r7fYLuhO8HnGh2sORE0RhoxErJSvva28uDuBOu5ftFkehUDuNOUqLnkO6/lmnaImM7
	 hcZKmV+aF+35cjIVo76O+EsmfvKSnHRb4a8+jOL/NKN437gxi/5FmsRnI8XRWwG0Y8
	 yt3iC2HpajEig==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-595910c9178so1943196e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Nov 2025 03:43:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUm+hz9kO9N+GgEIrzCJ0FInwQfF98RB3oqPcnwTHcxQwmWvwqAkEfmsSY2TEM5qml5kG6+L1dgYvoX+dg4Rndi@lists.infradead.org
X-Gm-Message-State: AOJu0YzPtj7TAvLSJSmzdEFClY6O5dSXXjKuaiNSv1dHhhrhm814Qfk4
	lRYbQKKk3/nkQ7VEaVtYQbtUgCCP8xLE2D3M2C+GB4r37nKGPCBrQ9feHjrpYg2EZ3uEjiDog1h
	BX3jHI6Sc5j7CqMc91doNV4OalWdMAU4=
X-Google-Smtp-Source: AGHT+IGKRFlgwehxRBm62tvmwTXy609E55PZi7OAqnBZ+de0+tT9jGT1vTKQcXSXNqsiURj9qycDJBw3M2X6JvRwZDY=
X-Received: by 2002:a05:6512:3b27:b0:592:fa8a:810d with SMTP id
 2adb3069b0e04-596a3ea7847mr1884146e87.16.1763811789974; Sat, 22 Nov 2025
 03:43:09 -0800 (PST)
MIME-Version: 1.0
References: <20251121135624.494768-1-tzimmermann@suse.de> <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
 <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
 <199e7538-5b4a-483b-8976-84e4a8a0f2fd@suse.de> <CAMj1kXE+mS1Sm5GaROU0P97J2w1pew0P_To4sKiw8h1iOMuLcg@mail.gmail.com>
 <d080729c-6586-4b9c-b234-470977849d3d@suse.de> <6dff8e7e-c99b-443d-a1d8-22650ca0b595@suse.de>
 <CAMj1kXGpC_162bFL65kQw=7qVP7ezYw77Q76y217dDs8pqHogw@mail.gmail.com>
 <8d0bc096-e346-462b-a274-f0cc1456eea3@suse.de> <CAMj1kXFdethf2sb1tm1V4wRW1SyPt-OnCmaAXc5cHNKuLJMXWA@mail.gmail.com>
 <4c716fd1-c989-4e48-9878-e7312fefc302@suse.de>
In-Reply-To: <4c716fd1-c989-4e48-9878-e7312fefc302@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 22 Nov 2025 12:42:58 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHO12LritnbMXapGBV8QnQOCVopJbaBi2ejMUgZQFGdSg@mail.gmail.com>
X-Gm-Features: AWmQ_blTv2LH7aQFylqJjjKyEMR6uIyXZhGHq7nWzAQ8kC07d8tB-75tF0Nly1A
Message-ID: <CAMj1kXHO12LritnbMXapGBV8QnQOCVopJbaBi2ejMUgZQFGdSg@mail.gmail.com>
Subject: Re: [PATCH 0/6] arch, sysfb: Move screen and edid info into single place
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javierm@redhat.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_034312_632550_D18AB3F1 
X-CRM114-Status: GOOD (  28.58  )
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

On Sat, 22 Nov 2025 at 11:52, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 21.11.25 um 17:31 schrieb Ard Biesheuvel:
> > On Fri, 21 Nov 2025 at 17:26, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >> Hi
> >>
> >> Am 21.11.25 um 17:19 schrieb Ard Biesheuvel:
> >>> On Fri, 21 Nov 2025 at 17:09, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>>>
> >>>> Am 21.11.25 um 17:08 schrieb Thomas Zimmermann:
> >>>>> Hi
> >>>>>
> >>>>> Am 21.11.25 um 16:56 schrieb Ard Biesheuvel:
> >>>>>> On Fri, 21 Nov 2025 at 16:53, Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>> wrote:
> >>>>>>> Hi
> >>>>>>>
> >>>>>>> Am 21.11.25 um 16:16 schrieb Ard Biesheuvel:
> >>>>>>>> On Fri, 21 Nov 2025 at 16:10, Arnd Bergmann <arnd@arndb.de> wrote:
> >>>>>>>>> On Fri, Nov 21, 2025, at 14:36, Thomas Zimmermann wrote:
> >>>>>>>>>> Replace screen_info and edid_info with sysfb_primary_device of type
> >>>>>>>>>> struct sysfb_display_info. Update all users.
> >>>>>>>>>>
> >>>>>>>>>> Sysfb DRM drivers currently fetch the global edid_info directly,
> >>>>>>>>>> when
> >>>>>>>>>> they should get that information together with the screen_info
> >>>>>>>>>> from their
> >>>>>>>>>> device. Wrapping screen_info and edid_info in
> >>>>>>>>>> sysfb_primary_display and
> >>>>>>>>>> passing this to drivers enables this.
> >>>>>>>>>>
> >>>>>>>>>> Replacing both with sysfb_primary_display has been motivate by
> >>>>>>>>>> the EFI
> >>>>>>>>>> stub. EFI wants to transfer EDID via config table in a single entry.
> >>>>>>>>>> Using struct sysfb_display_info this will become easily possible.
> >>>>>>>>>> Hence
> >>>>>>>>>> accept some churn in architecture code for the long-term
> >>>>>>>>>> improvements.
> >>>>>>>>> This all looks good to me,
> >>>>>>>>>
> >>>>>>>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
> >>>>>>> Thanks
> >>>>>>>
> >>>>>>>>> It should also bring us one step closer to eventually
> >>>>>>>>> disconnecting the x86 boot ABI from the kernel-internal
> >>>>>>>>> sysfb_primary_display.
> >>>>>>>>>
> >>>>>>>> Agreed
> >>>>>>>>
> >>>>>>>> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> >>>>>>> Thanks
> >>>>>>>
> >>>>>>>> I can take patches 1-2 right away, if that helps during the next
> >>>>>>>> cycle.
> >>>>>>>     From my sysfb-focused POV, these patches would ideally all go through
> >>>>>>> the same tree, say efi or generic arch, or whatever fits best. Most of
> >>>>>>> the other code is only renames anyway.
> >>>>>>>
> >>>>>> I don't mind queueing all of it, but I did get a conflict on
> >>>>>> drivers/pci/vgaarb.c
> >>>>> Probably from a78835b86a44 ("PCI/VGA: Select SCREEN_INFO on X86")
> >>>> https://lore.kernel.org/all/20251013220829.1536292-1-superm1@kernel.org/
> >>>>
> >>> Yes, if I merge back -rc2 first, I can apply patches 1-5 onto my
> >>> efi/next tree. But then I hit
> >>>
> >>> Applying: sysfb: Move edid_info into sysfb_primary_display
> >>> error: sha1 information is lacking or useless (drivers/gpu/drm/sysfb/efidrm.c).
> >>> error: could not build fake ancestor
> >>> Patch failed at 0006 sysfb: Move edid_info into sysfb_primary_display
> >>>
> >>> If you prefer, you can take the whole lot via the sysfb tree instead,
> >>> assuming it does not depend on the EDID changes I already queued up?
> >> Sure, I can also add it to the drm-misc tree. ETA in upstream would be
> >> v6.20-rc1.
> >>
> > But does that mean the EDID firmware on non-x86 will have to wait for
> > 6.21? I was trying to avoid making this a 6 month effort.
>
> No problem. Then let me rebase onto linux-next and put the existing EDID
> patches for EFI on top. It's mostly acked or reviewed already. Once we
> have it in good shape we can merged it all at once via the linux-efi
> tree. Does that work for you?
>

Sounds good.

