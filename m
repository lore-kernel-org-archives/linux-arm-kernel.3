Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E81CFC28B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 15:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Nw5kzDQ9aadF93520L+loYg4Pe3c7ohExj2x9LkHTc=; b=KIfY4kfAbWsIBpccnJBITzrMZ1
	lpI1xjw/jF8jUaR7h3JxoH3t6JVLo73MqrebU53C+uqgXck3jedWRx0ya7IVv7gxjbz3UxtnLsiip
	KnJcChitgQD+kAP5BhFhD6XO3QKSIFRsPw259/U7kuboD0Nmlu0AhgkbKhktn3WPtQ2koio2/fmQu
	b3WRIHFd8vEgibSyn8KUCv5o9Z+3XKvd9JNs3JEHd+E1VA2VyFGls4kgATJCAiate30bWU1MHinfo
	jhWC+izPrKMHFDo0Z6b2Xn7HeIEcw1J6eQ+ljQKPd0PNsjoE2ygfbgCsqsohB8EconiJ5IOHaDklP
	eZy/48Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSsH-00000008bMU-3Lsk;
	Fri, 21 Nov 2025 15:16:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSsE-00000008bLV-2qTl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 15:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 991B743E9D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 15:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B5BC19424
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 15:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763738193;
	bh=4Nw5kzDQ9aadF93520L+loYg4Pe3c7ohExj2x9LkHTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YZZ1uHWX8jA8h3KqeGr5dk5BqSVqo2ZxZUdgIweTw8ldAfF2BlKGbx9hcCetumLYF
	 6Z0Av4erPZ1ceu78hk33NVgzoft53GdBcDHrjLQI208QVTibCUAnQCXJr7dFEKOJzp
	 vgyagzRm0Pw7hrUcJLqFULp4DiiDbA7fgHa7kGVIyYElH9FO0ZKbsfr0lXWeW/Etan
	 9UrtWfJtqyHR0CmqDBUR48vIDrb0Baro3f00cbZ9KAHq7CW2noZ8PM+tJ3/z8URu75
	 6Z9cxuWlBxzHnFoYSYDYrRggRq5Y9axSC4q01vXWPQt8uMMkjzBr553v5fFmpzGmGb
	 +QnmP3qW8lTuw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so3012689e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 07:16:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrMlMOOLzzz72sGVypMdH641Az9/FY25ofZk74JdlVIhUldDBM4P548aTcXIpzpjb7+ab3zqt3khnhnCnOSNj/@lists.infradead.org
X-Gm-Message-State: AOJu0YxkjwmV/SF+EBtXqCwNZs3X8P2mvErxUWuJFgoMTpg5nn6treDc
	AyJ6Dv4mMJs4umuyGKrK/qVUHNdsSEVTCOH/yHVz0U8UQdNglow4SXMwaEbdJHDg4kH7JcS9k0s
	/rf24q9rebvqbdjBLSA2bLzYZi6WrYZY=
X-Google-Smtp-Source: AGHT+IGPowCSKA7rqmBuuVeVvwKvJAgVwSGnoB8Wq+tDig5gUYW9uVP5SF2rLUXJXBy7GBEfdZMPDjZn9AIuPMCXlv4=
X-Received: by 2002:a05:6512:15a6:b0:594:5f1d:d60d with SMTP id
 2adb3069b0e04-596a377e72dmr1012107e87.14.1763738191788; Fri, 21 Nov 2025
 07:16:31 -0800 (PST)
MIME-Version: 1.0
References: <20251121135624.494768-1-tzimmermann@suse.de> <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
In-Reply-To: <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 21 Nov 2025 16:16:20 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
X-Gm-Features: AWmQ_bl_zPBWf1NywIhUPQAGEMUCFj4H1ZabIpySRf4mYN0qS7e_KlhM-cPxo4Y
Message-ID: <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
Subject: Re: [PATCH 0/6] arch,sysfb: Move screen and edid info into single place
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_071634_731231_B1252100 
X-CRM114-Status: GOOD (  16.78  )
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

On Fri, 21 Nov 2025 at 16:10, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Nov 21, 2025, at 14:36, Thomas Zimmermann wrote:
> > Replace screen_info and edid_info with sysfb_primary_device of type
> > struct sysfb_display_info. Update all users.
> >
> > Sysfb DRM drivers currently fetch the global edid_info directly, when
> > they should get that information together with the screen_info from their
> > device. Wrapping screen_info and edid_info in sysfb_primary_display and
> > passing this to drivers enables this.
> >
> > Replacing both with sysfb_primary_display has been motivate by the EFI
> > stub. EFI wants to transfer EDID via config table in a single entry.
> > Using struct sysfb_display_info this will become easily possible. Hence
> > accept some churn in architecture code for the long-term improvements.
>
> This all looks good to me,
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> It should also bring us one step closer to eventually
> disconnecting the x86 boot ABI from the kernel-internal
> sysfb_primary_display.
>

Agreed

Acked-by: Ard Biesheuvel <ardb@kernel.org>

I can take patches 1-2 right away, if that helps during the next cycle.

