Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3894CCFA768
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 16:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owyjlUy/SqpiA4dTaFVfFg0dfIcn+U6AM1Ugi8v8PJk=; b=Q7AdH8Cj8UZwSby0rMNDMLv8R9
	J/TJFcvk0lUhlskCero7x6g8Vd9uiNKHuyqog3vLXRnHWjqFU7lZvjJ3+EJp08FMoSMszOkTqxkpa
	Ycg+tAryW+POIwgqgqNH5Bgld5Wrt/2bEJFCD65hl6kfw002aNDpPuxEslwMZoQkARuOeFHA5RxKu
	sjQkbkuv36M4jARsveIzew0IXeB4g6od6KxcAfXnMpEX2HXODFpsmu/GYBVepyO1xckBaWCkf9c3/
	B9KXV8iVnRy7QttZ3/28lGUT1Tr0Ws35DoIyGyuB2CfmYOYpvnIkXohY1maxJ11EeE0BtG7UPNo6b
	5oXiC2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMU2b-00000008ij9-2okZ;
	Fri, 21 Nov 2025 16:31:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMU2Y-00000008iht-40DN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 16:31:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52FB241B29
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 16:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30436C116C6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 16:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763742678;
	bh=cyjFZt5pBXnXq1dohzZ9h4FcHLsal8bFkRJaHhMWMaY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qSU1u2/6ipckE+A/OsHbqAjCI7HauJiSh2s1S29Ie812amaZwjQ3D1uHEsNymui1D
	 WGmrl0EHTPa9Y1RvEF5u0THNmon9mI0hYPxTjjvl6zVdmZg+TDznwbNrL+cEb13ht5
	 GPOWRMw/8ZsekvhZPaMBnQ8+tlQVkoNj9q0tUoG8EQC8/MU45wwKg/1qcKNrNkLDd/
	 PBHk6omD2z2gPyjqDktFAJv9YCWCL8yUEhrPrZfp3hWVqmGnN5sjWnYhCzvFoloFwx
	 OcqRqeIQZLuYAl057xl/eddeQO7fMU/jVtb/7/QjsDeMebFjUwFfoml37ROnHu+nHc
	 BWyArk68dF2SA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so3085914e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 08:31:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX4P6bzhLyTJLAyskzIlBx//GVcY+8+pyN5Ap6XQbGm1MwoxYeqxlhmsLCn80IOu2KIWATzTFqZM7Fj5oSNfkgT@lists.infradead.org
X-Gm-Message-State: AOJu0YzH5bnehmpbxG2JrYpSJ6zpWV7N41+JMuy/tAmgaIVX5wxTfXVr
	+ieMIKOUvME69QfQ4msdVeil2qKu7aN+8XhGAClNwf5HbEPz6/1wHQwYOBaap6IH6x6Cwcm0qsu
	88sgSeque1NseamIT4LVoowmqsTsKaPw=
X-Google-Smtp-Source: AGHT+IHv94YBPiEOZjVBTWao8a3/iUuQL5cnLW52Wc5H+gjJzlYuoPCzdcoJKR5m6QrcIhi6WOqHYr6zv5IgKHaKwNI=
X-Received: by 2002:a05:6512:1391:b0:594:2bd4:c856 with SMTP id
 2adb3069b0e04-596a374965amr995757e87.6.1763742676554; Fri, 21 Nov 2025
 08:31:16 -0800 (PST)
MIME-Version: 1.0
References: <20251121135624.494768-1-tzimmermann@suse.de> <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
 <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
 <199e7538-5b4a-483b-8976-84e4a8a0f2fd@suse.de> <CAMj1kXE+mS1Sm5GaROU0P97J2w1pew0P_To4sKiw8h1iOMuLcg@mail.gmail.com>
 <d080729c-6586-4b9c-b234-470977849d3d@suse.de> <6dff8e7e-c99b-443d-a1d8-22650ca0b595@suse.de>
 <CAMj1kXGpC_162bFL65kQw=7qVP7ezYw77Q76y217dDs8pqHogw@mail.gmail.com> <8d0bc096-e346-462b-a274-f0cc1456eea3@suse.de>
