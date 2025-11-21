Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82192CFC28C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 16:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70SZzEkmeWLCa17DsjpZL0wenaZZgkONKSmc3KcPeco=; b=mXIgSzntj+3YyTj7CSeerwa332
	W12I8lTGrL9LCqyaNJE8+u1dVmyZnsRK9tGpmfP6lYLDHKcu4P4lCYajIiKD0FU0Xc1opyNIbMGC9
	3DL1onwZZpDZCfHv41T9/HORXvV72mREZVcbTopsCDBz9Vea95+00C0hvKYEQ1zIeTD3zZjcKTjBc
	c9evJHuyxcGR7qgBMWDdvnczy5uEHvnX6RVn1r+pGs91ktkvDyyXkfJSMsOhxgDkkVfjcfENgvNIL
	eBGzKey3ydAMUILJzx96uOaa+Ctsx9XE0IuSSWuk7uH/HakWiRXetEvfDfqH3AdNnUr7zpTDBR/wR
	F3WlYdVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTrd-00000008hcF-3NXj;
	Fri, 21 Nov 2025 16:20:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTrb-00000008hbS-2K2m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 16:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3020417F2
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 16:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04FCC19424
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 16:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763741998;
	bh=cET4fLR+Sx0tqItmiU0JPHurpZgDU1nqYWJPQ7uvhYs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LVn7sgHiTk6RLTGHtFAYvT5jt8uzinAFRBsJxMA1SfZel1bMIJ1hFT843Hnfd20C6
	 yJGuhMhYYhggX1rZbeXzTJCiyw2JtfyOjPdE+gZyUeZuHTa/3fich29WX1yfpBasMI
	 +pp3yZJV7CyDiEY2ErtONnDXBelFq5fitTil+cntXvg4ftcD+K4w6Y/2+c3n+JqRod
	 RKqEoEU/bqquH5adcQVN11faw3W7KgplzC+Js1wPpvpvsdHqhTqSANFBA4dC1xnUXv
	 TXqyK+KZNpwLWL/7XkONE899kog8Wbxb7wgM3KGd+kdA3ao++oNai2xTACQ3304AlS
	 7mJu7ZkTqBQIg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59577c4c7c1so3028095e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 08:19:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIRjRm0sUYmjXTLGS8iDRXR8JMWwlHrT12JmdbqzdG948f32FxtPY8omX92GKiynWZSmA1ClhWL/cNMs8AMXcs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/s0T8kRs4Ia7e351HuIGLbWLFFumZrNF9jUnKVKZqlUwJup5J
	ndRSEIi1CXdcN53nrgm7YjPoNi/6jQbrGQxLWtwzdWZLle4SbYSQL4IjskyJJiFy6MALgT72DgF
	s3ICxr39/xxSvTsce0BFJGRmvHHbecjU=
X-Google-Smtp-Source: AGHT+IGeSY0QcKkdeUCs++wMYjj72N3cUYU9kW2Fl9IQJ23AXOiUCrIM5BGdicOeoDbtfPEdjzSeYm/zK81S5JjGD00=
X-Received: by 2002:ac2:4e04:0:b0:595:90ce:df8e with SMTP id
 2adb3069b0e04-596a3740821mr1260884e87.5.1763741997082; Fri, 21 Nov 2025
 08:19:57 -0800 (PST)
MIME-Version: 1.0
References: <20251121135624.494768-1-tzimmermann@suse.de> <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
 <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
 <199e7538-5b4a-483b-8976-84e4a8a0f2fd@suse.de> <CAMj1kXE+mS1Sm5GaROU0P97J2w1pew0P_To4sKiw8h1iOMuLcg@mail.gmail.com>
 <d080729c-6586-4b9c-b234-470977849d3d@suse.de> <6dff8e7e-c99b-443d-a1d8-22650ca0b595@suse.de>
In-Reply-To: <6dff8e7e-c99b-443d-a1d8-22650ca0b595@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 21 Nov 2025 17:19:45 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGpC_162bFL65kQw=7qVP7ezYw77Q76y217dDs8pqHogw@mail.gmail.com>
X-Gm-Features: AWmQ_bn-6TfeudJLq0R8hLHr8efLSQaLZUt3gyg8tPWks9v2PmiXguu4ImOLBA0
Message-ID: <CAMj1kXGpC_162bFL65kQw=7qVP7ezYw77Q76y217dDs8pqHogw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251121_081959_653446_6BB1AD61 
X-CRM114-Status: GOOD (  21.26  )
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

On Fri, 21 Nov 2025 at 17:09, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>
>
> Am 21.11.25 um 17:08 schrieb Thomas Zimmermann:
> > Hi
> >
> > Am 21.11.25 um 16:56 schrieb Ard Biesheuvel:
> >> On Fri, 21 Nov 2025 at 16:53, Thomas Zimmermann <tzimmermann@suse.de>
> >> wrote:
> >>> Hi
> >>>
> >>> Am 21.11.25 um 16:16 schrieb Ard Biesheuvel:
> >>>> On Fri, 21 Nov 2025 at 16:10, Arnd Bergmann <arnd@arndb.de> wrote:
> >>>>> On Fri, Nov 21, 2025, at 14:36, Thomas Zimmermann wrote:
> >>>>>> Replace screen_info and edid_info with sysfb_primary_device of type
> >>>>>> struct sysfb_display_info. Update all users.
> >>>>>>
> >>>>>> Sysfb DRM drivers currently fetch the global edid_info directly,
> >>>>>> when
> >>>>>> they should get that information together with the screen_info
> >>>>>> from their
> >>>>>> device. Wrapping screen_info and edid_info in
> >>>>>> sysfb_primary_display and
> >>>>>> passing this to drivers enables this.
> >>>>>>
> >>>>>> Replacing both with sysfb_primary_display has been motivate by
> >>>>>> the EFI
> >>>>>> stub. EFI wants to transfer EDID via config table in a single entry.
> >>>>>> Using struct sysfb_display_info this will become easily possible.
> >>>>>> Hence
> >>>>>> accept some churn in architecture code for the long-term
> >>>>>> improvements.
> >>>>> This all looks good to me,
> >>>>>
> >>>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
> >>> Thanks
> >>>
> >>>>> It should also bring us one step closer to eventually
> >>>>> disconnecting the x86 boot ABI from the kernel-internal
> >>>>> sysfb_primary_display.
> >>>>>
> >>>> Agreed
> >>>>
> >>>> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> >>> Thanks
> >>>
> >>>> I can take patches 1-2 right away, if that helps during the next
> >>>> cycle.
> >>>   From my sysfb-focused POV, these patches would ideally all go through
> >>> the same tree, say efi or generic arch, or whatever fits best. Most of
> >>> the other code is only renames anyway.
> >>>
> >> I don't mind queueing all of it, but I did get a conflict on
> >> drivers/pci/vgaarb.c
> >
> > Probably from a78835b86a44 ("PCI/VGA: Select SCREEN_INFO on X86")
>
> https://lore.kernel.org/all/20251013220829.1536292-1-superm1@kernel.org/
>

Yes, if I merge back -rc2 first, I can apply patches 1-5 onto my
efi/next tree. But then I hit

Applying: sysfb: Move edid_info into sysfb_primary_display
error: sha1 information is lacking or useless (drivers/gpu/drm/sysfb/efidrm.c).
error: could not build fake ancestor
Patch failed at 0006 sysfb: Move edid_info into sysfb_primary_display

If you prefer, you can take the whole lot via the sysfb tree instead,
assuming it does not depend on the EDID changes I already queued up?

