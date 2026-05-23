Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC633CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 22:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUiBWlmWfokug/bhDYwI7emM+WOQXoX2pKibgpGhk7Y=; b=RVJJ2zTpxg1Cr15IBFYUV/B5Ym
	VI5o1BJBrAZ+3Z4P1MW0dX1Ds+Mc/PCjoPil2fMsxMG0oFmQrLbgiLPrPZB8Jx0lk+bwsRW1ADC4y
	PDfxmSjhZGMNjA27cdDls3jFHLPjeZcK0SwR7MyQa479/liiS0pK+QhdR2XqTwFVHBqVt2vspHunX
	E/FX8QbQvuk7VxMedytYE2N1O6dc4G+o6AU77FMopf/B7pf7nY43Js5p4xzbXVE7J5G5i5pD21PTf
	SRD9jp3bB/0gZgxU2RZEHMx7USqGpSfuF6JQe4v/fPHOrFatWHxJ27N2YU5OInr0ldtf6ucNbx7eM
	AhOpLPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQuZU-0000000E3oy-12PM;
	Sat, 23 May 2026 22:11:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQuZT-0000000E3on-1k6C
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 22:11:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C66366001A
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 22:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9B81F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 22:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779574310;
	bh=xUiBWlmWfokug/bhDYwI7emM+WOQXoX2pKibgpGhk7Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JffdEPAQK13z1iDLJO+r5ZCjqF2k0SXjmv02OPCDVkdJ8HxPkx3RUkZmYYb/sTjmF
	 xz/UurGTR+Pc+fq2h/JyB68uJ97T1Nsmyg9wUBNV1gVplxKtgpRnsa5Yz1Bwn29rej
	 wT4zbxlLAWbNRhrbFhjovJdzP64lNUoXeBMa5Iuiu2a6ojbLBEDbGBKyVa6FIK5A3H
	 2nMIQIhFrqsdJnTwHArUD5I2uOe1eLDrsSg+CnAI7myGadAHndvK47lknZ/SBQaUgs
	 PcQoQd3R6gz0S2wSriLJCHdNa84anxgt53Lm6xXFawB8K++6r91bFfcvuc4HkztcVy
	 GiZYp43l+MteA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa21fa024cso6063144e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 15:11:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+rJOyq2dL4BEtitBe1SfzFWraytSPIvaDrjOCKEd1OElqRrdhNCRiQeBBUFIh+vwO39hlyt2BzXBfzDpLePJAn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz24E2bVpuGHa++cbRCtOl3cTmKqOZ2HJjb3lrn8F2Rfw546zfp
	UogMsssRrGUmixX2GhrOs3l7EUcjR6ThhbEDJz8KTnpcO+RV0+GS72UxK/dYni7dXFdNkHGmug7
	BBx777904SMIohJPdrGc9j7581im/igs=
X-Received: by 2002:a05:6512:3ca7:b0:5a8:8825:15fc with SMTP id
 2adb3069b0e04-5aa3238ba06mr2955522e87.3.1779574309233; Sat, 23 May 2026
 15:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260522212018.25295-1-kmehltretter@gmail.com>
In-Reply-To: <20260522212018.25295-1-kmehltretter@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 24 May 2026 00:11:36 +0200
X-Gmail-Original-Message-ID: <CAD++jL=jrk4EYo+5mhp1cpy2cfsA966MVmbohWhcZdx_SObD_w@mail.gmail.com>
X-Gm-Features: AVHnY4JVd9LDhBpQKgiZIDi0f5dy-gmldueQmj7HE80mVvbvmmb_60Pm-Q0ZSqk
Message-ID: <CAD++jL=jrk4EYo+5mhp1cpy2cfsA966MVmbohWhcZdx_SObD_w@mail.gmail.com>
Subject: Re: [PATCH] ARM: io: avoid KASAN instrumentation of raw halfword I/O
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Abbott Liu <liuwenliang@huawei.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, May 22, 2026 at 11:20=E2=80=AFPM Karl Mehltretter
<kmehltretter@gmail.com> wrote:

> Commit 421015713b30 ("ARM: 9017/2: Enable KASan for ARM") made KASAN
> instrument ARM C memory accesses. For CPUs before ARMv6, __raw_readw()
> and __raw_writew() are C volatile halfword accesses, so KASAN instruments
> them as normal memory accesses.
>
> That is not valid for MMIO. On the QEMU versatilepb machine with an
> ARM926EJ-S CPU and CONFIG_KASAN=3Dy, PL011 probing traps while registerin=
g
> the UART:
>
>   Unable to handle kernel paging request at virtual address bd23e207
>   PC is at __asan_store2+0x2c/0x9c
>   LR is at pl011_register_port+0x4c/0x19c
>
> Keep the existing volatile halfword access, but move the pre-ARMv6
> definitions into __no_kasan_or_inline functions so raw MMIO halfword
> accesses are not instrumented by KASAN. The ARMv6-and-newer inline
> assembly path is unchanged.
>
> Fixes: 421015713b30 ("ARM: 9017/2: Enable KASan for ARM")
> Cc: stable@vger.kernel.org # v5.11+
> Assisted-by: Codex:gpt-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

That makes sense.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Please put this patch into Russell's patch tracker.

Yours,
Linus Walleij