In-Reply-To: <8d0bc096-e346-462b-a274-f0cc1456eea3@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 21 Nov 2025 17:31:05 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFdethf2sb1tm1V4wRW1SyPt-OnCmaAXc5cHNKuLJMXWA@mail.gmail.com>
X-Gm-Features: AWmQ_bn8zhFEK816tkr85kGEYNB_leVhAjJQxQ75BwMURzs3nYpX4WL_zzKYI_Q
Message-ID: <CAMj1kXFdethf2sb1tm1V4wRW1SyPt-OnCmaAXc5cHNKuLJMXWA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251121_083119_032976_76A9ED33 
X-CRM114-Status: GOOD (  27.72  )
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

On Fri, 21 Nov 2025 at 17:26, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 21.11.25 um 17:19 schrieb Ard Biesheuvel:
> > On Fri, 21 Nov 2025 at 17:09, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >>
> >> Am 21.11.25 um 17:08 schrieb Thomas Zimmermann:
> >>> Hi
> >>>
> >>> Am 21.11.25 um 16:56 schrieb Ard Biesheuvel:
> >>>> On Fri, 21 Nov 2025 at 16:53, Thomas Zimmermann <tzimmermann@suse.de>
> >>>> wrote:
> >>>>> Hi
> >>>>>
> >>>>> Am 21.11.25 um 16:16 schrieb Ard Biesheuvel:
> >>>>>> On Fri, 21 Nov 2025 at 16:10, Arnd Bergmann <arnd@arndb.de> wrote:
> >>>>>>> On Fri, Nov 21, 2025, at 14:36, Thomas Zimmermann wrote:
> >>>>>>>> Replace screen_info and edid_info with sysfb_primary_device of type
> >>>>>>>> struct sysfb_display_info. Update all users.
> >>>>>>>>
> >>>>>>>> Sysfb DRM drivers currently fetch the global edid_info directly,
> >>>>>>>> when
> >>>>>>>> they should get that information together with the screen_info
> >>>>>>>> from their
> >>>>>>>> device. Wrapping screen_info and edid_info in
> >>>>>>>> sysfb_primary_display and
> >>>>>>>> passing this to drivers enables this.
> >>>>>>>>
> >>>>>>>> Replacing both with sysfb_primary_display has been motivate by
> >>>>>>>> the EFI
> >>>>>>>> stub. EFI wants to transfer EDID via config table in a single entry.
> >>>>>>>> Using struct sysfb_display_info this will become easily possible.
> >>>>>>>> Hence
> >>>>>>>> accept some churn in architecture code for the long-term
> >>>>>>>> improvements.
> >>>>>>> This all looks good to me,
> >>>>>>>
> >>>>>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
> >>>>> Thanks
> >>>>>
> >>>>>>> It should also bring us one step closer to eventually
> >>>>>>> disconnecting the x86 boot ABI from the kernel-internal
> >>>>>>> sysfb_primary_display.
> >>>>>>>
> >>>>>> Agreed
> >>>>>>
> >>>>>> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> >>>>> Thanks
> >>>>>
> >>>>>> I can take patches 1-2 right away, if that helps during the next
> >>>>>> cycle.
> >>>>>    From my sysfb-focused POV, these patches would ideally all go through
> >>>>> the same tree, say efi or generic arch, or whatever fits best. Most of
> >>>>> the other code is only renames anyway.
> >>>>>
> >>>> I don't mind queueing all of it, but I did get a conflict on
> >>>> drivers/pci/vgaarb.c
> >>> Probably from a78835b86a44 ("PCI/VGA: Select SCREEN_INFO on X86")
> >> https://lore.kernel.org/all/20251013220829.1536292-1-superm1@kernel.org/
> >>
> > Yes, if I merge back -rc2 first, I can apply patches 1-5 onto my
> > efi/next tree. But then I hit
> >
> > Applying: sysfb: Move edid_info into sysfb_primary_display
> > error: sha1 information is lacking or useless (drivers/gpu/drm/sysfb/efidrm.c).
> > error: could not build fake ancestor
> > Patch failed at 0006 sysfb: Move edid_info into sysfb_primary_display
> >
> > If you prefer, you can take the whole lot via the sysfb tree instead,
> > assuming it does not depend on the EDID changes I already queued up?
>
> Sure, I can also add it to the drm-misc tree. ETA in upstream would be
> v6.20-rc1.
>

But does that mean the EDID firmware on non-x86 will have to wait for
6.21? I was trying to avoid making this a 6 month effort.

