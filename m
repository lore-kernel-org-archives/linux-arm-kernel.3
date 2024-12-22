Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CCDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 15:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GjqyJMg09DCuYPoAHgqnPAHj4DLiCTnwq4yWavSIlA=; b=cf5cRvej1Qf2TlayZeMlGQTY6x
	NZd1hk2S5PEkZIanx1s3W+2wRYJILCa0uNABs345Di6YuaBgy5qmdluYEhcRmsHNSjxP9iKJ94B7E
	rIC3GOEVhAREhz2jIJI8zLZpJSk7d1oJWjOYDPU9ahjfUAvajdEMd5TZaZJQ0kicwALC6RvezRYy7
	35cl6Tuz3EzLCB08QbEuxVD/cheRhT5hlCDEHUNnpi9U5xTuejw0nDuXonXPq4ArRdxLYCikKIafR
	anTcTl7IBgc+PTVJwSWbiqW1rPq7Ro7jDWGMY4/krGgHQVC5uhCzvmgT6/r8HTC5tcSWvLguTxO0G
	6n+PkdBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPO0R-00000008SRo-04IJ;
	Sun, 22 Dec 2024 15:36:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPNzF-00000008SNB-0VXF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 15:35:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 708BCA406BF
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 15:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA4CC4CEDD
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 15:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734881719;
	bh=9GjqyJMg09DCuYPoAHgqnPAHj4DLiCTnwq4yWavSIlA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LNW03+ZMpvcE0AQBTB3thE14MW0eFCAdRakozESjslppOZQMEd9uDwydvmqf6y8G1
	 Zr4+kOW4eIPiq3aCYbGQKVReHmbgMT36omu393jsyMiLom1CsY+VYbgoPVNxL/iM4w
	 zQDcMYiyo6/BzQ42E8BcodXQlmI7dRUESYRkve6LgIm4+inet2TnLzLYONYwLhWO0l
	 2v/kaCMukFIh6LIOuh7Q8eIPdq6jp0GeepbIxiR8S4rtAJr40FBqLq2gMYHkbYbvXL
	 9lbNkIK4vSdGCppuBKtKyiAIRCa/V9DnG/ZRxI1EPL27UvzmD6IyNjlSvNzrTWzDBi
	 xFk6QNDchoisQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so3589007e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 07:35:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXljVnXJuNmi4AZB//ObXCWZ70PPirXjSmtAXxrp8DqGks4c6NkbsfZWSJo7bxb1lVxZVG6htxR9JkYZ4SLkX3V@lists.infradead.org
X-Gm-Message-State: AOJu0YyJetwLGn6yZgVHaqbPc9Es7yXZ5JUZKv5o6i65U3zGhqqOmfKo
	JNSspBMgUYo+fk+UD+MASHE+eny7PyxYuxyAEH5QhNKjkgYDeSHI/W6zFIb5HRKsbJA1S/u+SPz
	K+rZT+DU3msHi0o6LM1ZMzytNCKU=
X-Google-Smtp-Source: AGHT+IGX0ge+oIG+OVUU9qdGOK5bBf8+T98POZAqy0/yqeJA7FZF28K0qTWuu83caIz3ApeSC9IJtu4UY0yOQ4BjUNY=
X-Received: by 2002:a05:6512:4007:b0:540:5253:966a with SMTP id
 2adb3069b0e04-5422954b39fmr3358159e87.34.1734881717617; Sun, 22 Dec 2024
 07:35:17 -0800 (PST)
MIME-Version: 1.0
References: <20241212081841.2168124-8-ardb+git@google.com> <20241212081841.2168124-14-ardb+git@google.com>
 <bf93c563-f331-43c0-a145-1abf143bd0eb@gmail.com>
In-Reply-To: <bf93c563-f331-43c0-a145-1abf143bd0eb@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 22 Dec 2024 16:35:06 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH8W=o7yqZjL1QHud8sfA5=-aJ9HGO1opPhwihdi_28pw@mail.gmail.com>
Message-ID: <CAMj1kXH8W=o7yqZjL1QHud8sfA5=-aJ9HGO1opPhwihdi_28pw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64/mm: Drop configurable 48-bit physical
 address space limit
To: Nick Chan <towinchenmi@gmail.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kees Cook <keescook@chromium.org>, Quentin Perret <qperret@google.com>, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_073521_363647_B92E9AF2 
X-CRM114-Status: GOOD (  19.60  )
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

On Sun, 22 Dec 2024 at 13:05, Nick Chan <towinchenmi@gmail.com> wrote:
>
> Hi Ard,
>
> On 12/12/2024 16:18, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Currently, the maximum supported physical address space can be
> > configured as either 48 bits or 52 bits. The only remaining difference
> > between these in practice is that the former omits the masking and
> > shifting required to construct TTBR and PTE values, which carry bits #48
> > and higher disjoint from the rest of the physical address.
> >
> > The overhead of performing these additional calculations is negligible,
> > and so there is little reason to retain support for two different
> > configurations, and we can simply support whatever the hardware
> > supports.
>
> I am seeing a boot failure on Apple iPad 7 which uses
> CONFIG_ARM64_16K=y after this change in linux-next as commit
> 32d053d6f5e9, with nothing appearing on serial console with
> earlycon enabled unless I set CONFIG_ARM64_VA_BITS_52=y. Reverting
> this patch makes the kernel work again.
>

Thanks for the report.

This is a known issue and has been fixed already in the arm64 tree a
couple of days ago.

Once linux-next is regenerated, things should start working again.

