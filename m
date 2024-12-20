Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDCCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 23:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJcOXEjSPc6dpKHymNvzZWwKD/BYRO2UQD/I4rsqmTc=; b=Hs3Shi4+toszUBBBju/uODNwE0
	X61/Ff+HwPXHNUR9OfF1sXFiTl/z+Wv+ptz1KFV7843WfwqCfP7YRywpbXLQTjmO1HiQnrpujFPqw
	JFy4/4Cfy2hpy8r3sicjx/rWe9FtrkRE3F2WcGwvWZMxX7En9iRM7i8LYStGbozfWP0lZ5UpO+ZCr
	Fk+VlFRemVC5QFKo43ONDhJkEZLEHBIbtyHIJhc3cOWRJNWxNl/Wg6fendsv+5IE0x+L/gGKfXbJZ
	6qp0V8cIgWU3KmAWj+u8DKYMThviatf0fYShH+4qvoxDBuGrfuK8umw3oGBRICOZvSm7J4yaqtN1Z
	M5RSvJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOmeD-00000006H8t-1uCM;
	Fri, 20 Dec 2024 23:43:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOmcz-00000006GtO-2G6T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 23:41:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F97F5C2C39
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 23:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB448C4CECD
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 23:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734738112;
	bh=cJcOXEjSPc6dpKHymNvzZWwKD/BYRO2UQD/I4rsqmTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KGmn/FkNW+VEAX4ZkEUqSfl/n4aMaG5yjRbP7EfZtlGG+oheZ/9OmW5bMqgATcMkT
	 85UgMhabCLD6rudBM5RIunJiDv/wRHCQro75kpVlgWdCjAB0Jrh6WYP2K6A/9WaWnZ
	 TqipKHSFbZWSe2Jk7xKHymyqzmILp/7M6IXcJdlnZwIh0kRJ2O5y/v/M0vcdBuOx/Z
	 ui9hZ8/+AhdYF1Z7tV3xBwR4pJ3i1iTBat6S24cDpvoaM+r0YwjoJr6WY58tuueP9U
	 KlGu2j+m3stJm1rUtsFOXKbtkgjwnonKp4N2WHJ1XP+gYlGst0AuvFTpLQYs0vA1Xj
	 SWR+40Sq+k0yw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53f757134cdso2559884e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 15:41:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfQhimK3lM6lT3t+G0QPZnYe08MkjDUofqNPKoUAFJZqdgRyKNYx4lNo3kbKwmL2cH5mmuj/k3N+fRiAHA/pQ0@lists.infradead.org
X-Gm-Message-State: AOJu0YzWSYpuK8tkYsAEkJy1oONnE7axfnar2U6Bo3CwjOcwcXs0gRRi
	SJBz79BmmgBW8QVyc4HUfLe3PbbEtod1nMDypOcS5gVEl6Q9EWtZo1GZvk0TUBnTUqrv0tYcYnF
	o893SsvLdK/6WJifzZ0d+98kOn4A=
X-Google-Smtp-Source: AGHT+IGbP56Jewm5+WXo2M6uWU+lz0nw8mPDVd0cXPH3fifCq9JSXtmr0HyfUcHrckEbOnNFzamBbOKO7bjGM70iSzs=
X-Received: by 2002:a05:6512:2399:b0:53e:395c:688e with SMTP id
 2adb3069b0e04-54229524737mr1656488e87.10.1734738111101; Fri, 20 Dec 2024
 15:41:51 -0800 (PST)
MIME-Version: 1.0
References: <20241212081841.2168124-8-ardb+git@google.com> <20241212081841.2168124-14-ardb+git@google.com>
 <b20c861b-865a-4d77-bb22-98c4ba8ead16@gmail.com>
In-Reply-To: <b20c861b-865a-4d77-bb22-98c4ba8ead16@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 21 Dec 2024 00:41:39 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF2qYOgHKKK943jvYgOLcRVMwDuA9PGqDwerzhF83-QEQ@mail.gmail.com>
Message-ID: <CAMj1kXF2qYOgHKKK943jvYgOLcRVMwDuA9PGqDwerzhF83-QEQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64/mm: Drop configurable 48-bit physical
 address space limit
To: Klara Modin <klarasmodin@gmail.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kees Cook <keescook@chromium.org>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_154153_663360_DA81C117 
X-CRM114-Status: GOOD (  24.43  )
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

On Sat, 21 Dec 2024 at 00:39, Klara Modin <klarasmodin@gmail.com> wrote:
>
> Hi,
>
> On 2024-12-12 09:18, Ard Biesheuvel wrote:
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
> >
>
> With this patch (32d053d6f5e92efd82349e7c481cba5a43dc1a22 in
> next-20241220), my Raspberry Pi 3 won't boot unless I set it to use
> 52-bit virtual address space (i.e. neither 39 or 48 work with a 4 KiB
> page size), nothing appears on the serial console. I didn't see anyghing
> suspicious in the kernel log for the 52-bit case but I attached it as I
> don't exactly have much else.
>
> I see that 52 bit physical address space previously depended on either
> 64 KiB pages or 52 bit virtual address space, could that be related?
>
> Please let me know if there's anything else you need.
>

Thanks for the report. This patch has already been dropped from the
arm64 tree, so it should be gone from linux-next once it gets
regenerated.

