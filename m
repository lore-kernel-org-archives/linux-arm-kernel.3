Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1280E73159
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKyCweRY/zYJ2E03k3/fXoBmI71V3FKCayjwlKR/TGc=; b=03pS0LXNwnqJaIZC2oBvTBBhrb
	umtXatdEL7iFYolca7FWPzHI2IW+iCx9wShJUF10BRtHyMjEijnMGEPHZifkbm/AP1d1vyCwNd1xG
	yJtTbXiarSNQwFwXJDWkDporAlRDezXEc2gJsAjAwgxOXL2J8vaCXzwOx72vj7sTRKdaimjEvjOBM
	m2GduWjydIFZJJpplvX6d5hgfryPJKEKaanZlJgTUrQL0mxW0JoCgGgXeYyC6miC7LhjtvBxsURha
	WSF/BZHS0DAPh8PNT1n4TJ3PrHffTcwmbh+Vk1B8hhOxmQh2NA0x+ymoez07iOdJwcHVfGBmYl8CU
	SBJHC5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmriY-00000004rz0-40WD;
	Mon, 02 Feb 2026 11:03:42 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmriV-00000004ryW-3sOs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 11:03:41 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-501488a12cbso52875351cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 03:03:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770030218; cv=none;
        d=google.com; s=arc-20240605;
        b=esFJEQHSRxO/xL4SpaqPsbU8J6f45iXmJ3FeBe0MTY2WH1I30dRnuShmX/K3yHXh33
         zWkWuSQwD288Ki56Qi0wBJ7QdL6zCecOlTaFfor8O2F3QPD/md+g2ilMr5QbGBwgGDXR
         k0XqPwYFTzJyZXc0GXaElLdCT6wOS0pvzHAmg7T5WM55NYex8I9Mdg9evSaFnHLnvJce
         qy4n5ZmvVNwPAfBo04BlKc1/AlyZanZAiF1Q+OWlUP9OtqtXxx1m3lJOwBZxvW6zHUKy
         a+vXlxpK1WvYIN5zl6rz7b5jkRqe1uahrubTTZydbh6VxwKqTDlOZWASEhHCI8GbIm0u
         5hnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YKyCweRY/zYJ2E03k3/fXoBmI71V3FKCayjwlKR/TGc=;
        fh=ve2arzt7XiNbpTNNsYFBunrgWK8nQSFZoKR0VZh/MVk=;
        b=WvSFjOwc2KdZl1FVJ4reTGHhaaBPagy+KJpWJX0Ja/8gFE2T81XaYT/lDLiJ1RItnn
         HAxHfD5ewlnyDLtSthHDI9m+M9XDSYsTm4c/X++oXgwkMLGdAQLSwAHLyW7YFjN1zY+Z
         I9s4dVz7NDW52xg9pHrqvGTdO0cUtc6aURC1Vqhq1hCr/fH15aPS/fvudKtZrV1uBRC5
         72MUqx6qRfCXZF0q0yWvlSI6QlPOuvIlbOD4MreESs5txKxYfiTWF3Z46MIU5PE98T6V
         j1KqweixoUu0IeV4XgQQsBUq2To6s+5ko1PACPdtx+y0NLs4N1D2rasvTo+il3O/GneO
         KjKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770030218; x=1770635018; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YKyCweRY/zYJ2E03k3/fXoBmI71V3FKCayjwlKR/TGc=;
        b=SXE/LEx+kA1j6AgSk6A0XxyGgdlD6V1rzzBHY2FQTNdgip0jrNGdhhYmK2mO1o4TC3
         6VUJp0/n65cZlEQUcdp//m6jBjftOrBBigH2w7zo/AYhjAEcsFkSzQk41GFmO87n3hH3
         UHRRVvpbYB/UdMoU4pOZPfhXuryFvTCz9Bz6egAB4pOaDpSRp/T3H3yZwDNjnT4EtJuv
         +1NcMXqCvLP5jIJZ7tyGWmh50Xb+kIyiL0Frr4U5yXt910fkELRlcrVz+EdXRGsPo0OA
         yU9olb+yw9vsCVCtH9i7vRCqy/0Qp/2MM4IZF6v+hLCxWk94E8SlQJiUX8tAZlRuUrQK
         C0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770030218; x=1770635018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKyCweRY/zYJ2E03k3/fXoBmI71V3FKCayjwlKR/TGc=;
        b=vRgFOT7I1ZPKU67gGRcYe+/sx4GxZ5QEdEvWFxYbs2RMBBOTXIKHvoczS1W4SKmBz8
         CLPGr0WBvMhPPKqlZYnRZH4DcmDc2AVP9mkY/1L85SBvNekd6dUwy0b8JFloqZiJeI+O
         ALUEzZEhw6hKDnBTiXJ7WU+N1KIgMYCna+OhOrCi9s5kyM7cYnAiAQpnIhVz1K7ajqzn
         d7iprIbBpm55dOmEolSD9GMQeiyQakBVEXxPp9u01rXilz7zWdFhBp9Uk2u2Yc9lqGO/
         TKW9a4khSLVoZ6wnMaNYvoRxs5v88opPebKeoRq+D4hvTD+CJ3+KPA9bf6PsYj0nK+Ko
         kEDg==
