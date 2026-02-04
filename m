Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A0AE8B387
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 00:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oh9a9aaVWn01wyjxYE1VETaJ1Nv/ufxouSFBGETYBE=; b=wulu6sG2YErW36/XoyFDAqghH+
	zbKR08XsAc9eo6UB5RG61XAHc77OBKPQbXu1/zXIwbRNGvdIR5wi4FNNFEUXe1YMITsQbuHYseUGf
	kIjOex1A4BIo2c/42tAStwijca5/uPrCob6zHOvqoeCXaOWsNnAF6QTDFp1+C1aH5tRXQjfEiLpuj
	KCuRLkjEVi53RvQoP6VJsS8Q6Sa7SgWQvBoMWzZTrRd4nHbeCYnsJ6ENZAZOknjJmtmsXeKnAwQ89
	NF7c97N7i7pcGrvECubJHDHiZjV0IKhWDIxAkHQ53zyuwEWuPjOu03jP7XKVktBQR79AyxV3Tm/nM
	B3p9DQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQsv-00000007dWb-0DJP;
	Wed, 04 Feb 2026 00:36:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQss-00000007dVi-2jbs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 00:36:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A968A443FC
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 00:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88374C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 00:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770165401;
	bh=6oh9a9aaVWn01wyjxYE1VETaJ1Nv/ufxouSFBGETYBE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Fooo8mrBUX3qIer3yJZh6Dtl00exixnM1eSrGE/Q+6CQW1eP+es7bhU1RKJXUddn+
	 00KMvUAsIu+keXLPaJWMwguDXjbEDu9HSHwUvRB85wnuc4CKpWeaYv1Ku/2ua72UV8
	 i//ekxdhKXaDdZB4OiwXwNwNvKic64/q2uFVaFLrlCz1DN4ZHqVPViTYUGXz/UPTzO
	 4505V+ccnlA+AinzGS5MgENxURUX9gd7EaWPma+cguJkEotJvWJF6mWaGQSrLnGBQf
	 FTuC8GjMfMNfaj6gJsjM8dDsq8ocnSs5xHasKSK48idEbZFWjnusxRf+5/MQd/Nb1u
	 s4cS51qmMjoMQ==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-649655f14daso5773762d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 16:36:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfCg1q2kxjB96BSygkrqd1yu0voq7lDxW9tdcm1MYOBPqxv97ewyA4BlnxP8w68N+MEHfS41tOQlPdyntb+uVI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+EKqp85QlD1RNjfcn81de7mZx4wT0hP7CNOmvilm2PQ78BVIj
	QUHd8Q+34mFDc1dam75bX5s/yenvc6lSDPmoOo3xlNbzOc+FJ0nDJp9cntZ6qIFJY/OKIIvv1Fa
	ua8iOZKhyCWZcr090R+jmmEOu2P+0vgE=
X-Received: by 2002:a05:690e:1186:b0:646:e68a:c886 with SMTP id
 956f58d0204a3-649db32cd4cmr1377986d50.19.1770165400836; Tue, 03 Feb 2026
 16:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20240121203009.9257-1-ansuelsmth@gmail.com> <65d62b60.050a0220.c7b96.614e@mx.google.com>
 <666ad6e0.df0a0220.f8b16.4a5e@mx.google.com> <CACRpkdYJoNRpciyQE_A6dkb8f6Jsy4+qwb4w9K3bss2mkZpp1A@mail.gmail.com>
 <ZmsXdWWidNjXdbSa@shell.armlinux.org.uk> <666b2379.5d0a0220.c7eec.8b6f@mx.google.com>
 <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
 <aYCDOio-YdUJAf2v@shell.armlinux.org.uk> <CA+_ehUx=3Ci2hN0YYkLxBNwOu_NTHFe_ZKkw9TH+bU-4PwTD-A@mail.gmail.com>
 <86v7gf9z92.wl-maz@kernel.org>
In-Reply-To: <86v7gf9z92.wl-maz@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Feb 2026 01:36:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLkgtgi1obmiuon=1XhOmT5cwtsMmBE37-wkzE_W55ZV2Q@mail.gmail.com>
X-Gm-Features: AZwV_QgeMyOQ6biIoMs54GLBwIMMm7jgLKinnqXx5y0qYhl28byJafZOvjz1jYw
Message-ID: <CAD++jLkgtgi1obmiuon=1XhOmT5cwtsMmBE37-wkzE_W55ZV2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: decompressor: support AUTO_ZRELADDR and
 appended DTB
To: Marc Zyngier <maz@kernel.org>
Cc: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Eric DeVolder <eric.devolder@oracle.com>, Nathan Chancellor <nathan@kernel.org>, 
	Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_163642_729642_6DE70E5E 
X-CRM114-Status: GOOD (  16.86  )
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

On Mon, Feb 2, 2026 at 12:11=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:

> If you can boot the kernel, you can also boot a secondary bootloader
> that will do the right thing by exposing a DT. Fixing the boot flow
> should be the priority, rather than adding more band-aids to the
> kernel.

I have used this approach with some Broadcom machines equipped
with the CFE thing they are using. I have that boot U-Boot and
U-boot boots the kernel. Works fine.

However, I think it is a thick requirement to put on hobbyist
contributors to go and write entite boot loaders from scratch,
I think it's a fine requirement to put on Qualcomm or Renesas
paid maintainers.

Another reason would be that appended DTB is in the same
league as the GPIO sysfs despite we GPIO maintainers hate it:
a feature users highly desire because it's easy and convenient
and practical and quick and thus refuse to let us drop. Every time
we try to deprecate it more we get a good beating.

Yours,
Linus Walleij

