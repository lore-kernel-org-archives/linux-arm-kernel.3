Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3317DD1D899
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdxR7v9DL4giaQ0nD6cGSOn8HPdLK+CBHB+mv5p51TE=; b=R5a61xItTbixrGwB6OMqr1IXLS
	e38sIfYdnHFJy1aj7NlGIVMSJ6MijeEh51O7wQmcSPk0TTKBdoml7+uMMU9qDAPKBP/hj4KrU8Eg6
	YTj3dY4TkDZgToMG0zqlPvfogYgxNOxwdKu90oO3kUPhxzAnNcpCQidMkUodzpaGU7kaFeMyxaH2Y
	ep1lAlV2PbeqtdacjN6sgrfJxZm3If4OxW0XuQgWas21LVdxaXA5kHmRwIk5eXy+TilRph9WJJVBV
	Gym+oIQNzmvCCVSTHi102ZSz6BffoFDw1n1DZpp5IwM6zfpgbJ2KOt+6fzRLurMmKUdswS+ADO4l/
	1hkRMCGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5T8-00000007kfE-3cDN;
	Thu, 04 Dec 2025 09:17:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5T6-00000007ken-3V0t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:17:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA161601E2
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Dec 2025 09:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CAFC2BC87
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Dec 2025 09:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764839863;
	bh=bdxR7v9DL4giaQ0nD6cGSOn8HPdLK+CBHB+mv5p51TE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lXMJFlx51rTedas29KHnOrmyDSqkZ9OMYrKSulTiX57PBwHm2eQiqLevCstNDBnVT
	 nCVGTNp7fzETozRNuQAA5mbYmXhdurch8QsIn1ts0SUX0878qPP6F5FVDYrBr3wT9W
	 AkgTKbQXFCzm1WMgZMKHaINZLTSqwLCCAD0dAxU5Kk45tsxO0uZPJvt91vcWn+0bYC
	 C2IgMJeK7my4B4xpP9tsR0pWBNKZ4d4GMAlf00wpJGT2bjit1qFoztrZDlC8sl6QNP
	 7TWkDlYiX/OoujuaVpQfW9eeV92YLP9lkU3JZRQx/bEk4561i1k13l8QYbKxWEI4oz
	 nLySSoiGo2EBQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37e56b0712aso5750681fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 01:17:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLEwIl2r81NXn76WO4WGj5y8jSM8EXS7iUiK3WzecxQvuzc4E1eRQqWckc0n7jcOGkIkImPT5Z7QzhUrbaunNW@lists.infradead.org
X-Gm-Message-State: AOJu0YwfKGXHkiQMLLwHSmFa6zXVNY1axcppFYCN4fugiDu+eNufNve0
	8F3u4dBjBbEeJe6yWXtLFtrY9bu1hzV1X32Nq8VPekz8X37ueEi0UFlI9uM4WXV/GQ9pbrmcG5C
	1IIlR7BH+Hxf4ztMvvXSLPx2N1XCYvH8=
X-Google-Smtp-Source: AGHT+IEepIIomfWFRr0Rx3UmKjb+4HGFPEe9u/4871RbpTRAjdKjp2QqrAmQWNspq2CaP1lGYKWgUBnucw5FQcFMAE4=
X-Received: by 2002:a05:6512:3b0e:b0:55f:4633:7b2 with SMTP id
 2adb3069b0e04-597d3fdddf4mr1972090e87.46.1764839861912; Thu, 04 Dec 2025
 01:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20251126160854.553077-1-tzimmermann@suse.de> <aSe1ZBXa3JBidhem@r1chard>
 <fc4ea259-3389-46e2-b860-972aa8179507@suse.de>
In-Reply-To: <fc4ea259-3389-46e2-b860-972aa8179507@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 4 Dec 2025 10:17:29 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE8Q6FGX5+64gPyW=ExicR4UbnEDeW4ycCsSsD2WtaYJA@mail.gmail.com>
X-Gm-Features: AWmQ_bm9xn92SSdHRbzJXHCDOFUkHMVJIr0kEdVYpgmMwEspup4WiDKMgeR24mo
Message-ID: <CAMj1kXE8Q6FGX5+64gPyW=ExicR4UbnEDeW4ycCsSsD2WtaYJA@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] arch,sysfb,efi: Support EDID on non-x86 EFI systems
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Richard Lyu <richard.lyu@suse.com>, javierm@redhat.com, arnd@arndb.de, 
	helgaas@kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 27 Nov 2025 at 08:43, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 27.11.25 um 03:20 schrieb Richard Lyu:
> > Hi Thomas,
> >
> > I am attempting to test this patch series but encountered merge conflicts when applying it to various trees.
> > Could you please clarify the specific base commit (or branch/tag) this series was generated against?
>
> Thanks for testing.
>
> >
> > When testing on the next branch on commits 7a2ff00 and e41ef37, I hit a conflict on PATCH v3 4/9:
> > patching file drivers/pci/vgaarb.c
> > Hunk #2 FAILED at 557.
> > 1 out of 2 hunks FAILED -- rejects in file drivers/pci/vgaarb.c
> >
> > When testing against 3a86608 (Linux 6.18-rc1), the following conflicts occurred:
> > patching file drivers/gpu/drm/sysfb/efidrm.c
> > Hunk #1 FAILED at 24.
> > 1 out of 2 hunks FAILED -- rejects in file drivers/gpu/drm/sysfb/efidrm.c
> > patching file drivers/gpu/drm/sysfb/vesadrm.c
> > Hunk #1 FAILED at 25.
> > 1 out of 2 hunks FAILED -- rejects in file drivers/gpu/drm/sysfb/vesadrm.c
> >
> > Please let me know the correct base, and I will retest.
>
> It's in the cover letter: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5 The
> commit is in linux-next. The idea is that the EFI tree can pick up the
> changes easily in the next cycle. linux-next seemed like the best
> choice. Best regards Thomas

Thanks. I will queue this up as soon as -rc1 is released.