X-Forwarded-Encrypted: i=1; AJvYcCUryy7oNdeAfSmhPtQkzVmxPtX8rSicJLIwRL7SMwEBaSkAml12tx50X/VYL8lPOZTu1bnjr8Z3E3E8yrQahftV@lists.infradead.org
X-Gm-Message-State: AOJu0YzPNCPRUBLT/lZrvWzVclTQHqg2mbmsa0CPNDgD7NB/3b08FbgQ
	DSbWtHN01JxST2l9XwNLVRg2iod1H8vOlUNjGlyfiUWBWJ87FfROc3+4YQzHGPl8iS8GzUsPK4X
	kSuuMzIj92NO5+6Rp+QH3gp1Hy/RMkE8=
X-Gm-Gg: AZuq6aJoM9zyMPgLQp01cTDuNe9OP1vji0FtH3RNJl+790TZON1JuuxYqUljBexC9r8
	OotbQ2S+ospZ1JVVPTk7WPiOSnMsVIq3K6plgerhFfbUr+9AU1WyTL+kjwC1wishaGrebzYT6ky
	uilWJRyuAATryU0xZAD4qwj44/kG37EdLQpjlUh1bPi+nVVAebUqDto6unVYmbLU821tcpXEa8A
	9vqth0M4aal6etz27COdE0b7Vbey5EppuKt/w3NvIyEsalzibIEFn04uqz+gN/tQtWSCJkYGL7n
	3M/exw==
X-Received: by 2002:a05:622a:2d3:b0:4ed:b5d8:a192 with SMTP id
 d75a77b69052e-505d225e1admr144749431cf.38.1770030218237; Mon, 02 Feb 2026
 03:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20240121203009.9257-1-ansuelsmth@gmail.com> <65d62b60.050a0220.c7b96.614e@mx.google.com>
 <666ad6e0.df0a0220.f8b16.4a5e@mx.google.com> <CACRpkdYJoNRpciyQE_A6dkb8f6Jsy4+qwb4w9K3bss2mkZpp1A@mail.gmail.com>
 <ZmsXdWWidNjXdbSa@shell.armlinux.org.uk> <666b2379.5d0a0220.c7eec.8b6f@mx.google.com>
 <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com> <aYCDOio-YdUJAf2v@shell.armlinux.org.uk>
In-Reply-To: <aYCDOio-YdUJAf2v@shell.armlinux.org.uk>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 2 Feb 2026 12:03:24 +0100
X-Gm-Features: AZwV_QiTDDhKlR-DjOL_QYqdYWBnqyRZFFNahQhLt3ETm-DBaSj6eMWp56yABi4
Message-ID: <CA+_ehUx=3Ci2hN0YYkLxBNwOu_NTHFe_ZKkw9TH+bU-4PwTD-A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: decompressor: support AUTO_ZRELADDR and
 appended DTB
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Eric DeVolder <eric.devolder@oracle.com>, Nathan Chancellor <nathan@kernel.org>, 
	Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_030339_981310_07A9B391 
X-CRM114-Status: GOOD (  29.52  )
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

Il giorno lun 2 feb 2026 alle ore 11:58 Russell King (Oracle)
<linux@armlinux.org.uk> ha scritto:
>
> On Mon, Feb 02, 2026 at 11:26:49AM +0100, Geert Uytterhoeven wrote:
> > FTR, I did provide my Tested-by for the first patch in [1].
> > I still have this series in my local tree, which I test regularly on
> > a variety of Renesas ARM32 platforms and on BeagleBone Black.
> >
> > In fact, I had completely forgotten about this series, to the point
> > that I bisected a failure in booting mainline on one of my boards
> > using my current .config to the absence of the first patch ;-)
> > Apparently during the past years, I had modified my .config to make it
> > more generic, and make better use of the DTB (incl. chosen/bootargs),
> > which has a dependency on the first patch...
>
> What I would like to know is why anyone is using appended DTBs in this
> day and age, when surely by now, Arm based boot loaders have realised
> that Arm moved to use device trees ages ago, and the kernel requires
> a DTB in addition to the kernel image itself.
>
> Appended DTB support was only there as a stop-gap for those boot
> loaders that were around before DTB support was added, and have no
> capability of dealing with a separate DTB.
>
> Come on. It's 2026. DTB has been supported on 32-bit ARM for fifteen
> years. Surely everyone's now got modern boot loaders.
>
> If not, it's time to say this: fix the boot loader.
>

The main problem is that sometimes it's not possible to update the bootloader
at all. Either they never provided the source or Uboot is not even used.

And on some device updating the bootloader is risky as you would end up
in a brick. (no way to recover it)

Also other case usually sign the bootloader and permit to load whatever
image you want so also problematic to update the bootloader.

Sadly for these device, it's full of corner situation where the Vendor used
a badly configured SDK and made a single bootloader on it.

For example QCOM Uboot SDK still target ancient 2012 version if I'm not
wrong.

